part of 'models.dart';

class Barang extends Equatable {
  final int id;
  final String picturePath;
  final String name;
  final String description;
  final String spesification;
  final int price;
  final double rate;

  Barang({
    this.id,
    this.picturePath,
    this.name,
    this.description,
    this.spesification,
    this.price,
    this.rate,
  });

  @override

  List<Object> get props => [
    id, picturePath,name, description, spesification, price, rate
  ];
}

List<Barang> mockBarang = [
  Barang(
      id: 1,
      picturePath:
          'https://images.unsplash.com/photo-1493020258366-be3ead1b3027?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80',
      name: 'macbook air 2017 128GB',
      price: 12000000,
      rate: 4.2,
      description: 'sebuah laptop dengan ukuran kecil yang lebih enteng dibawa kemana mana dan praktis',
      spesification: 'kelengkapan: laptop, charger, dusbook',
  ),
  Barang(
      id: 2,
      picturePath:
          'https://images.unsplash.com/photo-1611532736597-de2d4265fba3?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
      name: 'ipad pro 2020 32GB iBox',
      price: 8000000,
      rate: 4.2,
      description: 'sebuah laptop dengan ukuran kecil yang lebih enteng dibawa kemana mana dan praktis',
      spesification: 'kelengkapan: laptop, charger, dusbook',
  ),
];
