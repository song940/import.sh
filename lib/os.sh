import "string"

case $(uname -s) in
  Linux*)
    export os=linux
    ;;
  Darwin*)
    export os=darwin
    ;;
  *)
    export os=windows
    ;;
esac

case $(uname -m) in
  armv6*)
    export arch=armv6
    ;;
  aarch64)
    export arch=armv8
    ;;
  x86_64)
    export arch=amd64
    ;;
esac
