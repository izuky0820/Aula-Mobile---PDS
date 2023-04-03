import 'package:flutter/material.dart';

class SomaPage extends StatefulWidget {
  @override
  State<SomaPage> createState() => StateSomaPage();
}

class StateSomaPage extends State<SomaPage> {
  final numero1Controller = TextEditingController();
  final numero2Controller = TextEditingController();
  int resultado = 0;
  
  somar() {
    setState(() {
      resultado = int.parse(numero1Controller.text) + int.parse(numero2Controller.text);
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de soma"),
      ),
      body: Column(
        children: [
          const Text("Número 1"),
          TextField(
            decoration: const InputDecoration(icon: Icon(Icons.check)),
            controller: numero1Controller,
          ),
          const Text("Número 2"),
          TextField(
            decoration: const InputDecoration(icon: Icon(Icons.check)),
            controller: numero2Controller,
          ),
          ElevatedButton(onPressed: somar, child: const Text("Somar")),
          Text("Resultado: $resultado")
        ]
      )
    );
  }
  
}