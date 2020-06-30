library QuickDialogs;

import "dart:html";
import "dart:async";
import "dart:convert";

String _questionImageBase64 = "data:image/png;base64,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";
String _errorImageBase64    = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHYAAAByCAIAAAAJVLJQAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAAATXSURBVHhe7ZsxaxVBEMdjgilEEOwtVJIq+CEsbAQLC3tBsLKyyGewtvUTWFgIdpIPIakiamFvFYJEYlzY5XLu3e7NzM7MztvbX+MG3rv9z+/mzd27xGuXl5dbHUnsKv51Zy+slrj982tYmcSQYrjTRUxJr6yYUWuK6rrrKFYwO6WWa1XFVcxOUXatpNiI3DFqosUVl8gFWlDYogRBxdjKGautuPUUKcXwIkXLQ7kWSsKvGFiVwid0TMVUzIoXK1E2OwXimjckm2IJuXKtp9kKPIrzieFxgU7zcG3HZZlBcWFQFq0pIJoyAVgsFym2LDciH6awkDx0xeRYmmYjyKlKLBMVZwLZlDuGlpBsmaJ4o/0OpKKyW0YrJiSwJndAxzJOcUt+PRllqeRYywyKN1TuGFQJWMXb4V8AKGUb5NeRSjtrE1saVLFoCAugMqNeDBoUzfsdMy0KVf4UxKCIaNLvLCmVwGKXFc8eqGG/8HqBLChem18Pb9XoQdG8Xw/c8iI5xUBx7fn1cJWP6+LpaWzVr2daHeFDnFQMcde2X095jYgupk2i9sA28rzi6RvWNiLGQGxkmP92V0fxg8Nbn17shB8I/Pj9+NHZl/ADO5EBuPeZLq7jd+vgxtsSv467158chKU8cCe4OwpJ9rfvhZVNyF0VK4YcSKCFNxJgIy93cWrErBBab6EHheEW/vHn43FYWuK/O4qpPpULnefpzZ9vdsN6xOfDX88/hLUBIEKi1+C62HALK0EwYOeOolm6YnGuFC/OlD4lPJGHxencu1icrlicrlicrlic8NXDwLUu8dUDxNHpnZfnYa3Eop/hBW108cPdZ2FlkEYGxc6+3pNiLH0Wi9OI4osTi8/YPG0oPjp/H1YGMX9HYexh5sDa7ihM0xWL0xWL0xWL0xWLk1QcXSKjC+jKQd1u9S4WJyjuTcrL2GfvYnG6YnGu/hpodmaj5noZJY/kA+ev907lH1ZMh2rm27OjqS6u8tR4se2uFDdwxdu5vx9WVYlM4rq4gdNQCMHAgmLJ4Rtx8vd7WJG5+HYSVlpA/NiZxcdnr95dhDURm7/7iP/H0uxpiT4diq1ti+mUmKqYvqapOwplgK1GUbzOix656ljx7IEgH4e1AZmonj4oQJS01Izi3sgR00qBU9iD6GLUcVdIqufmFQM7dA2NXNjCDtwsXtu4gPvNeEgqhrtr1TJXXbgudsyexvYsz1ZEaGFHTnHqnc1bZvTrQHexp2HLKL8QFhRnrJXsullkKoV0VfykbRbsHhtqn1ALRDFxUOSBbGwNQmbgW0CKM8dKneTNspxKWzgiPKBB4aHtZ39oiPp1IBQ78r4IWetCDoxSzDmLU8lQgdTQ8evAdbGjJIGRdi5JSGgXtGIHxJRN0XlBEn4dFMWOQssOZdHlYWh+HUTFDq5Yoq65ApD9OuiKHUA78Hwsutm3K/HrKFLsgEshBJVTIBo7olSxRzNxIfpReRQ74NE9+q5RCRnjsSl2YC17pF0TUvFG4lTsoYl2MBZmIcMAv2IHucIIYMHK22ERUezhqlwBIbkeQcUe46JF5XrEFXsMilaQ61FS7DEiWk2uR1XxQBXXymYH6igeUHBdy+xAZcVjGHVX1zrGkOIIlHFTTiPsKm4GkT9V6YzpioXZ2voHFZ308/frsswAAAAASUVORK5CYII=";
String _warningImageBase64  = "data:image/png;base64,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";
String _infoImageBase64     = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHYAAAByCAYAAACGNiUHAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAAATRSURBVHhe7Z2/ThVBFIdXa+EBILGQ1o5CGwuIpdj4AFa+g4Wlb+Ez2KilwcJGCzpbGxN4ALBXh8zgsndmZ86fmTlz7vkS4hLh7pzft7/ZzQ2BO3/+MRnqUCX24MOJP4Lx8/lHf6SHYcViJUIYWfgwYluIzDGSaNFiJchMIV2yOLGSZaaQKFmM2BGFLpEkuLtYbqGYcCWsgZtuYqlhtghvhDWm6CIWG1jPoCiSe6y7qVhMOBK2tSUjzNFMLCQMiTJTQCW3mq262NZCe7VJ2oVbVWzpsNhBMRJLqb2m2nKria0xYE2ROaAiStZaUy67WG1CY5SuvUYWpbCK5RxEmswYnHNwy2UTWzKAFqFLuObilMsidpulzsnN2FIuWSzHYkcXOkeKXJJYkxqnRExubqrcamK3UegSSgZUsXf9v2AoYrZBqiM355o8akYosT0XPBqUeSnfC96KTSqeVDaUTFOgt+IYJhVHThwmO5DYtROY1DzY/DAUizWpPLTKkbwVm1Q4WLkQisRiBJnUdWpnSmps6uoyqWWkcuLYBbNioZJMKoxaeaEby3UvMOJQW7sqNvUCtgXzAs25BNI9VjT7b66DWX682/f/LwzuUiTFDt1WJ/Xwkf/kNseHcuXGwOatsrEv9uJSA8d7R/5IFpzliIqFnkBUW0u4d3966A9HANNaUGNTJzD44CoJeSserq2O37+mH/5QKxtiU6JGauv7i+/+KM7pxRd/NA7Q7ZjUWLFtPX87HZzF5Z6enUyvzv0nQuHIdeMnKCCNFStWAZC8Y19LvscaMrkl1toqh1i+kPusNVYpSsU+mF4fbb5PfP1x9HKoNyew6BS7+2R6uuOPl+w8np7t+mPF2FaslBux9uAkD8oDlDVWKSZWKSZWKSZWKSZWKSZWKSZWKSZWKSZWKSZWKSZWKVmxkPcrDV4o79NbY5VyI9ZaODZLf9ZYpZhYpRSJtQeo9lDztcYOROkTseOWWGvhmMS8kRprF0IdOHItFgvZBgx+oPnbPVYpG2LXtgF7Oq4PNM/U1+ts7OXX6fOVP15y9W36dOmPBwFzG4z+hvG1F0pdIXYPpoPJFtTYte0gdZK17zHwYKQ67OFJCNzFSIq11rYjlRvl9oZuLOWkBp1ciVbFYhporYVRo60O0j3WtmQaWKkl+WbFYiWZ3HVq50NqrGPt6jK5cdZy4Wiro0hs7sVMbjktpDrIjQ2Y3DwUqVCKxZbI4V7ctlCSG7Qc7H+N0tHyyhwBjjygYtm24lKgCxwdjnkxrwEWW3KS3FW4LXJzc9bYggPov9HOtSitW3NPqQ60WEepFI4hR4FzVorYJvfY3DCUASQhRaqD1FgH92JHbC/3XBwXOlmsAypDi+BSAa2lOljEOmrIdUgUXGvtXFIdbGIdtQfpKbn2WjmlOljFOjDhY4eqKbrlmrilOtjFOrCBcwzYK9ieM8eoIjYgbdgaSJ2xqlgHdvCAVMmUuVrMVF2sgyo30FsyxxytZmgiNsAl2NEioNHWO6epWAdnWDEwAUpcE5XmYgO1w5RAD6GBbmIDGgX3FBroLjagQbAEoQExYgMjCpYkNCBO7BzJkiXKnCNa7BwJkqXLnDOM2CUtRI8kcsmwYmNQZI8sMYYqscZ/mv/AuNEGE6uSafoLxi0N/IgoH8EAAAAASUVORK5CYII=";

