import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scb_app/constants.dart';
import 'package:scb_app/domain/entity/stock_data.dart';
import 'package:scb_app/ui/component/button/common_button.dart';
import 'package:scb_app/ui/component/misc/slash_divided.dart';
import 'package:scb_app/ui/theme.dart';
import 'package:scb_app/util.dart';

const double exampleValue = 1999111.75;
const double exampleRubleSurp = 139.6;
const double examplePercSurp = 1.99;

List<StockData> exampleStocks = [
  const StockData(
      name: "Nvidia",
      pricePerStock: "123\$",
      price: "45000 ₽",
      change: -0.19,
      imageURL:
          "https://cdn4.iconfinder.com/data/icons/logos-and-brands/512/235_Nvidia_logo-512.png"),
  const StockData(
      name: "Intel",
      pricePerStock: "639\$",
      price: "45000 ₽",
      change: 1.29,
      imageURL:
          "https://i.pinimg.com/originals/17/35/2f/17352fcf0626d3e553839e902fc14f5a.png"),
  const StockData(
      name: "AMD",
      pricePerStock: "129\$",
      price: "45000 ₽",
      change: 1.11,
      imageURL: "https://cdn.iconscout.com/icon/free/png-256/amd-283608.png"),
  const StockData(
      name: "Tinkoff LTD.",
      pricePerStock: "29\$",
      price: "45000 ₽",
      change: -0.19,
      imageURL:
          "https://donate.shlosberg.ru/static/img/banks/tinkoff/tinkoff_logo.jpg"),
];

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchBar(),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Главная",
              style: context.textTheme.headline1,
            ),
            const SizedBox(
              height: 30,
            ),
            const MainCard(),
            const SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CurrencyContainer(
                  buyValue: 60.55,
                  sellValue: 62.55,
                  currencyIcon: '$drawableFolder/us_flag.png',
                ),
                SizedBox(width: 14),
                CurrencyContainer(
                  buyValue: 60.55,
                  sellValue: 62.55,
                  currencyIcon: '$drawableFolder/eu_flag.png',
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            PortfolioSpoiler(
              sum: 47111.9,
              changePercent: 1.99,
              stocks: exampleStocks,
            ),
            const Spacer(),
            CommonButton(onTap: () {}, text: "Открыть новый счёт"),
            const SizedBox(
              height: 30,
            ),
          ],
        ));
  }
}

class PortfolioSpoiler extends StatefulWidget {
  final double sum;

  final double changePercent;

  final List<StockData> stocks;

  const PortfolioSpoiler(
      {super.key,
      required this.sum,
      required this.changePercent,
      required this.stocks});

  @override
  State<StatefulWidget> createState() {
    return _TextSpoilerState();
  }
}

class _TextSpoilerState extends State<PortfolioSpoiler> {
  bool expanded = false;

  final Duration duration = const Duration(milliseconds: 150);

  @override
  Widget build(BuildContext context) {
    return Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        color: context.colorScheme.primaryContainer,
        child: InkWell(
            customBorder:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            onTap: () {
              setState(() {
                expanded = !expanded;
              });
            },
            child: AnimatedSize(
              alignment: Alignment.topCenter,
              duration: duration,
              child: Container(
                padding: EdgeInsets.fromLTRB(23, 15, 23, expanded ? 5 : 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Брокерский счет",
                              style: context.textTheme.headline4,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            SlashDivided(
                              "${widget.sum.toStringAsFixed(2)} ₽",
                              "${widget.changePercent > 0 ? '+' : ''}${widget.changePercent.toStringAsFixed(2)}%",
                              textStyle: context.textTheme.headline4!,
                              isPositive: widget.changePercent > 0,
                              isFirstGray: true,
                            )
                          ],
                        ),
                        const Spacer(),
                        AnimatedRotation(
                            turns: expanded ? 0.5 : 0,
                            duration: duration,
                            child: SvgPicture.asset(
                                "$drawableFolder/ic_arrow_down.svg"))
                      ]),
                      if (expanded) ...[
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 125,
                          child: ListView.builder(
                              itemBuilder: (context, index) {
                                return StockCard(stock: widget.stocks[index]);
                              },
                              itemCount: widget.stocks.length),
                        ),
                      ]
                    ]),
              ),
            )));
  }
}

class StockCard extends StatelessWidget {
  const StockCard({super.key, required this.stock});

  final StockData stock;

