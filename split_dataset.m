% split_dataset
function split_dataset(in_folder,ratio,im_size)
% in_folder='C:\dev\dataset\kitti\sequences\00'
ds=imageDatastore(in_folder,'IncludeSubfolders',true,'LabelSource','foldernames');

[tr,tst]=splitEachLabel(ds,ratio);

open_save(tr,'.','train',im_size)
open_save(tst,'.','test',im_size)


end
function open_save(ds,out_folder,ds_name,im_size)
out_folder=fullfile(out_folder,ds_name);
if ~exist(out_folder,'dir')
    mkdir(fullfile(out_folder));
    
end

for ii=1:size(ds.Files,1)
    try
        [img,info]=readimage(ds,ii);
        class_folder=fullfile(out_folder,char(info.Label));
        if ~exist(class_folder,'dir')
            mkdir(class_folder);
        end
        img=imresize(img,im_size,'bilinear');
        imwrite(img,fullfile(class_folder,strcat(int2str(ii),'.png')),'png')
        
    catch
        continue
    end
end
end