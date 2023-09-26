import 'dart:math';
import 'dart:io';

main() {
  // Inicialização de variáveis
  Random rand = Random();
  Map<String, int> placarPlayer = {'Vitorias': 0, 'Derrotas': 0, 'Empates': 0};
  Map<String, int> placarComputer = {
    'Vitorias': 0,
    'Derrotas': 0,
    'Empates': 0
  };

  var cont2 = 0;
  var cont = 0;
  var num3 = 0;
  int? num;
  int? num2;

  // Interação inicial com o usuário
  print("-----------------------------------\n");
  print("Olá, Bem vindo ao jogo de dados\n");
  print("-----------------------------------");

  int rodadas = obterQuantidadeRodadas();

  // Loop principal do jogo
  while (cont2 < rodadas) {
    if (cont == 1) {
      print('        RODADA (${cont2 + 1})\n-----------------------------');
      num = geradorNumero();
    }
    if (cont == 0) {
      String? input = obterEntradaUsuario();
      if (input == 's') {
        print('      RODADA (${cont2 + 1})\n-----------------------------');
        num3 = rand.nextInt(2);
        if (num3 == 0) {
          num = geradorNumero(1);
        } else {
          num = geradorNumero(2);
        }
      }
      if (input == 'n') {
        print('      RODADA (${cont2 + 1})\n-----------------------------');
        num = geradorNumero();
      }

      cont++;
    }

    num2 = geradorNumeroComputador();

    // Lógica para determinar o vencedor da rodada
    if (num == num2 || num! > num2 || num < num2) {
      if (num! > num2) {
        print(
            'Você venceu essa rodada, tirou $num e é maior que o Computador que tirou $num2');

        print('\n');
        placarPlayer['Vitorias'] = placarPlayer['Vitorias']! + 1;
        placarComputer['Derrotas'] = placarComputer['Derrotas']! + 1;
      } else if (num == num2) {
        print(
            'Empate! Os jogadores fizeram a mesma soma de  $num , ninguém venceu essa rodada');

        print('\n');
        placarPlayer['Empates'] = placarPlayer['Empates']! + 1;
        placarComputer['Empates'] = placarComputer['Empates']! + 1;
      } else {
        print(
            'Computador venceu essa rodada, tirou $num2 e é maior que Você que tirou $num');

        print('\n');
        placarComputer['Vitorias'] = placarComputer['Vitorias']! + 1;
        placarPlayer['Derrotas'] = placarPlayer['Derrotas']! + 1;
      }
    }
    cont2++;
  }

  // Formatação dos placares
  String mapaFormatado = formatarMapa(placarPlayer);
  String mapaFormatado2 = formatarMapa(placarComputer);

  // Determinação do vencedor final
  if (placarPlayer['Vitorias']! > placarComputer['Vitorias']!) {
    print("          PLACAR");
    print("-----------------------------");
    print(
        'Você ganhou! \nO seu placar ficou assim:\n$mapaFormatado\n\nO placar do computador ficou assim: \n$mapaFormatado2 ');
    print("-----------------------------");
  } else if (placarPlayer['Vitorias']! < placarComputer['Vitorias']!) {
    print("          PLACAR");
    print("-----------------------------");
    print(
        'Computador ganhou! \nO seu placar ficou assim:\n$mapaFormatado\n\nO placar do computador ficou assim: \n$mapaFormatado2');
    print("-----------------------------");
  } else if (placarPlayer['Empates']! == placarComputer['Empates']!) {
    print("         PLACAR");
    print("-----------------------------");
    print(
        'Deu empate! \nO seu placar ficou assim:\n$mapaFormatado\n\nO placar do computador ficou assim: \n$mapaFormatado2');
    print("-----------------------------");
  }
}

int geradorNumero([int? num]) {
  Random random = Random();
  Map<int, List<int>> numeros = Map<int, List<int>>();

  int somaTotal = 0;
  int soma = 0;

  if (num == null) {
    numeros[1] = [random.nextInt(6) + 1];
    numeros[2] = [random.nextInt(6) + 1];
    numeros[3] = [random.nextInt(6) + 1];
    numeros.forEach((chave, lista) {
      lista.forEach((element) {
        somaTotal += element;
        print('Valor do seu dado $chave: $element');
      });
    });
    print('A soma total dos seus dados = $somaTotal');
    print('\n');
    return somaTotal;
  } else if (num == 1) {
    numeros[1] = [random.nextInt(6) + 1];
    numeros[2] = [random.nextInt(6) + 1];
    numeros[3] = [random.nextInt(6) + 1];
    numeros.forEach((chave, lista) {
      lista.forEach((element) {
        print('Valor do seu dado $chave: $element');
        soma = (soma + element);
      });
    });
    somaTotal = soma ~/ 2;
    print(
        'A soma total dos seus dados ficou = $soma (mas com os dados mágicos ficou $somaTotal)');
    print('\n');
    print(
        'Você usou dados mágicos e a soma total caiu pela metade agora vale $somaTotal\n');
    return somaTotal;
  } else if (num == 2) {
    numeros[1] = [random.nextInt(6) + 1];
    numeros[2] = [random.nextInt(6) + 1];
    numeros[3] = [random.nextInt(6) + 1];
    numeros.forEach((chave, lista) {
      lista.forEach((element) {
        print('Valor do seu dado $chave: $element');
        soma = (soma + element);
      });
    });
    somaTotal = soma * 2;
    print(
        'A soma total dos seus dados ficou = $soma (mas com os dados mágicos ficou $somaTotal)');
    print('\n');
    print(
        'Você usou dados mágicos e a soma total dobrou agora vale $somaTotal\n');
    return somaTotal;
  }
  return somaTotal;
}

int geradorNumeroComputador() {
  Random random = Random();
  Map<int, List<int>> numeros = Map<int, List<int>>();

  int somaTotal = 0;

  numeros[1] = [random.nextInt(6) + 1];
  numeros[2] = [random.nextInt(6) + 1];
  numeros[3] = [random.nextInt(6) + 1];
  numeros.forEach((chave, lista) {
    lista.forEach((element) {
      somaTotal += element;
      print('Valor do dado do Computador $chave: $element');
    });
  });
  print('A soma total dos dados do Computador = $somaTotal');
  print('\n');
  return somaTotal;
}

String formatarMapa(Map<String, int> mapa) {
  List<String> linhasFormatadas = [];

  mapa.forEach((chave, valor) {
    linhasFormatadas.add('$chave: $valor');
  });

  String mapaFormatado = linhasFormatadas.join('\n');

  return mapaFormatado;
}

String? obterEntradaUsuario() {
  print("Quer usar dados mágicos? s/n");
  String? input = stdin.readLineSync();

  if (input == 's' || input == 'n') {
    return input;
  } else {
    print("Digite 's' ou 'n'");
    return obterEntradaUsuario();
  }
}

int obterQuantidadeRodadas() {
  print("Quantas rodadas você quer jogar?");
  String? rd = stdin.readLineSync();

  try {
    int rodadas = int.parse(rd!);
    return rodadas;
  } catch (e) {
    print("Por favor, digite um número válido.");
    return obterQuantidadeRodadas();
  }
}
