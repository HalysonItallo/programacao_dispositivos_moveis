import 'package:flutter/material.dart';

class SlideImagePage extends StatefulWidget {
  final String title;
  const SlideImagePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<SlideImagePage> createState() => _SlideImagePageState();
}

class _SlideImagePageState extends State<SlideImagePage> {
  int _currentImage = 0;

  void _nextImage() {
    setState(() {
      if (_currentImage < (images.length - 1)) {
        _currentImage++;
      }
    });
  }

  void _previousImage() {
    setState(() {
      if (0 < _currentImage) {
        _currentImage--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 30),
              child: IconButton(
                onPressed: _previousImage,
                icon: const Icon(Icons.keyboard_arrow_left),
                tooltip: "Previous Image",
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 500,
                  width: 500,
                  child: Image.network(images[_currentImage]["urlImage"]),
                ),
                CircleAvatar(
                  backgroundColor: Colors.yellow,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        images[_currentImage]["like"] =
                            !images[_currentImage]["like"];
                      });
                    },
                    icon: Icon(
                      Icons.favorite_sharp,
                      color: images[_currentImage]["like"]
                          ? Colors.red
                          : Colors.black,
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 30),
              child: IconButton(
                onPressed: _nextImage,
                icon: const Icon(Icons.keyboard_arrow_right),
                tooltip: "Next Image",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List images = [
  <String, dynamic>{
    "urlImage":
        "https://cachorrode29anos.com/blog/wp-content/uploads/cachorro2.jpg",
    "like": false,
  },
  <String, dynamic>{
    "urlImage":
        "https://cachorrode29anos.com/blog/wp-content/uploads/shih-tzu2.jpg",
    "like": false,
  },
  <String, dynamic>{
    "urlImage":
        "https://cachorrode29anos.com/blog/wp-content/uploads/Pug-Top-10-ra%C3%A7as-de-cachorros-pequenos-e-fofos.png",
    "like": false,
  },
  <String, dynamic>{
    "urlImage":
        "https://cachorrode29anos.com/blog/wp-content/uploads/406227_10151052566393254_1299516869_n.jpg",
    "like": false,
  },
  <String, dynamic>{
    "urlImage":
        "https://cachorrode29anos.com/blog/wp-content/uploads/chihuahua-2765389_960_720.jpg",
    "like": false,
  },
];
