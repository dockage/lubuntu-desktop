FROM ubuntu:15.04
MAINTAINER Mohammad Abdoli Rad <m.abdolirad@gmail.com>

RUN apt-get update \
 && DEBCONF_FRONTEND=noninteractive apt-get install -y lxterminal lubuntu-desktop firefox tightvncserver \ 
 && rm -rf /var/lib/apt/lists/*

# Add & config rasa user
RUN echo "rasa ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
 && useradd --create-home --user-group -s /usr/bin/zsh rasa \
 && echo "rasa:rasa"|chpasswd \
 && sudo -u rasa -H sh -c "export SHELL=/usr/bin/zsh; curl -L http://install.ohmyz.sh | bash" \
 && sudo -u rasa -H sh -c "sed -i 's/ZSH_THEME=\".*\"/ZSH_THEME=\"maran\"/g' /home/rasa/.zshrc"

EXPOSE 5901
