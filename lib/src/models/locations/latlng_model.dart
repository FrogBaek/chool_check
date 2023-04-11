import 'package:chool_check/src/utils/index.dart';

// LatlngModel 생성
class LatLngModel extends LatLng {
  final double latitude;
  final double longitude;

  const LatLngModel({
    required this.latitude,
    required this.longitude,
  }) : super(latitude, longitude);
}
