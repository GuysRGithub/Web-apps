import 'dart:html' as html;
import 'package:flutter/material.dart';

import '../widgets/translate_on_hover.dart';


extension HoverExtension on Widget {
  static final appContainer = html.window.document.getElementById('app_container');

  Widget get showCursorOnHover{
    return MouseRegion(
      child: this,
      onHover: (event) => appContainer.style.cursor = 'pointer',
      onExit: (event) => appContainer.style.cursor = 'default',
    
    );
  }
   Widget get moveUpHover{
    return TranslateHover(child: this,);
  }
}