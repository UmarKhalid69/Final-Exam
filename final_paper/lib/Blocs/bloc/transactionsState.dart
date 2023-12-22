import 'package:equatable/equatable.dart';
import 'package:final_paper/Blocs/model.dart';

abstract class TransactionsState extends Equatable {
  TransactionsState() {}
}

class TransactionsInitial extends TransactionsState {
  @override
  List<Object> get props => [];
}

class TransactionsLoading extends TransactionsState {
  @override
  List<Object> get props => [];
}

class TransactionsLoaded extends TransactionsState {
  final List<TransactionModel> transactions;

  TransactionsLoaded(this.transactions);

  @override
  List<Object> get props => [transactions];
}

class TransactionsError extends TransactionsState {
  final String message;

  TransactionsError(this.message);

  @override
  List<Object> get props => [message];
}
