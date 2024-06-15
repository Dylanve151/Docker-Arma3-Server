FROM cm2network/steamcmd
COPY steamModsDownload.sh .
ENV DOWNLOADRETRY=50
USER root
RUN apt-get update && apt-get install -y \
    rename \
    && apt-get clean
RUN chown steam:steam steamModsDownload.sh && chmod 755 steamModsDownload.sh
USER steam
