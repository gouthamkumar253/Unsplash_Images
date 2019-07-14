import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:unsplash_api/models/all_images.dart';

class ArcBannerImage extends StatefulWidget {
  const ArcBannerImage({Key key, this.image}) : super(key: key);

  final AllImages image;

  @override
  _ArcBannerImageState createState() => _ArcBannerImageState();
}

class _ArcBannerImageState extends State<ArcBannerImage> {
  String display = '';
  String details = '';
  bool flag = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.image.description != null) {
      if (widget.image.description.length > 20) {
        display = widget.image.description.substring(0, 20);
        details = widget.image.description
            .substring(20, widget.image.description.length);
      } else {
        display = widget.image.description;
        details = '';
      }
    } else {
      display = 'Sample Image';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: ClipPath(
                    clipper: ArcClipper(),
                    child: FadeInImage.memoryNetwork(
                      width: MediaQuery.of(context).size.width,
//                      height: MediaQuery.of(context).size.height / 2,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      image: widget.image.urls.small,
                      placeholder: kTransparentImage,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: details.isEmpty
                      ? Text(
                          display,
                          style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.italic),
                        )
                      : Column(
                          children: <Widget>[
                            const SizedBox(height: 10.0),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: flag
                                              ? display
                                              : display + details,
                                          style: const TextStyle(
                                              color: Colors.black87,
                                              fontSize: 30,
                                              fontWeight: FontWeight.w900,
                                              fontStyle: FontStyle.italic),
                                        ),
                                        TextSpan(
                                          text: flag ? '... more' : ' less',
                                          style: const TextStyle(
                                              color: Colors.blue, fontSize: 20),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              setState(
                                                () {
                                                  flag = !flag;
                                                },
                                              );
                                            },
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Posted By ' + widget.image.user.name,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'On ' +
                      widget.image.createdAt.toIso8601String().substring(0, 10),
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height - 20);

    final Offset firstControlPoint = Offset(size.width / 4, size.height);
    final Offset firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    final Offset secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height - 65);
    final Offset secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
