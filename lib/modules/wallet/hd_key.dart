import 'package:bip32/bip32.dart' as bip32;
import 'package:bip39/bip39.dart' as bip39;
import 'package:hex/hex.dart';
import 'package:web3dart/web3dart.dart';

class HDKey {
  static List<String> generateKey(
    String mnemonic, {
    int? route,
  }) {
    final privateKey = getPrivateKey(mnemonic, route: route);
    final private = EthPrivateKey.fromHex(privateKey);
    return [privateKey, private.address.hex];
  }

  static String getPrivateKey(
    String mnemonic, {
    int? route,
  }) {
    final seed = bip39.mnemonicToSeed(mnemonic);
    final root = bip32.BIP32.fromSeed(seed);
    final child1 = root.derivePath("m/44'/60'/0'/0/${route ?? 0}");
    final privateKey = HEX.encode(child1.privateKey!.toList());
    return privateKey;
  }

  static String getAddress(String privateKey) {
    final private = EthPrivateKey.fromHex(privateKey);
    return private.address.hex;
  }

  static String generateMnemonic() {
    final mnemonic = bip39.generateMnemonic();
    return mnemonic;
  }

  static bool validateMnemonic(String mnemonic) {
    return bip39.validateMnemonic(mnemonic);
  }

  static bool validateKey(String key) {
    return (key.length == 64 || key.length == 44);
  }
}
