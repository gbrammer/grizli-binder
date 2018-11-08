FROM gbrammer/grizli-lambda:0.8.0

### https://github.com/binder-examples/minimal-dockerfile/blob/master/Dockerfile

ENV NB_USER jovyan
ENV NB_UID 1000
ENV HOME /home/${NB_USER}

RUN adduser \
    --comment "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

RUN echo "source /venv/bin/activate" >> ${HOME}/.bashrc

RUN source /venv/bin/activate && \
    pip install --no-cache notebook
    
WORKDIR ${HOME}