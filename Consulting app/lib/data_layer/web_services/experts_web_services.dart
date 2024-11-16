import 'package:dio/dio.dart';
import '../../constants/strings.dart';
import '../models/field.dart';

class ExpertServices {
  late Dio dio;
  ExpertServices() {
    BaseOptions options = BaseOptions(
      baseUrl: AppStrings.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 10 * 1000, // 10 seconds
      receiveTimeout: 10 * 1000,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllExperts() async {
    try {
      Response response = await dio
          .get('api/expertsGet'); // here tap the end point of the BaseUrl
      print(response.data.toString());
      return response.data;
    } on Exception catch (e) {
      // TODO
      print(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> getExpertsByField() async {
    try {
      Response response = await dio.get(
          'api/getExpertsByFieldId'); // here tap the end point of the BaseUrl
      print(response.data.toString());
      return response.data;
    } on Exception catch (e) {
      // TODO
      print(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> getAllFields() async {
    try {
      Response response = await dio
          .get('api/getAllFields'); // here tap the end point of the BaseUrl
      print(response.data.toString());
      return response.data;
    } on Exception catch (e) {
      // TODO
      print(e.toString());
      return [];
    }
  }
}
