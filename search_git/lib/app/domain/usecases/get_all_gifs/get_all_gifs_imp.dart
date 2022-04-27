import 'package:search_git/app/domain/repositories/gif_repository.dart';
import 'package:search_git/app/domain/usecases/get_all_gifs/get_all_gifs_usecase.dart';

class GetAllGifsImp implements GetAllGifsUseCase {
  final GifRepository _gifRepository;
  GetAllGifsImp(this._gifRepository);

  @override
  Future call() async {
    return await _gifRepository.getAllGifs();
  }
}
