library ModalP;

import "dart:html";
import "dart:async";


DivElement _getBackGroundDiv(){
  DivElement mc = new DivElement()..id = "modalItemList";
      
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
  
  return mc;
}

DivElement _getWindowDiv(String AWidth, String AHeight){
  
   DivElement m1 = new DivElement();
       
   m1.style.width = AWidth;
   m1.style.height = AHeight;
   m1.style.position = "fixed";
   m1.style.backgroundColor = "white";
   m1.style.borderColor = "gray";
   m1.style.borderWidth = "1px";
   m1.style.borderStyle = "solid";
   
   m1.style.zIndex = "9999";
   m1.style.boxShadow = "5px 5px 3px #888888";
   
   var iw = window.innerWidth;
   var ih =  window.innerHeight;
   var x = ((iw /2) -200).round();
   var y = ((ih/2) - 250).round();
   
   m1.style.top = y.toString()+"px";
   m1.style.left = x.toString()+"px";

   m1.style.padding = "0px";
   m1.style.overflowX = "auto";
   m1.style.overflowY = "auto";

   return m1;  
}

DivElement _getTitleDiv(String ATitulo){
    
   DivElement divItemTitle = new DivElement()..children.add(new Element.html("<h3>${ATitulo}</h>"))..style.textAlign = "center"..style.backgroundColor = "rgb(240, 240, 240)"..style.borderBottomStyle = "solid"..style.borderColor = "black"..style.borderWidth = "1px";
   divItemTitle.style.height  = "20px";
   divItemTitle.style.padding = "5px";
   divItemTitle.children[0].style.marginTop = "0px";
   divItemTitle.children[0].style.marginBottom = "0px";
  
   return divItemTitle;
}

void cierra_modal(String AContainer) {
    DivElement mc = querySelector("#${AContainer}");
    mc.style.display = "none";
}

void modal(String AContainer) {
    DivElement m1 = querySelector("#${AContainer}-body");
    DivElement mc = querySelector("#${AContainer}");
    
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
    
    var sw = m1.scrollWidth / 2;
    var sh = m1.scrollHeight / 2;
    var top     = 50;
    
    var windowHeight = window.innerHeight;
    var mtop = ((windowHeight / 2) - sh) - 25;
    
    m1.style.margin = "0 auto";
    m1.style.marginTop  = "${mtop}px";
    
    ButtonElement btnToolCerrar1 = querySelector("#${AContainer}-cerrar1");
    if (btnToolCerrar1 != null){
        
        btnToolCerrar1.onClick.isEmpty.then((_){
            cierra_modal(AContainer);    
        });
    }
    
    ButtonElement btnToolCerrar2 = querySelector("#${AContainer}-cerrar2");
    if (btnToolCerrar2 != null){
        
        btnToolCerrar2.onClick.isEmpty.then((_){
            cierra_modal(AContainer);    
        });
    }
}

Future<bool> modalFB(String AContainer, {Function ACodeBlock}) {
    
    DivElement m1 = querySelector("#${AContainer}-body");
    DivElement mc = querySelector("#${AContainer}");
    
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
    
    var sw = m1.scrollWidth / 2;
    var sh = m1.scrollHeight / 2;
    var top     = 50;
    
    var windowHeight = window.innerHeight;
    var mtop = ((windowHeight / 2) - sh) - 25;
    
    m1.style.margin = "0 auto";
    m1.style.marginTop  = "${mtop}px";
    
    if (ACodeBlock != null){
        ACodeBlock();
    }
    
    Completer<bool> c = new Completer<bool>();
    
    ButtonElement btnToolCerrar1 = querySelector("#${AContainer}-cerrar1");
    if (btnToolCerrar1 != null){
        
        btnToolCerrar1.onClick.isEmpty.then((_){
            c.complete(false);
            cierra_modal(AContainer);    
        });
    }

    ButtonElement btnToolCerrar2 = querySelector("#${AContainer}-cerrar2");
    if (btnToolCerrar2 != null){
        
        btnToolCerrar2.onClick.isEmpty.then((_){
            c.complete(false);
            cierra_modal(AContainer);
        });
    }
    
    ButtonElement btnMdlAceptar = querySelector("#${AContainer}-aceptar");
    if (btnMdlAceptar != null){
        
        btnMdlAceptar.onClick.isEmpty.then((_){
            c.complete(true);
        });
    }
    return c.future;
}

