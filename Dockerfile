FROM gbrammer/grizli-lambda:0.8.0

### https://github.com/binder-examples/minimal-dockerfile/blob/master/Dockerfile

# create user with a home directory
ARG NB_USER
ARG NB_UID
ENV USER ${NB_USER}
ENV HOME /home/${NB_USER}

# Edited for amazonlinux
RUN adduser \
    --comment "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

RUN echo "source /venv/bin/activate" >> ${HOME}/.bashrc

# RUN source /venv/bin/activate && \
#     pip install --no-cache notebook
    
WORKDIR ${HOME}