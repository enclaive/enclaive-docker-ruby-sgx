FROM enclaive/gramine-os:jammy-7e9d6925
RUN apt update
RUN apt install -y ruby

COPY ./app/ /app/
COPY ./entrypoint.sh /app/entrypoint.sh
COPY ./ruby.manifest.template  /app/ruby.manifest.template

WORKDIR /app/

RUN mkdir ./secret

RUN gramine-argv-serializer "/usr/bin/ruby3.0" "/app/Hello.rb" > ruby_args.txt

RUN gramine-sgx-gen-private-key \
    && gramine-manifest -Dlog_level=error -Darch_libdir=/lib/x86_64-linux-gnu ruby.manifest.template ruby.manifest \
    && gramine-sgx-sign --manifest ruby.manifest --output ruby.manifest.sgx

ENTRYPOINT [ "/app/entrypoint.sh" ]
