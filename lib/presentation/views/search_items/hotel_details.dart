import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travanix/core/styles/colors.dart';
import 'package:travanix/core/styles/text_styles.dart';
import 'package:travanix/presentation/manger/search_cubit/cubit.dart';

class HotelDetails extends StatelessWidget {
  const HotelDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      'https://th.bing.com/th/id/OIP.AC-IlCMY-8TMn3lQbMvYmwHaE7?rs=1&pid=ImgDetMain',
      'https://th.bing.com/th/id/OIP.24IiTbnF_h-acsPBaXYhRQHaFS?rs=1&pid=ImgDetMain',
      'https://th.bing.com/th/id/OIP.kWsCDTmLQ4tBj6X3yXA4UAHaGQ?rs=1&pid=ImgDetMain',
    ];

    Map<String, IconData> hotelServicesIcons = {
      'Wi-Fi': Icons.wifi_rounded,
      'Full-Service laundry': Icons.iron,
      'Game Room': CupertinoIcons.game_controller_solid,
      'Room service': Icons.room_service,
      'Fitness center': Icons.fitness_center,
      'Sauna': FontAwesomeIcons.steam,
      'Parking': Icons.local_parking_outlined,
      'Pool': Icons.pool_outlined,
      'Hair salon': CupertinoIcons.scissors_alt
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Hotel Name', style: AppTextStyles.styleSemiBold24()),
            const SizedBox(
              width: 12,
            ),
            for (int i = 0; i < 5; i++)
              const Icon(
                Icons.star,
                color: Colors.amber,
                size: 24,
              )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        ImagesSection(images: images),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.6,
            child: const Text(
              'Ideally located in the Camden district of London, Sonder Camden Road is located a 18-minute walk from Camden Market, 1.2 miles from King\'s Cross Theatre and 1.6 miles from Emirates Stadium. This 3-star hotel offers a 24-hour front desk, a concierge service and free WiFi. The hotel has family rooms.'
              'All rooms come with air conditioning, a flat-screen TV with cable channels, an electric tea pot, a bath or shower, free toiletries and a closet. The rooms feature a private bathroom, a hairdryer and bed linen'
              'London Zoo is 1.7 miles from the hotel, while Euston Train Station is 1.7 miles from the property. The nearest airport is London City Airport, 11 miles from Sonder Camden Road Couples in particular like the location – they rated it 8.3 for a two-person trip',
              textAlign: TextAlign.start,
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Most popular facilities',
          style: AppTextStyles.styleSemiBold18(),
        ),
        const SizedBox(
          height: 8,
        ),
        MostPopularFacilities(hotelServicesIcons: hotelServicesIcons),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Rooms',
          style: AppTextStyles.styleSemiBold18(),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: DataTable(
            dividerThickness: 2,
              columnSpacing: 100,
              columns: const [
            DataColumn(label: Text(
              'Number of guests'
            ),),
            DataColumn(label: Text(
              'Size'
            ),),
                DataColumn(label: Text(
                    'Quantity'
                ),),
          ], rows: const [
            DataRow(cells: [
              DataCell(Text('data')),
              DataCell(Text('data')),
              DataCell(Text('data')),
            ])
          ]),
        ),
      ],
    );
  }
}

class MostPopularFacilities extends StatelessWidget {
  const MostPopularFacilities({
    super.key,
    required this.hotelServicesIcons,
  });

  final Map<String, IconData> hotelServicesIcons;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: SizedBox(
        height: 30,
        width: MediaQuery.sizeOf(context).width * 0.6,
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(width: 24,),
          itemBuilder: (context, index) => Row(
            children: [
              Icon(
                hotelServicesIcons['Wi-Fi'],
                size: 30,
                color: navyBlueColor,
              ),
              const SizedBox(width: 4,),
              Text('Wi-Fi',style: AppTextStyles.styleRegular14(),)
            ],
          ),
          shrinkWrap: true,
          itemCount: 5,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}

class ImagesSection extends StatefulWidget {
  const ImagesSection({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  State<ImagesSection> createState() => _ImagesSectionState();
}

class _ImagesSectionState extends State<ImagesSection> {
  int selected = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          height: 250,
          child: ListView.builder(
            itemCount: widget.images.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(2.0),
              child: InkWell(
                onTap: () {
                  selected = index;
                  setState(() {});
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                      fit: BoxFit.fill,
                      height: 80,
                      width: 80,
                      widget.images[index]),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            fit: BoxFit.fill,
            height: 250,
            width: 500,
            widget.images[selected],
          ),
        ),
      ],
    );
  }
}
