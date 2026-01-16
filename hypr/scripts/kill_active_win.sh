#!/bin/bash

hyprctl activewindow | grep pid | tr -d 'pid:' | xargs kill