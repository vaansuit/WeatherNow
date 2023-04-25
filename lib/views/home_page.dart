import 'package:flutter/material.dart';
import 'package:weather_app/repositories/location_repository.dart';

import '../models/location_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LocationModel? _locationModel;
  final _locationRepository = LocationRepository();

  Future<void> _getCurrentLocation() async {
    final locationModel = await _locationRepository.getCurrentLocation();
    if (locationModel != null) {
      setState(() {
        _locationModel = locationModel;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Failed to get current location'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _getCurrentLocation();
          },
        ),
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
                decoration: BoxDecoration(
                    color: const Color.fromARGB(156, 131, 187, 242),
                    borderRadius: BorderRadius.circular(20)),
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _locationModel?.city ?? 'Default',
                      style: const TextStyle(
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
                        Text('Lat: 24'),
                        SizedBox(
                          width: 20,
                        ),
                        Text('Lon: 30'),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              child: Align(
                alignment: const Alignment(0, 0.7),
                child: Container(
                  height: 200,
                  width: 400,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(62, 255, 255, 255),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisExtent: 180,
                      ),
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.only(
                            top: 20,
                            left: 5,
                            right: 5,
                          ),
                          height: 500,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(156, 131, 187, 242),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Text('Day'),
                              Icon(Icons.cloud),
                              Text('19°C'),
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
