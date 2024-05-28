import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travanix/presentation/manger/create_items_cubit/states.dart';

class CreateItemsCubit extends Cubit<CreateItemsStates> {
  CreateItemsCubit() : super(InitialCreateItemsState());

  static CreateItemsCubit get(context) => BlocProvider.of(context);

  List<String>? decodedImages = [];

  List<XFile> pickedImages = [];

  Future<void> pickAndEncodeMultiImages() async {
    try {
      pickedImages = await ImagePicker().pickMultiImage();
      emit(LoadingToAddMultiImagesState());
      decodedImages!.clear();
      for (XFile file in pickedImages) {
        decodedImages!.add(base64Encode(await file.readAsBytes()));
      }
      emit(SuccessToAddMultiImagesState());
    } on Exception catch (e) {
      emit(ErrorToAddMultiImagesState(errorMessage: e.toString()));
    }
  }

  Future<void> pickAndEncodeSingleImage(int index) async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery);
    decodedImages?[index] =
        base64Encode(await file!.readAsBytes());
    emit(AddSingleImageItemsState());
  }
}
