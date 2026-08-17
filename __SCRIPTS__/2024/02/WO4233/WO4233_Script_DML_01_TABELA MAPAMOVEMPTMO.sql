update MAPAMOVEMPTMO 
	set 
    	DTPERIODOINICIAL = trunc(dataref,'MM'), 
	    DTPERIODOFINAL = last_day(dataref);