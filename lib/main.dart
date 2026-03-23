import 'package:flutter/material.dart';

void main() {
  runApp(const AulaWidgetApp());
}

class AulaWidgetApp extends StatelessWidget {
  const AulaWidgetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget\'s',
      theme: ThemeData(
       
        colorScheme: .fromSeed(
          seedColor: const Color.fromARGB(255, 220, 0, 179),
        ),
      ),
      home: const WidgetsPage(title: 'Aula widgets'),
    );
  }
}

class WidgetsPage extends StatefulWidget {
  const WidgetsPage({super.key, required this.title});
  final String title;

  @override
  State<WidgetsPage> createState() => _WidgetsPageState();
}

class _WidgetsPageState extends State<WidgetsPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCouter() {
    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final int flexA = 2;
    final int flexB = 1;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Contador do botão',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
            ),
            Text(
              'Quantidade de vezes clicadas: $_counter',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(width: 20),
            const Text(
              'Row responsival com expanded',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: flexA,
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Valor\n$_counter',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                Expanded(
                  flex: flexB,
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Dobro\n${_counter * 2}',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                const SizedBox(width: 12),
                Container(
                  width: 90,
                  height: 80,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 24, 62, 128),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Triplo\n${_counter * 3}',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),
            CustomCard(
              titulo: 'Contador: $_counter',
              icone: Icons.calculate, 
              corDeFundo: Colors.deepPurpleAccent
              ),
            
            const SizedBox(height: 24),
            CustomCard(
              titulo: 'Dobro: ${_counter * 2}',
              icone: Icons.filter_2, 
              corDeFundo: Colors.deepPurpleAccent
              ),

            const SizedBox(height: 24),
            CustomCard(
              titulo: 'Par ou Impar?: ${_counter.isEven ?  "Par" : "Impar"}',
              icone: Icons.calculate, 
              corDeFundo: Colors.deepPurpleAccent
              ),
            

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _decrementCouter,
                    icon: const Icon(Icons.remove),
                    label: const Text('Menos'),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _resetCounter,
                    icon: const Icon(Icons.restart_alt),
                    label: const Text('Reset'),
                  ),
                ),

                const SizedBox(height: 20),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _incrementCounter,
                    icon: const Icon(Icons.add),
                    label: const Text('Adiciona'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Clica no meu Butão',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String titulo;
  final IconData icone;
  final Color corDeFundo;

  const CustomCard({
    super.key,
    required this.titulo,
    required this.icone,
    required this.corDeFundo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: corDeFundo,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Row(
        children: [
          Icon(icone, size: 8),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              titulo,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}