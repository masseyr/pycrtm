FROM ubuntu:22.04
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install build-essential git wget tar openssh-server -y
RUN apt-get install python3 python3-pip -y
RUN apt-get install netcdf-bin libnetcdff-dev -y
RUN apt-get install gfortran cmake ecbuild -y
RUN pip install netcdf4 h5py numpy matplotlib scikit-build
RUN git clone https://github.com/masseyr/crtm-bundle.git crtm
WORKDIR crtm
RUN ls -la
RUN sh kickstart_pyCRTM_2.sh
EXPOSE 22
CMD ["service", "ssh", "start", "-D"]
