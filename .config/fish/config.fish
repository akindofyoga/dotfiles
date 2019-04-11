set -gx PATH /usr/local/cuda-10.0/bin $PATH

# Separating LD_LIBRARY_PATH with spaces causes an error in Tensorflow
# This was the best way I could come up with to set this in a way that would work
set -l old_ld_library_path ""
if set -q LD_LIBRARY_PATH
  set old_ld_library_path ":$LD_LIBRARY_PATH"
end
set -gx LD_LIBRARY_PATH "/usr/local/cuda-10.0/lib64:/usr/local/TensorRT-5.0.2.6/lib$old_ld_library_path"
