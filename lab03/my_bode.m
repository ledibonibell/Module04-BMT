function my_bode(sys)
    % Генерируем частоты для анализа
    w = logspace(-2, 3, 1000);
    
    % Получаем величины ЛАЧХ и ЛФЧХ
    [mag, phase, wout] = bode(sys, w);
    
    % Преобразуем величину ЛАЧХ в децибелы
    mag_db = 20 * log10(squeeze(mag));
    
    % --- ЛАЧХ ---
    subplot(2, 1, 1);
    semilogx(w, mag_db);
    title('ЛАЧХ (диаграмма Боде: амплитуда)');
    xlabel('Частота (рад/с)');
    ylabel('Амплитуда (дБ)');
    axis([10^-2, 10^3, -100, 20]);
    yline(0, 'Color', 'g', 'LineStyle', '--', 'LineWidth', 2);  % Линия на 0 дБ
    grid on
    
    % Ищем частоты пересечения 0 дБ
    zero_dB_crossings = find(mag_db > -1 & mag_db < 1);
    if ~isempty(zero_dB_crossings)
        cross_freq = w(zero_dB_crossings(1));
        xline(cross_freq, 'Color', 'r', 'LineStyle', '--', 'LineWidth', 2); % Вертикальная линия
    end
    
    % --- ЛФЧХ ---
    subplot(2, 1, 2);
    semilogx(w, squeeze(phase));
    title('ЛФЧХ (диаграмма Боде: фаза)');
    xlabel('Частота (рад/с)');
    ylabel('Фаза (градусы)');
    axis([10^-2, 10^3, -180, 0]);
    yline(-180, 'Color', 'g', 'LineStyle', '--', 'LineWidth', 2); % Линия на -180 градусов
    grid on
    
    % Ищем частоты пересечения -180 градусов
    minus180_crossings = find(phase > -181 & phase < -179);
    if ~isempty(minus180_crossings)
        cross_freq = w(minus180_crossings(1));
        xline(cross_freq, 'Color', 'r', 'LineStyle', '--', 'LineWidth', 2); % Вертикальная линия
    end
end
