#!/bin/bash
# back up old zprofile
cat ~/.zprofile >> ~/.zprofile_backup
cp .zprofile ~
