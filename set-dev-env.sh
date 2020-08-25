
# Specify path to local Hop installation
export HOP_BINARY_PATH=/Users/diethardsteiner/apps/hop
# Specify path to local Hop configuration
#  It is advisable not to keep this within the Hop installation directory (default location)
export HOP_CONFIG_DIRECTORY=~/config/hop

# Create Hop project
${HOP_BINARY_PATH}/hop-conf.sh \
--project=hop-beam-examples \
--project-create \
--project-home="/Users/diethardsteiner/git/hop-beam-examples/project" \
--project-config-file=project-config.json \
--project-metadata-base='${PROJECT_HOME}/metadata' \
--project-datasets-base='${PROJECT_HOME}/datasets' \
--project-unit-tests-base='${PROJECT_HOME}' \
--project-variables=VAR_PROJECT_TEST1=a,VAR_PROJECT_TEST2=b \
--project-enforce-execution=true

# Create Hop environment
${HOP_BINARY_PATH}/hop-conf.sh \
--environment=hop-beam-examples-dev \
--environment-create \
--environment-project=hop-beam-examples \
--environment-purpose=development \
--environment-config-files="/Users/diethardsteiner/git/hop-beam-examples/config/hop-beam-examples-dev.json"

# Set variables for the env config
${HOP_BINARY_PATH}/hop-conf.sh \
--config-file="/Users/diethardsteiner/git/hop-beam-examples/config/hop-beam-examples-dev.json" \
--config-file-set-variables=VAR_GCP_DATAFLOW_PROJECT=kettle-beam-224314,VAR_GCP_DATAFLOW_APP_NAME=BeamExamples,VAR_GCP_DATAFLOW_STAGING_LOCATION=gs://hop-beam-storage/binaries,VAR_GCP_DATAFLOW_INITIAL_NUMBER_OF_WORKERS=1,VAR_GCP_DATAFLOW_MAX_NUMBER_OF_WORKERS=2,VAR_GCP_DATAFLOW_WORKER_MACHINE_TYPE=e2-standard-2,VAR_GCP_DATAFLOW_REGION=europe-west2,VAR_GCP_DATAFLOW_USER_AGENT=Hop,VAR_GCP_DATAFLOW_TEMP_LOCATION=gs://hop-beam-storage/tmp,VAR_GCP_DATAFLOW_FAT_JAR_FILE_LOCATION=/tmp/fat.jar 
    

VAR_GCP_DATAFLOW_PROJECT=kettle-beam-224314 \
, VAR_GCP_DATAFLOW_APP_NAME=BeamExamples \
, VAR_GCP_DATAFLOW_STAGING_LOCATION=gs://hop-beam-storage/binaries \
, VAR_GCP_DATAFLOW_INITIAL_NUMBER_OF_WORKERS=1 \
, VAR_GCP_DATAFLOW_MAX_NUMBER_OF_WORKERS=2 \
, VAR_GCP_DATAFLOW_WORKER_MACHINE_TYPE=e2-standard-2 \
, VAR_GCP_DATAFLOW_REGION=europe-west2 \
, VAR_GCP_DATAFLOW_USER_AGENT=Hop \
, VAR_GCP_DATAFLOW_TEMP_LOCATION=gs://hop-beam-storage/tmp \
, VAR_GCP_DATAFLOW_FAT_JAR_FILE_LOCATION=/tmp/fat.jar 