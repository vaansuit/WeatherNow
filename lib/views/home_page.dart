import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/background.gif'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 100,
                vertical: 100,
              ),
              child: Container(
                color: Colors.white,
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Blumenau',
                      style: TextStyle(
                        fontSize: 34,
                      ),
                    ),
                    const Text(
                      '19°',
                      style: TextStyle(
                        fontSize: 34,
                      ),
                    ),
                    const Text(
                      'Mostly Clear',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('H: 24'),
                        Text('L: 30'),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10);
                },
                itemBuilder: (context, index) {
                  return Container(
                    height: 200,
                    width: 20,
                    color: Colors.white,
                  );
                },
                itemCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
