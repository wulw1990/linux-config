#trash
function trash
  set TRASH "/mnt/lustre/wulw/.trash"
  mkdir -p $TRASH
  set num (count $argv)
  for name in $argv
    set full (cd (dirname $name); pwd)/(basename $name)
    set full (echo $full | tr / =)
    set timestamp (date +%Y-%m-%d_%T_%N)
    set full {$timestamp}_{$full}

    echo "mv \"$name\" \"$TRASH/$full\""
    mv "$name" "$TRASH/$full"
  end
end

# show git branch in prompt
function fish_prompt
  set -l git_branch (git branch ^/dev/null | sed -n '/\* /s///p')
  set_color purple
  echo -n (whoami)'@'(hostname)':'
  set_color FF0
  echo -n (prompt_pwd)
  set_color 0FF
  echo -n '{'"$git_branch"'}'
  set_color FFF
  echo -n '$ '
end

# fish
export PATH="/home/wulw/bin:$PATH"

#alias
alias home='cd /mnt/lustre/wulw'
alias code='cd /mnt/lustre/wulw/private/code'
alias rm='echo "Use trash-put instead, This is not the command you are looking for."; false'

# conda
export PATH="/mnt/lustre/wulw/miniconda3/bin:$PATH"

# gcc
export GCCPATH="/mnt/lustre/share/gcc/gcc-5.3.0"
export PATH="$GCCPATH/bin:$PATH"
export CC="$GCCPATH/bin/gcc"
export CXX="$GCCPATH/bin/g++"
export LD_LIBRARY_PATH="$GCCPATH/lib64:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="/mnt/lustre/share/gcc/gmp-4.3.2/lib:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="/mnt/lustre/share/gcc/mpc-0.8.1/lib:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="/mnt/lustre/share/gcc/mpfr-2.4.2/lib:$LD_LIBRARY_PATH"

## cppbuild
export PATH="/mnt/lustre/wulw/bin/cppbuild:$PATH"

## armory
export ARMORY="/mnt/lustre/wulw/private/code/armory"
export PYTHONPATH="$ARMORY/env/site-packages:$PYTHONPATH"
