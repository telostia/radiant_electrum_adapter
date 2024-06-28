import '../../electrum_adapter.dart';

extension BroadcastTransactionMethod on RadiantElectrumClient {
  Future<String> broadcastTransaction(String rawTx) async => await request(
        'blockchain.transaction.broadcast',
        [rawTx],
      ) as String;

  /// returns transaction hashs as hexadecimal strings in the same order as rawTxs passed in
  Future<List<String>> broadcastTransactions(List<String> rawTxs) async {
    var futures = <Future<String>>[];
    if (rawTxs.isNotEmpty) {
      peer.withBatch(() {
        for (var rawTx in rawTxs) {
          futures.add(broadcastTransaction(rawTx));
        }
      });
    }
    List<String> results = await Future.wait<String>(futures);
    return results;
  }
}
