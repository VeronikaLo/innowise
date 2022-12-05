import 'package:internet_connection_checker/internet_connection_checker.dart';

 abstract class NetworkConnection{      // for the info  if user has internet connection or not
    Future<bool> get isConnected;
}


class NetworkConnectionImp implements NetworkConnection {
  final InternetConnectionChecker connectionChecker;

  NetworkConnectionImp(this.connectionChecker);
  
  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;

}