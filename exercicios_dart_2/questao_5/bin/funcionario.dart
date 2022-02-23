import 'pessoa.dart';

class Funcionario extends Pessoa {
  late final int _matricula;
  late final double _salario;

  Funcionario();

  Funcionario.setPessoa(String nome, String sobrenome)
      : super.setPessoa(nome, sobrenome);

  void setMatricula(int matricula) {
    _matricula = matricula;
  }

  int getMatricula() {
    return _matricula;
  }

  void setSalario(double salario) {
    if (0 <= salario) {
      _salario = salario;
    }
  }

  double getSalario() {
    return _salario;
  }

  double getSalarioPrimeiraParcela() {
    return _salario * 0.6;
  }

  double getSalarioSegundaParcela() {
    return _salario * 0.4;
  }
}
