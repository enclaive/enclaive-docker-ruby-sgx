# Ruby-SGX Demonstration: Write a file into shared protected Volume

In this demo the string `Hello SGX World from Ruby` is written into the file `HelloAgain.txt`. The application is in folder `/app/Hello.rb`. 

* The Docker entrypoint executes first `Hello.rb` with ruby and renames the file to `HelloAgainUnsafe.txt`. 
* Next it executes  `Hello.rb` again, this time with ruby-sgx. 
* Both files are written to the shared folder `/tmp/secret`.
* We observe that in the shared folder
  * file `HelloAgainUnsafe.txt` is in plaintext, while
  * file `HelloAgain.txt` is encrypted


## Building
```
docker compose up --build --force-recreate
```

## Running
Compare the files:
```
cd /tmp/secret/
ls
cat HelloAgain.txt
cat HelloAgainUnsafe.txt
```

## Cleanup
You can delte thes file with ``sudo rm -f /tmp/secret/`` and remove the Container with ``docker compose down``


