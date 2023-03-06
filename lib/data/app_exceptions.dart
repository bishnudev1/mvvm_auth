class AppException implements Exception {
  final message;
  final prefix;

  AppException({this.message, this.prefix});

  String toString() {
    return '$prefix$message';
  }
}

class FetchDataException extends AppException{
  FetchDataException([String? message]) : super(message:'Error During Fetching Data' );
}

class BadRequestException extends AppException{
  BadRequestException([String? message]) : super(message:'Sorry, Bad Request' );
}

class UnAuthorizedException extends AppException{
  UnAuthorizedException([String? message]) : super(message:'Sorry, Unauthorized Request' );
}