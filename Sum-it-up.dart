import 'dart:io';

void main() {
  stdout.write("\nEnter the 1st number: ");
  String? finput = stdin.readLineSync();
  double? fnum = double.tryParse(finput ?? '0');

  stdout.write("Enter the 2nd number: ");
  String? sinput = stdin.readLineSync();
  double? snum = double.tryParse(sinput ?? '0');

  double sum = (fnum ?? 0) + (snum ?? 0);

  String resultMessage = "\nThe sum of $fnum and $snum is $sum.";
  print(resultMessage);
}
