import 'package:flutter/material.dart';
import 'package:travanix/presentation/manger/create_items_cubit/cubit.dart';
import 'package:travanix/presentation/views/create_items/widgets/custom_alert_dialog.dart';

class SelectFacilitiesSection extends StatelessWidget {
  const SelectFacilitiesSection({
    super.key,
    required this.cubit,
  });

  final CreateItemsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
      const BorderRadius.all(Radius.circular(8)),
      child: Material(
        child: InkWell(
          hoverColor: Colors.grey[200],
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return CustomAlertDialog(
                    selectedItem:
                    cubit.selectedFacilities,
                    servicesModel: cubit.servicesModel);
              },
            );
          },
          child: Container(
            height: 55,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                  Radius.circular(8)),
              border: Border.all(
                  color: Colors.grey[400]!, width: 2),
            ),
            child: const Row(
              children: [
                Icon(Icons.checklist),
                SizedBox(
                  width: 8,
                ),
                Text('Select Facilities')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
