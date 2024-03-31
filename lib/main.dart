import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_manage/provider/auth_provider.dart';
import 'package:provider_state_manage/provider/count_provider.dart';
import 'package:provider_state_manage/provider/example_one_provider.dart';
import 'package:provider_state_manage/provider/favourite_provider.dart';
import 'package:provider_state_manage/provider/theme_changer_provider.dart';
import 'package:provider_state_manage/screen/count_example.dart';
import 'package:provider_state_manage/screen/dark_theme.dart';
import 'package:provider_state_manage/screen/example_one.dart';
import 'package:provider_state_manage/screen/favourite/favourite_screen.dart';
import 'package:provider_state_manage/screen/login.dart';
import 'package:provider_state_manage/screen/value_notify_listner.dart';
import 'package:provider_state_manage/stateful_widget_screen.dart';
import 'package:provider_state_manage/why_provider.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    // final themeChanger = Provider.of<ThemeChanger>(context);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider(),),
        ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteItemProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),


        ],

        // yaha Builder jo use kiya he wo sirf thememode manage karne ke liye kiya he
      child: Builder(builder: (BuildContext context) {
        final themeChanger = Provider.of<ThemeChanger>(context);
        return MaterialApp(
      title: 'Flutter Demo',
      themeMode: themeChanger.themeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.yellow,
        primaryColor: Colors.purple,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.pink
        ),
        iconTheme: const IconThemeData(
          color: Colors.green
        )
        ),
      // home: const CountExample(),

      // home: ExampleOneScreen(),

      // home: const FavouriteScreen(),

      // home: const DarkThemeScreen(),

      // home: NotifyListnerScreen(),

      home: const LoginScreen(),
    );
      },)
    );



    // return ChangeNotifierProvider(
    //   create: (_) => CountProvider(),
    //   child: MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //     useMaterial3: true,
    //   ),
    //   // home: const CountExample(),
    //   home: ExampleOneScreen(),
    // ),
    // );



    
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //     useMaterial3: true,
    //   ),
    //   // home: MyHomePage(),
    //   // home: StateFulWidget(),
    //   // home: const WhyProviderScreen(),
    //   home: const CountExample(),
    // );
  }
}


