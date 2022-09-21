import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/model/Blogs_model/blogs_model.dart';
import 'package:lavie/model/Blogs_model/blogs_model.dart';
import 'package:lavie/model/plants_mdel/plants_model.dart';
import 'package:lavie/network/local/shardpre.dart';
import 'package:lavie/network/remote/Dio_helper.dart';
import 'package:lavie/network/remote/end_point/end_point.dart';
import 'package:lavie/screens_and_cubit/Blogs/cubit/states.dart';

class BlogsCubit extends Cubit<BlogsStatus> {
  BlogsCubit() : super(InitialBlogsStatus());
  static BlogsCubit get(context) => BlocProvider.of(context);

 

  DatabBLOGS? blogsModel;

  List<SeedsBlogs> seedsBlogs = [];
  int index = 0;
  void getBlogsData() {
    emit(BlogsLoadingState());
    DioHelper.getData(url: getBlogs, token:CacheHelper.getData(key:SharedKeys.token)).then((value) {
      blogsModel = DatabBLOGS.fromJson(value.data);

      blogsModel!.seeds!.forEach((element) {
        seedsBlogs.add(element);
      });

      print(
          'nnnnnnnnnnnnnnnnnnnnnnnnnnn${blogsModel!.seeds![index].description}');

      emit(BlogsSuccessState());
    }).catchError((error) {
      if (error is DioError) {
        print(
            'eeeeeeeeeeeeeeeL${error.response!.data['message']}eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
        emit(BlogsErrorState(error.response!.data['message']));
      }
    });
  }
}
