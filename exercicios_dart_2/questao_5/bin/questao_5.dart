import 'funcionario.dart';
import 'professor.dart';

void main(List<String> arguments) {
  Funcionario f = Funcionario();
  f.setMatricula(1);
  print(f.getMatricula());
  f.setSalario(1000);
  print(f.getSalarioPrimeiraParcela());
  print(f.getSalarioSegundaParcela());

  //Professor p = Professor();
  // p.setNome("João");
  // p.setSobrenome("Pedro");
  Professor p = Professor.setPessoa("João", "Pedro");
  print(p.getNomeCompleto());
  p.setMatricula(1);
  print(p.getMatricula());
  p.setSalario(1000);
  print(p.getSalarioPrimeiraParcela());
  print(p.getSalarioSegundaParcela());
}
