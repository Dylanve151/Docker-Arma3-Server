FROM cm2network/steamcmd
COPY steamModsDownload.sh .
USER root
RUN chown steam:steam steamModsDownload.sh && chmod 755 steamModsDownload.sh
USER steam
