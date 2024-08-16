import 'package:flutter/material.dart';
import 'package:travanix/constant.dart';
import 'package:travanix/core/styles/colors.dart';
import 'package:travanix/core/styles/text_styles.dart';
import 'package:travanix/data/models/create_item_model/services_model.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.selectedItem,
    required this.servicesModel,
  });

  final List<int> selectedItem;
  final ServicesModel? servicesModel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Select facilities',
        style: AppTextStyles.styleRegular16().copyWith(color: basicColor),
      ),

      content: servicesModel != null ? SizedBox(
        width: 300,
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return CustomCheckListTile(
              selected: false,
              selectedItem: selectedItem,
              servicesModel: servicesModel!,
              index: index,
            );
          },
          itemCount: servicesModel!.data!.length,
          physics: const BouncingScrollPhysics(),
        ),
      ) : null,
    );
  }
}



// ignore: must_be_immutable
class CustomCheckListTile extends StatefulWidget {
   CustomCheckListTile(
      {super.key,
      required this.selected,
      required this.selectedItem,
      required this.servicesModel, required this.index});

  bool selected;
  final List<int> selectedItem;
  final ServicesModel servicesModel;
  final int index;

  @override
  State<CustomCheckListTile> createState() => _CustomCheckListTileState();
}

class _CustomCheckListTileState extends State<CustomCheckListTile> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      secondary: Icon(hotelServicesIcons[widget.servicesModel.data![widget.index].service!]),
      onChanged: (value) {
        value! ?  widget.selectedItem.add(widget.servicesModel.data![widget.index].id!) : widget.selectedItem.remove(widget.servicesModel.data![widget.index].id!);
        widget.selected = value;
        setState(() {});
      },
      value: widget.selectedItem.contains(widget.servicesModel.data![widget.index].id!),
      title: Text(widget.servicesModel.data![widget.index].service!),
    );
  }
}
