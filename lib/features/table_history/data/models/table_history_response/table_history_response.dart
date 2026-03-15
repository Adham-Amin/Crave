import 'table.dart';

class TableHistoryResponse {
  Table? table;
  String? date;
  String? theTime;
  int? numbersPeople;

  TableHistoryResponse({
    this.table,
    this.date,
    this.theTime,
    this.numbersPeople,
  });

  factory TableHistoryResponse.fromJson(Map<String, dynamic> json) {
    return TableHistoryResponse(
      table: json['Table'] == null
          ? null
          : Table.fromJson(json['Table'] as Map<String, dynamic>),
      date: json['date'] as String?,
      theTime: json['the_time'] as String?,
      numbersPeople: json['numbers_people'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'Table': table?.toJson(),
    'date': date,
    'the_time': theTime,
    'numbers_people': numbersPeople,
  };
}
