void main() {
  List<String> months = [];
  months.add("January");
  months.add("February");
  months.add("March");
  months.add("April");
  months.add("May");
  months.add("JUne");
  months.add("July");
  months.add("August");
  months.add("September");
  months.add("October");
  months.add("November");
  months.add("December");

  const imm_months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  var upp_months = [];
  var low_months = [];
  months.forEach((element) => upp_months.add(element.toUpperCase()));
  for (var months in imm_months) {
    low_months.add(months.toLowerCase());
  }
  print(months);
  print(imm_months);
  print(upp_months);
  print(low_months);
}
