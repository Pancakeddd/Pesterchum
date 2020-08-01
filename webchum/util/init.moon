-- webchum.util

first = (t) ->
  expect 1, t, {"table"}
  t[1] or false

unbool = (num) -> num == 1

{
  :first, :unbool
}