/// for
import '../../electrum_adapter.dart';

extension GetAssetNamesMethod on RadiantElectrumClient {
  Future<Iterable> getAssetsByPrefix(String symbol) async {
    return await request(
      'blockchain.asset.get_assets_with_prefix',
      [symbol.toUpperCase()],
    );
  }
}
