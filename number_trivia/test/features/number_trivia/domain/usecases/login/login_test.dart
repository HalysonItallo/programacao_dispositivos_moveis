import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:number_trivia/features/number_trivia/data/models/user_model.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/user_entity.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/user_repository.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/login/login.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  group("User usecase test: ", () {
    late UserRepository mockUserRepository;
    late LoginImp loginImp;

    setUpAll(
      () => registerFallbackValue(
        const UserEntity(
            name: "Test", email: "test.com", password: "1234", age: 17),
      ),
    );

    setUp(() {
      mockUserRepository = MockUserRepository();
      loginImp = LoginImp(userRepository: mockUserRepository);
    });

    test("should login user sucess", () async {
      const tUser =
          UserModel(name: "Test", email: "test.com", password: "1234", age: 17);

      when((() => mockUserRepository.login(any(), any())))
          .thenAnswer((_) async => const Right(tUser));

      final result = await loginImp.call(
        const Params(email: "test.com", password: "1234"),
      );

      expect(result, const Right(tUser));

      verify(() => mockUserRepository.login("test.com", "1234"));

      verifyNoMoreInteractions(mockUserRepository);
    });
  });
}
