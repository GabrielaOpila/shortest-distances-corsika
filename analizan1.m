clear
clf
pliczek = fopen('no_repeat_77402-everything.txt', 'r');
plikus = fopen('merge_from_ofoct.txt', 'r');
elektrony = fopen('elektrony.txt', 'r');
histelektrony = fscanf(elektrony, '%f', [1 94919]);
fclose(elektrony);
pozytony = fopen('pozytony.txt', 'r');
histpozytony = fscanf(pozytony, '%f', [1 44106]);
fclose(pozytony)
fotony = fopen('fotony.txt', 'r');
histfotony = fscanf(fotony, '%f', [1 1681267]);
fclose(fotony)
%fid = fopen('filename.txt');
%{
res={};
while ~feof(pliczek)
  thisline = fgetl(pliczek);
  if ~ischar(thisline); break; end
  res{end+1,1} = thisline;
end
%fclose(fid);
number_of_lines=numel(res)
x = number_of_lines;
%}
x = 29790
results=fscanf(pliczek, '%f', [11 x]);
odl=fscanf(plikus, '%f', [1 2053]);
odl = transpose(odl);

fclose(pliczek);
distance = results(1,:);
id1 = results(2, :);
id2 = results(3, :);
x1 = results(4, :);
x2 = results(5, :);
y1 = results(6, :);
y2 = results(7, :);
energy1 = results(8, :);
energy2 = results(9, :);
dist1 = results(10, :);
dist2 = results(11, :);
results_obrot=transpose(results);
sorted=sortrows(results_obrot);

%{
histogram(distance)
saveas(gcf, 'histogram_wszystkiego.png')
%}
%{
plot(x1, y1, 'o', x2, y2, '.')
xlabel('x[cm]')
ylabel('y[cm]')
%set(gca,'DataAspectRatio',[1 5 1])
axis equal

tiledlayout(2,2)
nexttile
histogram(id1);
xlabel("1st particle's id")
ylabel('Number of particles')

nexttile
histogram(id2);
xlabel("2nd particle's id")
ylabel('Number of particles')
nexttile
histogram(dist1);
xlabel("1st particle's distance from primary particle's axis")
ylabel('Number of particles')

nexttile
histogram(dist2);
xlabel("2nd particle's distance from primary particle's axis")
ylabel('Number of particles')

%plot3(x1,y1,energy1, 'o',x2,y2,energy2, '.')
rysunek = plot3(x2,y2,energy2, '.');
rysunek.MarkerEdgeColor='#D95319'
xlabel('x[cm]');
ylabel('y[cm]');
zlabel('E[GeV]');
%}
ograniczenie = 64;
j=1;
while sorted(j,1) < ograniczenie
    j=j+1
end
%only for the shortest:
shortest=sorted(1:j,:);
sdistance = shortest(:,1);
sid1 = shortest(2, :);
sid2 = shortest(3, :);
sx1 = shortest(4, :);
sx2 = shortest(5, :);
sy1 = shortest(6, :);
sy2 = shortest(7, :);
senergy1 = shortest(8, :);
senergy2 = shortest(9, :);
sdist1 = shortest(10, :);
sdist2 = shortest(11, :);
%plot(sx1, sy1, '*');

%{
mocne_ograniczenie = 0.58;
k=1;
while sorted(k,1) < mocne_ograniczenie
    k = k+1
end
%}
%{
k= 2053;
theshortest=shortest(1:k,:);
thesdistance = theshortest(:,1);
%*1.5*10^{-4}
h2=histogram(thesdistance, 10)
xlim([0 0.58]);  
xlabel('Shortest distance[cm]')
ylabel('Number of pairs')
saveas(gcf, 'histogram_najkrotszych_biny10.png')


h1=histogram(odl,10)
xlabel('Shortest distance[pix]')
ylabel('Number of pairs')
saveas(gcf, 'histogram_najkrotszych_obsbiny10.png')



plot(sx1, sy1, 'o', sx2, sy2, '.')
xlabel('x[cm]')
ylabel('y[cm]')

saveas(gcf, 'rozklad_najkrotkich.png')

krotsze = plot3(sx1,sy1,senergy1, 'o',sx2,sy2,senergy2, '.')
%}
%srysunek = plot3(sx2,sy2,senergy2, '.');
%srysunek.MarkerEdgeColor='#D95319'
%{
xlabel('x[cm]');
ylabel('y[cm]');
zlabel('E[GeV]');
set(gca, 'ZScale', 'log');
legend('1st particle', '2nd particle');
%}
%{
fotonfoton=zeros(3000, 11)
licznikff=0
for i=1:j
    if shortest(i, 2)==1 && shortest(i, 3)==1
        licznikff = licznikff+1
        fotonfoton( licznikff+1, :)=shortest(i, :)
    end
end
%}


