import 'package:flutter/material.dart';

class CfModalWidget {
  static void showModal({BuildContext context, Widget content}) {
    showModalBottomSheet(        
        isScrollControlled: true,
        enableDrag: false,
        context: context,
        builder: (_) {
          return content;
        });
  }  
}
