function [s_sat] = sat(s,eps)

s_sat = min(max(s/eps,-1),1);

end