import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubproject/login_page/cubit/search_cubit.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage(this.cubit, {super.key});

  final SearchCubit cubit;

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  SearchCubit get cubit => widget.cubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 700,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
              opacity: 0.6,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/github.png'),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                    right: 40.0,
                  ),
                  child: Column(
                    children: [
                      BlocBuilder<SearchCubit, SearchState>(
                        bloc: cubit,
                        builder: (context, state) {
                          if (state is FailureSearch) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color.fromARGB(121, 238, 95, 90),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  state.error.message,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          }
                          return Container();
                        },
                      ),
                      TextField(
                        onChanged: (value) {
                          cubit.user = value;
                        },
                        decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.person,
                            color: Color.fromARGB(255, 41, 40, 40),
                            size: 35.0,
                          ),
                          labelText: 'USERNAME',
                          labelStyle: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 41, 40, 40),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: ElevatedButton(
                          onPressed: () {
                            cubit.login(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(121, 238, 95, 90),
                          ),
                          child: BlocBuilder<SearchCubit, SearchState>(
                            bloc: cubit,
                            builder: (context, state) {
                              if (state is LoadingSearch) {
                                return const CircularProgressIndicator(
                                  strokeWidth: 1,
                                  color: Colors.white,
                                );
                              }
                              return const Text(
                                'Entrar',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 58, 58, 58),
                                  fontSize: 18.0,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
