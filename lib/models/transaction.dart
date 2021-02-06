part of 'models.dart';

enum TransactionStatus { delivered, on_delivered, pending, cancelled }

class Transaction extends Equatable {
  final int id;
  final Barang barang;
  final int quantity;
  final int total;
  final DateTime dateTime;
  final TransactionStatus status;
  final User user;

  Transaction({
    this.id,
    this.barang,
    this.quantity,
    this.dateTime,
    this.total,
    this.status,
    this.user,
  });

  Transaction copyWith(
      {int id,
      Barang barang,
      int quantity,
      int total,
      DateTime dateTime,
      TransactionStatus status,
      User user}) {
    return Transaction(
      id: id ?? this.id,
      barang: barang ?? this.barang,
      quantity: quantity ?? this.quantity,
      total: total ?? this.total,
      dateTime: dateTime ?? this.dateTime,
      status: status ?? this.status,
      user: user ?? this.user,
      );
  }

  @override
  List<Object> get props => [
        id,
        barang,
        quantity,
        total,
        dateTime,
        status,
      ];
}

List<Transaction> mockTransaction = [
  Transaction(
      id: 1,
      barang: mockBarang[1],
      quantity: 10,
      total: (mockBarang[1].price * 7 * 1.1).round() + 6000,
      dateTime: DateTime.now(),
      status: TransactionStatus.on_delivered,
      user: mockUser),
  Transaction(
      id: 2,
      barang: mockBarang[2],
      quantity: 10,
      total: (mockBarang[2].price * 7 * 1.1).round() + 6000,
      dateTime: DateTime.now(),
      status: TransactionStatus.on_delivered,
      user: mockUser),
];
