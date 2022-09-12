import 'package:flutter/material.dart';

class EntryPage extends StatefulWidget {
  const EntryPage({super.key});

  @override
  State<EntryPage> createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(121, 238, 95, 90),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/repositórios');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(121, 238, 95, 90),
                  ),
                  child: const Text(
                    'Repositórios',
                    style: TextStyle(
                      color: Color.fromARGB(255, 58, 58, 58),
                      fontSize: 18.0,
                    ),
                  )),
              const SizedBox(
                width: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/seguidores');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(121, 238, 95, 90),
                  ),
                  child: const Text(
                    'Seguidores',
                    style: TextStyle(
                      color: Color.fromARGB(255, 58, 58, 58),
                      fontSize: 18.0,
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
