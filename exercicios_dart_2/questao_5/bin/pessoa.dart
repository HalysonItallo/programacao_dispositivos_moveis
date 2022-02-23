class Pessoa {
  late final String _nome;
  late final String _sobrenome;

  Pessoa();

  Pessoa.setPessoa(String nome, String sobrenome) {
    _nome = nome;
    _sobrenome = sobrenome;
  }

  void setNome(String nome) {
    _nome = nome;
  }

  String getNome() {
    return _nome;
  }

  void setSobrenome(String sobrenome) {
    _sobrenome = sobrenome;
  }

  String getSobrenome() {
    return _sobrenome;
  }

  String getNomeCompleto() {
    return _nome + " " + _sobrenome;
  }
}
