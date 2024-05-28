import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/core/styles/colors.dart';
import 'package:travanix/presentation/manger/create_items_cubit/cubit.dart';
import 'package:travanix/presentation/manger/create_items_cubit/states.dart';
import 'package:travanix/presentation/views/create_items/widgets/add_images_item.dart';
import 'package:travanix/presentation/views/create_items/widgets/images_section.dart';

class AddImagesSection extends StatelessWidget {
  const AddImagesSection({
    super.key,
    required this.cubit,
  });

  final CreateItemsCubit cubit;

  @override
  Widget build(BuildContext context) {
    CreateItemsStates states = BlocProvider.of<CreateItemsCubit>(context).state;

    if (states is LoadingToAddMultiImagesState) {
      return const CircularProgressIndicator(
        color: basicColor,
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Material(
        child: states is InitialCreateItemsState
            ? AddImagesItem(cubit: cubit)
            : ImagesSection(cubit: cubit),
      ),
    );
  }
}


