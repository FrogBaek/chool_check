import 'package:chool_check/utils/index.dart';

class MapProvider extends ChangeNotifier {
  final LocationService _locationService = LocationService();

  final LocationModel initLocation = LocationService.initLocation;


  final List<CustomMarker> myMarkers = CompanyRepository.myMarkers();
  final List<CustomCircle> myCircles = CompanyRepository.myCircles();

  MapProvider() {
    Future(updateCurrentLocation);
  }

  Future<void> updateCurrentLocation() async {
    if (await _locationService.checkLocationPermission()) {
      notifyListeners();
    }
  }

  Future<void> getCurrentLocation() async {

  }





}