DivElement _getBackGroundDiv(){
  DivElement mc = new DivElement()
    ..id = "modalItemList"
    ..style.backgroundColor = "rgba(190, 190, 190, 0.5)"
    ..style.opacity  = "50%"
    ..style.zIndex   = "9998"
    ..style.width    = "100%"
    ..style.height   = "100%"
    ..style.position = "fixed"
    ..style.margin   = "0px"
    ..style.top      = "0px"
    ..style.left     = "0"
    ..style.top      = "0"
    ..style.border   = "none"
    ..style.display = "block";

  return mc;
}

DivElement _getWindowDiv(String AWidth, String AHeight){

  DivElement m1 = new DivElement()
    ..style.width           = AWidth
    ..style.height          = AHeight
    ..style.position        = "fixed"
    ..style.backgroundColor = "white"
    ..style.borderColor     = "gray"
    ..style.borderWidth     = "1px"
    ..style.borderStyle     = "solid"
    ..style.zIndex          = "9999"
    ..style.boxShadow       = "5px 5px 3px #888888";

  var iw = window.innerWidth;
  var ih =  window.innerHeight;
  var x = ((iw /2) -200).round();
  var y = ((ih/2) - 250).round();

  m1.style.top = y.toString()+"px";
  m1.style.left = x.toString()+"px";

  m1.style.padding = "0px";

  return m1;
}

DivElement _getTitleDiv(String ATitle){

  DivElement divItemTitle = new DivElement()
    ..children.add(new Element.html("<h3>${ATitle}</h>"))
    ..style.textAlign = "center"..style.backgroundColor = "rgb(240, 240, 240)"
    ..style.borderBottomStyle = "solid"
    ..style.borderColor = "black"
    ..style.borderWidth = "1px";

  divItemTitle.style.height  = "25px";
  divItemTitle.style.padding = "5px";
  divItemTitle.children[0].style.marginTop = "0px";
  divItemTitle.children[0].style.marginBottom = "0px";

  return divItemTitle;
}