licznikff=0;
for i=1:j
    if shortest(i, 2)==1 && shortest(i, 3)==1
        licznikff = licznikff+1;
    end
end
fotonfoton=zeros(licznikff, 11);
licznikff=0;
for i=1:j
    if shortest(i, 2)==1 && shortest(i, 3)==1
        licznikff = licznikff+1;
        fotonfoton( licznikff, :)=shortest(i, :);
    end
end

licznikpp=0;
for i=1:j
    if shortest(i, 2)==2 && shortest(i, 3)==2
        licznikpp = licznikpp+1;
    end
end
pozytonpozyton=zeros(licznikpp, 11);
licznikpp=0;
for i=1:j
    if shortest(i, 2)==2 && shortest(i, 3)==2
        licznikpp = licznikpp+1;
        pozytonpozyton( licznikpp, :)=shortest(i, :);
    end
end

licznikee=0;
for i=1:j
    if shortest(i, 2)==3 && shortest(i, 3)==3
        licznikee = licznikee+1;
    end
end
elektronelektron=zeros(licznikee, 11);
licznikee=0;
for i=1:j
    if shortest(i, 2)==3 && shortest(i, 3)==3
        licznikee = licznikee+1;
        elektronelektron( licznikee, :)=shortest(i, :);
    end
end

licznikfe=0;
for i=1:j
    if (shortest(i, 2)==3 && shortest(i, 3)==1) || (shortest(i, 2)==1 && shortest(i, 3)==3)
        licznikfe = licznikfe+1;
    end
end
fotonelektron=zeros(licznikfe, 11);
licznikfe=0;
for i=1:j
    if (shortest(i, 2)==3 && shortest(i, 3)==1) || (shortest(i, 2)==1 && shortest(i, 3)==3)
        licznikfe = licznikfe+1;
        fotonelektron( licznikfe, :)=shortest(i, :);
    end
end

licznikfp=0;
for i=1:j
    if (shortest(i, 2)==2 && shortest(i, 3)==1) || (shortest(i, 2)==1 && shortest(i, 3)==2)
        licznikfp = licznikfp+1;
    end
end
fotonpozyton=zeros(licznikfp, 11);
licznikfp=0;
for i=1:j
    if (shortest(i, 2)==2 && shortest(i, 3)==1) || (shortest(i, 2)==1 && shortest(i, 3)==2)
        licznikfp = licznikfp+1;
        fotonpozyton( licznikfp, :)=shortest(i, :);
    end
end

licznikep=0;
for i=1:j
    if (shortest(i, 2)==2 && shortest(i, 3)==3) || (shortest(i, 2)==3 && shortest(i, 3)==2)
        licznikep = licznikep+1;
    end
end
elektronpozyton=zeros(licznikep, 11);
licznikep=0;
for i=1:j
    if (shortest(i, 2)==2 && shortest(i, 3)==3) || (shortest(i, 2)==3 && shortest(i, 3)==2)
        licznikep = licznikep+1;
        elektronpozyton( licznikep, :)=shortest(i, :);
    end
end

ffdistance = fotonfoton(:,1);
ffid1 = fotonfoton(:,2);
ffid2 = fotonfoton( :,3);
ffx1 = fotonfoton(:,4);
ffx2 = fotonfoton( :,5);
ffy1 = fotonfoton(:,6);
ffy2 = fotonfoton(:,7);
ffenergy1 = fotonfoton( :,8);
ffenergy2 = fotonfoton(:,9);
ffdist1 = fotonfoton(:,10);
ffdist2 = fotonfoton(:,11);



%{
all_electrons = histogram(histelektrony)
xlabel('E_e[GeV]')
ylabel('Number of electrons')
set(gca, 'YScale', 'log')

saveas(gcf, 'histogram_all_electrons.png')
%}

