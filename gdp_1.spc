#D:\X13ARIMA\Data\gdp.spc was created on 23/03/2020 12:15:34
#Created using X-13A-S version 1.1 build 39

series{ 
    file = "gdp.txt"
    period = 4
    format = free
    start = 1993.01
}
transform{ 
    function = log
}
regression{ 
    variables = ( Lpyear   easter[3]  LS1995.1 LS1995.2 LS2009.1 TC2009.2 )
    #aictest = ( td easter )
    #savelog = aictest
}
outlier{ 
    types = ( AO LS TC )
}
arima{ 
    model = (0 1 0)(0 1 1)
}
forecast{ 
    maxlead = 4
    print = none
}
estimate{ 
    print = (roots regcmatrix acm)
    savelog = (aicc aic bic hq afc)
}
check{ 
    print = all
    savelog = (lbq nrm)
}
x11{ 
    seasonalma = s3x3
    savelog = all
}
slidingspans{ 
    savelog = percent
    additivesa = percent
}
history{ 
    estimates = (fcst aic sadj sadjchng trend trendchng)
    savelog = (asa ach atr atc)
}
