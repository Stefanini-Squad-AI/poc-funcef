unit ULayoutAss;

interface

Uses wwQuery, SysUtils;

Const
{
  NTabelas = 2; (* Total de tabelas *)
  TabTabelas: Array[0..NTabelas] Of String[28] = ('CAPSEGASS','PARTASS','TMPDESC');
  TabChaves : Array[0..NTabelas] Of String[28] = ('IDCAPSEGASS','','');
  TabDescOrigem: Array[0..NTabelas] Of String[57] = ('Tabela de Capitais de Seguro',
    'Informações diversas dos Participantes','Informações para cobrança em Folha da Patrocinadora');
  TabTipo : Array[0..NTabelas] Of Char = ('I','E','E');
                                         //I=Importação,E=Exportação
}

  NTabelas = 1; (* Total de tabelas *)
  TabTabelas: Array[0..NTabelas] Of String[28] = ('CAPSEGASS','PARTASS');
  TabChaves : Array[0..NTabelas] Of String[28] = ('IDCAPSEGASS','');
  TabDescOrigem: Array[0..NTabelas] Of String[57] = ('Tabela de Capitais de Seguro',
    'Informações diversas dos Participantes');
  TabTipo : Array[0..NTabelas] Of Char = ('I','E');
                                         {I=Importação,E=Exportação}


  (* DEFINICOES DA TABELA DE CAPITAIS DE SEGURO - CAPSEGASS *)
  NCp0 = 10;
  TabCampos0   : Array[0..NCp0] Of String[10] = ('DESCPLANO','TIPOSEG','CAPITALMN',
                 'CAPITALIP','CAPITALMA','PREMIOFXA','PREMIOFXB','PREMIOFXC','PREMIOFXD',
                 'DTVIGENCIA','ORDEM');

  TabCamposFan0: Array[0..NCp0] Of String[40] = ('Descrição do Plano',
                 'Tipo de Segurado(TITULAR,CÔNJUGE,FILHOS)',
                 'Capital Morte Natural','Capital Invalidez Permanente',
                 'Capital Morte Acidental','Prêmio Faixa A (Até 39 Anos)',
                 'Prêmio Faixa B (De 40 a 49 Anos)','Prêmio Faixa A (De 50 a 59 Anos)',
                 'Prêmio Faixa A (Acima de 60 Anos)','Data Início da Vigência','');

  (* DEFINICOES DA QRY INFORMAÇÕES DIVERSAS DOS PARTICIPANTES *)
  NCp1 = 48;

  TabCampos1   : Array[0..NCp1] Of String[17] = ('MATRICULA','DIGITO_MATRICULA',
                 'DATAADMISSAO','DIA_ADMISSAO','MES_ADMISSAO','ANO_ADMISSAO',
                 'SEXO','COD_SEXO','ESTADOCIVIL','COD_ESTADOCIVIL','INSCRICAONUMERO',
                 'TITULAR','CPF','PATROCINADORA','BENEFICIARIO','DATANASC',
                 'DIA_DATANASC','MES_DATANASC','ANO_DATANASC','MES_REFERENCIA',
                 'ANO_REFERENCIA','MES_COBRANCA','ANO_COBRANCA','PREMIO_AP','PREMIO_VG',
                 'VALORESPERADO','VALORRECEBIDO','TIPODESCONTO','DATAENTRADA',
                 'DIA_DATAENTRADA','MES_DATAENTRADA','ANO_DATAENTRADA',
                 'SITPLANOASSIST','SITUACAOPRINCIPAL','PLANOPREV','CONTRIBUICAO',
                 'PRODUTO','PLANO','TIPOSEGURADO','CAPITALMN','CAPITALIP','LOGRADOURO',
                 'NUMERO','COMPLEMENTO','BAIRRO','CIDADE','UF','CEP','CEP_FORMATADO');


  TabCamposFan1: Array[0..NCp1] Of String[40] = ('Matrícula do Titular',
                 'Dígito da Matrícula do Titular','Data de Admissão',
                 'Dia da Data de Admissão','Mês da Data de Admissão','Ano da Data de Admissão',
                 'Sexo do Titular','Cód. do Sexo do Titular','Estado Civil do Titular',
                 'Cód. do Estado Civil','Inscrição do Titular','Nome do Titular',
                 'CPF do Titular','Nome da Patrocinadora','Nome do Beneficiário',
                 'Data de Nascimento do Titular','Dia da Data de Nascimento',
                 'Mês da Data de Nascimento','Ano da Data de Nascimento',
                 'Mês de Referência','Ano de Referência','Mês de Cobrança','Ano de Cobrança',
                 'Prêmio AP','Prêmio VG',
                 'Valor Esperado','Valor Recebido','Cód. Desconto em Folha ou Banco',
                 'Data de Entrada no Plano Assistencial','Dia de Entrada no Plano Assistencial',
                 'Mês de Entrada no Plano Assistencial','Ano de Entrada no Plano Assistencial',
                 'Situação no Plano Assistencial','Situação Principal','Plano Prev.',
                 'Contribuição','Produto Assistencial','Plano Assistencial',
                 'Cód. Tipo de Segurado Titular','Capital Morte Natural','Capital Invalidez Permanente',
                 'Endereço do Titular','Número do Endereço','Complemento do Endereço','Bairro',
                 'Cidade','UF','CEP','CEP Formatado');

  NCp2 = 5;

  TabCampos2   : Array[0..NCp2] Of String[19] = ('MESCOBRANCA','MES_COBRANCA',
                 'ANO_COBRANCA','TOTALREG','TOTAL_VALORESPERADO','TOTAL_VALORRECEBIDO');

  TabCamposFan2: Array[0..NCp2] Of String[40] = ('Ano/Mês de Cobrança','Mês de Cobrança',
                 'Ano de Cobrança','Total de Registros','Total do Valor Esperado',
                 'Total do Valor Recebido');


  (* DEFINICOES DA QRY INFORMAÇÕES PARA COBRANÇA EM FOLHA DA PATROCINADORA

  NCp3 = 6;

  TabCampos3   : Array[0..NCp3] Of String[17] = ('MATRICULA','DIGITO_MATRICULA',
                 'MES_COBRANCA','ANO_COBRANCA','MES_REFERENCIA','ANO_REFERENCIA',
                 'VALOR');

  TabCamposFan3: Array[0..NCp3] Of String[40] = ('Matrícula do Titular',
                 'Dígito da Matrícula do Titular','Mês de Cobrança',
                 'Ano de Cobrança','Mês de Referência','Ano de Referência',
                 'Valor do Desconto');
 *)

