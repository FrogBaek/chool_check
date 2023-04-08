import 'package:chool_check/utils/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.mapProvider}) : super(key: key);
  final MapProvider mapProvider;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  Future<void> anything(BuildContext context) async {
    final curPosition = await Geolocator.getCurrentPosition();

    final distance = Geolocator.distanceBetween(
      curPosition.latitude,
      curPosition.longitude,
      widget.mapProvider.initLocation.latitude,
      widget.mapProvider.initLocation.longitude,
    );

    if (!context.mounted) return;

    bool canCheck = distance < 100;
    canCheckDialog(context, canCheck);
  }

  // Footer
  Widget footer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.timelapse_outlined,
          color: Colors.blue,
          size: 50.0,
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () async {
            await LocationService().checkLocationPermission()
                ? anything(context)
                : showPermissonDialog(context);
          },
          child: const Text('출근하기!'),
        )
      ],
    );
  }

  // Dialog
  Future<void> showPermissonDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return CustomDialog(
            title: '위치 권한 거절',
            message: '현재 내 위치와 가까운 회사를 찾기 위해 위치 권한이 필요합니다. 설정에서 해당 권한을 허용해주세요!',
            positiveButtonTitle: '설정',
            negativeButtonTitle: '취소',
            positiveButtonPressed: () async {
              openAppSettings();
            },
            negativeButtonPressed: () {
              Navigator.of(context).pop();
            },
            usePositiveButton: true,
          );
        });
  }


  Future<void> canCheckDialog(BuildContext context, bool canCheck) {
    return showDialog(
        context: context,
        builder: (context) {
          return CustomDialog(
            title: '출근하기',
            message: canCheck ? '출근을 하시겠습니까?' : '출근할 수 없는 위치입니다.',
            positiveButtonTitle: '출근하기',
            negativeButtonTitle: canCheck ? '취소' : '확인',
            positiveButtonPressed: () {
              Navigator.of(context).pop(true);
            },
            negativeButtonPressed: () {
              Navigator.of(context).pop(false);
            },
            usePositiveButton: canCheck,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: '오늘도 출첵'),
      body: FutureBuilder<bool>(
        future: LocationService().checkLocationPermission(),
        builder: (context, snapshot) {
          // 로딩 상태
          if (!snapshot.hasData &&
              snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: CustomColor.fullGreen,
              ),
            );
          }

          // 에러 발생할 경우
          else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
              ),
            );
          }

          // 권한 허용 상태 || 권한 없는 상태
          return Column(
            children: [
              Expanded(
                flex: 3,
                child: NaverMap(
                  locationButtonEnable: true,
                  initialCameraPosition: CameraPosition(
                    target: widget.mapProvider.initLocation,
                    zoom: 16,
                  ),
                  markers: widget.mapProvider.myMarkers,
                  circles: widget.mapProvider.myCircles,
                ),
              ),
              Expanded(
                child: footer(),
              )
            ],
          );
        },
      ),
    );
  }
}
