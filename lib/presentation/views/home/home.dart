import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 9,
            child: Container(
              height: 200,
              color: Colors.grey,
            )),
        const Expanded(
          flex: 3,
          child: Column(
            children: [

            ],
          ),
        ),
      ],
    );
  }
}
