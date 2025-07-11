import 'package:flutter/material.dart';

// StatelessWidget porque essa página não muda de estado sozinha
class DetalhePage extends StatelessWidget {
  // Parâmetros que vêm da navegação: tipo do produto (Carro, Moto, Caminhão), imagem e lista de detalhes
  final String tipoProduto;
  final String imagemUrl;
  final List<String> detalhes;

  // Construtor com parâmetros obrigatórios
  const DetalhePage({
    super.key,
    required this.tipoProduto,
    required this.imagemUrl,
    required this.detalhes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar com título dinâmico
      appBar: AppBar(title: Text('Detalhes do $tipoProduto')),
      body: SingleChildScrollView(
        // Permite rolar se conteúdo for grande
        child: Column(
          children: [
            // Imagem do veículo
            Image.network(
              imagemUrl,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),

            // Bloco de texto com detalhes e botão
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Lista de textos com os dados detalhados
                  ...detalhes.map(
                    (dado) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        dado,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Botão para abrir o simulador de financiamento
                  Center(
                    child: ElevatedButton(
                      onPressed: () => _mostrarCalculoFinanciamento(context),
                      child: const Text('Simular Financiamento'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔵 Função para mostrar o diálogo de simulação de financiamento
  void _mostrarCalculoFinanciamento(BuildContext context) {
    // Controllers para pegar os valores digitados
    final entradaController = TextEditingController();
    final prazoController = TextEditingController();

    // Abre o primeiro diálogo para entrada e prazo
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Simular Financiamento'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Campo para valor de entrada
              TextField(
                controller: entradaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Entrada (R\$)'),
              ),
              // Campo para prazo em meses
              TextField(
                controller: prazoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Prazo (meses)'),
              ),
            ],
          ),
          actions: [
            // Botão para calcular
            TextButton(
              onPressed: () {
                // Pega valores digitados ou usa 0/1 como fallback
                final entrada = double.tryParse(entradaController.text) ?? 0;
                final prazo = int.tryParse(prazoController.text) ?? 1;

                // Extrai o preço a partir dos detalhes
                final preco = _extrairPreco();

                // Calcula valor financiado
                final valorFinanciado = preco - entrada;

                // Aplica juros fixo de 2% ao mês
                final valorParcela = (valorFinanciado / prazo) * 1.02;

                // Fecha o primeiro diálogo
                Navigator.of(context).pop();

                // Abre o resultado em outro diálogo
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Resultado da Simulação'),
                      content: Text(
                        'Valor financiado: R\$ ${valorFinanciado.toStringAsFixed(2)}\n'
                        'Parcela aproximada: R\$ ${valorParcela.toStringAsFixed(2)} por mês',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Calcular'),
            ),
            // Botão para cancelar
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  // 🔵 Função para tentar extrair o preço da lista de detalhes
  double _extrairPreco() {
    // Busca a string que tem "Preço:" nos detalhes
    final precoString = detalhes
        .firstWhere(
          (e) => e.contains('Preço:'),
          orElse: () => '0',
        )
        // Remove tudo que não seja número ou separador decimal
        .replaceAll(RegExp(r'[^\d,\.]'), '')
        // Troca pontos por nada e vírgula por ponto (para parsear como double)
        .replaceAll('.', '')
        .replaceAll(',', '.');

    // Faz o parse em double ou usa 0
    return double.tryParse(precoString) ?? 0;
  }
}
