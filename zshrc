# powerlevel10k 默认（需置顶）
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# 变量
export ZSH=~/.oh-my-zsh

# Golang 环境
export GOPATH=~/go
export GOROOT="/usr/local/opt/go/libexec"
export PATH="$PATH:$GOPATH/bin"

# 别名
alias note="code ~/Documents/Note.code-workspace"
alias coda="code ~/Documents/Coda.code-workspace"

# brew install trash
alias rm="trash -vF"            # 删除文件（Finder）

# 配置
ZSH_THEME="powerlevel10k/powerlevel10k"            # 主题
DEFAULT_USER=$USER              # 隐藏主机名
DISABLE_AUTO_UPDATE="true"      # 禁用更新检查
ENABLE_CORRECTION="true"        # 命令自动更正
HIST_STAMPS="yyyy-mm-dd"        # 在 history 显示命令执行时间

# 插件
plugins=(
  git
  sudo                          # 命令前加 sudo
  z                             # 目录跳转
  vi-mode                       # 命令行 vi 模式
  zsh-autosuggestions           # 命令补全
  zsh-syntax-highlighting       # 语法高亮
  zsh-poetry
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


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh