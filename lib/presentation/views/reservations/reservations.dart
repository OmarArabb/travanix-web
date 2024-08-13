import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/core/functions/toast.dart';
import 'package:travanix/core/styles/text_styles.dart';
import 'package:travanix/presentation/manger/get_reservations/cubit.dart';
import 'package:travanix/presentation/manger/get_reservations/states.dart';
import 'package:travanix/presentation/views/reservations/widgets/hotel_reservation_table.dart';
import 'package:travanix/presentation/views/reservations/widgets/switch_between_reservation_bar.dart';
import 'package:travanix/presentation/views/reservations/widgets/trip_reservations_table.dart';

class ReservationsScreen extends StatelessWidget {
  const ReservationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetReservationsCubit()..getTripReservations(),
      child: BlocConsumer<GetReservationsCubit, GetReservationsStates>(
        listener: (context, state) {
          if (state is ErrorGetTripReservationsState) {
            errorToast(state.errMessage);
          } else if (state is ErrorEditReservationsState) {
            errorToast(state.errMessage);
          } else if (state is SuccessEditReservationsState) {
            successToast(state.successMessage);
          }
        },
        builder: (context, state) {
          GetReservationsCubit cubit = GetReservationsCubit.get(context);

          List<Widget> screens = [
            TripReservationsDataTable(
              cubit: cubit,
            ),
            HotelReservationsDataTable(
              cubit: cubit,
            ),
          ];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Reservations', style: AppTextStyles.styleSemiBold24()),
              const SizedBox(
                height: 16,
              ),
              SwitchBetweenReservationBar(
                cubit: cubit,
              ),
              const SizedBox(
                height: 16,
              ),
              if (state is SuccessGetTripReservationsState || state is SuccessGetHotelReservationsState ||
                  state is RemoveItemFromReservations)
                Center(child: screens[cubit.currentIndex]),
              if (state is LoadingGetTripReservationsState || state is LoadingGetHotelReservationsState)
                const Center(child: CircularProgressIndicator()),
            ],
          );
        },
      ),
    );
  }
}
