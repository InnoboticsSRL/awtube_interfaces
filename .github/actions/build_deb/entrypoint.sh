#!/bin/bash
set -e

# Move any generated .deb packages to the GitHub workspace
mv src/*.deb /github/workspace/