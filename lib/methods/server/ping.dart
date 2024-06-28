import '../../electrum_adapter.dart';

extension PingServerMethod on RadiantElectrumClient {
  Future<dynamic> ping() async => await request('server.ping');
}
