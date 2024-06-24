// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_plane/components/widgets/transaction_card.dart';
import 'package:my_plane/cubit/transaction_cubit.dart';
import 'package:my_plane/shared/utils.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    super.initState();
    context.read<TransactionCubit>().fetchTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TransactionSuccess) {
          if (state.transactions.isEmpty) {
            return Center(
              child: Text(
                'Opps you don\'t have any transaction yet!',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
                textAlign: TextAlign.center,
              ),
            );
          } else {
            return Scaffold(
              backgroundColor: kBackgroundColor,
              appBar: AppBar(
                backgroundColor: kBackgroundColor,
                elevation: 0,
                surfaceTintColor: kBackgroundColor,
                title: Text(
                  'My Transactions',
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold,
                  ),
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.transactions.length,
                      padding: EdgeInsets.symmetric(
                        horizontal: defaultMargin,
                      ),
                      itemBuilder: (context, index) {
                        return TransactionCard(
                          state.transactions[index],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            );
          }
        }

        return Center(
          child: Text('Transaction Page'),
        );
      },
    );
  }
}
