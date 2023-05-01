
cmd='for file in /rosbags/*.bag.active; do
    rosbag reindex "$file"
    rosbag fix "$file" "${file%.active}"
    rm "${file%.active}.orig.active"
    rm "${file%.active}.orig"
    rm "$file"
    done'




docker run --rm --name ros-noetic-desktop-full -v /home/bassam/projects/IBVS/experiment/rosbags:/rosbags osrf/ros:noetic-desktop-full bash -c "$cmd"

