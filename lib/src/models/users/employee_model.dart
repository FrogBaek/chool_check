import 'package:chool_check/src/utils/index.dart';

class EmployeeModel implements User {
  @override
  final String userName;

  @override
  final String companyName;

  @override
  String? checkedTime;
  // 출근 시간은 가변적이므로 final 선언 X!

  EmployeeModel({
    required this.userName,
    required this.companyName,
    this.checkedTime,
  });

  // Json 데이터 추출
  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      userName: json['userName'] ?? '',
      companyName: json['companyName'] ?? '',
      checkedTime: json['checkedTime'] ?? '',
    );
  }

}
