import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scb_app/ui/router/main_router.gr.dart';
import 'package:scb_app/ui/theme.dart';

void main() {
  runApp(const ProviderScope(child: SCBApp()));
}

final routerProvider = Provider<MainRouter>((ref) => MainRouter());

class SCBApp extends ConsumerStatefulWidget {
  const SCBApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SCBAppState();
  }
}

class _SCBAppState extends ConsumerState {
  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Invest App',
      theme: scbTheme,
      routerDelegate: router.delegate(),
      routeInformationParser: router.defaultRouteParser(),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [Locale('ru', 'RU')],
    );
  }
}
