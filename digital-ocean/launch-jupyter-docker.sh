# Ensure on the host user 'jovyan' in group 'users' with uid 1000 exists.
#docker run -d  -v /mnt/jupyter/notebooks:/home/jovyan/work -p 8888:8888 -e NB_UID=1000 jupyter
