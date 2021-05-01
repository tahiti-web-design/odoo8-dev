FROM tahitiwebdesign/odoo8-base
LABEL maintainer="dev@tahitiwebdesign.com"

# Install debuggers for VSCode & PyCharm
RUN pip install debugpy pydevd

# Startup
COPY ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
CMD ["openerp-server"]
