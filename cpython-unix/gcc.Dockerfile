{% include 'base.Dockerfile' %}
RUN apt-get install \
      autoconf \
      automake \
      bison \
      build-essential \
      gawk \
      gcc \
      gcc-multilib \
      libtool \
      make \
      tar \
      xz-utils \
      unzip