Var NumOrdemRg: Integer;

Function ModifTabela(sTab:String): Boolean;
Procedure BuscaInformacoes(Var pQuery:TwwQuery;pIdPessJur,pMesCob,pIdProdass,pIdPlanass:String);
Procedure BuscaAcumuloInformacoes(Var pQuery:TwwQuery;pIdPessJur,pMesCob,pIdProdass,pIdPlanass:String);
{Procedure BuscaInfEnvioPatro(Var pQuery:TwwQuery;pIdPessJur,pMesCob:String);}

implementation

Uses DBaseDados, uMensErro, uSistema;

Function ModifTabela(sTab:String): Boolean;
Var  QryMod: TwwQuery;

begin
  (* Tabela de Capitais de Seguro *)
  (* Se FlgVigencia = 1, "tabela de capitais vigente" *)
  NumOrdemRg:=0;
  If sTab='CAPSEGASS' then
  begin
    NumOrdemRg:=1; (* Indica que vai usar na inclusão o campo ordem da tabela capsegass *)
    QryMod:=TwwQuery.Create(Nil);
    If not dtmBaseDados.dbBaseDados.InTransaction then
     dtmBaseDados.dbBaseDados.StartTransaction;
    With qryMod do
    begin
      Close;
      DataBaseName:='BaseDados';
      SQL.Clear;
      SQL.Add('UPDATE CAPSEGASS SET FLGVIGENCIA=''0''');
      try
        ExecSQL;
      except
        Result:=False;
        dtmBaseDados.dbBaseDados.Rollback;
        qryMod.Free;
        Exit;
      end;
      dtmBaseDados.dbBaseDados.Commit;
    end; {With}
    qryMod.Free;
  end;
  Result:=True;
end;

