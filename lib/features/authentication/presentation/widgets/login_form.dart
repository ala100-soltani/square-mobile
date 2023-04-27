import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/authentication_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({required this.context, super.key});
  final BuildContext context;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  bool rememberUser = false;

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.black
            : Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 0.0),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/square_logo.png',
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 20.0),
              const Text("Sign in", style: TextStyle(fontSize: 20.0)),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _emailEditingController,
                decoration: const InputDecoration(
                  hintText: "Email",
                  icon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your email";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _passwordEditingController,
                decoration: const InputDecoration(
                  hintText: "Password",
                  icon: Icon(Icons.lock),
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your password";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      Checkbox(
                        value: rememberUser,
                        onChanged: (value) {
                          setState(() {
                            rememberUser = value!;
                          });
                        },
                      ),
                      const Text(
                        "Rester connecté",
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                  const Text(
                    "Mot de passe oublié",
                    style: TextStyle(fontSize: 11, color: Color(0xff9C8FD4)),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  if (state is NotLoggedState ||
                      state is ErrorState ||
                      state is AuthenticationInitial) {
                    if (state is ErrorState) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        debugPrint("ErrorState : ${state.message}");
                      });
                    }
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          colors: [Color(0xff1DE8B8), Color(0xff1DC5E7)],
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          BlocProvider.of<AuthenticationBloc>(context).add(
                            LoginEvent(
                              _emailEditingController.text,
                              _passwordEditingController.text,
                            ),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Text(
                            "Se connecter",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                    );
                  } else if (state is LoadingState) {
                    return const CircularProgressIndicator();
                  } else if (state is LoggedState) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      debugPrint("logged in");
                      Navigator.pushNamedAndRemoveUntil(
                          context, "/entreprises", (route) => false);
                    });
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
