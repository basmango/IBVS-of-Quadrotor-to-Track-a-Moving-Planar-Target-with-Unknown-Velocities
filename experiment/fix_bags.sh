# spawn osrf/ros-noetic-desktop-full docker container and fix the bags in the /home/bassam/projects/IBVS/experiment/rosbags directory

cmd='for file in /rosbags/*.bag.active; do
    rosbag reindex "$file"
    rosbag fix "$file" "${file%.active}"
    rm "${file%.active}.orig.active"
    rm "${file%.active}.orig"
    rm "$file"
    done'




# spawn docker container
docker run --rm --name ros-noetic-desktop-full -v /home/bassam/projects/IBVS/experiment/rosbags:/rosbags osrf/ros:noetic-desktop-full bash -c "$cmd"

# for all files ending in .bag.active, run rosbag reindex and rosbag fix on them, remove all intermediate files and original .active file
