String toUpperSnakeCase(String input) {
  final buffer = StringBuffer();

  for (int i = 0; i < input.length; i++) {
    final char = input[i];

    if (i > 0 && char.toUpperCase() == char && char != '_') {
      buffer.write('_');
    }

    buffer.write(char.toUpperCase());
  }

  return buffer.toString();
}
