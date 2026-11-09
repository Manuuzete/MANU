import 'package:flutter/material.dart';

void main() {
  runApp(const MeusRemediosApp());
}

class MeusRemediosApp extends StatelessWidget {
  const MeusRemediosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hora do Remédio',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: const RemediosHomePage(),
    );
  }
}

class RemediosHomePage extends StatefulWidget {
  const RemediosHomePage({super.key});

  @override
  State<RemediosHomePage> createState() => _RemediosHomePageState();
}

class _RemediosHomePageState extends State<RemediosHomePage> {
  final List<Map<String, String>> _remedios = [
    {'nome': 'Remédio A - Pressão', 'hora': '08:00'},
    {'nome': 'Remédio B - Diabetes', 'hora': '12:00'},
    {'nome': 'Remédio C - Vitaminas', 'hora': '20:00'},
  ];

  void _compartilharAgenda() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Simulando: Imagem da agenda compartilhada no WhatsApp!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('👴 Agenda de Remédios 👵'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: _remedios.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.medication, color: Colors.teal, size: 40),
              title: Text(
                _remedios[index]['nome']!,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Horário: ${_remedios[index]['hora']}',
                style: const TextStyle(fontSize: 16),
              ),
              trailing: const Icon(Icons.check_circle_outline, color: Colors.grey),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _compartilharAgenda,
        label: const Text('Compartilhar no WhatsApp'),
        icon: const Icon(Icons.share),
        backgroundColor: Colors.teal,
      ),
    );
  }
}