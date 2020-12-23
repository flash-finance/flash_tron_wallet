import 'package:flash_tron_wallet/tron/service/tron_swap.dart';

const String userAddress = '';
const String privateKey = '';
const String tronGrpcIP = '13.127.47.162';

void main() {
  //testGetTrxBalance();
  testGetTrc20Balance();

  //testAllowance();

  //testApprove();
  //testTrxToTokenSwap();
  //testTokenToTrxSwap();
  //testTokenToTokenSwap();
}

void testGetTrxBalance() async {
  print('testGetTrxBalance start');
  String result = await TronSwap().getTrxBalance(tronGrpcIP, userAddress);
  print('testGetTrxBalance end, result:$result');
}

void testGetTrc20Balance() async {
  print('testGetTrc20Balance start');
  String tokenAddress = 'TR7NHqjeKQxGTCi8q8ZY4pL8otSzgjLj6t';
  String result =
      await TronSwap().getTrc20Balance(tronGrpcIP, userAddress, tokenAddress);
  print('testGetTrc20Balance end, result: $result');
}

void testAllowance() async {
  print('testAllowance start');
  String swapTokenAddress = 'TMwFHYXLJaRUPeW6421aqXL4ZEzPRFGkGT';
  String flashSwapAddress = 'TGS7NxoAQ44pQYCSAW3FPrVMhQ1TpdsTXg';
  int tokenPrecision = 6;
  String result = await TronSwap()
      .allowance(tronGrpcIP, userAddress, swapTokenAddress, flashSwapAddress);
  print('testAllowance end result:$result');
}

void testApprove() async {
  print('testApprove start');
  String swapTokenAddress = 'TR7NHqjeKQxGTCi8q8ZY4pL8otSzgjLj6t';
  String flashSwapAddress = 'TGS7NxoAQ44pQYCSAW3FPrVMhQ1TpdsTXg';
  bool result = await TronSwap().approve(
      tronGrpcIP, userAddress, privateKey, swapTokenAddress, flashSwapAddress);
  print('testApprove end, result: $result');
}

void testTrxToTokenSwap() async {
  print('testTrxToTokenSwap start');
  String flashSwapAddress = 'TGS7NxoAQ44pQYCSAW3FPrVMhQ1TpdsTXg';
  String swapTokenAddress = 'TR7NHqjeKQxGTCi8q8ZY4pL8otSzgjLj6t';
  String lpTokenAddress = 'TQn9Y2khEsLJW1ChVWFMSMeRDow5KcbLSE';
  String trxSold = '50.00';

  bool result = await TronSwap().trxToTokenSwap(tronGrpcIP, userAddress,
      privateKey, flashSwapAddress, swapTokenAddress, lpTokenAddress, trxSold);
  print('testTrxToTokenSwap end, result:$result');
}

void testTokenToTrxSwap() async {
  print('testTokenToTrxSwap start');
  String flashSwapAddress = 'TGS7NxoAQ44pQYCSAW3FPrVMhQ1TpdsTXg';
  String swapTokenAddress = 'TKkeiboTkxXKJpbmVFbv4a8ov5rAfRDMf9';
  String lpTokenAddress = 'TUEYcyPAqc4hTg1fSuBCPc18vGWcJDECVw';
  String tokensSold = '3.1';
  bool result = await TronSwap().tokenToTrxSwap(
      tronGrpcIP,
      userAddress,
      privateKey,
      flashSwapAddress,
      swapTokenAddress,
      lpTokenAddress,
      tokensSold);
  print('testTokenToTrxSwap end, result:$result');
}

void testTokenToTokenSwap() async {
  print('testTokenToTrxSwap start');
  String flashSwapAddress = 'TGS7NxoAQ44pQYCSAW3FPrVMhQ1TpdsTXg';
  String swapTokenAddress = 'TKkeiboTkxXKJpbmVFbv4a8ov5rAfRDMf9';
  String lpTokenAddress = 'TUEYcyPAqc4hTg1fSuBCPc18vGWcJDECVw';
  String tokensSold = '3.1';
  String targetTokenAddress = 'TR7NHqjeKQxGTCi8q8ZY4pL8otSzgjLj6t';
  bool result = await TronSwap().tokenToTokenSwap(
      tronGrpcIP,
      userAddress,
      privateKey,
      flashSwapAddress,
      swapTokenAddress,
      lpTokenAddress,
      tokensSold,
      targetTokenAddress);
  print('testTokenToTrxSwap end, result:$result');
}
