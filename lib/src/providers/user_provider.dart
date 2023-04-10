import 'package:chool_check/src/utils/index.dart';

class UserProvider extends ChangeNotifier {
  final UserService _userService = UserService();
  final EmployeeModel myProfile = EmployeeModel.fromJson(Dummy.users);
  bool _found = false;

  bool get found => _found;

  UserProvider() {
    checkMyCompany();
  }

  // checkedTime 객체에 계산된 출근 시간 값을 할당해주는 Function
  void updateCheckedTime() {
    myProfile.checkedTime = calculateCheckedTime();
    notifyListeners();
  }

  void checkMyCompany() {
    try{
    _found = _matchedCompanyName();
    } catch(e) {
      print(e);
    }
    notifyListeners();
  }


  // 찾았는지 유무 확인
  bool _matchedCompanyName() {
    final myCompanyName = myProfile.companyName;

    final foundName = _findCompanyName(myCompanyName);

    return foundName;
  }

  // 회사 이름 찾는 로직
  bool _findCompanyName(String myCompanyName) {
    // 모든 회사에서 특정 회사 이름 찾는 로직
    bool isValueInList(List list, dynamic value) {
      for (dynamic element in list) {
        if (element == value) {
          return true;
        }
      }
      return false;
    }

    // 위 로직을 활용하여 myCompanyName 찾기
    List<String> names = CompanyModel.myCompanyNames();

    if (isValueInList(names, myCompanyName)) {
      return true;
    } else {
      return false;
    }
  }

  String calculateCheckedTime() => _userService.calculateCheckedTime();



}


