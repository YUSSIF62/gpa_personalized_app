import 'package:flutter/material.dart';

class Forgetpassword extends StatelessWidget {
  const Forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50, right: 10, left: 10, bottom: 10),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "GPA GOAL ACHIEVER",
              style: TextStyle(fontSize: 20, color: Colors.blueAccent),
            ),
            SizedBox(
              height: 100,
            ),
            Text(
              "Reset Your Password",
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Enter Email',
                  //labelText: 'Enter Email or password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 70,
            ),
            ElevatedButton(
                onPressed: () {
                  // Navigator.pushNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  'Send Code',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  child: Text(
                    "Return to login page",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                InkWell(
                  child: Text("sign In"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
