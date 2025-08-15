import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool _isObscure = true;
  

  Future<void> checkLoginCredentials() async {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    // Check if fields are not empty
    if (username.isEmpty || password.isEmpty) {
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
    try {
      // Get all documents from the "Users" collection
      QuerySnapshot querySnapshot = await _firestore.collection('Users').get();

      bool loginSuccess = false;

      // Iterate through each document to check if credentials match
      for (var doc in querySnapshot.docs) {
        var userData = doc.data() as Map<String, dynamic>;

        if (userData['username'] == username && userData['password'] == password) {
          loginSuccess = true;
          break;
        }
      }

      if (loginSuccess) {
        // If login is successful
       Fluttertoast.showToast(
          msg: "Successfully Login $username",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );

        // Navigate to your bottom tab or any other screen here
       Navigator.pushReplacementNamed(context, '/Home');
      } else {
        // If login fails
       Fluttertoast.showToast(
          msg: "Invalid Username or Password!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      }
    } catch (e) {
      print("Error: $e");
      Fluttertoast.showToast(
          msg: "Failed to Login!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCD0D0),
      resizeToAvoidBottomInset: true, // Ensures layout adjusts when keyboard is visible
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Container(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                const  SizedBox(height: 135,
                   child: Image(image: AssetImage("assets/images/logo Enthospeak.png"),
                   ),
                 ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Sign in to continue",
                      style: TextStyle(color: Colors.black, fontSize: 23),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "USERNAME",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      hintText: "Username",
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                    ),
                  ),
                  const SizedBox(height: 20), // Added more space between fields
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "PASSWORD",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: passwordController,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      hintText: "Password",
                       suffixIcon: IconButton(
                  icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),      
                   border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                    ),
                  ),
                   const SizedBox(height: 20),  // Pushes button to the bottom
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black.withOpacity(0.1),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(13)),
                        ),
                      ),
                      onPressed: checkLoginCredentials,
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 23),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(fontSize: 15),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/Register');
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 15, color: Colors.red ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50), // Extra space to prevent keyboard overlap
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}