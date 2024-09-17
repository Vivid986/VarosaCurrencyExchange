import 'package:flutter/material.dart';

extension SizeExtension on num {
  SizedBox get vGap => SizedBox(
        height: toDouble(),
      );

  SizedBox get hGap => SizedBox(
        width: toDouble(),
      );
}
