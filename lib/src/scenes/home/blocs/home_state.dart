import 'package:equatable/equatable.dart';
import 'package:restaurant/src/data/models/banner_model.dart';

class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeNewListSuccess extends HomeState {
  List<BannerModel>? banners;

  HomeNewListSuccess({
    this.banners,
  });

  @override
  List<Object> get props => [
        banners ?? [],
      ];

  List<BannerModel> get listBanners {
    if (banners == null) {
      return [];
    }
    return banners!;
  }
}

class HomeNewListFailure extends HomeState {
  String message;
  HomeNewListFailure(this.message);

  @override
  List<Object> get props => [message];
}
