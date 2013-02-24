// Auto-generated from OverlayComponent.html.
// DO NOT EDIT.

library OverlayComponent;

import 'dart:html' as autogenerated;
import 'dart:svg' as autogenerated_svg;
import 'package:web_ui/web_ui.dart' as autogenerated;

import 'dart:html';

import 'dart:async';

import 'package:web_ui/web_ui.dart';

import '../AppModel.dart';

import 'package:js/js.dart' as js;

import 'package:google_maps/google_maps.dart' as gmaps;

import 'package:google_maps/js_wrap.dart' as jsw;

import '../ComponentMap.dart';

import '../DivOverlay.dart';

class OverlayComponent extends WebComponent {
  
  /** Autogenerated from the template. */
  
  /**
  * Shadow root for this component. We use 'var' to allow simulating shadow DOM
  * on browsers that don't support this feature.
  */
  var _root;
  autogenerated.DivElement __e7, __overlayContent;
  autogenerated.Template __t;
  
  OverlayComponent.forElement(e) : super.forElement(e);
  
  void created_autogenerated() {
    _root = createShadowRoot();
    __t = new autogenerated.Template(_root);
    _root.innerHtml = '''
    <div id="__e-7">
    <div id="overlay-content" style="color: white"></div>
    </div>
    ''';
    __e7 = _root.query('#__e-7');
    __overlayContent = __e7.query('#overlay-content');
    var __binding6 = __t.contentBind(() => (overlay.message));
    __overlayContent.nodes.add(__binding6);
    __t.listen(__e7.onClick, ($event) { edit($event); });
    
    __t.create();
  }
  
  void inserted_autogenerated() {
    __t.insert();
  }
  
  void removed_autogenerated() {
    __t.remove();
    __e7 = __overlayContent = __t = null;
  }
  
  void composeChildren() {
    super.composeChildren();
    if (_root is! autogenerated.ShadowRoot) _root = this;
  }
  
  /** Original code from the component. */
  
  Overlay overlay;
  ComponentMap map;
  gmaps.Marker marker;
  bool hasFocus=false;
  
  void inserted(){
    print("inserted");
    //DivOverlay overlay = DivOverlay()
    final seBound = new gmaps.LatLng(overlay.loc.lat - 1,
    overlay.loc.lng);
    final neBound = new gmaps.LatLng(overlay.loc.lat,
    overlay.loc.lng + 1);
    final bounds = new gmaps.LatLngBounds(seBound, neBound);
    print(this.children);
    Element elem = this.children[0].parent;
    DivOverlay divOverlay = jsw.retain(new DivOverlay(bounds, elem, map));
    js.scoped(() {
      marker = new gmaps.Marker(new gmaps.MarkerOptions()
      ..map = map
      ..position = overlay.loc
      );
      jsw.retain(marker);
    });
    window.setTimeout((){elem.style.setProperty("display","inline");}, 10);
    
  }
  
  void removed(){
    if (this.children.isEmpty == false){
      Element elem = this.children[0].parent;
      new Timer(250, (Timer t) => elem.remove());
      new Timer(250, (Timer t) => js.scoped((){marker.map = null;}));
    }
  }
}

