import 'package:chool_check/src/utils/index.dart';

class EmployeeModel implements User {
  @override
  final String userName;

  @override
  final String companyName;

  @override
  final DateTime? checkedTime;

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
      checkedTime: json['checkedTime'] ?? DateTime(0),
    );
  }
//
// // Json으로 변환
// Map<String, dynamic> toJson() {
//   return {
//     'userName': userName,
//     'companyName': companyName,
//     'checkedTime': checkedTime,
//   };
// }
}
