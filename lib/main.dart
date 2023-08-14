import 'package:flutter/material.dart';
import 'package:flutter_news_app/screens/article_screen.dart';
import 'package:flutter_news_app/screens/discover_screen.dart';
import 'package:flutter_news_app/screens/home_screen.dart';
import 'package:flutter_news_app/screens/profile_screen.dart';
import 'package:flutter_news_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const routeName = '/article';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter News App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/splash",
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        SplashScreen.routeName: (context) => const SplashScreen(),
        DiscoverScreen.routeName: (context) => const DiscoverScreen(),
        ArticleScreen.routeName: (context) => const ArticleScreen(),
        ProfileScreen.routeName: (context) => const ProfileScreen(),
        // WebViewScreen.routeName: (context) =>  WebViewScreen(url:url),
      },
    );
  }
}
