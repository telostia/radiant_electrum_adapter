import 'package:test/test.dart';
import 'package:electrum_adapter/connect.dart';
import 'package:electrum_adapter/client/subscribing_client.dart';

const radiantBlockTime = Duration(seconds: 60);

void main() {
  group('SubscribingClient', () {
    late SubscribingClient client;
    setUp(() async {
      // Our testnet server:
      var channel = await connect('143.198.142.78', port: 50012);

      // Radiant Foundation testnet server:
      // var channel = await connect('168.119.100.140', port: 50012);

      // HyperPeek's testnet server:
      // var channel = await connect('testnet.rvn.rocks', port: 50022);

      client = SubscribingClient(channel);
    });

    test('connects', () async {
      var response = await client.request('server.features');
      expect(response['genesis_hash'],
          '000000ecfc5e6324a079542221d00e10362bdc894d56500c414060eea8a3ad5a');
    });

    test('subscribes to headers', () async {
      registerSubscribable('blockchain.headers', 0);
      var results =
          await (await client.subscribe('blockchain.headers')).take(2).toList();
      expect(results.length, 2);
      expect(results[0].keys, ['hex', 'height']);
      expect(results[1].keys, ['hex', 'height']);
    }, timeout: Timeout(radiantBlockTime * 2));
  });
}
