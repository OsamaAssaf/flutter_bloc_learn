abstract class AppFailure {
  final String message;
  AppFailure({this.message = 'App Failure'});
}

class ServerFailure extends AppFailure {
  ServerFailure({super.message = 'Server Failure'});
}
