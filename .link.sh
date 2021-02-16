#!/bin/bash
# _*_ coding:utf-8 _*_
# **********************************************************
# * Author        : 李阳
# * Email         : monogy@163.com
# * Create time   : 2021-02-16 10:15
# * Last modified : 2021-02-16 10:15
# * Filename      : .link.sh
# * Description   :
# *********************************************************/

rm -rf $HOME/.config/nvim/colors
ln -s $HOME/.config/nvim/plugged/vim-colorschemes/colors $HOME/.config/nvim

rm -rf $HOME/.config/coc
ln -s $HOME/.config/nvim/coc $HOME/.config
