FROM tahitiwebdesign/odoo8-base:latest
LABEL maintainer="dev@tahitiwebdesign.com"

VOLUME [ "/mnt/dependencies"]

# Install debuggers for VSCode & PyCharm
RUN pip install debugpy pydevd pyinotify

# Install poetry
ENV POETRY_VERSION=1.1.7
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python - && \
    echo ". $HOME/.poetry/env" >> $HOME/.bashrc
RUN	source $HOME/.poetry/env && \
	poetry config virtualenvs.create true && \
    poetry config virtualenvs.in-project true
    
# Startup
COPY ./entrypoint.sh /

USER odoo
ENTRYPOINT ["/entrypoint.sh"]
CMD ["openerp-server"]
