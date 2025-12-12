D = linspace(0,4,500);
s_e = (1 + D.^2).^(-1/4);
Dcritical = 2*sqrt(2);

figure('Color','w'); hold on; box on;
plot(D, s_e, 'Color', [0.2 0.6 1], 'LineWidth', 2);

ylim([0.45 1.05]);
xlim([0 4]);
xlabel('D', 'FontSize', 22, 'FontWeight', 'bold');
ylabel('Equilibrium speed s_e(D)', 'FontSize', 22, 'FontWeight', 'bold');
%title('Bifurcation Values of D', 'FontSize', 20);

% Phase lines:
Dlines = 0:0.5:4;
for k = 1:length(Dlines)
    Di = Dlines(k);
    s_e_i = (1 + Di.^2)^(-1/4);

    ylo = 0; yhi = 1.5;
    plot([Di Di], [ylo yhi], 'k-', 'LineWidth', 0.8);

    y_samples = linspace(s_e_i-0.25, s_e_i+0.25, 4);
    markerSize = 80;

    for j = 1:length(y_samples)
        yj = y_samples(j);

        if abs(yj - s_e_i) < 1e-3
            continue;
        end

        if yj > s_e_i   
            scatter(Di, yj-0.01, markerSize, 'v', 'MarkerFaceColor', [0.2 0.6 1], 'MarkerEdgeColor','none');
        else
            plot([Di Di], [yj yj], 'k-', 'LineWidth', 0.8);
            scatter(Di, yj++0.01, markerSize, '^', 'MarkerFaceColor', [0.2 0.6 1], 'MarkerEdgeColor','none');
        end
    end
end

plot(0, 1, 'ko', 'MarkerSize', 9, 'LineWidth', 1.5);                
plot(Dcritical, (1+Dcritical^2)^(-1/4), 'ko', 'MarkerSize', 9, 'LineWidth', 1.5);

set(gca,'FontSize', 20);
grid off;

hold off;


