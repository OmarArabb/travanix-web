import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travanix/core/styles/colors.dart';
import 'package:travanix/core/styles/text_styles.dart';
import 'package:travanix/core/widgets/custom_material_button.dart';
import 'package:travanix/core/widgets/custom_text_form_field.dart';
import 'package:travanix/presentation/manger/recharge_wallet_cubit/cubit.dart';

class WalletRechargeGridItem extends StatelessWidget {
  const WalletRechargeGridItem({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    RechargeWalletCubit cubit = RechargeWalletCubit.get(context);
    GlobalKey<FormState> formKey = GlobalKey();
    TextEditingController controller = TextEditingController();

    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: Colors.grey[400]!, width: 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '# ${cubit.requests![index].id}',
                  style: AppTextStyles.styleSemiBold16()
                      .copyWith(color: basicColor),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      cubit.id = cubit.requests![index].id;
                      cubit.status = false;
                      cubit.amount = 0;
                      cubit.requests!.removeAt(index);
                      cubit.rechargeWallet();
                    },
                    icon: const Icon(
                      Icons.delete,
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '${cubit.requests![index].touristEmailAddress}',
              style: AppTextStyles.styleSemiBold16()
                  .copyWith(color: Colors.black.withOpacity(0.7)),
            ),
            const SizedBox(
              height: 10,
            ),
            Text('Request Code : ${cubit.requests![index].chargeCode}'),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    height: 40,
                    child: CustomTextFormField(
                      hintText: 'Amount',
                      validator: (String? value) {
                        return value!.isEmpty ? 'Please Enter The Value' : null;
                      },
                      controller: controller,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: CustomMaterialButton(
                    height: 47,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        cubit.id = cubit.requests![index].id;
                        cubit.status = true;
                        cubit.amount = int.parse(controller.text);
                        cubit.requests!.removeAt(index);
                        cubit.rechargeWallet();
                      }
                    },
                    child: Text(
                      'Recharge',
                      style: AppTextStyles.styleRegular12()
                          .copyWith(color: whiteColor),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
