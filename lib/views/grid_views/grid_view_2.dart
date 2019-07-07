import 'package:flutter/material.dart';
import 'package:unsplash_api/models/all_images.dart';
import 'package:unsplash_api/views/image_style.dart';

class GridView2 extends StatelessWidget {
  const GridView2({Key key, this.image1, this.image2, this.image3})
      : super(key: key);

  final AllImages image1, image2, image3;

  @override
  Widget build(BuildContext context) {
    print('Grid view 2');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: ImageTile(
                image: image1,
                height: MediaQuery.of(context).size.width / 3,
                width: MediaQuery.of(context).size.width / 3,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              child: ImageTile(
                image: image2,
                height: MediaQuery.of(context).size.width / 3,
                width: MediaQuery.of(context).size.width / 3,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              child: ImageTile(
                image: image3,
                height: MediaQuery.of(context).size.width / 3,
                width: MediaQuery.of(context).size.width / 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}