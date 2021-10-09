import "http"

# 获取最新发布的信息
github_release_latest(){
  local owner="$1"
  local repo="$2"
  http_get "https://api.github.com/repos/$owner/$repo/releases/latest"
}

# 获取最新发布的资产URL
github_release_latest_asset_url(){
  github_release_latest "$@" | jq -r ".assets[0].browser_download_url"
}

# 获取特定标签的发布信息
github_release_by_tag(){
  local owner="$1"
  local repo="$2"
  local tag="$3"
  http_get "https://api.github.com/repos/$owner/$repo/releases/tags/$tag"
}

# 获取仓库的所有标签
github_repo_tags(){
  local owner="$1"
  local repo="$2"
  http_get "https://api.github.com/repos/$owner/$repo/tags"
}

# 获取仓库的特定文件内容
github_file_content(){
  local owner="$1"
  local repo="$2"
  local path="$3"
  http_get "https://api.github.com/repos/$owner/$repo/contents/$path" | jq -r ".content" | base64 --decode
}

# 注：为了让上述代码工作，您的系统需要安装 jq 工具。
