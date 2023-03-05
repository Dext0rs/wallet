import 'package:as_wallet/global.dart';
import 'package:as_wallet/modules/polygonid/models/did_data.dart';
import 'package:as_wallet/pages/home/home_page.dart';
import 'package:as_wallet/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text(
                'Wallet',
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    _createWallet(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 60.0,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 12.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.black,
                    ),
                    child: const Center(
                      child: Text(
                        'Create Wallet',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                InkWell(
                  onTap: () {
                    _createWallet(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 60.0,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 12.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white,
                    ),
                    child: const Center(
                      child: Text(
                        'Import Wallet',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _createWallet(BuildContext context) async {
    DidData? didData;
    if (Constants.useMockData) {
      didData = DidData(
        identifier:
            "did:polygonid:polygon:mumbai:2qEJtsse8cnhV3Di3sSKzFLijutFbBWT7ishekAgLB",
        state: DidState(
          claimsTreeRoot:
              "3ed24bad5a6376c9ac844dcd4e6b3dafb2cc8092b34bd40c1c4b58b2edc73a03",
          createdAt: "2023-03-05T12:03:22.649183Z",
          modifiedAt: "2023-03-05T12:03:22.649183Z",
          state:
              "35dfacb19a28920eef2fc9ee2c1a75ed4bcb0c1a921407ac78eba8d6f8289a15",
          status: "confirmed",
        ),
      );
    } else {
      try {
        didData = await polygonIdService.getIdentity();
        debugPrint('Restored DID: $didData');
        if (didData == null) {
          didData = await polygonIdService.createIdentity();
          debugPrint('Created DID: $didData');
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            elevation: .0,
            backgroundColor: Colors.red,
            content: Text(
              'Failed to create DID.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
    if (didData != null) {
      Navigator.of(context).push(
          CupertinoPageRoute(builder: (_) => HomePage(didData: didData!)));
    }
  }
}
