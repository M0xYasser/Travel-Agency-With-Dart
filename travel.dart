import 'dart:io';

//test
void main() {
  Trip trip = new Trip();
  while (true) {
    stdout.write(
        "\n************************************************************\n\t\t\t\t\tTravel Agency Menu :\n************************************************************\n\n[1] Add Trip\n[2] Edit Trip\n[3] Delete Trip\n[4] View Trip\n[5] Search Trip\n[6] Reserve\n[7] View Passengers\n[8] Latest 10 Trips\nChoose one: ");
    int c = int.parse(stdin.readLineSync());
    trip.discount();
    switch (c) {
      case 1:
        trip.addTrip();
        break;
      case 2:
        trip.editTrip();
        break;
      case 3:
        trip.deleTrip();
        break;
      case 4:
        trip.viewTrip();
        break;
      case 5:
        trip.searchTrip();
        break;
      case 6:
        trip.reserveTrip();
        break;
      case 7:
        trip.viewPassengers();
        break;
      case 8:
        trip.latestTrips();
        break;
    }
  }
}

class Trip {
  // List

  List<int> ID = [1, 2, 3, 4, 5];
  List<double> PRICE = [100, 200, 300, 400, 500];
  List<int> PASSLIM = [10, 20, 30, 40, 50];
  List<String> LOCATION = ["Spain", "Canada", "london", "Australia", "paris"];
  List<String> DATE = [
    "2021-12-23",
    "2021-12-05",
    "2021-08-04",
    "2021-06-13",
    "2021-12-02"
  ];
  List<String> sortDATE = [
    "2021-12-23",
    "2021-12-05",
    "2021-08-04",
    "2021-06-13",
    "2021-12-02"
  ];
  var passengers = <int, List<String>>{
    1: ['ramy', 'Hank'],
    2: ['Frank', 'Edward', 'Reuben'],
    3: ['yasser'],
    4: ['mohamed'],
    5: ['mostafa']
  };
  var numberL = <int, List<String>>{
    1: ["01200000000", '01222222222'],
    2: ['01233333333', '01244444444', '01255555555'],
    3: ["01299999999"],
    4: ["01511111111"],
    5: ["01522222222"]
  };
  var emailL = <int, List<String>>{
    1: ["ramy@gmail.com", 'Hank@gmail.com'],
    2: ['Frank@gmail.com', 'Edward@gmail.com', 'Reuben@gmail.com'],
    3: ['yasser@gmail.com'],
    4: ['mohamed@gmail.com'],
    5: ['mostafa@gmail.com']
  };

  // Add Trip
  void addTrip() {
    // Input

    stdout.write("\n>> Enter ID : ");
    int id = int.parse(stdin.readLineSync());
    stdout.write(">> Enter Price : ");
    double price = double.parse(stdin.readLineSync());
    stdout.write(">> Enter Passenger Limit : ");
    int passLim = int.parse(stdin.readLineSync());
    stdout.write(">> Enter Location : ");
    String location = stdin.readLineSync();
    stdout.write(">> Enter Date :\n   ✓ Day : ");
    String day = stdin.readLineSync();
    if (int.parse(day) < 10) {
      day = "0" + day;
    }
    stdout.write("   ✓ Month : ");
    String month = stdin.readLineSync();
    if (int.parse(month) < 10) {
      month = "0" + month;
    }
    stdout.write("   ✓ Year : ");
    String year = stdin.readLineSync();
    String date = year + '-' + month + '-' + day;
    print("\nThe Trip Was Successfully Added :)");
    repeat("add");

    //add
    ID.add(id);
    PRICE.add(price);
    PASSLIM.add(passLim);
    LOCATION.add(location);
    DATE.add(date);
    sortDATE.add(date);

    // add passenger
    passengers[id] = [];
    numberL[id] = [];
    emailL[id] = [];
  }

  // repeat
  void repeat(String r) {
    String rPrint = "\n\n>> Enter (y/n) ";
    if (r == "add") {
      stdout.write(rPrint + "to Add Another Trip : ");
    } else if (r == "edit") {
      stdout.write(rPrint + "to Edit Another Trip : ");
    } else if (r == "del") {
      stdout.write(rPrint + "to Delete Another Trip : ");
    }
    String re = stdin.readLineSync();
    if (re == "y") {
      if (r == "add") {
        addTrip();
      } else if (r == "edit") {
        editTrip();
      } else if (r == "del") {
        deleTrip();
      }
    } else if (re == "n") {
    } else {
      print("ERROR !");
      repeat(r);
    }
  }

