[y,fs]=wavread('peter.wav');    %按照wavread的指令將聲波檔中的y以及取樣率取出
y_up=upsample(y,3);             %將y upsample 3 times
y_down=downsample(y,2);         %將y downsample 2 times

%畫出原始y圖
subplot(3,1,1);plot(abs(fft(y)));title('originaly');xlabel('frequency(HZ)');ylabel('Magnitude');

%畫出 經過upsample 的y圖
subplot(3,1,2);plot(abs(fft(y_up)));title('upsample(y)');xlabel('frequency(HZ)');ylabel('Magnitude');

%畫出 經過 downsample 的 y圖
subplot(3,1,3);plot(abs(fft(y_down)));title('downsample(y)');xlabel('frequency(HZ)');ylabel('Magnitude'); 

%%%%%%%%%%%%%%%%%%%%%%%以下為soundsc指令
%%%%%%%%%%%%%%%%%%%%%%%必須附上你的comparison 
soundsc(y,fs)
%原始音樂

soundsc(y_up,fs)
%upsample 3後，原time sequence 插入多餘的0點（time sequence 變為原來的三倍長）
%而fs（播放速度）一樣，所以撥放時間較長，且因為插入0點，所以聲音沒有原聲音精細
%（因插入多餘點，有雜音)，聽起來聲音較原來低的感覺

soundsc(y_up,fs*3)
%upsample 3後，原time sequence 插入多餘的0點（time sequence 變為原來的三倍長）
%而fs*3（播放速度）變為三倍，所以撥放時間長短與原聲音相同，
%但因為upsample插入多餘的0點（給予非必要的點），所以比起原音，聽起來有雜音的感覺

soundsc(y_down,fs)
%downsample 2後，原time sequence變短（資訊量被減少（compress）），
%而fs（播放速度）一樣，所以撥放時間較短，且因為刪除部份的點，
%聲音沒有原聲音精細（細節部分被刪去）聽起來聲音較原來高的感覺

soundsc(y_down,fs/2)
%downsample 2後，原time sequence 變短（資訊量被減少（compress））
%而fs/2（播放速度）放慢兩倍，所以撥放時間長短與原聲音相同，但因為downsample刪除部份的點
%所以聲音沒有原聲音精細，聽起來無法聽到原聲音的細節，聽起來有糊糊（聲音細節度不高）的感覺

soundsc(resample(y,3,1),fs*3)
%利用resample 做upsample 3後，time sequence變為原來的三倍長，
%且因為resample有內建filter，所以使加入點後的time sequence有做smoothing
%（新加入的點不是0點，而是內插所求得的點）而fs*3（播放速度）變為原來的三倍，
%因此撥放時間長短與原聲音相同，音樂細節部分被內插法所模擬，整體聽起來會接近原聲音，
%如果仔細聽小提琴部分，會發現小提琴的聲音更細緻。