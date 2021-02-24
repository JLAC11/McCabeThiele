%% Estas son funciones que ayudan a describir un modelo de McCabe Thiele
% Creo que conviene construir una clase que defina a una curva de equilibrio,
% y a esa curva de equilibrio líquido vapor darle el método de McCabe y el de 
% Ponchon-Savarit.
% todo: 1. Completar documentación de funciones
% todo: 2. Convertir a clase en vez de funciones


function [pp, Feed] = PinchPointModel(qline, Model)
% PinchPointModel - Devuelve el punto pinch de una curva de equilibrio x-y
%
% Syntax:  [pp,FeedLine] = PinchPointModel(qline,Model)
%
% Inputs:
%    qline - symfun de la q-line del sistema.
%    Model - línea que describe a la curva de equilibrio en función de
%    fracción molar del líquido.
%
% Outputs:
%    pp - Pinch point de la línea de alimentación. Escrito en forma (x,y).
%    FeedEq - symfun de la línea de alimentación
%
% Example: 
%    Line 1 of example
%    Line 2 of example
%    Line 3 of example
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also: OTHER_FUNCTION_NAME1,  OTHER_FUNCTION_NAME2
% Author: José Luis Aguilar
% email: aguilarch.joseluis@gmail.com
% Febrero 2020
%------------- BEGIN CODE --------------
    
    syms x Equilibrium(x) Feed(x)
    assume(x,{'real','positive'})
    % Solamente válido si es función de la composición líquida.
    Equilibrium(x) = poly2sym(Model);
    Feed(x) = qline;
    pp = double(solve(Equilibrium(x) == Feed(x)));
    pp = [pp double(Equilibrium(pp))];
%------------- END OF CODE --------------
end

function q_line = qLine(FeedComp, q)
%q_line - Returns q-line from McCabe Thiele method
%
% Syntax: rectLine = Rectifying(Distillate, Reflux)
%
% Long description !!
    syms q_line(x)
    if(q==1)
        q = q+1e-15;
    end
    q_line(x) = q*x/(q-1) - FeedComp/(q-1);
    return q_line
end

function Rmin = minimumReflux(FeedComp, q, Distillate)
% minimumReflux - Calculates mimimum reflux given a q value, feed composition 
% and distillate composition
%
% Syntax: Rmin = minimumReflux(FeedComp, q, Distillate)
%
% Long description !!
    
end

function rectLine = Rectifying(Distillate, Reflux)
%Rectifying - Returns rectifying line from McCabe Thiele method
%
% Syntax: rectLine = Rectifying(Distillate, Reflux)
%
% Long description !!

    syms rectLine(x)
    rectLine(x) = Reflux*x/(Reflux+1) + Distillate/(Reflux+1);
end

function Strip = StripWBottomsBoilup(Bottoms, Boilup)

    syms Strip(x)
    Strip(x) = (Boilup+1)*x/Boilup-Bottoms/Boilup;
end

function Strip = StripWPinchBottoms(PinchPoint,Bottoms)
%myFun - Description
%
% Syntax: Strip = StripWPinchBottoms(PinchPoint,Bottoms)
%
% Long description !!

    syms Strip(x)
    slope = (PinchPoint(2)-Bottoms)/(PinchPoint(1)-Bottoms);
    Strip(x) = slope*(x-Bottoms)+Bottoms;
end

function eqStages = mcCabe(Bottoms,Distillate,Feed,Q,Rmin,Model);
%eqStages - receives strip line, rectifying line and equilibrium line and plots
% them and returns number of equilibrium stages according to the McCabe Thiele
% method.
%
% Syntax: eqStages = mcCabe(Bottoms, Distillate, Feed, Q, Model);
%
% Long description !!
    
    
        
    
end