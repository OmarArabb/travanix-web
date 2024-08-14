import 'package:flutter/material.dart';

class OpeningAndClosingTime extends StatelessWidget {
  const OpeningAndClosingTime({
    super.key, required this.openingTime, required this.closingTime,
  });

  final String openingTime;
  final String closingTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(
          'Opening Time : $openingTime'
              '      '
              'Closing Time : $closingTime'),
    );
  }
}