(* Anterior com informações de endereço
Procedure BuscaInformacoes(Var pQuery:TwwQuery;pIdPessJur,pMesCob,pIdProdass,pIdPlanass:String);
Const TaxaPercAp = '0.000252'; {Taxa para cálculo do Prëmio AP}
Var sSql: String;
begin
  If pIdPessJur='' then Abort;
  pQuery.Close;
  pQuery.Sql.Clear;
  sSql:=
    'SELECT '+
    ' SUBSTR(EL.MATRICULA,1,8) AS MATRICULA, '+
    ' SUBSTR(EL.MATRICULA,10,1) AS DIGITO_MATRICULA, '+
    ' TO_CHAR(EL.DATAADMISSAO,''DD/MM/YYYY'') AS DATAADMISSAO, '+
    ' SUBSTR(TO_CHAR(EL.DATAADMISSAO,''DD/MM/YYYY''),1,2) AS DIA_ADMISSAO, '+
    ' SUBSTR(TO_CHAR(EL.DATAADMISSAO,''DD/MM/YYYY''),4,2) AS MES_ADMISSAO, '+
    ' SUBSTR(TO_CHAR(EL.DATAADMISSAO,''DD/MM/YYYY''),7,4) AS ANO_ADMISSAO, '+
    ' PF.ESTCIVIL, '+
    ' PF.SEXO, '+
    ' DECODE(PF.SEXO,''M'',''1'',''F'',''2'') AS COD_SEXO, '+
    ' DECODE(PF.ESTCIVIL,''S'',''1'',''C'',''2'',''V'',''3'',''D'',''4'','' '') AS COD_ESTADOCIVIL, '+
    ' PV.INSCRICAONUMERO, '+
    ' PE.NOME AS TITULAR, '+
    ' SUBSTR(PE.NUMDOCUMENTO,1,11) AS CPF, '+
    ' PJ.NOME AS PATROCINADORA, '+
    ' BN.NOME AS BENEFICIARIO, '+
    ' TO_CHAR(PF.DATANASC,''DD/MM/YYYY'') AS DATANASC, '+
    ' SUBSTR(TO_CHAR(PF.DATANASC,''DD/MM/YYYY''),1,2) AS DIA_DATANASC, '+
    ' SUBSTR(TO_CHAR(PF.DATANASC,''DD/MM/YYYY''),4,2) AS MES_DATANASC, '+
    ' SUBSTR(TO_CHAR(PF.DATANASC,''DD/MM/YYYY''),7,4) AS ANO_DATANASC, ';

  If pMesCob<>'' then
   sSql:=sSql+
      ' SUBSTR(HT.MES,1,4) AS ANO_REFERENCIA, '+
      ' SUBSTR(HT.MES,6,2) AS MES_REFERENCIA, '+
      ' SUBSTR(HT.MESCOBRANCA,1,4) AS ANO_COBRANCA, '+
      ' SUBSTR(HT.MESCOBRANCA,6,2) AS MES_COBRANCA, '+
      ' DECODE(HT.FLGCOBCARNE,1,''4'',''2'') AS TIPODESCONTO, '+
      ' CP.CAPITALMN * '+TaxaPercAp+' AS PREMIO_AP, '+
      ' HT.VALORESPERADO - (CP.CAPITALMN * '+TaxaPercAp+') AS PREMIO_VG, '+
      ' HT.VALORESPERADO, '+
      ' HT.VALORRECEBIDO, '
  else
    sSql:=sSql+
      Chr(39)+' '+Chr(39)+' AS ANO_REFERENCIA, '+
      Chr(39)+' '+Chr(39)+' AS MES_REFERENCIA, '+
      Chr(39)+' '+Chr(39)+' AS ANO_COBRANCA, '+
      Chr(39)+' '+Chr(39)+' AS MES_COBRANCA, '+
      Chr(39)+' '+Chr(39)+' AS TIPODESCONTO, '+
      '0 AS PREMIO_AP, '+
      '0 AS PREMIO_VG, '+
      '0 AS VALORESPERADO, '+
      '0 AS VALORRECEBIDO, ';

  sSql:=sSql+
    ' TO_CHAR(PT.DATAENTRADA,''DD/MM/YYYY'') AS DATAENTRADA, '+
    ' SUBSTR(TO_CHAR(PT.DATAENTRADA,''DD/MM/YYYY''),1,2) AS DIA_ENTRADA, '+
    ' SUBSTR(TO_CHAR(PT.DATAENTRADA,''DD/MM/YYYY''),4,2) AS MES_ENTRADA, '+
    ' SUBSTR(TO_CHAR(PT.DATAENTRADA,''DD/MM/YYYY''),7,4) AS ANO_ENTRADA, '+
    ' SP.DESCRICAO AS SITPLANOASSIST, '+
    ' ST.DESCRICAO AS SITUACAOPRINCIPAL, '+
    ' PR.NOME AS PLANOPREV, '+
    ' CN.NOME AS CONTRIBUICAO, '+
    ' PD.NOME AS PRODUTO, '+
    ' PL.NOME AS PLANO, '+
    ' ''1'' AS TIPOSEGURADO, '+
    ' CP.CAPITALMN, '+
    ' CP.CAPITALIP, '+
    ' EP.LOGRADOURO, '+
    ' EP.NUMERO, '+
    ' EP.COMPLEMENTO, '+
    ' EP.BAIRRO, '+
    ' EP.CODESTADO AS UF, '+
    ' EP.CEP, '+
    ' SUBSTR(EP.CEP,1,5)||''-''||SUBSTR(EP.CEP,6,3) AS CEP_FORMATADO, '+
    ' CD.NOME AS CIDADE '+
    ' FROM PARTASS PT, '+
    ' PESSOA PE, '+
    ' PESSOA PJ, '+
    ' PESSOA BN, '+
    ' PESSOAFISICA PF, '+
    ' PARTPREVPLAN PV, '+
    ' ELEGPATRO EL, ';
  If pMesCob<>'' then
   sSql:=sSql+
    ' HSTCONTRIBASS HT, ';
  sSql:=sSql+
    ' BENEFASS BF, '+
    ' CONTASS CT, '+
    ' SITPLANOASS SP, '+
    ' PLANPREV PR, '+
    ' SITPART ST, '+
    ' CONTRIBUICAO CN, '+
    ' PRODASS PD, '+
    ' PLANASS PL, '+
    ' ENDPESS EP, '+
    ' CIDADES CD, '+
    ' CAPSEGASS CP '+
    ' WHERE '+
    ' PT.IDPESSOA = PV.IDPESSOA AND '+
    ' PT.IDPESSJUR = PV.IDPESSJUR AND '+
    ' PT.IDPESSOA = EL.IDPESSOA AND '+
    ' PT.IDPESSJUR = EL.IDPESSJUR AND '+
    ' PT.IDPESSOA = PE.IDPESSOA AND '+
    ' PT.IDPESSOA = PF.IDPESSOA AND '+
    ' PT.IDPESSOA = EP.IDPESSOA(+) AND ';
  If pIdPessJur<>'' then
   sSql:=sSql+
    ' PT.IDPESSJUR = '+pIdPessJur+' AND ';
  sSql:=sSql+
    ' PT.IDPESSJUR = PJ.IDPESSOA AND '+
    ' PT.IDPESSOA = BF.IDTITULAR AND '+
    ' PT.IDPESSOA = CT.IDTITULAR AND '+
    ' PT.IDSITPART = SP.IDSITPLANOASS AND '+
    ' PT.IDPLANOPREV = PR.IDPLANOPREV AND '+
    ' PT.FLGINSCRICAOCANC = ''0'' AND '+
    ' PV.IDPESSOA = PF.IDPESSOA AND '+
    ' PV.IDPESSOA = BF.IDTITULAR AND '+
    ' PV.IDPESSJUR = PJ.IDPESSOA AND '+
    ' PV.IDSITPART = ST.IDSITPART AND '+
    ' PV.IDPLANOPREV = PR.IDPLANOPREV AND '+
    ' BF.FLGATIVO = ''1'' AND '+
    ' BF.IDDEPENDENTE = BN.IDPESSOA AND '+
    ' BF.IDTITULAR = CT.IDTITULAR AND ';
  If pMesCob<>'' then
   sSql:=sSql+
    ' HT.MESCOBRANCA = '+Chr(39)+pMesCob+Chr(39)+' AND '+
    ' HT.IDTITULAR = PT.IDPESSOA AND '+
    ' HT.IDPLANASS = PL.IDPLANASS AND ';
  If pIdPlanass<>'' then
   sSql:=sSql+'PL.IDPLANASS = '+pIdPlanass+' AND ';
  If pIdProdass<>'' then
   sSql:=sSql+' PD.IDPRODASS = '+pIdProdass+' AND ';
  sSql:=sSql+
    ' PD.IDPRODASS = PL.IDPRODASS AND '+
    ' CT.FLGATIVO = ''1'' AND '+
    ' CT.IDCONTASS = CN.IDCONTRIBUICAO AND '+
    ' CT.IDPLANASS = PL.IDPLANASS AND '+
    ' CT.IDPLANASS = CP.IDPLANASS(+) AND '+
    ' CP.TIPOSEG(+) = '+Chr(39)+'TITULAR'+Chr(39)+' AND '+
    ' EP.IDCIDADES = CD.IDCIDADES(+) '+
    ' ORDER BY EL.MATRICULA ';
  pQuery.Sql.Add(sSql);
  pQuery.Open;
end;
*)

