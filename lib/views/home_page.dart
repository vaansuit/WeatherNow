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
                  image: AssetImage('assets/background.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              child: Align(
                alignment: const Alignment(0, -0.8),
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
              child: Align(
                alignment: Alignment(0, 0.7),
                child: Image.asset(
                  'assets/house3.png',
                  height: 200,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
