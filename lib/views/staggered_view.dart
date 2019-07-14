import 'package:flutter/material.dart';
import 'package:unsplash_api/models/all_images.dart';
import 'package:unsplash_api/views/grid_views/grid_view_1.dart';


class StaggeredView extends StatelessWidget {
  const StaggeredView({Key key, this.images,this.lazy}) : super(key: key);

  final List<AllImages> images;
  final bool lazy;

  @override
  Widget build(BuildContext context) {
    print('Control is in Staggered View');
    return Column(
      children: <Widget>[
        Wrap(
          direction: Axis.horizontal,
          children: imageBuilder(context),
        ),
        Container(
          height: MediaQuery.of(context).size.height/3,
          child: Center(child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: lazy?const CircularProgressIndicator():const Text('End of Search results',style: TextStyle(fontSize: 20),),
          )),
        ),
      ],
    );
  }

  List<Widget> imageBuilder(BuildContext context) {
    final List<Widget> displayImages = <Widget>[];
    for (int i = 0, k = 0; images.length - i > 3; i += 3, k++) {
      if (k % 3 == 0)
        displayImages.add(
          GridView1(
            image1: images[i],
            image2: images[i + 1],
            image3: images[i + 2],
            value: 1,
          ),
        );
      else if (k % 3 == 1)
        displayImages.add(
          GridView1(
            image1: images[i],
            image2: images[i + 1],
            image3: images[i + 2],
            value: 2,
          ),
        );
      else
        displayImages.add(
          GridView1(
            image1: images[i],
            image2: images[i + 1],
            image3: images[i + 2],
            value: 3,
          ),
        );
    }
    return displayImages;
  }
}
