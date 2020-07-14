import 'package:equatable/equatable.dart';
import 'package:expenses/Models/transaction.dart';
import 'package:expenses/Stub/transactions_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// TODO: Refactor these classes to individual files. 

class LoadTransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  LoadTransactionsBloc(TransactionsState initialState) : super(initialState) {
    initialState = TransactionsNotLoaded();
  }

  @override
  Stream<TransactionsState> mapEventToState(TransactionsEvent event) async* {
    if (event is LoadTransactions) {
      yield* _mapLoadTransactionsEventToState(event);
    }
  }

  Stream<TransactionsState> _mapLoadTransactionsEventToState(
      LoadTransactions event) async* {
    yield TransactionsLoading();
    try {
      var _ = await Future.delayed(Duration(seconds: 3));

      final result = Stub.transactions; // TODO: Replace with API call
      yield TransactionsLoaded(result);
    } catch (error) {
      yield TransactionsError(error);
    }
  }
}

@immutable
abstract class TransactionsEvent extends Equatable {
  const TransactionsEvent();
}

class AddNewTransaction extends TransactionsEvent {
  final TransactionModel transaction;

  const AddNewTransaction(this.transaction);

  @override
  List<Object> get props => [];
}

class LoadTransactions extends TransactionsEvent {
  //final List<TransactionModel> transactions;

  const LoadTransactions();

  @override
  List<Object> get props => [];
}

// *****************************************************
// *                    STATE                          *
// *****************************************************

abstract class TransactionsState extends Equatable {
  TransactionsState([List props = const []]) : super();
}

class TransactionsLoading extends TransactionsState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'TransactionsLoadingState';
}

class TransactionsNotLoaded extends TransactionsState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'TransactionsNotLoadedState';
}

class TransactionsLoaded extends TransactionsState {
  final List<TransactionModel> transactions;

  TransactionsLoaded(this.transactions) : super(transactions);

  @override
  List<Object> get props => [];

  @override
  String toString() => 'TransactionsLoadedState';
}

class TransactionsError extends TransactionsState {
  final String errorMsg;

  TransactionsError(this.errorMsg) : super([errorMsg]);

  @override
  List<Object> get props => [];

  @override
  String toString() => 'TransactionsErrorState';
}
