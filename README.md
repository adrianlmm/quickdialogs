# quickdialogs
Quick HTML dialogs w/o typing markup for Dart

Quick dialogs was designed to create HTML dialogs quickly w/o the need to create HTML markup or CSS stylesheets, it is designed to stay out the way, for that reason, they cannot be styled(yet), they are designed like that, useful for quick sketching web apps.

Functions:

##pickList
A modal pick list that show items based in a List.

```dart
Future<Map<String, String>> pickList(List<Map<dynamic, String>> AList, String ATitle, {String AKey : "Id", String AValue : "Value", String AMark : ""})
```
Example:

```dart
import 'package:quickdialogs/quickdialogs.dart' as QuickDialogs;

List<Map<int, String>> getLanguages(){

  List<Map<int, String>> pResult = new List<Map<int, String>>();

  pResult.add({"Key" : 1, "Value" : "Pascal (Static)"});
  pResult.add({"Key" : 2, "Value" : "Dart (Interpreted)"});
  pResult.add({"Key" : 3, "Value" : "Java (Static)"});
  pResult.add({"Key" : 4, "Value" : "Javascript (Interpreted)"});
  return pResult;
}

void main(){
    var languages = getLanguages();

    Map pResult = await QuickDialogs.pickList(languages, "Languages List");
    print(pResult);

}

```
This will return a map contaning the Key and the Value selected, for example:

```dart
{Key: 2, Value: Dart (Interpreted)}
```

<img src="https://raw.githubusercontent.com/adrianlmm/quickdialogs/master/resources/pics/1.png"></img>


If there are a different set of key and value names in the list, then those can be specified, in the next example the "Key" key is replaced with "Id" and "Value" value with Name.

Example:

```dart
import 'package:quickdialogs/quickdialogs.dart' as QuickDialogs;

List<Map<int, String>> getLanguages(){

  List<Map<int, String>> pResult = new List<Map<int, String>>();

  pResult.add({"Id" : 1, "Name" : "Pascal (Static)"});
  pResult.add({"Id" : 2, "Name" : "Dart (Interpreted)"});
  pResult.add({"Id" : 3, "Name" : "Java (Static)"});
  pResult.add({"Id" : 4, "Name" : "Javascript (Interpreted)"});
  return pResult;
}

void main(){
  var languages = getLanguages();

    Map pResult = await QuickDialogs.pickList(languages, "Languages List", AKey : "Id", AValue : "Name");
    print(pResult);

}

```
This will return something like:

```dart
{Id: 2, Name: Dart (Interpreted)}
```

It can also show some parts of the values highlighted or marked, for example, to highlight in the list the word Java.

Example:

```dart
Map pResult = await QuickDialogs.pickList(languages, "Languages List", AKey : "Id", AValue : "Name", AMark: "Java");
```

<img src="https://raw.githubusercontent.com/adrianlmm/quickdialogs/master/resources/pics/2.png"></img>

##multiPickList
Same as pick list, but you can select more than one value, it will return a List of maps.

```dart
Future<List<Map<String, String>>> multiPickList(List<Map<dynamic, String>> AList, String ATitle, {String AKey : "Id", String AValue : "Value", String AMark : ""})

```
Example:

```dart
List<Map> pResult = await QuickDialogs.multiPickList(languages, "Languages List, pick one or more", AKey: "Id", AValue: "Name", AMark: "Java");
    print(pResult);
```

<img src="https://raw.githubusercontent.com/adrianlmm/quickdialogs/master/resources/pics/3.png"></img>

##inputText
A simple modal dialog to capture text or a password.

```dart
Future<String> inputText(String AText, String ATitle, {bool Password : false})
```

Example:
```dart
var pResult = await QuickDialogs.inputText("", "Write a simple description");
```

<img src="https://raw.githubusercontent.com/adrianlmm/quickdialogs/master/resources/pics/4.png"></img>

It can also show the input as password characters:

Example:
```dart
var pResult = await QuickDialogs.inputText("", "Input your password", Password : true);
```

<img src="https://raw.githubusercontent.com/adrianlmm/quickdialogs/master/resources/pics/5.png"></img>

##inputAutocomplete
Ajax automplemete for HTML inputs.

```dart
void inputAutocomplete(InputElement AInputElement, String AUrl, {bool Mark : false, onSelect(Akey, AValue) : null})
```
Example:

```dart
String pUrl = "http://localhost:4567/programing_languages";
QuickDialogs.inputAutocomplete(inpAutocomplete, pUrl, onSelect: (key, value) => print("key: $key, value: $value"));
```  

<img src="https://raw.githubusercontent.com/adrianlmm/quickdialogs/master/resources/pics/6.png"></img>

The query in the results can also be marked or highlighted:

Example:
```dart
String pUrl = "http://localhost:4567/programing_languages";
QuickDialogs.inputAutocomplete(inpAutocomplete, pUrl, Mark: true, onSelect: (key, value) => print("key: $key, value: $value"));
```  

<img src="https://raw.githubusercontent.com/adrianlmm/quickdialogs/master/resources/pics/7.png"></img>

The REST service signature must have the "query" param in the query string, the result is a JSON array with Key and Value pairs, for example:
```dart
http://localhost:4567/programing_languages?query=java
```
And the response should be something like:

```dart
[{"Key":"3","Value":"Java (Static, Managed)"},{"Key":"9","Value":"Javascript (Dinamyc, Interpreted)"}]
```

##showModal (Experimental)
This is experimental, it will take the id of a DIV element and show it in a modal window, the DIV must have a child div with the name of the parent div plus the string "-body"

Example:

```html
<div id="mdlData" style="display:none;">
    <div id="mdlData-body" style="width: 500px;">
          <div>
            <h1>This will appear in a modal window</h1>
          </div>
          <div>
              <button id="mdlData-close1">Cancel</button>&nbsp;<button id="btnOK">OK</button>
          </div>
        </div>
    </div>
</div>
```

Dart code:

```dart
QuickDialogs.showModal("mdlData");
```

<img src="https://raw.githubusercontent.com/adrianlmm/quickdialogs/master/resources/pics/8.png"></img>

To close the dialog use the closeModal function:

```dart
QuickDialogs.closeModal("mdlData");
```
