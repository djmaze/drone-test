FROM ubuntu AS builder

RUN case "$(uname -m)" in \
  x86_64 ) \
    echo amd64 >/tmp/ARCH \
    ;; \
  armv7l) \
    echo arm >/tmp/ARCH \
    ;; \
  aarch64) \
    echo arm64 >/tmp/ARCH \
    ;; \
  esac

RUN echo ARCH: $(cat /tmp/ARCH)

RUN echo foo >/bar


FROM alpine

COPY --from=builder /bar /

RUN cat /bar

RUN echo Messing this up again
