FROM balenalib/amd64-ubuntu:jammy-build AS builder

RUN install_packages subversion

RUN svn checkout --username guest --password guest https://software.rtcm-ntrip.org/svn/trunk

WORKDIR trunk/ntripclient

RUN make

FROM balenalib/amd64-ubuntu:jammy

COPY --from=builder /trunk/ntripclient/ntripclient /ntripclient/ntripclient

COPY startntripclient.sh /ntripclient/startntripclient.sh

WORKDIR /ntripclient

CMD ["./startntripclient.sh"]

