import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scb_app/constants.dart';
import 'package:scb_app/ui/theme.dart';
import 'package:scb_app/util.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 24, 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Text("Профиль", style: context.textTheme.headline1),
            const Spacer(),
            SvgPicture.asset('$drawableFolder/ic_logout.svg')
          ]),
          const SizedBox(height: 22),
          Text("Здравствуйте, Михаил", style: context.textTheme.bodyText0),
          const SizedBox(height: 43),
          Column(
            children: [
              SettingButton(
                  title: "Игра-тестирование",
                  iconPath: "$drawableFolder/ic_checkmark_fill.svg",
                  onTap: () {},
                  description: "Проверьте себя в тестах по инвестированию"),
              const SizedBox(height: 11),
              SettingButton(
                  title: "Статус инвестора",
                  iconPath: "$drawableFolder/ic_award_fill.svg",
                  onTap: () {},
                  description: "Неквалифицированный"),
              const SizedBox(height: 11),
              SettingButton(
                  title: "Форма W-8BEN",
                  iconPath: "$drawableFolder/ic_note_fill.svg",
                  onTap: () {},
                  description: "Подпишите, чтобы снизить налог"),
            ],
          ),
          const SizedBox(height: 43),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
                color: context.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(4)),
            alignment: Alignment.center,
            child: Text(
              "Здесь скоро что-то будет...",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight:
                      FontWeight.lerp(FontWeight.w400, FontWeight.w500, 0.69)),
            ),
          )
        ]));
  }
}

class SettingButton extends StatelessWidget {
  final String title;
  final String description;
  final String iconPath;
  final VoidCallback onTap;

  const SettingButton(
      {super.key,
      required this.title,
      required this.iconPath,
      required this.onTap,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Material(
        borderRadius: BorderRadius.circular(4),
        color: context.colorScheme.primaryContainer,
        child: InkWell(
            customBorder:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 22),
              child: Row(children: [
                SvgPicture.asset(
                  iconPath,
                ),
                const SizedBox(width: 17),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(title, style: context.textTheme.headline3),
                      const SizedBox(height: 4),
                      Text(description,
                          style: context.textTheme.bodyText1!
                              .apply(color: context.colorScheme.tertiary)),
                    ])),
              ]),
            )));
  }
}
