# hop-beam-examples

## Setup of Dev Environment

The repo comes with a **utility** script to help prepare your environment: `set-dev-env.sh`. Before running edit it to reflect the correct path to the **Hop** install directory and **Hop** config directory.


## Running the Processes

**Local Beam Runner**:

```bash
export HOP_BINARY_PATH=/Users/diethardsteiner/apps/hop
${HOP_BINARY_PATH}/hop-run.sh \
--file=pipelines-and-workflows/transform-event-data-to-json.hpl \
--project=hop-beam-examples \
--environment=hop-beam-examples-dev \
--runconfig=beam-direct \
--level=Basic \
--parameters=PARAM_INPUT_DATASET_FIELD_ENCLOSURE=,PARAM_INPUT_DATASET_FIELD_SEPARATOR=",",PARAM_INPUT_DATASET_FILE_PATH=${PROJECT_HOME}/datasets/event-data.csv,PARAM_OUTPUT_DATASET_FIELD_ENCLOSURE=,PARAM_OUTPUT_DATASET_FIELD_SEPARATOR=,PARAM_OUTPUT_DATASET_FILE_PATH=/tmp/events,PARAM_OUTPUT_DATASET_FILE_PREFIX=events,PARAM_OUTPUT_DATASET_SUFFIX=.csv \
2>&1 | tee /tmp/transform-event-data-to-json.hpl.err.log
```

**GCP Dataflow**:

Many settings (e.g. location of **fat jar file**) are defined in the environment settings (see `set-dev-env.sh`).

```bash
export HOP_BINARY_PATH=/Users/diethardsteiner/apps/hop
${HOP_BINARY_PATH}/hop-run.sh \
--file=pipelines-and-workflows/transform-event-data-to-json.hpl \
--project=hop-beam-examples \
--environment=hop-beam-examples-dev \
--runconfig=beam-dataflow \
--level=Basic \
--parameters=PARAM_INPUT_DATASET_FIELD_ENCLOSURE=,PARAM_INPUT_DATASET_FIELD_SEPARATOR=",",PARAM_INPUT_DATASET_FILE_PATH=gs://hop-beam-storage/input/event-data.csv,PARAM_OUTPUT_DATASET_FIELD_ENCLOSURE=,PARAM_OUTPUT_DATASET_FIELD_SEPARATOR=,PARAM_OUTPUT_DATASET_FILE_PATH=gs://hop-beam-storage/output,PARAM_OUTPUT_DATASET_FILE_PREFIX=events,PARAM_OUTPUT_DATASET_SUFFIX=.csv \
2>&1 | tee /tmp/transform-event-data-to-json.hpl.err.log
```