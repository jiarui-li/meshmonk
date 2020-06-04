%Defining compiler flags
c_om = ['-I', '%ProgramFiles%\OpenMesh 6.3\include'];
c_mesh = ['-I', '%USERPROFILE%\Documents\GitHub\meshmonk'];
c_nano = ['-I', '%USERPROFILE%\Documents\GitHub\meshmonk\vendor'];
c_eigen = ['-I', '%USERPROFILE%\Documents\GitHub\eigen-eigen-3.3.4'];
c_math = ['-D', '_USE_MATH_DEFINES'];
c_lib = ['-l', 'meshmonk'];

filelist = dir('mex/*.cpp');
for i=1:length(filelist)
    mex(c_om, c_mesh, c_nano, c_eigen, c_math, c_lib,['mex/',filelist(i).name]);
end