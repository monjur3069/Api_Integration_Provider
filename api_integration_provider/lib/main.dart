import 'package:api_integration_provider/pages/home_page.dart';
import 'package:api_integration_provider/pages/home_page_futureBuilder.dart';
import 'package:api_integration_provider/pages/home_page_streamBuilder.dart';
import 'package:api_integration_provider/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/home_provider_future_builder.dart';
import 'providers/home_provider_streamBuilder.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => HomeProvider()..getAllData(),
    ),
    ChangeNotifierProvider(
      create: (_) => HomeProviderFutureBuilder(),
    ),
    ChangeNotifierProvider(
      create: (_) => HomeProviderStreamBuilder(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  HomePageStreamBuilder(),
    );
  }
}
