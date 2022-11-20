import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scb_app/constants.dart';
import 'package:scb_app/ui/component/input/search_bar.dart';
import 'package:scb_app/ui/pages/main/home/home_page.dart';
import 'package:scb_app/ui/pages/main/market/stock_view_page.dart';
import 'package:scb_app/ui/router/main_router.gr.dart';
import 'package:scb_app/ui/theme.dart';
import 'package:scb_app/util.dart';

const filters = ["Акции", "Фьючерсы", "Фонды", "Облигации", "Валюты"];

class MarketPage extends ConsumerWidget {
  const MarketPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
        padding: const EdgeInsets.fromLTRB(23, 35, 23, 0),
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 17),
                    child: SearchBar(),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Рынок",
                    style: context.textTheme.headline1,
                  ),
                  const SizedBox(height: 20),
                  Wrap(spacing: 8, runSpacing: 8, children: [
                    ...filters.map((e) => FilterButton(title: e)),
                  ]),
                  const SizedBox(height: 34),
                  const Padding(
                    padding: EdgeInsets.only(right: 17),
                    child: OverviewCard(),
                  ),
                  const SizedBox(height: 51),
                  Text("Лидеры роста и падения",
                      style: TextStyle(
                          letterSpacing: 0.01,
                          fontSize: 18,
                          fontWeight: FontWeight.lerp(
                              FontWeight.w400, FontWeight.w500, 0.61))),
                ],
              )),
          const SizedBox(height: 23),
          Column(
            children: [
              for (final stock in exampleStocks) ...[
                Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                    decoration: BoxDecoration(
                        color: scbTheme.colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(4)),
                    child: StockCard(tickerVariation: true, stock: stock)),
                const SizedBox(height: 5)
              ],
            ],
          ),
          const SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.only(left: 17),
            child: Text(
              "Рекомендации от Совкомбанк",
              style: TextStyle(
                  letterSpacing: 0.01,
                  fontSize: 18,
                  fontWeight:
                      FontWeight.lerp(FontWeight.w400, FontWeight.w500, 0.61)),
            ),
          ),
          const SizedBox(height: 34),
          const RecommendedStocks(),
          const SizedBox(height: 50)
        ]);
  }
}

class RecommendedStocks extends StatelessWidget {
  const RecommendedStocks({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 21, 33, 34),
      decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: scbTheme.colorScheme.primary),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 40,
            )
          ],
          color: scbTheme.colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ликвидные акции недели",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.01,
            ).apply(color: context.colorScheme.tertiary),
          ),
          const SizedBox(height: 27),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            for (var i = 0; i < 3; i++) ...[
              Expanded(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: exampleStocks[i].imageURL,
                        width: 76,
                        height: 72,
                      ))),
              const SizedBox(width: 10)
            ]
          ])
        ],
      ),
    );
  }
}

class OverviewCard extends StatelessWidget {
  const OverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: context.colorScheme.primaryContainer,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
      child: Column(children: [
        Row(
          children: [
            Image.asset('$drawableFolder/us_flag.png'),
            const SizedBox(
              width: 13,
            ),
            Text(
              "Рынок США сегодня",
              style: TextStyle(
                      fontWeight: FontWeight.lerp(
                          FontWeight.w400, FontWeight.w500, 0.47),
                      fontSize: 14)
                  .apply(color: context.colorScheme.tertiary),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Text(
          "Итоги торгов. Отскок в акциях Tesla motors и Walmart",
          style: TextStyle(
              fontSize: 18,
              fontWeight:
                  FontWeight.lerp(FontWeight.w400, FontWeight.w500, 0.61),
              letterSpacing: 0.01),
        ),
        const SizedBox(height: 19),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            OverviewSlot(title: "NASDAQ", value: "65,77 \$", change: "1,99%"),
            OverviewSlot(title: "Нефть", value: "65,77 \$", change: "- 1,99%"),
            OverviewSlot(title: "Доллар", value: "61,23 ₽", change: "- 1,99%")
          ],
        )
      ]),
    );
  }
}

class OverviewSlot extends StatelessWidget {
  final String title;
  final String value;
  final String change;

  const OverviewSlot(
      {super.key,
      required this.title,
      required this.value,
      required this.change});

  @override
  Widget build(BuildContext context) {
    var isPostive = !change.startsWith("-");
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 13,
              fontWeight:
                  FontWeight.lerp(FontWeight.w600, FontWeight.w700, 0.28)),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: TextStyle(
              fontSize: 13,
              fontWeight:
                  FontWeight.lerp(FontWeight.w500, FontWeight.w600, 0.18)),
        ),
        const SizedBox(height: 6),
        Text(
          isPostive ? '+ $change' : change,
          style:
              const TextStyle(fontSize: 13, fontWeight: FontWeight.w500).apply(
            color: isPostive
                ? context.colorScheme.success
                : context.colorScheme.error,
          ),
        ),
      ],
    );
  }
}

class FilterButton extends ConsumerStatefulWidget {
  final String title;

  const FilterButton({required this.title, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _FilterButtonState();
  }
}

class _FilterButtonState extends ConsumerState<FilterButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: context.colorScheme.primaryContainer,
            border: Border.all(color: const Color(0xFFDDE0DF)),
            borderRadius: BorderRadius.circular(9)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 13),
        child: Text(widget.title, style: context.textTheme.headline4));
  }
}