hist1 = histogram(ffdistance)
ylabel('Number of photon-photon pairs');
xlabel('Distance[cm] between two particles closest to each other');
hist1.BinWidth=5;
set(gca, 'YScale', 'log')
xlim([0 64]);        
saveas(gcf, 'distances_ff.png')


hist2 = histogram(fotonelektron(:,1))
ylabel('Number of photon-electron pairs');
xlabel('Distance[cm] between two particles closest to each other');
hist2.BinWidth=5;
set(gca, 'YScale', 'log')
xlim([0 64]);        
saveas(gcf, 'distances_fe.png')


hist3 = histogram(fotonpozyton(:,1))
ylabel('Number of photon-positron pairs');
xlabel('Distance[cm] between two particles closest to each other');
hist3.BinWidth=5;
set(gca, 'YScale', 'log')
xlim([0 64]);        
saveas(gcf, 'distances_fp.png')


hist4 = histogram(elektronelektron(:,1))
ylabel('Number of electron-electron pairs');
xlabel('Distance[cm] between two particles closest to each other');
hist4.BinWidth=5;
set(gca, 'YScale', 'log')
xlim([0 64]);        
saveas(gcf, 'distances_ee.png')


hist5 = histogram(elektronpozyton(:,1))
ylabel('Number of electron-positron pairs');
xlabel('Distance[cm] between two particles closest to each other');
set(gca, 'YScale', 'log')
hist5.BinWidth=5;
xlim([0 64]);        
saveas(gcf, 'distances_ep.png')


%histogram(pozytonpozyton(:,1))
%ylabel('Number of positron-positron pairs');
%xlabel('Distance[cm] between two particles closest to each other');

%PHOTON-PHOTON
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%sortowanie tak by 1st particle miala wieksza energie w parze
%sorting so that 1st particle's energy is bigger than the 2nd particle's
%energy
for i=1:licznikff
    if ffenergy1(i)<ffenergy2(i)
        temp1 = fotonfoton(i,2);
        temp2 = fotonfoton(i,4);
        temp3 = fotonfoton(i,6);
        temp4 = fotonfoton(i,8);
        temp5 = fotonfoton(i,10);
        fotonfoton(i,2) = fotonfoton(i,3);
        fotonfoton(i,4) = fotonfoton(i,5);
        fotonfoton(i,6) = fotonfoton(i,7);
        fotonfoton(i,8) = fotonfoton(i,9);
        fotonfoton(i,10) = fotonfoton(i,11);
        fotonfoton(i,3) = temp1;
        fotonfoton(i,5) = temp2;
        fotonfoton(i,7) = temp3;
        fotonfoton(i,9) = temp4;
        fotonfoton(i,11) = temp5;
    end
end
ffdistance = fotonfoton(:,1);
ffid1 = fotonfoton(:,2);
ffid2 = fotonfoton( :,3);
ffx1 = fotonfoton(:,4);
ffx2 = fotonfoton( :,5);
ffy1 = fotonfoton(:,6);
ffy2 = fotonfoton(:,7);
ffenergy1 = fotonfoton( :,8);
ffenergy2 = fotonfoton(:,9);
ffdist1 = fotonfoton(:,10);
ffdist2 = fotonfoton(:,11);
plot(ffenergy1, ffenergy2, '*')
set(gca, 'XScale', 'log')
set(gca, 'YScale', 'log')
xlabel('E_1 [GeV]')
ylabel('E_2 [GeV]')
%{
histogram(ffenergy1)
xlim([0 0.5]);        
ylabel('Number of particles from photon-photon pairs');
xlabel('E_1[GeV]');
%}
histogram(ffenergy2)
xlim([0 0.07]);        
ylabel('Number of particles from photon-photon pairs');
xlabel('E_2[GeV]');



hff=histogram(histfotony)
hff.BinWidth=0.025;
set(gca, 'YScale', 'log')
hff.Normalization = 'probability';
hold on

hf1 = histogram(ffenergy1)

set(gca, 'YScale', 'log')
ylabel('Fraction of photons');
xlabel('E_{\gamma}[GeV]');
hf1.BinWidth=0.025;
hf1.Normalization = 'probability';
hold on

hf2 = histogram(ffenergy2)
hf2.BinWidth=0.025;
legend('All photons', 'Photons forming pairs (higher energy in a pair)', 'Photons forming pairs (lower energy in a pair)')
hf2.Normalization = 'probability';
set(gca, 'YScale', 'log')
%ylabel('Number of particles from photon-photon pairs with a certain energy');
xlabel('E_{\gamma}[GeV]');
xlim([0 2]);        