Procedure BuscaInformacoes(Var pQuery:TwwQuery;pIdPessJur,pMesCob,pIdProdass,pIdPlanass:String);
Const TaxaPercAp = '0.000252'; {Taxa para cálculo do Prëmio AP}
Var sSql: String;
begin
  If pIdPessJur='' then Abort;
  pQuery.Close;
  pQuery.Sql.Clear;
  sSql:=
    'SELECT '+
    ' SUBSTR(EL.MATRICULA,1,8) AS MATRICULA, '+
    ' SUBSTR(EL.MATRICULA,10,1) AS DIGITO_MATRICULA, '+
    ' TO_CHAR(EL.DATAADMISSAO,''DD/MM/YYYY'') AS DATAADMISSAO, '+
    ' SUBSTR(TO_CHAR(EL.DATAADMISSAO,''DD/MM/YYYY''),1,2) AS DIA_ADMISSAO, '+
    ' SUBSTR(TO_CHAR(EL.DATAADMISSAO,''DD/MM/YYYY''),4,2) AS MES_ADMISSAO, '+
    ' SUBSTR(TO_CHAR(EL.DATAADMISSAO,''DD/MM/YYYY''),7,4) AS ANO_ADMISSAO, '+
    ' PF.ESTCIVIL, '+
    ' PF.SEXO, '+
    ' DECODE(PF.SEXO,''M'',''1'',''F'',''2'') AS COD_SEXO, '+
    ' DECODE(PF.ESTCIVIL,''S'',''1'',''C'',''2'',''V'',''3'',''D'',''4'','' '') AS COD_ESTADOCIVIL, '+
    ' PV.INSCRICAONUMERO, '+
    ' PE.NOME AS TITULAR, '+
    ' SUBSTR(PE.NUMDOCUMENTO,1,11) AS CPF, '+
    ' PJ.NOME AS PATROCINADORA, '+
    ' BN.NOME AS BENEFICIARIO, '+
    ' TO_CHAR(PF.DATANASC,''DD/MM/YYYY'') AS DATANASC, '+
    ' SUBSTR(TO_CHAR(PF.DATANASC,''DD/MM/YYYY''),1,2) AS DIA_DATANASC, '+
    ' SUBSTR(TO_CHAR(PF.DATANASC,''DD/MM/YYYY''),4,2) AS MES_DATANASC, '+
    ' SUBSTR(TO_CHAR(PF.DATANASC,''DD/MM/YYYY''),7,4) AS ANO_DATANASC, ';

  If pMesCob<>'' then
   sSql:=sSql+
      ' SUBSTR(HT.MES,1,4) AS ANO_REFERENCIA, '+
      ' SUBSTR(HT.MES,6,2) AS MES_REFERENCIA, '+
      ' SUBSTR(HT.MESCOBRANCA,1,4) AS ANO_COBRANCA, '+
      ' SUBSTR(HT.MESCOBRANCA,6,2) AS MES_COBRANCA, '+
      ' DECODE(HT.FLGCOBCARNE,1,''4'',''2'') AS TIPODESCONTO, '+
      ' CP.CAPITALMN * '+TaxaPercAp+' AS PREMIO_AP, '+
      ' HT.VALORESPERADO - (CP.CAPITALMN * '+TaxaPercAp+') AS PREMIO_VG, '+
      ' HT.VALORESPERADO, '+
      ' HT.VALORRECEBIDO, '
  else
    sSql:=sSql+
      Chr(39)+' '+Chr(39)+' AS ANO_REFERENCIA, '+
      Chr(39)+' '+Chr(39)+' AS MES_REFERENCIA, '+
      Chr(39)+' '+Chr(39)+' AS ANO_COBRANCA, '+
      Chr(39)+' '+Chr(39)+' AS MES_COBRANCA, '+
      Chr(39)+' '+Chr(39)+' AS TIPODESCONTO, '+
      '0 AS PREMIO_AP, '+
      '0 AS PREMIO_VG, '+
      '0 AS VALORESPERADO, '+
      '0 AS VALORRECEBIDO, ';

  sSql:=sSql+
    ' TO_CHAR(PT.DATAENTRADA,''DD/MM/YYYY'') AS DATAENTRADA, '+
    ' SUBSTR(TO_CHAR(PT.DATAENTRADA,''DD/MM/YYYY''),1,2) AS DIA_ENTRADA, '+
    ' SUBSTR(TO_CHAR(PT.DATAENTRADA,''DD/MM/YYYY''),4,2) AS MES_ENTRADA, '+
    ' SUBSTR(TO_CHAR(PT.DATAENTRADA,''DD/MM/YYYY''),7,4) AS ANO_ENTRADA, '+
    ' SP.DESCRICAO AS SITPLANOASSIST, '+
    ' ST.DESCRICAO AS SITUACAOPRINCIPAL, '+
    ' PR.NOME AS PLANOPREV, '+
    ' CN.NOME AS CONTRIBUICAO, '+
    ' PD.NOME AS PRODUTO, '+
    ' PL.NOME AS PLANO, '+
    ' ''1'' AS TIPOSEGURADO, '+
    ' CP.CAPITALMN, '+
    ' CP.CAPITALIP, '+
    ' '' '' AS LOGRADOURO, '+
    ' '' '' AS NUMERO, '+
    ' '' '' AS COMPLEMENTO, '+
    ' '' '' AS BAIRRO, '+
    ' '' '' AS UF, '+
    ' '' '' AS CEP, '+
    ' '' '' AS CEP_FORMATADO, '+
    ' '' '' AS CIDADE '+
    ' FROM PARTASS PT, '+
    ' PESSOA PE, '+
    ' PESSOA PJ, '+
    ' PESSOA BN, '+
    ' PESSOAFISICA PF, '+
    ' PARTPREVPLAN PV, '+
    ' ELEGPATRO EL, ';
  If pMesCob<>'' then
   sSql:=sSql+
    ' HSTCONTRIBASS HT, ';
  sSql:=sSql+
    ' BENEFASS BF, '+
    ' CONTASS CT, '+
    ' SITPLANOASS SP, '+
    ' PLANPREV PR, '+
    ' SITPART ST, '+
    ' CONTRIBUICAO CN, '+
    ' PRODASS PD, '+
    ' PLANASS PL, '+
    ' CAPSEGASS CP '+
    ' WHERE '+
    ' PT.IDPESSOA = PV.IDPESSOA AND '+
    ' PT.IDPESSJUR = PV.IDPESSJUR AND '+
    ' PT.IDPESSOA = EL.IDPESSOA AND '+
    ' PT.IDPESSJUR = EL.IDPESSJUR AND '+
    ' PT.IDPESSOA = PE.IDPESSOA AND '+
    ' PT.IDPESSOA = PF.IDPESSOA AND '+
