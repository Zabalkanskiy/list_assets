part of 'list_assets_bloc.dart';

abstract class ListAssetsState extends Equatable {
  const ListAssetsState();

  @override
  List<Object> get props => [];
}

class CryptoInitial extends ListAssetsState {}

class CryptoLoading extends ListAssetsState {}

class CryptoLoaded extends ListAssetsState {
  final List<CryptoAsset> assets;
  final bool hasReachedMax;

  const CryptoLoaded({
    required this.assets,
    this.hasReachedMax = false,
  });

  @override
  List<Object> get props => [assets, hasReachedMax];
}

class CryptoError extends ListAssetsState {
  final String message;

  const CryptoError(this.message);

  @override
  List<Object> get props => [message];
}