saveas(gcf, 'histogram_all_ff.png')


hold off
%PHOTON-ELECTRON
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
feenergy1 = fotonelektron( :,8);
feenergy2 = fotonelektron(:,9);
for i=1:licznikfe
    if feenergy1(i)<feenergy2(i)
        temp1 = fotonelektron(i,2);
        temp2 = fotonelektron(i,4);
        temp3 = fotonelektron(i,6);
        temp4 = fotonelektron(i,8);
        temp5 = fotonelektron(i,10);
        fotonelektron(i,2) = fotonelektron(i,3);
        fotonelektron(i,4) = fotonelektron(i,5);
        fotonelektron(i,6) = fotonelektron(i,7);
        fotonelektron(i,8) = fotonelektron(i,9);
        fotonelektron(i,10) = fotonelektron(i,11);
        fotonelektron(i,3) = temp1;
        fotonelektron(i,5) = temp2;
        fotonelektron(i,7) = temp3;
        fotonelektron(i,9) = temp4;
        fotonelektron(i,11) = temp5;
    end
end
fedistance = fotonelektron(:,1);
feid1 = fotonelektron(:,2);
feid2 = fotonelektron( :,3);
fex1 = fotonelektron(:,4);
fex2 = fotonelektron( :,5);
fey1 = fotonelektron(:,6);
fey2 = fotonelektron(:,7);
feenergy1 = fotonelektron( :,8);
feenergy2 = fotonelektron(:,9);
fedist1 = fotonelektron(:,10);
fedist2 = fotonelektron(:,11);
%{
plot(feenergy1, feenergy2, '*')
set(gca, 'XScale', 'log')
set(gca, 'YScale', 'log')
xlabel('E_1 [GeV]')
ylabel('E_2 [GeV]')
%}
fe_wgczastki=fotonelektron;
for i=1:licznikfe
    if feid1(i)<feid2(i)
        temp1 = fe_wgczastki(i,2);
        temp2 = fe_wgczastki(i,4);
        temp3 = fe_wgczastki(i,6);
        temp4 = fe_wgczastki(i,8);
        temp5 = fe_wgczastki(i,10);
        fe_wgczastki(i,2) = fe_wgczastki(i,3);
        fe_wgczastki(i,4) = fe_wgczastki(i,5);
        fe_wgczastki(i,6) = fe_wgczastki(i,7);
        fe_wgczastki(i,8) = fe_wgczastki(i,9);
        fe_wgczastki(i,10) = fe_wgczastki(i,11);
        fe_wgczastki(i,3) = temp1;
        fe_wgczastki(i,5) = temp2;
        fe_wgczastki(i,7) = temp3;
        fe_wgczastki(i,9) = temp4;
        fe_wgczastki(i,11) = temp5;
    end
end
fedistancewcz = fe_wgczastki(:,1);
feid1wcz = fe_wgczastki(:,2);
feid2wcz = fe_wgczastki( :,3);
fex1wcz = fe_wgczastki(:,4);
fex2wcz = fe_wgczastki( :,5);
fey1wcz = fe_wgczastki(:,6);
fey2wcz = fe_wgczastki(:,7);
feenergy1wcz = fe_wgczastki( :,8);
feenergy2wcz = fe_wgczastki(:,9);
fedist1wcz = fe_wgczastki(:,10);
fedist2wcz = fe_wgczastki(:,11);
%{
plot(feenergy1wcz, feenergy2wcz, '.')
set(gca, 'XScale', 'log')
set(gca, 'YScale', 'log')
xlabel('E_e [GeV]')
ylabel('E_f [GeV]')
%}
all_electrons_ef = histogram(histelektrony)
xlabel('E_e[GeV]')
ylabel('Number of electrons')
set(gca, 'YScale', 'log')
all_electrons_ef.BinWidth = 0.025
all_electrons_ef.Normalization = 'probability';
hold on

hef = histogram(feenergy1wcz);
ylabel('Fraction of electrons');
xlabel('E_e[GeV]'); 
set(gca, 'YScale', 'log')
%set(gca, 'XScale', 'log')
xlim([0 2.6]);        
hef.BinWidth = 0.025
hef.Normalization = 'probability';
legend('All electrons', 'Electrons forming electron-photon pairs')

