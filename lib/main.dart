import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mobile/core/common_used/app_prefs.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/core/routes/app_router.dart';
import 'package:mobile/core/injection/injection_container.dart' as container;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/l10n/l10n.dart';
import 'package:mobile/core/injection/injection_container.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await container.init();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  runApp(
    const MyApp(),
  );
}

final appRouter = sl<AppRouter>();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  static const supportedLocales = [
    Locale('fr'),
    Locale('en'),
    Locale('ar'),
  ];

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamSubscription<String>? _languageSubscription;
  late String local;

  @override
  void initState() {
    super.initState();
    local = sl<AppPrefs>().getAppLanguage() ?? "en";
    _languageSubscription = AppPrefs.languageStream.listen((language) {
      setState(() {
        local = language;
      });
    });
    _navigateBasedOnAuth();
  }

  Future<void> _navigateBasedOnAuth() async {
    String? role = sl<AppPrefs>().getRole();
    String? token = sl<AppPrefs>().getToken();
    log(role??"role is null");
    log(token??"token is null");
    if (role != null && token != null) {
      switch (role) {
        case "citizen":
          appRouter.push(const CitizenAppFrame());
        case 'driver':
          appRouter.push(const DriverAppFrame());
        case 'admin':
          appRouter.push(const AdminAppFrame());
        default:
          appRouter.push(const LoginRoute());
      }
    } else {
      appRouter.push(const LoginRoute());
    }

    FlutterNativeSplash.remove();
  }

  @override
  void dispose() {
    _languageSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(),
      locale: Locale(local),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: MyApp.supportedLocales,
    );
  }
}
