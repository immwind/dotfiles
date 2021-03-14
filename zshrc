# 变量

export ZSH=~/.oh-my-zsh

# Golang 环境
export GOPATH=~/go
export GOROOT="/usr/local/opt/go/libexec"
export PATH="$PATH:$GOPATH/bin"

# 别名
alias note="code ~/Documents/Note.code-workspace"
alias coda="code ~/Documents/Coda.code-workspace"

# 配置
ZSH_THEME="agnoster"            # 主题
DEFAULT_USER=$USER              # 隐藏主机名
DISABLE_AUTO_UPDATE="true"      # 禁用更新检查
ENABLE_CORRECTION="true"        # 命令自动更正
HIST_STAMPS="yyyy-mm-dd"        # 在 history 显示命令执行时间

# 插件
plugins=(
  git
  zsh-autosuggestions           # 命令补全
  z                             # 目录跳转
  pipenv
  sudo                          # 命令前加 sudo
  #vi-mode                       # 命令行 vi 模式
)

source $ZSH/oh-my-zsh.sh

# 脚本

# 重复执行指定命令
function watch {
    while; do
        $@
        sleep 3
    done
}

# 创建文件夹并跳转到目录（如果同时创建多个，则跳转到最后一个）
function mkcd {
    mkdir $* && cd ${@[$#]}
}

eval "$(starship init zsh)"

# pipenv 自动完成
eval "$(pipenv --completion)"
# pipenv env 目录位置
export PIPENV_VENV_IN_PROJECT=1

# pyenv
# 避免 pyenv 安装报错
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi