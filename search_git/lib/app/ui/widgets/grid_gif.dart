import 'package:flutter/material.dart';
import 'package:search_git/app/ui/pages/gif/gif_page.dart';
import 'package:share_plus/share_plus.dart';
import 'package:transparent_image/transparent_image.dart';

class GridGif extends StatelessWidget {
  final dynamic data;
  final int itemCount;
  final void Function()? onTap;
  final String? search;

  const GridGif({
    Key? key,
    required this.data,
    required this.itemCount,
    required this.onTap,
    this.search,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          if (search == null || index < data["data"].length) {
            return GestureDetector(
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: data["data"][index]["images"]["fixed_height"]["url"],
                height: 300,
                fit: BoxFit.cover,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GifPage(
                      data["data"][index],
                    ),
                  ),
                );
              },
              onLongPress: () {
                Share.share(
                    data["data"][index]["images"]["fixed_height"]["url"]);
              },
            );
          } else {
            return GestureDetector(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 70,
                    ),
                    Text(
                      "Carregar mais ...",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                      ),
                    )
                  ],
                ),
                onTap: onTap);
          }
        });
  }
}
