clc 
clear all 
close all 

%% Ukol 1
%% Pravdepodobnosti vyskytu jednotlivych hodnot stavove promenne X 
pX = [0.34 0.21 0.05 0.40];

%% Vystup je dan nasledujicimi stochastickymi zavislostmi
Px1_0 = 0.15;
Px2_0 = 0.34;
Px3_0 = 0.28;
Px4_0 = 0.23;

Px1_1 = 1 - Px1_0;
Px2_1 = 1 - Px2_0;
Px3_1 = 1 - Px3_0;
Px4_1 = 1 - Px4_0;

PX_0 = [Px1_0 Px2_0 Px3_0 Px4_0]; % P(0|x_1,...,x_4)
PX_1 = [Px1_1 Px2_1 Px3_1 Px4_1]; % P(1|x_1,...,x_4)

%% Na vystupu Y pozorujeme tyto hodnoty: 
% 111, 110, 101, 011, 100, 010, 001, 000

%% Bayesovy vztahy pro vypocet pravdepodobnosti, ze system byl ve stavu Xi

% 111
veta_uplna_ppst_1 = pX(1) * (PX_1(1)^3) + pX(2) * (PX_1(2)^3) + pX(3) * (PX_1(3)^3) + pX(4) * (PX_1(4)^3);

P1 = (pX(1) * (PX_1(1)^3)) / veta_uplna_ppst_1;
P2 = (pX(2) * (PX_1(2)^3)) / veta_uplna_ppst_1;
P3 = (pX(3) * (PX_1(3)^3)) / veta_uplna_ppst_1;
P4 = (pX(4) * (PX_1(4)^3)) / veta_uplna_ppst_1;

% 110, 101, 011 -> pro tyto tri kombinace dostanu stejny vysledek 
veta_uplna_ppst_2 = (pX(1) * (PX_1(1)^2 * PX_0(1))) + (pX(2) * (PX_1(2)^2 * PX_0(2))) + (pX(3) * (PX_1(3)^2 * PX_0(3))) + (pX(4) * (PX_1(4)^2 * PX_0(4)));
P5 = (pX(1) * (PX_1(1)^2 * PX_0(1))) / veta_uplna_ppst_2;
P6 = (pX(2) * (PX_1(2)^2 * PX_0(2))) / veta_uplna_ppst_2;
P7 = (pX(3) * (PX_1(3)^2 * PX_0(3))) / veta_uplna_ppst_2;
P8 = (pX(4) * (PX_1(4)^2 * PX_0(4))) / veta_uplna_ppst_2;

% 100, 010, 001 -> pro tyto tri kombinace dostanu stejny vysledek 
veta_uplna_ppst_3 = (pX(1) * (PX_1(1) * PX_0(1)^2)) + (pX(2) * (PX_1(2) * PX_0(2)^2)) + (pX(3) * (PX_1(3) * PX_0(3)^2)) + (pX(4) * (PX_1(4) * PX_0(4)^2));
P9 = (pX(1) * (PX_1(1) * PX_0(1)^2)) / veta_uplna_ppst_3;
P10 = (pX(2) * (PX_1(2) * PX_0(2)^2)) / veta_uplna_ppst_3;
P11 = (pX(3) * (PX_1(3) * PX_0(3)^2)) / veta_uplna_ppst_3;
P12 = (pX(4) * (PX_1(4) * PX_0(4)^2)) / veta_uplna_ppst_3;

% 000 
veta_uplna_ppst_4 = pX(1) * (PX_0(1)^3) + pX(2) * (PX_0(2)^3) + pX(3) * (PX_0(3)^3) + pX(4) * (PX_0(4)^3);
P13 = (pX(1) * (PX_0(1)^3)) / veta_uplna_ppst_4;
P14 = (pX(2) * (PX_0(2)^3)) / veta_uplna_ppst_4;
P15 = (pX(3) * (PX_0(3)^3)) / veta_uplna_ppst_4;
P16 = (pX(4) * (PX_0(4)^3)) / veta_uplna_ppst_4;

%% Vysledna tabulka
result_table = [P1 P2 P3 P4;
          P5 P6 P7 P8;
          P5 P6 P7 P8;
          P5 P6 P7 P8;
          P9 P10 P11 P12;
          P9 P10 P11 P12;
          P9 P10 P11 P12;
          P13 P14 P15 P16;]
      
maxima = max(result_table')

% Vysledek: 
    % 111 -> X_1
    % 110 -> X_4
    % 101 -> X_4
    % 011 -> X_4
    % 100 -> X_4
    % 010 -> X_4
    % 001 -> X_4
    % 000 -> X_2

%% Ukol 2
%% Pravdepodobnosti spravneho a spatneho rozhodnuti
P_111 = veta_uplna_ppst_1; 
P_110 = veta_uplna_ppst_2; % = P_011, P_101
P_100 = veta_uplna_ppst_3; % = P_001, P_010
P_000 = veta_uplna_ppst_4;

% Pravdepodobnost spravneho rozhodnuti
P_sprav_roz = P_111 * maxima(1) + 3 * P_110 * maxima(2) + 3 * P_100 * maxima(5) + P_000 * maxima(6)

% Pravdepodobnost spatneho rozhodnuti
P_spat_roz = 1 - P_sprav_roz


      
   
