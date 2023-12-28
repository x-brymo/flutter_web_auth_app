import 'package:flutter/material.dart';

extension QueryPlugin on BuildContext{
  get heightScreen => MediaQuery.of(this).size.height;
  get widthScreen => MediaQuery.of(this).size.width;
}
Widget boxSizeHeight(BuildContext context , double query ){
  return SizedBox(height: context.heightScreen / query,);
}
Widget boxSizeWidth(BuildContext context , double query ){
  return SizedBox(width: context.widthScreen / query,);
}
extension GetHeightAndWidthBox on num{
  get getHeight=>SizedBox(height: toDouble(),);
  get getWidth=>SizedBox(width: toDouble(),);
}