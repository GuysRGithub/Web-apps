import 'package:flutter/material.dart';
import 'package:provider_architecture/viewmodel_provider.dart';

import '../../datamodels/season_details_model.dart';
import '../../viewmodels/episodes_view_model.dart';
import '../../widgets/episodes_list/episodes_list.dart';
import '../../widgets/season_details/season_details.dart';
import '../../widgets/translate_on_hover.dart';


class EpisodesView extends StatelessWidget {
  const EpisodesView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<EpisodesViewModel>.withConsumer(
      viewModel: EpisodesViewModel(),
      onModelReady: (model) => model.getEpisodes(),
      builder: (context, model, child) => SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          SeasonDetails(
            details: SeasonDetailsModel(
              title: 'SEASON 1',
              description:
                  'This season covers the absolute basics of Flutter Web Dev to get us up and running with a basic web app.',
            ),
          ),
          SizedBox(
            height: 50,
          ),
          model.episodes == null
              ? CircularProgressIndicator()
              : EpisodesList(episodes: model.episodes),
        ],
      )),
    );
  }
}
