import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

alertDialog(BuildContext context, String msg){
  Toast.show(msg, textStyle: context, duration: Toast.lengthShort, gravity:  Toast.bottom);
}