saveas(gcf, 'histogram_all_ef.png')

hold off 

heff=histogram(histfotony)
heff.BinWidth=0.025;
set(gca, 'YScale', 'log')
heff.Normalization = 'probability';

hold on
eeef = histogram(feenergy2wcz);
eeef.Normalization = 'probability';
eeef.BinWidth=0.025;

ylabel('Fraction of photons');
xlabel('E_{\gamma}[GeV]'); 
set(gca, 'YScale', 'log')
%set(gca, 'XScale', 'log')
xlim([0 2]);
legend('All photons', 'Photons forming electron-photon pairs')

saveas(gcf, 'histogram_all_ef2.png')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PHOTON-POSITRON
clf
fpenergy1 = fotonpozyton( :,8);
fpenergy2 = fotonpozyton(:,9);
for i=1:licznikfp
    if fpenergy1(i)<fpenergy2(i)
        temp1 = fotonpozyton(i,2);
        temp2 = fotonpozyton(i,4);
        temp3 = fotonpozyton(i,6);
        temp4 = fotonpozyton(i,8);
        temp5 = fotonpozyton(i,10);
        fotonpozyton(i,2) = fotonpozyton(i,3);
        fotonpozyton(i,4) = fotonpozyton(i,5);
        fotonpozyton(i,6) = fotonpozyton(i,7);
        fotonpozyton(i,8) = fotonpozyton(i,9);
        fotonpozyton(i,10) = fotonpozyton(i,11);
        fotonpozyton(i,3) = temp1;
        fotonpozyton(i,5) = temp2;
        fotonpozyton(i,7) = temp3;
        fotonpozyton(i,9) = temp4;
        fotonpozyton(i,11) = temp5;
    end
end
fpdistance = fotonpozyton(:,1);
fpid1 = fotonpozyton(:,2);
fpid2 = fotonpozyton( :,3);
fpx1 = fotonpozyton(:,4);
fpx2 = fotonpozyton( :,5);
fpy1 = fotonpozyton(:,6);
fpy2 = fotonpozyton(:,7);
fpenergy1 = fotonpozyton( :,8);
fpenergy2 = fotonpozyton(:,9);
fpdist1 = fotonpozyton(:,10);
fpdist2 = fotonpozyton(:,11);
plot(fpenergy1, fpenergy2, '.')
%set(gca, 'XScale', 'log')
%set(gca, 'YScale', 'log')
xlabel('E_1 [GeV]')
ylabel('E_2 [GeV]')
%xlim([0 2]);        
%ylim([0 2]);        

fp_wgczastki=fotonpozyton;
for i=1:licznikfp
    if fpid1(i)<fpid2(i)
        temp1 = fp_wgczastki(i,2);
        temp2 = fp_wgczastki(i,4);
        temp3 = fp_wgczastki(i,6);
        temp4 = fp_wgczastki(i,8);
        temp5 = fp_wgczastki(i,10);
        fp_wgczastki(i,2) = fp_wgczastki(i,3);
        fp_wgczastki(i,4) = fp_wgczastki(i,5);
        fp_wgczastki(i,6) = fp_wgczastki(i,7);
        fp_wgczastki(i,8) = fp_wgczastki(i,9);
        fp_wgczastki(i,10) = fp_wgczastki(i,11);
        fp_wgczastki(i,3) = temp1;
        fp_wgczastki(i,5) = temp2;
        fp_wgczastki(i,7) = temp3;
        fp_wgczastki(i,9) = temp4;
        fp_wgczastki(i,11) = temp5;
    end
end
fpdistancewcz = fp_wgczastki(:,1);
fpid1wcz = fp_wgczastki(:,2);
fpid2wcz = fp_wgczastki( :,3);
fpx1wcz = fp_wgczastki(:,4);
fpx2wcz = fp_wgczastki( :,5);
fpy1wcz = fp_wgczastki(:,6);
fpy2wcz = fp_wgczastki(:,7);
fpenergy1wcz = fp_wgczastki( :,8);
fpenergy2wcz = fp_wgczastki(:,9);
fpdist1wcz = fp_wgczastki(:,10);
fpdist2wcz = fp_wgczastki(:,11);

plot(fpenergy1wcz, fpenergy2wcz, '.')
set(gca, 'XScale', 'log')
set(gca, 'YScale', 'log')
xlabel('E_p [GeV]')
ylabel('E_f [GeV]')
xlim([0 2]);        
ylim([0 2]);     

