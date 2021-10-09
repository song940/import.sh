is_systemctl_available() {
  command -v systemctl &>/dev/null
  return $?
}

systemctl_install() {
  if ! is_systemctl_available; then
    return 1
  fi

  local filename="$1"
  if [[ ! -f "$filename" ]]; then
    return 1
  fi
  
  local name=$(basename "$filename")
  local target="/etc/systemd/system/$name"
  if [[ -L "$target" ]]; then
    rm -f "$target"
  fi
  ln -s "$filename" "$target"
}

systemctl_uninstall() {
  if ! is_systemctl_available; then
    return 1
  fi

  local name="$1"
  local target="/etc/systemd/system/$name"
  if [[ -L "$target" ]]; then
    rm -f "$target"
  fi
}

systemctl_enable() {
  if ! is_systemctl_available; then
    return 1
  fi

  local name="$1"
  systemctl enable "$name"
}

systemctl_disable() {
  if ! is_systemctl_available; then
    return 1
  fi

  local name="$1"
  systemctl disable "$name"
}

systemctl_start() {
  if ! is_systemctl_available; then
    return 1
  fi

  local name="$1"
  systemctl start "$name"
}

systemctl_stop() {
  if ! is_systemctl_available; then
    return 1
  fi

  local name="$1"
  systemctl stop "$name"
}
