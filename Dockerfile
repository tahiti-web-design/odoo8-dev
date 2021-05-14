FROM tahitiwebdesign/odoo8-base
LABEL maintainer="dev@tahitiwebdesign.com"

VOLUME [ "/mnt/dependencies"]

# Install debuggers for VSCode & PyCharm
RUN pip install debugpy pydevd pyinotify

# Startup
COPY ./entrypoint.sh /

USER odoo
ENTRYPOINT ["/entrypoint.sh"]
CMD ["openerp-server"]
