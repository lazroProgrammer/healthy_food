import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:healthy_food/l10n/l10n.dart';
import 'package:healthy_food/src/Notifiers/settings_notifier.dart';
import 'package:healthy_food/src/UI/pages/home_page.dart';
import 'package:healthy_food/src/UI/theme/light_theme.dart';
import 'package:healthy_food/src/data%20classes/settings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:shared_preferences/shared_preferences.dart';

//TODO: caching json results for some time (json needs shrinking and careful treatement)
//TODO: arabic and french support (kinda done)
//TODO: cache system for photos (experimental) with a time period with repitition count and a limiter***
//TODO: more informations shown in the interface
//TODO: comparator that gives a detailed comparison
//TODO: Settings page enrichement
//TODO: caching options which are:
// Economize Mobile Data: Caches more data to reduce re-downloads (100MB to 200MB).
// Prioritize Storage: Caches only essential data (small size, 10MB to 30MB).
// Default: Balanced approach with moderate cache size (50MB to 100MB).

// TODO: a product tracking feature that you can use to track the products you buy
//  you buy , after that you need to optomize the statistics system for this
//TODO:possibly link the two apps (money management and product management apps)
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  await SettingsData.init();

  OpenFoodAPIConfiguration.userAgent = UserAgent(
    name: 'TestApp',
    version: '1.0.0',
    system: 'Dart',
  );

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ? this one is added to get settings data if it exists,
    // ? else it goes with the default settings
    SettingsData();
    final dark = ref.watch(darkmodeNotifier);
    // final designIndex = ref.watch(appStyleNotifier) - 1;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: (dark)
            ? ThemeData.dark().copyWith(
                appBarTheme: AppBarTheme(
                  backgroundColor: Colors.deepOrange[500],
                  foregroundColor: Colors.white,
                ),
              )
            : lightTheme,
        supportedLocales: L10n.all,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        localeResolutionCallback:
            (Locale? locale, Iterable<Locale> supportedLocales) {
          // Check if the device's locale is supported
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale?.languageCode) {
              return supportedLocale;
            }
          }
          // If the device's locale is not supported, default to English
          return const Locale('en', '');
        },
        // home: (designIndex >= 0)
        //     ? FormalBubblesSearchPage(
        //         designIndex: (dark) ? (2 * designIndex + 1) : (2 * designIndex))
        // : const SafeArea(child: HomePage()));
        home: const HomePage());
  }
}
