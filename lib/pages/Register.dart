import 'package:capstone_project/pages/Data_services/DatabaseServices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  
  final DatabaseServices databaseServices = DatabaseServices();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordController1 = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController birthdateController = TextEditingController();

final FocusNode passwordFocusNode1 = FocusNode();
  bool _isObscure = true;
  bool _isObscure1 = true;
  bool _isPasswordMatching = true;
  bool  username = true;
  


// Function to check if passwords match
void _matchPassword() {
    setState(() {
      // Update _isPasswordMatching status
      _isPasswordMatching = passwordController1.text == passwordController.text;
    });
   
  }

  void validateUsername(String input){
     
  
}


   // New controller for birthdate
  // This variable stores the selected date.
  DateTime? _selectedDate;

  // Function to display Cupertino Date Picker using BottomSheet
  void _showDatePicker(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,  // Allow the modal to take flexible height
    builder: (BuildContext context) {
      return FractionallySizedBox(
        heightFactor: 0.4,  // Adjust the height factor as per requirement
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(10),
                child: TextButton(
                  child: const Text("SET"),
                  onPressed: () {
                    Navigator.of(context).pop();
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
void addUserData() async {
  DatabaseServices databaseServices = DatabaseServices();

 // Check if passwords match
  _matchPassword(); // This will update _isPasswordMatching based on the current input
  if (!_isPasswordMatching) {
    Fluttertoast.showToast(
      msg: "Confirm password does not match!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
    return; // Stop further execution if passwords don't match
  }
  // Validate all fields
  if (usernameController.text.isEmpty ||
      passwordController.text.isEmpty ||
      passwordController1.text.isEmpty ||
      firstNameController.text.isEmpty ||
      lastNameController.text.isEmpty ||
      ageController.text.isEmpty ||
      addressController.text.isEmpty ||
      birthdateController.text.isEmpty) {
    
    // Show error message if any field is empty
    Fluttertoast.showToast(
          msg: "Required Input Fields",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    return;
  }

  // If all fields are filled, continue to save the data
  Map<String, dynamic> usersInfoMap = {
    "username": usernameController.text,
    "password": passwordController.text,
    "confirmPassword": passwordController1.text,
    "firstname": firstNameController.text,
    "lastname": lastNameController.text,
    "age": ageController.text,
    "address": addressController.text,
    "birthdate": birthdateController.text,
  };
 
  String id = "userInformation"; 

  // Call the insertUsers method to insert the data
await databaseServices.insertUsers(usersInfoMap, id).then((value) {
  print("User successfully added!"); // Check if this gets printed
   Fluttertoast.showToast(
         msg: "You Successfully Registered ${usernameController.text}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );

  // Clear fields
  usernameController.clear();
  passwordController.clear();
  passwordController1.clear();
  firstNameController.clear();
  lastNameController.clear();
  ageController.clear();
  addressController.clear();
  birthdateController.clear();
  setState(() {
    _selectedDate = null;
  });
  

  // Navigate after successful registration
    Navigator.pushReplacementNamed(context, '/Login');
}).catchError((error) {
  print("Failed to add user: $error"); // Check for any error
   Fluttertoast.showToast(
          msg: "You Failed to Registered!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
});
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCD0D0),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: ListView(
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Create New Account",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    //User Name
                    const SizedBox(height: 20),
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "USER NAME",
                          style: TextStyle(color: Colors.black,),
                        )),
                    const SizedBox(height: 10),
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        hintText: "Input User name",
                        filled: true,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        fillColor: Colors.white.withOpacity(0.2),
                      ),
                    ),
                  /// Input Password
      const SizedBox(height: 10),
      const Text(
        "PASSWORD",
        style: TextStyle(color: Colors.black,),
      ),
      const SizedBox(height: 10),
      TextField(
        controller: passwordController,
        obscureText: _isObscure,
        onChanged: (value) {
          _matchPassword();  // Dynamically check if passwords match
        },
        decoration: InputDecoration(
          hintText: "Input Password",
          suffixIcon: IconButton(
            icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            },
          ),
          filled: true,
          fillColor: Colors.white.withOpacity(0.2),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              color: Colors.black, // Default border color
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
      /// Confirm Password
      const SizedBox(height: 10),
      const Text(
        "CONFIRM PASSWORD",
        style: TextStyle(color: Colors.black,),
      ),
      const SizedBox(height: 10),
      TextField(
        controller: passwordController1,
        obscureText: _isObscure1,
        onChanged: (value) {
          _matchPassword();  // Dynamically check if passwords match
        },
        decoration: InputDecoration(
          hintText: "Confirm Password",
          suffixIcon: IconButton(
            icon: Icon(_isObscure1 ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _isObscure1 = !_isObscure1;
              });
            },
          ),
          filled: true,
          fillColor: Colors.white.withOpacity(0.2),
          enabledBorder: const OutlineInputBorder(
            borderRadius:  BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              color: Colors.black, // Default border color
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              color: _isPasswordMatching ? Colors.green : Colors.red, // Change color when focused
              width: 2.0,
            ),
          ),
        ),
      ),
                
                  ///First Name
                    const SizedBox(height: 10),
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "FIRST NAME",
                          style: TextStyle(color: Colors.black,),
                        )),
                    const SizedBox(height: 10),
                    TextField(
                      controller: firstNameController,
                      decoration: InputDecoration(
                        hintText: "Input First Name",
                        filled: true,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        fillColor: Colors.white.withOpacity(0.2),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "LAST NAME",
                          style: TextStyle(color: Colors.black,),
                        )),
                    const SizedBox(height: 10),
                    TextField(
                      controller: lastNameController,
                      decoration: InputDecoration(
                        hintText: "Input Last Name",
                        filled: true,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        fillColor: Colors.white.withOpacity(0.2),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "AGE",
                          style: TextStyle(color: Colors.black,),
                        )),
                    const SizedBox(height: 10),
                    TextField(
                      controller: ageController,
                      decoration: InputDecoration(
                        hintText: "Input Age",
                        filled: true,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        fillColor: Colors.white.withOpacity(0.2),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "BIRTHDATE",
                          style: TextStyle(color: Colors.black,),
                        )),
                    const SizedBox(height: 10),
                    TextField(
                      controller: birthdateController,
                      readOnly: true, // User cannot type manually
                      decoration: InputDecoration(
                        hintText: "Input Birthdate",
                        filled: true,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        fillColor: Colors.white.withOpacity(0.2),
                      ),
                      onTap: () {
                        _showDatePicker(context); // Show the Cupertino Date Picker
                      },
                    ),
                    const SizedBox(height: 10),
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "ADDRESS",
                          style: TextStyle(color: Colors.black,),
                        )),
                    const SizedBox(height: 10),
                    TextField(
                      controller: addressController,
                      decoration: InputDecoration(
                        hintText: "Input Address",
                        filled: true,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        fillColor: Colors.white.withOpacity(0.2),
                      ),
                    ),
                    const SizedBox(height: 45),
                    SizedBox(
                      height: 50,
                      width: 255,
                      child: ElevatedButton(
                          onPressed: () {
                        addUserData();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black.withOpacity(0.1),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(13)),
                            ),
                          ),
                          child: const Text(
                            "Register",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          )),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already Registered?",
                          style: TextStyle(fontSize: 15),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/Login');
                            },
                            child: const Text(
                              "Sign In",
                              style: TextStyle(fontSize: 15, color: Colors.red),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}