  function  [sd,sl] = integratedsimilarity2(lncSim,disSim,id,il,gamma)   
 
WD=zeros(178);
index = find(0 ~= id);
WD(index) = gamma;
sd = WD.*id+(1-WD).*disSim;

WL=zeros(115);
index2 = find(0 ~= il);
WL(index2) = gamma;
sl = WL.*il+(1-WL).*lncSim;
  end