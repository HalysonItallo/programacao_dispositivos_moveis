void main(List<String> arguments) {
  List<int> intArray = [1, 2, 3, 4];

  print(
    "A multiplicação de todos os elementos: ${multiplicationAllElements(intArray)}",
  );
}

int multiplicationAllElements(List<int> array) {
  int multiplication = array[0];
  for (int i = 1; i < array.length; i++) {
    multiplication = multiplication * array[i];
  }
  return multiplication;
}
