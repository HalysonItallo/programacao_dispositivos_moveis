import 'package:flutter/material.dart';
import 'package:search_git/app/ui/pages/gif/gif_details_page.dart';
import 'package:share_plus/share_plus.dart';
import 'package:transparent_image/transparent_image.dart';

class GridGif extends StatelessWidget {
  final List<dynamic> data;
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
        itemBuilder: (BuildContext context, int index) {
          if (search == null || index < data.length) {
            return GestureDetector(
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: data[index].images.fixedHeight.url,
                height: 300,
                fit: BoxFit.cover,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GifDetailsPage(
                      data[index],
                    ),
                  ),
                );
              },
              onLongPress: () {
                Share.share(data[index].images.fixedHeight.url);
              },
            );
          } else {
            return GestureDetector(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Icon(
                    Icons.add,
                    color: Color.fromRGBO(238, 108, 77, 1),
                    size: 70,
                  ),
                  Text(
                    "Carregar mais ...",
                    style: TextStyle(
                      color: Color.fromRGBO(238, 108, 77, 1),
                      fontSize: 22.0,
                    ),
                  ),
                ],
              ),
              onTap: onTap,
            );
          }
        });
  }
}
