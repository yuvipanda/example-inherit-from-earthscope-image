# Inherit from an earthscope maintained image
FROM public.ecr.aws/earthscope-dev/geolab_default:extensions-c1c714c1

COPY environment.yml /tmp/environment.yml

RUN mamba env update --prefix ${CONDA_DIR} --file /tmp/environment.yml

COPY image-tests image-tests
RUN ls
