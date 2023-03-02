import 'dart:io';

double ruleOfThree(
    double? value11, double? value12, double? value21, double? value22) {
  Map<double?, List<double?>> values = {
    value11: [value21, value12, value22],
    value22: [value21, value12, value11],
    value21: [value11, value22, value12],
    value12: [value11, value22, value21]
  };

  MapEntry<double?, List<double?>> entrieFound = values.entries.firstWhere(
      (val) => val.key == null,
      orElse: () => MapEntry(null, [null]));

  if (entrieFound.value.contains(null) || entrieFound.value.contains(0)) {
    return 0;
  }

  return (entrieFound.value[0]! * entrieFound.value[1]!) /
      entrieFound.value[2]!;
}

void calcRuleOfThree() {
  print('digite o primeiro valor da primeira coluna: ');
  double? value11 = double.tryParse(stdin.readLineSync() ?? '');
  print('digite o segundo valor da primeira coluna: ');
  double? value12 = double.tryParse(stdin.readLineSync() ?? '');
  print('digite o primeiro valor da segunda coluna: ');
  double? value21 = double.tryParse(stdin.readLineSync() ?? '');
  print('digite o segundo valor da segunda coluna: ');
  double? value22 = double.tryParse(stdin.readLineSync() ?? '');

  double result = ruleOfThree(value11, value12, value21, value22);

  if (result == 0) {
    print('Não foi possível realizar o cálculo');
  } else {
    String resultToShow = result.toStringAsFixed(2);
    print("resultado: $resultToShow");
  }
}
