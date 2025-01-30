import 'package:flutter/material.dart';

void main() {
  runApp(const MultiplicationTableApp());
}

class MultiplicationTableApp extends StatefulWidget {
  const MultiplicationTableApp({super.key});

  @override
  State<MultiplicationTableApp> createState() => _MultiplicationTableAppState();
}

class _MultiplicationTableAppState extends State<MultiplicationTableApp> {
  int tableNumber = 2; // Default table number
  int limit = 10; // Default limit
  List<String> table = [];

  @override
  void initState() {
    super.initState();
    _generateTable(); // Generate initial table
  }

  void _generateTable() {
    table = []; // Clear previous table
    for (int i = 1; i <= limit; i++) {
      table.add('${tableNumber} x $i = ${tableNumber * i}');
    }
    setState(() {}); // Update the UI
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multiplication Table App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Multiplication Table App'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Table Number'),
                onChanged: (value) {
                  setState(() {
                    tableNumber = int.tryParse(value) ?? tableNumber;
                    _generateTable();
                  });
                },
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Limit (Until)'),
                onChanged: (value) {
                  setState(() {
                    limit = int.tryParse(value) ?? limit;
                    _generateTable();
                  });
                },
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: table.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(table[index]),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}