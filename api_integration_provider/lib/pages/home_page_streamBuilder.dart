import 'package:api_integration_provider/providers/home_provider_streamBuilder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/home_model.dart';

class HomePageStreamBuilder extends StatelessWidget {

  HomePageStreamBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      body: Consumer<HomeProviderStreamBuilder>(
        builder: (context,provider,_){
          return Center(
            child: StreamBuilder<HomeModel>(
              stream: provider.getData(),//can also write homeProvider.getData()
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  return Text('${snapshot.data!.data!.products!.results![1].productName!}');
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
