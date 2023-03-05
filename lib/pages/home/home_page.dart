import 'package:as_wallet/modules/polygonid/models/did_data.dart';
import 'package:as_wallet/modules/wallet/hd_key.dart';
import 'package:as_wallet/pages/qr_scanner/qr_scanner_page.dart';
import 'package:as_wallet/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatelessWidget {
  final DidData didData;

  const HomePage({super.key, required this.didData});

  @override
  Widget build(BuildContext context) {
    final address =
        HDKey.getAddress(HDKey.getPrivateKey(Constants.walletMnemonic));

    return Scaffold(
      // backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        // backgroundColor: Colors.red,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Row(
          children: [
            Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
                // side: const BorderSide(color: Colors.grey, width: 1.5),
              ),
              elevation: 0,
              color: Colors.white,
              shadowColor: Colors.grey.shade200,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 8.0, 16.0, 8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.account_circle_outlined,
                      color: Colors.black87,
                      size: 24.0,
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      '${address.substring(0, 4)}...${address.substring(address.length - 4, address.length)}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  LineIcons.cog,
                  color: Colors.black87,
                  size: 24.0,
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
        children: [
          _yourDid(didData),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'My Claims',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 23.0,
                  ),
                ),
                const Spacer(),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      LineIcons.syncIcon,
                      color: Colors.black87,
                      size: 24.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          Card(
            color: Colors.blueAccent,
            elevation: 0.8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Container(
              height: 200.0,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'KYC Age Credential',
                    style: TextStyle(
                      fontSize: 23.0,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Issuer',
                    style: TextStyle(
                      color: Colors.grey.shade100,
                      letterSpacing: 0.2,
                      fontSize: 13.5,
                    ),
                  ),
                  const Text(
                    'did:polygonid:polygon:mumbai:2qGGx7ZEJuqPBk4QgBdXHitgzc3okJyjXhbnLvGgWu',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: _connect(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _yourDid(DidData didData) {
    return Card(
      color: Colors.white,
      elevation: 0.8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        height: 100.0,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your DID',
              style: TextStyle(
                fontSize: 23.0,
                color: Colors.grey,
              ),
            ),
            const Spacer(),
            Text(
              didData.identifier.substring(
                      0,
                      didData.identifier.length -
                          didData.identifier.split(':').last.length) +
                  didData.identifier.split(':').last.substring(0, 4) +
                  '...' +
                  didData.identifier.split(':').last.substring(
                      didData.identifier.split(':').last.length - 4,
                      didData.identifier.split(':').last.length),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _connect(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(CupertinoPageRoute(builder: (_) => const QRView()));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Colors.black,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text(
              'Connect',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 8.0),
            Icon(
              // LineIcons.qrcode,
              Icons.qr_code_scanner_outlined,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
