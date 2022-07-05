import 'package:dio/dio.dart' as dio;

String dioErrorHandler(dio.Response response) {
  final statusCode = response.statusCode;
  final statusMessage = response.statusMessage;

  final String errMsg = 'Requested failed\nStatus Code: $statusCode\nReason Phrase: $statusMessage';
  return errMsg;
}
