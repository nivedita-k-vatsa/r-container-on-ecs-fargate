# Base image from https://hub.docker.com/u/rocker/
FROM rocker/r-ubuntu:latest

# create directories within container
RUN mkdir -p /r-ubuntu
RUN mkdir -p /r-ubuntu/r_scripts
RUN mkdir -p /r-ubuntu/output

# set working directory
WORKDIR /r-ubuntu

# arguments
ARG SCRIPT

# copy from S3
RUN apt-get update
RUN apt-get install -y awscli
RUN aws s3 cp s3://rp-intern-2022/test_sync/input.txt ./
RUN aws s3 cp s3://rp-intern-2022/test_sync/r_scripts/requirements.R ./r_scripts/

# install R-packages
RUN Rscript ./r_scripts/requirements.R

# run user script & copy results back to S3 bucket
CMD aws s3 cp s3://rp-intern-2022/test_sync/r_scripts/${SCRIPT} ./r_scripts/ && \
    Rscript ./r_scripts/${SCRIPT} && \
    aws s3 cp ./output/ s3://rp-intern-2022/test_sync/output/ --recursive