// dart --sound-null-safety test test/integration/get_stats_test.dart --concurrency=1
import 'package:test/test.dart';
import 'package:electrum_adapter/electrum_adapter.dart';

void main() {
  group('electrum_client', () {
    test('get our asset meta and transaction (original owner)', () async {
      var client = await RadiantElectrumClient.connect('testnet.rvn.rocks');
      var meta = await client.getMeta('ZVZZT!');
      print(meta);
      expect(meta != null, true);
      var tx = await client.getTransaction(meta!.source.txHash);
      print(tx);
    });
    test('get our asset meta and transaction (original owner) MAIN', () async {
      var client = await RadiantElectrumClient.connect('electrum1.rvn.rocks');
      var meta = await client.getMeta('PORKYPUNX/AIRDROP2');
      print(meta);
      expect(meta != null, true);
      var tx = await client.getTransaction(meta!.source.txHash); // ?? timesout
      print(tx);
    });
  });
}
