import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_assets/core/data/assets.dart';
import 'package:list_assets/feature/list_assets_screen/domain/list_assets_interactor.dart';
import 'package:equatable/equatable.dart';

part 'list_assets_event.dart';
part 'list_assets_state.dart';

class ListAssetsBloc extends Bloc<ListAssetsEvent, ListAssetsState> {
  ListAssetsInteractor listAssetsInteractor;
  final int _pageSize = 15;
  int _currentOffset = 0;

  ListAssetsBloc({required this.listAssetsInteractor}) : super(CryptoInitial()) {
    on<LoadCryptoEvent>(_onLoadCrypto);
    on<LoadMoreCryptoEvent>(_onLoadMoreCrypto);
  }

  Future<void> _onLoadCrypto(
      LoadCryptoEvent event,
      Emitter<ListAssetsState> emit,
      ) async {
    emit(CryptoLoading());
    try {
      List<Datum> listDatum = await listAssetsInteractor.getListDatum(limit: _pageSize);
      _currentOffset = _pageSize;
      emit(CryptoLoaded(
        assets: listDatum,
        hasReachedMax: listDatum.length < _pageSize,
      ));
    } catch (e) {
      emit(CryptoError(e.toString()));
    }
  }

  Future<void> _onLoadMoreCrypto(
      LoadMoreCryptoEvent event,
      Emitter<ListAssetsState> emit,
      ) async {
    if (state is CryptoLoaded) {
      final currentState = state as CryptoLoaded;
      if (currentState.hasReachedMax) return;

      try {
        List<Datum> listDatum = await listAssetsInteractor.getListDatum(
          limit: _pageSize,
          offset: _currentOffset,
        );

        _currentOffset += _pageSize;
        emit(CryptoLoaded(
          assets: [...currentState.assets, ...listDatum],
          hasReachedMax: listDatum.length < _pageSize,
        ));
      } catch (e) {
        emit(CryptoError(e.toString()));
      }
    }
  }

}