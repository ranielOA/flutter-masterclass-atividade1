import 'dart:io';
import 'dart:math';

void calcIMC() {
  print('digite seu peso: ');
  double? weight = double.tryParse(stdin.readLineSync() ?? '-1') ?? -1;
  print('digite sua altura: ');
  double? height = double.tryParse(stdin.readLineSync() ?? '-1') ?? -1;

  if (weight < 1 || height < 1) {
    print('===digite valores válidos===');
    calcIMC();
    return;
  }

  String imc = (weight / pow(height, 2)).toStringAsFixed(2);

  print('seu IMC é: $imc');
}
