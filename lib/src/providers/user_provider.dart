import 'package:chool_check/src/utils/index.dart';

class UserProvider extends ChangeNotifier {
  final UserService _userService = UserService();
  final EmployeeModel myProfile = EmployeeModel.fromJson(Dummy.users);

  String calculateCheckedTime() => _userService.calculateCheckedTime();

  // checkedTime 객체에 계산된 출근 시간 값을 할당해주는 Function
  void updateCheckedTime() {
    myProfile.checkedTime = calculateCheckedTime();
    notifyListeners();
  }
}
