enum TableType {
  fourPerson,
  sixPerson,
}

class TableModel {
  final int number;
  final TableType type;
  final bool isAvailable;

  TableModel({
    required this.number,
    required this.type,
    required this.isAvailable,
  });
}
