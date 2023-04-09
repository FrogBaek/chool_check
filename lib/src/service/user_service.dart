import 'package:chool_check/src/utils/index.dart';

class UserService {

  // 현재 시간을 토대로 출근 시간을 계산해주는 Function
  String calculateCheckedTime () {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('mm분 ss초').format(now);
    String amPm = now.hour < 12 ? "오전" : "오후";

    if (now.hour == 12) {
      return ("$amPm 12시 $formattedDate");
    } else {
      return ("$amPm ${now.hour % 12}시 $formattedDate");
    }
  }
}