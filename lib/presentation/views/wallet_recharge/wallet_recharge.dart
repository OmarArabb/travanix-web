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
        },
        builder: (context, state) {
          if (state is SuccessGetRequestState ||
              state is SuccessRechargeWalletState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Wallet Recharge Requests',
                  style: AppTextStyles.styleSemiBold24(),
                ),
                const SizedBox(
                  height: 24,
                ),
                const RechargeGridView(),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
