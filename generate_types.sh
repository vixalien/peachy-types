#!/bin/sh

BOLD='\033[1m'
CYAN='\033[0;34m'
NC='\033[0m'
message() {
    printf "\n${BOLD}${CYAN}>> ${1}${NC}\n"
}

export CI=true
export PNPM_HOME=$(mktemp -d)

mkdir "$PNPM_HOME/bin"

message "Enabling Node..."
export PATH="$PNPM_HOME/bin:/usr/lib/sdk/node26/bin:$PATH"
# export PATH="$(npm root -g):$PATH"

message "Installing pnpm..."
npx get-pnpm

message "Installing girgen..."
pnpm install

message "Cleaning up old files"
rm types/*.d.ts

message "Generating modules..."
pnpm exec girgen typescript -o types

message "Generated modules"
exit
