declare

  -- variaveis
  ind         number;
  vMenuPai    number; 
  vModulo     number;
  vFuncao     number;
  vObjeto     number;
  vOperFunc   number;
  vForm       number;
  vOperacao   number;
  vMenuFiltro number;
  
 CURSOR crSubMenu  IS
    SELECT M.MENU, M.NOME, M.NOMEOBJ ,M.ORDEM, M.OP FROM (
     SELECT 1 as menu, 0 as op,'Dados Pessoais'     as nome, 'DadosPessoais' as nomeobj, 1 AS ORDEM from dual  union
     SELECT 1 as menu, 0 as op, 'Documentos'         as nome, 'Documentos'    as nomeobj, 2 AS ORDEM from dual  union
     SELECT 1 as menu, 0 as op, 'Enderecos'          as nome, 'Enderecos'     as nomeobj, 3 AS ORDEM from dual  union
     SELECT 1 as menu, 0 as op, 'Telefones'          as nome, 'Telefones'     as nomeobj, 4 AS ORDEM from dual  union
     SELECT 1 as menu, 0 as op,'Contatos'           as nome, 'Contatos'      as nomeobj, 5 AS ORDEM from dual  union
     SELECT 1 as menu, 0 as op,'Contas Bancárias'   as nome, 'ContasBancrias'as nomeobj, 6 AS ORDEM from dual  union
     SELECT 1 as menu, 0 as op, 'Dependentes'        as nome, 'Dependentes'   as nomeobj, 7 AS ORDEM from dual  union
     SELECT 1 as menu, 0 as op, 'Ação Judicial'      as nome, 'AoJudicial'    as nomeobj, 8 AS ORDEM from dual  union
     SELECT 1 as menu, 0 as op, 'Outras Informações' as nome, 'OutrasInformaes1' as nomeobj, 9 AS ORDEM from dual  union
     SELECT 2 as menu, 0 as op, 'Dados Basicos'      as nome, 'DadosBasicos'             as nomeobj, 1 AS ORDEM from dual  union
     SELECT 2 as menu, 0 as op, 'Evolucao Funcional' as nome, 'EvolucaoFuncional'        as nomeobj, 2 AS ORDEM from dual  union
     SELECT 2 as menu, 0 as op, 'Historico Funcional' as nome, 'HistoricoFuncional' as nomeobj, 3 AS ORDEM from dual  union
     SELECT 2 as menu, 1 as op, 'Rubricas Salariais' as nome, 'RubricasSalariais' as nomeobj, 4 AS ORDEM from dual  union	 
     SELECT 2 as menu, 0 as op, 'Dados para Enquadramento' as nome, 'Dadosparaenquadramento1' as nomeobj, 5 AS ORDEM from dual  union
     SELECT 3 as menu, 0 as op, 'Eventos'            as nome, 'Eventos'        as nomeobj, 1 AS ORDEM from dual  union
     SELECT 3 as menu, 0 as op, 'Protocolos'         as nome, 'Protocolos'     as nomeobj, 2 AS ORDEM from dual  union
     SELECT 3 as menu, 0 as op, 'Processos Rad'      as nome, 'ProcessosRad'   as nomeobj, 3 AS ORDEM from dual  union
     SELECT 3 as menu, 0 as op, 'RUB'                as nome, 'RUB'            as nomeobj, 4 AS ORDEM from dual  union
     SELECT 3 as menu, 0 as op, 'Contribuições'      as nome, 'Contribuicoes'  as nomeobj, 5 AS ORDEM from dual  union
     SELECT 3 as menu, 0 as op, 'Benefícios'         as nome, 'Beneficios'     as nomeobj, 6 AS ORDEM from dual  union
     SELECT 3 as menu, 0 as op, 'Pagamentos'         as nome, 'Pagamentos'     as nomeobj, 7 AS ORDEM from dual  union
     SELECT 3 as menu, 0 as op, 'Contra-Cheque'      as nome, 'ContraCheque'   as nomeobj, 8 AS ORDEM from dual  union
     SELECT 3 as menu, 0 as op, 'Beneficiários'      as nome, 'Beneficiarios'  as nomeobj, 9 AS ORDEM from dual  union
     SELECT 3 as menu, 0 as op, 'Enquadramento'      as nome, 'Enquadramento'  as nomeobj, 10 AS ORDEM from dual  union
     SELECT 3 as menu, 0 as op, 'Emprestimo'         as nome, 'Emprestimo'     as nomeobj, 11 AS ORDEM from dual  union
     SELECT 3 as menu, 0 as op, 'Planos'             as nome, 'Planos2'        as nomeobj, 12 AS ORDEM from dual  union
     SELECT 3 as menu, 0 as op, 'Portabilidade'      as nome, 'Portabilidade1' as nomeobj, 13 AS ORDEM from dual  	 
     
    ) M
    WHERE M.MENU = vMenuFiltro
    order by M.ORDEM;    
   
  -- criando os tipos
  type   T_MenuMainC  is Varray(4) of number;
  type   T_MenuMainD  is Varray(4) of varchar2(20); 

  -- instanciando vetores
  aMenuMainD T_MenuMainD := T_MenuMainD('Agenda Pessoal', 'Vida funcional', 'Vida No Plano', 'Vida na Fundação');
  aMenuMainC T_MenuMainC := T_MenuMainC(0,0,0,0);
    
  rSubMenu    crSubMenu%RowType;

