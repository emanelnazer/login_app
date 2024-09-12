import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final dynamic onclick;
   dynamic _errorMessage(String str){
    switch (hint) {
      case 'Enter your name':
        return 'Name is empty !';
      case 'Enter your email':
        return 'Email is empty !';
      case 'Enter your password':
        return 'Password is empty !';
    }
  }
  CustomTextField(@required this.onclick,@required this.hint, @required this.icon);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:(value)  {
        if (value!.isEmpty) {
          return _errorMessage(hint);
          // ignore: missing_return
        }
      },
      obscureText: hint == 'Enter your password' ? true : false,
      onSaved:onclick,
      decoration: InputDecoration(
        prefixIcon: Icon(icon,color: Colors.greenAccent,),
        hintText:hint,
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.white),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.white)),
      ),
    );
  }
}