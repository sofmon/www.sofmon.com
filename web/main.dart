library sofmon;

import 'dart:html' as html;
import 'dart:svg' as svg;

List<html.Element> _decorations = new List<html.Element>();

const _LINE_COLORS = "#666666";

html.Element _background = new html.Element.div()
  ..style.position = "absolute"
  ..style.width = "100%"
  ..style.height = "100%"
  ..style.minHeight = "100vh"
  ..style.top = "0px"
  ..style.left = "0px"
  ..style.overflow = "hidden"
  ..style.zIndex = "-1";

void main() {
  html.document.body.insertBefore(_background, html.document.body.firstChild);

  _refresh();
  html.window.onResize.listen((e)=>_refresh());
  html.window.onLoad.listen((e)=>_refresh());
  html.window.onMessage.listen((e)=>_refresh());
}

void _refresh() {
  _background.style.height = html.document.body.offsetHeight.toString() + "px";
  _decorations.forEach((e) => e.remove());
  _decorations.clear();
  html.querySelectorAll(".content").forEach((e) => processContent(e));
}

void processContent(html.Element e) {
  var sh = e.offsetHeight + e.offsetWidth * 2;
  var sw = e.offsetWidth + e.offsetHeight * 2;
  var st = e.offsetTop + e.offsetHeight / 2 - sh / 2;
  var sl = e.offsetLeft + e.offsetWidth / 2 - sw / 2;

  var s = new svg.SvgElement.tag("svg");
  s.style
    ..zIndex = "-1"
    ..position = "absolute"
    ..height = sh.toString() + "px"
    ..width = sw.toString() + "px"
    ..top = st.toString() + "px"
    ..left = sl.toString() + "px"
    ..color = "#FFFFFF";
  s.children.add(new svg.CircleElement()
    ..attributes = {
      "cx": (-e.offsetHeight).toString(),
      "cy": (sh / 2).toString(),
      "r": (e.offsetHeight * 2).toString(),
      "stroke": _LINE_COLORS,
      "stroke-dasharray": "5,5",
      "fill": "none"
    });
    /*
  s.children.add(new svg.CircleElement()
    ..attributes = {
      "cx": (sw + e.offsetHeight).toString(),
      "cy": (sh / 2).toString(),
      "r": (e.offsetHeight * 2).toString(),
      "stroke": _LINE_COLORS,
      "stroke-dasharray": "5,5",
      "fill": "none"
    });*/
  s.children.add(new svg.CircleElement()
    ..attributes = {
      "cx": (sw / 2).toString(),
      "cy": (-e.offsetWidth-2).toString(),
      "r": (e.offsetWidth * 2).toString(),
      "stroke": _LINE_COLORS,
      "stroke-dasharray": "5,5",
      "fill": "none"
    });
    /*
  s.children.add(new svg.CircleElement()
    ..attributes = {
      "cx": (sw / 2).toString(),
      "cy": (sh + e.offsetWidth+2).toString(),
      "r": (e.offsetWidth * 2).toString(),
      "stroke": _LINE_COLORS,
      "stroke-dasharray": "5,5",
      "fill": "none"
    });*/
  _decorations.add(s);

  _background.children.add(s);
}