begin

  vMenuPai  := 26626;
  vModulo   := 452;
  vForm     := 0;
  vOperacao := 1;   
         
  --=====================================================================
  -- CRIACAO DO FORM
  --===================================================================== 
 
  -- Validação da Variavel Sequencial da Tabela Formularios
  Begin
    -- Select
    Select IdForm into vForm From cm.Form
    where NomeForm = 'FRMconspart' and IdModulo = vModulo; 
    -- Exception
    EXCEPTION WHEN OTHERS THEN vForm := -1;
    -- Criação do Registro
    If vForm = -1 then
      Select Max(IdForm)+1 Into vForm From cm.Form;
      Insert Into cm.Form(Idform,Nomeform,Idmodulo,Descform)
                values(vForm,'FRMconspart',vModulo,'Consulta Geral Pessoa');
    End If;
  End;
  
  --=====================================================================
  -- MENU PRINCIPAL
  --=====================================================================  
  for ind in aMenuMainD.first .. aMenuMainD.last  loop
  
    -- Validação da Variavel Sequencial da Tabela Funcao
    Begin
      -- Select
      Select Idfuncao Into vFuncao From cm.Funcao
      where NomeFuncao =  Trim(aMenuMainD(ind))
        and IdModulo = vModulo and IdFuncaoPai = vMenuPai;
      -- Exception
      EXCEPTION WHEN OTHERS THEN vFuncao := -1;
      -- Criação do Registro
      If vFuncao = -1 then
        select max(idfuncao)+1 into vFuncao from cm.funcao;
        insert into cm.funcao(IDFUNCAO,NOMEFUNCAO,IDMODULO,IDFUNCAOPAI) values (vFuncao, Trim(aMenuMainD(ind)), vModulo, vMenuPai);
     
      End If;
    End;     

    -- guarda o código da funcao menu criada
    aMenuMainC(ind) := vFuncao;
   
  end loop;
         
  --=====================================================================
  -- SUB MENU PRINCIPAL
  --=====================================================================    
  for ind in aMenuMainC.first .. aMenuMainC.last  loop
  
    vMenuPai    := aMenuMainC(ind);
    vMenuFiltro := ind;
   
    open crSubMenu;
    loop
      fetch crSubMenu
        into rSubMenu;
      exit when crSubMenu%notfound;
        

      if rSubMenu.op = 1 then

         -- Validação se SubMenu ja foi criado
         Begin
           -- Select
           Select f.Idfuncao, op.IdOperFunc Into vFuncao, vOperFunc
             From cm.Funcao f
             join cm.OperFunc op on op.idfuncao   = f.idfuncao
             join cm.FrObFnOp ff on ff.idoperfunc = op.idoperfunc
            where f.NomeFuncao = rSubMenu.Nome
              and f.IdModulo   = vModulo;
           -- Exception
           EXCEPTION WHEN OTHERS THEN vFuncao := -1;
         End;     
		    				   		   		
         if vFuncao <> -1 then	 
    	    update cm.FUNCAO set IDFUNCAOPAI = vMenuPai
               where  (IDFUNCAO = vFuncao) ;
								
	        update cm.FROBFNOP set IDFORM = vForm 
	           where  (IDOPERFUNC = vOperFunc);
			
	     end if;	      
      
      else

        -- Validação se SubMenu ja foi criado
        Begin
          -- Select
          Select Idfuncao Into vFuncao From cm.Funcao
          where NomeFuncao =  rSubMenu.Nome
            and IdModulo = vModulo and IdFuncaoPai = vMenuPai;
          -- Exception
          EXCEPTION WHEN OTHERS THEN vFuncao := -1;
        End;     
       
        if vFuncao = -1 then        
        
          -- criar submenu
          select max(idfuncao)+1 into vFuncao from cm.funcao;
          insert into cm.funcao (IDFUNCAO,NOMEFUNCAO,IDMODULO,IDFUNCAOPAI) values (vFuncao, rSubMenu.Nome, vModulo, vMenuPai);
  
          -- criar objeto
          Select Max(IdObjeto) + 1 into vObjeto From cm.objeto;
          insert into cm.OBJETO(IDOBJETO,NOMEOBJETO) values (vObjeto, rSubMenu.NomeObj);
      
          -- opercao
          Select seqfrobfnop.nextval Into vOperFunc from dual;
          Select seqoperfunc.nextval Into vOperFunc from dual;
          --select Max(IdOperFunc)+1 Into vOperFunc from cm.OperFunc;
          insert Into cm.Operfunc(idOperfunc,Idmodulo,Idoperacao,Idfuncao)
            values(vOperFunc, vModulo, vOperacao, vFuncao);
     
          -- formxobj funcaoxoperacao
          insert into cm.frobfnop(idOperfunc,idobjeto,idform)
            values(vOperFunc, vObjeto, vForm);     

        end if;       
      end if;
    
    end loop;
		
	close crSubMenu;

  end loop;
  
  --=====================================================================
  -- Vida na Fundação - OBJETO
  --===================================================================== 
  BEGIN
   Select Idfuncao Into vFuncao From cm.Funcao
   where NomeFuncao =  'Vida na Fundação'
     and IdModulo = vModulo ;
	 
   Select IdObjeto Into vObjeto From cm.OBJETO
   where NOMEOBJETO =  'VidaNaFundao1';
   -- Exception
   EXCEPTION WHEN OTHERS THEN vObjeto := -1;	 
     if vObjeto = -1 then 
     	 
        -- criar objeto
        Select Max(IdObjeto) + 1 into vObjeto From cm.objeto;
        insert into cm.OBJETO(IDOBJETO,NOMEOBJETO) values (vObjeto, 'VidaNaFundao1');
        
        -- opercao
        Select seqfrobfnop.nextval Into vOperFunc from dual;
        Select seqoperfunc.nextval Into vOperFunc from dual;
        --select Max(IdOperFunc)+1 Into vOperFunc from cm.OperFunc;
        insert Into cm.Operfunc(idOperfunc,Idmodulo,Idoperacao,Idfuncao)
        values(vOperFunc, vModulo, vOperacao, vFuncao);
     
        -- formxobj funcaoxoperacao
        insert into cm.frobfnop(idOperfunc,idobjeto,idform)
        values(vOperFunc, vObjeto, vForm);
		
  	  end if;	
   end;
    
   --Commit;

end;



