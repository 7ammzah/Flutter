import 'package:flutter/material.dart';

import '../../data_layer/models/expert.dart';

class ExpertItem extends StatelessWidget {
  final Expert expert;
  const ExpertItem({super.key, required this.expert});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: GridTile(
        footer: Container(
          alignment: Alignment.bottomCenter,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.black54,
          child: Text(
            '${expert.firstName} ${expert.lastName}',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: const TextStyle(
                height: 1.3,
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.grey,
          child: expert.path!.isNotEmpty
              ? FadeInImage.assetNetwork(
            placeholder: '',
            image: expert.path!,
            fit: BoxFit.cover,
          )
              : Image.asset(''),
        ),
      ),
    );
  }
}


