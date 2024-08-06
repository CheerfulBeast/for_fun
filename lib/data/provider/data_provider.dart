import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ricky_and_morty_simple_project/data/model/data_model.dart';

class DataProvider {
  final _dio = Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'));

  Future<DataModel> getCharacters() async {
    try {
      final response = await _dio.get('/character');

      return (dataModelFromJson(response.toString()));
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<DataModel> getNewCharacters(DataModel data) async {
    try {
      final response = await _dio.get(data.info.next);
      final DataModel newData;
      Map<String, dynamic> newJson;
      try {
        newData = dataModelFromJson(response.toString());
        newJson = newData.toJson();
        if (newJson.isEmpty) {
          log('newData is null after parsing');
        } else {
          log('newData: ${newData.toJson().toString()}');
        }
      } catch (e) {
        log('Error parsing newData: $e');
        return Future.error('Error parsing newData: $e');
      }

      if (newJson.isNotEmpty) {
        data.info = newData.info;
        data.results.addAll(newData.results);
      } else {
        log('data is empty');
      }
      return data;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
