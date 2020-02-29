gsp_start
N = 8;

W =[0 1 0 0 0 0 0 0;
    0 0 1 0 0 0 0 0;
    1 0 0 1 1 0 0 1;
    1 0 0 0 0 0 0 0;
    0 1 1 0 0 1 0 0;
    0 0 0 0 0 0 0 1;
    0 0 0 1 0 0 0 1;
    0 0 1 0 0 0 1 0];

G = gsp_graph(W);

%coordenadas para plotar o grafo
G.coords = [3 16;7 14;5 12;1 10;7 8;10 5;0 5;4 4];

G.directed = 1;

[U,Sigma,V] = svd(W);

Q = [eye(N-1) zeros(N-1,1);zeros(1,N-1) det(U*V')];

S = U*Q*V';%operador de deslocamento unitário

[F,eO] = eig(S);%decomposicao de S

%organizando autovalores
[E,inds] = sort(angle(diag(eO)),'descend');
eigenvectors= F(:,inds);%autovetores associados aos autovalores (inds)
autovalores= eO(:,inds);
%plotando grafo
gsp_plot_graph(G);

%para checar o exemplo fazer : S*x,S'*x (em que x = [0 0 1 0 0 0 0 0]')
%eigenvectors e eigenvectors' são para GDFT
%inds são os autovalores em ordem