import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_auth_app/utils/plugin/query_plugin.dart';
import 'package:flutter_web_auth_app/utils/strings/strings_app.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:ui_package/design/web/hover-menu/hover_menu.dart';
import 'package:ui_package/design/web/hover-menu/hover_menu_controller.dart';

import '../../../../utils/theme/color.dart';
import '../../../../utils/theme/text_style.dart';
class BodyWidgetHome extends StatelessWidget {
   BodyWidgetHome({super.key});
  bool isDesktopOrWeb() {
  if (kIsWeb) {
    return true;
  }
  if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    return true;
  }
  // https://pub.dev/documentation/hover_menu/latest/
  return false;
}
final hoverMenuController = HoverMenuController();
  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        stackHomeWidget(context),
         100.getHeight,
          heroWidget(context)
      ],
    );
  }

  Padding heroWidget(BuildContext context) {
    return Padding(
        padding:const EdgeInsets.all(20),
          child: Container(
            height: context.heightScreen/2,
            width: context.widthScreen,
            decoration: const BoxDecoration(
              color: Colors.amber,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(3, 0),
                  blurRadius: 6,
                ),
              ],
            ),
          ),
        );
  }

  Stack stackHomeWidget(BuildContext context) {
    return Stack(
        children: [
          FadeInImage.assetNetwork(placeholder: "asset/image/background-header1.png", image: "asset/image/background-header1.png"), //asset\image\background-header1.png

          Padding(
            padding:  const EdgeInsets.only(left:100.0, right:100.0, top: 72),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
             Shimmer(
            duration: const Duration(seconds: 3),
            interval: const Duration(seconds: 5),
            color: Colors.white,
            colorOpacity: 0.3,
            enabled: true,
            direction: const ShimmerDirection.fromLTRB(),
            child:FadeInImage.assetNetwork(placeholder: "asset/image/logo.png", image: "asset/image/logo.png",),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                
               // 10.getWidth,
                TextButton(
                   onPressed: (){},
                  child:  Text(StringsApp.featuresButtonHearder)),
                  10.getWidth,
                TextButton(
                  onPressed: (){},
                  child:  Text(StringsApp.benefitsButtonHearder)),
                10.getWidth,
                 TextButton(
                   onPressed: (){},
                  child: Text(StringsApp.plansButtonHearder)),
                10.getWidth,
                
              
                if(isDesktopOrWeb()) HoverMenu(title: Text(StringsApp.downloadsButtonHearder),
                 controller: hoverMenuController,
                 items: [ 
                   20.getHeight,
                    Text(StringsApp.downloadsButtonHearder),
                   20.getHeight,
                    Text(StringsApp.downloadsButtonHearder),
                   20.getHeight,
                    Text(StringsApp.downloadsButtonHearder),
                   20.getHeight,
                    Text(StringsApp.downloadsButtonHearder),
                ],),
                10.getWidth,
                 TextButton(
                   onPressed: (){},
                  child: Text(StringsApp.supportButtonHearder)),
                10.getWidth,
                ElevatedButton(
                  onPressed: (){},
                  style: ButtonStyle(backgroundColor:MaterialStateColor.resolveWith((states) =>  ColorApp.kPrimaryColor)),
                  child:  Text(StringsApp.startedButtonHearder)),
              ],)
            ],),
          ),
        
        rowWidget(context),
       
        ],
      );
      //
  }
  
  Widget rowWidget(BuildContext context){
  
    return Padding(
      padding:  const EdgeInsets.only(left:110.0, right:110.0, top: 155),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         FadeInImage.assetNetwork(
          placeholder: "asset/image/iPhone_X.png",
           image: "asset/image/iPhone_X.png",
           fit: BoxFit.cover,
           height: 550,width:280,
           //imageCacheHeight: value.toInt(), 
           //placeholderCacheHeight: value.toInt(),
           ), //asset\image\background-header1.png
          Container(
            height: 200,
            decoration:  const BoxDecoration(
             // color: ColorApp.kBackgroundColor
            ),
            child: Column(
              children: [
                Text(StringsApp.firstTitleHeader , style: TextStyleApp.style1,),
                Text(StringsApp.scandTitleHeader, style: TextStyleApp.style2,),
                20.getHeight,
                Row(
                  children: [
                    GestureDetector(onTap: (){}, child: Row(
                      children: [
                        const Icon(Icons.play_circle_fill_rounded),
                        2.5.getWidth,
                        Text(StringsApp.watchButtonHearder, style: Theme.of(context).textTheme.bodyMedium),

                      ],
                    )),
                    10.getWidth,
                    ElevatedButton(onPressed: (){}, child: Text(StringsApp.downloadButtonHearder)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}