import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'package:myapp/api_connection/api_connection.dart';
import 'package:myapp/model/api_model.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Lotzo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      //home: MyHomePage(title: 'Login Page'),
      home: LoginDemo("Hola"),
    );
  }
}





class LoginDemo extends StatefulWidget {
  final String myVar;
  const LoginDemo(this.myVar, {Key? key}): super(key: key);
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  final userControler = TextEditingController();
  final passControler = TextEditingController();
  //late UserLogin myUserLogin;
  final myUserLogin = UserLogin(username: "hola",password: "mundo");

  //UserLogin userToValidate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset("asset/images/flutter-logo.png")),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: userControler,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User',
                    hintText: 'Enter your user name or email'),
                    
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(

                obscureText: true,
                controller: passControler, 
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password',
                    
                    ),
              ),
            ),
            TextButton(
              onPressed: (){
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  print(userControler.text);
                  print(passControler.text);
                  myUserLogin.username=userControler.text;
                  myUserLogin.password=passControler.text;
                  final myValidate = getToken(myUserLogin);
                  print(myValidate.toString());
                  if (myValidate.toString() != ""){
                    Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HomePage()));
                      }
                  else {
                    Navigator.pop(context);
                  }
                    
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
            Text('New User? Create Account')
          ],
        ),
      ),
    );
  }
}