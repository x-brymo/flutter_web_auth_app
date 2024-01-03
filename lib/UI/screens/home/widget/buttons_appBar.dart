import 'package:flutter/material.dart';

class ButtonsAppBar extends StatelessWidget {
 final IconData? icon;

  const ButtonsAppBar({super.key, this.icon = Icons.ac_unit_sharp});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 2.0,width: 40,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white,
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.white,
          //     offset: Offset(0, 3),
          //     blurRadius: 6,
          //   ),
          // ],
        ),
        child: Icon(icon, color: Colors.black,),
      ),
    );
  }
}