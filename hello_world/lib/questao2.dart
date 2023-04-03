import 'package:flutter/material.dart';

class Votos extends StatefulWidget {
  @override
  _VotosState createState() => _VotosState();
}

class _VotosState extends State<Votos> {
  int eleitores = 0;
  int votosBrancos = 0;
  int votosNulos = 0;
  int votosValidos = 0;
  double percentualBrancos = 0.0;
  double percentualNulos = 0.0;
  double percentualValidos = 0.0;

  void calcularPercentuais() {
    setState(() {
      percentualBrancos = (votosBrancos / eleitores) * 100;
      percentualNulos = (votosNulos / eleitores) * 100;
      percentualValidos = (votosValidos / eleitores) * 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text('Eleições')),
      body:
         Column( 
          children: [
            TextField( decoration: InputDecoration(labelText: 'Número total de eleitores'),
              onChanged: (value) {
                setState(() {
                  eleitores = int.parse(value);
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Número de votos brancos'),
              onChanged: (value) {
                setState(() {
                  votosBrancos = int.parse(value);
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Número de votos nulos'),
              onChanged: (value) {
                setState(() {
                  votosNulos = int.parse(value);
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Número de votos válidos'),
              onChanged: (value) {
                setState(() {
                  votosValidos = int.parse(value);
                });
              },
            ),
           
            ElevatedButton(onPressed: calcularPercentuais,child: Text('Calcular percentuais')),
            Text('Percentual de votos brancos: ${percentualBrancos.toStringAsFixed(2)}%'),
            Text('Percentual de votos nulos: ${percentualNulos.toStringAsFixed(2)}%'),
            Text('Percentual de votos válidos: ${percentualValidos.toStringAsFixed(2)}%'),
          ],
        ),
    );
  }
}
