import '../../electrum_adapter.dart';

extension FeaturesMethod on RadiantElectrumClient {
  Future<Map<String, dynamic>> features() async =>
      await request('server.version');
}
