FROM enclaive/gramine-os:jammy-7e9d6925
RUN apt update \
    && apt install -y ruby

COPY ./app/ /app/


WORKDIR /manifest

COPY ./ruby.manifest.template  /app/ruby.manifest.template

RUN gramine-argv-serializer "/usr/bin/ruby3.0" "/app/Hello.rb" > ruby_args.txt \
    && ./manifest ruby

ENTRYPOINT [ "/entrypoint/entrypoint.sh" ]
CMD ["ruby"]