// inicio tavares
    ' bf.idplanoprev = pv.idplanoprev  and '+
    ' bf.idpessjur = pv.idpessjur and '+
    ' bf.idtitular = pv.idpessoa and '+
    ' bf.flgativo  = ct.FLGativo and '+
    ' BF.IDPLANOPREV = CT.IDPLANOPREV and '+
    ' BF.IDPESSJUR = CT.IDPESSJUR     and ';

//    ' bf.idplanass = pt.idplanass and ';
// fim tavares
  If pIdPessJur<>'' then
   sSql:=sSql+
    ' PT.IDPESSJUR = '+pIdPessJur+' AND ';
  sSql:=sSql+
    ' PT.IDPESSJUR = PJ.IDPESSOA AND '+
    ' PT.IDPESSOA = BF.IDTITULAR AND '+
    ' PT.IDPESSOA = CT.IDTITULAR AND '+
    ' PT.IDSITPART = SP.IDSITPLANOASS AND '+
    ' PT.IDPLANOPREV = PR.IDPLANOPREV AND '+
//inicio tavares 14/04/2003
//    ' PT.FLGINSCRICAOCANC = ''0'' AND '+
      ' pt.idplanoprev = pv.idplanoprev  and '+
      ' pt.idpessjur = pv.idpessjur and '+

      ' pv.idpessoa = pt.idpessoa and '+
      ' ht.idplanoprev = pv.idplanoprev and '+
      ' ht.idpessjur = pv.idpessjur and '+
      ' ht.idtitular = pv.idpessoa  and '+
      ' ht.idplanass =  pt.idplanass and '+

//fim tavares 14/04/2003

    ' PV.IDPESSOA = PF.IDPESSOA AND '+
    ' PV.IDPESSOA = BF.IDTITULAR AND '+
    ' PV.IDPESSJUR = PJ.IDPESSOA AND '+
    ' PV.IDSITPART = ST.IDSITPART AND '+
    ' PV.IDPLANOPREV = PR.IDPLANOPREV AND '+
    ' bf.flgativo  = ct.FLGativo and '+
    ' BF.IDPLANOPREV = CT.IDPLANOPREV and '+
    ' BF.IDPESSJUR = CT.IDPESSJUR     and '+

    // tavares
//    ' BF.FLGATIVO = ''1'' AND '+
    ' BF.IDDEPENDENTE = BN.IDPESSOA AND '+
    ' BF.IDTITULAR = CT.IDTITULAR AND ';
  If pMesCob<>'' then
   sSql:=sSql+
    ' HT.MESCOBRANCA = '+Chr(39)+pMesCob+Chr(39)+' AND '+
    ' HT.IDTITULAR = PT.IDPESSOA AND '+
    ' HT.IDPLANASS = PL.IDPLANASS AND ';
  If pIdPlanass<>'' then
   sSql:=sSql+'PL.IDPLANASS = '+pIdPlanass+' AND ';
  If pIdProdass<>'' then
   sSql:=sSql+' PD.IDPRODASS = '+pIdProdass+' AND ';
  sSql:=sSql+
    ' PD.IDPRODASS = PL.IDPRODASS AND '+
 //  inicio tavares
