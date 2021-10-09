#!/bin/sh

# 获取操作系统类型
case $(uname -s) in
  Linux*)
    export os_type=linux
    ;;
  Darwin*)
    export os_type=darwin
    ;;
  CYGWIN*|MINGW*|MSYS*)
    export os_type=windows
    ;;
  *)
    export os_type=unknown
    ;;
esac

# 获取机器架构
case $(uname -m) in
  armv6*)
    export os_arch=armv6
    ;;
  armv7*)
    export os_arch=armv7
    ;;
  aarch64)
    export os_arch=arm64
    ;;
  x86_64)
    export os_arch=amd64
    ;;
  i686)
    export os_arch=i686
    ;;
  *)
    export os_arch=unknown
    ;;
esac

# 检查操作系统是否匹配给定的类型
os_is_type() {
  local type="$1"
  [ "$os_type" = "$type" ]
}

# 检查架构是否匹配给定的架构
os_is_arch() {
  local arch="$1"
  [ "$os_arch" = "$arch" ]
}

# 获取操作系统类型的函数
os_get_type() {
  echo "$os_type"
}

# 获取机器架构的函数
os_get_arch() {
  echo "$os_arch"
}
