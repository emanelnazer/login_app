
import 'package:flutter/material.dart';
import 'package:login/Widgets/customtextfield.dart';
import 'package:login/screen/chatscreen.dart';
import 'package:login/services/auth.dart';



class LoginScreen extends StatefulWidget {
  static String id='LoginScreen';
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String _email, pass;

  final adminPassword = 'Admin1234';
  final _auth = Auth();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 50),
            height: MediaQuery.of(context).size.height * 0.3,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image(image: AssetImage("images/icons/buyicon.png")),
                Positioned(
                  bottom: 0,
                  child: Text("Buy it", style: TextStyle(fontFamily: 'Pacifico')),
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.02),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Form(
              key: widget.globalKey,
              child: Column(
                children: [
                  CustomTextField(
                        (value) {
                      _email = value ?? '';  // ضمان عدم وجود قيمة فارغة
                    },
                    "Enter Your email",
                    Icons.email,
                    //validator: (value) => value == null || value.isEmpty ? 'Please enter your email' : null,
                  ),
                  SizedBox(height: height * 0.02),
                  CustomTextField(
                        (value) {
                      pass = value ?? '';  // ضمان عدم وجود قيمة فارغة
                    },
                    "Enter Your Password",
                    Icons.lock,
                    // validator: (value) => value == null || value.isEmpty ? 'Please enter your password' : null,
                    // obscureText: true,
                  ),
                  SizedBox(height: height * 0.05),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 120.0),
                    child: Builder(
                      builder: (context) => FlatButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        onPressed: () async{
                          try{
                            final user=await _auth.signin( _email, pass);
                            if (user!=null){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen()));
                            }
                          }catch(e){
                            print(e);
                          }
                        },
                        color: Colors.black,
                        child: Text("Login", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account", style: TextStyle(color: Colors.white, fontSize: 16)),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/p1");
                        },
                        child: Text("Sign Up", style: TextStyle(color: Colors.black, fontSize: 16)),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