hp=histogram(histpozytony)
hp.BinWidth=0.025;
hold on
hfpp = histogram(fpenergy1wcz);
hfpp.BinWidth=0.025;
%ylabel('Number of positrons from photon-positron pairs');
xlabel('E_p[GeV]'); 
ylabel('Fraction of positrons')
xlim([0 2.5]);        
legend('All positrons', 'Positrons forming photon-positron pairs')
set(gca, 'YScale', 'log')
hp.Normalization = 'probability';
hfpp.Normalization = 'probability';
saveas(gcf, 'histogram_all_fp1.png')

hold off
%set(gca, 'YScale', 'log')
%set(gca, 'XScale', 'log')


all_photons_fp = histogram(histfotony)
ylabel('Fraction of photons')
set(gca, 'YScale', 'log')
all_photons_fp.BinWidth = 0.025;
all_photons_fp.Normalization = 'probability';
hold on
fhist = histogram(fpenergy2wcz);
fhist.Normalization = 'probability';
fhist.BinWidth = 0.025
set(gca, 'YScale', 'log')
legend('All photons', 'Photons forming photon-positron pairs')

%ylabel('Number of photons from photon-positron pairs');
xlabel('E_{\gamma}[GeV]'); 
xlim([0 2]);  
saveas(gcf, 'histogram_all_fp2.png')

