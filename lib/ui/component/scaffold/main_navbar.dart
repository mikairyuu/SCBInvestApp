import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scb_app/constants.dart';
import 'package:scb_app/util.dart';

class MainNavBar extends ConsumerWidget {
  final int currentIndex;

  const MainNavBar({super.key, required this.onTap, this.currentIndex = 0});

  final void Function(int) onTap;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        decoration: BoxDecoration(
            border:
                Border(top: BorderSide(color: context.colorScheme.outline))),
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            NavBarButton(
              icon: SvgPicture.asset("$drawableFolder/ic_home.svg",
                  width: 50,
                  height: 50,
                  color: currentIndex == 2
                      ? const Color(0xFFAFAFAF)
                      : context.colorScheme.primary),
              onTap: () => onTap(0),
              isActive: false,
            ),
            NavBarButton(
              icon: SvgPicture.asset("$drawableFolder/ic_plus.svg",
                  width: 50,
                  height: 50,
                  color: currentIndex == 1
                      ? const Color(0xFFFFFFFF)
                      : const Color(0xFFAFAFAF)),
              onTap: () => onTap(1),
              isActive: currentIndex == 1,
            ),
            NavBarButton(
              icon: SvgPicture.asset("$drawableFolder/ic_box.svg",
                  width: 50,
                  height: 50,
                  color: currentIndex > 0
                      ? context.colorScheme.primary
                      : const Color(0xFFAFAFAF)),
              onTap: () => onTap(2),
              isActive: false,
            ),
          ]),
        ));
  }
}

class NavBarButton extends StatelessWidget {
  final Widget icon;
  final bool isActive;
  final void Function() onTap;

  const NavBarButton(
      {super.key,
      required this.icon,
      this.isActive = false,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: isActive ? 160 : null,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: isActive
                  ? Theme.of(context).colorScheme.primary
                  : Colors.transparent),
          child: icon,
        ));
  }
}
