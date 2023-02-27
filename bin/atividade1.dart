import 'dart:io';
import 'dart:math';

void createFibonacciSequence2(int fibSeqSize, List<int> fibSeq) {
  if (fibSeq.length < fibSeqSize) {
    int currNumber = fibSeq.length <= 1
        ? fibSeq.length
        : fibSeq.last + fibSeq[fibSeq.length - 2];

    fibSeq.add(currNumber);

    createFibonacciSequence2(fibSeqSize, fibSeq);
  }
}

List<int> createFibonacciSequence1(int fibSeqSize) {
  int fibonacci(int n) => n == 0
      ? 0
      : n <= 2
          ? 1
          : fibonacci(n - 2) + fibonacci(n - 1);

  fibSeqSize--;

  List<int> list = [];

  if (fibSeqSize > 0) {
    list = createFibonacciSequence1(fibSeqSize);
  }

  list.add(fibonacci(fibSeqSize));

  return list;
}

void calcFibonacci() {
  print('digite o tamanho da sequencia de fibonacci desejado');
  String fibSeqSize = stdin.readLineSync() ?? '1';

  print(
      'digite 1 para usar primeiro método de cálculo ou digite 2 para usar o segundo método');
  String methodType = stdin.readLineSync() ?? '1';

  List<int> fibonacciSequence = [];

  if (methodType == '1') {
    fibonacciSequence = createFibonacciSequence1(int.parse(fibSeqSize));
  } else {
    createFibonacciSequence2(int.parse(fibSeqSize), fibonacciSequence);
  }

  String fibSeqTxt = fibonacciSequence.join(',');

  print('sequência fibonacci com $fibSeqSize números: $fibSeqTxt');
}

void calcIMC() {
  print('digite seu peso: ');
  String weight = stdin.readLineSync() ?? '1';
  print('digite sua altura: ');
  String height = stdin.readLineSync() ?? '1';

  String imc =
      (double.parse(weight) / pow(double.parse(height), 2)).toStringAsFixed(2);

  print('seu IMC é: $imc');
}

void main(List<String> arguments) {
  calcIMC();
  calcFibonacci();
}
