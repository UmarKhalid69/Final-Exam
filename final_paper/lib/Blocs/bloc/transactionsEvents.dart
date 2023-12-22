import 'package:equatable/equatable.dart';

class transactionsEvent extends Equatable {
  const transactionsEvent();

  List<Object?> get props => throw UnimplementedError();
}

class LoadTransactions extends transactionsEvent {
  const LoadTransactions();

  @override
  List<Object?> get props => [];
}
