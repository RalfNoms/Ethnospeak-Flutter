import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
 
 void _showLogoutConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Logout Confirmation"),
          content: const Text("Do you really want to logout?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("No"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/Login', (route) => false);
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCD0D0),
     appBar: AppBar(
       backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: const Column(
        children: [
          Text("Ethnolinguistics", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
          Text("Language Learning", style: TextStyle(fontSize: 15),)
        ],
      ),
     ),
    endDrawer: Drawer(
  child: Container(
    decoration: const BoxDecoration(
      color: Color(0xFFDCD0D0),// Set the background color
    ),
    child: ListView(
      children: [
        const SizedBox(height: 40),
        ListTile(
          leading: const Icon(Icons.account_circle_rounded),
          title: const Text("Profile", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          
          onTap: () {
            Navigator.pushNamed(context, '/profile');
          },
        ),
        ListTile(
          leading: const Icon(Icons.exit_to_app_sharp),
          title: const Text("Logout",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          onTap: () {
            Navigator.pushNamed(context, '/Login');
          },
        ),
      ],
    ),
  ),
),
       //Horizontal Selection Button
     body: SingleChildScrollView(
  child: Center(
    child: SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Image(image: AssetImage("assets/images/images.png")),
              const SizedBox(height: 10),
            Padding(
  padding: const EdgeInsets.all(5.0),
  child: SizedBox(
    height: 55,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        // History Button
        SizedBox(
          height: 60,
          width: 180,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFDCD0D0),
              border: const Border(bottom: BorderSide(color: Colors.black, width: 5)),
              borderRadius: BorderRadius.circular(2),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Dictionary');
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              child: const Text(
                "HISTORY",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
        
        const SizedBox(width: 9), // Add horizontal spacing between buttons

        // Vocabulary Button
        SizedBox(
          height: 60,
          width: 180,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFDCD0D0),
              border: const Border(bottom: BorderSide(color: Colors.black, width: 5)),
              borderRadius: BorderRadius.circular(2),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/vocabul');
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              child: const Text(
                "VOCABULARY",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 9), // Add horizontal spacing between buttons

        // Activity Button
        SizedBox(
          height: 60,
          width: 180,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFDCD0D0),
              border: const Border(bottom: BorderSide(color: Colors.black, width: 5)),
              borderRadius: BorderRadius.circular(2),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Activity');
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              child: const Text(
                "ACTIVITY",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 9), // Add horizontal spacing between buttons

        // Text Translation Button
        SizedBox(
          height: 60,
          width: 220,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFDCD0D0),
              border: const Border(bottom: BorderSide(color: Colors.black, width: 5)),
              borderRadius: BorderRadius.circular(2),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/translatetext');
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              child: const Text(
                "TEXT TRANSLATION",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 9), // Add horizontal spacing between buttons

        // Speech Translation Button
        SizedBox(
          height: 60,
          width: 250,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFDCD0D0),
              border: const Border(bottom: BorderSide(color: Colors.black, width: 5)),
              borderRadius: BorderRadius.circular(2),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/translate');
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              child: const Text(
                "SPEECH TRANSLATION",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  ),
),

            const SizedBox(height: 15),

            //The bottom Body of home page
             const SingleChildScrollView(
  child: Stack(
    children: [
      Image(
        image: AssetImage("assets/images/klata.png"),
        fit: BoxFit.cover,
      ),
      Positioned.fill(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 40.0), // Add space here
            child: Text(
              "For indigenous communities, the use of mobile technology is more than just convenient; it is an essential strategy for cultural preservation and linguistic revitalization. As more educational institutions embrace mobile technologies, the tools' potential to support both language acquisition and cultural integration grows significantly.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 19,
              ),
              textAlign: TextAlign.center, // Optional for better alignment
            ),
          ),
        ),
      ),
    ],
  ),
)

            
            
          
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