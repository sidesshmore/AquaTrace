import 'package:aqua_trace/features/Register/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _namecontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final RegisterBloc registerbloc = RegisterBloc();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return BlocConsumer<RegisterBloc, RegisterState>(
      bloc: registerbloc,
      listenWhen: (previous, current) => current is RegisterActionState,
      buildWhen: (previous, current) => current is! RegisterActionState,
      listener: (context, state) {
        if (state is NavigateToDashboard) {
          Navigator.pushNamed(context, 'success');
        } else if (state is NavigateToErrorState) {
          Navigator.pushNamed(context, 'errors');
        } else if (state is NavigateToLogin) {
          Navigator.pushNamed(context, 'login');
        }
      },
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.04, top: screenHeight * 0.15),
                  child: const Text(
                    'AquaTrace',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 20, right: 20, top: screenHeight * 0.08),
                  child: Stack(
                    children: [
                      Container(
                        height: 400,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          // .withOpacity(0.6000000238418579)
                          color: Colors.white.withOpacity(0.65),
                        ),
                      ),
                      Column(
                        children: [
                          const Text(
                            'REGISTER',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: 380,
                            child: TextField(
                              controller: _namecontroller,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  hintText: 'Name',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            width: 380,
                            child: TextField(
                              controller: _emailcontroller,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  hintText: 'Email',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            width: 380,
                            child: TextField(
                              controller: _passwordcontroller,
                              obscureText: false,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  hintText: 'Password',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 43, 127, 218),
                                )),
                                onPressed: () {
                                  registerbloc.add(
                                    RegisterButtonClicked(
                                        name: _namecontroller.text,
                                        email: _emailcontroller.text,
                                        password: _passwordcontroller.text),
                                  );
                                },
                                child: const Text(
                                  'Register',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        registerbloc.add(AlreadyaUserClicked());
                      },
                      child: const Text(
                        'Already a user?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}