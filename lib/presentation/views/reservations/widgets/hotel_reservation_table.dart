import 'package:flutter/material.dart';
import 'package:travanix/core/styles/colors.dart';
import 'package:travanix/presentation/manger/get_reservations/cubit.dart';
import 'package:travanix/presentation/views/create_items/widgets/custom_dropdown_textfield.dart';

class HotelReservationsDataTable extends StatelessWidget {
  const HotelReservationsDataTable({
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
      columnSpacing: 70,
      dataRowMaxHeight: 60,
      columns: const [
        DataColumn(label: Text('Hotel Name')),
        DataColumn(label: Text('Tourist Name')),
        DataColumn(label: Text('Start Reservation')),
        DataColumn(label: Text('End Reservation')),
        DataColumn(label: Text('Total Price')),
        DataColumn(label: Text('Reservations Status')),
      ],
      rows: cubit.hotelReservations.map(
        (data) {
          return DataRow(cells: [
            DataCell(
              Text(data.touristName!),
            ),
            DataCell(
              Text(data.hotelName.toString()),
            ),
            DataCell(
              Text(data.startReservation.toString()),
            ),
            DataCell(
              Text(data.endReservation.toString()),
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
                          DataColumn(label: Text('Room Capacity')),
                          DataColumn(label: Text('Number Of Rooms'))
                        ],
                        rows: data.rooms!.map(
                          (e) {
                            return DataRow(cells: [
                              DataCell(Text(e.capacityRoom.toString())),
                              DataCell(Text(e.number.toString())),
                            ]);
                          },
                        ).toList(),
                      ),
                    );
                  },
                );
              },
              Text(data.priceAllReserve.toString()),
            ),
            DataCell(CustomDropDownTextField(
              filledColor: Colors.transparent,
              value: data.status!,
              onChanged: (value) {
                cubit.editHotelReservationStatus(
                    {"id": data.id, "status": value.toString()});
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
