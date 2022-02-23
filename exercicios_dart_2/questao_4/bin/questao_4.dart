import 'dart:math';

void main(List<String> arguments) {
  print("Tradicional: ${curretnPow(2, 2)}");

  var powResult = (num base, num exponent) {
    return pow(base, exponent);
  };

  print("ArrowFunction: ${powResult(2, 2)}");
}

num curretnPow(num base, num exponent) {
  return pow(base, exponent);
}
