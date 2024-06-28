import 'package:test/test.dart';
import 'package:electrum_adapter/connect.dart';
import 'package:electrum_adapter/client/base_client.dart';

void main() {
  group('BaseClient', () {
    test('connects', () async {
      var channel = await connect('electrumx2.radiant4people.com');
      var client = BaseClient(channel);
      var response = await client.request('server.features');
      expect(response['genesis_hash'],
          '0000000065d8ed5d8be28d6876b3ffb660ac2a6c0ca59e437e1f7a6f4e003fb4');
    });
  });
}
