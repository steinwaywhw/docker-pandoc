FROM steinwaywhw/docker-texlive

RUN apt-get update
RUN apt-get install -y curl wget make gnuplot graphviz zsh git
WORKDIR /tmp
RUN curl -s https://api.github.com/repos/jgm/pandoc/releases/latest | grep "browser_download_url.*deb" | cut -d : -f 2,3 | tr -d \" |  wget -O pandoc.deb -qi -
RUN dpkg -i ./pandoc.deb
RUN apt-get -f install

WORKDIR $HOME
RUN sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" || true

ENTRYPOINT zsh
