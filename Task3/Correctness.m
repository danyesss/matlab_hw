function Check = Correctness(XYZ, R)
%CORRECTNESS Summary of this function goes here
%   Detailed explanation goes here
N = size(XYZ,2);
Check = 1;

for i=1:N
   for j=i+1:N
       L = norm(XYZ(:,i)-XYZ(:,j));
       if L <= R(i) + R(j)
           Check = 0;
           break;
       end
   end
   if Check == 0
       break;
   end
end

end

