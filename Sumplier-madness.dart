import 'dart:io';

void main() {
  //Getting the input number from the user
  print("Let's learn multiplication");
  stdout.write("Enter the number: ");
  int? num = int.tryParse(stdin.readLineSync() ?? '');
  int sum = 0;

  //Error message when no input is received
  if (num == null) {
    print("Error: Invalid Input");
    return;
  }

  //Generating the first 10 multiples of the number
  for (int i = 1; i <= 10; i++) {
    int mul = num * i;
    sum += mul;
    print("$num x $i = $mul");
  }
  //Printing the summ of all the multiples till 10
  print("The sum of all the multiples=$sum");
}
