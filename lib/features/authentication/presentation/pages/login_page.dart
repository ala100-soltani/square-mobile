import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:square/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:square/injection_container.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();

  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final FocusNode _viewNode = FocusNode();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = true;
  }

  @override
  void dispose() {
    _emailNode.dispose();
    _passwordNode.dispose();
    _viewNode.dispose();
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_viewNode),
      child: Scaffold(
        key: _scaffoldKey,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark.copyWith(),
          child: _buildBody(context),
        ),
      ),
    );
  }

  BlocProvider<AuthenticationBloc> _buildBody(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isKeyboardOpen = (MediaQuery.of(context).viewInsets.bottom > 0);
    return BlocProvider<AuthenticationBloc>(
      create: (_) => sl<AuthenticationBloc>(),
      child: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.all(5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildHeader(isKeyboardOpen),
              _buildEmailField(context),
              const Padding(
                padding: EdgeInsets.only(top: 12),
              ),
              _buildPasswordField(context),
              const Padding(
                padding: EdgeInsets.only(top: 14),
              ),
              SizedBox(
                width: double.infinity,
                height: 36,
                child: _buildLoginButton(),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(bool isKeyboardOpen) {
    if (!isKeyboardOpen) {
      return Column(
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 74),
          ),
          SizedBox(
            width: 60,
            height: 60,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          Text(
            "Login",
          ),
          Padding(
            padding: EdgeInsets.only(top: 14),
          ),
        ],
      );
    }
    return const Padding(
      padding: EdgeInsets.only(top: 74),
    );
  }

  BlocBuilder _buildLoginButton() {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is NotLoggedState ||
            state is ErrorState ||
            state is AuthenticationInitial) {
          if (state is ErrorState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              debugPrint("ErrorState : ${state.message}");
            });
          }
          return ElevatedButton(
            key: const Key("login"),
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context).add(
                LoginEvent(
                  _emailEditingController.text,
                  _passwordEditingController.text,
                ),
              );
            },
            child: const Text(
              "LOGIN",
            ),
          );
        } else if (state is LoadingState) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            debugPrint("LoadingState");
          });

          return const Center(child: CircularProgressIndicator());
        } else if (state is LoggedState) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            debugPrint("logged in");
            Navigator.pushNamedAndRemoveUntil(
                context, "/entreprises", (route) => false);
          });
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  TextFormField _buildEmailField(BuildContext context) {
    return TextFormField(
      focusNode: _emailNode,
      controller: _emailEditingController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: const BorderSide(),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: const BorderSide(),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: const BorderSide(),
        ),
        filled: true,
        labelText: "Email*",
      ),
      onFieldSubmitted: (term) {
        _fieldFocusChange(context, _emailNode, _passwordNode);
      },
    );
  }

  TextFormField _buildPasswordField(BuildContext context) {
    return TextFormField(
      focusNode: _passwordNode,
      controller: _passwordEditingController,
      obscureText: _obscureText,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: const BorderSide(),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: const BorderSide(),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: const BorderSide(),
        ),
        filled: true,
        labelText: "Password*",
        suffixIcon: IconButton(
          icon: const Icon(Icons.remove_red_eye),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
    );
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