//    ' CT.FLGATIVO = ''1'' AND '+
      ' ct.flgativo = bf.flgativo and '+
    ' BF.IDPLANOPREV = CT.IDPLANOPREV and '+
    ' BF.IDPESSJUR = CT.IDPESSJUR     and '+
// fim tavares

    ' CT.IDCONTASS = CN.IDCONTRIBUICAO AND '+
    ' CT.IDPLANASS = PL.IDPLANASS AND '+
    ' CT.IDPLANASS = CP.IDPLANASS(+) AND '+


    ' CP.TIPOSEG(+) = '+Chr(39)+'TITULAR'+Chr(39)+
// Tavares 03/04/2003 adicionei os 2 joins abaixo para evitar um produto cartesiano
    ' AND  CP.FLGVIGENCIA = 1 '+

    ' and ht.idplanoprev = pv.idplanoprev  '+
    ' and ht.idpessjur = pv.idpessjur  '+
    ' and ht.idtitular = pv.idpessoa  '+
    ' and ht.idplanass =  pt.idplanass  '+

// tavares
    ' ORDER BY EL.MATRICULA ';
  pQuery.Sql.Add(sSql);
  pQuery.Open;
end;

{ Anterior com informações de endereço
Procedure BuscaAcumuloInformacoes(Var pQuery:TwwQuery;pIdPessJur,pMesCob,pIdProdass,pIdPlanass:String);
Var sSql: String;
begin
  If pIdPessJur='' then Abort;
  pQuery.Close;
  pQuery.Sql.Clear;
  sSql:=
    'SELECT '+
    ' COUNT(*) AS TOTALREG ';

  If pMesCob<>'' then
   sSql:=sSql+
    ',HT.MESCOBRANCA,'+
    ' SUBSTR(HT.MESCOBRANCA,6,2) AS MES_COBRANCA,'+
    ' SUBSTR(HT.MESCOBRANCA,1,4) AS ANO_COBRANCA,'+
    ' SUM(HT.VALORESPERADO) AS TOTAL_VALORESPERADO,'+
    ' SUM(HT.VALORRECEBIDO) AS TOTAL_VALORRECEBIDO '

  else
    sSql:=sSql+
      ','+Chr(39)+''+Chr(39)+' AS MESCOBRANCA, '+
      Chr(39)+''+Chr(39)+' AS ANO_COBRANCA, '+
      Chr(39)+''+Chr(39)+' AS MES_COBRANCA, '+
      '0 AS TOTAL_VALORESPERADO, '+
      '0 AS TOTAL_VALORRECEBIDO ';

  sSql:=sSql+
    ' FROM PARTASS PT, '+
    ' PESSOA PE, '+
    ' PESSOA PJ, '+
    ' PESSOA BN, '+
    ' PESSOAFISICA PF, '+
    ' PARTPREVPLAN PV, '+
    ' ELEGPATRO EL, ';
  If pMesCob<>'' then
   sSql:=sSql+
    ' HSTCONTRIBASS HT, ';
  sSql:=sSql+
    ' BENEFASS BF, '+
    ' CONTASS CT, '+
    ' SITPLANOASS SP, '+
    ' PLANPREV PR, '+
    ' SITPART ST, '+
    ' CONTRIBUICAO CN, '+
    ' PRODASS PD, '+
    ' PLANASS PL, '+
    ' ENDPESS EP, '+
    ' CIDADES CD, '+
    ' CAPSEGASS CP '+
    ' WHERE '+
    ' PT.IDPESSOA = PV.IDPESSOA AND '+
    ' PT.IDPESSJUR = PV.IDPESSJUR AND '+
    ' PT.IDPESSOA = EL.IDPESSOA AND '+
    ' PT.IDPESSJUR = EL.IDPESSJUR AND '+
    ' PT.IDPESSOA = PE.IDPESSOA AND '+
    ' PT.IDPESSOA = PF.IDPESSOA AND '+
    ' PT.IDPESSOA = EP.IDPESSOA(+) AND ';
  If pIdPessJur<>'' then
   sSql:=sSql+
    ' PT.IDPESSJUR = '+pIdPessJur+' AND ';
  sSql:=sSql+
    ' PT.IDPESSJUR = PJ.IDPESSOA AND '+
    ' PT.IDPESSOA = BF.IDTITULAR AND '+
    ' PT.IDPESSOA = CT.IDTITULAR AND '+
    ' PT.IDSITPART = SP.IDSITPLANOASS AND '+
    ' PT.IDPLANOPREV = PR.IDPLANOPREV AND '+
    ' PT.FLGINSCRICAOCANC = ''0'' AND '+
    ' PV.IDPESSOA = PF.IDPESSOA AND '+
    ' PV.IDPESSOA = BF.IDTITULAR AND '+
    ' PV.IDPESSJUR = PJ.IDPESSOA AND '+
    ' PV.IDSITPART = ST.IDSITPART AND '+
    ' PV.IDPLANOPREV = PR.IDPLANOPREV AND '+
    ' BF.FLGATIVO = ''1'' AND '+
    ' BF.IDDEPENDENTE = BN.IDPESSOA AND '+
    ' BF.IDTITULAR = CT.IDTITULAR AND ';
  If pMesCob<>'' then
   sSql:=sSql+
    ' HT.MESCOBRANCA = '+Chr(39)+pMesCob+Chr(39)+' AND '+
    ' HT.IDTITULAR = PT.IDPESSOA AND '+
    ' HT.IDPLANASS = PL.IDPLANASS AND ';
  If pIdPlanass<>'' then
   sSql:=sSql+'PL.IDPLANASS = '+pIdPlanass+' AND ';
  If pIdProdass<>'' then
   sSql:=sSql+' PD.IDPRODASS = '+pIdProdass+' AND ';
  sSql:=sSql+
    ' PD.IDPRODASS = PL.IDPRODASS AND '+
    ' CT.FLGATIVO = ''1'' AND '+
    ' CT.IDCONTASS = CN.IDCONTRIBUICAO AND '+
    ' CT.IDPLANASS = PL.IDPLANASS AND '+
    ' CT.IDPLANASS = CP.IDPLANASS(+) AND '+
    ' CP.TIPOSEG = '+Chr(39)+'TITULAR'+Chr(39)+' AND '+
    ' EP.IDCIDADES = CD.IDCIDADES(+) ';
  If pMesCob<>'' then
   sSql:=sSql+' GROUP BY HT.MESCOBRANCA';
  pQuery.Sql.Add(sSql);
  pQuery.Open;
end;
}

