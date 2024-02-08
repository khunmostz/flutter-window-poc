import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_window/src/home/data/models/fake_product_model.dart';

final fakeStoreProvider = FutureProvider.autoDispose((ref) async {
  final response = await Dio().get('https://fakestoreapi.com/products');

  var jsonData = jsonEncode((response.data));
  Iterable l = json.decode(jsonData);
  return List<FakeProductModel>.from(
      l.map((e) => FakeProductModel.fromJson(e)));
});