void closeModal(String AContainer) {
  DivElement mc = querySelector("#${AContainer}");

  if (mc != null) {
    mc.style.display = "none";
  }
}

void showModal(String AContainer) {
  DivElement m1 = querySelector("#${AContainer}-body");

  if (m1 == null){
    throw new Exception("body not found");
  }

  DivElement mc = querySelector("#${AContainer}");

  if (m1 == null){
    throw new Exception("container not found");
  }

  m1.style.position = "block";
  m1.style.backgroundColor = "white";
  m1.style.borderColor = "gray";
  m1.style.borderWidth = "1px";
  m1.style.borderStyle = "solid";

  m1.style.top = "0px";
  m1.style.zIndex = "9999";
  m1.style.padding = "5px";
  m1.style.boxShadow = "5px 5px 3px #888888";

  mc.style.backgroundColor = "rgba(190, 190, 190, 0.5)";
  mc.style.opacity  = "50%";
  mc.style.zIndex   = "9998";
  mc.style.width    = "100%";
  mc.style.height   = "100%";
  mc.style.position = "fixed";
  mc.style.margin   = "0px";
  mc.style.top      = "0px";
  mc.style.left     = "0";
  mc.style.top      = "0";
  mc.style.border   = "none";

  mc.style.display = "block";

  var sh  = m1.scrollHeight / 2;

  var windowHeight = window.innerHeight;
  var mtop = (((windowHeight / 2) - sh) - 25).truncate();

  if (mtop < 0){
    mtop = 30;
  }

  m1.style.margin = "0 auto";
  m1.style.marginTop  = "${mtop}px";

  ButtonElement btnToolClose1 = querySelector("#${AContainer}-close1");

  if (btnToolClose1 != null){
    btnToolClose1.onClick.isEmpty.then((_){
      closeModal(AContainer);
    });
  }

  ButtonElement btnToolClose2 = querySelector("#${AContainer}-close2");
  if (btnToolClose2 != null){
    btnToolClose2.onClick.isEmpty.then((_){
      closeModal(AContainer);
    });
  }
}

