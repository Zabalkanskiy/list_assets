import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_assets/feature/list_assets_screen/presentation/bloc/list_assets_bloc.dart';

import 'crypto_item.dart';

class ListAssetsScreen extends StatefulWidget {
  const ListAssetsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ListAssertsScreenState();
}

class _ListAssertsScreenState extends State<ListAssetsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    context.read<ListAssetsBloc>().add(LoadCryptoEvent());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<ListAssetsBloc>().add(LoadMoreCryptoEvent());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto List'),
      ),
      body: BlocBuilder<ListAssetsBloc, ListAssetsState>(
        builder: (context, state) {
          if (state is CryptoInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CryptoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CryptoError) {
            return Center(child: Text('Error: ${state.message}'));
          } else if (state is CryptoLoaded) {
            return _buildList(state);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _buildList(CryptoLoaded state) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: state.hasReachedMax
          ? state.assets.length
          : state.assets.length + 1,
      itemBuilder: (context, index) {
        if (index >= state.assets.length) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        return CryptoItem(asset: state.assets[index]);
      },
    );
  }

}