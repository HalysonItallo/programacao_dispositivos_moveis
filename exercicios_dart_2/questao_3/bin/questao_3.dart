void main(List<String> arguments) {
  List<int> array = [1, 2, 3, 4, 5, 6];

  print("A soma de todos os elementos: ${executar(array, sumAllElements)}");
  print(
    "A multiplicação de todos os elementos: ${executar(array, multiplicationAllElements)}",
  );
}

int executar(List<int> array, int Function(List<int>) function) {
  return function(array);
}

int multiplicationAllElements(List<int> array) {
  int multiplication = array[0];
  for (int i = 1; i < array.length; i++) {
    multiplication = multiplication * array[i];
  }
  return multiplication;
}

int sumAllElements(List<int> array) {
  int sum = 0;
  for (var element in array) {
    sum += element;
  }
  return sum;
}
