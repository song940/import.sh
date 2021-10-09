# 将字符串转换为大写
string_upper(){
	echo "$1" | tr 'a-z' 'A-Z'
}

# 将字符串转换为小写
string_lower(){
	echo "$1" | tr 'A-Z' 'a-z'
}

# 检查字符串是否包含子串
string_includes() {
	case "$1" in
		*"$2"*) return 0 ;;
		*) return 1 ;;
	esac
}

# 检查字符串是否以特定前缀开始
string_starts_with() {
	local string="$1"
	local prefix="$2"
	[[ "$string" == "$prefix"* ]]
}

# 检查字符串是否以特定后缀结束
string_ends_with() {
	case "$1" in
		*"$2") return 0 ;;
		*) return 1 ;;
	esac
}

# 反转字符串
string_reverse() {
	echo "$1" | rev
}

# 获取字符串的长度
string_length() {
	echo -n "$1" | wc -c
}

# 删除字符串中的所有空白字符 (空格、制表符、换行符等)
string_trim() {
	echo "$1" | xargs
}

# 检查两个字符串是否相等，不区分大小写
string_equals_ignore_case() {
	local string1=$(string_lower "$1")
	local string2=$(string_lower "$2")
	[ "$string1" = "$string2" ]
}

# 从字符串中提取子串
# 使用：string_substring "Hello World" 1 4   => ello
string_substring() {
	local string="$1"
	local start="$2"
	local length="$3"
	echo "$string" | cut -c$(($start+1))-$(($start+$length))
}
