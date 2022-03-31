function dydt = ode_simple_mRNA_atc(t,c,k,delta)
    a_p28=k(1); a_pLtetO1=k(2); %nM/s
    k_TL = k(3); % 1/s
    t_m = k(4); % 1/s
    K_s28=k(5); K_tetR=k(6); %nM
    n_s28=k(7); n_tetR=k(8); 
    kp_aTc = 1000; km_aTc = 1;
    
    mS28=c(1); mTetR=c(2);
    
    S28=c(3); TetR=c(4);
    
    mV=c(5); mT=c(6);
    
    aTc=c(7); TetRaTc = c(8);

    d_mS28_dt = a_pLtetO1./(1+(TetR/K_tetR).^n_tetR)-mS28/t_m-delta*mS28;
    d_mTetR_dt = a_p28./(1+(K_s28/S28).^n_s28)-mTetR/t_m-delta*mTetR;
    
    d_S28_dt = k_TL*mS28 -delta*S28;
    d_TetR_dt = k_TL*mTetR -kp_aTc*aTc*TetR -delta*TetR;
    
    
    d_mV = k_TL*mS28-delta*mV;
    d_mT = k_TL*mTetR-delta*mT;
    
    
    d_aTc_dt = -kp_aTc*aTc*TetR -delta*aTc;
    d_TetRaTc_dt = +km_aTc*TetRaTc -delta*TetRaTc;
    
    dydt=[d_mS28_dt;d_mTetR_dt;d_S28_dt;d_TetR_dt;d_mV;d_mT;d_aTc_dt;d_TetRaTc_dt];
end

