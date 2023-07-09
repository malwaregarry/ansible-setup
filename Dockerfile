FROM archlinux/archlinux
WORKDIR /usr/local/bin
RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm sudo curl git ansible which vi

RUN groupadd --gid 1000 mw
RUN useradd -c mw --uid 1000 --gid 1000 mw
RUN passwd -d mw
RUN echo '%mw ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers
WORKDIR /home/mw
RUN chown -R mw /home/mw
RUN chmod -R a+rX /home/mw

USER mw

COPY . .
ARG TAGS
