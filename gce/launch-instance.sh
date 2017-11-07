# gcloud compute machine-types list
# gcloud compute images list
# to find --image-project, see https://cloud.google.com/compute/docs/images#os-compute-support
gcloud compute instances create <instance-name> --boot-disk-size=10GB --disk=name=<pd-name> --machine-type n1-standard-2 --image coreos-stable-1520-8-0-v20171026 --image-project coreos-cloud --zone us-west1-a
