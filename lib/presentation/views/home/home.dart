// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:travanix/core/styles/colors.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<StatefulWidget> createState() => PieChart2State();
// }
//
// class PieChart2State extends State {
//   int touchedIndex = -1;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         // SizedBox(width: 50,),
//         SizedBox(
//           width: 250,
//           height: 200,
//           child: PieChart(
//             PieChartData(
//               pieTouchData: PieTouchData(
//                 touchCallback: (FlTouchEvent event, pieTouchResponse) {
//                   setState(() {
//                     if (!event.isInterestedForInteractions ||
//                         pieTouchResponse == null ||
//                         pieTouchResponse.touchedSection == null) {
//                       touchedIndex = -1;
//                       return;
//                     }
//                     touchedIndex = pieTouchResponse
//                         .touchedSection!.touchedSectionIndex;
//                   });
//                 },
//               ),
//               borderData: FlBorderData(
//                 show: false,
//               ),
//               sectionsSpace: 0,
//               centerSpaceRadius: 40,
//               sections: showingSections(),
//             ),
//           ),
//         ),
//         const SizedBox(
//           width: 28,
//         ),
//       ],
//     );
//   }
//
//   List<PieChartSectionData> showingSections() {
//     return List.generate(4, (i) {
//       final isTouched = i == touchedIndex;
//       final fontSize = isTouched ? 25.0 : 16.0;
//       final radius = isTouched ? 60.0 : 50.0;
//       const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
//       switch (i) {
//         case 0:
//           return PieChartSectionData(
//             color: Colors.pinkAccent,
//             value: 40,
//             title: 'Trips %',
//             radius: radius,
//             titleStyle: TextStyle(
//               fontSize: fontSize,
//               fontWeight: FontWeight.bold,
//               color:Colors.orangeAccent,
//               shadows: shadows,
//             ),
//           );
//         case 1:
//           return PieChartSectionData(
//             color: Colors.yellowAccent,
//             value: 30,
//             title: '30%',
//             radius: radius,
//             titleStyle: TextStyle(
//               fontSize: fontSize,
//               fontWeight: FontWeight.bold,
//               color: Colors.lightGreen,
//               shadows: shadows,
//             ),
//           );
//         case 2:
//           return PieChartSectionData(
//             color: Colors.purpleAccent,
//             value: 15,
//             title: '15%',
//             radius: radius,
//             titleStyle: TextStyle(
//               fontSize: fontSize,
//               fontWeight: FontWeight.bold,
//               color: Colors.amber,
//               shadows: shadows,
//             ),
//           );
//         case 3:
//           return PieChartSectionData(
//             color: navyBlueColor,
//             value: 15,
//             title: '15%',
//             radius: radius,
//             titleStyle: TextStyle(
//               fontSize: fontSize,
//               fontWeight: FontWeight.bold,
//               color: basicColor,
//               shadows: shadows,
//             ),
//           );
//         default:
//           throw Error();
//       }
//     });
//   }
// }
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/core/styles/colors.dart';
import 'package:travanix/presentation/manger/dashboard_cubit/cubit.dart';
import 'package:travanix/presentation/manger/dashboard_cubit/states.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Color barBackgroundColor = basicColor.withOpacity(0.3);
  final Color barColor = navyBlueColor;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetDashBoardCubit>(
      create: (context) => GetDashBoardCubit()..getDashBoard(),
      child: BlocConsumer<GetDashBoardCubit,GetDashBoardStates>(
        listener: (context, state) {},
        builder: (context, state) {
          GetDashBoardCubit cubit = GetDashBoardCubit.get(context);

          if(state is SuccessGetDashBoard) {
            return Column(
            children: [
              const SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      AnimatedCounter(begin: 0, end: cubit.dashBoardModel!.data!.numberoftripin2year![0].currentYearTotalSeat!+20,),
                      const Text('Trips Number',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: navyBlueColor),),
                    ],
                  ),
                   Column(
                    children: [
                      AnimatedCounter(begin: 0, end: int.parse(cubit.dashBoardModel!.data!.totalSeatreservetripin2year![0].currentYearTotalSeat!)+20,),
                      const Text('Total Trip Reservation',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: navyBlueColor),),
                    ],
                  ),
                  Column(
                    children: [
                      AnimatedCounter(begin: 0, end: cubit.dashBoardModel!.data!.totalReservehotelin2year![0].currentYearTotalSeat! + 20,),
                      const Text('Total Hotel Reservation',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: navyBlueColor),),
                    ],
                  ),
                  Column(
                    children: [
                      AnimatedCounter(begin: 0, end: cubit.dashBoardModel!.data!.numberoftouristregester! + 20,),
                      const Text('Users',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: navyBlueColor),),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 36,),
              AspectRatio(
                aspectRatio: 1,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.graphic_eq),
                          const SizedBox(
                            width: 32,
                          ),
                          Text(
                            'Recharge Wallet Number chart',
                            style: TextStyle(
                              color: barColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        height: MediaQuery.sizeOf(context).height * 0.8,
                        child: BarChart(
                          randomData(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Text animatedCounter(int value) => Text(value.toString());

  BarChartGroupData makeGroupData(
    int x,
    double y,
  ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: barColor,
          borderRadius: BorderRadius.zero,
          width: 22,
          borderSide: BorderSide(color: barColor, width: 2.0),
        ),
      ],
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    List<String> days = ['1', '2', '3', '4', '5', '6', '7','8','9','10','11','12'];

    Widget text = Text(
      days[value.toInt()],
      style: style,
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }

  BarChartData randomData() {
    return BarChartData(
      maxY: 150.0,
      // barTouchData: BarTouchData(
      //   enabled: false,
      // ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            reservedSize: 30,
            showTitles: true,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
      ),
      barGroups: List.generate(
        12,
        (i) => makeGroupData(
          i,
          i * 5 + Random().nextInt(50).toDouble(),
        ),
      ),
    );
  }
}

class AnimatedCounter extends StatelessWidget {
  const AnimatedCounter({
    super.key, required this.begin, required this.end,
  });

  final int begin;
  final int end;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: IntTween(begin: begin, end: end),
      duration: const Duration(milliseconds: 750),
      builder: (context, value, child) {
        return Text(value.toString(),style: const TextStyle(color: basicColor,fontSize: 36,fontWeight: FontWeight.bold),);
      },
    );
  }
}

