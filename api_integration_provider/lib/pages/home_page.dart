import 'package:api_integration_provider/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
/*  late HomeProvider provider;
  bool isFirst = true;

  @override
  void didChangeDependencies() async {
    if (isFirst) {
      provider = await Provider.of<HomeProvider>(context);
      provider.getAllData();
      isFirst = false;
    }
    super.didChangeDependencies();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Api Integration with Provider')),),
      body: Consumer<HomeProvider>(
        builder: (context, provider, _) => provider.hasDataLoaded
            ? ListView.builder(
                itemCount: provider.homeModel!.data!.products!.results!.length,
                itemBuilder: (contex, index) => ListTile(
                  leading: Image.network(provider.homeModel!.data!.products!.results![index].image!),
                  title: Text(provider
                      .homeModel!.data!.products!.results![index].productName!),
                ),
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
