import 'package:flutter/material.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(
    ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider(
        ThemeData.light(),
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: Provider.of<ThemeProvider>(context).getTheme,
    );
  }
}
