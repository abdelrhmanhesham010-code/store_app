import 'package:flutter/material.dart';

void showSuccessSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.zero, // Full width
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.check_circle, color: Colors.white),
          SizedBox(width: 10),
          Text('تم تحديث البيانات'),
        ],
      ),
    ),
  );
}

void errorSuccessSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.zero, // Full width
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.error, color: Colors.white),
          SizedBox(width: 10),
          Text('هناك خطاء'),
        ],
      ),
    ),
  );
}