Procedure BuscaAcumuloInformacoes(Var pQuery:TwwQuery;pIdPessJur,pMesCob,pIdProdass,pIdPlanass:String);
Var sSql: String;
begin
  If pIdPessJur='' then Abort;
  pQuery.Close;
  pQuery.Sql.Clear;
  sSql:=
    'SELECT '+
    ' COUNT(*) AS TOTALREG, '+
    ' HT.IDPESSJUR ';
  If pMesCob<>'' then
   sSql:=sSql+
    ',HT.MESCOBRANCA,'+
    ' SUBSTR(HT.MESCOBRANCA,6,2) AS MES_COBRANCA,'+
    ' SUBSTR(HT.MESCOBRANCA,1,4) AS ANO_COBRANCA,'+
    ' SUM(HT.VALORESPERADO) AS TOTAL_VALORESPERADO,'+
    ' SUM(HT.VALORRECEBIDO) AS TOTAL_VALORRECEBIDO '

  else
    sSql:=sSql+
      ','+Chr(39)+''+Chr(39)+' AS MESCOBRANCA, '+
      Chr(39)+''+Chr(39)+' AS ANO_COBRANCA, '+
      Chr(39)+''+Chr(39)+' AS MES_COBRANCA, '+
      '0 AS TOTAL_VALORESPERADO, '+
      '0 AS TOTAL_VALORRECEBIDO ';

  sSql:=sSql+
    ' FROM PARTASS PT, '+
    ' PESSOA PE, '+
    ' PESSOA PJ, '+
    ' PESSOA BN, '+
    ' PESSOAFISICA PF, '+
    ' PARTPREVPLAN PV, '+
    ' ELEGPATRO EL, ';
  If pMesCob<>'' then
   sSql:=sSql+
    ' HSTCONTRIBASS HT, ';
  sSql:=sSql+
    ' BENEFASS BF, '+
    ' CONTASS CT, '+
    ' SITPLANOASS SP, '+
    ' PLANPREV PR, '+
    ' SITPART ST, '+
    ' PRODASS PD, '+
    ' PLANASS PL  '+

    ' WHERE ';

  If pIdPessJur <> '' then
  begin
    sSql:=sSql + ' HT.IDPESSJUR = ' + pIdPessJur + ' AND ';
  end;

  If pMesCob<>'' then
   sSql:=sSql+
    ' HT.MESCOBRANCA = '+Chr(39)+pMesCob+Chr(39)+' AND '+
    ' HT.IDTITULAR = PT.IDPESSOA AND '+
    ' HT.IDPLANASS = PL.IDPLANASS AND ';
  If pIdPlanass<>'' then
   sSql:=sSql+' PL.IDPLANASS = '+pIdPlanass+' AND ';
  If pIdProdass<>'' then
   sSql:=sSql+' PD.IDPRODASS = '+pIdProdass+' AND ';

  sSql := sSql +
  '  PT.IDPESSOA = PV.IDPESSOA AND   '+
  '  PT.IDPESSJUR = PV.IDPESSJUR AND '+
  '  PT.IDPESSOA = EL.IDPESSOA AND   '+

  '  CT.IDCONTASS = HT.IDCONTASS AND '+
  '  CT.IDTITULAR = HT.IDTITULAR AND '+
  '  CT.IDPLANOPREV = HT.IDPLANOPREV AND '+
  '  CT.IDPESSJUR = HT.IDPESSJUR AND '+
  '  CT.IDPLANASS = HT.IDPLANASS AND '+
  '  EL.IDPESSJUR = HT.IDPESSJUR AND '+

  '  PT.IDPESSJUR = EL.IDPESSJUR AND '+
  '  PT.IDPESSOA = PE.IDPESSOA AND   '+
  '  PT.IDPESSOA = PF.IDPESSOA AND   '+

  '  BF.IDPLANOPREV = PV.IDPLANOPREV AND '+
  '  BF.IDPESSJUR = PV.IDPESSJUR AND     '+
  '  BF.IDTITULAR = PV.IDPESSOA AND      '+
  '  BF.FLGATIVO = CT.FLGATIVO AND       '+
  '  BF.IDPLANOPREV = CT.IDPLANOPREV AND '+
  '  BF.IDPESSJUR = CT.IDPESSJUR AND     '+
  '  BF.IDPLANASS = CT.IDPLANASS AND     '+
  '  BF.IDPLANASS = PT.IDPLANASS AND     '+

  '  PT.IDPESSJUR = PV.IDPESSJUR AND     '+
  '  PT.IDPLANASS = CT.IDPLANASS AND     '+
  '  PT.IDPESSJUR = PJ.IDPESSOA AND      '+
  '  PT.IDPESSOA = BF.IDTITULAR AND      '+
  '  PT.IDPESSOA = CT.IDTITULAR AND      '+
  '  PT.IDSITPART = SP.IDSITPLANOASS AND '+
  '  PT.IDPLANOPREV = PR.IDPLANOPREV AND '+
  '  PT.IDPLANOPREV = PV.IDPLANOPREV AND '+
  '  PT.IDPESSJUR = PV.IDPESSJUR AND     '+

  '  HT.IDPLANOPREV = PV.IDPLANOPREV AND   '+
  '  HT.IDPESSJUR = PV.IDPESSJUR AND       '+
  '  HT.IDPLANOPREV = PV.IDPLANOPREV AND   '+
  '  HT.IDPESSJUR = PV.IDPESSJUR AND       '+
  '  HT.IDTITULAR = PV.IDPESSOA AND        '+
  '  HT.IDPLANASS = PT.IDPLANASS AND       '+

  '  PV.IDPESSOA = PT.IDPESSOA AND         '+
  '  PV.IDPESSOA = PF.IDPESSOA AND         '+
  '  PV.IDPESSOA = BF.IDTITULAR AND        '+
  '  PV.IDPESSJUR = PJ.IDPESSOA AND        '+
  '  PV.IDSITPART = ST.IDSITPART AND       '+
  '  PV.IDPLANOPREV = PR.IDPLANOPREV AND   '+

  '  BF.FLGATIVO = CT.FLGATIVO AND         '+
  '  BF.IDPLANOPREV = CT.IDPLANOPREV AND   '+
  '  BF.IDPESSJUR = CT.IDPESSJUR AND       '+
  '  BF.IDDEPENDENTE = BN.IDPESSOA AND     '+
  '  BF.IDTITULAR = CT.IDTITULAR AND       '+

  '  HT.IDTITULAR = PT.IDPESSOA AND        '+
  '  HT.IDPLANASS = PL.IDPLANASS AND       '+
  '  PD.IDPRODASS = PL.IDPRODASS AND       '+

  '  CT.FLGATIVO = BF.FLGATIVO AND         '+
  '  BF.IDPLANOPREV = CT.IDPLANOPREV AND   '+
  '  BF.IDPESSJUR = CT.IDPESSJUR AND       '+
  '  PT.IDPLANOPREV = PV.IDPLANOPREV AND   '+
  '  PT.IDPESSJUR = PV.IDPESSJUR AND       '+
  '  PV.IDPESSOA = PT.IDPESSOA AND         '+

  '  HT.IDPLANOPREV = PV.IDPLANOPREV AND   '+
  '  HT.IDPESSJUR = PV.IDPESSJUR AND       '+
  '  HT.IDPLANASS = PT.IDPLANASS AND       '+
  '  HT.IDTITULAR = PV.IDPESSOA AND        '+
  '  HT.VALORESPERADO > 0                  ';

