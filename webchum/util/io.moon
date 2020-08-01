-- webssg.util.io

-- reads the contents of a file
readfile = (file) ->
  local contents
  with io.open "#{file}", "r"
    return nil unless _with_0
    contents = \read "*a"
    \close!
  return contents

-- writes to a file
writefile = (file, txt) ->
  with io.open "#{file}", "w"
    \write txt
    \close!

{
  :readfile, :writefile
}