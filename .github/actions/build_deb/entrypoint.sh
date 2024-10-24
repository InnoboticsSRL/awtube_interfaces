#!/bin/bash
set -e

# Create a .deb package
source /opt/ros/humble/setup.sh && \
cd src/awtube_interfaces && \
bloom-generate rosdebian && \
fakeroot debian/rules binary

# Move any generated .deb packages to the GitHub workspace
mv ../*.deb /github/workspace/deb