# Quadrotor Image-Based Visual Servoing (IBVS) for Moving Target Tracking

This repository contains the code and resources for a project that focuses on using a quadrotor (drone) equipped with a pan-tilt camera to track a moving planar target with unknown velocities. The goal is to implement an Image-Based Visual Servoing (IBVS) scheme for precise target tracking in an outdoor experimental setting.

## Experimental Setup

<img src="https://github.com/basmango/IBVS-of-Quadrotor-to-Track-a-Moving-Planar-Target-with-Unknown-Velocities/assets/29100891/1304456c-e512-4311-a996-e85742e02868" alt="Figure 1" width="500">

The project utilized a 3DR Solo drone with a pan-tilt camera, along with a ground rover equipped with an ArUco marker. The experimental setup is depicted in the figure. The drone's Wi-Fi network was utilized to establish a Mavlink interface, enabling access to essential drone information and the transmission of velocity set-points via a mavros node. Additionally, the camera feed was accessed through the drone's Wi-Fi network.

The ground rover, with its ArUco marker, served as the target for the quadrotor's tracking. The rover's motion was controlled by mimicking forward and yaw channel transmission commands of a transmitter, resulting in a circular motion with unknown velocities.

## Repository Contents

This repository is organized into the following directories:

- **Part 0 (p0):** compose script to start mavproxy, for connecting the ground rover to QGroundControl (QGC) and MavROS.

- **Part 1 (p1):** Compose script to start all the MavROS nodes, an ArUco image detector node, and a vision node. The vision node establishes a connection with the 3DR Solo GoPro camera and publishes the camera feed to a ROS topic.

- **Part 2 (p2):** Compose script to initiate the movement of the ground rover and activate the quadrotor's IBVS functionality.

## Usage

To reproduce the experiment, follow these steps:

1. Build all docker images in the images directory.

2. Power on rover and 3DR solo quadcopter, connect to rover via telemetry and to solo via it's Wi-Fi network.

3. Execute the compose script in the `p0` directory to start mavproxy.

4. Execute the compose script in the `p1` directory to start the necessary nodes for MavROS, ArUco marker detection, and vision.

5. Launch the compose script in the `p2` directory to initiate the movement of the ground rover and activate the IBVS functionality of the quadrotor.

6. Observe the feature tracking error and target inertial velocity estimates, which are represented in Figures 5a and 5b in the accompanying paper

## Experimental Results

The experimental results demonstrate the effectiveness of the proposed IBVS scheme for moving target tracking using a quadrotor in an outdoor environment. The convergence of the feature tracking error around the origin indicates the robustness of the system.

### Experiment Video
[![Real-life implementation](https://img.youtube.com/vi/XV5u25d22bo/0.jpg)](https://youtu.be/XV5u25d22bo)


### Experiment results
You can see:

(A) Feature tracking error convergence

(B) Rover velocity estimates as expected when performing circular motion (sinusoidal)

<img src="https://github.com/basmango/IBVS-of-Quadrotor-to-Track-a-Moving-Planar-Target-with-Unknown-Velocities/assets/29100891/2deccc53-5d10-4a51-a559-03312ef81812" alt="Feature_Error_Exp" width="400">
<img src="https://github.com/basmango/IBVS-of-Quadrotor-to-Track-a-Moving-Planar-Target-with-Unknown-Velocities/assets/29100891/95d17f45-86b5-4f2f-a2b3-fb1607e003ab" alt="Vel_Est_Exp" width="415">


