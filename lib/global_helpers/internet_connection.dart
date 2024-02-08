import 'dart:io';

class InternetConnection {

  static bool hasInternet = false;
  static Future<void> checkInternet()async{
    try{
      var result = await InternetAddress.lookup("google.com");
      if(result.isNotEmpty && result[0].rawAddress.isNotEmpty){
        hasInternet = true;
      }
    } on SocketException catch(_){
      hasInternet = false;
    }
  }
}