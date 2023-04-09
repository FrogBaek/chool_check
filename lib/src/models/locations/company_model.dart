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

  // Marker 추출
  static List<CustomMarker> myMarkers() {
    List<CustomMarker> _list = [];
    for (var lm in Dummy.locations) {
      _list.add(CustomMarker.build(
        markerId: lm.locationName,
        position: lm.latLng,
      ));
    }
    return _list;
  }

  // Circle 추출
  static List<CustomCircle> myCircles() {
    List<CustomCircle> _list = [];
    for (var lc in Dummy.locations) {
      _list.add(CustomCircle.build(
        overlayId: lc.overlayId,
        center: lc.latLng,
        radius: lc.radius,
      ));
    }
    return _list;
  }
}
