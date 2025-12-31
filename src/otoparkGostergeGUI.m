function otoparkGostergeGUI
% MATLAB Otopark Göstergesi GUI
% Giren-çıkan araç sayıları ve doluluk oranını gösterir

    % Otopark bilgileri
    kapasite = 50;        % Maksimum araç kapasitesi
    aracSayisi = 0;      % Anlık araç sayısı
    girenSayisi = 0;     % Toplam giren araç
    cikanSayisi = 0;     % Toplam çıkan araç

    % Ana pencere
    figure('Position',[500 300 360 340], ...
           'MenuBar','none', ...
           'Name','Otopark Göstergesi', ...
           'NumberTitle','off', ...
           'Resize','off');

    % Başlık
    uicontrol('Style','text', ...
              'Position',[50 295 260 30], ...
              'String','OTOPARK DURUMU', ...
              'FontSize',14, ...
              'FontWeight','bold');

    % Anlık araç sayısı
    txtArac = uicontrol('Style','text', ...
                        'Position',[50 255 260 25], ...
                        'FontSize',12);

    % Doluluk oranı
    txtDoluluk = uicontrol('Style','text', ...
                           'Position',[50 225 260 25], ...
                           'FontSize',12);

    % Giren / çıkan göstergeleri
    txtGiren = uicontrol('Style','text', ...
                         'Position',[50 195 260 22], ...
                         'FontSize',11);

    txtCikan = uicontrol('Style','text', ...
                         'Position',[50 170 260 22], ...
                         'FontSize',11);

    % Araç girişi butonu
    uicontrol('Style','pushbutton', ...
              'Position',[50 95 110 45], ...
              'String','Araç Girişi', ...
              'FontSize',10, ...
              'Callback',@aracGiris);

    % Araç çıkışı butonu
    uicontrol('Style','pushbutton', ...
              'Position',[200 95 110 45], ...
              'String','Araç Çıkışı', ...
              'FontSize',10, ...
              'Callback',@aracCikis);

    % İlk güncelleme
    guncelle();

    % ----------- FONKSİYONLAR -----------

    function aracGiris(~,~)
        if aracSayisi < kapasite
            aracSayisi = aracSayisi + 1;
            girenSayisi = girenSayisi + 1;
        else
            warndlg('Otopark DOLU!', 'Uyarı');
        end
        guncelle();
    end

    function aracCikis(~,~)
        if aracSayisi > 0
            aracSayisi = aracSayisi - 1;
            cikanSayisi = cikanSayisi + 1;
        else
            warndlg('Otopark zaten BOŞ!', 'Uyarı');
        end
        guncelle();
    end

    function guncelle()
        set(txtArac,'String', ...
            ['Anlık Araç Sayısı: ' num2str(aracSayisi) ...
             ' / ' num2str(kapasite)]);

        doluluk = (aracSayisi / kapasite) * 100;
        set(txtDoluluk,'String', ...
            ['Doluluk Oranı: %' num2str(doluluk,'%.1f')]);

        set(txtGiren,'String', ...
            ['Toplam Giren Araç: ' num2str(girenSayisi)]);

        set(txtCikan,'String', ...
            ['Toplam Çıkan Araç: ' num2str(cikanSayisi)]);
    end
end
