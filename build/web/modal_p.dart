library ModalP;

import "dart:html";
import "dart:async";

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

Future<Map<String, String>> pickList(List<Map<dynamic, String>> ALista, String ATitulo){
    
     Completer<Map<String, String>> pResult = new Completer<Map<dynamic, String>>();
     
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
     
     DivElement m1 = new DivElement();
     
     m1.style.width = "400px";
     m1.style.height = "450px";
     m1.style.position = "fixed";
     m1.style.backgroundColor = "white";
     m1.style.borderColor = "gray";
     m1.style.borderWidth = "1px";
     m1.style.borderStyle = "solid";
     
     m1.style.zIndex = "9999";
     m1.style.boxShadow = "5px 5px 3px #888888";
     
     mc.style.display = "block";
     
     var iw = window.innerWidth;
     var ih =  window.innerHeight;
     var x = ((iw /2) -200).round();
     var y = ((ih/2) - 250).round();
     
     m1.style.top = y.toString()+"px";
     m1.style.left = x.toString()+"px";

     mc.children.add(m1);
     m1.style.padding = "0px";
     
     DivElement divItemTitle = new DivElement()..children.add(new Element.html("<h3>${ATitulo}</h>"))..style.textAlign = "center"..style.backgroundColor = "rgb(240, 240, 240)"..style.borderBottomStyle = "solid"..style.borderColor = "black"..style.borderWidth = "1px";
     divItemTitle.children[0].style.marginTop = "0px";
     divItemTitle.children[0].style.marginBottom = "0px";
     m1.children.add(divItemTitle);
     
     DivElement divItemContainer = new DivElement();
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
         
         if (code == 13 || code == 32){
             DivElement divItem = querySelector(".selected");
             
             Map<String, String> pMapResult = new Map<String, String>();
             pMapResult["id"]     = divItem.attributes["data-value"];
             pMapResult["nombre"] = divItem.text;
             
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
             if (i == 0){
                idDiv = int.parse(divItem.attributes["data-index"]) + 1;
             }
             else{
                 idDiv = int.parse(divItem.attributes["data-index"]) - 1;
             }
             DivElement divNewItem = querySelector("#item${idDiv}");
             
             if (divNewItem != null){ 
                 divItem.classes.remove("selected");
                 divItem.style.backgroundColor = "white";
                 divNewItem.classes.add("selected");
                 divNewItem.style.backgroundColor = "rgb(212, 220, 250)";
             }
         };
         
         if (code == 40){
             vSelect(0);
         }
         
         if (code == 38){
             vSelect(1);
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
         if (i == 0){
            divItem.style.background = "rgb(212, 220, 250)";
            divItem.classes.add("selected");
         }
         i++;
         divItem.text = item["nombre"];
         
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
         pMapResult["id"]     = divItem.attributes["data-value"];
         pMapResult["nombre"] = divItem.text;
         
         fComplete(pMapResult);
     });
     
     ButtonElement btnCancelar = new Element.html("<button>Cancelar</button")..style.float = "right"..style.marginTop = "20px"..style.marginRight = "5px";
     btnCancelar.onClick.listen((_){
         fComplete(null);
     });
     
     divButtonContainer.children.add(btnAceptar);
     divButtonContainer.children.add(btnCancelar);
     
     m1.children.add(divButtonContainer);
     
     return pResult.future;
}

Future<List<Map<String, String>>> multiPickList(List<Map<dynamic, String>> ALista, String ATitulo){
    
    Completer<List<Map<String, String>>> pResult = new Completer<List<Map<String, String>>>();
    
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
    
    DivElement m1 = new DivElement();
    
    m1.style.width = "400px";
    m1.style.height = "450px";
    m1.style.position = "fixed";
    m1.style.backgroundColor = "white";
    m1.style.borderColor = "gray";
    m1.style.borderWidth = "1px";
    m1.style.borderStyle = "solid";
    
    m1.style.zIndex = "9999";
    m1.style.boxShadow = "5px 5px 3px #888888";
    
    mc.style.display = "block";
    
    var iw = window.innerWidth;
    var ih =  window.innerHeight;
    var x = ((iw /2) -200).round();
    var y = ((ih/2) - 250).round();
    
    m1.style.top = y.toString()+"px";
    m1.style.left = x.toString()+"px";

    mc.children.add(m1);
    m1.style.padding = "0px";
    
    DivElement divItemTitle = new DivElement()..children.add(new Element.html("<h3>${ATitulo}</h>"))..style.textAlign = "center"..style.backgroundColor = "rgb(240, 240, 240)"..style.borderBottomStyle = "solid"..style.borderColor = "black"..style.borderWidth = "1px";
    divItemTitle.children[0].style.marginTop = "0px";
    divItemTitle.children[0].style.marginBottom = "0px";
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
     
     DivElement m1 = new DivElement();
     
     m1.style.width = "400px";
     m1.style.height = "200px";
     m1.style.position = "fixed";
     m1.style.backgroundColor = "white";
     m1.style.borderColor = "gray";
     m1.style.borderWidth = "1px";
     m1.style.borderStyle = "solid";
     
     m1.style.zIndex = "9999";
     m1.style.boxShadow = "5px 5px 3px #888888";
     
     mc.style.display = "block";
     
     var iw = window.innerWidth;
     var ih =  window.innerHeight;
     var x = ((iw /2) -200).round();
     var y = ((ih/2) - 250).round();
     
     m1.style.top = y.toString()+"px";
     m1.style.left = x.toString()+"px";

     mc.children.add(m1);
     m1.style.padding = "0px";
     
     DivElement divItemTitle = new DivElement()..children.add(new Element.html("<h3>${ATitulo}</h3>"))..style.textAlign = "center"..style.backgroundColor = "rgb(240, 240, 240)"..style.borderBottomStyle = "solid"..style.borderColor = "black"..style.borderWidth = "1px";
     divItemTitle.children[0].style.marginTop = "0px";
     divItemTitle.children[0].style.marginBottom = "0px";
     divItemTitle.style.height = "25px !important";
     divItemTitle.style.paddingTop = "5px !important";
     m1.children.add(divItemTitle);
     
     DivElement divItemContainer = new DivElement();
     divItemContainer.style.height = "100px";
     divItemContainer.style.overflowY = "auto";
     m1.children.add(divItemContainer);
     
     mc.tabIndex = 0;
     mc.focus();
     
     Function fComplete(String AResult){
         pResult.complete(AResult);  
         querySelector("#modalItemList").remove();
     }
     
     mc.onKeyDown.listen((KeyboardEvent event){
         if (querySelector("#modalItemList") == null){
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
     
     DivElement divButtonContainer = new DivElement()..style.borderTopStyle = "solid"..style.borderColor = "black"..style.borderWidth = "1px";
     
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