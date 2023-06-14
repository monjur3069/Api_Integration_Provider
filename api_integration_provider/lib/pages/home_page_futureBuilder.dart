import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/home_model.dart';
import '../providers/home_provider_future_builder.dart';

class HomePageFutureBuilder extends StatelessWidget {
  HomePageFutureBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeProviderFutureBuilder>(
        builder: (context, provider, _) {
          return Center(
            child: FutureBuilder<HomeModel>(
              future: provider.getData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  return Text(
                      '${snapshot.data!.data!.products!.results![1].productName!}');
                } else {
                  return Text('No data available.');
                }
              },
            ),
          );
        },
      ),
    );
  }
}
