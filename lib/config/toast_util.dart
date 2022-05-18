import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {
  static showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.CENTER,
      toastLength: Toast.LENGTH_LONG,
      fontSize: 16.0,
    );
  }
}