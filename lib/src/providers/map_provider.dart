import 'package:chool_check/src/utils/index.dart';

class MapProvider extends ChangeNotifier {
  final LocationService _locationService = LocationService();

  final LatLngModel initLocation = LocationService.initLocation;

  final List<MarkerModel> myMarkers = MarkerModel.myMarkers();
  final List<CircleModel> myCircles = CircleModel.myCircles();

  // // MapProvider 생성자
  MapProvider() {
    Future(setCurrentLocation);
  }

  // 현재 위치 설정 확인 Function
  Future<void> setCurrentLocation() async {
    if (await _locationService.checkLocationPermission()) {
      // 업데이트
      notifyListeners();
    }
  }

  Future<bool> checkLocationPermission() async =>
      _locationService.checkLocationPermission();

  Future<LatLngModel> getCurrentLocation() async =>
      _locationService.getCurrentLocation();

  Future<double> getDistance() async =>
      _locationService.getDistance();
}
