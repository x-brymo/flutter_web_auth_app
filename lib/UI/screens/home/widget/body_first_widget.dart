import 'package:flutter/material.dart';
import 'package:flutter_web_auth_app/utils/plugin/query_plugin.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
class BodyWidgetHome extends StatelessWidget {
  const BodyWidgetHome({super.key});

  @override
  Widget build(BuildContext context) {
    return   Stack(
      children: [
        FadeInImage.assetNetwork(placeholder: "asset/image/background-header1.png", image: "asset/image/background-header1.png"), //asset\image\background-header1.png

        Padding(
          padding:  const EdgeInsets.only(left:8.0, right:8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
           Shimmer(
          // This is the ONLY required parameter
          duration: const Duration(seconds: 3),
          // This is NOT the default value. Default value: Duration(seconds: 0)
          interval: const Duration(seconds: 5),
          // This is the default value
          color: Colors.white,
          // This is the default value
          colorOpacity: 0.3,
          // This is the default value
          enabled: true,
          // This is the default value
          direction: const ShimmerDirection.fromLTRB(),
          // This is the ONLY required parameter
          child:   FadeInImage.assetNetwork(placeholder: "asset/image/logo.png", image: "asset/image/logo.png"),
              ),
          
            Row(children: [
              const Text("data"),
              10.getWidth,
              const Text("data"),
              10.getWidth,
              const Text("data"),
              10.getWidth,
              const Text("data"),
              10.getWidth,
              const Text("data"),
            ],)
          ],),
        )
      ],
    );
  }
}