Future<Map<String, String>> pickList(List<Map<dynamic, String>> ALista, String ATitulo, String ALlave, String AValue){
    
     Completer<Map<String, String>> pResult = new Completer<Map<dynamic, String>>();
     
     DivElement mc = _getBackGroundDiv();
     mc.id = "modalItemList";
     
     DivElement m1 = _getWindowDiv("400px", "450px");
     mc.children.add(m1);
     
     DivElement divItemTitle = _getTitleDiv(ATitulo);
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
         if (querySelector("#modalItemList") == null){
             return false;
         }
         
         var code = event.which;
         
         print(code.toString());
         
         if (code == 13 || code == 32){
             DivElement divItem = querySelector(".selected");
             
             Map<String, String> pMapResult = new Map<String, String>();
             pMapResult[ALlave] = divItem.attributes["data-value"];
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
         
         Function vSelect = (int i){
             DivElement divItem = querySelector(".selected");
             int idDiv = 0;
             //Selecciona hacia abajo
             if (i == 0){
                idDiv = int.parse(divItem.attributes["data-index"]) + 1;
             }
             //selecciona hacia arriba
             else if (i == 1){
                 idDiv = int.parse(divItem.attributes["data-index"]) - 1;
             }
             else if (i == 2){
                 idDiv = int.parse(divItem.attributes["data-index"]) + 7;
             }
             else if (i == 3){
                idDiv = int.parse(divItem.attributes["data-index"]) - 7;
             }
             
             DivElement divNewItem = querySelector("#item${idDiv}");
             
             if (divNewItem != null){ 
                 divItem.classes.remove("selected");
                 divItem.style.backgroundColor = "white";
                 divNewItem.classes.add("selected");
                 divNewItem.style.backgroundColor = "rgb(212, 220, 250)";
                 divNewItem.focus();
                 
                 if (i == 2){
                    divNewItem.scrollIntoView(ScrollAlignment.BOTTOM);
                 }
                 
                 if (i == 3){
                   divNewItem.scrollIntoView(ScrollAlignment.TOP);
                 }
             }
         };
         
         if (code == 40){
             vSelect(0);
         }
         
         if (code == 38){
             vSelect(1);
         }
         
         if (code == 34){
            vSelect(2);
         }
         
         if (code == 33){
           vSelect(3);
         }
     });
     
     int i = 0;
     
     for (Map<dynamic, String >item in ALista){
         
         DivElement divItem = new DivElement()..style.paddingTop = "13px"..style.verticalAlign = "center"..style;
         divItem.style.paddingLeft = "5px";
         divItem.classes.add("divItem");
         divItem.id = "item${i}";
         divItem.tabIndex = i + 20;
         divItem.attributes["data-value"] = item[ALlave].toString(); 
         divItem.attributes["data-index"] = i.toString();
         divItem.style.height = "30px";
         if (i == 0){
            divItem.style.background = "rgb(212, 220, 250)";
            divItem.classes.add("selected");
         }
         i++;
         divItem.text = item[AValue];
         
         divItem.onClick.listen((Event event){
            
              querySelectorAll(".divItem").style.background = "white";
              querySelectorAll(".divItem").classes.remove("selected");
              (event.target as DivElement).style.background = "rgb(212, 220, 250)";
              (event.target as DivElement).classes.add("selected");
             
         });
         
         divItemContainer.children.add(divItem);
         
     }
     
     document.body.children.add(mc);
     
     DivElement divButtonContainer = new DivElement()..style.borderTopStyle = "solid"..style.borderColor = "black"..style.borderWidth = "1px";
     
     ButtonElement btnAceptar = new Element.html("<button>Aceptar</button")..style.float = "right"..style.marginTop = "20px"..style.marginRight = "5px";
     btnAceptar.onClick.listen((_){
        
         DivElement divItem = querySelector(".selected");
         
         Map<String, String> pMapResult = new Map<String, String>();
         pMapResult[ALlave] = divItem.attributes["data-value"];
         pMapResult[AValue] = divItem.text;
         
         fComplete(pMapResult);
     });
     
     ButtonElement btnCancelar = new Element.html("<button>Cancelar</button")..style.float = "right"..style.marginTop = "20px"..style.marginRight = "5px";
     btnCancelar.onClick.listen((_){
         fComplete(null);
     });
     
     divButtonContainer.children.add(btnAceptar);
     divButtonContainer.children.add(btnCancelar);
     
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

