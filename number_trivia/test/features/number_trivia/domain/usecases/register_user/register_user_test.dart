import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:number_trivia/features/number_trivia/data/models/user_model.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/user_entity.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/user_repository.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/register_user/register_user.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  group("User usecase test: ", () {
    late UserRepository mockUserRepository;
    late RegisterUserImp registerUserImp;

    setUpAll(() {
      registerFallbackValue(
        const UserEntity(
          name: "test",
          email: "test.com",
          password: "1234",
          age: 21,
        ),
      );
    });

    setUp(() {
      mockUserRepository = MockUserRepository();
      registerUserImp = RegisterUserImp(userRepository: mockUserRepository);
    });

    test("should register user sucess", () async {
      const tUser =
          UserModel(name: "Test", email: "test.com", password: "1234", age: 17);

      when((() => mockUserRepository.registerUser(any())))
          .thenAnswer((_) async => const Right(tUser));

      final result = await registerUserImp.call(
        const Params(user: tUser),
      );

      expect(result, right(tUser));

      verify(() => mockUserRepository.registerUser(tUser));

      verifyNoMoreInteractions(mockUserRepository);
    });
  });
}
