T1 = 1.1;
k1 = 1.4;
T = 0.5;
T_vec = [0.1:0.01:0.19, 0.2:0.1:5.0];
k = 1;

w1 = tf(k);
w2 = tf(k1, [T1, 1]);
w3 = tf(1, [T, 1]);
w4 = tf(1, [1, 0]);

sys = w1 * w2 * w3 * w4;
sys_fb = feedback(sys, tf(1),-1);