abstract class GifRepository {
  Future<dynamic> getAllGifs();
  Future<dynamic> getAllGifsForSearch(String search, int offset);
}
