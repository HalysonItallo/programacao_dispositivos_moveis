import 'dart:convert';

import 'package:albums/app/models/album.dart';
import 'package:albums/app/ui/widgets/pagination.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AlbumsPage extends StatefulWidget {
  const AlbumsPage({Key? key}) : super(key: key);

  @override
  State<AlbumsPage> createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  final int limit = 10;
  int selectedPage = 1;

  Future<dynamic> fetchAlbum() async {
    var response = await http.get(
      Uri.parse(
          'https://jsonplaceholder.typicode.com/albums?_page=$selectedPage&_limit=$limit'),
    );

    return jsonDecode(response.body).map((e) => Album.fromJson(e)).toList();
  }

  void setPage(int actualPage) {
    setState(() {
      selectedPage = actualPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums Page'),
      ),
      body: FutureBuilder(
        future: fetchAlbum(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:

            case ConnectionState.active:

            case ConnectionState.waiting:
              return const SizedBox(
                height: 400,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case ConnectionState.done:
              List data = snapshot.data;
              return ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Álbum $index clicado."),
                            ),
                          );
                        },
                        child: Text(data[index].title),
                      ),
                      index == limit - 1
                          ? Pagination(
                              limit: limit,
                              totalItems: 100,
                              onChange: (actualPage) {
                                setPage(actualPage);
                              },
                            )
                          : Container(),
                    ],
                  );
                },
              );
          }
        },
      ),
    );
  }
}
