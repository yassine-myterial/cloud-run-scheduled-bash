#!/usr/bin/env bash

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

set -eEuo pipefail

PORT="${PORT:-8080}"
echo "Listening on ${PORT}..."

echo "run command"
gcloud auth activate-service-account myterial-pipeline-user@myterial-dev.iam.gserviceaccount.com --key-file="${KEY_FILE_PATH}"
gcloud run services update myterial-middleware --no-cpu-throttling

nc -lk -p "${PORT}" -e "./date.sh"

# You can parameterize the script you run as a function of the
# service name like this...
# SERVICE="${K_SERVICE:-pageviews}"
# nc -lk -p "${PORT}" -e "./$SERVICE.sh"



