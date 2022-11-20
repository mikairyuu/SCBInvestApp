import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scb_app/constants.dart';
import 'package:scb_app/ui/theme.dart';
import 'package:scb_app/util.dart';

class ChatPage extends ConsumerWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Чат", style: context.textTheme.headline1),
                    const SizedBox(height: 22),
                    Text("Здравствуйте, Михаил",
                        style: context.textTheme.bodyText0),
                  ],
                )),
            const SizedBox(height: 38),
            const ChatButton(),
          ],
        ));
  }
}

class ChatButton extends StatelessWidget {
  const ChatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: context.colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      child: Row(children: [
        Image.asset(
          '$drawableFolder/app_icon.png',
          width: 50,
          height: 50,
        ),
        const SizedBox(width: 13),
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Чат с поддержкой", style: context.textTheme.headline3),
          const SizedBox(height: 4),
          Text("Здравствуйте, можем помочь вам",
              overflow: TextOverflow.fade,
              style: context.textTheme.bodyText2!
                  .apply(color: const Color(0xFFABA7A7))),
        ])),
      ]),
    );
  }
}
