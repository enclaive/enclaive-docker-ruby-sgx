FROM enclaive/gramine-os:jammy-7e9d6925
RUN apt update \
    && apt install -y ruby

COPY ./app/ /app/


WORKDIR /manifest

COPY ruby.manifest.template  .

RUN gramine-argv-serializer "/usr/bin/ruby3.0" "/app/Hello.rb" > ruby_args.txt \
    && ./manifest.sh ruby

ENTRYPOINT [ "/entrypoint/enclaive.sh" ]
CMD ["ruby", "/app/Hello.rb"]
