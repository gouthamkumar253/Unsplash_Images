import 'package:flutter/material.dart';
import 'package:unsplash_api/models/all_images.dart';
import 'package:transparent_image/transparent_image.dart';

import 'image_details.dart';

class ImageTile extends StatefulWidget {
  ImageTile({Key key, this.image, this.width, this.height}) : super(key: key);
  final AllImages image;
  final double width;
  final double height;

  @override
  _ImageTileState createState() => _ImageTileState();
}

class _ImageTileState extends State<ImageTile> {




  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Hero(
        tag: 'photo${widget.image.id}',
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: Colors.grey.withOpacity(0.20),
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              fit: BoxFit.cover,
              alignment: Alignment.center,
              height: widget.height,
              width: widget.width,
              image: widget.image.urls.small,
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<Widget>(
            builder: (BuildContext context) {
              return ImageDetails(image: widget.image);
            },
          ),
        );
      },
    );
  }
}

