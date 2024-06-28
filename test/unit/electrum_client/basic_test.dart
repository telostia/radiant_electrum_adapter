import 'package:test/test.dart';
import 'package:electrum_adapter/electrum_adapter.dart';

import '../mock_electrum_server.dart';

void main() {
  late MockElectrumServer server;
  setUp(() => server = MockElectrumServer());

  group('ElectrumClient', () {
    late RadiantElectrumClient client;
    setUp(() => client = RadiantElectrumClient(server.channel));

    test('gets server features', () async {
      server.willRespondWith('features', {
        'hosts': {},
        'pruning': null,
        'server_version': 'ElectrumX Radiant 1.9',
        'protocol_min': '1.4',
        'protocol_max': '1.9',
        'genesis_hash':
            '000000ecfc5e6324a079542221d00e10362bdc894d56500c414060eea8a3ad5a',
        'hash_function': 'sha256',
        'services': []
      });
      expect((await client.features())['genesis_hash'],
          '000000ecfc5e6324a079542221d00e10362bdc894d56500c414060eea8a3ad5a');
    });
  });
}
