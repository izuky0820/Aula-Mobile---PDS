import 'package:flutter/material.dart';

class CalculaTemperatura extends StatefulWidget {
  
  @override
  TemperaturaState createState() => TemperaturaState();
  }
  
enum Temperatura {
  fahrenheit,
  celsius
}

class TemperaturaState extends State<CalculaTemperatura>{

  String resultado = "0";
  
  Temperatura _tipotemperaturaController = Temperatura.celsius;
  final _temperaturaController = TextEditingController();

  void chekboxF(value){
    setState(() {
      _tipotemperaturaController = Temperatura.fahrenheit;
    });
  }

  void chekboxC(value){
    setState(() {
      _tipotemperaturaController = Temperatura.celsius;
    });
  }

  void calcular(){
    double resultadoc = 0;
    double num = double.parse(_temperaturaController.text);
    if (_tipotemperaturaController == Temperatura.fahrenheit){
      resultadoc = (32 + (9*num/5));
    } else {
      resultadoc = ((num - 32) / 9 * 5);
    }
    setState(() {
      resultado = resultadoc.toStringAsFixed(5);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculadora do Alberto")),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(labelText: "Temperatura"),
            controller: _temperaturaController,
          ),
        Row(children: [
          const Text("Fahrenheit"),
          Radio(value: Temperatura.fahrenheit, groupValue: _tipotemperaturaController, onChanged: chekboxF),
          const Text("Celsius"),
          Radio(value: Temperatura.celsius, groupValue: _tipotemperaturaController, onChanged: chekboxC)
        ]),
        ElevatedButton(onPressed: calcular, child: const Text("Converter")),
        Text("Resultado $resultado")
        ]),
    );

  }
}