  @override
  Widget build(BuildContext context) {
    var upperStyle = TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.lerp(FontWeight.w400, FontWeight.w500, 0.69));
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            CircleAvatar(
                radius: 23,
                backgroundImage: CachedNetworkImageProvider(
                  stock.imageURL,
                )),
            const SizedBox(width: 13),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(stock.name, style: upperStyle),
              const SizedBox(height: 5),
              Text(stock.pricePerStock,
                  style: context.textTheme.bodyText2!
                      .apply(color: context.colorScheme.tertiary))
            ]),
            const Spacer(),
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text(stock.price, style: upperStyle),
              const SizedBox(height: 5),
              Text('${stock.change > 0 ? '+' : ''}${stock.change}%',
                  style: context.textTheme.bodyText2!.apply(
                      color: stock.change >= 0
                          ? context.colorScheme.success
                          : context.colorScheme.error))
            ]),
          ],
        ));
  }
}

class CurrencyContainer extends StatelessWidget {
  final String currencyIcon;
  final double buyValue;
  final double sellValue;
  const CurrencyContainer({
    super.key,
    required this.currencyIcon,
    required this.buyValue,
    required this.sellValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 149,
        padding: const EdgeInsets.fromLTRB(10, 11, 0, 11),
        decoration: BoxDecoration(
            color: const Color(0x20C8C8C8),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(currencyIcon),
            const SizedBox(width: 10),
            SlashDivided(buyValue.toString(), sellValue.toString(),
                fixedColor: Colors.black,
                isPositive: true,
                textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.lerp(
                        FontWeight.w400, FontWeight.w500, 0.69)))
          ],
        ));
  }
}

class MainCard extends ConsumerWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var trVal = exampleValue.truncate();

    return Container(
      padding: const EdgeInsets.fromLTRB(28, 21, 26, 17),
      width: double.infinity,
      height: 192,
      decoration: BoxDecoration(
          color: context.colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(TextSpan(
              text: trVal.toString().spaceSeparateNumbers(),
              style: context.textTheme.headline1,
              children: [
                TextSpan(
                    style: context.textTheme.headline1!
                        .apply(color: context.colorScheme.tertiary),
                    text:
                        ',${((exampleValue - trVal) * 100).truncate().toString()} ₽')
              ])),
          const SizedBox(height: 10),
          Row(children: [
            Container(
              width: 137,
              height: 28,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: context.colorScheme.successContainer,
                  borderRadius: BorderRadius.circular(36)),
              child: Text.rich(TextSpan(
                  text: '+ $exampleRubleSurp ₽',
                  style: context.textTheme.headline4!
                      .apply(color: context.colorScheme.success),
                  children: [
                    TextSpan(
                        text: ' / ',
                        style: context.textTheme.headline4!
                            .apply(color: context.colorScheme.tertiary)),
                    TextSpan(
                        text: '$examplePercSurp %',
                        style: context.textTheme.headline4!
                            .apply(color: context.colorScheme.success))
                  ])),
            ),
            const SizedBox(width: 13),
            Text('за сегодня',
                style: context.textTheme.headline4!
                    .apply(color: context.colorScheme.success))
          ]),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 69,
            decoration: BoxDecoration(
                color: const Color(0x20C8C8C8),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CardRowElement(
                      title: "История",
                      icon: "$drawableFolder/ic_clock.svg",
                      onTap: () {}),
                  CardRowElement(
                      title: "Пополнить",
                      icon: "$drawableFolder/ic_plus_rnd.svg",
                      onTap: () {}),
                  CardRowElement(
                      title: "Анализ",
                      icon: "$drawableFolder/ic_graph.svg",
                      onTap: () {})
                ]),
          )
        ],
      ),
    );
  }
}

class CardRowElement extends StatelessWidget {
  const CardRowElement({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SvgPicture.asset(icon),
          const SizedBox(height: 7),
          Text(title,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight:
                      FontWeight.lerp(FontWeight.w400, FontWeight.w500, 0.61),
                  letterSpacing: -0.055)),
        ]));
  }
}

class SearchBar extends ConsumerWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
        height: 43,
        child: TextField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(0),
            filled: true,
            fillColor: context.colorScheme.primaryContainer,
            hintText: "Поиск",
            hintStyle: context.textTheme.headline4!
                .apply(color: context.colorScheme.secondary),
            prefixIcon: Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 16, 0),
                child: SvgPicture.asset(
                  "$drawableFolder/ic_search.svg",
                  width: 18,
                  height: 18,
                )),
            prefixIconConstraints:
                const BoxConstraints(minWidth: 18, minHeight: 18),
            border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(36))),
          ),
        ));
  }
}
