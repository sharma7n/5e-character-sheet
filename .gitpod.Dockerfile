FROM gitpod/workspace-full

USER root

RUN bash install-elm.sh
