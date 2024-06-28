import 'package:equatable/equatable.dart';

import '../client/subscribing_client.dart';
import '../electrum_adapter.dart';

class BlockHeader extends Equatable {
  final String hex;
  final int height;

  BlockHeader(this.hex, this.height);

  @override
  List<Object> get props => <Object>[hex, height];
}

extension SubscribeHeadersMethod on RadiantElectrumClient {
  Stream<BlockHeader> subscribeHeaders() {
    var methodPrefix = 'blockchain.headers';

    // If this is the first time, register
    registerSubscribable(methodPrefix, 0);

    return subscribeNonBatch(methodPrefix)
        .asyncMap((item) => BlockHeader(item['hex'], item['height']));
  }
}
