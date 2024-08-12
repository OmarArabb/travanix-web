import 'package:flutter/material.dart';
import 'package:travanix/core/styles/colors.dart';
import 'package:travanix/presentation/manger/get_reservations/cubit.dart';
import 'package:travanix/presentation/views/create_items/widgets/custom_dropdown_textfield.dart';

class TripReservationsDataTable extends StatelessWidget {
  const TripReservationsDataTable({
    super.key,
    required this.cubit,
  });


  final GetReservationsCubit cubit;

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [Colors.black, Colors.green, Colors.red];
    List<String> status = ['Pending', 'Accepted', 'Canceled'];

    return DataTable(
      dividerThickness: 2,
      headingTextStyle: const TextStyle(color: basicColor),
      columnSpacing: 80,
      dataRowMaxHeight: 60,
      columns: const [
        DataColumn(label: Text('Trip Name')),
        DataColumn(label: Text('Trip Price')),
        DataColumn(label: Text('Reservation seats')),
        DataColumn(label: Text('Available Seats')),
        DataColumn(label: Text('User Name')),
        DataColumn(label: Text('User Phone')),
        DataColumn(label: Text('Reservations Status')),
      ],
      rows: cubit.model.map(
            (e) {
          return DataRow(cells: [
            DataCell(
              Text(e.tripName!),
            ),
            DataCell(
              Text(e.priceTrip.toString()),
            ),
            DataCell(
              Text(e.numberOfSeatReserved.toString()),
            ),
            DataCell(
              Text(e.numberOfSeatsAvailable.toString()),
            ),
            DataCell(
              onTap: () {
                // showDialog(context: context, builder: (context) => const AlertDialog(title: Text('Change Status'),
                // content: ,),);
              },
              Text(e.touristName!),
            ),
            DataCell(
              Text(e.phoneNumber!),
            ),
            DataCell(CustomDropDownTextField(
              filledColor: Colors.transparent,
              value: e.status!,
              onChanged: (value) {
                cubit.editTripReservationStatus({"id" : e.reserveId,
                  "status" : value.toString()
                });
                cubit.removeItem(e);
              },
              items: status.map(
                    (e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      style: TextStyle(fontSize: 14,color: colors[status.indexOf(e)]),
                    ),
                  );
                },
              ).toList(),
            )),
          ]);
        },
      ).toList(),
    );
  }
}