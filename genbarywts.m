function [w,D] = genbarywts( tau, s_in )
%
% [w,D,cap] = genbarywts( tau, s, <optional Taylor=true> )
% Generalized  Barycentric weights 
% (c)  Robert M. Corless, 2007, revised 2010
% and (optionally) Differentiation matrix
% in Taylor form, so
% D[rho; rho'; rho''/2] ==> [rho'; rho''; rho'''/2]
%
% on distinct nodes tau with integer confluencies s
% size(w) = [n,smax]
% [n,1] = size(tau(:))
% smax = max(s)

[n,dummy] = size(tau(:));

if max(size(s_in))==1,
    s = s_in*ones(n,1);
else
    s = s_in;
end;
smax = max(s);
% Degree bound
d = sum(s)-1;
%  The following computes a skew-symmetric matrix of differences
%  between nodes. We need both sums and products of these.

taudiff = tau(:)*ones(1,n) - ones(n,1)*(tau(:).');

%  Note that the diagonal is exactly zero in floating-point as the difference 
%  between identical floats (.' is real transpose); it would be paranoid
%  to zero them explicitly just to be sure.

taudiff = taudiff + eye(n);
iz = find( taudiff==0 );
if size(iz) ~= [0,0],
    error('Interpolation nodes must be explicitly distinct. Use confluency vector s to indicate repetition.');
end;

u  = zeros(n,smax);
nu = zeros(n,smax);

nu(:,1) = ones(n,1);

taudiffrecip = 1.0./taudiff;
taupow = ones(n,n);

for m=1:smax-1,
    taupow = taupow.*taudiffrecip;
    u(:,m) = sum( diag(s)*(taupow-eye(n)) ).';
    % Cauchy convolution for series recurrence relation.
    for i=1:n,
        nu(i,m+1) = u(i,1:m)*(nu(i,m:-1:1).') /m;
    end;
end;

% raise each col to s(j) power
for j=1:n,
    taudiffrecip(:,j) = taudiffrecip(:,j).^s(j);
end;

w = diag( prod( taudiffrecip, 2 ) )*nu;
% now reverse the order!
for i=1:n
    w(i,:)=[w(i,(s(i):-1:1)),zeros(1,smax-s(i))];
end;

if nargout > 1,
    % Compute differentiation matrix
    % This code is not vectorized because the
    % bookkeeping is hard enough even with for loops.
    D = zeros(d+1,d+1);
    brks = cumsum([0,s.']);
    irow = 0;
    for k=1:n,
        % trivial rows
        for j=1:s(k)-1,
            irow = irow+1;
            % next available row
            D(irow,brks(k)+j+1) = j;  % result is in Taylor form
        end
        % Nontrivial row
        irow = irow+1;
        for i=[1:k-1,k+1:n],
            for j=1:s(i),
                g = 0;
                for mu=j:s(i),
                    g = g + w(i,mu)*(tau(k)-tau(i))^(j-1-mu);
                end
                D(irow,brks(i)+j) = g/w(k,s(k));
            end;
        end;
        D(irow,brks(k)+2:brks(k)+s(k)) = -w(k,1:s(k)-1)/w(k,s(k));
        % Final entry 
        D(irow,brks(k)+1) = -sum( D(irow,brks(1:end-1)+1) );
        D(irow,:) = D(irow,:)*s(k);  % want Taylor form of derivative
    end
          
end
end