Future<Map<String, String>> pickList(List<Map<dynamic, String>> AList, String ATitle, {String AKey : "Key", String AValue : "Value", String AMark : "", dynamic ASelected}){

  Completer<Map<String, String>> pResult = new Completer<Map<String, String>>();

  DivElement mc = _getBackGroundDiv();
  mc.id = "modalItemList";

  DivElement m1 = _getWindowDiv("400px", "450px");
  mc.children.add(m1);

  DivElement divItemTitle = _getTitleDiv(ATitle);
  m1.children.add(divItemTitle);

  DivElement divItemContainer = new DivElement()..id = "divItemContainer";
  divItemContainer.style.height = "330px";
  divItemContainer.style.overflowY = "auto";
  m1.children.add(divItemContainer);

  mc.tabIndex = 0;
  mc.focus();

  Function fComplete(Map<String, String> AMap){
    pResult.complete(AMap);
    querySelector("#modalItemList").remove();
  }

  mc.onKeyDown.listen((KeyboardEvent event){
    event.preventDefault();

    if (querySelector("#modalItemList") == null){
      return false;
    }

    var code = event.which;

    if (code == 13 || code == 32){
      DivElement divItem = querySelector(".selected");

      Map<String, String> pMapResult = new Map<String, String>();
      pMapResult[AKey]   = divItem.attributes["data-value"];
      pMapResult[AValue] = divItem.text;

      fComplete(pMapResult);
      event.preventDefault();
      event.stopPropagation();

    }

    if (code == 27){
      fComplete(null);
      event.preventDefault();
      event.stopPropagation();
    }

    Function vSelect = (int action){
      DivElement divItem = querySelector(".selected");
      int idDiv = 0;

      //Select item below
      if (action == 40){
        idDiv = int.parse(divItem.attributes["data-index"]) + 1;
      }
      //Select upper item
      else if (action == 38){
        idDiv = int.parse(divItem.attributes["data-index"]) - 1;
      }
      else if (action == 34){
        idDiv = int.parse(divItem.attributes["data-index"]) + 7;
      }
      else if (action == 33){
        idDiv = int.parse(divItem.attributes["data-index"]) - 7;
      }

      DivElement divNewItem = querySelector("#item${idDiv}");

      if (divNewItem != null){
        divItem.classes.remove("selected");
        divItem.style.backgroundColor = "white";
        divNewItem.classes.add("selected");
        divNewItem.style.backgroundColor = "rgb(212, 220, 250)";
        divNewItem.focus();

        if (action == 2){
          divNewItem.scrollIntoView(ScrollAlignment.BOTTOM);
        }

        if (action == 3){
          divNewItem.scrollIntoView(ScrollAlignment.TOP);
        }
      }
    };

    vSelect(code);
  });

  int i = 0;

  DivElement divItemTmp = null;
  DivElement divItemFirst = null;
  bool pFound = false;

  for (Map<dynamic, String >item in AList){

    DivElement divItem = new DivElement()
      ..style.paddingTop = "13px"
      ..style.verticalAlign = "center"
      ..style.paddingLeft = "5px"
      ..classes.add("divItem")
      ..id = "item${i}"
      ..tabIndex = i + 20
      ..attributes["data-value"] = item[AKey].toString()
      ..attributes["data-index"] = i.toString()
      ..style.height = "30px";



    if (ASelected != null){

        if (ASelected == item[AKey]){

          divItem.classes.add("selected");
          divItem.style.background = "rgb(212, 220, 250)";
          divItemTmp = divItem;
          pFound = true;

        }

    }
    else{
      if (i == 0){
        divItem.style.background = "rgb(212, 220, 250)";
        divItem.classes.add("selected");
      }
    }

    if (i == 0){
      divItemFirst =divItem;
    }

    i++;

    if (AMark == ""){
      divItem.text = item[AValue];
    }
    else { //We hightlight the specified text
      try{
        String pHtmlElement = "<span>${item[AValue]}</span>";
        //pHtmlElement = pHtmlElement.toUpperCase();

        int index = item[AValue].indexOf(new RegExp(AMark, caseSensitive: false));

        String pMarkedString = item[AValue].substring(index, index + AMark.length);

        pHtmlElement = pHtmlElement.replaceAll(new RegExp(pMarkedString, caseSensitive: false), "<span>${pMarkedString}</span>");

        var pElement = new Element.html(pHtmlElement);
        pElement.style.color = "black";
        pElement.style.fontWeight = "bold";
        pElement.style.userSelect = "none";
        pElement.style.cursor = "default";

        pElement.children[0].style.color = "rgb(4, 94, 191)";
        pElement.children[0].style.fontWeight = "bold";
        pElement.children[0].style.userSelect = "none";
        pElement.children[0].style.cursor = "default";

        divItem.children.add(pElement);

      }
      catch(_){
        divItem.text = item[AValue];
        divItem.style.fontWeight = "bold";
      }
    }

    divItem.onClick.listen((Event event){

      querySelectorAll(".divItem").style.background = "white";
      querySelectorAll(".divItem").classes.remove("selected");
      divItem.style.background = "rgb(212, 220, 250)";
      divItem.classes.add("selected");

    });

    divItemContainer.children.add(divItem);

  }

  if (ASelected != null && !pFound){
    divItemFirst.style.background = "rgb(212, 220, 250)";
    divItemFirst.classes.add("selected");
  }

  document.body.children.add(mc);

  DivElement divButtonContainer = new DivElement()..style.borderTopStyle = "solid"..style.borderColor = "black"..style.borderWidth = "1px";

  ButtonElement btnOK = new Element.html("<button>OK</button")..style.float = "right"..style.marginTop = "20px"..style.marginRight = "5px";
  btnOK.onClick.listen((_){

    DivElement divItem = querySelector(".selected");

    Map<String, String> pMapResult = new Map<String, String>();
    pMapResult[AKey] = divItem.attributes["data-value"];
    pMapResult[AValue] = divItem.text;

    fComplete(pMapResult);
  });

  ButtonElement btnCancel = new Element.html("<button>Cancel</button")..style.float = "right"..style.marginTop = "20px"..style.marginRight = "5px";
  btnCancel.onClick.listen((_){
    fComplete(null);
  });

  divButtonContainer.children.add(btnOK);
  divButtonContainer.children.add(btnCancel);

  m1.children.add(divButtonContainer);

  if ((querySelector("#item0") as DivElement) != null){
    (querySelector("#item0") as DivElement).focus();
  }
  else{
    mc.focus();
  }

  if (divItemTmp != null){
    divItemTmp.scrollIntoView();
    divItemTmp.focus();
  }
  else{
    divButtonContainer.scrollIntoView();
  }
  return pResult.future;
}

