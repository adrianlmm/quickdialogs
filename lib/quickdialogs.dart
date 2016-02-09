library QuickDialogs;

import "dart:html";
import "dart:async";
import "dart:convert";

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
    var mtop = ((windowHeight / 2) - sh) - 25;
    
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

Future<Map<String, String>> pickList(List<Map<dynamic, String>> AList, String ATitle, {String AKey : "Key", String AValue : "Value", String AMark : ""}){

     Completer<Map<String, String>> pResult = new Completer<Map<dynamic, String>>();
     
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

         if (i == 0){
            divItem.style.background = "rgb(212, 220, 250)";
            divItem.classes.add("selected");
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
     
     divButtonContainer.scrollIntoView();
     return pResult.future;
}

Future<List<Map<String, String>>> multiPickList(List<Map<dynamic, String>> AList, String ATitle, {String AKey : "Id", String AValue : "Value", String AMark : ""}){
    
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
                pTarget = pTarget.parent;
              }

              pTarget.classes.toggle("selected");

              if (pTarget.classes.contains("selected")){
                  pTarget.style.background = "rgb(212, 220, 250)";
              }
              else{
                  pTarget.style.background = "white";
              }

         });
         
         divItemContainer.children.add(divItem);
         
     }
     
     document.body.children.add(mc);
     
     DivElement divButtonContainer = new DivElement()..style.borderTopStyle = "solid"..style.borderColor = "black"..style.borderWidth = "1px";
     
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
     inpText.style.height     = "15px";
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