import 'package:flutter/material.dart';
import 'package:unsplash_api/models/all_images.dart';
import 'package:unsplash_api/views/grid_views/grid_view_1.dart';
import 'package:unsplash_api/views/grid_views/grid_view_2.dart';

import 'package:unsplash_api/views/grid_views/grid_view_3.dart';

class StaggeredView extends StatelessWidget {
  const StaggeredView({Key key, this.images}) : super(key: key);

  final List<AllImages> images;

  @override
  Widget build(BuildContext context) {
    print('Control is in Staggered View');
    print(images.toString());
    return Wrap(
      direction: Axis.horizontal,
      children: imageBuilder(context),
    );
  }

  List<Widget> imageBuilder(BuildContext context) {
    final List<Widget> displayImages = <Widget>[];
    for (int i = 0, k = 0; images.length - i > 3; i += 3, k++) {
      print(k);
      if (k % 3 == 0)
        displayImages.add(
          GridView1(
            image1: images[i],
            image2: images[i + 1],
            image3: images[i + 2],
          ),
        );
      else if (k % 3 == 1)
        displayImages.add(
          GridView2(
            image1: images[i],
            image2: images[i + 1],
            image3: images[i + 2],
          ),
        );
      else
        displayImages.add(
          GridView3(
            image1: images[i],
            image2: images[i + 1],
            image3: images[i + 2],
          ),
        );
    }
    return displayImages;
  }
}
