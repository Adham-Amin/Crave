class Table {
  int? numberTable;
  int? numChairs;

  Table({this.numberTable, this.numChairs});

  factory Table.fromJson(Map<String, dynamic> json) => Table(
    numberTable: json['number_table'] as int?,
    numChairs: json['num_chairs'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'number_table': numberTable,
    'num_chairs': numChairs,
  };
}
