FROM "texlive/texlive"
COPY ["build.sh", "/tmp/build.sh"]
RUN ["chmod", "+x", "/tmp/build.sh"]
ENTRYPOINT ["/tmp/build.sh"]
