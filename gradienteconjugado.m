% Datos del problema
A = [6, 1; 1, 4];
b = [3; 5];

% Inicialización
x = zeros(size(b));  % x_0 = [0; 0]
r = b - A * x;
p = r;
rsold = r' * r;

% Para almacenar los valores de x en cada iteración
x_values = x';

% Iteraciones
disp('Iteración | x1        | x2        | Residuo')
disp('--------------------------------------------')
for i = 1:length(b)
    Ap = A * p;
    alpha = rsold / (p' * Ap);
    x = x + alpha * p;
    r = r - alpha * Ap;
    rsnew = r' * r;
    
    % Guardar los valores de x en cada iteración
    x_values = [x_values; x'];
    
    % Mostrar los resultados de la iteración actual
    fprintf('%8d | %10.6f | %10.6f | %10.6f\n', i, x(1), x(2), sqrt(rsnew));
    
    if sqrt(rsnew) < 1e-10
        break;
    end
    p = r + (rsnew / rsold) * p;
    rsold = rsnew;
end

% Mostrar el resultado final
disp('--------------------------------------------')
disp('La solución final es:')
disp(x)

% Graficar los valores de x1 y x2 en cada iteración
figure;

subplot(2,1,1);
plot(0:size(x_values, 1)-1, x_values(:, 1), '-o', 'DisplayName', 'x1');
hold on;
plot(0:size(x_values, 1)-1, x_values(:, 2), '-x', 'DisplayName', 'x2');
xlabel('Iteración');
ylabel('Valores de x');
title('Convergencia de las soluciones x1 y x2');
legend show;
grid on;

% Graficar la convergencia del residuo
subplot(2,1,2);
plot(0:size(x_values, 1)-1, sqrt(rsold), '-o', 'DisplayName', 'Residual');
xlabel('Iteración');
ylabel('Residual');
title('Convergencia del Residual');
legend show;
grid on;





