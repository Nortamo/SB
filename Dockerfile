FROM centos:8


RUN yum -y install epel-release &&\
    yum -y install singularity &&\
    yum clean all
RUN mkdir -p /sing_save
COPY cont.def /sing_save/cont.def
RUN echo 10000 > /proc/sys/user/max_user_namespaces
RUN cd /sing_save && singularity build sing_cont.sif cont.def
