import 'package:flutter/material.dart';
import 'package:travanix/core/styles/colors.dart';
import 'package:travanix/core/styles/text_styles.dart';
import 'package:travanix/data/models/hotels_model/hotel_model.dart';
import 'package:travanix/data/models/restaurants_model/restaurants_model.dart';
import 'package:travanix/presentation/manger/create_items_cubit/cubit.dart';

class GridItem extends StatefulWidget {
  const GridItem({
    super.key,
    required this.createItemsCubit,
    required this.index,
    required this.model, required this.selectedItems,
  });

  final CreateItemsCubit createItemsCubit;
  final dynamic model;
  final int index;
  final List<int> selectedItems;


  @override
  State<GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {

  String selectItemName(){
    String itemName;
    if(widget.model is HotelModel){
      itemName = widget.model.data![widget.index].hotelName!;
    }else if(widget.model is RestaurantsModel){
      itemName = widget.model.data![widget.index].resturantName!;
    }else{
      itemName = widget.model.data![widget.index].attractionActivityName!;
    }
    return itemName;
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: InkWell(
        onTap: () {
          widget.selectedItems.contains(widget.model.data[widget.index].id)
              ? widget.selectedItems.remove(widget.model.data[widget.index].id)
              : widget.selectedItems.add(widget.model.data[widget.index].id);

          print(widget.selectedItems);

          setState(() {});
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border:
            widget.selectedItems.contains(widget.model.data[widget.index].id)
                ? Border.all(color: basicColor, width: 4)
                : Border.all(color: Colors.grey[400]!, width: 2),
          ),
          padding: const EdgeInsets.all(1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(7.0),
                    topLeft: Radius.circular(7.0)),
                child: AspectRatio(
                  aspectRatio: 1080/780,
                  child: Image.network(
                    'http://127.0.0.1:8000${widget.model.data![widget.index].images![0]}',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(
                  selectItemName(),
                  style: AppTextStyles.styleSemiBold16(),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 4,
                  ),
                  Icon(
                    Icons.pin_drop_rounded,
                    size: 18,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Flexible(
                    child: Text(
                      '${widget.model.data![widget.index].nationName} / ${widget.model.data![widget.index].cityName} / ${widget.model.data![widget.index].address}',
                      style: AppTextStyles.styleRegular12().copyWith(
                        fontWeight: FontWeight.w800,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              if(widget.model is HotelModel)
                Row(
                  children: [
                    const SizedBox(
                      width: 6,
                    ),
                    for (int i = 0; i < widget.model.data![widget.index].hotelClass!; i++)
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20,
                      )
                  ],
                ),

              const Spacer(flex: 2,)
            ],
          ),
        ),
      ),
    );
  }
}