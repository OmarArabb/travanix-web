import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/core/functions/toast.dart';
import 'package:travanix/presentation/manger/get_rooms/cubit.dart';
import 'package:travanix/presentation/manger/get_rooms/states.dart';

class GetRoomsSection extends StatelessWidget {
  const GetRoomsSection({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetRoomsCubit>(
      create: (context) => GetRoomsCubit()..getRooms(hotelId: id),
      child: BlocConsumer<GetRoomsCubit, GetRoomsStates>(
        listener: (context, state) {
          if (state is ErrorGetRoomsState) {
            errorToast(state.errMessage);
          }
        },
        builder: (context, state) {
          GetRoomsCubit getRoomsCubit = GetRoomsCubit.get(context);

          if (state is SuccessGetRoomsState) {
            return Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: DataTable(
                  dividerThickness: 2,
                  columnSpacing: 100,
                  dataRowMaxHeight: 60,
                  columns: const [
                    DataColumn(
                      label: Text('Size'),
                    ),
                    DataColumn(
                      label: Text('Quantity'),
                    ),
                    DataColumn(
                      label: Text('Price'),
                    ),
                  ],
                  rows: getRoomsCubit.roomsModel != null
                      ? getRoomsCubit.roomsModel!.data!.map(
                        (e) {
                      return DataRow(cells: [
                        DataCell(Row(
                          children: [
                            for (int i = 0; i < e.capacityRoom!; i++)
                              const Icon(Icons.person)
                          ],
                        )),
                        DataCell(Text(e.quantity.toString())),
                        DataCell(Text('${e.priceRoom.toString()} \$')),
                      ]);
                    },
                  ).toList()
                      : [
                    const DataRow(cells: [
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                    ])
                  ],
                ));
          } else if (state is LoadingGetRoomsState) {
            return const CircularProgressIndicator();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}