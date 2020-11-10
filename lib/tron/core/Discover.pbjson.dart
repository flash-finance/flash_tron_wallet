///
//  Generated code. Do not modify.
//  source: core/Discover.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const Endpoint$json = const {
  '1': 'Endpoint',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 12, '10': 'address'},
    const {'1': 'port', '3': 2, '4': 1, '5': 5, '10': 'port'},
    const {'1': 'nodeId', '3': 3, '4': 1, '5': 12, '10': 'nodeId'},
  ],
};

const PingMessage$json = const {
  '1': 'PingMessage',
  '2': const [
    const {'1': 'from', '3': 1, '4': 1, '5': 11, '6': '.protocol.Endpoint', '10': 'from'},
    const {'1': 'to', '3': 2, '4': 1, '5': 11, '6': '.protocol.Endpoint', '10': 'to'},
    const {'1': 'version', '3': 3, '4': 1, '5': 5, '10': 'version'},
    const {'1': 'timestamp', '3': 4, '4': 1, '5': 3, '10': 'timestamp'},
  ],
};

const PongMessage$json = const {
  '1': 'PongMessage',
  '2': const [
    const {'1': 'from', '3': 1, '4': 1, '5': 11, '6': '.protocol.Endpoint', '10': 'from'},
    const {'1': 'echo', '3': 2, '4': 1, '5': 5, '10': 'echo'},
    const {'1': 'timestamp', '3': 3, '4': 1, '5': 3, '10': 'timestamp'},
  ],
};

const FindNeighbours$json = const {
  '1': 'FindNeighbours',
  '2': const [
    const {'1': 'from', '3': 1, '4': 1, '5': 11, '6': '.protocol.Endpoint', '10': 'from'},
    const {'1': 'targetId', '3': 2, '4': 1, '5': 12, '10': 'targetId'},
    const {'1': 'timestamp', '3': 3, '4': 1, '5': 3, '10': 'timestamp'},
  ],
};

const Neighbours$json = const {
  '1': 'Neighbours',
  '2': const [
    const {'1': 'from', '3': 1, '4': 1, '5': 11, '6': '.protocol.Endpoint', '10': 'from'},
    const {'1': 'neighbours', '3': 2, '4': 3, '5': 11, '6': '.protocol.Endpoint', '10': 'neighbours'},
    const {'1': 'timestamp', '3': 3, '4': 1, '5': 3, '10': 'timestamp'},
  ],
};

const BackupMessage$json = const {
  '1': 'BackupMessage',
  '2': const [
    const {'1': 'flag', '3': 1, '4': 1, '5': 8, '10': 'flag'},
    const {'1': 'priority', '3': 2, '4': 1, '5': 5, '10': 'priority'},
  ],
};

