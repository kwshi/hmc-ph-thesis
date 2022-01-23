FROM "texlive/texlive"
ADD ["https://github.com/cormullion/juliamono/releases/download/v0.043/JuliaMono-ttf.tar.gz", "/tmp/juliamono.tar.gz"]
RUN ["mkdir", "-p", "/usr/share/fonts/juliamono"]
RUN ["tar", "-xz", "-C", "/usr/share/fonts/juliamono", "-f", "/tmp/juliamono.tar.gz"]
COPY ["build.sh", "/tmp/build.sh"]
RUN ["chmod", "+x", "/tmp/build.sh"]
ENTRYPOINT ["/tmp/build.sh"]
