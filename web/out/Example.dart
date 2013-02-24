// Auto-generated from Example.html.
// DO NOT EDIT.

library Rtifact;

import 'dart:html' as autogenerated;
import 'dart:svg' as autogenerated_svg;
import 'package:web_ui/web_ui.dart' as autogenerated;

import 'dart:isolate';

import 'package:web_ui/watcher.dart' as watchers;

import '../AppModel.dart';

import '../ComponentMap.dart';

import 'dart:html';

import '../DivOverlay.dart';

import 'package:js/js.dart' as js;

import 'package:google_maps/google_maps.dart';

import 'package:google_maps/js_wrap.dart' as jsw;

import 'MapNavComponent.dart';
import 'OverlayComponent.dart';


// Original code
ComponentMap map;

void main() {
 
//  query("#text");
//  query("#postcontent").on.scroll.add(updateLook);

  js.scoped((){
    final mapOptions = new MapOptions()
      ..zoom = 20
      ..center = new LatLng(34.1011, -118.4062)
      ..mapTypeId = MapTypeId.SATELLITE
      ;
      var elem = query("#map");
      map = new ComponentMap(elem, mapOptions);
      jsw.retain(map);
      final swBound = new LatLng(34.0697095, -118.3621191);
      final neBound = new LatLng(34.2697094, -118.0621215);
      final bounds = new LatLngBounds(swBound, neBound);

      //DivOverlay overlay = jsw.retain(new DivOverlay(bounds, query("#postcontent"), map));

  });

  window.setTimeout((){
    window.navigator.geolocation.watchPosition(positionFound, 
        positionNotFound);
    window.navigator.geolocation.getCurrentPosition(positionFound, 
        positionNotFound);
  },1000);
}

void updateLook(Event event){
  DivElement postElem = query("#postsubmission");
  DivElement target = event.target;
  var scrollNorm = target.scrollTop/target.scrollHeight*80;
  postElem.style.setProperty("box-shadow", "0px 2px 20px rgba(0,0,0,$scrollNorm)");
}

void positionFound(Geoposition event){
  print("Found user's location ${event.coords.latitude}, ${event.coords.longitude}");
  print("Accuracy ${event.coords.accuracy}");
  js.scoped(() {
    LatLng loc = new LatLng(event.coords.latitude, event.coords.longitude);
    map.center = loc;
    app.user.loc = loc;
  });
}

void positionNotFound(PositionError event){
  print(event.message);
  print("Location not found");
}

// Additional generated code
void init_autogenerated() {
  var _root = autogenerated.document.body;
  var __e1, __map, __mapNav;

  var __t = new autogenerated.Template(_root);
  __mapNav = _root.query('#map-nav');
  __t.oneWayBind(() => (map), (e) { __mapNav.xtag.map = e; }, false);
  __t.oneWayBind(() => (app.user), (e) { __mapNav.xtag.user = e; }, false);
  new MapNavComponent.forElement(__mapNav);
  __t.component(__mapNav);
  __e1 = _root.query('#__e-1');
  __t.loop(__e1, () => (app.overlays), (overlay, __t) {
    var __e0;
    __e0 = new autogenerated.Element.html('<div style="display: none; height: 1px" is="x-overlay-component"></div>');
    __t.oneWayBind(() => (map), (e) { __e0.xtag.map = e; }, false);
    __t.oneWayBind(() => (overlay), (e) { __e0.xtag.overlay = e; }, false);
    new OverlayComponent.forElement(__e0);
    __t.component(__e0);
    __t.addAll([
      new autogenerated.Text('\n          '),
      __e0,
      new autogenerated.Text('\n       ')
    ]);
  });
  __map = _root.query('#map');
  

  __t.create();
  __t.insert();
}
