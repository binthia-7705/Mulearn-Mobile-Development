import 'dart:io';

class Car {
  String name;
  double price;

  Car(this.name, this.price);

  //Function to change the price of the car
  void changePrice(double newPrice) {
    price = newPrice;
    print('The price of $name has been updated to \$$price.');
  }
}

class Person {
  String name;
  List<Car> ownedCars = [];
  double moneyLeft;

  Person(this.name, this.moneyLeft);

  //Function to buy a car
  void buyCar(Car car) {
    if (moneyLeft >= car.price) {
      ownedCars.add(car);
      moneyLeft -= car.price;
      //Message to display after buying a car
      print(
        'Great choice, $name! You just bought a ${car.name} for ${car.price}. \nYou now have \$$moneyLeft left.',
      );
    }
    //Message to display if the user doesn't have enough money to buy a car
    else {
      print('Oops! $name, you don’t have enough money to buy a ${car.name}.');
    }
  }

  //Function to sell a car
  void sellCar(Car car) {
    if (ownedCars.contains(car)) {
      ownedCars.remove(car);
      moneyLeft += car.price;
      //Message to display after selling a car
      print(
        'You sold your ${car.name} for ${car.price}. \nNow you have \$$moneyLeft in your pocket.',
      );
    }
    //Message to display if the user doesn't own any cars to sell
    else {
      print('$name, you don’t own a ${car.name} to sell!');
    }
  }
}

void main() {
  //Welcome message
  print('Welcome to the Car Buying and Selling Platform!\n');

  //Read name and money from user
  stdout.write('Enter your name: ');
  String userName = stdin.readLineSync()!;
  stdout.write('Enter the amount of money you have: \$');
  double userMoney = double.parse(stdin.readLineSync()!);
  Person user = Person(userName, userMoney);

  Car toyota = Car('Toyota Camry', 25000);
  Car honda = Car('Honda Civic', 20000);
  Car ford = Car('Ford Mustang', 30000);
  Car audi = Car('Audi A4', 40000);
  Car bmw = Car('BMW 3 Series', 45000);
  while (true) {
    // Display the options and get the user’s choice
    String operation = '''
        \nHere’s what you can do:
      1. Buy a car
      2. Change car price
      3. Sell a car
      4. List owned cars
      5. Exit''';
    print(operation);
    stdout.write('What would you like to do? Enter a number: ');
    int choice = int.parse(stdin.readLineSync()!);

    //Buy a car
    if (choice == 1) {
      print('\nAvailable Cars:');
      print('1. ${toyota.name} - \$${toyota.price}');
      print('2. ${honda.name} - \$${honda.price}');
      print('3. ${ford.name} - \$${ford.price}');
      print('4. ${audi.name} - \$${audi.price}');
      print('5. ${bmw.name} - \$${bmw.price}');
      stdout.write('Which car would you like to buy? Enter the car number: ');
      int carChoice = int.parse(stdin.readLineSync()!);
      if (carChoice == 1) {
        user.buyCar(toyota);
      } else if (carChoice == 2) {
        user.buyCar(honda);
      } else if (carChoice == 3) {
        user.buyCar(ford);
      } else if (carChoice == 4) {
        user.buyCar(audi);
      } else if (carChoice == 5) {
        user.buyCar(bmw);
      } else {
        print('Hmm... That’s not a valid option. Try again!');
      }
    }
    //Change car price
    else if (choice == 2) {
      print('\nWhich car’s price do you want to change?');
      print('1. ${toyota.name}');
      print('2. ${honda.name}');
      print('3. ${ford.name}');
      print('4. ${audi.name}');
      print('5. ${bmw.name}');
      stdout.write('Enter the car number: ');
      int carChoice = int.parse(stdin.readLineSync()!);
      //Set the new price
      stdout.write('Enter the new price: ');
      double newPrice = double.parse(stdin.readLineSync()!);
      if (carChoice == 1) {
        toyota.changePrice(newPrice);
      } else if (carChoice == 2) {
        honda.changePrice(newPrice);
      } else if (carChoice == 3) {
        ford.changePrice(newPrice);
      } else if (carChoice == 4) {
        audi.changePrice(newPrice);
      } else if (carChoice == 5) {
        bmw.changePrice(newPrice);
      } else {
        print('Invalid choice. Try again.');
      }
    }
    //Sell a car
    else if (choice == 3) {
      if (user.ownedCars.isNotEmpty) {
        print('\nHere are your cars, $userName:');
        for (int i = 0; i < user.ownedCars.length; i++) {
          print('${i + 1}. ${user.ownedCars[i].name}');
        }
        //Choose the car to sell
        stdout.write(
          'Which one would you like to sell? Enter the car number: ',
        );
        int sellChoice = int.parse(stdin.readLineSync()!);
        if (sellChoice >= 1 && sellChoice <= user.ownedCars.length) {
          user.sellCar(user.ownedCars[sellChoice - 1]);
        } else {
          print('Invalid choice. Try again.');
        }
      } else {
        print('\n$userName, you don’t have any cars to sell yet!');
      }
    }
    //List owned cars
    else if (choice == 4) {
      if (user.ownedCars.isNotEmpty) {
        print('\nHere are your cars, $userName:');
        for (int i = 0; i < user.ownedCars.length; i++) {
          print('${i + 1}. ${user.ownedCars[i].name}');
        }
      } else {
        print('\n$userName, you don’t have any cars yet!');
      }
    }
    //Exit
    else if (choice == 5) {
      print(
        'Thanks for visiting the Car Buying and Selling Platform, $userName! Drive safe! \nExiting...',
      );
      break;
    }
    //Invalid choice from user
    else {
      print('Invalid option. Try again!');
    }
  }
}
