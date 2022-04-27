import 'package:search_git/app/services/http_service.dart';
import 'package:search_git/app/domain/entities/gif_entity.dart';
import 'package:search_git/app/domain/repositories/gif_repository.dart';

class GifRepositoryImp implements GifRepository {
  final HttpService http;
  GifRepositoryImp(this.http);

  @override
  Future getAllGifs() async {
    var response = await http.getData(
      "/trending?api_key=4kgvVMsiy8TBcDWPkpxBfLil6ybCfbem&limit=20&rating=G",
    );

    var data = response.data["data"].map((e) => GifEntity.fromJson(e)).toList();
    return data;
  }

  @override
  Future getAllGifsForSearch(String search, int offset) async {
    var response = await http.getData(
      "/search?api_key=4kgvVMsiy8TBcDWPkpxBfLil6ybCfbem&q=$search&limit=19&offset=$offset&rating=G&lang=en",
    );

    var data = response.data["data"].map((e) => GifEntity.fromJson(e)).toList();

    return data;
  }
}
