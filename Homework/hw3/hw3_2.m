[y,fs]=wavread('peter.wav');    %����wavread�����O�N�n�i�ɤ���y�H�Ψ��˲v���X
y_up=upsample(y,3);             %�Ny upsample 3 times
y_down=downsample(y,2);         %�Ny downsample 2 times

%�e�X��ly��
subplot(3,1,1);plot(abs(fft(y)));title('originaly');xlabel('frequency(HZ)');ylabel('Magnitude');

%�e�X �g�Lupsample ��y��
subplot(3,1,2);plot(abs(fft(y_up)));title('upsample(y)');xlabel('frequency(HZ)');ylabel('Magnitude');

%�e�X �g�L downsample �� y��
subplot(3,1,3);plot(abs(fft(y_down)));title('downsample(y)');xlabel('frequency(HZ)');ylabel('Magnitude'); 

%%%%%%%%%%%%%%%%%%%%%%%�H�U��soundsc���O
%%%%%%%%%%%%%%%%%%%%%%%�������W�A��comparison 
soundsc(y,fs)
%��l����

soundsc(y_up,fs)
%upsample 3��A��time sequence ���J�h�l��0�I�]time sequence �ܬ���Ӫ��T�����^
%��fs�]����t�ס^�@�ˡA�ҥH����ɶ������A�B�]�����J0�I�A�ҥH�n���S�����n�����
%�]�]���J�h�l�I�A������)�Ať�_���n������ӧC���Pı

soundsc(y_up,fs*3)
%upsample 3��A��time sequence ���J�h�l��0�I�]time sequence �ܬ���Ӫ��T�����^
%��fs*3�]����t�ס^�ܬ��T���A�ҥH����ɶ����u�P���n���ۦP�A
%���]��upsample���J�h�l��0�I�]�����D���n���I�^�A�ҥH��_�쭵�Ať�_�Ӧ��������Pı

soundsc(y_down,fs)
%downsample 2��A��time sequence�ܵu�]��T�q�Q��֡]compress�^�^�A
%��fs�]����t�ס^�@�ˡA�ҥH����ɶ����u�A�B�]���R���������I�A
%�n���S�����n����ӡ]�Ӹ`�����Q�R�h�^ť�_���n������Ӱ����Pı

soundsc(y_down,fs/2)
%downsample 2��A��time sequence �ܵu�]��T�q�Q��֡]compress�^�^
%��fs/2�]����t�ס^��C�⭿�A�ҥH����ɶ����u�P���n���ۦP�A���]��downsample�R���������I
%�ҥH�n���S�����n����ӡAť�_�ӵL�kť����n�����Ӹ`�Ať�_�Ӧ��k�k�]�n���Ӹ`�פ����^���Pı

soundsc(resample(y,3,1),fs*3)
%�Q��resample ��upsample 3��Atime sequence�ܬ���Ӫ��T�����A
%�B�]��resample������filter�A�ҥH�ϥ[�J�I�᪺time sequence����smoothing
%�]�s�[�J���I���O0�I�A�ӬO�����ҨD�o���I�^��fs*3�]����t�ס^�ܬ���Ӫ��T���A
%�]������ɶ����u�P���n���ۦP�A���ֲӸ`�����Q�����k�Ҽ����A����ť�_�ӷ|������n���A
%�p�G�J��ť�p���^�����A�|�o�{�p���^���n����ӽo�C