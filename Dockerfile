# Build it from this image if you dont have base image or you want to build everything from scratch
FROM ubuntu:bionic

# Use this during development as it will only install diff. 
#FROM therahulprasad/linkedin-python-data-science:v0.1
# FIXME: By using pyenv where I can specify a version that will be installed
# This is risky, if apt repository does not contain python 2.7 or they have updated python version to 2.7 to 2.7.x they some codes might break
RUN apt-get update && apt-get install -y python python-pip
RUN pip install numpy jupyter pandas Seaborn sklearn nltk gensim
EXPOSE 8888
RUN ls /workdir || mkdir /workdir
CMD ["jupyter", "notebook", "--no-browser", "--allow-root", "--ip=0.0.0.0", "--notebook-dir=/workdir"]
