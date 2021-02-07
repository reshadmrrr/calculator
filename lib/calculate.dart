class Calculate {
  String input;
  List<String> list = [];
  Calculate(this.input);

  void calc() {
    spilString();
    double num1 = 0;
    double num2 = 0;
    double n = 0;
    int i;
    while (list.length > 1) {
      while (list.contains("/")) {
        i = list.indexOf("/");
        num1 = double.parse(list[i - 1]);
        num2 = double.parse(list[i + 1]);
        n = num1 / num2;
        list.insert(i, n.toString());
        list.removeRange(i - 1, i);
        list.removeRange(i, i + 2);
      }
      while (list.contains('x')) {
        i = list.indexOf('x');
        num1 = double.parse(list[i - 1]);
        num2 = double.parse(list[i + 1]);
        n = num1 * num2;
        list.insert(i, n.toString());
        list.removeRange(i - 1, i);
        list.removeRange(i, i + 2);
      }
      while (list.contains('+')) {
        i = list.indexOf("+");
        num1 = double.parse(list[i - 1]);
        num2 = double.parse(list[i + 1]);
        n = num1 + num2;
        list.insert(i, n.toString());
        list.removeRange(i - 1, i);
        list.removeRange(i, i + 2);
      }
      while (list.contains('-')) {
        i = list.indexOf('-');
        num1 = double.parse(list[i - 1]);
        num2 = double.parse(list[i + 1]);
        n = num1 - num2;
        list.insert(i, n.toString());
        list.removeRange(i - 1, i);
        list.removeRange(i, i + 2);
      }
    }
  }

  void spilString() {
    input = input.replaceAll('+', ' + ');
    input = input.replaceAll('-', ' - ');
    input = input.replaceAll('x', ' x ');
    input = input.replaceAll('/', ' / ');

    list = input.split(' ');
  }
}
