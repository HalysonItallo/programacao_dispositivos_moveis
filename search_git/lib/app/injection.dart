import 'package:get_it/get_it.dart';
import 'package:search_git/app/datasource/remote/gif_repository_imp.dart';
import 'package:search_git/app/services/http_service.dart';
import 'package:search_git/app/domain/usecases/get_all_gifs/get_all_gifs_imp.dart';
import 'package:search_git/app/domain/usecases/get_all_gifs_for_search/get_all_gifs_for_search_imp.dart';

void setupInjection() {
  final getIt = GetIt.I;

  getIt.registerFactory(() => HttpService());
  getIt.registerFactory(
    () => GifRepositoryImp(
      GetIt.I.get<HttpService>(),
    ),
  );
  getIt.registerFactory(
    () => GetAllGifsImp(
      GetIt.I.get<GifRepositoryImp>(),
    ),
  );
  getIt.registerFactory(
    () => GetAllGifsForSearchImp(
      GetIt.I.get<GifRepositoryImp>(),
    ),
  );
}
