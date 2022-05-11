import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:search_git/app/domain/usecases/get_all_gifs/get_all_gifs_imp.dart';
import 'package:search_git/app/domain/usecases/get_all_gifs/get_all_gifs_usecase.dart';
import 'package:search_git/app/domain/usecases/get_all_gifs_for_search/get_all_gifs_for_search_imp.dart';
import 'package:search_git/app/domain/usecases/get_all_gifs_for_search/get_all_gifs_for_search_usecase.dart';
import 'package:search_git/app/ui/widgets/grid_gif.dart';
import 'package:search_git/app/ui/widgets/search_bar.dart';

class GifPage extends StatefulWidget {
  const GifPage({Key? key}) : super(key: key);

  @override
  _GifPageState createState() => _GifPageState();
}

class _GifPageState extends State<GifPage> {
  final GetAllGifsUseCase _getAllGifs = GetIt.I.get<GetAllGifsImp>();
  final GetAllGifsForSearchUseCase _getAllGifsForSearch =
      GetIt.I.get<GetAllGifsForSearchImp>();

  String? _search;
  int _offset = 0;

  int _getCount(List data) {
    if (_search == null) {
      return data.length;
    } else {
      return data.length + 1;
    }
  }

  Future<dynamic> handlerSearch() {
    if (_search == null || _search!.isEmpty) {
      return _getAllGifs();
    } else {
      return _getAllGifsForSearch(
        _search!,
        _offset,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(41, 50, 65, 1),
        title: const Text(
          "Search GIF :)",
          style: TextStyle(
            color: Color.fromRGBO(238, 108, 77, 1),
          ),
        ),
        centerTitle: true,
        
      ),
      backgroundColor: const Color.fromRGBO(41, 50, 65, 1),
      body: Column(
        children: <Widget>[
          SearchBar(
            onSubmitted: (text) {
              setState(() {
                _search = text;
              });
            },
          ),
          Expanded(
            child: FutureBuilder(
              future: handlerSearch(),
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
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color.fromRGBO(238, 108, 77, 1),
                        ),
                      ),
                    );
                  case ConnectionState.done:
                    if (!snapshot.hasError) {
                      var data = snapshot.data;

                      return GridGif(
                        data: data,
                        itemCount: _getCount(data),
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
}
