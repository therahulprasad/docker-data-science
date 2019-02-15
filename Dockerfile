# Build it from this image if you dont have base image or you want to build everything from scratch
FROM ubuntu:bionic
#FROM therahulprasad/data-science:conda
# Use this during development as it will only install diff. 
#FROM therahulprasad/linkedin-python-data-science:v0.1
# FIXME: By using pyenv where I can specify a version that will be installed
# This is risky, if apt repository does not contain python 2.7 or they have updated python version to 2.7 to 2.7.x they some codes might break
#RUN apt-get update && apt-get install -y python python-pip
#RUN pip install numpy jupyter pandas Seaborn sklearn nltk gensim
#EXPOSE 8888
RUN apt update && apt install -y curl
RUN ls /installer || mkdir /installer
RUN conda -V || curl https://repo.anaconda.com/archive/Anaconda2-2018.12-Linux-x86_64.sh -o /installer/anaconda3.sh
RUN conda -V || bash /installer/anaconda3.sh -b -p /anaconda3
RUN (ls /installer/anaconda3.sh && rm /installer/anaconda3.sh); exit 0;
ENV PATH /anaconda3/bin:$PATH

RUN conda install --yes keras opencv
RUN pip install imutils

RUN ls /workdir || mkdir /workdir
CMD ["jupyter", "notebook", "--no-browser", "--allow-root", "--ip=0.0.0.0", "--notebook-dir=/workdir"]