Future<List<Map<String, String>>> multiPickList(List<Map<dynamic, String>> ALista, String ATitulo){
    
    Completer<List<Map<String, String>>> pResult = new Completer<List<Map<String, String>>>();
    
    DivElement mc =  _getBackGroundDiv();
    mc.id = "modalItemList";
    
    DivElement m1 = _getWindowDiv("400px", "450px");

    mc.children.add(m1);
    
    DivElement divItemTitle = _getTitleDiv(ATitulo);
    m1.children.add(divItemTitle);
    
    DivElement divItemContainer = new DivElement();
    divItemContainer.style.height = "330px";
    divItemContainer.style.overflowY = "auto";
    m1.children.add(divItemContainer);
    
    mc.tabIndex = 0;
    mc.focus();
    
    mc.onKeyDown.listen((KeyboardEvent event){
        if (querySelector("#modalItemList") == null){
            return false;
        }
        
        var code = event.which;
        
        if (code == 13 || code == 32){
            List<DivElement> divItemList = querySelectorAll(".selected");
            
            List<Map<String, String>> pDResult = new List<Map<String, String>>();
            
            for (DivElement item in divItemList){
                Map<String, String> pMapResult = new Map<String, String>();
                pMapResult["id"]     = item.attributes["data-value"];
                pMapResult["nombre"] = item.text;
                pDResult.add(pMapResult);
            }
            
            pResult.complete(pDResult);
            
            event.preventDefault();
            event.stopPropagation();
            
        }
        if (code == 27){
            pResult.complete(null);
            querySelector("#modalItemList").remove();
            event.preventDefault();
            event.stopPropagation();
        }
     });
     
     int i = 0;
     
     for (Map<dynamic, String >item in ALista){
         
         DivElement divItem = new DivElement()..style.paddingTop = "13px"..style.verticalAlign = "center"..style;
         divItem.style.paddingLeft = "5px";
         divItem.classes.add("divItem");
         divItem.id = "item${i}";
         divItem.attributes["data-value"] = item["id"].toString(); 
         divItem.attributes["data-index"] = i.toString();
         divItem.style.height = "30px";
         i++;
         divItem.text = item["nombre"];
         
         divItem.onClick.listen((Event event){
              (event.target as DivElement).classes.toggle("selected");
              
              if ((event.target as DivElement).classes.contains("selected")){
                  (event.target as DivElement).style.background = "rgb(212, 220, 250)";    
              }
              else{
                  (event.target as DivElement).style.background = "white";
              }
             
         });
         
         divItemContainer.children.add(divItem);
         
     }
     
     document.body.children.add(mc);
     
     DivElement divButtonContainer = new DivElement()..style.borderTopStyle = "solid"..style.borderColor = "black"..style.borderWidth = "1px";
     
     ButtonElement btnAceptar = new Element.html("<button>Aceptar</button")..style.float = "right"..style.marginTop = "20px"..style.marginRight = "5px";
     btnAceptar.onClick.listen((_){
        
         List<DivElement> divItemList = querySelectorAll(".selected");
         
         List<Map<String, String>> pDResult = new List<Map<String, String>>();
         
         for (DivElement item in divItemList){
             Map<String, String> pMapResult = new Map<String, String>();
             pMapResult["id"]     = item.attributes["data-value"];
             pMapResult["nombre"] = item.text;
             pDResult.add(pMapResult);
         }
         
        pResult.complete(pDResult);
        querySelector("#modalItemList").remove();
     });
     
     ButtonElement btnCancelar = new Element.html("<button>Cancelar</button")..style.float = "right"..style.marginTop = "20px"..style.marginRight = "5px";
     btnCancelar.onClick.listen((_){
         pResult.complete(null);
         querySelector("#modalItemList").remove();
     });
     
     divButtonContainer.children.add(btnAceptar);
     divButtonContainer.children.add(btnCancelar);
     
     m1.children.add(divButtonContainer);
     
     return pResult.future;
}

