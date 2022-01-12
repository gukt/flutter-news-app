// class BaseController {
//   void handleError(error) {
//     if (error is BadRequestException) {
//       var message = error.message;
//       DialogHelper.showErrorDialog(message);
//     }
//   }
// }

// class BadRequestException implements Exception {}


// https://medium.com/flutter-community/handling-network-calls-like-a-pro-in-flutter-31bd30c86be1

/// BadRequestException
/// FetchDataException
/// ApiNotRespondingException
/// 
/// 业务逻辑错误
/// BizHandlingError
/// ResourceNotFoundException
/// HttpException
/// NetworkException
/// ApiException
/// SocketException
/// FetchDataException
/// dynamic _returnResponse(http.Response response) {
//   switch (response.statusCode) {
//     case 200:
//       var responseJson = json.decode(response.body.toString());
//       print(responseJson);
//       return responseJson;
//     case 400:
//       throw BadRequestException(response.body.toString());
//     case 401:
//     case 403:
//       throw UnauthorisedException(response.body.toString());
//     case 500:
//     default:
//       throw FetchDataException(
//           'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
//   }
  
// }

// https://medium.com/flutter-community/handling-network-calls-like-a-pro-in-flutter-31bd30c86be1
// class AppException implements Exception {
//   final _message;
//   final _prefix;
  
// AppException([this._message, this._prefix]);
  
// String toString() {
//     return "$_prefix$_message";
//   }
// }

// class FetchDataException extends AppException {
//   FetchDataException([String message])
//       : super(message, "Error During Communication: ");
// }

// class BadRequestException extends AppException {
//   BadRequestException([message]) : super(message, "Invalid Request: ");
// }

// class UnauthorisedException extends AppException {
//   UnauthorisedException([message]) : super(message, "Unauthorised: ");
// }

// class InvalidInputException extends AppException {
//   InvalidInputException([String message]) : super(message, "Invalid Input: ");
// }

