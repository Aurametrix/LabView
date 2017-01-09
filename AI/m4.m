%global parameters
global mu;
global N;
global nu; 
global sigma;
global gamma;
global rho;
global beta;
np=5;ns=2;
N=repmat([500 5000],np,1);
mu=repmat([0.000365 0.00137],np,1);
sigma=repmat([0.5 0.67],np,1);
gamma=repmat([0.25 0.233],np,1);
nu=repmat(0.00274,np,ns);
%topology matrix between regions
top = circshift(eye(np),[0 1]);
rho=cat(3,top*0.03,top*0.1);%matrix 5x5x2
beta=repmat([0 0.21;0 0.42],[1 1 5]);%matrix 2x2x5
%initialize cardinality of compartments
S=N;S(1,2)=4990;
I=zeros(5,2);E=I;R=I;I(1,2)=10;

tMax=500;
options=[];
S = reshape(S,[1 ns*np]);
E = reshape(E,[1 ns*np]);
I = reshape(I,[1 ns*np]);
R = reshape(R,[1 ns*np]);
[T,Y]=ode45(@rightSideAIModel,[0 tMax],[S E I R],options);
%plot total infectious humans and birds
res=zeros(length(T),2);
res(:,1)=sum(Y(:,2*np*ns+1:2*np*ns+5),2);
res(:,2)=sum(Y(:,2*np*ns+6:3*np*ns),2);
plot(T,res');
legend('Human','Bird');
xlabel('Time');
ylabel('Total Infectious');

function res=rightSideAIModel(t, pop)
global mu;
global N;
global nu; 
global sigma;
global gamma;
global rho;
global beta;
np=5;ns=2;
S=reshape(pop(1:np*ns),[np ns]);
E=reshape(pop(np*ns+1:2*np*ns),[np ns]);
I=reshape(pop(2*np*ns+1:3*np*ns),[np ns]);
R=reshape(pop(3*np*ns+1:end),[np ns]);
%calculate lambda
lambda=zeros(np,ns);
for p=1:np
    for s=1:ns
        lambda(p,s)=sum(beta(s,:,p).*I(p,:)./N(p,:));
    end
end
%calculate migrations
deltaS = zeros(np,ns);
deltaI = zeros(np,ns);
deltaE = zeros(np,ns);
deltaR = zeros(np,ns);
for s=1:ns
   deltaS(:,s)=rho(:,:,s)*S(:,s)-sum(rho(:,:,s))'.*S(:,s);
   deltaE(:,s)=rho(:,:,s)*E(:,s)-sum(rho(:,:,s))'.*E(:,s);
   deltaI(:,s)=rho(:,:,s)*I(:,s)-sum(rho(:,:,s))'.*I(:,s);
   deltaR(:,s)=rho(:,:,s)*R(:,s)-sum(rho(:,:,s))'.*R(:,s);
end
%equations
dSdt = mu.*N + nu.*R - lambda.*S - mu.*S + deltaS;
dEdt = lambda.*S - sigma.*E - mu.*E + deltaE;
dIdt = sigma.*E - gamma.*I - mu.*I + deltaI;
dRdt = gamma.*I - mu.*R - nu.*R + deltaR;
dSdt = reshape(dSdt,[1 ns*np]);
dEdt = reshape(dEdt,[1 ns*np]);
dIdt = reshape(dIdt,[1 ns*np]);
dRdt = reshape(dRdt,[1 ns*np]);
res = [dSdt dEdt dIdt dRdt]';
