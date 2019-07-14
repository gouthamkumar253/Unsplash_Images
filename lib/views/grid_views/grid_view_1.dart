import 'package:flutter/material.dart';
import 'package:unsplash_api/models/all_images.dart';
import 'package:unsplash_api/views/image_style.dart';

class GridView1 extends StatelessWidget {
  const GridView1({Key key, this.image1, this.image2, this.image3, this.value})
      : super(key: key);

  final AllImages image1, image2, image3;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: value == 1
          ? Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: ImageTile(
                          image: image1,
                          height: MediaQuery.of(context).size.width / 3,
                          width: MediaQuery.of(context).size.width / 2,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: ImageTile(
                          image: image2,
                          height: MediaQuery.of(context).size.width / 3,
                          width: MediaQuery.of(context).size.width / 2,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    child: ImageTile(
                      image: image3,
                      height: MediaQuery.of(context).size.width / 1.5,
                      width: MediaQuery.of(context).size.width / 2,
                    ),
                  ),
                ),
              ],
            )
          : value == 2
              ? Row(
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
                      width: 10,
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
                      width: 10,
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
                )
              : Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: ImageTile(
                          image: image3,
                          height: MediaQuery.of(context).size.width / 1.5,
                          width: MediaQuery.of(context).size.width / 2,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: ImageTile(
                              image: image1,
                              height: MediaQuery.of(context).size.width / 3,
                              width: MediaQuery.of(context).size.width / 2,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: ImageTile(
                              image: image2,
                              height: MediaQuery.of(context).size.width / 3,
                              width: MediaQuery.of(context).size.width / 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
    );
  }
}
