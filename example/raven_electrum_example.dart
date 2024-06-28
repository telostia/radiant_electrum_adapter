import 'package:electrum_adapter/electrum_adapter.dart';

void main() async {
  var client = await RadiantElectrumClient.connect(
      'electrumx2.radiant4people.com',
      port: 50022);
  var features = await client.features();
  print(features);
  await client.close();
}
