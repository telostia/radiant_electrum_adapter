A Dart-based client for Radiant ElectrumX servers

## Notes

The Radiant ElectrumX server is quite similar to the Bitcion Electrum server, but has additional methods that allow clients to handle asset issuance and transferral.

## Usage

```dart
import 'package:electrum_adapter/electrum_adapter.dart';

void main() async {
  var client =
      await RadiantElectrumClient.connect('testnet.rvn.rocks', port: 50022);
  var features = await client.features();
  print(features);
  await client.close();
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/moontreeapp/electrum_adapter/issues
