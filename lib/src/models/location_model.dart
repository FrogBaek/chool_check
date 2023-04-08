import 'package:chool_check/src/utils/index.dart';

// LocationModel 생성
class LocationModel extends LatLng {
  final double latitude;
  final double longitude;

  const LocationModel({
    required this.latitude,
    required this.longitude,
  }) : super(latitude, longitude);
}
