
USER_AGENT="import.sh/1.0"

http_get(){
  if ! curl -sLf --connect-timeout 10 -A "$USER_AGENT" "$1"; then
      echo "Error fetching the URL: $1" >&2
      return 1
  fi
}

# POST请求
http_post() {
    local url="$1"
    local data="$2"
    curl -sLf --connect-timeout 10 -A "$USER_AGENT" -d "$data" "$url"
}

# 设置自定义头
http_get_with_header() {
    local url="$1"
    local header="$2"
    curl -sLf --connect-timeout 10 -A "$USER_AGENT" -H "$header" "$url"
}

# 下载文件
http_download() {
    local url="$1"
    local dest="$2"
    curl -sLf --connect-timeout 10 -A "$USER_AGENT" -o "$dest" "$url"
}

# 上传文件
http_upload() {
    local url="$1"
    local file_path="$2"
    curl -sLf --connect-timeout 10 -A "$USER_AGENT" -F "file=@$file_path" "$url"
}

# 使用cookie文件
http_get_with_cookies() {
    local url="$1"
    local cookie_file="$2"
    curl -sLf --connect-timeout 10 -A "$USER_AGENT" -b "$cookie_file" -c "$cookie_file" "$url"
}

# 获取响应头
http_get_headers() {
    local url="$1"
    curl -sI --connect-timeout 10 -A "$USER_AGENT" "$url"
}
