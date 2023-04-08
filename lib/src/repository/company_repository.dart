import 'package:chool_check/utils/index.dart';

class CompanyRepository {

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