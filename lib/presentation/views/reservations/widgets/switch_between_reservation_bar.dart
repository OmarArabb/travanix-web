import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:travanix/core/styles/colors.dart';
import 'package:travanix/presentation/manger/get_reservations/cubit.dart';

class SwitchBetweenReservationBar extends StatelessWidget {
  const SwitchBetweenReservationBar({
    super.key,
    required this.cubit,
  });

  final GetReservationsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      minWidth: double.infinity,
      activeBgColor: const [basicColor],
      animate: true,
      animationDuration: 250,
      initialLabelIndex: cubit.currentIndex,
      totalSwitches: 2,
      labels: const ['Trips', 'Hotels'],
      onToggle: (index) async {
        cubit.changeIndex(index!);
      },
    );
  }
}