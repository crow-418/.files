#!/bin/bash

sudo sed -E -i 's/^[[:space:]]*#[[:space:]]*(Color.*)/\1/' /etc/pacman.conf

sudo sed -i '/#DisableSandbox/ a\
ILoveCandy' /etc/pacman.conf
