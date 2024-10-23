FROM ros:humble-ros-base

# Install build tool
RUN apt update && apt install -y python3-colcon-common-extensions git ros-dev-tools 

# install tools
RUN apt update && \
    apt install -y autoconf libtool \
    python3-vcstool \
    tmux \
    vim \
    python3-pip

# use only bash shell
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# workdir
WORKDIR /ws

# copy all in src
ADD . src/

# install rosdep
RUN rosdep init; rosdep update; apt update
RUN apt update; rosdep install --from-paths src --ignore-src -r -y --rosdistro=humble

# compile
RUN . /opt/ros/humble/setup.sh; colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release
