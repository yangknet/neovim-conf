#!/bin/bash
my_path="$PWD"
nvim_cfg_path="$HOME/.config"

ln -s "$my_path/nvim" $nvim_cfg_path

echo "ok"
