import 'package:flutter/material.dart';
import 'package:search_git/app/domain/entities/gif_entity.dart';
import 'package:share_plus/share_plus.dart';

class GifDetailsPage extends StatelessWidget {
  final GifEntity _gifData;
  const GifDetailsPage(this._gifData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String urlImage = _gifData.images.fixedHeight.url;

    return Scaffold(
        appBar: AppBar(
          iconTheme:
              const IconThemeData(color: Color.fromRGBO(224, 251, 252, 1)),
          title: Text(
            _gifData.title,
            style: const TextStyle(
              color: Color.fromRGBO(238, 108, 77, 1),
            ),
          ),
          backgroundColor: const Color.fromRGBO(41, 50, 65, 1),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () {
                Share.share(urlImage);
              },
            )
          ],
        ),
        backgroundColor: const Color.fromRGBO(41, 50, 65, 1),
        body: Center(
          child: Image.network(urlImage),
        ));
  }
}
