import 'package:flutter/material.dart';
import 'package:travanix/core/styles/colors.dart';
import 'package:travanix/core/styles/text_styles.dart';

class MostPopularFacilities extends StatelessWidget {
  const MostPopularFacilities({
    super.key,
    required this.hotelServicesIcons, required this.services,
  });

  final Map<String, IconData> hotelServicesIcons;
  final List<String> services;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: SizedBox(
        height: 30,
        width: MediaQuery.sizeOf(context).width * 0.6,
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
            width: 24,
          ),
          itemBuilder: (context, index) => Row(
            children: [
              Icon(
                hotelServicesIcons[services[index]],
                size: 30,
                color: navyBlueColor,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                services[index],
                style: AppTextStyles.styleRegular14(),
              )
            ],
          ),
          shrinkWrap: true,
          itemCount: services.length,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}