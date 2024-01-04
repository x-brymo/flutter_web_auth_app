import 'package:flutter/material.dart';
import 'package:flutter_web_auth_app/UI/screens/home/widget/appBar_home_widget.dart';

import 'widget/body_first_widget.dart';

class HomePage extends StatelessWidget {
   const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // appBar: const PreferredSize(
      //    preferredSize: Size.fromHeight(80),
      //   child: AppBarHomeWidget()),
      body: ListView(
        children:  [
          BodyWidgetHome(),
//         CustomCarousel(
//   items: [
//     // Image.network('https://fluttergems.dev/media/logo.png'),
//     // Image.network('https://fluttergems.dev/media/logo.png'),
//     // Image.network('https://fluttergems.dev/media/logo.png'),
//     Icon(Icons.access_alarms_rounded),
//     Icon(Icons.face_2_rounded),
//     Icon(Icons.macro_off_outlined),
//     Icon(Icons.baby_changing_station_outlined),
//   ],
//   carouselWidth: 300,
//   carouselHeight: 200,
// ), 
// //FooterView(children: [], footer: footer)
        ],
      ),
    );
  }
}
