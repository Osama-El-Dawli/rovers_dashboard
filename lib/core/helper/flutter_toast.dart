import 'package:fluttertoast/fluttertoast.dart';
import 'package:rovers_dashboard/core/utils/app_colors.dart';

Future<bool?> showToast({required String message}) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: AppColors.primary,
    textColor: AppColors.primaryForeground,
    fontSize: 16.0,
  );
}
