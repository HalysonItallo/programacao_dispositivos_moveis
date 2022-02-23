void main() {
  // // primeiro exemplo do uso do null safety
  // int? a; // aqui nós declaramos que a variável pode ser nula.
  // var b = 12;
  // var res = a ?? b;
  // print(res);

  // segundo exemplo de null
  // int? a;
  // var res = a!; //eu estou afirmando por meio do "!" que o valor não vai ser
  // //nulo, mas se eu não passo um valor ele dá exception.
  // print(res);

  List<dynamic> data = [
    <String, dynamic>{"name": "Halyson", "idade": 20, "curso": "ADS"},
    <String, dynamic>{"name": null, "idade": 20, "curso": "ADS"},
  ];

  List<User> users = [];

  for (var user in data) {
    User userModel = User(
      name: user.name,
      idade: user.idade,
      curso: user.curso,
    );

    users.add(userModel);
  }

  print(users);
}

class User {
  final String name;
  final int idade;
  final String curso;

  User({required this.name, required this.idade, required this.curso});
}
