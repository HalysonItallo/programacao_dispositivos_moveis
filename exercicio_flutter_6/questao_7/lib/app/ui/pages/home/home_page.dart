import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:questao_6/app/models/albums.dart';
import 'package:questao_6/app/ui/widgets/autocomplete.dart';

class AlbumsPage extends StatefulWidget {
  const AlbumsPage({Key? key}) : super(key: key);

  @override
  State<AlbumsPage> createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  late List<dynamic> _allAlbums = [];
  late List<dynamic> _foundAlbums = [];

  Future fetchAlbum() async {
    var response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums?_limit=10'),
    );

    setState(() {
      _allAlbums =
          jsonDecode(response.body).map((e) => Album.fromJson(e)).toList();
      _foundAlbums = _allAlbums;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchAlbum();
  }

  void _runFilter(String enteredKeyword) {
    List<dynamic> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allAlbums;
    } else {
      results = _allAlbums
          .where(
            (album) => album.title
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()),
          )
          .toList();
    }

    setState(() {
      _foundAlbums = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums Page'),
      ),
      body: Column(
        children: [
          AutocompleteWidget(
            onSelected: (String selection) {
              _runFilter(selection);
            },
          ),
          _foundAlbums.isEmpty
              ? const SizedBox(
                  height: 400,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: _foundAlbums.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Álbum $index clicado."),
                          ),
                        );
                      },
                      child: Text(_foundAlbums[index].title),
                    );
                  },
                ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.clear_all),
        onPressed: () {
          fetchAlbum();
        },
      ),
    );
  }
}
