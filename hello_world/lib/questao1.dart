import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Idade em dias',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int anos = 0;
  int meses = 0;
  int dias = 0;
  int idadeEmDias = 0;

  void calcularIdadeEmDias() {
    setState(() {
      //anos = 2023 - anos;
      idadeEmDias = anos * 365 + meses * 30 + dias;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Idade em dias'),),
      body: Padding( padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              
               decoration: InputDecoration(labelText: 'Anos'),
              onChanged: (value) {
                setState(() {
                  anos = int.parse(value);
                });
              },
            ),
            TextField(
              
               decoration: InputDecoration(labelText: 'Meses'),
              onChanged: (value) {
                setState(() {
                  meses = int.parse(value);
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Dias'), 
              onChanged: (value) {
                setState(() {
                  dias = int.parse(value);
                });
              },
            ),
           
            ElevatedButton(onPressed: calcularIdadeEmDias,child: Text('Calcular idade em dias')),
      
            Text('Idade em dias: $idadeEmDias'),
          ],
        ),
      ),
    );
  }
}
