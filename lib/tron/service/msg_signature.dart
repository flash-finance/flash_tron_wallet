import 'dart:typed_data';

class TronMsgSignature {
  final Uint8List r;
  final Uint8List s;
  final int v;

  TronMsgSignature(this.r, this.s, this.v);

  Uint8List getSignature() {
    Uint8List sig = Uint8List(65);
    arrayCopy(r, 0, sig, 0, 32);
    arrayCopy(s, 0, sig, 32, 32);
    sig[64] = v;
    return sig;
  }
}

List<int> arrayCopy(bytes, srcOffset, result, destOffset, bytesLength) {
  for (var i = srcOffset; i < bytesLength; i++) {
    result[destOffset + i] = bytes[i];
  }
  return result;
}