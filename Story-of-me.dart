import 'dart:io';

void main() {
  stdout.write("\nEnter your name: ");
  String? name = stdin.readLineSync();

  stdout.write("Enter your phone number: ");
  String? phonenum = stdin.readLineSync();

  stdout.write("Enter your age: ");
  String? age = stdin.readLineSync();

  stdout.write("Enter your height: ");
  String? height = stdin.readLineSync();

  stdout.write("Enter your weight: ");
  String? weight = stdin.readLineSync();

  stdout.write("Enter your address: ");
  String? address = stdin.readLineSync();

  stdout.write("Enter your hobbies (comma separated): ");
  String? hobbiesInput = stdin.readLineSync();
  List<String> hobbies =
      hobbiesInput?.split(',').map((hobby) => hobby.trim()).toList() ?? [];

  String biodata = '''

    _____________________________
    ********** BIODATA **********

    Name         : $name
    Phone Number : $phonenum
    Age          : $age
    Height       : $height
    Weight       : $weight
    Address      : $address
    Hobbies      : ${hobbies.join(', ')}

    ******************************
  ''';
  print(biodata);
}
