import 'package:bogorTronik/models/models.dart';
import 'package:bogorTronik/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

part 'barang-state.dart';

class BarangCubit extends Cubit<BarangState> {
  BarangCubit() : super(BarangInitial());

  Future<void> getBarang() async {
    ApiReturnValue<List<Barang>> result = await BarangService.getBarang();

    if (result.value != null) {
      emit(BarangLoaded(result.value));
    } else {
      emit(BarangLoadingFailed(result.message));
    }
  }
}