import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:search_git/app/ui/pages/gif/gif_page.dart';
import 'package:search_git/app/ui/widgets/grid_gif.dart';

import 'package:share_plus/share_plus.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _search;
  int _offset = 0;

  Future<Map> _getGifs() async {
    http.Response response;
    if (_search == null || _search!.isEmpty) {
      response = await http.get(
        Uri.parse(
          "https://api.giphy.com/v1/gifs/trending?api_key=4kgvVMsiy8TBcDWPkpxBfLil6ybCfbem&limit=20&rating=G",
        ),
      );
    } else {
      response = await http.get(
        Uri.parse(
          "https://api.giphy.com/v1/gifs/search?api_key=4kgvVMsiy8TBcDWPkpxBfLil6ybCfbem&q=$_search&limit=19&offset=$_offset&rating=G&lang=en",
        ),
      );
    }
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    // _getGifs().then((map) {
    //   print(map);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Search GIF App"),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: const InputDecoration(
                    labelText: "Pesquise Aqui!",
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder()),
                style: const TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center,
                onSubmitted: (text) {
                  setState(() {
                    _search = text;
                  });
                },
              )),
          Expanded(
            child: FutureBuilder(
              future: _getGifs(),
              // ignore: missing_return
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Container();
                  case ConnectionState.waiting:
                    return Container(
                      width: 200,
                      height: 200,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    );
                  case ConnectionState.done:
                    if (!snapshot.hasError) {
                      print(snapshot.data["data"]);
                      return GridGif(
                        data: snapshot.data,
                        itemCount: _getCount(snapshot.data["data"]),
                        search: _search,
                        onTap: () {
                          setState(() {
                            _offset += 19;
                          });
                        },
                      );
                    }
                    return Container();
                  case ConnectionState.active:
                    return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  int _getCount(List data) {
    if (_search == null) {
      return data.length;
    } else {
      return data.length + 1;
    }
  }
}
