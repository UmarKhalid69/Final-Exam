import 'package:final_paper/Blocs/bloc/transactionsState.dart';
import 'package:final_paper/Blocs/model.dart';
import 'package:final_paper/Blocs/repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'transactionsEvents.dart';

class transactionsBloc extends Bloc<transactionsEvent, TransactionsState> {
  final TransactionRepo transactionRepo;

  transactionsBloc(this.transactionRepo) : super(TransactionsLoading()) {
    on<LoadTransactions>((event, emit) async {
      emit(TransactionsLoading());
      try {
        final transactions = await transactionRepo.getTransactions();
        emit(TransactionsLoaded(transactions as List<TransactionModel>));
      } catch (e) {
        emit(TransactionsError(e.toString()));
      }
    });
  }
}