Future<List<Map<String, String>>> multiPickList(List<Map<dynamic, String>> AList, String ATitle, {String AKey : "Id", String AValue : "Value", String AMark : "", List<dynamic> ASelected}){

  Completer<List<Map<String, String>>> pResult = new Completer<List<Map<String, String>>>();

  DivElement mc =  _getBackGroundDiv();
  mc.id = "modalItemList";

  DivElement m1 = _getWindowDiv("400px", "450px");

  mc.children.add(m1);

  DivElement divItemTitle = _getTitleDiv(ATitle);
  m1.children.add(divItemTitle);

  DivElement divItemContainer = new DivElement();
  divItemContainer.style.height = "330px";
  divItemContainer.style.overflowY = "auto";
  m1.children.add(divItemContainer);

  mc.tabIndex = 0;

  mc.onKeyDown.listen((KeyboardEvent event){
    if (querySelector("#modalItemList") == null){
      return false;
    }

    var code = event.which;

    if (code == 13 || code == 32){
      var divItemList = querySelectorAll(".selected");

      List<Map<String, String>> pDResult = new List<Map<String, String>>();

      for (DivElement item in divItemList){
        Map<String, String> pMapResult = new Map<String, String>();
        pMapResult[AKey]     = item.attributes["data-value"];
        pMapResult[AValue] = item.text;
        pDResult.add(pMapResult);
      }

      pResult.complete(pDResult);

      event.preventDefault();
      event.stopPropagation();

    }
    if (code == 27){
      pResult.complete(null);
      querySelector("#modalItemList").remove();
    }
  });

  int i = 0;

  for (Map<dynamic, String >item in AList){

    DivElement divItem = new DivElement()
      ..style.paddingTop = "13px"
      ..style.verticalAlign = "center"
      ..style
      ..style.paddingLeft = "5px"
      ..classes.add("divItem")
      ..id = "item${i}"
      ..attributes["data-value"] = item[AKey].toString()
      ..attributes["data-index"] = i.toString()
      ..style.height = "30px";

      if (ASelected != null){

        if (ASelected.contains(item[AKey])){

          divItem.classes.add("selected");
          divItem.style.background = "rgb(212, 220, 250)";

        }

      }

    i++;

    if (AMark == ""){
      divItem.text = item[AValue];
    }
    else { //We hightlight the specified query
      try{
        String pHtmlElement = "<span>${item[AValue]}</span>";

        int index = item[AValue].indexOf(new RegExp(AMark, caseSensitive: false));

        String pMarkedString = item[AValue].substring(index, index + AMark.length);

        pHtmlElement = pHtmlElement.replaceAll(new RegExp(pMarkedString, caseSensitive: false), "<span>${pMarkedString}</span>");

        var pElement = new Element.html(pHtmlElement);
        pElement.attributes["data-value"] = item[AKey].toString();
        pElement.attributes["data-index"] = i.toString();

        pElement.style.color = "black";
        pElement.style.fontWeight = "bold";
        pElement.style.userSelect = "none";
        pElement.style.cursor = "default";

        pElement.children[0].attributes["data-value"] = item[AKey].toString();
        pElement.children[0].attributes["data-index"] = (i - 1).toString();
        pElement.children[0].style.color = "rgb(4, 94, 191)";
        pElement.children[0].style.fontWeight = "bold";
        pElement.children[0].style.userSelect = "none";
        pElement.children[0].style.cursor = "default";

        divItem.children.add(pElement);

      }
      catch(_){
        divItem.text = item[AValue];
        divItem.style.fontWeight = "bold";
      }
    }

    divItem.onClick.listen((Event event){

      var pTarget = event.target;

      while (pTarget is SpanElement){
        pTarget = (pTarget as SpanElement).parent;
      }

      (pTarget as SpanElement).classes.toggle("selected");

      if ((pTarget as SpanElement).classes.contains("selected")){
        (pTarget as SpanElement).style.background = "rgb(212, 220, 250)";
      }
      else{
        (pTarget as SpanElement).style.background = "white";
      }

    });

    divItemContainer.children.add(divItem);

  }

  document.body.children.add(mc);

  DivElement divButtonContainer = new DivElement()..style.borderTopStyle = "solid"..style.borderColor = "black"..style.borderWidth = "1px"..style.marginLeft = "5px";

  ButtonElement btnSelectAll = new Element.html("<button>Select All</button")..style.float = "left"..style.marginTop = "20px"..style.marginRight = "5px";
  btnSelectAll.onClick.listen((_){

    for (DivElement element in divItemContainer.children){
        if  (!element.classes.contains("selected")){
          element.classes.add("selected");
        }

        element.style.background = "rgb(212, 220, 250)";
    }

  });

  ButtonElement btnUnselectAll = new Element.html("<button>Unselect All</button")..style.float = "left"..style.marginTop = "20px"..style.marginRight = "5px";
  btnUnselectAll.onClick.listen((_){

    for (DivElement element in divItemContainer.children){
      if  (element.classes.contains("selected")){
        element.classes.remove("selected");
      }

      element.style.background = "white";
    }

  });

  ButtonElement btnOK = new Element.html("<button>OK</buton")..style.float = "right"..style.marginTop = "20px"..style.marginRight = "5px";
  btnOK.onClick.listen((_){

    var divItemList = querySelectorAll(".selected");

    List<Map<String, String>> pDResult = new List<Map<String, String>>();

    for (HtmlElement item in divItemList){

      if (item is DivElement) {
        Map<String, String> pMapResult = new Map<String, String>();
        pMapResult[AKey] = item.attributes["data-value"];
        pMapResult[AValue] = item.text;
        pDResult.add(pMapResult);
      }
    }

    pResult.complete(pDResult);
    querySelector("#modalItemList").remove();
  });

  ButtonElement btnCancelar = new Element.html("<button>Cancel</button")..style.float = "right"..style.marginTop = "20px"..style.marginRight = "5px";
  btnCancelar.onClick.listen((_){
    pResult.complete(null);
    querySelector("#modalItemList").remove();
  });

  divButtonContainer.children.add(btnSelectAll);
  divButtonContainer.children.add(btnUnselectAll);
  divButtonContainer.children.add(btnOK);
  divButtonContainer.children.add(btnCancelar);

  m1.children.add(divButtonContainer);
  mc.focus();

  return pResult.future;
}

