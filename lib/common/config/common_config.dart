class CommonConfig {
  static final bool debug = true;
  static final String fontFamily = 'ZH-R';

  static final String baseServiceUrl = 'https://flash2c.cn';
  static final String tronInfoQueryUrl = 'tronInfoQueryUrl';
  static final String swapQueryUrl = 'swapQueryUrl';
  static final servicePath = <String, String>{
    tronInfoQueryUrl: baseServiceUrl + '/flash/api/v1/common/tron/info/query',
    swapQueryUrl: baseServiceUrl + '/flash/api/v1/common/tron/swap/query',
  };
}
