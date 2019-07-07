import 'package:flutter/material.dart';
import 'package:unsplash_api/models/all_images.dart';
import 'package:transparent_image/transparent_image.dart';

import 'image_details.dart';

class ImageTile extends StatelessWidget {
  ImageTile({Key key, this.image, this.width, this.height})
      : super(key: key);
  final AllImages image;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Hero(
        tag: 'photo${image.id}',
        child: ClipRRect(
          borderRadius: BorderRadius.circular(70),
          child: Container(
            color: Colors.pinkAccent,
            child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                fit: BoxFit.fill,
                height: height,
                width: width,
                image: image.urls.small,
              ),
//              Align(
//                alignment: Alignment.centerLeft,
//                child: Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Container(
//                    child: Text('By- '+image.user.name,style: TextStyle(fontSize: 20,),maxLines: 1,overflow: TextOverflow.ellipsis,),
//                  ),
//                ),
//              ),

          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<Widget>(
            builder: (BuildContext context) {
              return ImageDetails(image: image);
            },
          ),
        );
      },
    );
  }
}