Future<String> inputText(String ATexto, String ATitulo){
    
     Completer<String> pResult = new Completer<String>();
     
     DivElement mc = _getBackGroundDiv();
     mc.id = "modalInputText";
     
     DivElement m1 = _getWindowDiv("400px", "200px");
     mc.children.add(m1);
     
     DivElement divItemTitle = _getTitleDiv(ATitulo);
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
             InputElement inpText = querySelector("#inpTexto");
             
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
     
     InputElement inpTexto = new InputElement()..style.paddingTop = "13px"..id = "inpTexto";
     inpTexto.style.marginTop  = "30px";
     inpTexto.style.marginLeft = "50px";
     inpTexto.style.height     = "15px";
     inpTexto.style.padding    = "5px";
     inpTexto.style.width      = "300px";
     inpTexto.value = ATexto;
     
     divItemContainer.children.add(inpTexto);
         
     document.body.children.add(mc);
     
     DivElement divButtonContainer = new DivElement()..style.borderTopStyle = "solid"..style.borderColor = "silver"..style.borderWidth = "1px"
                ..style.paddingRight = "30px";
     
     ButtonElement btnAceptar = new Element.html("<button>Aceptar</button")..style.float = "right"..style.marginTop = "20px"..style.marginRight = "5px";
     btnAceptar.onClick.listen((_){
         fComplete(inpTexto.value);
     });
     
     ButtonElement btnCancelar = new Element.html("<button>Cancelar</button")..style.float = "right"..style.marginTop = "20px"..style.marginRight = "5px";
     btnCancelar.onClick.listen((_){
         fComplete(null);
     });
     
     divButtonContainer.children.add(btnAceptar);
     divButtonContainer.children.add(btnCancelar);
     
     m1.children.add(divButtonContainer);
     
     inpTexto.focus();
     inpTexto.select();
     
     return pResult.future;
}

void inputAutocomplet(InputElement AInputElement, String AUrl, String ACampoId){
  
    String pTexto = "";
    int pItemSelected = 0;
    int pTotalItems   = 0;
  
    AInputElement.onKeyDown.listen((KeyboardEvent event){
      
      var code = event.which;
      if (code == 40){
        
          if (querySelector("#divContainer1") != null){
            
              pItemSelected = 0;
              (querySelector("#item0") as DivElement).focus();
              
              return;
            
          }
        
      }         
               
       if (AInputElement.value.trim().length > 2){
         
             DivElement divContainer = new DivElement()..id = "divContainer1";
             divContainer.tabIndex   = 0;
             
             divContainer.style.width       = "300px";
             divContainer.style.height      = "200px";
             divContainer.style.borderColor = "silver";
             divContainer.style.borderStyle = "solid";
             divContainer.style.borderWidth = "1px";
             divContainer.style.background  = "white";
             divContainer.style.position    = "absolute";
             divContainer.style.overflowY   = "auto";
             
             String pTop  = (AInputElement.offsetTop + AInputElement.clientHeight + 5).toString() + "px";
             String pLeft = (AInputElement.offsetLeft).toString() + "px";
             
             divContainer.style.top  = pTop;  
             divContainer.style.left = pLeft;
             
             for (int i = 0; i <= 5; i++ ){
             
                pTotalItems += 1;
               
                DivElement pItem   = new DivElement();
                pItem.style.height = "20px";
                pItem.tabIndex     = i + 20;
                pItem.id           = "item" + i.toString();
                pItem.text         = i.toString();
                pItem.dataset["index"] = i.toString();
                
                pItem.onFocus.listen((_){
                 
                   pTexto = pItem.text;
                   pItem.style.background = "rgb(212, 220, 250)";
                   pItemSelected = int.parse(pItem.dataset["index"]);
                  
                });
                
                pItem.onBlur.listen((_){
                  
                  pItem.style.background = "white";   
                 
               });
                                
               divContainer.children.add(pItem);
                
             }
             
             divContainer.onKeyDown.listen((KeyboardEvent event){
               
               var code = event.which;
               
               if (code == 13){
                 
                    AInputElement.value = pTexto;
                    AInputElement.focus();
                    divContainer.remove();
                    event.preventDefault();
                    event.stopPropagation();
                    
                }
                
                if (code == 27){
                    AInputElement.focus();
                    divContainer.remove();
                    event.preventDefault();
                    event.stopPropagation();
                }
                
                if (code == 40){
                     if (pItemSelected == pTotalItems - 1){
                        return;
                     }
                  
                     pItemSelected += 1;
                    (querySelector("#item" + pItemSelected.toString()) as DivElement).focus();
                }
                 
                if (code == 38){
                    if (pItemSelected == 0){
                       return;
                    }
                    pItemSelected -= 1;
                    (querySelector("#item" + pItemSelected.toString()) as DivElement).focus();
                }
             
             });
             
             document.body.children.add(divContainer);
             //(querySelector("#item0") as DivElement).focus();
      
       }
       else{
         
         if (querySelector("#divContainer1") != null){
           (querySelector("#divContainer1") as DivElement).remove();
         }
          
       }
      
    });
    
}