import 'package:flutter/material.dart';
import 'package:flutter_first_app/ui/auth/registration_page.dart';
import 'package:flutter_first_app/ui/layout/sidebar.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}

class LoginDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: Text("Login page")),
      ),
      drawer: Sidebar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60.0, bottom: 30.0),
              child: Center(
                child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: Colors.greenAccent, width: 2.0),
                        image: DecorationImage(
                            image: AssetImage('assets/asset/images/index.jpg'),
                            fit: BoxFit.fitWidth))),
                /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                // child: Image.asset('assets/asset/images/index.jpg')),
              ),
            ),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _loginFormKey = GlobalKey<FormState>();

  final List<TextEditingController> loginController = [
    TextEditingController(), // email
    TextEditingController() // password
  ];

  @override
  void dispose() {
    for (var c in loginController) {
      c.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginFormKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: TextFormField(
                controller: loginController[0],
                validator: MultiValidator([
                  RequiredValidator(errorText: 'indirizzo email obbligatorio'),
                  EmailValidator(errorText: 'indirizzo email non valido')
                ]),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: TextFormField(
                controller: loginController[1],
                validator: MultiValidator([
                  RequiredValidator(errorText: 'password obbligatoria'),
                  MinLengthValidator(5,
                      errorText:
                          'la password non rispetta la lunghezza minima (5 caratteri)')
                ]),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    labelText: 'Password',
                    hintText: 'Enter valid password as Pass.123'),
                obscureText: true,
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 2, left: 10),
                      child: Text('password dimenticata?',
                          style: TextStyle(color: Colors.blueGrey)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2, right: 10),
                      child: Text(
                        'Registrati!',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                width: 250,
                child: ElevatedButton(
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(200, 40)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)))),
                  onPressed: () {
                    if (!_loginFormKey.currentState!.validate()) {}
                    print(
                        "${loginController[0].text} ${loginController[1].text}");
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const RegistrationPage()));
                  },
                  child: Text('Login'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
