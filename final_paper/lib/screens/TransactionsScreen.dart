import 'package:final_paper/Blocs/bloc/transactionsBloc.dart';
import 'package:final_paper/Blocs/bloc/transactionsEvents.dart';
import 'package:final_paper/Blocs/bloc/transactionsState.dart';
import 'package:final_paper/Blocs/repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TransactionScreenState extends StatelessWidget {
  const TransactionScreenState({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            0, MediaQuery.of(context).size.width * 0.1, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.arrow_back),
                    Icon(Icons.more_horiz),
                  ]),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat('EEEE').format(DateTime.now()),
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(children: [
                        Text(
                          DateFormat('d').format(DateTime.now()),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 5),
                        Text(
                          DateFormat('MMMM')
                              .format(DateTime.now())
                              .substring(0, 3),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ]),
                    ],
                  ),
                  Spacer(),
                  Text(
                    '\$2,2983',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Transactions',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 1,
                          child: BlocProvider(
                              create: (context) =>
                                  transactionsBloc(TransactionRepo())
                                    ..add(LoadTransactions()),
                              child: BlocBuilder<transactionsBloc,
                                  TransactionsState>(
                                builder: (context, state) {
                                  if (state is TransactionsLoading) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  } else if (state is TransactionsLoaded) {
                                    return ListView.builder(
                                      itemCount: state.transactions.length,
                                      itemBuilder: (context, index) {
                                        print(state.transactions[index].icon);
                                        return ListTile(
                                          leading: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Colors.grey[200],
                                            ),
                                            child: Image.network(
                                              state.transactions[index].icon ??
                                                  'https://picsum.photos/250?image=9',
                                              width: 50,
                                              height: 50,
                                            ),
                                          ),
                                          title: Text(
                                            state.transactions[index].title ??
                                                'null',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          subtitle: Text(
                                              state.transactions[index].date ??
                                                  'null',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                              )),
                                          trailing: Text(
                                            '${state.transactions[index].transactionType == true ? '-' : '+'}\$${state.transactions[index].amount.toString()}',
                                            style: TextStyle(
                                              color: state.transactions[index]
                                                          .transactionType ==
                                                      true
                                                  ? Colors.red
                                                  : Colors.blue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  } else if (state is TransactionsError) {
                                    return Center(child: Text(state.message));
                                  } else {
                                    return const Center(
                                        child: Text('Something went wrong'));
                                  }
                                },
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
