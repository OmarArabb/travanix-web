import 'package:fluttertoast/fluttertoast.dart';
import 'package:travanix/core/styles/colors.dart';

void errorToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    timeInSecForIosWeb: 2,
    webBgColor: '#EB3324',
    textColor: whiteColor,
  );
}
void successToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    timeInSecForIosWeb: 2,
    webBgColor: '#ff7122',
    textColor: whiteColor,
  );
}
