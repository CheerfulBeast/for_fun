import 'package:flutter/material.dart';

class ColorStatus {
  Color colorStatus(String status, BuildContext context) {
    switch (status) {
      case 'ALIVE':
        return Colors.green;
      case 'DEAD':
        return Colors.red;
      case 'UNKNOWN':
        return Colors.blueGrey;
      default:
        return Theme.of(context).colorScheme.onPrimary;
    }
  }
}
