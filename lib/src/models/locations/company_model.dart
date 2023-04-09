import 'package:chool_check/src/utils/index.dart';

// CompanyModel 생성
class CompanyModel implements Location {
  @override
  final String locationName;

  @override
  final LatLng latLng;

  @override
  final String overlayId;

  @override
  final LatLng center;

  @override
  final double radius;

  CompanyModel({
    required this.locationName,
    required this.latLng,
    required this.overlayId,
    required this.center,
    required this.radius,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      locationName: json['locationName'] ?? '',
      latLng: json['latLng'] ?? const LatLng(0.0, 0.0),
      overlayId: json['overlayId'] ?? '',
      center: json['center'] ?? const LatLng(0.0, 0.0),
      radius: json['radius'].toDouble() ?? 0.0,
      // 자꾸 int형으로 반환돼서 toDouble() 메서드를 통해 강제로 데이터형 고정
    );
  }

  static List<String> myCompanyNames() {
    final List<String> _list = [];

    for (int i = 0; i < Dummy.locations.length; i++) {
      final lm = CompanyModel.fromJson(Dummy.locations[i]).locationName;

      _list.add(lm);
    }
    return _list;
  }

}
