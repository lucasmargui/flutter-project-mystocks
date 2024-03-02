import 'package:flutter/material.dart';

import '../../common/models/models.dart';

class Agreements extends StatelessWidget {
  const Agreements({super.key});

  List<AgreementsModel> get pages => [
        AgreementsModel(
          title: 'EULA',
          assetPath: 'MarkdownAssets.eula',
          namedRoute: '/eula',
        ),
        AgreementsModel(
          title: 'Privacy Policy',
          assetPath: 'MarkdownAssets.privacyPolicy',
          namedRoute: '/privacy-policy',
        ),
        AgreementsModel(
          title: 'Terms of Service',
          assetPath: 'MarkdownAssets.termsOfService',
          namedRoute: '/terms-of-service',
        ),
      ];

  @override
  Widget build(BuildContext context) {
    //TODO: https://github.com/flutter/flutter/issues/53568
    return Title(
      title: 'Agreements',
      color: Colors.black,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Agreements'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: pages
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                e.namedRoute,
                              );
                            },
                            child: Text(
                              e.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