hold off
%{
plot3(fpenergy1wcz, fpenergy2wcz, fpdistancewcz, '.')
%set(gca, 'XScale', 'log')
%set(gca, 'YScale', 'log')
set(gca, 'ZScale', 'log')

xlabel('E_p [GeV]')
ylabel('E_f [GeV]')
zlabel('Distance [cm]')
xlim([0 0.5]);        
ylim([0 0.5]);     
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ELECTRON-POSITRON

clf
epenergy1 = elektronpozyton( :,8);
epenergy2 = elektronpozyton(:,9);
for i=1:licznikep
    if epenergy1(i)<epenergy2(i)
        temp1 = elektronpozyton(i,2);
        temp2 = elektronpozyton(i,4);
        temp3 = elektronpozyton(i,6);
        temp4 = elektronpozyton(i,8);
        temp5 = elektronpozyton(i,10);
        elektronpozyton(i,2) = elektronpozyton(i,3);
        elektronpozyton(i,4) = elektronpozyton(i,5);
        elektronpozyton(i,6) = elektronpozyton(i,7);
        elektronpozyton(i,8) = elektronpozyton(i,9);
        elektronpozyton(i,10) = elektronpozyton(i,11);
        elektronpozyton(i,3) = temp1;
        elektronpozyton(i,5) = temp2;
        elektronpozyton(i,7) = temp3;
        elektronpozyton(i,9) = temp4;
        elektronpozyton(i,11) = temp5;
    end
end
epdistance = elektronpozyton(:,1);
epid1 = elektronpozyton(:,2);
epid2 = elektronpozyton( :,3);
epx1 = elektronpozyton(:,4);
epx2 = elektronpozyton( :,5);
epy1 = elektronpozyton(:,6);
epy2 = elektronpozyton(:,7);
epenergy1 = elektronpozyton( :,8);
epenergy2 = elektronpozyton(:,9);
epdist1 = elektronpozyton(:,10);
epdist2 = elektronpozyton(:,11);
plot(epenergy1, epenergy2, '.')
%set(gca, 'XScale', 'log')
%set(gca, 'YScale', 'log')
xlabel('E_1 [GeV]')
ylabel('E_2 [GeV]')
%xlim([0 2]);        
%ylim([0 2]);        

ep_wgczastki=elektronpozyton;
for i=1:licznikep
    if epid1(i)<epid2(i)
        temp1 = ep_wgczastki(i,2);
        temp2 = ep_wgczastki(i,4);
        temp3 = ep_wgczastki(i,6);
        temp4 = ep_wgczastki(i,8);
        temp5 = ep_wgczastki(i,10);
        ep_wgczastki(i,2) = ep_wgczastki(i,3);
        ep_wgczastki(i,4) = ep_wgczastki(i,5);
        ep_wgczastki(i,6) = ep_wgczastki(i,7);
        ep_wgczastki(i,8) = ep_wgczastki(i,9);
        ep_wgczastki(i,10) = ep_wgczastki(i,11);
        ep_wgczastki(i,3) = temp1;
        ep_wgczastki(i,5) = temp2;
        ep_wgczastki(i,7) = temp3;
        ep_wgczastki(i,9) = temp4;
        ep_wgczastki(i,11) = temp5;
    end
end
epdistancewcz = ep_wgczastki(:,1);
epid1wcz = ep_wgczastki(:,2);
epid2wcz = ep_wgczastki( :,3);
epx1wcz = ep_wgczastki(:,4);
epx2wcz = ep_wgczastki( :,5);
epy1wcz = ep_wgczastki(:,6);
epy2wcz = ep_wgczastki(:,7);
epenergy1wcz = ep_wgczastki( :,8);
epenergy2wcz = ep_wgczastki(:,9);
epdist1wcz = ep_wgczastki(:,10);
epdist2wcz = ep_wgczastki(:,11);

all_electrons_p = histogram(histelektrony)
xlabel('E_e[GeV]')
ylabel('Number of electrons')
set(gca, 'YScale', 'log')
all_electrons_p.Normalization = 'probability';
hold on
epe = histogram(epenergy2wcz)
ylabel('Fraction of electrons');
xlabel('E_e[GeV]');
xlim([0 2]);  
epe.BinWidth=0.025;
epe.Normalization = 'probability';
all_electrons_p.BinWidth = 0.025;
legend('All electrons', 'Electrons forming electron-positron pairs')
saveas(gcf, 'histogram_all_ep1.png')

hold off

hp=histogram(histpozytony)
hp.BinWidth=0.025;
set(gca, 'YScale', 'log')
hp.Normalization = 'probability';

hold on
el_p = histogram(epenergy1wcz)
el_p.BinWidth=0.025;
el_p.Normalization = 'probability';

set(gca, 'YScale', 'log')
legend('All positrons', 'Positrons forming electron-positron pairs')

ylabel('Fraction of positrons');
xlabel('E_p[GeV]');
xlim([0 2]);  


saveas(gcf, 'histogram_all_ep2.png')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ELECTRON-ELECTRON
clf
eeenergy1 = elektronelektron(:,8);
eeenergy2 = elektronelektron(:,9);
for i=1:licznikee
    if eeenergy1(i)<eeenergy2(i)
        temp1 = elektronelektron(i,2);
        temp2 = elektronelektron(i,4);
        temp3 = elektronelektron(i,6);
        temp4 = elektronelektron(i,8);
        temp5 = elektronelektron(i,10);
        elektronelektron(i,2) = elektronelektron(i,3);
        elektronelektron(i,4) = elektronelektron(i,5);
        elektronelektron(i,6) = elektronelektron(i,7);
        elektronelektron(i,8) = elektronelektron(i,9);
        elektronelektron(i,10) = elektronelektron(i,11);
        elektronelektron(i,3) = temp1;
        elektronelektron(i,5) = temp2;
        elektronelektron(i,7) = temp3;
        elektronelektron(i,9) = temp4;
        elektronelektron(i,11) = temp5;
    end
end
eedistance = elektronelektron(:,1);
eeid1 = elektronelektron(:,2);
eeid2 = elektronelektron( :,3);
eex1 = elektronelektron(:,4);
eex2 = elektronelektron( :,5);
eey1 = elektronelektron(:,6);
eey2 = elektronelektron(:,7);
eeenergy1 = elektronelektron( :,8);
eeenergy2 = elektronelektron(:,9);
eedist1 = elektronelektron(:,10);
eedist2 = elektronelektron(:,11);
plot(eeenergy1, eeenergy2, '.')
%set(gca, 'XScale', 'log')
%set(gca, 'YScale', 'log')
xlabel('E_1 [GeV]')
ylabel('E_2 [GeV]')
%xlim([0 2]);        
%ylim([0 2]);        

ee_wgczastki=elektronelektron;
for i=1:licznikee
    if eeid1(i)<eeid2(i)
        temp1 = ee_wgczastki(i,2);
        temp2 = ee_wgczastki(i,4);
        temp3 = ee_wgczastki(i,6);
        temp4 = ee_wgczastki(i,8);
        temp5 = ee_wgczastki(i,10);
        ee_wgczastki(i,2) = ee_wgczastki(i,3);
        ee_wgczastki(i,4) = ee_wgczastki(i,5);
        ee_wgczastki(i,6) = ee_wgczastki(i,7);
        ee_wgczastki(i,8) = ee_wgczastki(i,9);
        ee_wgczastki(i,10) = ee_wgczastki(i,11);
        ee_wgczastki(i,3) = temp1;
        ee_wgczastki(i,5) = temp2;
        ee_wgczastki(i,7) = temp3;
        ee_wgczastki(i,9) = temp4;
        ee_wgczastki(i,11) = temp5;
    end
end
eedistancewcz = ee_wgczastki(:,1);
eeid1wcz = ee_wgczastki(:,2);
eeid2wcz = ee_wgczastki( :,3);
eex1wcz = ee_wgczastki(:,4);
eex2wcz = ee_wgczastki( :,5);
eey1wcz = ee_wgczastki(:,6);
eey2wcz = ee_wgczastki(:,7);
eeenergy1wcz = ee_wgczastki( :,8);
eeenergy2wcz = ee_wgczastki(:,9);
eedist1wcz = ee_wgczastki(:,10);
eedist2wcz = ee_wgczastki(:,11);


all_electrons = histogram(histelektrony)
xlabel('E_e[GeV]')
ylabel('Number of electrons')
set(gca, 'YScale', 'log')
all_electrons.Normalization = 'probability';
all_electrons.BinWidth = 0.025;
hold on
e1 = histogram(eeenergy1wcz)
ylabel('Number of electrons with higher energy');
xlabel('E_{e1}[GeV]');
xlim([0 2]);  
e1.Normalization = 'probability';
hold on
e1.BinWidth = 0.025;
all_electrons.BinWidth = 0.025
saveas(gcf, 'histogram_all_electrons1.png')
e2 = histogram(eeenergy2wcz)
e2.Normalization = 'probability';

e2.BinWidth = 0.025;

ylabel('Fraction of electrons');
xlabel('E_{e}[GeV]');
%xlim([0 0.1]);  
legend('All electrons', 'Electrons forming pairs (higher energy in a pair)', 'Electrons forming pairs (lower energy in a pair)')
saveas(gcf, 'histogram_all_electrons_1_2.png')
hold off

obserwacje = fopen('obsy.txt', 'r');
obsy = fscanf(obserwacje, '%f', [10 181203]);
fclose(obserwacje);


ograniczenie = 0.56;
j=1;
while sorted(j,1) < ograniczenie
    j=j+1;
end

histobs = histogram(obsy(10, 1:j)*0.58/2500);
set(gca, 'YScale', 'log')
histobs.Normalization = 'probability';
histobs.BinWidth = 0.01
%saveas(gcf, 'histobs.png')
hold on
histdist = histogram(sdistance)
xlabel('Distance [cm]')
ylabel('Number of pairs')
histdist.BinWidth = 0.01
legend('Observations', 'Simulations')
set(gca, 'YScale', 'log')
xlim([0 0.58]); 
histdist.Normalization = 'probability';
saveas(gcf, 'comparison_with_obs_approach1.png')
hold off
%}
%{
plot3(fex1,fey1,feenergy1, 'b.',fex2,fey2,feenergy2, '.')
%srysunek = plot3(sx2,sy2,senergy2, '.');
%srysunek.MarkerEdgeColor='#D95319'
xlabel('x[cm]');
ylabel('y[cm]');
zlabel('E[GeV]');
set(gca, 'ZScale', 'log');
legend('Electron', 'Photon');
saveas(gcf, 'elektronfotonlogfi0.png')


fotonelektron = plot3(fex1wcz,fey1wcz,feenergy1wcz, 'b.',fex2wcz,fey2wcz,feenergy2wcz, 'g.', fpx1wcz, fpy1wcz, fpenergy1wcz, 'm.', fpx2wcz, fpy2wcz, fpenergy2wcz, 'c.' )
%srysunek = plot3(sx2,sy2,senergy2, '.');
%srysunek.MarkerEdgeColor='#D95319'
xlabel('x[cm]');
ylabel('y[cm]');
zlabel('E[GeV]');
set(gca, 'ZScale', 'log');
legend('Electron', 'Photon (from photon-electron pair)', 'Positron', 'Photon (from photon-positron pair)');
saveas(gcf, 'fotonelektronfotonpozytonlogfi0.png')
%}