  // Edit Trip
  void editTrip() {
    showTrips();

    // Show Details
    stdout.write("\n>> Enter id to change details of Trip : ");
    int idToChange = int.parse(stdin.readLineSync());
    int indexId = ID.indexOf(idToChange);

    print("\n------------------------------------------------------------");
    print(
        "\t\t\t\t✓✓✓✓✓✓✓✓ ${LOCATION[indexId]} ✓✓✓✓✓✓✓✓\n------------------------------------------------------------\n\t\t\t  ID      ||\t\t${ID[indexId]}\n\t\t\t  Date    ||\t\t${DATE[indexId]}\n\t\t\t  Price   ||\t\t${PRICE[indexId]}\n\t\t\t  Passenger Limit   ||\t\t${PASSLIM[indexId]}");
    print("\n------------------------------------------------------------");

    // Change Details

    String z = "y";
    while (z == "y") {
      stdout.write(
          "\n   [1] Location\n   [2] Date\n   [3] Price\n   [4] Passenger Limit");

      stdout.write("\n\n>> Choose To Edit : ");
      int n = int.parse(stdin.readLineSync());

      // Update Data

      stdout.write("Enter the change : ");
      switch (n) {
        case 1:
          String location = stdin.readLineSync();
          LOCATION[indexId] = location;
          break;
        case 2:
          stdout.write("\n   ✓ Day : ");
          String day = stdin.readLineSync();
          if (int.parse(day) < 10) {
            day = "0" + day;
          }
          stdout.write("   ✓ Month : ");
          String month = stdin.readLineSync();
          if (int.parse(month) < 10) {
            month = "0" + month;
          }
          stdout.write("   ✓ Year : ");
          String year = stdin.readLineSync();
          String date = year + '-' + month + '-' + day;
          DATE[indexId] = date;
          sortDATE[indexId] = date;
          ;
          break;
        case 3:
          double price = double.parse(stdin.readLineSync());
          PRICE[indexId] = price;
          break;
        case 4:
          int passLim = int.parse(stdin.readLineSync());
          PASSLIM[indexId] = passLim;
          ;
          break;
      }
      print("\nThe Item Was Successfully Edited :)");
      stdout.write("\n\n>> Enter (y/n) to edit another item : ");
      z = stdin.readLineSync();
    }
    print("\nThe Trip Was Successfully Edited :)");
    repeat("edit");
  }

  // Show Trips
  void showTrips() {
    print("\n------------------------------------------------------------");
    for (int i = 0; i < PRICE.length; i++) {
      print(
          "\t\t\t\t✓✓✓✓✓✓✓✓ ${LOCATION[i]} ✓✓✓✓✓✓✓✓\n------------------------------------------------------------\n\t\t\t  ID      ||\t\t${ID[i]}\n\t\t\t  Date    ||\t\t${DATE[i]}\n\t\t\t  Price   ||\t\t${PRICE[i]}\n\t\t\t  Passenger Limit    ||\t\t${PASSLIM[i]}");
      print("\n------------------------------------------------------------");
    }
  }

  // Delete Trip
  void deleTrip() {
    showTrips();

    stdout.write("\n>> Enter id to Delete Trip : ");
    int idToDelete = int.parse(stdin.readLineSync());
    int indexId = ID.indexOf(idToDelete);

    // Remove Trip
    ID.removeAt(indexId);
    PRICE.removeAt(indexId);
    PASSLIM.removeAt(indexId);
    LOCATION.removeAt(indexId);
    DATE.removeAt(indexId);
    sortDATE.removeAt(indexId);
    passengers.remove((indexId + 1));

    print("\nDeleted :(");

    repeat("del");
  }

  // View Trip
  void viewTrip() {
    print("\n\n\t\tList Trips Ordered By Date :\n ");
    sortDATE.sort();
    for (int i = 0; i < DATE.length; i++) {
      for (int j = 0; j < DATE.length; j++) {
        if (DATE[j] == sortDATE[i]) {
          print(
              "\n------------------------------------------------------------");
          print(
              "\t\t\t\t✓✓✓✓✓✓✓✓ ${LOCATION[j]} ✓✓✓✓✓✓✓✓\n------------------------------------------------------------\n\t\t\t  ID      ||\t\t${ID[j]}\n\t\t\t  Date    ||\t\t${DATE[j]}\n\t\t\t  Price   ||\t\t${PRICE[j]}\n\t\t\t  Passenger Limit    ||\t\t${PASSLIM[j]}");
          print(
              "\n------------------------------------------------------------");
        }
      }
    }
  }

