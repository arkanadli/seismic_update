import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:seismic_update/core/errors/exceptions.dart';
import 'package:seismic_update/core/utils/constants.dart';
import 'package:seismic_update/features/gempa/data/models/gempa_model.dart';

abstract class GempaRemoteDataSource {
  Future<List<GempaModel>> getDataGempa();
}

class GempaRemoteDataSourceImpl extends GempaRemoteDataSource {
  final http.Client _client;

  GempaRemoteDataSourceImpl(this._client);

  @override
  Future<List<GempaModel>> getDataGempa() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedJson =
            jsonDecode(response.body)['Infogempa']['gempa'] as List<dynamic>;

        final List<GempaModel> dataGempa =
            decodedJson.map((e) => GempaModel.fromJson(e)).toList();
        return dataGempa;
      } else {
        throw const ApiException(message: 'Bad Response', statusCode: '400');
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(message: e.toString(), statusCode: '505');
    }
  }
}
