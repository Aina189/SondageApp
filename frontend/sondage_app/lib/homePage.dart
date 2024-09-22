import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sondage_app/response.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController mailController;
  late TextEditingController comsController;
  int avis = 0;

  @override
  void initState() {
    super.initState();
    mailController = TextEditingController();
    comsController = TextEditingController();
  }

  @override
  void dispose() {
    mailController.dispose();
    comsController.dispose();
    super.dispose();
  }

  Future<void> _addAvis() async {
    setState(() {
      if (avis < 10) {
        avis++;
      }
    });
  }

  Future<void> _negatAvis() async {
    setState(() {
      if (avis > 0) {
        avis--;
      }
    });
  }

  Future<void> _send() async {
    String mailInput = mailController.text;
    String comsInput = comsController.text;
    int avisInput = avis;

    ResponseUser responseUser = ResponseUser(0, mailInput, comsInput, avisInput);
    String jsonData = json.encode(responseUser.toJson());

    try {
      final response = await http.post(
        Uri.parse('http://localhost:8080/api/utilisateur'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonData,
      );

      if (response.statusCode == 201) {
        // Si la requête a réussi
        print('Succès: ${response.body}');
        showDialog(context: context, builder: (context){
          return AlertDialog(
            title: Text("Merci pour la participation"),
            content: Icon(Icons.check_circle),
            actions: [
              TextButton(onPressed: () {
                mailController.clear();
                comsController.clear();
                setState(() {
                  avis == 0;
                });
                Navigator.of(context).pop();
              }, child:const Text("OK"))
            ],
          );
          
        });
      } else {
        
        print('Erreur: ${response.statusCode}, ${response.body}');
      }
    } catch (error) {
    
      print('Erreur lors de l\'envoi de la requête : $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backGround.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            height: 600,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: const Text(
                    "Votre avis est notre soutien.",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 300,
                  child: TextField(
                    controller: mailController,
                    decoration: const InputDecoration(
                      labelText: "Entrer votre adresse email ou votre contact",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 300,
                  width: 300,
                  child: TextField(
                    controller: comsController,
                    maxLines: null,
                    expands: true,
                    decoration: const InputDecoration(
                      labelText: "Votre commentaire ici",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20),
                      child: Text(
                        '$avis/10',
                        style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: _addAvis,
                      child: const Icon(Icons.add),
                    ),
                    const SizedBox(width: 10),
                    FloatingActionButton(
                      onPressed: _negatAvis,
                      child: const Icon(Icons.remove),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: _send,
                  child: const Text("Envoyer"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
