<<<<<<< HEAD
clc
clear
% Only the ice graphical interface is displayed.   
f=imread("28.png");
% Shows and returns the mapped image g.
g = ice('image', f);   
% % Shows g and returns the handle. 
% g = ice('image', f, 'wait', 'off’);
% % Maps RGB image f in HSI space.
=======
clc
clear
% Only the ice graphical interface is displayed.   
f=imread("28.png");
% Shows and returns the mapped image g.
g = ice('image', f);   
% % Shows g and returns the handle. 
% g = ice('image', f, 'wait', 'off’);
% % Maps RGB image f in HSI space.
>>>>>>> 8616116aedaa6bdbb3c691c92d9bd8ce141bff0e
% g = ice('image', f, 'space', 'hsi');