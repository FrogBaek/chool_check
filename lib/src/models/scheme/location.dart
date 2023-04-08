import 'package:chool_check/utils/index.dart';

// Location 추상화
abstract class Location {
  final String locationName = '';
  final LatLng latLng = const LatLng(0.0, 0.0);
  final String overlayId = '';
  final LatLng center = const LatLng(0, 0);
  final double radius = 0.0;
}
