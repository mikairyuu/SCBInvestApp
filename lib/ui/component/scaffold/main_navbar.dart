import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scb_app/constants.dart';
import 'package:scb_app/util.dart';

const double iconSize = 17;
const inactiveColor = Color(0xFFAFAFAF);
const activeColor = Color(0xFF424047);

class MainNavBar extends ConsumerWidget {
  final int currentIndex;

  const MainNavBar({super.key, required this.onTap, this.currentIndex = 0});

  final void Function(int) onTap;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: const Color(0xFFF8FAF9),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        NavBarButton(
          labelText: "Портфель",
          icon: SvgPicture.asset("$drawableFolder/ic_suitcase.svg",
              width: iconSize,
              height: iconSize,
              color: currentIndex == 0 ? activeColor : inactiveColor),
          onTap: () => onTap(0),
          isActive: currentIndex == 0,
        ),
        NavBarButton(
          labelText: "Рынок",
          icon: SvgPicture.asset("$drawableFolder/ic_market.svg",
              width: iconSize,
              height: iconSize,
              color: currentIndex == 1 ? activeColor : inactiveColor),
          onTap: () => onTap(1),
          isActive: currentIndex == 1,
        ),
        NavBarButton(
          labelText: "Лента",
          icon: SvgPicture.asset("$drawableFolder/ic_feed.svg",
              width: iconSize,
              height: iconSize,
              color: currentIndex == 2 ? activeColor : inactiveColor),
          onTap: () => onTap(2),
          isActive: currentIndex == 2,
        ),
        NavBarButton(
          labelText: "Поддержка",
          icon: SvgPicture.asset("$drawableFolder/ic_support.svg",
              width: iconSize,
              height: iconSize,
              color: currentIndex == 3 ? activeColor : inactiveColor),
          onTap: () => onTap(3),
          isActive: currentIndex == 3,
        ),
        NavBarButton(
          labelText: "Профиль",
          icon: SvgPicture.asset("$drawableFolder/ic_profile.svg",
              width: iconSize,
              height: iconSize,
              color: currentIndex == 4 ? activeColor : inactiveColor),
          onTap: () => onTap(4),
          isActive: currentIndex == 4,
        ),
      ]),
    );
  }
}

class NavBarButton extends StatelessWidget {
  final Widget icon;
  final bool isActive;
  final void Function() onTap;
  final String labelText;

  const NavBarButton(
      {super.key,
      required this.icon,
      this.isActive = false,
      required this.onTap,
      required this.labelText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.translucent,
        child: Wrap(
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 4,
          children: [
            icon,
            Text(labelText,
                style: context.textTheme.bodyText1!
                    .apply(color: isActive ? Colors.black : inactiveColor))
          ],
        ));
  }
}
