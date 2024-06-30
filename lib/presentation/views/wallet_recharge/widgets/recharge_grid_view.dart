import 'package:flutter/material.dart';
import 'package:travanix/presentation/manger/recharge_wallet_cubit/cubit.dart';
import 'package:travanix/presentation/views/wallet_recharge/widgets/wallet_recharge_grid_item.dart';

class RechargeGridView extends StatelessWidget {
  const RechargeGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 400 / 190,
        crossAxisCount: 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemCount: RechargeWalletCubit.get(context).requests!.length,
      itemBuilder: (context, index) {
        return WalletRechargeGridItem(
          index: index,
        );
      },
    );
  }
}
