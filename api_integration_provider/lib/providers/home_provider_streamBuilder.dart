import 'dart:convert';
import 'package:api_integration_provider/models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';


class HomeProviderStreamBuilder extends ChangeNotifier {
  HomeModel? homeModel;
  bool get hasDataLoaded => homeModel != null;


  Stream<HomeModel> getData() async* {
    final uri = Uri.parse(
        'https://panel.supplyline.network/api/product/search-suggestions/?limit=10&offset=10&search=rice');
    try {
      final response = await get(uri);
      final map = jsonDecode(utf8.decode(response.bodyBytes));

      if (response.statusCode == 200) {
        final homeModel = HomeModel.fromJson(map);
        // notifyListeners();
        yield homeModel;
      } else {
        print(map['message']);
      }
    } catch (error) {
      rethrow;
    }
  }

}
