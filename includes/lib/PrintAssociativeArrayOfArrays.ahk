printAssociativeArrayOfArrays(arr, outputPath) {
  for key, value in arr
    content .= key . ":(" . value[1] . "," . value[2] . "), "
  output := "Content: " . substr(content, 1, -2)
  FileAppend, %output%, %outputPath%
}
