import 'dart:typed_data';
import 'package:bs58check/bs58check.dart';
import 'package:crypto/crypto.dart';
import 'package:ed25519_hd_key/ed25519_hd_key.dart';
import 'package:flash_tron_wallet/entity/tron/wallet_entity.dart';
import 'package:web3dart/crypto.dart';
import "package:hex/hex.dart";

import 'package:bip39/bip39.dart' as bip39;

class TronWallet {

  WalletEntity createWallet(String name, String pwd) {
    String randomMnemonic = bip39.generateMnemonic();
    String hexSeed = bip39.mnemonicToSeedHex(randomMnemonic);

    KeyData data = ED25519_HD_KEY.derivePath("m/44'/195'", hexSeed);

    String privateKey = HEX.encode(data.key);

    Uint8List key = privateKeyToPublic(hexToInt(privateKey));

    Uint8List tronAddress = getTronAddress(key);

    String base58Address = getBase58Address(tronAddress);

    return WalletEntity(name: name, pwd: pwd, mnemonic: randomMnemonic, privateKey: privateKey, tronAddress: base58Address);
  }

  WalletEntity importWalletByMnemonic(String name, String pwd, String mnemonic) {
    String hexSeed = bip39.mnemonicToSeedHex(mnemonic);

    KeyData data = ED25519_HD_KEY.derivePath("m/44'/195'", hexSeed);
    var pb = ED25519_HD_KEY.getBublickKey(data.key);

    String privateKey = HEX.encode(data.key);

    Uint8List key = privateKeyToPublic(hexToInt(privateKey));

    Uint8List tronAddress = getTronAddress(key);

    String base58Address = getBase58Address(tronAddress);

    return WalletEntity(name: name, pwd: pwd, mnemonic: mnemonic, privateKey: privateKey, tronAddress: base58Address);
  }

  WalletEntity importWalletByKey(String name, String pwd, String privateKey) {
    Uint8List key = privateKeyToPublic(hexToInt(privateKey));

    Uint8List tronAddress = getTronAddress(key);

    String base58Address = getBase58Address(tronAddress);

    return WalletEntity(name: name, pwd: pwd, privateKey: privateKey, tronAddress: base58Address);
  }

  Uint8List getTronAddress(Uint8List pubKey) {
    Uint8List one = keccak256(pubKey);

    Uint8List two = one.sublist(12, 32);

    String three = '41' + bytesToHex(two);
    return hexToBytes(three);
  }

  String getBase58Address(Uint8List address) {
    var result = sha256.convert(address).bytes;
    Uint8List one = sha256.convert(result).bytes;
    Uint8List two = one.sublist(0, 4);
    Uint8List three = hexToBytes(bytesToHex(address) + bytesToHex(two));
    String base58Address = base58.encode(three);
    return base58Address;
  }

  bool checkTronAddress(String tronAddress) {
    if (tronAddress.trim().length != 34) {
      return false;
    } else {
      Uint8List originAddress = base58.decode(tronAddress).sublist(0, 21);
      String hexAddress = bytesToHex(originAddress);
      if (hexAddress[0] != '4' || hexAddress[1] != '1') {
        return false;
      }
    }
    return true;
  }
}

