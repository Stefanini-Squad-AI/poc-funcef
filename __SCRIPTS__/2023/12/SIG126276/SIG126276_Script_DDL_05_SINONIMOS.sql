-- drop public synonym CM
create public synonym MOVDIVIDA    for CM.MOVDIVIDA; 
create public synonym SEQMOVDIVIDA for CM.SEQMOVDIVIDA; 

create public synonym TIPOMOVDIVIDA    for CM.TIPOMOVDIVIDA; 
create public synonym SEQTIPOMOVDIVIDA for CM.TIPOSEQMOVDIVIDA; 

-- drop public synonym LOG_PLANUS
create public synonym LOG_PLANUS_MOVDIVIDA   for LOGPLANUS.LOG_PLANUS_MOVDIVIDA; 
create public synonym SEQLOGPLANUS_MOVDIVIDA for LOGPLANUS.SEQLOGPLANUS_MOVDIVIDA; 