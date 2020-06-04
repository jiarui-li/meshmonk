function mex_all(prefix_path)
if nargin<1
    prefix_path='/usr/local';
end
include_path = ['-I',prefix_path,'/include'];
filelist = dir('mex/*.cpp');
for i=1:length(filelist)
    mex(include_path,['mex/',filelist(i).name],'-lmeshmonk');
end