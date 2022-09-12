import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubproject/follower_page/cubit/follower_cubit.dart';

class FollowerPage extends StatefulWidget {
  const FollowerPage(this.cubit, {super.key});

  final FollowerCubit cubit;

  @override
  State<FollowerPage> createState() => _FollowerPageState();
}

class _FollowerPageState extends State<FollowerPage> {
  FollowerCubit get cubit => widget.cubit;

  @override
  void initState() {
    cubit.follower();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seguidores'),
        backgroundColor: const Color.fromARGB(121, 238, 95, 90),
      ),
      body: BlocBuilder<FollowerCubit, FollowerState>(
        bloc: cubit,
        builder: (context, state) {
          if (state is LoadingFollower) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 1,
                color: Color.fromARGB(255, 183, 95, 95),
              ),
            );
          }

          if (state is FailureFollower) {
            return Center(
              child: Container(
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
              ),
            );
          }

          final successState = state as SuccessFollower;

          return ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.itens[index].login),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 2.5,
                  height: 10,
                );
              },
              itemCount: successState.itens.length);
        },
      ),
    );
  }
}
