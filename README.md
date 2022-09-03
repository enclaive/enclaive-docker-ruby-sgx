# enclaive-docker-ruby-sgx: write secure file demo

In this demo a string is written into a File (HelloAgain.txt) with Ruby (Hello.rb). 

* The Docker-Entrypoint-Script executes first Hello.rb without SGX, 
renames the saved file and executes the Hello.rb again with gramine-sgx. 
The manifest file contains a  hard-coded encryption-key for this demo. 
* All files written to the secure folder path within gramine-sgx are encrypted 
with this key before they are stored. 
* The saved files are accessible outside of the Docker-Image under /tmp/secret. 

## Video-Demo
https://drive.google.com/file/d/1u15C8L1opqCcWVpMNZKvSnuXLjZlkG9T/view?usp=sharing


## RUN DEMO

```
git clone https://github.com/enclaive/enclaive-docker-ruby-sgx.git
cd enclaive-docker-ruby-sgx
git checkout demo
sudo docker compose up --build --force-recreate
```

## RUN DEMO

You can comapre the files:
```
cd /tmp/secret/
ls
cat HelloAgain.txt
cat HelloAgainUnsafe.txt
```

## Cleanup
You can delte thes file with ``sudo rm -f /tmp/secret/`` and remove the Container with ``docker compose down``


