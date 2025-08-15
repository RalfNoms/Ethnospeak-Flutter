import 'package:capstone_project/pages/Data_services/DatabaseServices.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final DatabaseServices databaseServices = DatabaseServices();

  // Text controllers for each input field
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController birthdateController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  bool _isObscure = true; // Variable to toggle password visibility
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }
  // Function to display Cupertino Date Picker using BottomSheet
 void _showDatePicker(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return FractionallySizedBox(
        heightFactor: 0.4,
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(10),
                child: TextButton(
                  child: const Text("Done"),
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Update the birthdate field in Firestore when done
                  },
                ),
              ),
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: _selectedDate ?? DateTime.now(),
                  onDateTimeChanged: (DateTime newDate) {
                    setState(() {
                      _selectedDate = newDate;
                      birthdateController.text =
                          "${_selectedDate?.month}/${_selectedDate?.day}/${_selectedDate?.year}";
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

  // Method to load user data from Firestore
  void _loadUserData() async {
    String userId = "userInformation"; // Use the actual user ID here
    Map<String, dynamic>? userData = await databaseServices.getUserData(userId);

    if (userData != null) {
      setState(() {
        usernameController.text = userData['username'] ?? '';
        passwordController.text = userData['password'] ?? '';
        firstNameController.text = userData['firstname'] ?? '';
        lastNameController.text = userData['lastname'] ?? '';
        ageController.text = userData['age'] ?? '';
        birthdateController.text = userData['birthdate'] ?? '';
        addressController.text = userData['address'] ?? '';
      });
    } else {
      print("Error User Found");
      // Handle the case when the user data is not found
      Fluttertoast.showToast(
          msg: "User Not Found",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

 
 void _updateField(Map<String, dynamic> usersInfoMap) async {
  String userId = "userInformation"; // Replace with actual user ID logic

  try {
    // Call the DatabaseServices method to update the document
    await databaseServices.updateUserFields(userId, usersInfoMap);

    // Display success toast
    Fluttertoast.showToast(
      msg: "You successfully updated ${usernameController.text}",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  } catch (e) {
    // Display failure toast
    Fluttertoast.showToast(
      msg: "Failed to Update: ${e.toString()}",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.transparent,
          leading:  IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
          ),
      ),
      backgroundColor: const Color(0xFFDCD0D0),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom, // Adjusts for the keyboard
                    left: 20.0,
                    right: 20.0,
                    top: 20.0,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       const  Text("Profile Page", style: TextStyle(
                        fontSize: 23, fontWeight: FontWeight.bold,
                       ),),
                        const SizedBox(height: 30),
            TextField(
  controller: usernameController,
  decoration: InputDecoration(
    hintText: "Username",
    filled: true,
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    fillColor: Colors.white.withOpacity(0.2),
  ),
),

const SizedBox(height: 15),

TextField(
  controller: passwordController,
  obscureText: _isObscure, // Toggles password visibility
  decoration: InputDecoration(
    suffixIcon: IconButton(
      icon: Icon(
        _isObscure
            ? FluentSystemIcons.ic_fluent_eye_show_filled
            : FluentSystemIcons.ic_fluent_eye_hide_filled,
      ),
      onPressed: () {
        setState(() {
          _isObscure = !_isObscure;
        });
      },
    ),
    hintText: "Password",
    filled: true,
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    fillColor: Colors.white.withOpacity(0.2),
  ),
),

const SizedBox(height: 15),

TextField(
  controller: firstNameController,
  decoration: InputDecoration(
    hintText: "First Name",
    filled: true,
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    fillColor: Colors.white.withOpacity(0.2),
  ),
),

const SizedBox(height: 15),

TextField(
  controller: lastNameController,
  decoration: InputDecoration(
    hintText: "Last Name",
    filled: true,
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    fillColor: Colors.white.withOpacity(0.2),
  ),
),

const SizedBox(height: 15),

TextField(
  controller: ageController,
  decoration: InputDecoration(
    hintText: "Age",
    filled: true,
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    fillColor: Colors.white.withOpacity(0.2),
  ),
),

const SizedBox(height: 15),

TextField(
  controller: birthdateController,
  decoration: InputDecoration(
    hintText: "Birthdate",
    filled: true,
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    fillColor: Colors.white.withOpacity(0.2),
  ),
  onTap: () {
    _showDatePicker(context);
  },
),

const SizedBox(height: 15),

TextField(
  controller: addressController,
  decoration: InputDecoration(
    hintText: "Address",
    filled: true,
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    fillColor: Colors.white.withOpacity(0.2),
  ),
),
                    const SizedBox(height: 15),
                 SizedBox(
  height: 50,
  width: 255,
  child: ElevatedButton(
    onPressed: () {
      // Create a map of updated user information
      final Map<String, dynamic> usersInfoMap = {
        "username": usernameController.text,
        "password": passwordController.text,
        "firstname": firstNameController.text,
        "lastname": lastNameController.text,
        "age": ageController.text,
        "birthdate": birthdateController.text,
        "address": addressController.text,
      };

      // Call the update method
      _updateField(usersInfoMap);
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black.withOpacity(0.1),
    ),
    child: const Text(
      "Update",
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
    ),
  ),
),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

