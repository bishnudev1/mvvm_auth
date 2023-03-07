import 'package:mvvm/data/app_exceptions.dart';
import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:mvvm/data/network/NetworkApiService.dart';
import 'package:mvvm/res/app_url.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginApiUrl, data);
      return response;
    } catch (e) {
      throw UnAuthorizedException();
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.registerApiUrl, data);
      return response;
    } catch (e) {
      throw UnAuthorizedException();
    }
  }
}
