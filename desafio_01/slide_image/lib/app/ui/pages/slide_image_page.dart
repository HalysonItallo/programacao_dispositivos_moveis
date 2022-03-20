import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:slide_image/app/services/session_manager_client.dart';

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
  SessionManagerClient sessionManagerClient =
      SessionManagerClient(SessionManager());

  int currentImage = 0;
  bool like = false;

  void nextImage() {
    setState(() {
      if (currentImage < (images.length - 1)) {
        currentImage++;
        getLike(images[currentImage]["urlImage"]);
      }
    });
  }

  void previousImage() {
    setState(() {
      if (0 < currentImage) {
        currentImage--;
        getLike(images[currentImage]["urlImage"]);
      }
    });
  }

  void getLike(String urlImage) {
    setState(() {
      sessionManagerClient.get(urlImage).then(
            (data) => {
              like = data,
            },
          );
    });
  }

  void setLike(String urlImage, bool likeValue) {
    sessionManagerClient.put(urlImage, likeValue);
    getLike(urlImage);
  }

  void setImages() {
    for (var image in images) {
      sessionManagerClient.put(image["urlImage"], false);
    }
  }

  @override
  void initState() {
    setImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var image = images[currentImage];

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
                onPressed: previousImage,
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
                  child: Image.network(image["urlImage"]),
                ),
                CircleAvatar(
                  backgroundColor: Colors.yellow,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        setLike(image["urlImage"], !like);
                      });
                    },
                    icon: Icon(
                      Icons.favorite_sharp,
                      color: like ? Colors.red : Colors.black,
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 30),
              child: IconButton(
                onPressed: nextImage,
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
  },
  <String, dynamic>{
    "urlImage":
        "https://cachorrode29anos.com/blog/wp-content/uploads/shih-tzu2.jpg",
  },
  <String, dynamic>{
    "urlImage":
        "https://cachorrode29anos.com/blog/wp-content/uploads/Pug-Top-10-ra%C3%A7as-de-cachorros-pequenos-e-fofos.png",
  },
  <String, dynamic>{
    "urlImage":
        "https://cachorrode29anos.com/blog/wp-content/uploads/406227_10151052566393254_1299516869_n.jpg",
  },
  <String, dynamic>{
    "urlImage":
        "https://cachorrode29anos.com/blog/wp-content/uploads/chihuahua-2765389_960_720.jpg",
  },
];
