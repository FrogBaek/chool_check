import 'package:chool_check/src/utils/index.dart';

class HomePage extends StatefulWidget {
  const HomePage(
      {Key? key, required this.mapProvider, required this.userProvider})
      : super(key: key);
  final MapProvider mapProvider;
  final UserProvider userProvider;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NaverMapController? _mapController;

  /*로직*/

  // 출석체크 로직
  Future<bool> _choolCheck() async {
    final distance = await widget.mapProvider.getDistance();

    bool canCheck = distance < 100 && widget.userProvider.found;

    return canCheck;
  }

  // 현위치 로직
  void _currentLocation() async {
    try {
      final currentLatLng = await widget.mapProvider.getCurrentLocation();

      await _mapController!.moveCamera(CameraUpdate.toCameraPosition(
        CameraPosition(
          target: currentLatLng,
          zoom: 16,
        ),
      ));
    } catch (e) {
      print(e);
    }
  }



  /*위젯*/

  // 출첵 Dialog 위젯
  Future<void> _canCheckDialog(BuildContext context, bool canCheck) {
    return showDialog(
        context: context,
        builder: (context) {
          return CustomDialog(
            title: '출근하기',
            message: canCheck ? '출근을 하시겠습니까?' : '출근할 수 없는 위치입니다.',
            positiveButtonTitle: '출근하기',
            negativeButtonTitle: canCheck ? '취소' : '확인',
            positiveButtonPressed: () {
              Navigator.of(context).pop();
              widget.userProvider.updateCheckedTime();
              _checkSucceeded(context);
            },
            negativeButtonPressed: () {
              Navigator.of(context).pop(false);
            },
            usePositiveButton: canCheck,
          );
        });
  }

  // 출첵 완료 Dialog 위젯
  Future<void> _checkSucceeded(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Consumer<UserProvider>(builder: (context, provider, child) {
          return CustomDialog(
            title: '오늘도 힘내봐요!',
            message: '출근 시간: ${provider.myProfile.checkedTime}',
            positiveButtonTitle: '',
            negativeButtonTitle: '네...',
            positiveButtonPressed: () {},
            negativeButtonPressed: () {
              Navigator.of(context).pop();
            },
            usePositiveButton: false,
          );
        });
      },
    );
  }

  // 현위치 버튼 위젯
  Widget _currentButton() {
    return FloatingActionButton(
      onPressed: () async {
        await widget.mapProvider.checkLocationPermission()
            ? _currentLocation()
            : _showPermissonDialog(
                context, '현재 위치 기능을 사용하려면 위치 권한이 필요합니다. 설정에서 해당 권한을 허용해주세요!');
      },
      child: const Padding(
        padding: EdgeInsets.all(6),
        child: Icon(
          Icons.my_location,
          size: 25,
          color: CustomColor.fullGreen,
        ),
      ),
    );
  }

  // Footer 위젯
  Widget _footer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.timelapse_outlined,
          color: CustomColor.fullGreen,
          size: 50.0,
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () async {
            await widget.mapProvider.checkLocationPermission()
                ? _choolCheck().then((canCheck) => _canCheckDialog(context, canCheck))
                : _showPermissonDialog(context,
                    '현재 내 위치와 가까운 회사를 찾기 위해 위치 권한이 필요합니다. 설정에서 해당 권한을 허용해주세요!');
          },
          child: const Text('출근하기!'),
        )
      ],
    );
  }

  // Permission Dialog 위젯
  Future<void> _showPermissonDialog(BuildContext context, String message) {
    return showDialog(
        context: context,
        builder: (context) {
          return CustomDialog(
            title: '위치 권한 거절',
            message: message,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '오늘도 출첵', actions: [
        IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyPage()));
          },
          icon: const Icon(Icons.settings_outlined),
        ),
      ]),
      body: FutureBuilder<bool>(
        future: widget.mapProvider.checkLocationPermission(),
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

          // 권한 허용 상태 or 권한 없는 상태
          return Column(
            children: [
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    NaverMap(
                      // onMapCreated를 사용해야 현위치 기능 사용 가능
                      onMapCreated: (NaverMapController mapController) {
                        _mapController = mapController;
                      },
                      initialCameraPosition: CameraPosition(
                        target: widget.mapProvider.initLocation,
                        zoom: 16,
                      ),
                      markers: widget.mapProvider.myMarkers,
                      circles: widget.mapProvider.myCircles,
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      alignment: const Alignment(1.0, 1.0),
                      child: _currentButton(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: _footer(),
              )
            ],
          );
        },
      ),
    );
  }
}
