
import 'package:http';
import 'package:seismic_update/features/gempa/data/models/gempa_model.dart';

abstract class GempaRemoteDataSource {
  Future<List<GempaModel>> getDataGempa();
} 

class GempaRemoteDataSourceImpl extends GempaRemoteDataSource {
  final 
}