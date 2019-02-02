
clear all
close all
clc

cd code

%%  Introduction
% The purpose of assignment 1 was to modeling the carriers as a 
% population of electrons in an N-type Si semiconductor crystal.

%% Part 1 Introduction 
% For part 1 of the assignment the initial velocity of the electrons was set 
% to the thermal velocity moving in a random direction. The x direction used 
% a periodic boundary condition and the y direction used a specular 
% reflection boundary condition.  First the thermal velocity and mean free 
% path where calculated using parameters given in the assignment 
% instructions. Next the simulation script was run which creates
% a 2-D plot of particle trajectories and temperature plot over time. 

%% Part 1 Figures and Command Line Outputs

cd part_1_final

part1

cd ..   


%% Part 1 Conclusion
% The results of the part 1 are as I expected. The electron 
% trajectories match the intended x and y boundary conditions. 
% The temperature plot shows a constant temperature of 300 K, 
% which makes sense given that the velocity of the electrons was set 
% to the thermal velocity moving in a random direction. 
% The thermal velocity was calculated to be 132212.04 m/s. 
% The mean free path was calculated to be 3.7395e-08 m. 


%% Part 2 Introduction 
% For part 2 of the assignment I started by assigning a random velocity to 
% each of the particles at the start using a Maxwell-Boltzmann distribution.
% Next I added scattering of the electrons to my model using an exponential  
% scattering probability. I then plotted average temperature over time and 
% measured the mean free path and mean time between collisions in order to 
% verify my model. Lastly I created a histogram of electron speeds and a
% 2-D plot of particle trajectories. 


%% Part 2 Figures and Command Line Outputs
cd part_2_final

part2

cd ..

%% Part 2 Conclusion
% The results of part 2 are as expected. When looking at the speed 
% histogramthe distribution appears to be Maxwell-Boltzmann, which is 
% the speed distribution I was trying to achieve. From the 2-D plot of
% particle trajectories, scattering appears to work.  The measured mean 
% free path was about 3.3 e-08 m. The calculated mean free path from part 1
% was 3.7395e-08 m, which is close to the measured mean free path.  
% The measured mean time between collisions was about 0.2 e-13 s, which is 
% exactly the same as the mean time between collisions given in part 1. 
% The average temperature over time fluctuated around 300 K, which is as
% expected because the electrons where constantly scattering at velocities 
% determined by a Maxwell-Boltzmann distribution. 




%% Part 3 Introduction 
% For part 3 of the assignment I started by creating 2 boxes, which 
% together created a bottleneck. The top box had a diffusive boundary and 
% the bottom box had a specular boundary. Once the boxes where in place 
% three figures where created. The first figure was a 2-D plot of particle 
% trajectories. The next plot was an electron density map for the final 
% electron positions. The last plot was a temperature map, which displays 
% the average temperature in each region. 

 %% Part 3 Figures 
cd part_3_final

part3

cd ..

%% Part 3 Conclusion
% The results of part 3 where as expected. When looking at the 2-D plot 
% of particle trajectories the particles bounce off the boxes correctly 
% depending on the type of box. For the temperature map, the final 
% temperature was uniformly distributed everywhere that a box was not 
% present except close to the diffusive boundary where the average 
% temperature was less. The average temperature was less near the
% diffuse boundary because some electrons colliding with the diffuse
% boundary lost energy and therefore remained close to the boundary. From 
% observing the electron density map for the final electron positions,
% the electrons were uniformly distributed everywhere a box was not
% present except where close to the a diffusive boundary. The electron
% density was larger near the diffuse boundary because some electrons 
% that collided with the diffuse boundary lost energy and therefore 
% remained close to the boundary.   



%% Conclusion
% Overall Assignment 1 was a success. I was able to complete every 
% objective and my results matched my expectation. 