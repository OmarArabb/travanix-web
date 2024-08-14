import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/core/functions/toast.dart';
import 'package:travanix/core/styles/text_styles.dart';
import 'package:travanix/core/widgets/custom_text_form_field.dart';
import 'package:travanix/presentation/manger/search_cubit/cubit.dart';
import 'package:travanix/presentation/manger/search_cubit/states.dart';
import 'package:travanix/presentation/views/search_items/widgets/attraction_Item.dart';


class SearchTouristDis extends StatelessWidget {
  const SearchTouristDis({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchCubit>(
      create: (context) => SearchCubit()..searchAttractions(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {
          if (state is ErrorSearchState) {
            errorToast(state.errMessage);
          }
          
        },
        builder: (context, state) {
          SearchCubit cubit = SearchCubit.get(context);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Show Tourist Destinations', style: AppTextStyles.styleSemiBold24()),
                  const Spacer(),
                  SizedBox(
                    height: 40,
                    width: MediaQuery.sizeOf(context).width * 0.2,
                    child: CustomTextFormField(
                      controller: cubit.touristDisSearchController,
                      hintText: 'Search',
                      onChanged: (String value) {
                        cubit.searchAttractions();

                      },
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              if (state is SuccessSearchState)
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 16,
                    childAspectRatio: 5 / 5.2,
                  ),
                  shrinkWrap: true,
                  itemCount: cubit.searchTouristDisModel!.attractionActivities!.length,
                  itemBuilder: (context, index) => AttractionItem(
                    cubit: cubit,
                    index: index,
                  ),
                ),
              if (state is LoadingSearchState)
                const Center(child: CircularProgressIndicator()),
            ],
          );
        },
      ),
    );
  }
}
