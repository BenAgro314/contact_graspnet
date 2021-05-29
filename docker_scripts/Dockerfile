FROM ubuntu:18.04

RUN apt-get -y update
RUN apt-get install -y wget unzip git g++
RUN apt-get -y install libgl1-mesa-dev libgl1-mesa-glx libosmesa6-dev patchelf libopenmpi-dev libglew-dev libglfw3 libglfw3-dev

# for display through vnc
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y xfce4 tigervnc-standalone-server

RUN apt-get update
RUN apt-get -y install curl
RUN apt-get -y install ipython

RUN apt-get update
RUN apt-get -y install firefox

# utilities 
RUN apt-get -y install vim
RUN apt-get -y install tmux
RUN apt-get -y install openssh-server
RUN apt-get install sudo


RUN apt-get install xfce4-terminal
RUN printf "2\n" | update-alternatives --config x-terminal-emulator

ARG password
ARG id
ARG user

ENV PASS=$password


RUN groupadd -g 1004 agrobenj
RUN useradd -s /bin/bash -u $id -g $id -m $user && echo "$user:$password" | chpasswd && adduser $user sudo

USER agrobenj

WORKDIR /home/$user/

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh && \
    mkdir ~/.conda && \
    /bin/bash miniconda.sh -b -p ~/miniconda && \
    rm miniconda.sh && \
    echo "export PATH=~/miniconda/bin:$PATH" >> ~/.bashrc 

SHELL ["/bin/bash", "--login", "-c"]

ENV PATH=~/miniconda/bin:$PATH

COPY contact_graspnet_env.yml .
RUN conda env create -f contact_graspnet_env.yml


RUN echo "export USER=$user" >> ~/.bashrc

WORKDIR /home/$user/workspace

COPY .tmux.conf /home/$user/.tmux.conf
COPY .vimrc /home/$user/.vimrc

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["bash","/entrypoint.sh"]

CMD ["bash"]

