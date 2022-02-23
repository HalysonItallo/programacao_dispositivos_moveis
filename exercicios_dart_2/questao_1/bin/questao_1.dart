void main(List<String> arguments) {
  List<int> intArray = [1, 2, 3, 4, 5, 6];

  print("A soma de todos os elementos: ${sumAllElements(intArray)}");
}

int sumAllElements(List<int> array) {
  int sum = 0;
  for (var element in array) {
    sum += element;
  }
  return sum;
}
