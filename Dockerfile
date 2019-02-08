FROM ubuntu:bionic

# FIXME: By using pyenv where I can specify a version that will be installed
# This is risky, if apt repository does not contain python 2.7 or they have updated python version to 2.7 to 2.7.x they some codes might break
RUN apt-get update && apt-get install -y python python-pip
RUN pip install numpy jupyter pandas Seaborn sklearn nltk gensim
EXPOSE 8888
RUN ls /workdir || mkdir /workdir
CMD ["jupyter", "notebook", "--no-browser", "--allow-root", "--ip=0.0.0.0", "--notebook-dir=/workdir"]
