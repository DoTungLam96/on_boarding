import 'package:intl/intl.dart';

class Utils {
  Utils._();

  static final I = Utils._();

  String dateToString(int timeStamp, {String? fomart}) {
    final result = DateFormat(fomart ?? 'dd/MM/yyyy').format(
      DateTime.fromMillisecondsSinceEpoch((timeStamp * 1000).toInt()),
    );

    return result;
  }
}
