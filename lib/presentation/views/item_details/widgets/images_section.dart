import 'package:flutter/material.dart';

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
                      'http://127.0.0.1:8000${widget.images[index]}'),
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
            'http://127.0.0.1:8000${widget.images[selected]}',
          ),
        ),
      ],
    );
  }
}