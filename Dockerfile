FROM debian:wheezy
MAINTAINER feit

# setup environment
ENV METEORD_DIR /opt/meteord
COPY scripts $METEORD_DIR
RUN bash $METEORD_DIR/init.sh

# build app
ENV APP_SRC_DIR /app_src
ENV APP_DIR /app
ONBUILD COPY ./ $APP_SRC_DIR
ONBUILD RUN bash $METEORD_DIR/build_app.sh

# run app
EXPOSE 80
ENTRYPOINT bash $METEORD_DIR/run_app.sh
