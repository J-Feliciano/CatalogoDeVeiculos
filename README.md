Um projeto realizado a partir de uma atividade escolar, que consiste na criação de um catálogo de veículos com uma página de detalhes do veículo para cada item.

Foi usada a linguagem "Dart" com o framework "Flutter" somente.

Utilizados conceitos de POO herança.

--> definir o motivo de criação de cada arquivo (tela ou classe) <--
lib
    ->pages
        ->detalhes_page
        ->home_page
    ->widgets
        ->caminhaoWidget
        ->carroWidget
        ->motoWidget
        ->veiculoWidget
   -main.dart

veiculoWidget
    → Criada a fim de padronizar e moldar as demais classes relacionadas aos carros (Produtos da aplicação)
    →Herda um StatelessWidget, removendo a possibilidade de ser sobreescrita por outra classe
    Possui os métodos
        ->getTipoProduto
        ->getTipoVeiculo
        ambos usados para armazenar uma informação que será dada nas classes filhas que poderá ser usado em outras ocasiões
    Gera um modelo de build a ser seguido, passível de alteração
    Apresenta os dados
        ->nome
        ->marca
        ->modelo
        ->ano
        ->preco
        ->getTipoVeiculo()
        ->tipoCombustivel
        ->quilometragem
        ->descricao
    
carroWidget
    → Criada para que hajam métodos, dados e detalhes específicos para veículos que se encaixam no tipo "carro"
    → Herda as características da classe pai "veiculoWidget"
    →Não possui métodos específicos
    →Sobreescreve a build herdada da classe pai para mostras seus dados de maneira completa
    Apresenta os dados
        (todos os da classe pai)
        ->tipoCambio
        ->numeroPortas
        ->temArCondicionado

motoWidget
    → Criada para que hajam métodos, dados e detalhes específicos para veículos que se encaixam no tipo "moto"
    → Herda as características da classe pai "veiculoWidget"
    →Não possui métodos específicos
    →Sobreescreve a build herdada da classe pai para mostras seus dados de maneira completa
    Apresenta os dados
        (todos os da classe pai)
        ->cilindrada
        ->tipoMoto
        ->temPartidaEletrica

caminhaoWidget
    → Criada para que hajam métodos, dados e detalhes específicos para veículos que se encaixam no tipo "caminhão"
    → Herda as características da classe pai "veiculoWidget"
    →Não possui métodos específicos
    →Sobreescreve a build herdada da classe pai para mostras seus dados de maneira completa
    Apresenta os dados
        (todos os da classe pai)
        ->tipoCarroceria
        ->capacidadeCarga
        ->quantidadeEixos

    Telas
home_page
    Tela inicial onde será mostrado todo o catálogo de veículos
    Gera interação para o aparecimento da "datalhe_page.dart"

detalhe_page
    Apresenta os dados do produto de maneira maior e mais específica e apresenta um botão para calcular o financiamento.


Funções principais
    Visualição de detalhes em outra página
    Cálculo de financeamento

--> diagrama de classes <--
