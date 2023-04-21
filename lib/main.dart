import 'package:flutter/material.dart';
import 'package:js_onboarding/pages/home_page.dart';
import 'package:js_onboarding/pages/onboarding_page.dart';
import 'package:js_onboarding/providers/onboarding_provider.dart';
import 'package:js_onboarding/utils/preferences.dart';
import 'package:js_onboarding/utils/utils.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = Preferences();
  await preferences.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final preferences = Preferences();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnboardingProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'JS Onboarding',
        theme: CustomTheme.theme,
        initialRoute: preferences.initialPage,
        routes: {
          HomePage.routeName: (_) => HomePage(),
          OnboardingPage.routeName: (_) => OnboardingPage(),
        },
      ),
    );
  }
}
