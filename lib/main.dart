// Importa o pacote principal do Flutter com os widgets do Material Design
import 'package:flutter/material.dart';
import './pages/home_page.dart';

// Ponto de entrada da aplicação
void main() {
  // runApp: inicializa o app Flutter com o widget raiz MyApp
  runApp(const MyApp());
}

// Declaração da classe MyApp que é um StatelessWidget (não tem estado mutável)
class MyApp extends StatelessWidget {
  // Construtor constante (otimiza memória se não muda)
  const MyApp({super.key});

  // Build: monta a UI
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Título do app (aparece em algumas plataformas)
      title: 'Lista de veículos',

      // Tema geral do app
      theme: ThemeData(
        primarySwatch: Colors.teal, // Cor principal (app bar, botões)
      ),

      // Tela inicial do app
      home: const HomePage(), // ATENÇÃO: precisa existir essa classe
    );
  }
}
