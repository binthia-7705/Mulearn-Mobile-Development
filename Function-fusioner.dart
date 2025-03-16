import 'dart:core';

processList(List<int> numbers, int Function(int) operation) {
  List<int> result = [];
  for (int num in numbers) {
    result.add(operation(num));
  }
  return result;
}

void main() {
  List<int> list1 = [1, 2, 3, 4, 5];
  print("Doubled List: ${processList(list1, (int number) => number * 2)}");
  print("Squared List: ${processList(list1, (int number) => number * number)}");
  print(
    "Cubed List: ${processList(list1, (int number) => number * number * number)}",
  );
}
