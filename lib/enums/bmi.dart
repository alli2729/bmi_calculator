import 'package:flutter/material.dart';

enum BmiEnum {
  normal(
    'its normal',
    Colors.green,
  ),
  underWeight(
    'its under weight',
    Colors.orange,
  ),
  overWeight(
    'its over weight',
    Colors.red,
  );

  const BmiEnum(this.label, this.color);

  final String label;
  final Color color;
}
