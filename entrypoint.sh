#!/bin/sh
echo "List all in Container:"
ls
echo "\nwrite to file without Gramine-SGX in Docker:"
ruby Hello.rb

echo "Secret files:"
ls secret

echo "\nContent of the written file:"
cat secret/HelloAgain.txt

echo "\n###################################################################################"
echo "I will rename the file to HelloAgainUnsafe.txt and do the same with gramine-sgx..."
echo "###################################################################################"

mv secret/HelloAgain.txt secret/HelloAgainUnsafe.txt

gramine-sgx-get-token --output ruby.token --sig ruby.sig
gramine-sgx ruby

echo "Secret files:"
ls secret

echo "Content of the written file:"
cat secret/HelloAgain.txt
echo "\n\n The Content is encrypted! :-)"
echo "You can compare the files in /tmp/secret on your Docker-Host."