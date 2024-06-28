/// An Electrum client for Radiant.
///
/// Connects with https://github.com/Electrum-RVN-SIG/electrumx-radiant
library electrum_adapter;

import 'dart:async';

import 'connect.dart' as conn;
import 'client/subscribing_client.dart';
import 'methods/server/version.dart';

export 'methods/asset/addresses.dart';
export 'methods/asset/assets.dart';
export 'methods/asset/meta.dart';
export 'methods/scripthash/balance.dart';
export 'methods/scripthash/history.dart';
export 'methods/scripthash/unspent.dart';
export 'methods/server/features.dart';
export 'methods/server/stats.dart';
export 'methods/server/ping.dart';
export 'methods/server/version.dart';
export 'methods/transaction/broadcast.dart';
export 'methods/transaction/memo.dart';
export 'methods/transaction/get.dart';
export 'methods/transaction/fee.dart';

export 'subscriptions/subscribe_headers.dart';
export 'subscriptions/subscribe_asset.dart';
export 'subscriptions/subscribe_scripthash.dart';
export 'subscriptions/unsubscribe_scripthash.dart';

export 'connect.dart';

class Header {
  String hex;
  int height;
  Header(this.hex, this.height);
}

/// Methods on RadiantElectrumClient are defined in the `methods` directory.
/// See https://electrumx-radiant.readthedocs.io/en/latest/protocol-methods.html
class RadiantElectrumClient extends SubscribingClient {
  RadiantElectrumClient(channel) : super(channel);
  String clientName = 'MTWallet';
  String clientVersion = '1.0';
  String host = '';
  String protocolVersion = '1.10';
  int port = 50022;

  static Future<RadiantElectrumClient> connect(
    String host, {
    int port = 50022,
    Duration connectionTimeout = conn.connectionTimeout,
    Duration aliveTimerDuration = conn.aliveTimerDuration,
    bool acceptUnverified = true,
    String clientName = 'MTWallet',
    String clientVersion = '1.0',
    String protocolVersion = '1.10',
  }) async {
    var client = RadiantElectrumClient(await conn.connect(
      host,
      port: port,
      connectionTimeout: connectionTimeout,
      aliveTimerDuration: aliveTimerDuration,
      acceptUnverified: acceptUnverified,
    ));
    client.clientName = clientName;
    client.host = host;
    client.protocolVersion = protocolVersion;
    client.port = port;
    await client.serverVersion(
        clientName: '$clientName/$clientVersion',
        protocolVersion: protocolVersion);
    return client;
  }

  @override
  String toString() => 'RadiantElectrumClient connected to $host:$port';
}
