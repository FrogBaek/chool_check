import 'package:chool_check/src/utils/index.dart';

class MarkerModel extends Marker {
  MarkerModel({
    required String markerId,
    required LatLng position,
  }) : super(
          markerId: markerId,
          position: position,
        );

  static MarkerModel build({
    required String markerId,
    required LatLng position,
  }) {
    return MarkerModel(
      markerId: markerId,
      position: position,
    );
  }

  // Marker 추출
  static List<MarkerModel> myMarkers() {
    final List<MarkerModel> _list = [];

    for (int i = 0; i < Dummy.locations.length; i++) {
      final CompanyModel lm = CompanyModel.fromJson(Dummy.locations[i]);

      _list.add(MarkerModel.build(
          markerId: lm.locationName,
          position: lm.latLng,
        ));
    }
    return _list;
  }
}
