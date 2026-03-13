class TablesRequest {
  final String number;
  final String numberPeople;
  final String date;
  final String time;

  TablesRequest({
    required this.number,
    required this.numberPeople,
    required this.date,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'number_people': numberPeople,
      'date': date,
      'time': time,
    };
  }
}
