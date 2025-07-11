import 'package:flutter/material.dart';

abstract class VeiculoWidget extends StatelessWidget{
  // 🔵 PROPRIEDADES COMUNS A QUALQUER VEÍCULO
  final String nome;             // Nome comercial do veículo
  final double preco;            // Preço em reais
  final String descricao;        // Descrição curta ou slogan
  final String imagemUrl;        // Link para a imagem do veículo
  final VoidCallback onTap;      // Função chamada ao tocar no card

  // 🔵 ESPECÍFICO E BEM GENÉRICO (vale pra qualquer veículo)
  final String marca;            // Marca do fabricante
  final String modelo;           // Modelo do veículo
  final int ano;                 // Ano de fabricação
  final String tipoCombustivel;  // Tipo de combustível
  final double quilometragem;    // Quantos km já rodou1


  // 🔵 CONSTRUTOR
  // Exige todos os campos ao criar
  const VeiculoWidget({
    final Key? key,
    required this.nome,
    required this.preco,
    required this.descricao,
    required this.imagemUrl,
    required this.onTap,
    required this.marca,
    required this.modelo,
    required this.ano,
    required this.tipoCombustivel,
    required this.quilometragem,
  }) : super(key: key);

  // 🔵 Método abstrato que define o tipo geral do produto
  // Deve ser implementado pela subclasse (Carro, Moto, Caminhão...)
  String getTipoProduto();

  // 🔵 MÉTODO BUILD
  // Monta o widget para exibir na tela
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Torna o card clicável, chamando onTap
      child: Card(
        margin: const EdgeInsets.all(10), // Espaço externo ao redor do card
        child: Column(
          children: [
            // Imagem do veículo carregada pela internet
            Image.network(
              imagemUrl,
              height: 150,
              fit: BoxFit.cover, // Ajusta a imagem para cobrir mantendo proporção
            ),
            // Área de texto com padding
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Alinha à esquerda
                children: [
                  // Marca e modelo em destaque
                  Text(
                    '$marca $modelo',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Ano de fabricação
                  Text('Ano: $ano'),
                  // Preço formatado com duas casas decimais
                  Text('R\$ ${preco.toStringAsFixed(2)}'),
                  // Tipo de combustível
                  Text('Combustível: $tipoCombustivel'),
                  // Quilometragem formatada sem casas decimais
                  Text('Quilometragem: ${quilometragem.toStringAsFixed(0)} km'),
                  // Descrição resumida
                  Text('Descrição: $descricao'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
