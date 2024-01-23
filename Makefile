.PHONY: sandbox-build sandbox-run sandbox-write img-build img-run
GPU_OPTION := $(shell lspci | grep -qi nvidia && echo '--nv' || echo '')
COMMON_BINDS := --bind=/etc/hosts --bind=/etc/localtime --bind=/proc --bind=/sys --bind=/dev --bind=scripts:/scripts -B /tmp -B ${XDG_RUNTIME_DIR} --bind=home:${HOME}

sandbox-build:
	@singularity build --fakeroot --sandbox mj_mpc Singularity

sandbox-run:
	@rm -rf workdir/*
	@singularity run --contain $(GPU_OPTION) $(COMMON_BINDS) --workdir=workdir mj_mpc

sandbox-write:
	@singularity shell --fakeroot --writable mj_mpc

img-build:
	@singularity build --fakeroot mj_mpc.simg Singularity

img-run:
	@singularity shell $(GPU_OPTION) -B /tmp -B ${XDG_RUNTIME_DIR} mj_mpc.simg
