import 'package:flutter/material.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({
    super.key, required this.location,
  });

  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        children: [
          const Icon(Icons.place,color: Colors.grey,),
          const SizedBox(width: 8,),
          Text(
              location
          ),],
      ),
    );
  }
}