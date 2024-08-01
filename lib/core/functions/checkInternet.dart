import 'dart:io';

checkInternet() async {
  try {
    var resault = await InternetAddress.lookup("google.com");
    if (resault.isNotEmpty && resault[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
}
