function [H] = MatrixConstruction(W,TF)
    treshTF = 3; % constante para TF
    treshNTF = 1; % constante para uma ligação not TF
    eta = 10; % constante para ambos not TF
    indexCounter = 0;
    lengthW = length(W);
    H = zeros(lengthW);
    nEleUpW = Nofue(W);
    row = 1;
    col = 1 + row;
    treshSum = 0;
    [rho,indexRho] = getRho(W,TF);
    notTF = getNotTF(W,TF);
    
    for i = 1:nEleUpW
        if(isTF(row,TF))
            treshSum = treshSum + treshTF;
        else
            if(~isTF(col,TF))
                treshSum = treshSum + eta;
            end
        end
        
        if(isTF(col,TF))
            treshSum = treshSum + treshTF;
        else
            if(~isTF(row,TF))
            else
                treshSum = treshSum + treshNTF;
            end
        end
        
        if(W(row,col) > treshSum)
            numberToCheck = W(row,col) - treshSum;
            if(numberToCheck < 0)
                numberToCheck = 0;
            end
            [connection, rho, indexCounter] = checkRho(numberToCheck, rho, indexRho, row, col, notTF,TF,indexCounter);
            if(connection == 1)
                H(row,col) = W(row,col);
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        treshSum = 0;
        col = col + 1;
        if (rem(col - 1,lengthW) == 0)
            row = row + 1;
            col = 1 + row;
        end
    end
    H = H + H';
end
