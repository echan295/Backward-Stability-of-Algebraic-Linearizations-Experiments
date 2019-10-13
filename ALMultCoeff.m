function D = ALMultCoeff(A, B, c, d)
    NA = length(A)-1;
    NB = length(B)-1;
    nA = size(A{1});
    nB = size(B{1});
    nc = size(c);
    nd = size(d);
    if nA ~= nB
        error('The size of the matrix coefficients must be the same.');
    end
    if (nA(1) ~= nc(1)) || (nA(1) ~= nd(1))
        error('The sizes for c or d need to be the same size as the matrix coeffients of A and B.');
    end
    C = cell(1, NA+1);
    for i = 1:NA+1
        C{i} = A{i}*d;
    end
    D = cell(1, NA+NB+2);
    D{1} = c;
    for k = 2:NA+NB+2
        D{k} = zeros(nA);
        for i = 1:NA+1
            for j = 1:NB+1
                if i + j == k
                    D{k} = D{k} + C{i}*B{j};
                end
            end
        end
    end
end