import 'package:bogorTronik/models/models.dart';
import 'package:bogorTronik/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

part 'transaction-state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  Future<void> getTransaction() async {
    ApiReturnValue<List<Transaction>> result =
        await TransactionService.getTransaction();

    if (result.value != null) {
      emit(TransactionLoaded(result.value));
    } else {
      emit(TransactionLoadingFailed(result.message));
    }
  }

  Future<bool> submitTransaction(Transaction transaction) async {
    ApiReturnValue<Transaction> result =
        await TransactionService.submitTransaction(transaction);

    if (result.value != null) {
      emit(TransactionLoaded(
          (state as TransactionLoaded).transaction + [result.value]));
      return true;
    } else {
      return false;
    }
  }
}
