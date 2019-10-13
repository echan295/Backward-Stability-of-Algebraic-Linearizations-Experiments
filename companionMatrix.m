function [C0, C1, X, Y] = companionMatrix(varargin)
    % A is a cell, in the order of least to greatest order
%     A = varargin{1};
%     N = length(A);
%     [n, m] = size(A{1});
%     if n ~= m
%         error("The dimensions are unequal");
%     end
    if nargin == 1
        A = varargin{1};
        N = length(A);
        [n, m] = size(A{1});
        if n ~= m
            error("The dimensions are unequal");
        end
        L = ones(1, n*N-2*n);
        C0 = diag(L, -n);
        for i = 1:N-1
            C0(1:n, n*(N-i+1)-2*n+1:n*(N-i+2)-2*n) = -A{i};
        end
        C1 = eye(n*N-n);
        C1(1:n, 1:n) = A{N};
        X = zeros(n, N*n-n);
        X(:, n*N-2*n+1:end) = eye(n);
        Y = zeros(N*n-n, n);
        Y(1:n, 1:n) = eye(n);
    elseif nargin == 3
%         disp(varargin{3})
        if varargin{3} == 'Bernstein'
            A = varargin{1};
            N = length(A);
            [n, m] = size(A{1});
            if n ~= m
                error("The dimensions are unequal");
            end
            L = ones(1, n*N-2*n);
            C0 = diag(L, -n);
            C1 = diag(L, -n);
            for i = 1:N-1
                C0(1:n, n*(N-i+1)-2*n+1:n*(N-i+2)-2*n) = -A{i};
                C1(1:n, n*(N-i+1)-2*n+1:n*(N-i+2)-2*n) = -A{i};
                if i < N-1
                    C1(i*n+1:(i+1)*n, i*n+1:(i+1)*n) = ((i+1)/(N-1-i))*eye(n);
                end
            end
            C1(1:n, 1:n) = C1(1:n, 1:n) + (1/(N-1))*A{N};
            X = zeros(n, N*n-n);
            for i = 1:N-1
                X(:, (i-1)*n+1:i*n) = i/(N-1)*eye(n);
            end
            Y = zeros(N*n-n, n);
            Y(1:n, 1:n) = eye(n);
        end
    elseif nargin == 4
        if varargin{4} == 'Lagrange'
            tau = varargin{1};
            rho = varargin{2};
            if length(tau) ~= length(rho)
                error("The lengths of tau and rho need to be of equal length.")
            end
            b = baryweights(tau);
            if iscell(rho)
                [n, ~] = size(rho{1});
            else
                n = 1;
            end
            if n == 1
                C0 = zeros(length(tau)+1);
                for i = 1:length(tau)
                    C0(1, i+1) = -rho(i);
                    C0(i+1, 1) = b(i);
                    C0(i+1, i+1) = tau(i);
                end
                C1 = eye(length(tau)+1);
                C1(1, 1) = 0;
                X = ones(1, length(tau)+1);
                X(1) = 0;
                Y = zeros(length(tau)+1, 1);
                Y(1) = 1;
            else
                C0 = zeros((length(tau)+1)*n);
                for i = 1:length(tau)
                    C0(1:n, i*n+1:(i+1)*n) = -rho{i}*eye(n);
                    C0(i*n+1:(i+1)*n, 1:n) = b(i)*eye(n);
                    C0(i*n+1:(i+1)*n, i*n+1:(i+1)*n) = tau(i)*eye(n);
                end
                C1 = eye((length(tau)+1)*n);
                C1(1:n, 1:n) = zeros(n);
                X = zeros(n, (length(tau)+1)*n);
                for i = 1:length(tau)
                    X(:, i*n+1:(i+1)*n) = eye(n);
                end
                Y = zeros((length(tau)+1)*n, n);
                Y(1:n, 1:n) = eye(n);
            end
        end
    end
end