// class BarChartSample1State extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 1,
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 const Icon(Icons.graphic_eq),
//                 const SizedBox(
//                   width: 32,
//                 ),
//                 Text(
//                   'User Number chart',
//                   style: TextStyle(
//                     color: widget.barColor,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 32,
//             ),
//             SizedBox(
//               width: MediaQuery.sizeOf(context).width * 0.6,
//               height: MediaQuery.sizeOf(context).height * 0.6,
//               child: BarChart(
//                 randomData(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   BarChartGroupData makeGroupData(
//       int x,
//       double y,
//       ) {
//     return BarChartGroupData(
//       x: x,
//       barRods: [
//         BarChartRodData(
//           toY: y,
//           color:  widget.barColor,
//           borderRadius: BorderRadius.zero,
//           width: 22,
//           borderSide: BorderSide(color: widget.barColor, width: 2.0),
//         ),
//       ],
//     );
//   }
//
//   Widget getTitles(double value, TitleMeta meta) {
//     const style = TextStyle(
//       color: Colors.black,
//       fontWeight: FontWeight.bold,
//       fontSize: 14,
//     );
//     List<String> days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
//
//     Widget text = Text(
//       days[value.toInt()],
//       style: style,
//     );
//
//     return SideTitleWidget(
//       axisSide: meta.axisSide,
//       space: 16,
//       child: text,
//     );
//   }
//
//   BarChartData randomData() {
//     return BarChartData(
//
//       maxY: 250.0,
//       // barTouchData: BarTouchData(
//       //   enabled: false,
//       // ),
//       titlesData: FlTitlesData(
//         show: true,
//         bottomTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: true,
//             getTitlesWidget: getTitles,
//             reservedSize: 38,
//           ),
//         ),
//         leftTitles: const AxisTitles(
//           sideTitles: SideTitles(
//             reservedSize: 30,
//             showTitles: true,
//           ),
//         ),
//         topTitles: const AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: false,
//           ),
//         ),
//         rightTitles: const AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: false,
//           ),
//         ),
//       ),
//       borderData: FlBorderData(
//         show: true,
//       ),
//       barGroups: List.generate(
//         7,
//             (i) => makeGroupData(
//           i,
//           i*10 + 20,
//         ),
//       ),
//     );
//   }
// }
