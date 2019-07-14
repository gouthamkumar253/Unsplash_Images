import 'package:flutter/material.dart';
import 'package:unsplash_api/models/all_images.dart';

import 'arc_clipper.dart';

class ImageDetails extends StatelessWidget {
  const ImageDetails({Key key, this.image}) : super(key: key);
  final AllImages image;

  @override
  Widget build(BuildContext context) {
    print(image.id.toString() + ' is the image id');
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          controller: ScrollController(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                iconTheme: const IconThemeData(
                  color: Colors.black, //change your color here
                ),
                backgroundColor: Colors.white,
                title: Text(
                  image.description!=null?image.description:'Sample Image',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                forceElevated: innerBoxIsScrolled,
              ),
            ];
          },
          body: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Hero(
                tag: 'photo${image.id}',
                child: Container(
                  child: ArcBannerImage(image: image),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
