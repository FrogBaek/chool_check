import 'package:chool_check/src/utils/index.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: '마이페이지',
      ),
      body: Center(
        child: Consumer<UserProvider>(builder: (context, provider, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "안녕하세요, ${provider.myProfile.userName}님!\n\n ${provider.myProfile.companyName}에서 근무하시네요 😀\n\n\n 오늘도 힘내세요~"),
              const SizedBox(height: 100),
            ],
          );
        }),
      ),
    );
  }
}
