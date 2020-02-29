gsp_start

%Matriz adjacencia do grafo
load TF.mat;

load Ecoli.mat;

%Transfer factors

% T eh a matriz correspondente ao grafo inferido de W
T = MatrixConstruction(A,tf);

G = gsp_graph(A);

G2 = gsp_graph(T);

G.coords = [0 0; 1 1; 1 -1; 2 0];

G2.coords = [0 0; 1 1; 1 -1; 2 0];

%basta usar as funções gsp_plot_graph para G e G2 para ver o resultado e
%comparar com o artigo