import 'package:flutter/material.dart';
import 'package:unsplash_api/models/all_images.dart';

import 'arc_clipper.dart';

class ImageDetails extends StatelessWidget {
  const ImageDetails({Key key, this.image}) : super(key: key);
  final AllImages image;

  @override
  Widget build(BuildContext context) {
    print(image.toString());
    return Scaffold(
      appBar: AppBar(
        title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              image.description != null ? image.description : 'Sample image',
              style: TextStyle(fontSize: 30),
            ),
        ),
        backgroundColor: Colors.grey,

      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: const <Color>[
              const Color(0xFFf5f7fa),
              const Color(0xFFc3cfe2)
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
// Using Hero Widget here gives a problem with the rendering of the image, but the animation would be good to see
          child: Hero(
            tag: 'photo${image.id}',
            child: Container(
              child: ArcBannerImage(image: image),
            ),
          ),
// This is the alternate code too eliminate the above commented problem, but I'm sticking with the animation for now
//        child: Container(
//          child: ArcBannerImage(image:image),
//        ),
        ),
      ),
    );
  }
}
