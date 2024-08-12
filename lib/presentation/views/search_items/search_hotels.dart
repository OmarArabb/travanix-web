import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/core/functions/toast.dart';
import 'package:travanix/core/styles/text_styles.dart';
import 'package:travanix/core/widgets/custom_text_form_field.dart';
import 'package:travanix/presentation/manger/search_cubit/cubit.dart';
import 'package:travanix/presentation/manger/search_cubit/states.dart';
import 'package:travanix/presentation/views/search_items/widgets/hotel_item.dart';

class SearchHotel extends StatelessWidget {
  const SearchHotel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchCubit>(
      create: (context) => SearchCubit()..searchHotels(),
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
                  Text('Show Hotels', style: AppTextStyles.styleSemiBold24()),
                  const Spacer(),
                  SizedBox(
                    height: 40,
                    width: MediaQuery.sizeOf(context).width * 0.2,
                    child: CustomTextFormField(
                      controller: cubit.hotelSearchController,
                      hintText: 'Search',
                      onChanged: (String value) {
                        cubit.searchHotels();
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
                  itemCount: cubit.searchHotelsModel!.hotels!.length,
                  itemBuilder: (context, index) => HotelItem(
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
