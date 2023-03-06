import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:mvvm/data/app_exceptions.dart';
import 'package:mvvm/data/response/BaseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJSON;

    try {
      final resp =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJSON = returnResponse(resp);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJSON;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJSON;
    try {
      Response resp = await http.post(Uri.parse(url),
          body: data).timeout(Duration(seconds: 10));
      responseJSON = returnResponse(resp);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJSON;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJSON = jsonDecode(response.body);
        return responseJSON;

      case 400:
        throw BadRequestException('No Such Address Found');

      case 500:
        throw UnAuthorizedException('No Valid Details');

      default:
        throw FetchDataException('No Internet Connection and Status Code: ' +
            response.statusCode.toString());
    }
  }
}
