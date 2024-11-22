import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nft/pages/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      defaultTransition: Transition.fadeIn,
      theme: ThemeData(
        fontFamily: "AvantGardeStd",
        colorScheme: const ColorScheme.light(brightness: Brightness.light),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          toolbarHeight: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.white,
            systemStatusBarContrastEnforced: false,
          ),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 38,
            fontWeight: FontWeight.bold,
            color: Color(
              0xFF262A2F,
            ),
          ),
          bodyMedium: TextStyle(
            color: Color(0x58000000),
          ),
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Colors.black,
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            minimumSize: const WidgetStatePropertyAll(Size.fromHeight(60)),
            backgroundColor: const WidgetStatePropertyAll(
              Color(0xFF303841),
            ),
            foregroundColor: const WidgetStatePropertyAll(Colors.white),
          ),
        ),
      ),
      darkTheme: ThemeData(
        fontFamily: "AvantGardeStd",
        colorScheme: const ColorScheme.dark(brightness: Brightness.dark),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          toolbarHeight: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: Colors.black,
            systemStatusBarContrastEnforced: false,
          ),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 38,
            fontWeight: FontWeight.bold,
            color: Color(0xDDFFFFFF),
          ),
          bodyMedium: TextStyle(
            fontSize: 18,
            color: Color(0x88FFFFFF),
          ),
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Colors.black,
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            minimumSize: const WidgetStatePropertyAll(Size.fromHeight(60)),
            backgroundColor: const WidgetStatePropertyAll(
              Color.fromARGB(100, 255, 255, 255),
            ),
            foregroundColor: const WidgetStatePropertyAll(Colors.white),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}
