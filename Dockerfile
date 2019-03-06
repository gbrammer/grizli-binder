FROM gbrammer/grizli-lambda:latest

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

# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}

# Alternative  for source /venv/bin/activate
ENV PATH=/venv/bin:$PATH

USER root
RUN pip install --upgrade pip && \
    pip install --upgrade setuptools && \
    pip install --no-cache notebook
    
USER ${NB_USER}
WORKDIR ${HOME}