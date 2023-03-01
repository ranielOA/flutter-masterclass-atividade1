import 'dart:io';

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
  int fibSeqSize = int.tryParse(stdin.readLineSync() ?? '-1') ?? -1;

  if (fibSeqSize < 1) {
    print('===digite valores válidos===');
    calcFibonacci();
    return;
  }

  print(
      'digite 1 para usar primeiro método de cálculo ou digite 2 para usar o segundo método');
  int methodType = int.tryParse(stdin.readLineSync() ?? '-1') ?? -1;

  List<int> fibonacciSequence = [];

  if (methodType == 1) {
    fibonacciSequence = createFibonacciSequence1(fibSeqSize);
  } else if (methodType == 2) {
    createFibonacciSequence2(fibSeqSize, fibonacciSequence);
  } else {
    print('===digite uma opção válida===');
    calcFibonacci();
    return;
  }

  String fibSeqTxt = fibonacciSequence.join(',');

  print('sequência fibonacci com $fibSeqSize números: $fibSeqTxt');
}
