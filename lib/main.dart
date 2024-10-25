import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  double? _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Haris Ananta Putra - Material Design Calculator - Tugas Sesi 4'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Result',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _currentValue.toString(),
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.75,
                          child: SimpleCalculator(
                            value: _currentValue!,
                            hideExpression: false,
                            hideSurroundingBorder: true,
                            autofocus: true,
                            onChanged: (key, value, expression) {
                              setState(() {
                                _currentValue = value ?? 0;
                              });
                              if (kDebugMode) {
                                print('$key\t$value\t$expression');
                              }
                            },
                            theme: const CalculatorThemeData(
                              borderColor: Color.fromARGB(255, 0, 0, 0),
                              borderWidth: 2,
                              displayColor: Color.fromARGB(255, 255, 255, 255),
                              displayStyle: TextStyle(
                                  fontSize: 80,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              expressionColor: Color.fromARGB(255, 72, 255, 0),
                              expressionStyle: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              operatorColor: Color.fromARGB(255, 251, 255, 0),
                              operatorStyle: TextStyle(
                                  fontSize: 30,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              commandColor: Color.fromARGB(255, 255, 0, 0),
                              commandStyle: TextStyle(
                                  fontSize: 30,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              numColor: Color.fromARGB(255, 255, 255, 255),
                              numStyle: TextStyle(
                                  fontSize: 50,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ),
                        );
                      });
                },
                icon: const Icon(Icons.calculate),
                label: const Text('Open Calculator'),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  textStyle: const TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _currentValue = 0;
          });
        },
        backgroundColor: Colors.redAccent,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
