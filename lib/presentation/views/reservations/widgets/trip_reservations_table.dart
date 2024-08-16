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
      dataRowMaxHeight: 60,
      headingRowHeight: 60,
      columns: const [
        DataColumn(label: Flexible(child: Text('Trip Name'))),
        DataColumn(label: Flexible(child: Text('Trip Price'))),
        DataColumn(label: Flexible(child: Text('Reservation seats'))),
        DataColumn(label: Flexible(child: Text('Available Seats'))),
        DataColumn(label: Flexible(child: Text('User Name'))),
        DataColumn(label: Flexible(child: Text('User Phone'))),
        DataColumn(label: Flexible(child: Text('Reservations Status'))),
      ],
      rows: cubit.tripReservations.map(
        (data) {
          return DataRow(cells: [
            DataCell(
              Text(data.tripName!),
            ),
            DataCell(
              Text(data.priceTrip.toString()),
            ),
            DataCell(
              Text(data.numberOfSeatReserved.toString()),
            ),
            DataCell(
              Text(data.numberOfSeatsAvailable.toString()),
            ),
            DataCell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Rooms'),
                      content: DataTable(
                        columns: const [
                          DataColumn(label: Text('Person Name')),
                          DataColumn(label: Text('Person Age'))
                        ],
                        rows: data.details!.map(
                          (e) {
                            return DataRow(cells: [
                              DataCell(Text(e.name.toString())),
                              DataCell(Text(e.age.toString())),
                            ]);
                          },
                        ).toList(),
                      ),
                    );
                  },
                );
              },
              Text(data.touristName!),
            ),
            DataCell(
              Text(data.phoneNumber!),
            ),
            DataCell(CustomDropDownTextField(
              filledColor: Colors.transparent,
              value: data.status!,
              onChanged: (value) {
                cubit.editTripReservationStatus(
                    {"id": data.reserveId, "status": value.toString()});
                cubit.removeItem(data);
              },
              items: status.map(
                (e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      style: TextStyle(
                          fontSize: 14, color: colors[status.indexOf(e)]),
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
