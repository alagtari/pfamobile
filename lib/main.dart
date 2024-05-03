import 'package:flutter/material.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/core/routes/app_router.dart';
import 'package:mobile/core/injection/injection_container.dart'
    as container;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await container.init();
  runApp(const MyApp());
}

final appRouter = sl<AppRouter>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(),
    );
  }
}
