import 'package:flutter/material.dart';

import 'buttons_appBar.dart';

class AppBarHomeWidget extends StatelessWidget {
  const AppBarHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: Container(
          decoration:  BoxDecoration(boxShadow: [
            BoxShadow(
              color:  Theme.of(context).shadowColor,
              offset: Offset.zero,
              blurRadius: 21,
            ),
          ],),
          child: AppBar(
            backgroundColor: Colors.deepOrange,
            leading: Center(
              child: GestureDetector(child:  Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("HafezCodx",style:Theme.of(context).textTheme.displayMedium!.copyWith( fontSize: 20 , color: Colors.white),),
              ),),
            ),
            leadingWidth: 180,
            actions: const [
              // DropDownMenu(),
               //HoverMenu(),
              ButtonsAppBar(icon: Icons.notifications_active_rounded,),
              ButtonsAppBar(icon: Icons.notifications_active_rounded),
              ButtonsAppBar(icon: Icons.notifications_active_rounded),
             
            ],
          ),
        ),
      ),
      
    );
     
  }
}
