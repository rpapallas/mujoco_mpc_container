Simple Singularity/Apptainer recipe to build a container to run [mujoco_mpc](https://github.com/google-deepmind/mujoco_mpc).

* Make sure you have [Singularity/Apptainer](https://apptainer.org/) installed.
* Build the container:
    * if you want a mutable sandbox: `make sandbox-build`.
    * if you want an immutable image: `make img-build`.
* Simply now run:
    * for sandbox: `make sandbox-run`.
    * for image: `make img-run`.

