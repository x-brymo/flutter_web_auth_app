import 'package:flutter/material.dart';

class DropDownMenu extends StatefulWidget {
const DropDownMenu({Key? key}) : super(key: key);

@override
 State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
String? dropDownIndex;
var dropDownList = ["Delete","Change","Remove","Save"];

@override
Widget build(BuildContext context) {
return Container(
  height: 50,width: 95,
  decoration: const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(35)),
  ),
  child:   DropdownButton(
       icon: const Icon(Icons.expand_circle_down),
       dropdownColor: Colors.white,
       hint: const Text("select"),
       elevation: 0,
       //enableFeedback: true,
       autofocus: true,
       iconSize: 16,
       borderRadius: BorderRadius.circular(16),
       style: const TextStyle(
        color: Colors.black,
        //decoration: TextDecoration.underline,
       // decorationColor: Colors.yellow,
       ),
  
    items: dropDownList.map((value) => DropdownMenuItem(value: value,child:  
    Text(value),)).toList(),
    onChanged: (String? index) {
        setState(() {
          dropDownIndex = index;
        });
    },
    value: dropDownIndex,
        ),
);
    }
  }