  // Search Trip
  void searchTrip() {
    print("\n**Search With Price**");
    stdout.write(">> Enter Price to Search : ");
    int pSearch = int.parse(stdin.readLineSync());
    //search
    for (int i = 0; i < PRICE.length; i++) {
      if (PRICE[i] == pSearch) {
        print(
            "\n\t\t\t\t✓✓✓✓✓✓✓✓ ${LOCATION[i]} ✓✓✓✓✓✓✓✓\n------------------------------------------------------------\n\t\t\t  ID      ||\t\t${ID[i]}\n\t\t\t  Date    ||\t\t${DATE[i]}\n\t\t\t  Price   ||\t\t${PRICE[i]}\n\t\t\t  Passenger Limit    ||\t\t${PASSLIM[i]}");
        print("\n------------------------------------------------------------");
      }
    }
  }

  // Reserve Trip
  void reserveTrip() {
    showTrips();

    stdout.write("\n>> Choose Trip With id : ");
    int idToreserve = int.parse(stdin.readLineSync());
    int indexId = ID.indexOf(idToreserve);
    // passengers
    if (PASSLIM[indexId] == 0) {
      print("\n\tThere Is No Place To Book :(");
    } else {
      stdout.write("Enter number of passenger : ");
      int numbers = int.parse(stdin.readLineSync());
      for (int i = 0; i < numbers; i++) {
        print(">> Passenger Info  ");
        stdout.write("   ✓ Name : ");
        String name = stdin.readLineSync();
        passengers[idToreserve].add(name);
        stdout.write("   ✓ Number : ");
        String number = stdin.readLineSync();
        numberL[idToreserve].add(number);
        stdout.write("   ✓ E-mail : ");
        String email = stdin.readLineSync();
        emailL[idToreserve].add(email);
        print("\nCongratulations, Booked Successful <3\n");
      }
      PASSLIM[indexId] -= numbers;
    }
  }

  // View Passengers
  void viewPassengers() {
    stdout.write("\n>> Enter id of Trip (Or all for all passengers): ");
    String viewId = stdin.readLineSync();

    if (viewId == "all") {
      for (int i = 0; i < ID.length; i++) {
        print("\n\n\t\t\t\t✓✓✓✓✓✓✓✓ ${LOCATION[i]} ✓✓✓✓✓✓✓✓");
        for (int j = 0; j < passengers[ID[i]].length; j++) {
          print(
              "\n------------------------------------------------------------\n\t\t\t  Passenger Name    ||\t\t${passengers[ID[i]][j]}\n\t\t\t  Number       \t\t||\t\t${numberL[ID[i]][j]}\n\t\t\t  Email       \t\t||\t\t${emailL[ID[i]][j]}");
        }
      }
    } else {
      int viewID = int.parse(viewId);
      int indexView = ID.indexOf(viewID);
      print("\n\n\t\t\t\t✓✓✓✓✓✓✓✓ ${LOCATION[indexView]} ✓✓✓✓✓✓✓✓");

      for (int i = 0; i < ID.length; i++) {
        if (ID[i] == viewID) {
          for (int j = 0; j < passengers[ID[i]].length; j++) {
            print(
                "\n------------------------------------------------------------\n\t\t\t  Passenger Name    ||\t\t${passengers[ID[i]][j]}\n\t\t\t  Number       \t\t||\t\t${numberL[ID[i]][j]}\n\t\t\t  Email       \t\t||\t\t${emailL[ID[i]][j]}");
          }
        }
      }
    }
  }

  // latest 10 Trips
  void latestTrips() {
    int count = 1;
    print("\n\t\t\t✓✓✓✓✓✓✓✓ Latest Trips ✓✓✓✓✓✓✓✓");
    print("\n------------------------------------------------------------");
    for (int i = (PRICE.length - 1); count <= 10; i--) {
      count++;
      if (i <= 0) {
        count = 11;
      }

      print(
          "\t\t\t\t✓✓✓✓✓✓✓✓ ${LOCATION[i]} ✓✓✓✓✓✓✓✓\n------------------------------------------------------------\n\t\t\t  ID      ||\t\t${ID[i]}\n\t\t\t  Date    ||\t\t${DATE[i]}\n\t\t\t  Price   ||\t\t${PRICE[i]}\n\t\t\t  Passenger Limit    ||\t\t${PASSLIM[i]}");
      print("\n------------------------------------------------------------");
    }
  }

  // Discount 20%
  void discount() {
    for (int i = 0; i < PRICE.length; i++) {
      if (PRICE[i] > 10000) {
        PRICE[i] *= 0.8;
      }
    }
  }
}
