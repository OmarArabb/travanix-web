import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/core/functions/toast.dart';
import 'package:travanix/core/styles/text_styles.dart';
import 'package:travanix/presentation/manger/recharge_wallet_cubit/cubit.dart';
import 'package:travanix/presentation/manger/recharge_wallet_cubit/states.dart';
import 'package:travanix/presentation/views/wallet_recharge/widgets/recharge_grid_view.dart';

class WalletRecharge extends StatelessWidget {
  const WalletRecharge({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RechargeWalletCubit()..getRequestToRecharge(),
      child: BlocConsumer<RechargeWalletCubit, RechargeWalletStates>(
        listener: (context, state) {
          if (state is SuccessRechargeWalletState) {
            successToast(state.successMessage);
          }
          if (state is ErrorRechargeWalletState) {
            errorToast(state.errMessage);
          }
          if (state is ErrorGetRequestState) {
            errorToast(state.errMessage);
          }
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        RechargeWalletCubit.get(context).getRequestToRecharge();
                      },
                      icon: const Icon(Icons.refresh)),
                  Text(
                    'Wallet Recharge Requests',
                    style: AppTextStyles.styleSemiBold24(),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              if (state is SuccessGetRequestState ||
                  state is SuccessRechargeWalletState)
                const RechargeGridView(),
              if (state is LoadingRechargeWalletState ||
                  state is LoadingGetRequestState)
                const Center(child: CircularProgressIndicator()),
            ],
          );
        },
      ),
    );
  }
}
