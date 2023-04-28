fis = mamfis('Name','fuzz_system');

fis = addInput(fis,[7 16],'Name',"temprature"); 
fis = addInput(fis,[1.75 4.00], 'Name' , 'pressure');

fis = addOutput(fis,[2 6],'Name',"co2_per");

mf1 = fismf("trimf",[2 2 3],'Name',"VB");
mf2 = fismf("trimf",[2 3 4],'Name',"B");
mf3 = fismf("trimf",[3 4 5],'Name',"N");
mf4 = fismf("trimf",[4 5 6],'Name',"G");
mf5 = fismf("trimf",[5 6 6],'Name',"VG");

fis.Outputs(1).MembershipFunctions = [mf1 mf2 mf3 mf4 mf5];

fis = addMF(fis,"temprature","trimf",[7 7 9],'Name',"VC");
fis = addMF(fis,"temprature","trimf",[7 9 11],'Name',"C");
fis = addMF(fis,"temprature","trimf",[10 12 14],'Name',"N");
fis = addMF(fis,"temprature","trimf",[12 14 16],'Name',"H");
fis = addMF(fis,"temprature","trimf",[13 16 16],'Name',"VH");
fis = addMF(fis,"pressure",'trimf',[1.75 1.75
2.25],'Name','VB');
fis = addMF(fis,"pressure",'trimf',[1.75 2.25 
2.5],'Name','B');
fis = addMF(fis,"pressure",'trimf',[2.25 2.75 
3.25],'Name','N');
fis = addMF(fis,"pressure",'trimf',[2.5 3.25 3.5],'Name','G')
fis = addMF(fis,"pressure",'trimf',[2.75 4 4],'Name','VG');

ruleList = [1 1 3 1 1; 
1 2 3 1 1;
1 3 4 1 1;
1 4 5 1 1;
1 5 5 1 1;
2 1 2 1 1;
2 2 4 1 1;
2 3 4 1 1;
2 4 4 1 1;
2 5 5 1 1;
3 1 2 1 1;
3 2 3 1 1;
3 3 3 1 1;
3 4 4 1 1;
3 5 5 1 1;
4 1 2 1 1;
4 2 2 1 1;
4 3 3 1 1;
4 4 3 1 1;
4 5 4 1 1;
5 1 1 1 1;
5 2 2 1 1;
5 3 3 1 1;
5 4 3 1 1;
5 5 4 1 1];

fis = addRule(fis,ruleList);

evalfis(fis,[16, 1.75]);

plotfis(fis);
plotmf(fis,'input',1) , plotmf(fis,'input',2);
plotmf(fis,'output',1);

ruleview(fis);



