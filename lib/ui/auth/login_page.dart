import 'package:flutter/material.dart';
import 'package:flutter_first_app/ui/commons/rounded_image.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:go_router/go_router.dart';

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
      // appBar: AppBar(
      //   title: Center(child: Text("Login page")),
      // ),
      // drawer: Sidebar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            RoundedImage(
                pathToImage: 'assets/asset/images/index.jpg', dimension: 80),
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
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
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
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 2, left: 5),
                      child: Text('password dimenticata?',
                          style: TextStyle(color: Colors.blueGrey)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2, right: 5),
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
                    // context.go('/registration');
                    context.pushReplacement('/registration');
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
