import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ToastShowWidget  {





  static showToast(
    BuildContext context,
    Color background, String title, String dec,
    ){
    toastification.show(
  context: context,
  type: ToastificationType.success,
  style: ToastificationStyle.flat,
  autoCloseDuration: const Duration(seconds: 5),
  title: title,
  description:dec,
  alignment: Alignment.topRight,
  direction: TextDirection.ltr,
  animationDuration: const Duration(milliseconds: 300),
  animationBuilder: (context, animation, alignment, child) {
    return FadeTransition(
      opacity:  animation,
      child: child,
    );
  },
  icon: const Icon(Icons.check),
  primaryColor: Colors.green,
  backgroundColor: background,
  foregroundColor: Colors.black,
  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  borderRadius: BorderRadius.circular(12),
  boxShadow: const [
    BoxShadow(
      color: Color(0x07000000),
      blurRadius: 16,
      offset: Offset(0, 16),
      spreadRadius: 0,
    )
  ],
  showProgressBar: true,
  closeButtonShowType: CloseButtonShowType.onHover,
  closeOnClick: true,
  pauseOnHover: true,
  dragToClose: true,
  callbacks: ToastificationCallbacks(
    onTap: (toastItem) => print('Toast ${toastItem.id} tapped'),
    onCloseButtonTap: (toastItem) => print('Toast ${toastItem.id} close button tapped'),
    onAutoCompleteCompleted: (toastItem) => print('Toast ${toastItem.id} auto complete completed'),
    onDismissed: (toastItem) => print('Toast ${toastItem.id} dismissed'),
  ),
);
  }
}