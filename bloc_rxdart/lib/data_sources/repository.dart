import 'package:api_lession/data_sources/api_services.dart';
import 'package:api_lession/models/video.dart';

class Repository {
  final ApiServices _apiServices = ApiServices();

  Future<List<Video>> fetchAllVideo() => _apiServices.fetchVideoList();
  



}