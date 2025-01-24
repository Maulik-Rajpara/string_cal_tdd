class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    // Handle custom delimiter if present
    if (numbers.startsWith("//")) {
      var delimiter = numbers[2];
      numbers = numbers.substring(4);
      numbers = numbers.replaceAll(delimiter, ',');
      print("numList $delimiter");
    }

    // Split by comma or newline
    var numList = numbers.split(RegExp(r'[,\n]')).map(int.parse).toList();
    print("numList $numList");
    // Check for negative numbers
    var negativeNumbers = numList.where((num) => num < 0).toList();
    if (negativeNumbers.isNotEmpty) {
      throw FormatException('negative numbers are not allowed ${negativeNumbers.join(',')}');
    }

    return numList.fold(0, (sum, num) => sum + num);
  }
}