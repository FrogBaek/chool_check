import 'package:chool_check/utils/index.dart';

class CustomMarker extends Marker {
  CustomMarker({
    required String markerId,
    required LatLng position,
  }) : super(
          markerId: markerId,
          position: position,
        );

  static CustomMarker build({
    required String markerId,
    required LatLng position,
  }) {
    return CustomMarker(
      markerId: markerId,
      position: position,
    );
  }
}
