import 'package:chool_check/src/utils/index.dart';

// Location 서비스 모음
class LocationService {
  static const LatLngModel initLocation =
  LatLngModel(latitude: 37.3591784, longitude: 127.1048319);

  // 위치 권한 요청 Function
  Future<bool> checkLocationPermission() async {
    // 권한 요청
    final PermissionStatus locationStatus = await Permission.location.request();

    // 위치 서비스 활성화 안 됨
    if (!locationStatus.isGranted) {
      return false;
    }

    // 조건 통과되면 위치 권한 허용 완료
    return true;
  }

  // 현재 위치 가져오는 Function
  Future<LatLngModel> getCurrentLocation() async {
    final Position _position = await Geolocator.getCurrentPosition();
    return LatLngModel(
      latitude: _position.latitude,
      longitude: _position.longitude,
    );
  }

  // 거리 구하기 Function
  Future<double> getDistance() async {
    double _dist = 0.0;

    // Geolocator 패키지를 통해 현재 위치를 가져온 뒤
    final _curPosition = await Geolocator.getCurrentPosition();

    // 이 패키지에 내장된 distanceBetween 메서드를 통해 거리를 구한 후
    _dist = Geolocator.distanceBetween(
      _curPosition.latitude,
      _curPosition.longitude,
      initLocation.latitude,
      initLocation.longitude,
    );

    // 해당 값을 반환
    return _dist;
  }

}
