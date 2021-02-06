part of 'models.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String address;
  final String portalCode;
  final String phoneNumber;
  final String city;
  final String picturePath;

  User({
    this.id,
    this.name,
    this.email,
    this.address,
    this.portalCode,
    this.phoneNumber,
    this.city,
    this.picturePath,
  });

  
  @override
  List<Object> get props =>
      [id, name, email, address, portalCode, phoneNumber, city, picturePath];
}

User mockUser = User(
  id: 1,
  name: 'Dadang Wirawan',
  address: 'Jalan jalan kemana saja',
  city: 'Bandung',
  portalCode: '16164',
  phoneNumber: '01829312831',
  picturePath: 'https://images.unsplash.com/photo-1594744803329-e58b31de8bf5?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',


);
