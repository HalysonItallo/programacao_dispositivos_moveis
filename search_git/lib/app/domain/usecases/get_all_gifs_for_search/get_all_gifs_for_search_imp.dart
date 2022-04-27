import 'package:search_git/app/domain/repositories/gif_repository.dart';
import 'package:search_git/app/domain/usecases/get_all_gifs_for_search/get_all_gifs_for_search_usecase.dart';

class GetAllGifsForSearchImp implements GetAllGifsForSearchUseCase {
  final GifRepository _gifRepository;

  GetAllGifsForSearchImp(
    this._gifRepository,
  );

  @override
  Future call(String search, int offset) async {
    return await _gifRepository.getAllGifsForSearch(search, offset);
  }
}
