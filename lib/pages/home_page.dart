import 'package:chool_check/components/custom_appbar.dart';
import 'package:chool_check/components/permissions.dart';
import 'package:chool_check/components/custom_footer.dart';
import 'package:flutter/material.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class HomePage extends StatelessWidget {
  static const LatLng companyLatLng = LatLng(
    37.3591784,
    127.1048319,
  );

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: FutureBuilder<String>(
        future: checkLocationPermission(),
        builder: ,
      ),


      // Column(
      //   children: const [
      //     Expanded(
      //       flex: 3,
      //       child: NaverMap(
      //         locationButtonEnable: true,
      //         initialCameraPosition: CameraPosition(
      //           target: companyLatLng,
      //           zoom: 16,
      //         ),
      //       ),
      //     ),
      //     Expanded(
      //       child: CustomFooter(),
      //     )
      //   ],
      // ),
    );
  }
}
