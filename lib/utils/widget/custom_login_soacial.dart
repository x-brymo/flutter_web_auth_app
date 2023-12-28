import 'package:flutter/material.dart';

class CustomButtonsAuth extends StatelessWidget {
  const CustomButtonsAuth({super.key, this.icon, required this.nameSign, this.color, this.style});
  final IconData? icon;
  final String nameSign;
  final Color? color;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 60,width: 350,
        child: Container(
         decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32), 
            color: color,
            boxShadow: const [
              BoxShadow(
                color: Color(0xFF8F8E8E),
                offset: Offset(.3, .2),
                blurRadius: .010,
              ),
            ],
         ),
          child: Padding(
              padding: const EdgeInsets.only(right: 25,left:25),
            child: Center(
              child: ListTile(
                title: Text(nameSign , style: style,),
                trailing: Icon(icon),
              ),
            ),
          ),
        )),
    );
  }
}