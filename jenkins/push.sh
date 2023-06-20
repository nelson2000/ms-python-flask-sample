#!/bin/bash
docker tag pythonapp:1.0 nwajienelson/pythonapp:${env.BUILD_ID}
docker push nwajienelson/pythonapp:${env.BUILD_ID}