//fim tavares 14/04/2003
  If pMesCob<>'' then
   sSql:=sSql+' GROUP BY HT.MESCOBRANCA, HT.IDPESSJUR ';
  pQuery.Sql.Add(sSql);
  pQuery.Open;
end;

(*
Procedure BuscaInfEnvioPatro(Var pQuery:TwwQuery;pIdPessJur,pMesCob:String);
Var sSql: String;
begin
  pQuery.Close;
  pQuery.Sql.Clear;
  If pIdPessJur='' then pIdPessJur:='-1';
  sSql:=
    'SELECT '+
    ' SUBSTR(EL.MATRICULA,1,8) AS MATRICULA, '+
    ' SUBSTR(EL.MATRICULA,10,1) AS DIGITO_MATRICULA, '+
    ' SUBSTR(TD.MESCOBRANCA,1,4) AS ANO_COBRANCA, '+
    ' SUBSTR(TD.MESCOBRANCA,6,2) AS MES_COBRANCA, '+
    ' SUBSTR(TD.MESREFERENCIA,1,4) AS ANO_REFERENCIA, '+
    ' SUBSTR(TD.MESREFERENCIA,6,2) AS MES_REFERENCIA, '+
    ' TD.VALOR '+
    ' FROM ELEGPATRO EL, TMPDESC TD, FUNDACAO FD '+
    ' WHERE '+
    ' EL.IDPESSOA = TD.IDTITULAR AND '+
    ' TD.FLGTIPODESC = ''A'' AND '+
    ' TD.FLGDESCFOLHA = ''P'' AND '+
    ' TD.MESCOBRANCA = '+Chr(39)+pMesCob+Chr(39)+' AND '+
    ' TD.IDMODULO = '+IntToStr(Sistema.IdModulo)+' AND '+
    ' TD.IDPESSJUR = '+pIdPessJur+' AND '+
    ' TD.IDPESSJUR <> FD.IDPESSOA '+
    ' ORDER BY EL.MATRICULA ';
  pQuery.Sql.Add(sSql);
  pQuery.Open;
end;
*)

end.
