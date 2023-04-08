import 'package:chool_check/utils/index.dart';

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
}
