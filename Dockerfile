FROM steinwaywhw/docker-texlive

RUN apt-get update
WORKDIR /tmp
RUN curl -s https://api.github.com/repos/jgm/pandoc/releases/latest | grep "browser_download_url.*deb" | cut -d : -f 2,3 | tr -d \" |  wget -O pandoc.deb -qi -
RUN dpkg -i ./pandoc.deb
RUN apt-get -f install
