part of 'barang-cubit.dart';

abstract class BarangState extends Equatable {
  const BarangState();

  @override
  List<Object> get props => [];
}

class BarangInitial extends BarangState {}

class BarangLoaded extends BarangState {
  final List<Barang> barang;
  BarangLoaded(this.barang);

  @override
  List<Object> get props => [barang];
}

class BarangLoadingFailed extends BarangState {
  final String message;

  BarangLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
