import '../client/subscribing_client.dart';
import '../electrum_adapter.dart';

extension SubscribeAssetMethod on RadiantElectrumClient {
  Future<Stream<String?>> subscribeAsset(String assetName) async {
    var methodPrefix = 'blockchain.asset';

    // If this is the first time, register
    registerSubscribable(methodPrefix, 1);

    return (await subscribe(methodPrefix, [assetName]))
        .asyncMap((item) => item);
  }
}
