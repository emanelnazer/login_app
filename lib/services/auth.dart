import 'package:firebase_auth/firebase_auth.dart';

class Auth{
final _auth=FirebaseAuth.instance;

   signup(String email,String pass) async {
     final authresult =await _auth.createUserWithEmailAndPassword(email: email, password: pass);
     return authresult;
   }

    signin(String email,String pass) async {
  final authresult =await _auth.signInWithEmailAndPassword(email: email, password: pass);
  return authresult;
}
}