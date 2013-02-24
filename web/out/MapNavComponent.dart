// Auto-generated from MapNavComponent.html.
// DO NOT EDIT.

library MapNavComponent;

import 'dart:html' as autogenerated;
import 'dart:svg' as autogenerated_svg;
import 'package:web_ui/web_ui.dart' as autogenerated;

import 'dart:html';

import 'package:web_ui/web_ui.dart';

import '../AppModel.dart';

import 'package:js/js.dart' as js;

import 'package:google_maps/google_maps.dart';

import 'package:google_maps/js_wrap.dart' as jsw;

import '../ComponentMap.dart';

class MapNavComponent extends WebComponent {
  
  /** Autogenerated from the template. */
  
  /**
  * Shadow root for this component. We use 'var' to allow simulating shadow DOM
  * on browsers that don't support this feature.
  */
  var _root;
  autogenerated.ButtonElement __e3;
  autogenerated.InputElement __e2;
  autogenerated.SpanElement __e5;
  autogenerated.Template __t;
  
  MapNavComponent.forElement(e) : super.forElement(e);
  
  void created_autogenerated() {
    _root = createShadowRoot();
    __t = new autogenerated.Template(_root);
    _root.innerHtml = '''
    <input type="text" id="__e-2">
    <button id="__e-3">Locate</button>
    <span id="__e-5"></span>
    ''';
    __e2 = _root.query('#__e-2');
    __t.listen(__e2.onInput, ($event) { mapQuery = __e2.value; });
    __t.oneWayBind(() => (mapQuery), (e) { __e2.value = e; }, false);
    __e3 = _root.query('#__e-3');
    __t.listen(__e3.onClick, ($event) { locate(); });
    __e5 = _root.query('#__e-5');
    var __binding4 = __t.contentBind(() => (loc));
    __e5.nodes.addAll([
      new autogenerated.Text('Location: '),
      __binding4
    ]);
    
    __t.create();
  }
  
  void inserted_autogenerated() {
    __t.insert();
  }
  
  void removed_autogenerated() {
    __t.remove();
    __e3 = __e2 = __e5 = __t = null;
  }
  
  void composeChildren() {
    super.composeChildren();
    if (_root is! autogenerated.ShadowRoot) _root = this;
  }
  
  /** Original code from the component. */
  
  User user;
  String mapQuery="90210";
  ComponentMap map;
  
  String get loc {
    String label;
    js.scoped((){
      label = "${map.center.lat}, ${map.center.lng}";
    });
    return label;
  }
  
  void locate() {
    js.scoped(() {
      Geocoder geocoder = jsw.retain(new Geocoder());
      
      final address = this.mapQuery;
      final request = new GeocoderRequest()
      ..address = address
      ;
      geocoder.geocode(request, (List<GeocoderResult> results, GeocoderStatus status) {
        if (status == GeocoderStatus.OK) {
          map.center = results[0].geometry.location;
          map.zoom = 20;
        } else {
          window.alert('Geocode was not successful for the following reason: ${status}');
        }
      });
    });
  }
  
}

