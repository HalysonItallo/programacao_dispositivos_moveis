import 'dart:math';

void main() {
  int n1 = 1;
  int n2 = 2;

  print("resto: ${n1 % n2}");
  print("divisao inteira: ${n1 ~/ n2}");
  print("potenciacao ${pow(n1, n2)}");

  if (n1 is int) {
    print("n1 é inteiro");
  }

  if (n1 is! int) {
    print("n1 não é inteiro");
  }
}
