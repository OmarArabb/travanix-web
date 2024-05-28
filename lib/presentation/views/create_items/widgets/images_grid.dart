import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:travanix/presentation/manger/create_items_cubit/cubit.dart';

class ImagesGrid extends StatelessWidget {
  const ImagesGrid({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: images.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[400]!, width: 2),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return AspectRatio(
              aspectRatio: constraints.maxWidth / constraints.maxHeight,
              child: InkWell(
                onTap: () async {
                  await CreateItemsCubit.get(context)
                      .pickAndEncodeSingleImage(index);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.memory(
                    base64Decode(images[index]),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
