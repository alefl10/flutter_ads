import 'package:ads_repo/ads_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ads/counter/counter.dart';
import 'package:flutter_ads/l10n/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({required AdsRepo adsRepo, super.key}) : _adsRepo = adsRepo;

  final AdsRepo _adsRepo;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: RepositoryProvider(
        create: (context) => _adsRepo,
        child: const CounterPage(),
      ),
    );
  }
}
