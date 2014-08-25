#!/usr/bin/bash

# Configure or Store the linux.dot.files repository.
echo "Configuring linux.dot.files... started"
for repo in "linux.dot.files"
    do
        ls -a "./repos/${repo}" | grep -E "^\.[a-zA-Z]" >| /tmp/temp

        for each_dot_file in `cat /tmp/temp`; do rm -rf "~/${each_dot_file}"; done

        for each_dot_file in `cat /tmp/temp`; do cp -rf "./repos/${repo}/${each_dot_file}" ~/; done
    done
echo "Configuring linux.dot.files... completed"

# Install all the Debian packages.
dpkg -i ./packages/*.deb
