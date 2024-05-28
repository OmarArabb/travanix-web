import 'package:flutter/material.dart';
import 'package:travanix/core/styles/colors.dart';
import 'package:travanix/core/styles/text_styles.dart';
import 'package:travanix/presentation/manger/create_items_cubit/cubit.dart';

class AddImagesItem extends StatelessWidget {
  const AddImagesItem({
    super.key,
    required this.cubit,
  });

  final CreateItemsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.grey[200],
      onTap: () async {
        await cubit.pickAndEncodeMultiImages();
      },
      child: Container(
        height: 300,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: whiteColor,
          border: Border.all(color: Colors.grey[400]!, width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.add_photo_alternate,
              size: 128,
              color: Colors.grey,
            ),
            Text(
              'Add Images  ',
              style:
              AppTextStyles.styleSemiBold18().copyWith(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}