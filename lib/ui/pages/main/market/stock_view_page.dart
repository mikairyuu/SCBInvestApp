import 'dart:async';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:scb_app/constants.dart';
import 'package:scb_app/domain/entity/stock_data.dart';
import 'package:scb_app/ui/component/button/common_button.dart';
import 'package:scb_app/ui/component/misc/slash_divided.dart';
import 'package:scb_app/ui/pages/main/home/home_page.dart';
import 'package:scb_app/util.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

final stockDataProvider = StateProvider.autoDispose(
    (ref) => generateGraphData(ref.read(randomProvider)));
final randomProvider = Provider((ref) => Random());

class StockViewPage extends ConsumerStatefulWidget {
  final StockData stock;

  const StockViewPage({super.key, required this.stock});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _StockViewPageState();
  }
}

class _StockViewPageState extends ConsumerState<StockViewPage> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 2), (Timer t) {
      var random = ref.read(randomProvider);
      var state = ref.read(stockDataProvider);
      ref.read(stockDataProvider.notifier).state = [
        StockDataPoint(
            DateTime.now(),
            state[0].value +
                (random.nextBool() ? 1 : -1) * (random.nextDouble())),
        ...state
      ];
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
          const SizedBox(
            height: 35,
          ),
          GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => context.router.navigateBack(),
              child: Row(
                children: [
                  const SizedBox(width: 25),
                  SvgPicture.asset('$drawableFolder/ic_arrow_back.svg'),
                  const SizedBox(width: 20),
                  Text(widget.stock.name, style: context.textTheme.headline1),
                ],
              )),
          const SizedBox(height: 34),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 29),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(widget.stock.pricePerStock,
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.lerp(
                          FontWeight.w500, FontWeight.w600, 0.43))),
              const SizedBox(height: 6),
              SlashDivided('${widget.stock.change > 0 ? '+' : '-'} 11\$',
                  '${widget.stock.change.abs()}%',
                  isPositive: widget.stock.change > 0,
                  textStyle: context.textTheme.headline4!),
            ]),
          ),
          const SizedBox(height: 43),
          const StockGraph(),
          const ActionButtons(),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 34),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Похожие активы",
                    style: context.textTheme.headline1!
                        .apply(color: const Color(0xFF424047))),
                const SizedBox(height: 40),
                for (var stock in exampleStocks) ...[
                  StockCard(
                    stock: stock,
                    tickerVariation: true,
                  ),
                  const SizedBox(height: 21)
                ],
              ],
            ),
          )
        ]))));
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 34),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonButton(
                  onTap: () {},
                  text: "Продать",
                  color: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                ),
                const SizedBox(width: 8),
                CommonButton(
                  onTap: () {},
                  text: "Купить",
                  padding: const EdgeInsets.symmetric(horizontal: 55),
                ),
              ],
            ),
            const SizedBox(
              height: 22,
            ),
            CommonButton(
                onTap: () {},
                text: "История сделок",
                color: Colors.white,
                textColor: const Color(0xFF424047),
                border: const BorderSide(color: Color(0xFF424047), width: 0.7)),
          ],
        ));
  }
}

class StockGraph extends ConsumerWidget {
  const StockGraph({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var data = ref.watch(stockDataProvider);
    return SfCartesianChart(
      crosshairBehavior: CrosshairBehavior(
          enable: true,
          activationMode: ActivationMode.singleTap,
          shouldAlwaysShow: true,
          lineType: CrosshairLineType.both),
      primaryXAxis: DateTimeAxis(dateFormat: DateFormat.Hms()),
      primaryYAxis: NumericAxis(),
      series: <ChartSeries>[
        // Renders line chart
        LineSeries<StockDataPoint, DateTime>(
            dataSource: data,
            xValueMapper: (StockDataPoint data, _) => data.date,
            yValueMapper: (StockDataPoint data, _) => data.value)
      ],
    );
  }
}

List<StockDataPoint> generateGraphData(Random random) {
  final List<StockDataPoint> data = [];
  var init = random.nextDouble() * 300;
  for (int i = 0; i < 100; i++) {
    init = init + ((random.nextBool() ? 1 : -1) * random.nextDouble());
    data.add(StockDataPoint(
        DateTime.now().subtract(Duration(seconds: i)), init.toDouble()));
  }
  return data;
}

class StockDataPoint {
  final DateTime date;
  final double value;

  StockDataPoint(this.date, this.value);
}
