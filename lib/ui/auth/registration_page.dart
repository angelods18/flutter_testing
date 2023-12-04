import 'package:flutter/material.dart';
import 'package:flutter_first_app/ui/auth/login_page.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Registration(),
    );
  }
}

class Registration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const LoginPage()));
          },
        ),
        title: Center(child: Text("Registration page")),
      ),
      body: SingleChildScrollView(
        child: Column(children: [RegistrationForm()]),
      ),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  RegistrationFormState createState() {
    return RegistrationFormState();
  }
}

class RegistrationFormState extends State<RegistrationForm> {
  final _regFormKey = GlobalKey<FormState>();

  bool _checkBoxStatus = false;

  final List<TextEditingController> regController = [
    TextEditingController(), // email
    TextEditingController(), // password
    TextEditingController() // confirm password
  ];

  @override
  void dispose() {
    for (var c in regController) {
      c.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _regFormKey,
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: SizedBox(width: 70, child: Text('Email:')),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: SizedBox(
                      width: 250,
                      child: TextFormField(
                        controller: regController[0],
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText: 'indirizzo email obbligatorio'),
                          EmailValidator(
                              errorText: 'indirizzo email non valido')
                        ]),
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Inserisci il tuo indirizzo email',
                            hintText: 'esempio: abc@gmail.com'),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: SizedBox(width: 70, child: Text('Password:')),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: SizedBox(
                      width: 250,
                      child: TextFormField(
                        controller: regController[0],
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'password obbligatoria'),
                        ]),
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Inserisci la tua password',
                            hintText: 'esempio: Pass.123'),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child:
                        SizedBox(width: 70, child: Text('Conferma Password:')),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: SizedBox(
                      width: 250,
                      child: TextFormField(
                        controller: regController[0],
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'password obbligatoria'),
                        ]),
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Inserisci la tua password',
                            hintText: 'esempio: Pass.123'),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: SizedBox(
                      width: 250,
                      child: Text(
                          'Confermo di aver letto le condizioni per il trattamento dati'),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: SizedBox(
                        width: 50,
                        child: Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          value: _checkBoxStatus,
                          onChanged: ((bool? value) {
                            print("status: $value");
                            setState(() {
                              _checkBoxStatus = value!;
                            });
                          }),
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
              child: SizedBox(
                width: 300,
                child: ElevatedButton(
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(200, 40)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)))),
                  onPressed: () {
                    if (!_regFormKey.currentState!.validate()) {}
                    print("${regController[0].text} ${regController[1].text}");
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const RegistrationPage()));
                  },
                  child: Text('Registrati!'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