Future<String> inputText(String AText, String ATitle, {bool Password : false}){

  Completer<String> pResult = new Completer<String>();

  DivElement mc = _getBackGroundDiv();
  mc.id = "modalInputText";

  DivElement m1 = _getWindowDiv("400px", "200px");
  mc.children.add(m1);

  DivElement divItemTitle = _getTitleDiv(ATitle);
  m1.children.add(divItemTitle);

  DivElement divItemContainer = new DivElement();
  divItemContainer.style.height = "100px";
  divItemContainer.style.overflowY = "auto";
  m1.children.add(divItemContainer);

  mc.tabIndex = 0;
  mc.focus();

  Function fComplete(String AResult){
    pResult.complete(AResult);
    querySelector("#modalInputText").remove();
  }

  mc.onKeyDown.listen((KeyboardEvent event){
    if (querySelector("#modalInputText") == null){
      return false;
    }

    var code = event.which;

    if (code == 13){
      InputElement inpText = querySelector("#inpText");

      fComplete(inpText.value);
      event.preventDefault();
      event.stopPropagation();

    }

    if (code == 27){
      fComplete(null);
      event.preventDefault();
      event.stopPropagation();
    }

  });

  dynamic inpText = new InputElement()..id = "inpText";

  if (Password) {
    inpText = new PasswordInputElement()..id = "inpText";
  }

  inpText.style.paddingTop = "13px";
  inpText.style.marginTop  = "30px";
  inpText.style.marginLeft = "50px";
  inpText.style.height     = "20px";
  inpText.style.padding    = "5px";
  inpText.style.width      = "300px";
  inpText.value = AText;

  divItemContainer.children.add(inpText);

  document.body.children.add(mc);

  DivElement divButtonContainer = new DivElement()..style.borderTopStyle = "solid"..style.borderColor = "silver"..style.borderWidth = "1px"
    ..style.paddingRight = "30px";

  ButtonElement btnOK = new Element.html("<button>OK</button")..style.float = "right"..style.marginTop = "20px"..style.marginRight = "5px";
  btnOK.onClick.listen((_){
    fComplete(inpText.value);
  });

  ButtonElement btnCancel = new Element.html("<button>Cancel</button")..style.float = "right"..style.marginTop = "20px"..style.marginRight = "5px";
  btnCancel.onClick.listen((_){
    fComplete(null);
  });

  divButtonContainer.children.add(btnOK);
  divButtonContainer.children.add(btnCancel);

  m1.children.add(divButtonContainer);

  inpText.focus();
  inpText.select();

  return pResult.future;
}

enum TDialogType{

  INFO, WARNING, ERROR, QUESTION

}

enum TDialogResult{

  OK, CANCEL, YES, NO

}

enum TDialogButtons{
  OK, OK_CANCEL, YES_NO
}

