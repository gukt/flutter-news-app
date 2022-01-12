import 'package:flutter/material.dart';

class DemoMiscPage extends StatelessWidget {
  const DemoMiscPage({Key? key}) : super(key: key);

  // _buildShadowImage() {
  //   return Container(
  //     width: 200,
  //     height: 200,
  //     // color: Colors.green,
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       shape: BoxShape.circle,
  //       boxShadow: const [primaryShadow],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // _buildShadowImage(),
          ],
        ),
      ),
    );
  }
}
