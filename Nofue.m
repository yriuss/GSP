%retorna o numero de elementos na parte triangular superior de uma matriz
%quadrada
function [n] = Nofue(W)
    lengthW = length(W);
    nElements = lengthW*lengthW;
    n = 0;
    for i = 1:lengthW
        n = n + (i-1);
    end
end