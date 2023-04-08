import 'package:chool_check/utils/index.dart';

// Location 서비스 모음
class LocationService {
  static const LocationModel initLocation =
      LocationModel(latitude: 37.3591784, longitude: 127.1048319);



// TODO: 현재 위치 func만들기, homepage()의 anything() func에 있는 기능 여기로 이식

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




}
