import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<dynamic> _markets = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchMarkets();
  }

  Future<void> fetchMarkets() async {
    final response =
        await http.get(Uri.parse('https://cryptingup.com/api/markets'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body)['markets'];
      setState(() {
        _markets = data;
        _isLoading = false;
      });
    } else {
      throw Exception('Failed to load markets');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Markets',
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 117, 58, 211),
        appBar: AppBar(
          title: const Text('Crypto'),
          backgroundColor: const Color.fromARGB(255, 53, 13, 118),
        ),
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: _markets.length,
                itemBuilder: (BuildContext context, int index) {
                  final market = _markets[index];
                  return Card(
                    color: const Color.fromARGB(255, 53, 13, 118),
                    child: ListTile(
                      title: Text(market['base_asset'],
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Price: ${market['quote']['USD']['price']} USD',
                              style: const TextStyle(color: Colors.white)),
                          Text('Change (24h): ${market['change_24h']}%',
                              style: const TextStyle(color: Colors.white)),
                          Text('Updated At: ${market['updated_at']}',
                              style: const TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
//TODO GENERATE REQUETE TOUT LES 1S
//TODO IMAGE DANS WIDGET CARD AVEC SWITCH CASE 
//NAVIGATEUR BUTTON 1ER PAGE VERS 2EME PAGE
//BACKGROUND 1ER PAGE 