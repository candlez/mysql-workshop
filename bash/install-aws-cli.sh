#!/bin/bash

# Install AWS CLI if not already installed
if ! command -v aws &> /dev/null; then
    echo "AWS CLI not found. Installing..."
    microdnf install -y unzip && microdnf clean all
    curl -s "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip" && \
    unzip -qq /tmp/awscliv2.zip -d /tmp && \
    /tmp/aws/install && \
    rm -rf /tmp/awscliv2.zip /tmp/aws
    if command -v aws &> /dev/null; then
        echo "AWS CLI installed successfully. Version: $(aws --version)"
    else
        echo "Failed to install AWS CLI."
        exit 1
    fi
else
    echo "AWS CLI already installed. Version: $(aws --version)"
fi