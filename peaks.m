curdir = pwd;
[~,config]=wfdbloadlib;
eval(['cd ' config.WFDB_JAVA_HOME filesep 'example'])
ecgpuwave('101','tested');
[t,signal] = rdsamp('101');
%size(ann)
starts_wave = rdann('101','tested',[],[],[],'(');
%size(ann)
%10
%ends_wave = rdann('101','tested',[],[],[],')');
%20
%p_peak_wave = rdann('101','tested',[],[],[],'p');
%30
%t_peak_wave = rdann('101','tested',[],[],[],'t');