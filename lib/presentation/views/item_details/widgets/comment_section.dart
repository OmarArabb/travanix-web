import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/core/functions/toast.dart';
import 'package:travanix/core/styles/text_styles.dart';
import 'package:travanix/presentation/manger/comments_cubit/cubit.dart';
import 'package:travanix/presentation/manger/comments_cubit/states.dart';

class CommentsSection extends StatelessWidget {
  const CommentsSection({
    super.key, required this.endPoint,

  });

  final String endPoint;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetCommentsCubit>(
      create: (context) =>
      GetCommentsCubit()..getHotelComments(endPoint: endPoint),
      child: BlocConsumer<GetCommentsCubit, GetCommentsStates>(
        listener: (context, state) {
          if(state is SuccessDeleteComments){
            successToast(state.successMessage);
          }
        },
        builder: (context, state) {
          GetCommentsCubit cubit = GetCommentsCubit.get(context);

          if (state is SuccessGetComments || state is SuccessDeleteComments) {
            return Column(
              children: [
                 Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Text(cubit.model!.avgRate.toString(),style: const TextStyle(fontSize: 36,fontWeight: FontWeight.bold),),
                      const SizedBox(width: 8,),
                      const Icon(Icons.star,color: Colors.amber,size: 48,)
                    ],
                  ),
                ),
                ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.3,
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 16,
                                    child: Icon(Icons.person),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    cubit.model!.data![index].touristName!,
                                    style: AppTextStyles.styleRegular14()
                                        .copyWith(fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  for (int i = 0;
                                  i < cubit.model!.data![index].rate!.toInt();
                                  i++)
                                    const Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                  if (cubit.model!.data![index].rate!.toInt() !=
                                      cubit.model!.data![index].rate!)
                                    const Icon(
                                      Icons.star_half,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      cubit.deleteComment(commentId: cubit.model!.data![index].commentId!);
                                    },
                                    icon: const Icon(
                                      Icons.delete_forever_rounded,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * .5,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 40.0),
                                child: Text(
                                  cubit.model!.data![index].comment!,
                                  style: AppTextStyles.styleRegular14().copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(
                      thickness: 2,
                    ),
                    itemCount: cubit.model!.data!.length),
              ],
            );
          } else if (state is LoadingGetComments) {
            return const CircularProgressIndicator();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}