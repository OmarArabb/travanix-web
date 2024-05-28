import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:travanix/presentation/manger/create_items_cubit/cubit.dart';
import 'package:travanix/presentation/views/create_items/widgets/images_grid.dart';

class ImagesSection extends StatelessWidget {
  const ImagesSection({
    super.key,
    required this.cubit,
  });

  final CreateItemsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[400]!, width: 2),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AspectRatio(
                    aspectRatio: constraints.maxWidth / constraints.maxHeight,
                    child: Image.memory(
                      base64Decode(cubit.decodedImages![0]),
                      fit: BoxFit.fill,
                    )),
              );
            },
          ),
        ),
        ImagesGrid(images: cubit.decodedImages!),
      ],
    );
  }
}