Future<TDialogResult> showDialog(String AText, String ATitle, TDialogType ADialogType, TDialogButtons ADialogButtons){

  String pContainerId = "showDialogMessage";

  Completer<TDialogResult> pResult = new Completer<TDialogResult>();

  DivElement mc = _getBackGroundDiv();
  mc.id = pContainerId;

  DivElement m1 = _getWindowDiv("400px", "200px");
  mc.children.add(m1);

  DivElement divItemTitle = _getTitleDiv(ATitle);
  m1.children.add(divItemTitle);

  DivElement divItemContainer = new DivElement();
  divItemContainer.style.height = "100px";
  divItemContainer.style.overflowY = "auto";
  m1.children.add(divItemContainer);

  mc.tabIndex = 0;
  mc.focus();

  Function fComplete(TDialogResult AResult){
    pResult.complete(AResult);
    querySelector("#$pContainerId").remove();
  }

  mc.onKeyDown.listen((KeyboardEvent event){
      if (querySelector("#$pContainerId") == null){
        return false;
      }

      var code = event.which;

      if (code == 27){

        if (ADialogButtons == TDialogButtons.OK_CANCEL){
            fComplete(TDialogResult.CANCEL);
        }
        else if (ADialogButtons == TDialogButtons.YES_NO){
            fComplete(TDialogResult.NO);
        }
        else{
            fComplete(TDialogResult.OK);
        }

        event.preventDefault();
        event.stopPropagation();
      }
  });

  DivElement divMessageContainer = new DivElement();

  ImageElement pSymbolImage = new ImageElement();

  switch(ADialogType){
      case TDialogType.QUESTION : pSymbolImage.src = _questionImageBase64;
      break;

      case TDialogType.ERROR    : pSymbolImage.src = _errorImageBase64;
      break;

      case TDialogType.WARNING : pSymbolImage.src = _warningImageBase64;
      break;

      case TDialogType.INFO    : pSymbolImage.src = _infoImageBase64;
      break;
  }

  pSymbolImage.style.width  = "80px";
  pSymbolImage.style.height = "80px";
  pSymbolImage.style.float  = "left";
  pSymbolImage.style.marginLeft = "10px";
  pSymbolImage.style.marginTop = "10px";

  divItemContainer.children.add(pSymbolImage);

  DivElement pDialogText = new DivElement();

  pDialogText.style.paddingTop = "13px";
  pDialogText.style.marginTop  = "10px";
  pDialogText.style.marginLeft = "10px";
  pDialogText.style.height     = "20px";
  pDialogText.style.padding    = "5px";
  pDialogText.style.maxWidth   = "240px";
  pDialogText.style.float      = "left";
  pDialogText.text             = AText;

  divItemContainer.children.add(pDialogText);

  divItemContainer.children.add(divMessageContainer);

  document.body.children.add(mc);

  DivElement divButtonContainer = new DivElement()..style.borderTopStyle = "solid"..style.borderColor = "silver"..style.borderWidth = "1px"
    ..style.paddingRight = "30px";

  ButtonElement btnOK     = null;
  ButtonElement btnCancel = null;
  ButtonElement btnYES    = null;
  ButtonElement btnNO     = null;

  if (ADialogButtons == TDialogButtons.OK || ADialogButtons == TDialogButtons.OK_CANCEL) {

      btnOK = new Element.html("<button>OK</button")
        ..style.float = "right"
        ..style.marginTop = "20px"
        ..style.marginRight = "5px";
      btnOK.onClick.listen((_) {
          fComplete(TDialogResult.OK);
      });

      divButtonContainer.children.add(btnOK);

  }

  if (ADialogButtons == TDialogButtons.OK_CANCEL) {

      btnCancel = new Element.html("<button>Cancel</button")
        ..style.float = "right"
        ..style.marginTop = "20px"
        ..style.marginRight = "5px";
      btnCancel.onClick.listen((_) {
        fComplete(TDialogResult.CANCEL);
      });

      divButtonContainer.children.add(btnCancel);

  }

  if (ADialogButtons == TDialogButtons.YES_NO){
      btnYES = new Element.html("<button>Yes</button")
        ..style.float = "right"
        ..style.marginTop = "20px"
        ..style.marginRight = "5px";
      btnYES.onClick.listen((_) {
        fComplete(TDialogResult.YES);
      });

      btnNO = new Element.html("<button>No</button")
        ..style.float = "right"
        ..style.marginTop = "20px"
        ..style.marginRight = "5px";
      btnNO.onClick.listen((_) {
        fComplete(TDialogResult.NO);
      });

      divButtonContainer.children.add(btnYES);
      divButtonContainer.children.add(btnNO);
  }


  m1.children.add(divButtonContainer);

  if (ADialogButtons == TDialogButtons.YES_NO){
      btnYES.focus();
  }
  else{
      btnOK.focus();
  }

  return pResult.future;
}

DateTime _Now = new DateTime.now();
Map _Cache = new Map();

