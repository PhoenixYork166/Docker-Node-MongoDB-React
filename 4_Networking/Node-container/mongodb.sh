#!/bin/bash
until nc -z my-mongo 27017
do
    echo "Waiting for MongoDB...";
    sleep 1;
done

echo "MongoDB started!";