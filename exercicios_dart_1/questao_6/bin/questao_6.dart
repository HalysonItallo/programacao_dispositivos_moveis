void main() {
  double n1 = 2.0;
  double n2 = 6.5;
  double n3 = 3.25;

  double arithmetic_average = (n1 + n2 + n3) / 3;

  if (10 >= arithmetic_average && arithmetic_average >= 7) {
    print("aprovado");
  } else if (arithmetic_average > 0 && arithmetic_average < 4) {
    print("reprovado");
  } else {
    print("exame final");
  }
}
