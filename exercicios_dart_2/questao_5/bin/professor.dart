import 'funcionario.dart';

class Professor extends Funcionario {
  late final String _titulacao;

  Professor();

  Professor.setPessoa(String nome, String sobrenome)
      : super.setPessoa(nome, sobrenome);

  void setTitulacao(String titulacao) {
    _titulacao = titulacao;
  }

  String getTitulacao() {
    return _titulacao;
  }

  @override
  double getSalarioPrimeiraParcela() {
    return super.getSalario();
  }

  @override
  double getSalarioSegundaParcela() {
    return 0;
  }
}
