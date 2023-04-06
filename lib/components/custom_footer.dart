import 'package:flutter/material.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          onPressed: () {},
          child: const Text('출근하기!'),
        )
      ],
    );
  }
}
