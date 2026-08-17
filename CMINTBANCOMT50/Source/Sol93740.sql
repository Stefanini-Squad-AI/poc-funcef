begin
 for a in (SELECT p.NUMEMPRESABANCO,s.ControleRemessa
           FROM PORTADORFORMA P,
                SEQREMESSA S
           WHERE CODPORTFORMA = 104
             AND IDPESSOA = 1
             AND P.NUMEMPRESABANCO = S.NUMEMPRESABANCO) loop
   execute immediate 'Create Sequence SEQREMESSA'||a.numempresabanco||' minvalue 1 start with '||a.controleremessa||' increment by 1 nocache';
   execute immediate 'Create public synonym SEQREMESSA'||a.numempresabanco||' for SEQREMESSA'||a.numempresabanco;
 end loop;
end;
