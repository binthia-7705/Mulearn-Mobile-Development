import 'dart:io';

void main() {
  while (true) {
    double num1, num2;
    //Operations available for the user to perform
    String operation = '''

    **********************
      Choose an operation
      1.Addition
      2.Subtraction
      3.Multiplication
      4.Division
      5.Modulus
      6.Comparison
      7.Exit
    **********************''';
    print(operation);

    //Choosing the operation
    stdout.write('\nChoose an operation: ');
    int choice = int.parse(stdin.readLineSync() ?? '');
    if (choice == 7) {
      print('Exiting...');
      break;
    } else if ((choice < 1) || (choice > 7)) {
      print('Error: Invalid Choice');
      continue;
    }
    stdout.write('\nEnter the first number: ');
    num1 = double.parse(stdin.readLineSync() ?? '');
    stdout.write('Enter the second number: ');
    num2 = double.parse(stdin.readLineSync() ?? '');

    switch (choice) {
      case 1:
        //Adding the sum numbers
        print('\nSum of $num1 and $num2 is ${num1 + num2}');
        break;
      case 2:
        //Subtracting the two numbers
        print('\nDifference of $num1 and $num2 is ${num1 - num2}');
        break;
      case 3:
        //Multiplying the two numbers
        print('\nProduct of $num1 and $num2 is ${num1 * num2}');
        break;
      case 4:
        if (num2 != 0)
          //Dividing the two numbers
          print('\nQuotient  of $num1 and $num2 is ${num1 / num2}');
        else
          //If the 2nd number is 0 this message is printed
          print('\nCannot be divided');
        break;
      case 5:
        //Remainder of the two numbers
        print('\nModulus of $num1 and $num2 is ${num1 % num2}');
        break;
      case 6:
        //Comparing the two numbers to see which one is greater or if they are equal
        if (num1 > num2) {
          //1st number is greater
          print('\n$num1 is greater');
        } else if (num2 > num1) {
          //2nd number is greater
          print('\n$num2 is greater');
        } else {
          //Both numbers are equal
          print('\nThey are equal');
        }
        break;
    }
  }
}