void inputAutocomplete(InputElement AInputElement, String AUrl, {bool Mark : false, onSelect(Akey, AValue) : null}){


  String pTexto = "";
  String pValue = "";
  int pItemSelected = 0;
  int pTotalItems   = 0;

  AInputElement.onKeyDown.listen((KeyboardEvent event) async{

    var code = event.which;
    print(code);

    //Delay to get the whole value of the input
    await new Future.delayed(const Duration(milliseconds: 10));

    if (code == 39 || code == 37 || code == 16 || code == 36 || code == 17 || code == 35){
      return;
    }

    InputElement pTargetInput = event.target as InputElement;

    int pLength = 0;

    if (code == 8){

      if (pTargetInput.selectionEnd == pTargetInput.value.length){
        if (querySelector("#divContainer1") != null){
          querySelector("#divContainer1").remove();
        }
        return;
      }

      pLength = (event.target as InputElement).value.length;
      event.stopPropagation();
    }
    else{
      pLength = (event.target as InputElement).value.length;
    }

    if (pLength <= 2){

      if (querySelector("#divContainer1") != null){
        querySelector("#divContainer1").remove();
      }

      return;
    }

    bool pExiste = false;
    DivElement divContainer = querySelector("#divContainer1");

    if (code == 27) {

      if (divContainer != null) {
        divContainer.remove();
        return;
      }

    }

    if (code == 40 || code == 9) {

      if (divContainer != null) {
        event.preventDefault();
        event.stopPropagation();

        pItemSelected = 0;
        (querySelector("#item0") as DivElement).focus();

        pExiste = true;
        return;

      }
      else {
        pExiste = false;
      }

    }
    else {
      if (pLength > 2) {


        DivElement divContainer = querySelector("#divContainer1");

        if (divContainer == null) {

          String pTop = (AInputElement.offsetTop + AInputElement.clientHeight + 5).toString() + "px";
          String pLeft = (AInputElement.offsetLeft).toString() + "px";

          divContainer = new DivElement()
            ..id = "divContainer1"
            ..tabIndex = 0
            ..style.width = "300px"
            ..style.height = "200px"
            ..style.borderColor = "silver"
            ..style.borderStyle = "solid"
            ..style.borderWidth = "1px"
            ..style.background = "white"
            ..style.position = "absolute"
            ..style.overflowY = "auto"
            ..style.top = pTop
            ..style.left = pLeft
            ..onKeyDown.listen((KeyboardEvent event) {

            var code = event.which;

            if (code == 13) {

              AInputElement.value = pTexto;
              divContainer.remove();
              event.preventDefault();
              event.stopPropagation();
              AInputElement.focus();

              if (onSelect != null){
                onSelect(pValue, pTexto);
              }

              return;

            }

            if (code == 27) {
              AInputElement.focus();
              divContainer.remove();
              event.preventDefault();
              event.stopPropagation();
            }

            if (code == 40) {

              event.preventDefault();

              if (pItemSelected == pTotalItems - 1) {
                return;
              }

              if (pItemSelected < divContainer.children.length - 1){
                pItemSelected += 1;
              }
              else{
                return;
              }

              DivElement pItemTmp = (querySelector("#item" + pItemSelected.toString()) as DivElement);

              if (pItemTmp != null) {
                pItemTmp.focus();

                if (pItemSelected <= 2){
                  divContainer.scrollTop = 0;
                }
                else {
                  // pItemTmp.scrollIntoView(ScrollAlignment.BOTTOM);
                }

              }

            }

            if (code == 38) {
              event.preventDefault();
              if (pItemSelected == 0) {
                return;
              }
              pItemSelected -= 1;
              DivElement pItemTmp = (querySelector("#item" + pItemSelected.toString()) as DivElement);

              if (pItemTmp != null) {
                pItemTmp.focus();
                //pItemTmp.scrollIntoView(ScrollAlignment.TOP);
              }
            }

          });

        }
        else {
          divContainer.children.clear();
        }


        var pDiferencia = new DateTime.now().difference(_Now);

        //To avoid to many request from typers
        if (pDiferencia.inMilliseconds < 110){
          _Now = new DateTime.now();
          return;
        }

        _Now = new DateTime.now();



        List<Map> pRemoteData = null;

        pRemoteData = _Cache[pTargetInput.value];

        if (pRemoteData == null){
          var pUrlQuery = AUrl + "?query=${pTargetInput.value}";
          String pRemoteStringData = await HttpRequest.getString(pUrlQuery);
          pRemoteData = JSON.decode(pRemoteStringData);

          _Cache[pTargetInput.value] = pRemoteData;
        }

        if (pRemoteData.length == 0){
          AInputElement.focus();
          divContainer.remove();
          event.preventDefault();
          event.stopPropagation();
          return;
        }

        int i = 0;

        for (var item in pRemoteData) {

          pTotalItems += 1;

          DivElement pItem = new DivElement();
          pItem.style.height = "20px";
          pItem.tabIndex = i + 20;
          pItem.id = "item" + i.toString();
          pItem.dataset["key"] = item["Key"];
          pItem.dataset["index"] = i.toString();
          pItem.style.overflow = "hidden";
          pItem.style.display = "inline-block";
          pItem.style.minWidth = "100%";

          if (Mark == false){
            pItem.text = item["Value"];
          }
          else { //We hightlight the specified text
            try{
              String pHtmlElement = "<span>${item["Value"]}</span>";

              int index = item["Value"].indexOf(new RegExp(pTargetInput.value, caseSensitive: false));

              if (index >= 0) {

                String pMarkedString = item["Value"].substring(index, index + pTargetInput.value.length);

                pHtmlElement = pHtmlElement.replaceAll(new RegExp(pMarkedString, caseSensitive: false), "<span>${pMarkedString}</span>");

                var pElement = new Element.html(pHtmlElement);
                pElement.style.color = "black";
                pElement.style.fontWeight = "bold";
                pElement.style.userSelect = "none";
                pElement.style.cursor = "default";

                pElement.children[0].style.color = "rgb(4, 94, 191)";
                pElement.children[0].style.fontWeight = "bold";
                pElement.children[0].style.userSelect = "none";
                pElement.children[0].style.cursor = "default";

                pItem.children.add(pElement);

              }
              else{
                pItem.text = item["Value"];
                pItem.style.fontWeight = "bold";
              }

            }
            catch(ex, st){
              print(ex);
              print(st);
              print(item["Value"]);
              pItem.text = item["Value"];
              pItem.style.fontWeight = "bold";

              //AInputElement.focus();
              //divContainer.remove();
              //event.preventDefault();
              //event.stopPropagation();
              //break;
            }

          }

          pItem.onFocus.listen((_) {

            pTexto = pItem.text;
            pValue = pItem.dataset["key"];
            pItem.style.background = "rgb(212, 220, 250)";
            pItemSelected = int.parse(pItem.dataset["index"]);

          });

          pItem.onBlur.listen((_) {

            pItem.style.background = "white";

          });

          divContainer.children.add(pItem);

          i++;

        }

        document.body.children.add(divContainer);

      }
      else {

        if (querySelector("#divContainer1") != null) {
          (querySelector("#divContainer1") as DivElement).remove();
        }

      }
    }

  });

}