import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:terez/core/constant/appColors.dart';
import 'package:terez/view/widgets/Trips/enrollement/EnrolllementTextField.dart';

class EnrollementScreen extends StatelessWidget {
  const EnrollementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enrollement info"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              EnrollementTextField(
                label: "number of people",
                hint: "number of people you want to reserve for?",
                icon: Icon(Icons.people_outline),
                myController: null,
                valid: null,
              ),
              SizedBox(
                height: 20,
              ),
              EnrollementTextField(
                label: "Names",
                hint: "All the names separated with ',' ",
                icon: Icon(Icons.book_online_outlined),
                myController: null,
                valid: null,
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                child: Text(
                  "Your Enrollement will cost:",
                  style: TextStyle(
                      color: AppColors.blackCurrant,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  "900,000" + " S.p",
                  style: TextStyle(
                      color: AppColors.blackCurrant,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              EnrollementTextField(
                label: "E-Wallet number",
                hint: "0000-0000-0000 ",
                icon: Icon(Icons.wallet_outlined),
                myController: null,
                valid: null,
              ),
              SizedBox(
                height: 20,
              ),
              EnrollementTextField(
                label: "E-Wallet Password",
                hint: "******** ",
                icon: Icon(Icons.key_outlined),
                myController: null,
                valid: null,
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: null,
                  // onPressed: EnrollementLogic(
                  //Enrollement Logic here
                  //check for available seats and send back a message if not
                  //check the wwaalet number and oassword and send back
                  //show if done or no
                  //if done send the trip to show it in the log list
                  //     ),
                  child: Container(
                    width: 150,
                    height: 50,
                    child: Center(child: Text("Enroll")),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
