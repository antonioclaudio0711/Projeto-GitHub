import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubproject/repository_page/cubit/repository_cubit.dart';

class RepositoryPage extends StatefulWidget {
  const RepositoryPage(this.cubit, {super.key});

  final RepositoryCubit cubit;

  @override
  State<RepositoryPage> createState() => _RepositoryPageState();
}

class _RepositoryPageState extends State<RepositoryPage> {
  RepositoryCubit get cubit => widget.cubit;

  @override
  void initState() {
    cubit.repository();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Repositórios'),
        backgroundColor: const Color.fromARGB(121, 238, 95, 90),
      ),
      body: BlocBuilder<RepositoryCubit, RepositoryState>(
        bloc: cubit,
        builder: (context, state) {
          if (state is LoadingRepository) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 1,
                color: Color.fromARGB(255, 183, 95, 95),
              ),
            );
          }

          if (state is FailureRepository) {
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

          final successState = state as SuccessRepository;

          return ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 2.5,
                  height: 10,
                );
              },
              itemCount: successState.itens.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.itens[index].name),
                );
              });
        },
      ),
    );
  }
}
