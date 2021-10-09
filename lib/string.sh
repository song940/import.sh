
string_upper(){
	echo $1 | tr 'a-z' 'A-Z'
}

string_lower(){
  echo $1 | tr 'A-Z' 'a-z'
}

string_includes() {
  local r=1
  case "$1" in
    *"$2"*)
    r=0
    ;;
  esac
  return "$r"
}

string_starts_with() {
  local r=1
  case "$1" in
    "$2"*)
    r=0
    ;;
  esac
  return "$r"
}

string_ends_with() {
  local r=1
  case "$1" in
    *"$2")
    r=0
    ;;
  esac
  return "$r"
}
