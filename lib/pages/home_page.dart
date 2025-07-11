// Importa o material design do Flutter (básico)
import 'package:flutter/material.dart';

// Importa os widgets personalizados para cada tipo de veículo
import '../widgets/carro_widget.dart';
import '../widgets/caminhao_widget.dart';
import '../widgets/moto_widget.dart';

// Importa a tela de detalhes para navegação
import 'detalhe_page.dart';

// Declaração da HomePage, que é um StatelessWidget (não tem estado interno)
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Retorna um Scaffold (estrutura básica de tela)
    return Scaffold(
      // Barra de topo com título
      appBar: AppBar(title: const Text('Catálogo de Veículos')),
      
      // Corpo da tela: uma lista rolável de veículos
      body: ListView(
        // Lista de widgets filhos (cada um é um "card" de veículo)
        children: [
          // 🔵 CarroWidget -> representa um carro na lista
          CarroWidget(
            nome: 'Sedan Lux',                     // Nome do carro
            preco: 85990.00,                       // Preço
            descricao: 'Conforto premium com design moderno.', // Descrição resumida
            imagemUrl: 'https://www.shutterstock.com/image-illustration/realistic-sport-car-isolated-on-600nw-2595467587.jpg', // Imagem de exemplo
            marca: 'AutoMaker',                    // Marca
            modelo: 'Lux 200',                     // Modelo
            ano: 2023,                             // Ano de fabricação
            tipoCambio: 'Automático',              // Tipo de câmbio
            numeroPortas: 4,                       // Número de portas
            temArCondicionado: true,               // Ar-condicionado
            tipoCombustivel: 'Gasolina',           // Tipo de combustível
            quilometragem: 15000,                  // Quilometragem
            onTap: () {
              // Função quando o usuário clica no Card
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetalhePage(
                    tipoProduto: 'Carro',         // Define o tipo para a página de detalhe
                    imagemUrl: 'https://www.shutterstock.com/image-illustration/realistic-sport-car-isolated-on-600nw-2595467587.jpg',
                    detalhes: [
                      // Lista de detalhes para mostrar na página
                      'Nome: Sedan Lux',
                      'Marca: AutoMaker',
                      'Modelo: Lux 200',
                      'Ano: 2023',
                      'Preço: R\$ 85.990,00',
                      'Câmbio: Automático',
                      'Portas: 4',
                      'Ar-condicionado: Sim',
                      'Combustível: Gasolina',
                      'Quilometragem: 15.000 km',
                      'Descrição: Conforto premium com design moderno.',
                    ],
                  ),
                ),
              );
            },
          ),

          // 🔵 MotoWidget -> representa uma moto na lista
          MotoWidget(
            nome: 'Moto Speed 300',                 // Nome
            preco: 19990.00,                        // Preço
            descricao: 'Esportiva, leve e potente.',// Descrição
            imagemUrl: 'https://images.tcdn.com.br/img/img_prod/1263757/scooter_eletrica_mia_1000w_sem_cnh_moto_chefe_11_1_4e1d8bd022f5a39fa68769b1c401f819.jpg',
            marca: 'MotoFast',                      // Marca
            modelo: 'Speed 300',                    // Modelo
            ano: 2022,                              // Ano
            cilindrada: 300,                        // Cilindrada
            tipoMoto: 'Esportiva',                  // Tipo da moto
            temPartidaEletrica: true,               // Partida elétrica
            tipoCombustivel: 'Gasolina',            // Combustível
            quilometragem: 8000,                    // Quilometragem
            onTap: () {
              // Abre a página de detalhes
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetalhePage(
                    tipoProduto: 'Moto',            // Define o tipo
                    imagemUrl: 'https://images.tcdn.com.br/img/img_prod/1263757/scooter_eletrica_mia_1000w_sem_cnh_moto_chefe_11_1_4e1d8bd022f5a39fa68769b1c401f819.jpg',
                    detalhes: [
                      'Nome: Moto Speed 300',
                      'Marca: MotoFast',
                      'Modelo: Speed 300',
                      'Ano: 2022',
                      'Preço: R\$ 19.990,00',
                      'Cilindrada: 300cc',
                      'Tipo: Esportiva',
                      'Partida elétrica: Sim',
                      'Combustível: Gasolina',
                      'Quilometragem: 8.000 km',
                      'Descrição: Esportiva, leve e potente.',
                    ],
                  ),
                ),
              );
            },
          ),

          // 🔵 CaminhaoWidget -> representa um caminhão na lista
          CaminhaoWidget(
            nome: 'Truck Max',                      // Nome
            preco: 180000.00,                       // Preço
            descricao: 'Ideal para transporte de cargas pesadas.', // Descrição
            imagemUrl: 'https://quatrorodas.abril.com.br/wp-content/uploads/2021/09/02-monstermax-2-whistlindiesel-truck-hornblasters-duramax-2021.jpg?quality=70&strip=info&w=720&crop=1',
            marca: 'CaminhoesBrasil',               // Marca
            modelo: 'MaxCargo 450',                 // Modelo
            ano: 2021,                              // Ano
            tipoCarroceria: 'Baú',                  // Tipo de carroceria
            capacidadeCarga: 15000,                 // Capacidade de carga (kg)
            quantidadeEixos: 3,                     // Número de eixos
            tipoCombustivel: 'Diesel',              // Tipo de combustível
            quilometragem: 95000,                   // Quilometragem
            onTap: () {
              // Abre a página de detalhes
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetalhePage(
                    tipoProduto: 'Caminhão',        // Define o tipo
                    imagemUrl: 'https://quatrorodas.abril.com.br/wp-content/uploads/2021/09/02-monstermax-2-whistlindiesel-truck-hornblasters-duramax-2021.jpg?quality=70&strip=info&w=720&crop=1',
                    detalhes: [
                      'Nome: Truck Max',
                      'Marca: CaminhoesBrasil',
                      'Modelo: MaxCargo 450',
                      'Ano: 2021',
                      'Preço: R\$ 180.000,00',
                      'Tipo de carroceria: Baú',
                      'Capacidade de carga: 15.000 kg',
                      'Eixos: 3',
                      'Combustível: Diesel',
                      'Quilometragem: 95.000 km',
                      'Descrição: Ideal para transporte de cargas pesadas.',
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
