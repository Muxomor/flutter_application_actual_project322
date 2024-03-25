import 'package:flutter/material.dart';
import 'package:flutter_application_actual_project322/database/firebase_auth/service.dart';
import 'package:flutter_application_actual_project322/database/firebase_auth/user_collection.dart';
import 'package:toast/toast.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool visibility = true;
  bool visibility1 = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passCheckController = TextEditingController();
  AuthService auth = AuthService();
  UsersCollection users = UsersCollection();
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/logo.png',
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  controller: nameController,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Name',
                    hintStyle: const TextStyle(
                      color: Colors.white54,
                    ),
                    labelStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  controller: phoneController,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    labelText: 'Номер телефона',
                    hintText: 'Номер телефона',
                    hintStyle: const TextStyle(
                      color: Colors.white54,
                    ),
                    labelStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    prefixIcon: const Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  controller: emailController,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Email',
                    hintStyle: const TextStyle(
                      color: Colors.white54,
                    ),
                    labelStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  obscureText: visibility,
                  controller: passwordController,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Password',
                    hintStyle: const TextStyle(
                      color: Colors.white54,
                    ),
                    labelStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    prefixIcon: const Icon(
                      Icons.password,
                      color: Colors.white,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            visibility = !visibility;
                          });
                        },
                        icon: !visibility
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off)),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  controller: passCheckController,
                  obscureText: visibility1,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    hintText: 'Confirm Password',
                    hintStyle: const TextStyle(
                      color: Colors.white54,
                    ),
                    labelStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    prefixIcon: const Icon(
                      Icons.password,
                      color: Colors.white,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            visibility1 = !visibility1;
                          });
                        },
                        icon: !visibility1
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off)),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.55,
                child: ElevatedButton(
                  onPressed: () async {
                    if (nameController.text.isEmpty ||
                        emailController.text.isEmpty ||
                        phoneController.text.isEmpty ||
                        passwordController.text.isEmpty ||
                        passCheckController.text.isEmpty) {
                      Toast.show('Заполните поля');
                    } else {
                      if (passCheckController.text == passwordController.text) {
                        var usersVar = await auth.signUp(                               
                            emailController.text, passwordController.text);
                        if (usersVar != null) {
                          await users.addUserCollection(
                              usersVar.id!,
                              emailController.text,
                              nameController.text,
                              phoneController.text,
                              passwordController.text);
                              Navigator.popAndPushNamed(context, '/auth');
                        } else {
                          Toast.show('Проверьте правильность данных');
                        }
                      } else {
                        Toast.show('Пароли не совпадают');
                      }
                    }
                  },
                  child: const Text('Sign In'),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              InkWell(
                highlightColor: Colors.white,
                onTap: () {
                  Navigator.popAndPushNamed(context, '/');
                },
                child: const Text('Есть аккаунт? Войти'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
