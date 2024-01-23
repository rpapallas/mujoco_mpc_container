#!/bin/bash
source $HOME/.bashrc

if [ ! -d "$HOME/mujoco_mpc" ]; then
    cd $HOME
    git clone https://github.com/google-deepmind/mujoco_mpc.git
fi

if [ ! -d "$HOME/mujoco_mpc/build" ]; then
    cd ~/mujoco_mpc
    mkdir build && cd build
    cmake .. -DCMAKE_BUILD_TYPE:STRING=Release -G Ninja -DCMAKE_C_COMPILER:STRING=clang-12 -DCMAKE_CXX_COMPILER:STRING=clang++-12 -DMJPC_BUILD_GRPC_SERVICE:BOOL=ON
    cmake --build . --target mjpc agent_test cost_derivatives_test norm_test rollout_test threadpool_test trajectory_test utilities_test direct_force_test direct_optimize_test direct_parameter_test direct_sensor_test direct_trajectory_test direct_utilities_test batch_filter_test batch_prior_test kalman_test unscented_test agent_server direct_server filter_server
fi

./mujoco_mpc/build/bin/mjpc

