// Alterações:
{--------------------------------------------------------------------------------------------------
Rotina......: ListarContabPlano, ListarContabPatro
Nº SOL......: 244908
Nº PPM .....: 608397
Data........: 12/12/2013
Responsável.: Fernando Xavier
Descrição...: Ao tentar realizar a atualização de todos os grupos, de acordo com a faixa de grupos
              definido, ocorre um erro ao dar ok.
---------------------------------------------------------------------------------------------------
Rotina......: ListarContabPlano, ListarContabPatro
Nº SOL......: 219335
Nº KINTANA..: 2052435
Data........: 11/11/2013
Responsável.: Marcio Sanches Spinosa SOL 219335 KTN 2052435
Descrição...: incluir condição plano orçamentário
{--------------------------------------------------------------------------------------------------
Rotina......: ListarGruposOrcamen
Nº SOL......: 192391
Nº KINTANA..: 1833220
Data........: 29/10/2012
Responsável.: Edilaine Ferraresi
Descrição...: incluir condição plano orçamentário
{--------------------------------------------------------------------------------------------------
Rotina......: ListarContabPlano, ListarContabPatro
Nº SOL......: 187955
Nº KINTANA..: 1770040
Data........: 16/08/2012
Responsável.: Edilaine Ferraresi
Descrição...: incluir condição de centros de custos apenas para PGA na seleção de Planos e Patro
{--------------------------------------------------------------------------------------------------
Rotina......: ListarContabPlano, ListarContabPatro
Nº SOL......: 185723-10782
Nº KINTANA..: 1752458
Data........: 03/08/2012
Responsável.: Edilaine Ferraresi
Descrição...: condição colocada para trazer apenas Plano/Patro relacionado com PGA pois na
              vinculação há contas contábeis configuradas para Operações Comum e PGA
{--------------------------------------------------------------------------------------------------
Rotina......: ListarContabCentroCusto
Nº SOL......: 185017
Nº KINTANA..: 1733391
Data........: 13/07/2012
Responsável.: Edilaine Ferraresi
Descrição...: relacionar os centros de custos já vinculados que estao inativos
{--------------------------------------------------------------------------------------------------
Rotina......: ListarContabPlano, ListarContabPatro
Nº SOL......: 184789
Nº KINTANA..: 1731029
Data........: 11/07/2012
Responsável.: Edilaine Ferraresi
Descrição...: pegar contas contábeis com valor zerado ao listar de Plano e Patro
{--------------------------------------------------------------------------------------------------
Rotina......: ListarContaContabilGruposOrcamenDisponivel
Nº SOL......: 184266
Nº KINTANA..: 1721020
Data........: 04/07/2012
Responsável.: Higor Nayde
Descrição...: Alteração de query para carregar contas contabeis disponiveis já vinculadas em outro
plano.
{--------------------------------------------------------------------------------------------------
Rotina......: ListarContabCentroCusto
Nº SOL......: 172384/10142
Nº KINTANA..: 1696873
Data........: 18/06/2012
Responsável.: Higor Nayde
Descrição...: inclusão do parâmetro em ListarContabCentroCusto
e alteração do select  da mesma. 
{--------------------------------------------------------------------------------------------------
Rotina......: ListarContaContabilGruposOrcamen
Nº SOL......: 172383-9201
Nº KINTANA..: 1640405
Data........: 23/04/2012
Responsável.: Edilaine Ferraresi
Descrição...: inclusão do parâmetro Plano Orçamentário
{--------------------------------------------------------------------------------------------------
Rotina......: ListaPlanoOrcamento
Nº SOL......: 172383-7764
Nº KINTANA..: 1556975
Data........: 23/03/2012
Responsável.: Edilaine Ferraresi
Descrição...: inclusão do parâmetro Plano Orçamentário
{ --------------------------------------------------------------------------------------------------
Rotina......: ListarContabPatro e ListarContabPlano
Nº SOL......: 169825
Nº KINTANA..: 1508149
Data........: 08/12/2011
Responsável.: Vinicius Eduardo Nascimento Maciel
Descrição...: Fui mudada a clausula do filtro entre as tabelas PLSDEBITOCORRENTE
              e PLSCREDITOCOR de AND para OR.
----------------------------------------------------------------------------------------------------
Rotina......: PreencherContasDesvinculadas
Nº SOL......: 168202
Nº KINTANA..: 1480546
Data........: 08/11/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: Correção no filtro de grupos
----------------------------------------------------------------------------------------------------
{ --------------------------------------------------------------------------------------------------
Rotina......: Toda control
Nº SOL......: 159242/6041
Nº KINTANA..: 1385831
Data........: 31/06/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: CLASSE DE VINCULAÇÃO DE CONTAS CONTÁBEIS COM GRUPO ORCAMENTARIO
----------------------------------------------------------------------------------------------------}

unit uCtrlVinculaOrcadoContabil;

interface

Uses
  DB, uDataBase, uCmControlObject, dbclient, uMidasUtil, sysutils, wwQuery, provider,
  Classes, uDbContasOrcamen,  uCMTypes, uFuncoesOrcamento,Windows, Messages,
  Graphics, Controls, Forms, Dialogs, FileCtrl, ComObj,Gauges,uSistema,uCMClientDataSet,
  uCtrlPadroes,uCtrlCadGrupos,DBaseDados,StdCtrls, uCmSqlParams, uDbDataView, uReccodigo,
   ComCtrls, Math,DBTables;


Type
  TCtrlVinculaOrcadoContabil = class(TCmControlObject)
  private
        strSQL:string;
    FCodGrupoorcamen: string;
    procedure SetCodGrupoorcamen(const Value: string);
  public
  vContasContabeis:Boolean;
        //Constutor da Classe
        constructor Create(); override;
        //Destrutor da Classe
        destructor  Destory;

        property CodGrupoorcamen:string read FCodGrupoorcamen write SetCodGrupoorcamen;

        //Retornar Plano Contabil Vigente
        procedure RetornarPlanoContabilVigente(var stridPlano,strPlano:string);
        //Lista Grupos Orcamentários
        function ListarGruposOrcamen(strCodGrupoOrcamenIni,strCodGrupoOrcamenFim:string; const iIdPlanoOrc : integer = -1):Olevariant;   // Edilaine - SOL 192391 / KTN 1833220
        //Listar Centro de Responsabilidade
        function ListarCentroResponsabilidade(IdEmpresa:Integer):OleVariant;
        //Listar Parâmetros prinicpais das Contas orçamentários do Grupo
        function ListarContasOrcamenParam(IdPlanoOrcamen,IdGrupo:string):OleVariant;
        //Listas as Conta Contábeis vinculadas ao Grupo Orçamentário
        function ListarContaContabilGruposOrcamen(IdPlanoOrcamen,strIdGrupoOrcamen:string):Olevariant;  // Edilaine - SOL 172383-9201 / KTN 1640405
        //Listas as Conta Contábeis Disponível ao Grupo Orçamentário
        function ListarContaContabilGruposOrcamenDisponivel(strIdGrupoOrcamen:string):Olevariant;

        // Edilaine - SOL 172383-7764 / KTN 1556975
        function ListaPlanoOrcamento : OleVariant;

        //Listagem de parâmetros das Contas Contábeis
        function ListarContabCentroCusto(const strGrupo: string; const IdPlanoOrcamen: string; strAno,strPlano:string;strContas:TStringList):olevariant; //Higor Nayde  SOL - 172384/10142 KTN - 1696873
        function ListarContabPlano(strAno,strPlano:string;strContas:TStringList):olevariant;
        function ListarContabPatro(strAno,strPlano:string;strContas:TStringList):olevariant;
        function ListarContabAtividadeProjeto(strAno,strPlano:string;strContas:TStringList):olevariant;
        function ListarContabPrograma(strAno,strPlano:string;strContas:TStringList):olevariant;
        function ListarContabTipoDespesa(strAno,strPlano:string;strContas:TStringList):olevariant;

end;


var
   CtrlVinculaOrcadoContabil:TCtrlVinculaOrcadoContabil;



implementation


{ TCtrlVinculaOrcadoContabil }

constructor TCtrlVinculaOrcadoContabil.Create;
begin
  inherited;

end;

destructor TCtrlVinculaOrcadoContabil.Destory;
begin

end;

function TCtrlVinculaOrcadoContabil.ListaPlanoOrcamento: OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT P.IDPLANOORCAMEN, '+
          '       P.NOMEPLANOORC, '+
          '       P.ANO, P.MASCARAGRUPO '+
          '  FROM PLANOORCAMENTARIO P '+
          'order by P.NOMEPLANOORC';

  result := GetDataPacket( sSQL );
end;

function TCtrlVinculaOrcadoContabil.ListarCentroResponsabilidade(
  IdEmpresa: Integer): OleVariant;
begin
    strSQL := ' SELECT CODCENTRORESPON, NOME, CODEXTERNO, NVL(ATIVO, ''S'') AS ATIVO ' +
              ' FROM CENTRESPON ' +
              ' WHERE (IDPESSOA = ' + IntToStr(idEmpresa) + ')  AND ' +
              '      (ANALITICOSINTET = ''A'') ' +
              ' ORDER BY NOME ';
    Result := GetDataPacket(strSQL);
end;

function TCtrlVinculaOrcadoContabil.ListarContabAtividadeProjeto(strAno,
  strPlano: string; strContas: TStringList): olevariant;
var i:integer;
begin
     strSQL :=

     ' SELECT DISTINCT ' +
     '   UN.NOME AS NOME, UN.UNIDNEGOC, UN.UNETIPO, UN.CODORCAMEN AS UNECODIGO '  + #13 +
     ' FROM '                                                                     + #13 +
     '   UNIDNEGOCIO UN '                                                         + #13 +

     ' JOIN ' +
     '      (SELECT DISTINCT ' +
     '              UNIDNEGOC,IDPESSOA ' +
     '       FROM PLANOSALDO ' +
     '      WHERE PEREXERCICIO = ' + strAno +
     '      AND PLANO = '          + strPlano +
     '      AND PLACONTA IN ( ' ;


     //Loop de Contas Contábeis
     for i := 0  to strContas.Count - 1 Do
     begin
          strSQL := strSQL + QuotedStr(strContas[i]) + ',';
     End;

     strSQL := strSQL +
     QuotedStr(' ') +  ')' +
     '     ) PL ' +
     ' ON ' +
     '     PL.UNIDNEGOC = UN.UNIDNEGOC AND ' +
     '     PL.IDPESSOA  = UN.IDPESSOA ';

     Result := GetDataPacket(strSQL);
end;

function TCtrlVinculaOrcadoContabil.ListarContabCentroCusto(const strGrupo: string;const IdPlanoOrcamen: string; strAno,
  strPlano: string; strContas: TStringList): olevariant;
var i:integer;
  sContas : string;
begin
     //Higor Nayde  SOL - 172384/10142 KTN - 1696873 Inicio
     //Para grupos PGA trazer todos os centros de custo
     //if (strGrupo = '')then            // Edilaine - SOL 185017 / KTN 1733391 - comentado e mudado para final do 1o If
     //begin                             // Edilaine - SOL 185017 / KTN 1733391 - comentado
     if Copy(CodGrupoorcamen,1,1) = '4' then
     begin
       strSQL :=
           ' SELECT DISTINCT ' +
           ' CU.CODCENTROCUSTO, ' +
           ' trim(CU.NOME) || decode(CU.STATUSGRUPOCDC,' + QuotedStr('S') + ',' +  QuotedStr('*') + ',' + QuotedStr(' ') + ') || ' +
           ' decode(CU.ATIVO, ' + QuotedStr('S')  + ',' +  QuotedStr(' ')  + ', ' +   QuotedStr('(Inativo)') + ') as NOME, ' +
           ' CU.CODEXTERNO ' +
           ' FROM ' +
           '      CENTCUST CU ' +
           ' WHERE CU.ATIVO = ' + QuotedStr('S');
     end
     else //Para as demais grupos trazer todos os centros de custo somente de contabilidade
     begin
       strSQL :=
         ' SELECT DISTINCT ' +
                  ' NVL(CU.CODCENTROCUSTO,' + QuotedStr('X') + ') as CODCENTROCUSTO, '+
                  ' trim(NVL(CU.NOME, ' +  QuotedStr('(sem vinculacao)') + ')) || ' +
                  ' decode(CU.STATUSGRUPOCDC,' + QuotedStr('S') + ',' +  QuotedStr('*') + ',' + QuotedStr(' ') + ') || ' +
                  ' decode(CU.ATIVO, ' + QuotedStr('S')  + ',' +  QuotedStr(' ')  + ', ' +   QuotedStr('(Inativo)') + ') as NOME, ' +
                  ' NVL(CU.CODEXTERNO,' + QuotedStr('X') + ') as CODEXTERNO ' +
         ' FROM ' +
         '      (SELECT DISTINCT ' +
         '              CODCENTROCUSTO ' +
         '      FROM PLANOSALDO ' +
         '      WHERE PEREXERCICIO = ' + strAno +
         '      AND PLANO = ' + strPlano +
         '      AND PLACONTA IN ( ' ;

       //Loop de Contas Contábeis
       for i := 0  to strContas.Count - 1 Do
       begin
         strSQL := strSQL + QuotedStr(strContas[i]) + ',';
       End;

       strSQL := strSQL +
         QuotedStr(' ') +  ')' +
         '     ) PL ' +
         ' LEFT JOIN ' +
         '      CENTCUST CU ' +
         ' ON ' +
         '     PL.CODCENTROCUSTO = CU.CODCENTROCUSTO ' +
         ' WHERE ' +
         '    (CU.CODCENTROCUSTO IS NULL) OR  (CU.ATIVO = ' + QuotedStr('S')  + ')';
     end;

     if (strGrupo <> '') then    // Edilaine - SOL 185017 / KTN 1733391
     begin
         // Edilaine - SOL 185017 / KTN 1733391 - comentado
         {
         ' UNION  ' +
         ' SELECT DISTINCT CE.CODCENTROCUSTO,' +
         '                 TRIM(CE.NOME) || DECODE(CE.STATUSGRUPOCDC, ''S'', ''*'', '' '') ||' +
         '                 DECODE(CE.ATIVO, ''S'', '' '', ''(INATIVO)'') AS NOME,' +
         '                 CE.CODEXTERNO                ' +
         '   FROM CONTASORCAMEN CO ' +
         '   JOIN CENTCUST CE' +
         '   ON CO.CODCENTROCUSTO = CE.CODCENTROCUSTO' +
         '   JOIN COMPCONTASORCAMEN  CC ' +
         '     ON CO.IDCONTAORCAMEN = CC.IDCONTAORCAMEN ' +
         '   JOIN PLANOCONTA PC ' +
         '     ON PC.PLANO = CC.PLANO ' +
         '    AND PC.PLACONTA = CC.PLACONTA ' +
         '   JOIN PLANO PL ' +
         '     ON PL.PLANO = PC.PLANO ' +
         '  WHERE CO.IDGRUPOORCAMEN = ' + strGrupo +  // colocar a variavel
         '    AND CC.IDPLANOORCAMEN = ' + IdPlanoOrcamen +
         '    AND CE.ATIVO <>''S''';
         }

       // Edilaine - SOL 185017 / KTN 1733391
       sContas := '';
       for i := 0 to strContas.Count - 1 Do
       begin
         sContas := sContas + QuotedStr(strContas[i]) + ',';
       End;

       strSQL := strSQL +
       ' UNION  ' +
       ' SELECT DISTINCT CE.CODCENTROCUSTO, ' +
       '                 TRIM(CE.NOME) || DECODE(CE.STATUSGRUPOCDC, ''S'', ''*'', '' '') || ' +
       '                 DECODE(CE.ATIVO, ''S'', '' '', ''(INATIVO)'') AS NOME, ' +
       '                 CE.CODEXTERNO ' +
       '   FROM CONTASORCAMEN CO ' +
       '   JOIN CENTCUST CE ' +
       '     ON CO.CODCENTROCUSTO = CE.CODCENTROCUSTO ' +
       '   JOIN PLANOCONTA PC ' +
       '     ON PC.PLANO = ' + strPlano;

       if Trim(sContas) <> '' then
          strSQL := strSQL +
            '    AND PC.PLACONTA IN (' + sContas + ' '' '') ';

       strSQL := strSQL +
       '   JOIN PLANO PL ' +
       '     ON PL.PLANO = PC.PLANO ' +
       ' WHERE CO.IDGRUPOORCAMEN = ' + strGrupo +
       '    AND CO.IDPLANOORCAMEN = '+ IdPlanoOrcamen +
       '    AND CE.ATIVO <> ''S'' ';
     end;
     // Edilaine - SOL 185017 / KTN 1733391 - fim

     Result := GetDataPacket(strSQL);
   //Higor Nayde  SOL - 172384/10142 KTN - 1696873  Fim
end;

function TCtrlVinculaOrcadoContabil.ListarContabPatro(strAno,
  strPlano: string; strContas: TStringList): olevariant;
var i:integer;
begin
     strSQL :=

     ' SELECT DISTINCT ' +
     '   PR.NOME AS NOME, PR.IDPESSOA, PR.CODORCAMENTO '       + #13 +
     ' FROM '                                                  + #13 +


     '   (SELECT P.NOME AS NOME, PT.IDPESSOA, PT.CODORCAMENTO ' + #13 +
     '   FROM PESSOA P,PATRO  PT ' + #13 +
     '   WHERE P.IDPESSOA   = PT.IDPESSOA) PR '                  + #13 +


     ' JOIN ' +
     '      (SELECT DISTINCT ' +
     '              IDPATRO ' +
     '       FROM PLANOSALDO ' +
     '      WHERE PEREXERCICIO = ' + strAno +
     '      AND PLANO = '          + strPlano +
     '      AND PLACONTA IN ( ';


     //Loop de Contas Contábeis
     for i := 0  to strContas.Count - 1 Do
     begin
          strSQL := strSQL + QuotedStr(strContas[i]) + ',';
     End;

     strSQL := strSQL +
     QuotedStr(' ') +  ')' +
     //Vinicius Maciel - SOL169825 - KTN 1508149
    // '  AND PLSDEBITOCORRENTE > 0 AND PLSCREDITOCOR > 0    ) PL ' +
     '  AND (PLSDEBITOCORRENTE > 0 OR PLSCREDITOCOR >= 0 )     ';  // Edilaine - SOL 184789 - KTN 1731029 - condição >=

     if Copy(CodGrupoorcamen,1,1) = '4' then     // Edilaine - SOL 187955 / KTN 1770040
        strSQL := strSQL +                       // Edilaine - SOL 187955 / KTN 1770040
          '  AND PERNUMERO IS NOT NULL AND CODCENTROCUSTO IS NOT NULL ';  // Edilaine - SOL 185723-10782 / KTN 1752458

     strSQL := strSQL +  // Edilaine - SOL 187955 / KTN 1770040
     '  ) PL ' +
     //Vinicius Maciel - SOL169825 - KTN 1508149 - FIM
     ' ON ' +
     '     PR.IDPESSOA = PL.IDPATRO ';
     //Marcio Sanches Spinosa SOL 219335 KTN 2052435 - Inicio
     if strContas.Count > 0 then   // SOL 244908 PPM 608397
     if (Copy(strContas[0], 0, 1) = '4') then
        strSQL := strSQL +  'AND PR.NOME LIKE ''PGA%''';
     //Marcio Sanches Spinosa SOL 219335 KTN 2052435 - Fim   

     Result := GetDataPacket(strSQL);
end;

function TCtrlVinculaOrcadoContabil.ListarContabPlano(strAno,
  strPlano: string; strContas: TStringList): olevariant;
var i:integer;
begin
     strSQL :=
     ' SELECT DISTINCT ' +
     '   PT.NOME AS NOME, PT.IDPLANOPREV, PT.CODORCAMENTO '       + #13 +
     ' FROM '                                                     + #13 +
     '   PLANPREVCONTABIL PT '                                    + #13 +

     ' JOIN ' +
     '      (SELECT DISTINCT ' +
     '              IDPLANOPREV ' +
     '       FROM PLANOSALDO ' +
     '      WHERE PEREXERCICIO = ' + strAno +
     '      AND PLANO = '          + strPlano +
     '      AND PLACONTA IN ( ';

     //Loop de Contas Contábeis
     for i := 0  to strContas.Count - 1 Do
     begin
          strSQL := strSQL + QuotedStr(strContas[i]) + ',';
     End;

     strSQL := strSQL +
     QuotedStr(' ') +  ')' +
     //Vinicius Maciel - SOL169825 - KTN 1508149
     //'   AND PLSDEBITOCORRENTE > 0 AND PLSCREDITOCOR > 0 ) PL ' +
     '   AND (PLSDEBITOCORRENTE > 0 OR PLSCREDITOCOR >= 0 )     ';    // Edilaine - SOL 184789 - KTN 1731029 - condição >=

     if Copy(CodGrupoorcamen,1,1) = '4' then     // Edilaine - SOL 187955 / KTN 1770040
        strSQL := strSQL +                       // Edilaine - SOL 187955 / KTN 1770040
        '   AND PERNUMERO IS NOT NULL AND CODCENTROCUSTO IS NOT NULL ';  // Edilaine - SOL 185723-10782 / KTN 1752458

     strSQL := strSQL +                       // Edilaine - SOL 187955 / KTN 1770040
     '  ) PL ' +
     //Vinicius Maciel - SOL169825 - KTN 1508149 - FIM
     ' ON ' +
     '     PT.IDPLANOPREV = PL.IDPLANOPREV ';
     //Marcio Sanches Spinosa SOL 219335 KTN 2052435 - Inicio
     if strContas.Count > 0 then // SOL 244908 PPM 608397
     if Copy(strContas[0],0,1) = '4' then
       strSQL := strSQL + 'AND PT.NOME LIKE ''PGA%''';
     //Marcio Sanches Spinosa SOL 219335 KTN 2052435 - Fim
     Result := GetDataPacket(strSQL);
end;

function TCtrlVinculaOrcadoContabil.ListarContabPrograma(strAno,
  strPlano: string; strContas: TStringList): olevariant;
var i:integer;
begin
 strSQL :=
 ' SELECT PR.IDPROGRAMAORCAMEN,PR.DESCRICAO_PROGRAMAORCAMEN AS NOME ' +
 ' FROM CM.PROGRAMAORCAMEN PR ';

 //Lista programas somente para grupo de PGA (código de grupo que começe com 4)
 if Copy(CodGrupoorcamen,1,1) = '4' then
    strSQL := strSQL + ' WHERE 1 = 1 '
 else
    strSQL := strSQL + ' WHERE 1 = 2 ';



{ ' WHERE IDPROGRAMAORCAMEN IN ( ' +

 ' SELECT DISTINCT ' +
 '       CASE WHEN SUBSTR(TRIM(PLACONTA),1,1) = ' + QuotedStr('4') + ' THEN ' +
 '          SUBSTR(TRIM(PLACONTA),3,1) ' +
 '       ELSE   NULL END AS IDPROGRAMA_ORCAMEN ' +
 ' FROM PLANOSALDO ' +
 '      WHERE PEREXERCICIO = ' + strAno +
 '      AND PLANO = '          + strPlano +
 '      AND PLACONTA IN ( ';

 //Loop de Contas Contábeis
 for i := 0  to strContas.Count - 1 Do
 begin
      strSQL := strSQL + QuotedStr(strContas[i]) + ',';
 End;

 strSQL := strSQL + QuotedStr(' ') + '))';}

 Result := GetDataPacket(strSQL);
end;

function TCtrlVinculaOrcadoContabil.ListarContabTipoDespesa(strAno,
  strPlano: string; strContas: TStringList): olevariant;
var i:integer;
begin

 strSQL := ' SELECT TD.IDTIPO_DEPESAORCAMEN, TD.DESCRICAO_TIPO_DEPESAOCAMEN  AS NOME' +
           ' FROM CM.TIPO_DESPESAORCAMEN TD ';

 //Lista Tipo de Despesa somente para grupo de PGA (código de grupo que começe com 4)
 if Copy(CodGrupoorcamen,1,1) = '4' then
    strSQL := strSQL + ' WHERE 1 = 1 '
 else
    strSQL := strSQL + ' WHERE 1 = 2 ';

 {' WHERE IDTIPO_DEPESAORCAMEN IN ( ' +

 ' SELECT DISTINCT ' +
 '       CASE WHEN SUBSTR(TRIM(PLACONTA),1,1) = ' + QuotedStr('4') + ' THEN ' +
 '          SUBSTR(TRIM(PLACONTA),4,1) ' +
 '       ELSE   NULL END AS IDTIPO_DEPESAORCAMEN ' +
 ' FROM PLANOSALDO ' +
 '      WHERE PEREXERCICIO = ' + strAno +
 '      AND PLANO = '          + strPlano +
 '      AND PLACONTA IN ( ';

 //Loop de Contas Contábeis
 for i := 0  to strContas.Count - 1 Do
 begin
      strSQL := strSQL + QuotedStr(strContas[i]) + ',';
 End;

 strSQL := strSQL + QuotedStr(' ') + '))';}

 Result := GetDataPacket(strSQL);
end;

function TCtrlVinculaOrcadoContabil.ListarContaContabilGruposOrcamen(
  IdPlanoOrcamen,strIdGrupoOrcamen: string): Olevariant;
begin

     if Trim(strIdGrupoOrcamen) = '' then
     begin
         raise Exception.Create('Deve informar o ID do Grupo orçamentário.');
     end;

     strSQL := 'SELECT  DISTINCT ' +
               '       PL.DESCPLANO,PC.PLANO,PC.PLACONTA,PC.PLANOME,PC.PLATIPO ' +
               ' FROM CONTASORCAMEN CO ' +
               'JOIN ' +
               '        COMPCONTASORCAMEN  CC ' +
               'ON ' +
               '        CO.IDCONTAORCAMEN = CC.IDCONTAORCAMEN ' +
               'JOIN ' +
               '        PLANOCONTA PC ' +
               'ON ' +
               '        PC.PLANO = CC.PLANO ' +
               '        AND PC.PLACONTA = CC.PLACONTA ' +
               'JOIN ' +
               '        PLANO PL ' +
               'ON ' +
               '        PL.PLANO = PC.PLANO ' +
               'WHERE ' +
               '        CO.IDGRUPOORCAMEN = ' + strIdGrupoOrcamen+
               '  AND  CC.IDPLANOORCAMEN = '+IdPlanoOrcamen;    // Edilaine - SOL 172383-9201 / KTN 1640405
     result :=  GetDataPacket(strSQL);
end;

function TCtrlVinculaOrcadoContabil.ListarContaContabilGruposOrcamenDisponivel(
  strIdGrupoOrcamen: string): Olevariant;
begin
     if Trim(strIdGrupoOrcamen) = '' then
     begin
         raise Exception.Create('Deve informar o ID do Grupo orçamentário.');
     end;

     strSQL := 'SELECT ' +
               '       PL.DESCPLANO,PC.PLANO,PC.PLACONTA,PC.PLANOME,PC.PLATIPO ' +
               'FROM ' +
               '       PLANOCONTA PC ' +
               'JOIN ' +
               '        PLANO PL ' +
               'ON ' +
               '      PL.PLANO = PC.PLANO ' +
               'JOIN ' +
               '      PARAMCONTAB PA ' +
               'ON ' +
               '      PA.PLANO = PC.PLANO ' +
               'LEFT JOIN ' +
               '      (SELECT DISTINCT PLANO,PLACONTA FROM COMPCONTASORCAMEN CC ' +
               '      JOIN CONTASORCAMEN CO  ON CC.IDCONTAORCAMEN = CO.IDCONTAORCAMEN ' +
               '      AND CC.IDPLANOORCAMEN = CO.IDPLANOORCAMEN' + // Higor Nayde Ferreira SOL - 184266  KTN - 1721020
               '      AND CO.IDGRUPOORCAMEN = ' + strIdGrupoOrcamen + ') OC ' +
               'ON ' +
               '      PC.PLANO = OC.PLANO ' +
               '      AND PC.PLACONTA = OC.PLACONTA ' +
               'WHERE ' +
               '      OC.PLANO IS NULL ' +
               'ORDER BY ' +
               '      PC.PLACONTA ';

     result :=  GetDataPacket(strSQL);
end;

function TCtrlVinculaOrcadoContabil.ListarContasOrcamenParam(
  IdPlanoOrcamen, IdGrupo: string): OleVariant;
begin
     strSQL := ' SELECT IDPLANOORCAMEN,IDGRUPOORCAMEN,CODCENTRORESPON, ' +
               '        TIPOCALCORCADO,TIPOCALCREALIZADO,FLGACUMULADO ' +
               ' FROM   CONTASORCAMEN ' +
               ' WHERE ' +
               '        IDPLANOORCAMEN = ' + IdPlanoOrcamen + ' AND ' +
               '        IDGRUPOORCAMEN = ' + IdGrupo +
               ' GROUP BY IDPLANOORCAMEN,IDGRUPOORCAMEN,CODCENTRORESPON,' +
               '        TIPOCALCORCADO,TIPOCALCREALIZADO,FLGACUMULADO';
     result :=  GetDataPacket(strSQL);
end;

function TCtrlVinculaOrcadoContabil.ListarGruposOrcamen(
  strCodGrupoOrcamenIni,strCodGrupoOrcamenFim: string;
  const iIdPlanoOrc : integer): Olevariant;
begin
     strSQL :=
     ' SELECT * FROM  ( ' +
     ' SELECT GR.*, ' +
     //Ricardo de Freitas SOL: 168202 KINTANA: 1480546
     ' RPAD(TRIM(CODGRUPOORC),12, ' + Quotedstr('0') + ') AS CODGRUPOORC_EXTENCO, ' + 
     ' DECODE(GR.FLGANALSINT,' + QuotedStr('S') + ',' + QuotedStr('Sintético') + ',' + QuotedStr('Analítico') + ') AS FLGANALSINT_DESCRICAO,' +
     ' DECODE(GR.FLGSINALGRUPO,' + QuotedStr('P') + ',' + QuotedStr('Positivo') + ',' + QuotedStr('Negativo') + ') AS FLGSINALGRUPO_DESCRICAO, ' +
     ' PL.NOMEPLANOORC, NVL(PL.ANO,0) AS ANO ' +
     ' FROM ' +
     ' GRUPOORCAMEN GR ' +
     ' JOIN ' +
     '  PLANOORCAMENTARIO PL ' +
     ' ON ' +
     '  PL.IDPLANOORCAMEN = GR.IDPLANOORCAMEN ';

     // Edilaine - SOL 192391 / KTN 1833220
     if iIdPlanoOrc <> -1 then
        strSQL := strSQL + '  AND PL.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc);
     // Edilaine - SOL 192391 / KTN 1833220 - fim

     strSQL := strSQL +
     ' ) ' +
     ' WHERE ' +
     ' 1 = 1 ';
     // Edilaine - SOL 172383-7764 / KTN 1556975 - comentada
     //' AND IDPLANOORCAMEN  IN (SELECT IDPLANOORCAMEN FROM PARAMORCAMENTO) ';


     //Ricardo de Freitas SOL: 168202 KINTANA: 1480546
     if (Trim(strCodGrupoOrcamenFim) <> '') and (Trim(strCodGrupoOrcamenIni) <> '') then
     begin
         strSQL := strSQL +
         '    AND CODGRUPOORC_EXTENCO BETWEEN ' +
         '        RPAD(TRIM(' + Quotedstr(Trim(strCodGrupoOrcamenIni)) + '),12, ' + Quotedstr('0') + ')' +
         '        AND ' + 
         '        RPAD(TRIM('  + Quotedstr(Trim(strCodGrupoOrcamenFim)) + '),12, ' + Quotedstr('0') + ')';
           
     end;
     //Ricardo de Freitas SOL: 168202 KINTANA: 1480546 - fim

     //Ricardo de Freitas SOL: 168202 KINTANA: 1480546 - comentado
     {if Trim(strCodGrupoOrcamenFim) <> '' then
     begin
        strSQL := strSQL +
               ' AND SUBSTR(TRIM(GR.CODGRUPOORC),1,LENGTH(' + QuotedStr(strCodGrupoOrcamenIni) + ')) = ' + QuotedStr(strCodGrupoOrcamenIni) +
               ' AND LENGTH(TRIM(GR.CODGRUPOORC)) <= LENGTH(' + QuotedStr(strCodGrupoOrcamenFim) + ')';
     end
     else
     begin
        //Código de Grupo orçamentário
        if Trim(strCodGrupoOrcamenIni) <> '' then
           strSQL := strSQL  + ' AND GR.CODGRUPOORC = ' + QuotedStr(strCodGrupoOrcamenIni);
     end;}

     strSQL := strSQL + ' ORDER BY CODGRUPOORC';
     strSQL := strSQL + ', NOMEPLANOORC ';   // Edilaine - SOL 172383-7764 / KTN 1556975 - comentada

     result :=  GetDataPacket(strSQL);
end;



procedure TCtrlVinculaOrcadoContabil.RetornarPlanoContabilVigente(
  var stridPlano, strPlano: string);
var
   i:integer;
   cds:TCMClientDataSet;
begin

     stridPlano := '';
     strPlano   := '';

     strSQL := ' SELECT L.PLANO,L.DESCPLANO FROM PARAMCONTAB P ' +
               ' JOIN PLANO L ON P.PLANO = L.PLANO ';

     TRY
        cds      := TCMClientDataSet.Create(Application);
        cds.Data := GetDataPacket(strSQL);

        if not cds.IsEmpty then
        begin
              stridPlano := Trim(cds.fieldbyname('PLANO').AsString);
              strPlano   := Trim(cds.fieldbyname('DESCPLANO').AsString);
        end;


     FINALLY
        cds.Close;
        FreeAndNil(cds);
     END;


end;

procedure TCtrlVinculaOrcadoContabil.SetCodGrupoorcamen(
  const Value: string);
begin
  FCodGrupoorcamen := Value;
end;

end.

