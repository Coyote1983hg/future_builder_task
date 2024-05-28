import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _zipController = TextEditingController();
  String _result = 'Noch keine PLZ gesucht';

  @override
  void dispose() {
    _zipController.dispose();
    super.dispose();
  }

  Future<void> getCityFromZip(String zip) async {
    await Future.delayed(const Duration(seconds: 3));

    switch (zip) {
      case "10115":
        setState(() {
          _result = 'Berlin';
        });
        break;
      case "20095":
        setState(() {
          _result = 'Hamburg';
        });
        break;
      case "80331":
        setState(() {
          _result = 'München';
        });
        break;
      case "50667":
        setState(() {
          _result = 'Köln';
        });
        break;
      case "60311":
      case "60313":
        setState(() {
          _result = 'Frankfurt am Main';
        });
        break;
      default:
        setState(() {
          _result = 'Unbekannte Stadt';
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _zipController,
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Postleitzahl",
                ),
              ),
              const SizedBox(height: 32),
              OutlinedButton(
                onPressed: () {
                  getCityFromZip(_zipController.text);
                },
                child: const Text("Suche"),
              ),
              const SizedBox(height: 32),
              Text(
                'Ergebnis: $_result',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
