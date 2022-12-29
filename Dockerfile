# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Use the official lightweight Node.js image.
# https://hub.docker.com/_/node
FROM node:18-slim

# Downloading gcloud package
RUN curl https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-409.0.0-linux-x86_64.tar.gz > /tmp/google-cloud-cli.tar.gz

# Installing the gcloud cli
RUN mkdir -p /usr/local/gcloud \
  && tar -xf /tmp/google-cloud-cli.tar.gz \
  && ./google-cloud-sdk/install.sh --quiet
  
FROM bash
COPY main.sh .
COPY date.sh .
ENTRYPOINT ["./main.sh"]
