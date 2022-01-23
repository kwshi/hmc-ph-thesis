FROM "voidlinux/voidlinux"
RUN ["xbps-install", "-Syu", "just", "texlive-full", "biber", "gnuplot", "python3-Pygments"]
COPY ["build.sh", "/bin/ks-thesis-build"]
RUN ["chmod", "+x", "/bin/ks-thesis-build"]
ENTRYPOINT ["/bin/ks-thesis-build"]
