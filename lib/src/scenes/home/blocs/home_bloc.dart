import 'package:bloc/bloc.dart';
import 'package:restaurant/src/core/errror/failure.dart';
import 'package:restaurant/src/data/models/banner_model.dart';
import 'package:restaurant/src/platform/repositories/home_repository.dart';
import 'package:restaurant/src/scenes/home/blocs/bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required HomeRepository repository})
      : this.repository = repository,
        super(HomeInitial());

  final HomeRepository repository;

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeNewListRequested) {
      yield* mapListBannersRequestedToState(event);
    }
  }

  Stream<HomeState> mapListBannersRequestedToState(
      HomeNewListRequested event) async* {
    try {
      final result = await repository.fetchHomeBanners();
      if (result.isRight() == true) {
        final List<BannerModel>? banners = result.getOrElse(() => []);
        yield HomeNewListSuccess(banners: banners);
      }
    } on HomeNewListFailure catch (error) {
      yield HomeNewListFailure('HomeNewListFailure');
    }
  }
}
