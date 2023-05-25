# Quadrotor Image-Based Visual Servoing (IBVS) for Moving Target Tracking

This repository contains the code and resources for a project that focuses on using a quadrotor (drone) equipped with a pan-tilt camera to track a moving planar target with unknown velocities. The goal is to implement an Image-Based Visual Servoing (IBVS) scheme for precise target tracking in an outdoor experimental setting.

## Experimental Setup

The project utilized a 3DR Solo drone with a pan-tilt camera, along with a ground rover equipped with an ArUco marker. The experimental setup is depicted in Figure 1 [INSERT FIGURE 1 HERE]. The drone's Wi-Fi network was utilized to establish a Mavlink interface, enabling access to essential drone information and the transmission of velocity set-points via a mavros node. Additionally, the camera feed was accessed through the drone's Wi-Fi network.

The ground rover, with its ArUco marker, served as the target for the quadrotor's tracking. The rover's motion was controlled by mimicking forward and yaw channel transmission commands of a transmitter, resulting in a circular motion with unknown velocities.

## Repository Contents

This repository is organized into the following directories:

- **Part 0 (p0):** compose script to start mavproxy, for connecting the ground rover to QGroundControl (QGC) and MavROS.

- **Part 1 (p1):** Compose script to start all the MavROS nodes, an ArUco image detector node, and a vision node. The vision node establishes a connection with the 3DR Solo GoPro camera and publishes the camera feed to a ROS topic.

- **Part 2 (p2):** Compose script to initiate the movement of the ground rover and activate the quadrotor's IBVS functionality.

## Usage

To reproduce the experiment, follow these steps:

1. Set up the Mavlink interface between the drone and the ground control station using the drone's Wi-Fi network.

2. Execute the compose script in the `p1` directory to start the necessary nodes for MavROS, ArUco marker detection, and vision.

3. Launch the compose script in the `p2` directory to initiate the movement of the ground rover and activate the IBVS functionality of the quadrotor.

4. Observe the feature tracking error and target inertial velocity estimates, which are represented in Figures 5a and 5b in the accompanying paper [REFERENCE PAPER HERE].

## Experimental Results

The experimental results demonstrate the effectiveness of the proposed IBVS scheme for moving target tracking using a quadrotor in an outdoor environment. The convergence of the feature tracking error around the origin indicates the robustness of the system. For a detailed analysis and visual representation of the results, refer to the accompanying paper [REFERENCE PAPER HERE].


