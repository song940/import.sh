
github_release_latest(){
  owner=$1
  repo=$2
  curl "https://api.github.com/repos/$owner/$repo/releases/latest"
}

github_release_latest_asset_url(){
  github_release_latest $@ | grep browser_download_url | cut -c31- | sed -e 's/^"//' -e 's/"$//'
}
