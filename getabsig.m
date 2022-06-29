function [xdig,a,b]=getabsig(x,maxint)

b = min(x);
a = (max(x)-b)/maxint;
xdig = round((x-b)/a);

end