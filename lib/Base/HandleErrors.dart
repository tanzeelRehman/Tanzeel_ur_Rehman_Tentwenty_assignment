import 'package:movie_db/Base/Exceptions.dart';

class HandleErrors {
  void handleError(error) {
    if (error is BadRequestException) {
      var message = error.message;
      print(message);
      //  DialogManager.showErroDialog(description: message);
    } else if (error is FetchDataException) {
      var message = error.message;
      print(message);
      // DialogManager.showErroDialog(description: message);
    } else if (error is ApiNotRespondingException) {
      var desc = error.message;
      print(desc);
      // DialogManager.showErroDialog(
      //     description: desc,
      //     title: 'Request Error',
      //     message: 'Check your internet and try again');
    }
  }
}
