#NoEnv
SetWorkingDir %A_ScriptDir%

prettyPrintAssociativeArray(arr, outputPath) {
  arrDesc := "========================================`nAssociative Array Description`n========================================`n"
  for key, value in arr
    arrValues .= key . ":" . value . ", "
  arrDesc .= "Content: " . subStr(arrValues, 1, -2) . "`n" 
  FileAppend, %arrDesc%, %outputPath%
}

prettyPrintAssociativeArraySubset(keys, arr, outputPath) {
  arrDesc := "========================================`nAssociative Array Description`n========================================`n"
  loop % keys.length() {
    arrValues .= keys[A_Index] . ":" . arr[keys[A_Index]] . ", "  
  }
  arrDesc .= "Content: " . subStr(arrValues, 1, -2) . "`n" 
  FileAppend, %arrDesc%, %outputPath%
}
