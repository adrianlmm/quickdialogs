import 'dart:html';
import 'modal_p.dart' as ModalP;

void main() {
  print("iniciando!");
  
  querySelector("#sample_text_id")
    ..text = "Click me!"
    ..onClick.listen(btnClick);
  
  ButtonElement btnCerrar = querySelector("#btnCerrar");
  btnCerrar.onClick.listen((_){
    
      ModalP.cierra_modal("mc");
    
  });
}

void btnClick(MouseEvent event) {
    //ModalP.modal("mc");
    //querySelector("#inpData").focus();
    
    Map<String, String> pData = new Map<String, String>();
    pData["id"] = "1";
    pData["nombre"] = "adrián";
    
    Map<String, String> pData2 = new Map<String, String>();
    pData2["id"] = "2";
    pData2["nombre"] = "otro";
    
    List<Map<String, String>> pLista = new List<Map<String, String>>();
    pLista.add(pData);
    pLista.add(pData2);
    
    for (int i = 3; i <= 100; i ++){
        Map<String, String> pDataX = new Map<String, String>();
        pDataX["id"] = i.toString();
        pDataX["nombre"] = i.toString();
        pLista.add(pDataX);
    }
    
    /*ModalP.multiPickList(pLista, "Lista demo").then((List<Map<String,String>> AResult){
       
        if (AResult != null){
            
            for (Map item in AResult){
            
                print(item["nombre"]);
                
            }
        }
        
    });*/
    
    ModalP.inputText("Demo", "Título Demo").then((String AResult){
      
        window.alert(AResult);
      
    });
}