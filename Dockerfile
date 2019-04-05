FROM ubuntu:16.04

WORKDIR /opt

RUN apt-get update && apt-get install -y wget gdal-bin python python-gdal

RUN wget http://step.esa.int/thirdparties/sen2cor/2.5.5/Sen2Cor-02.05.05-Linux64.run \
        -O /tmp/Sen2Cor-02.05.05-Linux64.run

# If you want to make it faster, download the above file locally and uncomment this.
# ADD Sen2Cor-02.05.05-Linux64.run /tmp/

RUN chmod +x /tmp/Sen2Cor-02.05.05-Linux64.run \ 
        && /tmp/Sen2Cor-02.05.05-Linux64.run \
        && rm /tmp/Sen2Cor-02.05.05-Linux64.run

ENV S2L2APPHOME=/opt/Sen2Cor-02.05.05-Linux64 \
    S2L2APPCFG=/root/sen2cor/2.5/cfg
ENV PATH="${S2L2APPHOME}/bin:${PATH}"

# /root/sen2cor/2.5/cfg/L2A_GIPP.xml
CMD L2A_Process --help
