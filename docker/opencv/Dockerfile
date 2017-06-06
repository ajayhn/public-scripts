# Based off https://hub.docker.com/r/elenaalexandrovna/opencv-python3/
FROM ubuntu:16.04

MAINTAINER Hampapur Ajay <ajayhn@yahoo.com>

RUN apt-get update && \
    apt-get install -y \
    build-essential \
    cmake \
    git \
    wget \
    unzip \
    yasm \
    pkg-config \
    libswscale-dev \
    python3-dev \
    python3-numpy \
    libtbb2 \
    libtbb-dev \
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
    libjasper-dev \
    libavformat-dev \
    tesseract-ocr \
    tesseract-ocr-dev \
    libgtk2.0-dev \
    && apt-get -y clean all \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /

RUN cv_version='3.2.0' \
    && wget https://github.com/Itseez/opencv/archive/"$cv_version".zip \
    && unzip "$cv_version".zip \
    && wget https://github.com/Itseez/opencv_contrib/archive/"$cv_version".zip -O opencv_contrib.zip \
    && unzip opencv_contrib \
    && mkdir /opencv-"$cv_version"/cmake_binary

# download and install leptonica for tesseract-ocr
RUN wget http://www.leptonica.com/source/leptonica-1.73.tar.gz \
        && tar xvf leptonica-1.73.tar.gz \
        && cd leptonica-1.73 \
        && ./configure \
        && make \
        && make install



# make and install opencv
RUN cv_version='3.2.0' \ 
        && cd /opencv-"$cv_version"/cmake_binary \
        && Tesseract_INCLUDE_DIR=/usr/include/tesseract \
        && Tesseract_LIBRARY=/usr/lib \
        && cmake -DOPENCV_EXTRA_MODULES_PATH=/opencv_contrib-"$cv_version"/modules \
              -DBUILD_TIFF=ON \
              -DBUILD_opencv_java=OFF \
              -DWITH_CUDA=OFF \
              -DENABLE_AVX=ON \
              -DWITH_OPENGL=ON \
              -DWITH_OPENCL=ON \
              -DWITH_IPP=ON \
              -DWITH_TBB=ON \
              -DWITH_EIGEN=ON \
              -DWITH_V4L=ON \
              -DBUILD_TESTS=OFF \
              -DBUILD_PERF_TESTS=OFF \
              -DCMAKE_BUILD_TYPE=RELEASE \
              -DBUILD_opencv_python3=ON \
              -DCMAKE_INSTALL_PREFIX=$(python3.5 -c "import sys; print(sys.prefix)") \
              -DPYTHON_EXECUTABLE=$(which python3.5) \
              -DPYTHON_INCLUDE_DIR=$(python3.5 -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") \
              -DPYTHON_PACKAGES_PATH=$(python3.5 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") .. \
        && make install \
        && rm /"$cv_version".zip \
        && rm /opencv_contrib.zip \
        && rm -r /opencv-"$cv_version" \
        && rm -r /opencv_contrib-"$cv_version" \
        && rm -r /leptonica-1.73.tar.gz
