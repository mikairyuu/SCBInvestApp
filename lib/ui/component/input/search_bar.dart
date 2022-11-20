import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scb_app/constants.dart';
import 'package:scb_app/util.dart';

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
