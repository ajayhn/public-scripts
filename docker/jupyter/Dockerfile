# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

# Forked from https://github.com/jupyter/docker-stacks/blob/master/minimal-notebook/Dockerfile

FROM jupyter/base-notebook

MAINTAINER Hampapur Ajay <ajayhn@yahoo.com>

USER root

# Install all OS dependencies for fully functional notebook server
RUN apt-get update && apt-get install -yq --no-install-recommends \
    git \
    vim \
    jed \
    build-essential \
    python-dev \
    unzip \
    libsm6 \
    pandoc \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-fonts-recommended \
    texlive-generic-recommended \
    texlive-xetex \
    lmodern \
    libxrender1 \
    inkscape \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN conda install -y -c conda-forge ipywidgets
RUN conda install -y -c conda-forge ipyleaflet
RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension
RUN jupyter nbextension enable --py --sys-prefix ipyleaflet

COPY config /home/jovyan/.jupyter
COPY vim_binding /opt/conda/share/jupyter/nbextensions/vim_binding
RUN chmod -R go-w /opt/conda/share/jupyter/nbextensions/vim_binding

# Switch back to jovyan to avoid accidental container runs as root
USER $NB_USER
