//--------------------------------------------------------------------------------
//ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
//--------------------------------------------------------------------------------
//N. SIG..........: 103988
//Data............: 15/01/2021
//Responsável.....: Cássio Rovaroto
//Descrição.......: Inclusão das novas faixas de provisão, conforme Instrução
//                  Previc nº 31, de 20 de agosto de 2020.
//--------------------------------------------------------------------------------
//N. SIG..........: 83337
//Data............: 05/04/2019
//Responsável.....: Fábio Sampaio
//Descrição.......: Ajuste na query para correção do erro que ocorre na base Tibero.
//--------------------------------------------------------------------------------
//N. Sol..........: 146052
//N. Kintana......: 1017172
//Data............: 09/03/2010
//Responsável.....: Eraldo Silva
//Descrição.......: Ajuste na query
//--------------------------------------------------------------------------------
//Rotina..........:
//N. Sol..........: 85344/261
//N. Kintana......: 653747
//Data............: 09/03/2010
//Responsável.....: Marilza Colpani
//Descrição.......: Otimização da query que gera o relatório de Provisão de Perdas
//--------------------------------------------------------------------------------
unit uCtrlRelComunsImobiliario;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, uCMTypes, Classes,
     uCMFileUtils;  //Eraldo Silva SOL 146052 Kintana 1017172
     

Type
  TCtrlRelComunsImobiliario = class(TCmControlObject)
  private
    procedure OnResultRegra( Sender: TObject );

  protected
    procedure AfterInitialize;   Override;

  public
    iCodigoDocumento: Integer;
    constructor Create;  override;
    destructor  Destroy; override;

    function SelecionaRelParamContab(const iIdModulo,iIdRecDes,iIdImovel,iIdContrato:Integer; const sTipoImo:String;
                                     const bReceita,bDespesa:Boolean; const iTipoContab,iOrdem:Integer) : OLEVariant;
    function SelecionaRelPrevImob   (const iIdModulo,iMes,iAno,iTipoCusto:Integer; const sTipoImovel:String; const iOrdem:Integer) : OLEVariant;
    function SelecionaRelPrevImobMes(const iMes,iAno,iTipoCusto:Integer; const sTipoImovel:String) : OLEVariant;
    function SelecionaRelPrevImobImo(const iMes,iAno,iTipoCusto:Integer; const sTipoImovel:String) : OLEVariant;

    function SelecionaProvisaoPerdas(const iIdEmpresa,
                                           iIdModulo: Integer;
                                     const dDataLimite: TDateTime;
                                     const sTipoImovel : String = '';
                                     const sSitContratual : String = '';
                                     // SOL 126229 KTN 658658 Ricardo A.
                                     const iPatro: Integer = 0;
                                     const iPlano: Integer = 0

                                     ) : OLEVariant;

    function SelecionaProvPerdaTipoImo(const iIdModulo,
                                             iIdOperacao    : Integer;
                                       const dDataIni       : TDateTime = -1;
                                       const dDataFim       : TDateTime = -1;
                                       const sTipoImovel    : String = '';
                                       const sSitContratual : String = '') : OLEVariant;
    function SelecionaProvPerdaContrato(const iIdModulo,
                                              iIdOperacao    : Integer;
                                        const dDataIni       : TDateTime = -1;
                                        const dDataFim       : TDateTime = -1;
                                        const sTipoImovel    : String = '';
                                        const sSitContratual : String = '' ) : OLEVariant;
  published

end;


implementation

uses uComunsImobiliario;

{ TCtrlRelComunsImobiliario }


constructor TCtrlRelComunsImobiliario.Create;
begin
  inherited;
end;

destructor TCtrlRelComunsImobiliario.Destroy;
begin
  inherited;
end;

procedure TCtrlRelComunsImobiliario.AfterInitialize;
begin
  inherited;
end;



function TCtrlRelComunsImobiliario.SelecionaRelParamContab(const iIdModulo,iIdRecDes,iIdImovel,iIdContrato: Integer; const sTipoImo: String;
                                                   const bReceita,bDespesa: Boolean; const iTipoContab,iOrdem: Integer): OLEVariant;
var sSql, sParam, sOrdem : String;
begin
  // Define Parâmetros
  sParam := '';
  if iIdModulo > 0   then sParam := sParam + ' AND PLI.IDMODULO = ' + IntToStr(iIdModulo);
  if iIdRecDes > 0   then sParam := sParam + ' AND PLI.IDTIPOCUSTORECIMO = ' + IntToStr(iIdRecDes);
  if iIdImovel > 0   then sParam := sParam + ' AND PLI.IDIMOVEL = ' + IntToStr(iIdImovel);
  if iIdContrato > 0 then sParam := sParam + ' AND PLI.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato);
  if sTipoImo <> ''  then sParam := sParam + ' AND PLI.CODTIPIMOVEL = ' + QuotedStr(sTipoImo);

  case iTipoContab of
    1 : sParam := sParam + ' AND PLI.FLGDIARIO =  ' + QuotedStr('S');
    2 : sParam := sParam + ' AND PLI.FLGDIARIO <> ' + QuotedStr('S');
  end;

  if bReceita or bDespesa then begin
    sParam := sParam + ' AND PLI.RECPAG IN(';
    if bReceita then sParam := sParam + QuotedStr('R') + ',';
    if bDespesa then sParam := sParam + QuotedStr('P') + ',';
    sParam := Copy(sParam,1,Length(sParam)-1) + ')';
  end;

  // Define Ordenação
  case iOrdem of
    1 : sOrdem := 'ORDER BY PLI.RECPAG, DESCPADRLANCIMO';
    2 : sOrdem := 'ORDER BY PLI.RECPAG, TCR.DESCCUSTORECIMO, PLI.CODTIPIMOVEL';
    3 : sOrdem := 'ORDER BY PLI.RECPAG, TCR.DESCCUSTORECIMO, IM.IMONOME, I.IMONOME';
    4 : sOrdem := 'ORDER BY PLI.RECPAG, TCR.DESCCUSTORECIMO, C.CONNUMERO';
    5 : sOrdem := 'ORDER BY PLI.RECPAG, TCR.DESCCUSTORECIMO, C.CONNOME';
    6 : sOrdem := 'ORDER BY PLI.RECPAG, PLI.CODTIPIMOVEL, TCR.DESCCUSTORECIMO';
    7 : sOrdem := 'ORDER BY PLI.RECPAG, IM.IMONOME, I.IMONOME, TCR.DESCCUSTORECIMO';
    8 : sOrdem := 'ORDER BY PLI.RECPAG, C.CONNUMERO, TCR.DESCCUSTORECIMO';
    9 : sOrdem := 'ORDER BY PLI.RECPAG, C.CONNOME, TCR.DESCCUSTORECIMO';
  end;

  // Define Sql
  sSql := 'SELECT PLI.DESCPADRLANCIMO, TI.CODTIPIMOVEL,     '+#13+
          '       TI.DESCTIPOIMOVEL,   TCR.DESCCUSTORECIMO, '+#13+
          '       DECODE(I.IMONOME,NULL,NULL,IM.IMONOME || '' - '' || I.IMONOME)    AS IMOVEL_EXTENSO,   '+#13+
          '       DECODE(C.CONNUMERO,NULL,NULL,C.CONNUMERO || '' - '' || C.CONNOME) AS CONTRATO_EXTENSO, '+#13+
          '       DECODE(PLI.FLGDIARIO,NULL,''N'',PLI.FLGDIARIO) AS FLGDIARIO,  '+#13+
          '       DECODE(PLI.RECPAG,''P'',''DESPESAS'',''RECEITAS'') AS DSC_RECPAG, '+#13+
          '       DECODE(PLI.RECPAG,''P'',PLI.CONTARESULT,PLI.CONTADEBCRE) AS CONTADEBITO,  '+#13+
          '       DECODE(PLI.RECPAG,''P'',PLI.CONTADEBCRE,PLI.CONTARESULT) AS CONTACREDITO, '+#13+
          '       DECODE(PLI.RECPAG,''P'',PCR.PLANOME,PCD.PLANOME) AS DSC_CONTADEBITO, '+#13+
          '       DECODE(PLI.RECPAG,''P'',PCD.PLANOME,PCR.PLANOME) AS DSC_CONTACREDITO '+#13+
          '  FROM IMOVEL I,          IMOVEL IM,            '+#13+
          '       CONTRATOIMOVEL C,  PADRLANCIMOVEL PLI,   '+#13+
          '       TIPOIMOVEL TI,     TIPOCUSTORECIMOV TCR, '+#13+
          '       PLANOCONTA PCR,    PLANOCONTA PCD        '+#13+
          ' WHERE PLI.IDIMOVEL = I.IDIMOVEL(+)      '+#13+
          '   AND I.IDIMOVELMESTRE = IM.IDIMOVEL(+) '+#13+
          '   AND PLI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+)     '+#13+
          '   AND PLI.CODTIPIMOVEL = TI.CODTIPIMOVEL(+)            '+#13+
          '   AND PLI.IDTIPOCUSTORECIMO = TCR.IDTIPOCUSTORECIMO(+) '+#13+
          '   AND PLI.PLANO = PCR.PLANO(+)          '+#13+
          '   AND PLI.CONTARESULT = PCR.PLACONTA(+) '+#13+
          '   AND PLI.PLANO = PCD.PLANO(+)          '+#13+
          '   AND PLI.CONTADEBCRE = PCD.PLACONTA(+) '+#13+ sParam +#13+ sOrdem;

  Result := GetDataPacket( sSql );
end;

function TCtrlRelComunsImobiliario.SelecionaRelPrevImob(const iIdModulo, iMes, iAno, iTipoCusto: Integer; const sTipoImovel: String;
                                                const iOrdem: Integer): OLEVariant;
var sSql, sParam, sOrdem : String;
begin
  // Define Parâmetros
  sParam := ' AND LP.MESCOMPETENCIA = ' + IntToStr(iMes) +
            ' AND LP.ANOCOMPETENCIA = ' + IntToStr(iAno);
  if iIdModulo  > 0    then sParam := sParam + ' AND TC.IDMODULO = ' + IntToStr(iIdModulo);
  if iTipoCusto > 0    then sParam := sParam + ' AND LP.IDTIPOCUSTORECIMO = ' + IntToStr(iTipoCusto);
  if sTipoImovel <> '' then sParam := sParam + ' AND LP.CODTIPIMOVEL      = ' + QuotedStr(sTipoImovel);

  // Define Ordenação
  case iOrdem of
    1 : sOrdem := ' ORDER BY TC.DESCCUSTORECIMO, LP.CODTIPIMOVEL ';
    2 : sOrdem := ' ORDER BY LP.CODTIPIMOVEL, TC.DESCCUSTORECIMO ';
  end;

  sSql := 'SELECT ' + QuotedStr(ComunsImobiliario.Competencia(iMes,iAno)) + ' AS DSC_COMPETENCIA, '+#13+
          '       LP.CODTIPIMOVEL, LP.IDTIPOCUSTORECIMO, TC.DESCCUSTORECIMO,         '+#13+
          '       DECODE(TC.RECCUSTO,''R'',''Receita'',''Despesa'') AS DSC_RECPAG,   '+#13+
          '       LP.MESCOMPETENCIA, LP.ANOCOMPETENCIA, LP.FLGAJUSTEANUAL,           '+#13+
          '       SUM(LP.VLRMES) AS VLRMES ' +#13+
          '  FROM LANCPREVIMOB LP, TIPOCUSTORECIMOV TC        '+#13+
          ' WHERE LP.IDTIPOCUSTORECIMO = TC.IDTIPOCUSTORECIMO '+#13+ sParam +#13+
          'GROUP BY ' + QuotedStr(ComunsImobiliario.Competencia(iMes,iAno)) + ', '+#13+
          '       LP.CODTIPIMOVEL, LP.IDTIPOCUSTORECIMO, TC.DESCCUSTORECIMO,     '+#13+
          '       DECODE(TC.RECCUSTO,''R'',''Receita'',''Despesa''),             '+#13+
          '       LP.MESCOMPETENCIA, LP.ANOCOMPETENCIA, LP.FLGAJUSTEANUAL        '+#13+ sOrdem;

  Result := GetDataPacket( sSql );
end;

function TCtrlRelComunsImobiliario.SelecionaRelPrevImobImo(const iMes, iAno, iTipoCusto: Integer;
                                                   const sTipoImovel: String): OLEVariant;
var sSql, sParam : String;
begin
  // Define Parâmetros
  sParam := ' AND P.MESCOMPETENCIA = ' + IntToStr(iMes) +
            ' AND P.ANOCOMPETENCIA = ' + IntToStr(iAno);
  if iTipoCusto > 0    then sParam := sParam + ' AND P.IDTIPOCUSTORECIMO = ' + IntToStr(iTipoCusto);
  if sTipoImovel <> '' then sParam := sParam + ' AND P.CODTIPIMOVEL      = ' + QuotedStr(sTipoImovel);

  // Define Sql
  sSql := 'SELECT P.CODTIPIMOVEL, P.IDTIPOCUSTORECIMO, I.IDIMOVELMESTRE, '+#13+
          '       I.IMONOME, P.DTINICTBDIARIA, P.DTFIMCTBDIARIA, P.VLRMES '+#13+
          '  FROM PREVIMOB P, IMOVEL I, IMOVEL IM '+#13+
          ' WHERE I.IDIMOVELMESTRE = IM.IDIMOVEL  '+#13+
          '   AND P.IDIMOVEL = I.IDIMOVEL         '+#13+ sParam +#13+
          ' ORDER BY I.IMONOME ';

  Result := GetDataPacket( sSql );
end;

function TCtrlRelComunsImobiliario.SelecionaRelPrevImobMes(const iMes, iAno, iTipoCusto: Integer;
                                                   const sTipoImovel: String): OLEVariant;
var sSql, sParam : String;
begin
  // Define Parâmetros
  sParam := ' AND P.MESCOMPETENCIA = ' + IntToStr(iMes) +
            ' AND P.ANOCOMPETENCIA = ' + IntToStr(iAno);
  if iTipoCusto > 0    then sParam := sParam + ' AND P.IDTIPOCUSTORECIMO = ' + IntToStr(iTipoCusto);
  if sTipoImovel <> '' then sParam := sParam + ' AND P.CODTIPIMOVEL      = ' + QuotedStr(sTipoImovel);

  sSql := 'SELECT P.CODTIPIMOVEL, P.IDTIPOCUSTORECIMO, IM.IDIMOVEL AS IDMESTRE, '+#13+
          '       IM.IMONOME AS DSC_MESTRE, ''N'' AS FLGAJUSTEANUAL, '+#13+
          '       SUM(P.VLRMES) AS VLRMES '+#13+
          '  FROM PREVIMOB P, IMOVEL I, IMOVEL IM '+#13+
          ' WHERE I.IDIMOVELMESTRE = IM.IDIMOVEL  '+#13+
          '   AND P.IDIMOVEL = I.IDIMOVEL         '+#13+ sParam +#13+
          'GROUP BY P.CODTIPIMOVEL, P.IDTIPOCUSTORECIMO, IM.IDIMOVEL, IM.IMONOME '+#13+
          'ORDER BY DSC_MESTRE ';

  Result := GetDataPacket( sSql );
end;


function TCtrlRelComunsImobiliario.SelecionaProvisaoPerdas(const iIdEmpresa,
                                                                 iIdModulo: Integer;
                                                           const dDataLimite: TDateTime;
                                                           const sTipoImovel: string = '';
                                                           const sSitContratual: String = '';

                                                           // SOL 126229 KTN 658658 Ricardo A.
                                                           const iPatro: Integer = 0;
                                                           const iPlano: Integer = 0
                                                           ): OLEVariant;
var sSql, sParam, sDataLimite : String;
    cdsTemp : TCMClientDataSet;
begin
  sParam := ' AND LI.IDPESSOA = ' + IntToStr(iIdEmpresa) +#13+
            ' AND LI.IDMODULO = ' + IntToStr(iIdModulo)  +#13;

   // SOL 126222 KTN 657725 Ricardo A.
   if ( iPatro > -1 ) or ( iPlano > -1 ) then
   begin
     sParam := sParam + ' AND EXISTS(' +
        '       SELECT 1' +
// Felipe de Oliveira sol 131666    ktn 755009
        '       FROM PLANOPATROXIMOVEL PPI, CONTRATOXIMOVEL CXI' +
        '       WHERE CXI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL' +
        '       AND CXI.IDIMOVEL = PPI.IDIMOVEL';
     if ( iPatro > -1 ) then
       sParam := sParam + '       AND PPI.IDPATRO = ' + IntToStr( iPatro );
     if ( iPlano > -1 ) then
       sParam := sParam + '       AND PPI.IDPLANOPREV = ' + IntToStr( iPlano );
     sParam := sParam + '       )';
   end;
   // FIM SOL 126222 KTN 657725 Ricardo A.

  if sTipoImovel <> '' then
    sParam := sParam + ' AND LI.CODTIPIMOVEL = ' + QuotedStr(sTipoImovel);

  sDataLimite := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYY',dDataLimite)) + ',''DD/MM/YYYY'')';

  sSql := 'SELECT L.CONNUMERO, L.IDCONTRATOIMOVEL, L.CODTIPIMOVEL, T.DESCTIPOIMOVEL,(0) CODDOCUMENTO,           '+#13+
          '       DECODE(L.IDCONTRATOIMOVEL, NULL, L.IDFORCLI, NULL) AS IDFORCLI,              '+#13+
          '       DECODE(L.CONNOME, NULL, L.NF_FORCLI, L.CONNOME) AS CONNOME, L.CONDATAINICIO, '+#13+
          '       DECODE(L.STATUS_CONTRATO, ''V'', ''Vigente'', ''E'', ''Encerrado'', ''R'', ''Rescindido'', ''S'', ''Suspenso'', NULL) AS STATUS_CONTRATO, '+#13+
          '       0 AS PERCENTUAL, 0 AS VLR_PROVISAO, ''                  '' AS DSC_GRUPO,     '+#13+
          '       0 AS SLD_VINCENDO, 0 AS TOT_DIFERENCA,   '+#13+
          // SOL: 61969 Kintana: 523506 - Alterado por Arnaldo V. Scarin
          // Foi adicionado o Campo Descr_SitContr
          '       SC.DESCRICAO AS DESCR_SITCONTR,' + #13 +
          '       MIN(L.DATAVENCIMENTO) AS DATAVENCIMENTO, '+#13+
          '       ROUND(' + sDataLimite + ' - MIN(L.DATAVENCIMENTO), 0) AS DIAS, '+#13+
          '       SUM( NVL(L.VLR_DOCUM,0) + NVL(C.TOT_CORRECAO,0) ) AS DIFERENCA '+#13+
          '  FROM TIPOIMOVEL T, '+#13+
          // SOL: 61969 Kintana: 523506 - Alterado por Arnaldo V. Scarin
          // Foi adicionado a tabela para Join
          '       CONTRATOIMOVEL CI,'+#13+
          '       SITCONTIMOB SC,'+#13+
          '       ( SELECT LI.IDCONTRATOIMOVEL,  LI.CODTIPIMOVEL, LI.DATAVENCIMENTO,     '+#13+
          '                LI.IDFORCLI, LI.CODDOCUMENTO, C.FLGSTATUS AS STATUS_CONTRATO, '+#13+
          '                C.CONNOME, C.CONNUMERO, C.CONDATAINICIO, P.NOME AS NF_FORCLI, '+#13+
          '                SUM( '+#13+
          '                     DECODE(RTRIM(LD.OPERACAO), ''1'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + '+#13+
          '                     DECODE(RTRIM(LD.OPERACAO), ''2'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + '+#13+
          '                     DECODE(RTRIM(LD.OPERACAO), ''3'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + '+#13+
          '                     DECODE(RTRIM(LD.OPERACAO), ''4'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0) '+#13+
          '                    ) - '+#13+
          '                SUM( DECODE(RTRIM(LD.OPERACAO), ''5'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0)) AS VLR_DOCUM '+#13+

          //Marilza Colpani - SOL 85344/261/KTN 653747
          //Inclusão dos joins no FROM para otimizar a query.
          //'           FROM DOCUMENTO D, LANCTODOCUM LD, LANCAMENTOSIMOVEL LI, TIPOIMOVEL T, CONTRATOIMOVEL C, PESSOA P, '+#13+
          //Inicio
          '           FROM TIPOIMOVEL T '+#13+
          '           JOIN LANCAMENTOSIMOVEL LI '+#13+
          '             ON (T.CODTIPIMOVEL = LI.CODTIPIMOVEL) '+#13+
          '           JOIN CONTRATOIMOVEL C  '+#13+
          '             ON (LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL) '+#13+
          '           JOIN PESSOA P '+#13+
          '             ON (LI.IDFORCLI = P.IDPESSOA) '+#13+
          '           JOIN DOCUMENTO D '+#13+
          '             ON (LI.CODDOCUMENTO = D.CODDOCUMENTO) '+#13+
          '           JOIN LANCTODOCUM LD '+#13+
          '             ON (LD.CODDOCUMENTO = D.CODDOCUMENTO) '+#13+
          '           JOIN '+#13+
          //Fim
          '                ( SELECT CODDOCUMENTO, VALOR '+#13+
          '                    FROM LANCTODOCUM         '+#13+
          '                   WHERE RTRIM(OPERACAO) = ''1'' OR RTRIM(OPERACAO) = ''2'' OR RTRIM(OPERACAO) = ''3'') TRD '+#13+
          '             ON (D.CODDOCUMENTO = TRD.CODDOCUMENTO )  '+#13+
 // Vinicius - 29/08/05 - Retirado para poder considerar inadimplencias passadas
          '          WHERE ( LD.DATALANCTO <= ' + sDataLimite + ' )      '+#13+
          '            AND ( LD.ESTORNO IS NULL )                        '+#13+
          '            AND ( LI.FLGESTORNADO IS NULL ) ' + #13 +

          //Marilza Colpani - SOL 85344/261/KTN 653747
          //Os comandos que estão comentados encontram-se em outras partes da mesma query.

       //   '                ( LI.CODDOCUMENTO   = D.CODDOCUMENTO )        '+#13+
       //   '            AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL )  '+#13+
        //  '            AND ( LI.IDFORCLI = P.IDPESSOA )                  '+#13+

          //'            AND ( LD.DATALANCTO <= ' + sDataLimite + ' )      '+#13+

         // '            AND ( LD.ESTORNO IS NULL )                        '+#13+

          // Vinicius - Ajustes incluidos por analise na CBS 01/11/2006

          //Marilza Colpani - SOL 85344/261/KTN 653747
          //'            AND ( LI.FLGESTORNADO IS NULL ) ' + #13 +

//          '            AND ( LI.CODDOCUMENTO NOT IN ( SELECT IDDOCUMENTO              ' + #13 +
//          '                                             FROM CONCILIADOC              ' + #13 +
//          '                                            WHERE FLGTIPO = ''A''          ' + #13 +
//          '                                              AND IDPARCFINANCIMOV IS NULL ' + #13 +
//          '                                              AND DATA <= ' + sDataLimite + ' ) )' + #13 +

          '            AND ( NOT EXISTS ( SELECT 1   ' + #13 +
          '                                 FROM CONCILIADOC C            ' + #13 +
          '                                WHERE FLGTIPO = ''A''          ' + #13 +
          '                                  AND IDPARCFINANCIMOV IS NULL ' + #13 +
          '                                  AND DATA <= ' + sDataLimite + #13 +
          '            AND C.IDDOCUMENTO = LI.CODDOCUMENTO) )' + #13 +



          // Fim - Vinicius 01/11/2006

          '            AND ( C.FLGTIPOCONTRATO = ''L'' OR LI.IDCONTRATOIMOVEL IS NULL ) '+#13+
          '            AND ( D.RECPAG = ''R'' )                          '+#13+ sParam +#13+

          //Marilza Colpani - SOL 85344/261/KTN 653747
          //'            AND ( D.CODDOCUMENTO = LD.CODDOCUMENTO )          '+#13+

          //'            AND ( D.CODDOCUMENTO = TRD.CODDOCUMENTO )         '+#13+

          //'            AND ( LI.CODTIPIMOVEL = T.CODTIPIMOVEL )          '+#13+

          '            AND ( (LD.CODALTERADOR IS NULL) OR                '+#13+
          '                  (LD.CODALTERADOR IN(T.CODALTMULTA, T.CODALTJUROS, T.CODALTCORRMON) AND'+#13+
          '                   LD.DATALANCTO < TO_DATE(''31/12/2004'',''DD/MM/YYYY'') AND           '+#13+
          '                   NOT EXISTS ( SELECT 1 FROM LANCOPERDIAIMOB                           '+#13+
          '                                        WHERE CODDOCUMENTO = LD.CODDOCUMENTO AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'')) ) OR     '+#13+

          '                  (LD.CODALTERADOR <> NVL(T.CODALTMULTA,0) AND       '+#13+
          '                   LD.CODALTERADOR <> NVL(T.CODALTJUROS,0) AND       '+#13+
          '                   LD.CODALTERADOR <> NVL(T.CODALTCORRMON,0)) )      '+#13+
          '            AND ( (LI.DATALIMITE IS NOT NULL AND LI.DATALIMITE <= ' + sDataLimite + ') OR '+#13+
          '                  (LI.DATALIMITE IS NULL AND LI.DATAVENCIMENTO <= ' + sDataLimite + ') )  '+#13+
          '          GROUP BY  '+#13+
          '                LI.IDCONTRATOIMOVEL, LI.CODTIPIMOVEL, LI.DATAVENCIMENTO, '+#13+
          '                LI.IDFORCLI, LI.CODDOCUMENTO, C.FLGSTATUS, C.CONNOME,    '+#13+
          '                C.CONNUMERO, C.CONDATAINICIO, P.NOME                     '+#13+
          '       ) L, '+#13+
          '       (    '+#13+
          '        SELECT L.IDCONTRATOIMOVEL, L.CODDOCUMENTO, SUM(L.VLRACUM) AS TOT_CORRECAO '+#13+
          '          FROM LANCOPERDIAIMOB L, PARAMIMOVEL P,                                  '+#13+
          '               ( SELECT CODDOCUMENTO, L2.IDOPERACAO, MAX(L2.DATAOPER) AS DTAPUR   '+#13+
          '                   FROM LANCOPERDIAIMOB L2, PARAMIMOVEL P2       '+#13+
          '                  WHERE ( L2.IDOPERACAO = P2.IDOPERATUALMULTA OR '+#13+
          '                          L2.IDOPERACAO = P2.IDOPERATUALJUROS OR '+#13+
          '                          L2.IDOPERACAO = P2.IDOPERATUALCM )     '+#13+
          '                    AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') AND DATAOPER <= ' + sDataLimite               +#13+
          '                  GROUP BY CODDOCUMENTO, L2.IDOPERACAO ) D       '+#13+
          '         WHERE L.DATAOPER = D.DTAPUR                  '+#13+
          '           AND L.CODDOCUMENTO = D.CODDOCUMENTO AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'')       '+#13+
          '           AND L.IDOPERACAO   = D.IDOPERACAO          '+#13+
          '           AND ( L.IDOPERACAO = P.IDOPERATUALMULTA OR '+#13+
          '                 L.IDOPERACAO = P.IDOPERATUALJUROS OR '+#13+
          '                 L.IDOPERACAO = P.IDOPERATUALCM )     '+#13+
          '         GROUP BY L.IDCONTRATOIMOVEL, L.CODDOCUMENTO  '+#13+
          '       ) C '+#13+
          ' WHERE L.CODTIPIMOVEL     = T.CODTIPIMOVEL(+)         '+#13+
          '   AND L.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+)     '+#13+
          '   AND L.CODDOCUMENTO     = C.CODDOCUMENTO(+)         '+#13+
          // SOL: 61969 Kintana: 523506 - Alterado por Arnaldo V. Scarin
          // Foi adicionado o Join entre as tabelas
          '   AND ( L.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL(+) ) ' + #13 +
          '   AND ( CI.IDSITCONTIMOB   = SC.IDSITCONTIMOB(+) ) ' + #13;
  // SOL: 61969 Kintana: 523506 - Alterado por Arnaldo V. Scarin
  // Foi adicionado o Filtro quando selecionado o Tipo de Situação Contratual
  If sSitContratual <> '' then
    sSql := sSql + ' AND SC.IDSITCONTIMOB = ' + QuotedStr(sSitContratual) + #13;

  sSql := sSql +
          '   AND ROUND(NVL(L.VLR_DOCUM,0) + NVL(C.TOT_CORRECAO,0),2) > 0'+#13+

          ' GROUP BY L.CONNUMERO, L.IDCONTRATOIMOVEL, L.CODTIPIMOVEL, T.DESCTIPOIMOVEL, '+#13+
          '       DECODE(L.IDCONTRATOIMOVEL, NULL, L.IDFORCLI, NULL),                   '+#13+
          '       DECODE(L.CONNOME, NULL, L.NF_FORCLI, L.CONNOME), L.CONDATAINICIO,     '+#13+
          '       DECODE(L.STATUS_CONTRATO, ''V'', ''Vigente'', ''E'', ''Encerrado'', ''R'', ''Rescindido'', ''S'', ''Suspenso'', NULL), '+#13+
          '       0, 0, ''                  '', 0, 0,'+#13+
          // SOL: 61969 Kintana: 523506 - Alterado por Arnaldo V. Scarin
          // Foi adicionado o Campo Descr_SitContr
          '       SC.DESCRICAO' + #13 +

          // Eraldo Silva SOL 146052 KINTANA 1017172
          //' ORDER BY DIAS, CODTIPIMOVEL, DESCTIPOIMOVEL, CONNOME ';


          //Eraldo Silva SOL 146052 KINTANA 1017172 INICIO
          '       UNION ' + #13 +
//          ' SELECT L.CONNUMERO, L.IDCONTRATOIMOVEL, L.CODTIPIMOVEL, T.DESCTIPOIMOVEL,L.CODDOCUMENTO,           '+#13+
          // Alterado por FHBS - 05/04/2019 - SIG83337
          // Após a migração para o banco Tibero foi necessário colocar o TO_CHAR dentro do NVL
          // pois o retorno estava transformando o campo em MEMO.
          //' SELECT NVL(L.CONNUMERO, L.CODDOCUMENTO) AS CONNUMERO, L.IDCONTRATOIMOVEL, L.CODTIPIMOVEL, T.DESCTIPOIMOVEL,L.CODDOCUMENTO,           '+#13+
          ' SELECT NVL(L.CONNUMERO, TO_CHAR(L.CODDOCUMENTO)) AS CONNUMERO, L.IDCONTRATOIMOVEL, L.CODTIPIMOVEL, T.DESCTIPOIMOVEL,L.CODDOCUMENTO,           '+#13+
          // Fim - Alterado por FHBS - 05/04/2019 - SIG83337
          '       DECODE(L.IDCONTRATOIMOVEL, NULL, L.IDFORCLI, NULL) AS IDFORCLI,              '+#13+
          '       DECODE(L.CONNOME, NULL, L.NF_FORCLI, L.CONNOME) AS CONNOME, L.CONDATAINICIO, '+#13+
          '       DECODE(L.STATUS_CONTRATO, ''V'', ''Vigente'', ''E'', ''Encerrado'', ''R'', ''Rescindido'', ''S'', ''Suspenso'', NULL) AS STATUS_CONTRATO, '+#13+
          '       0 AS PERCENTUAL, 0 AS VLR_PROVISAO, ''                  '' AS DSC_GRUPO,     '+#13+
          '       0 AS SLD_VINCENDO, 0 AS TOT_DIFERENCA,   '+#13+
          '       SC.DESCRICAO AS DESCR_SITCONTR,' + #13 +
          '       MIN(L.DATAVENCIMENTO) AS DATAVENCIMENTO, '+#13+
          '       ROUND(' + sDataLimite + ' - MIN(L.DATAVENCIMENTO), 0) AS DIAS, '+#13+
          '       SUM( NVL(L.VLR_DOCUM,0) + NVL(C.TOT_CORRECAO,0) ) AS DIFERENCA '+#13+
          '  FROM TIPOIMOVEL T, '+#13+
          '       CONTRATOIMOVEL CI,'+#13+
          '       SITCONTIMOB SC,'+#13+
          '       ( SELECT LI.IDCONTRATOIMOVEL,  LI.CODTIPIMOVEL, LI.DATAVENCIMENTO,     '+#13+
          '                LI.IDFORCLI, LI.CODDOCUMENTO, C.FLGSTATUS AS STATUS_CONTRATO, '+#13+
          '                C.CONNOME, C.CONNUMERO, C.CONDATAINICIO, P.NOME AS NF_FORCLI, '+#13+
          '                SUM( '+#13+
          '                     DECODE(RTRIM(LD.OPERACAO), ''1'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + '+#13+
          '                     DECODE(RTRIM(LD.OPERACAO), ''2'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + '+#13+
          '                     DECODE(RTRIM(LD.OPERACAO), ''3'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + '+#13+
          '                     DECODE(RTRIM(LD.OPERACAO), ''4'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0) '+#13+
          '                    ) - '+#13+
          '                SUM( DECODE(RTRIM(LD.OPERACAO), ''5'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0)) AS VLR_DOCUM '+#13+
          '           FROM TIPOIMOVEL T '+#13+
          '           JOIN LANCAMENTOSIMOVEL LI '+#13+
          '             ON (T.CODTIPIMOVEL = LI.CODTIPIMOVEL) '+#13+
          '           LEFT JOIN CONTRATOIMOVEL C  '+#13+
          '             ON (LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL) '+#13+
          '           JOIN PESSOA P '+#13+
          '             ON (LI.IDFORCLI = P.IDPESSOA) '+#13+
          '           JOIN DOCUMENTO D '+#13+
          '             ON (LI.CODDOCUMENTO = D.CODDOCUMENTO) '+#13+
          '           JOIN LANCTODOCUM LD '+#13+
          '             ON (LD.CODDOCUMENTO = D.CODDOCUMENTO) '+#13+
          '           JOIN '+#13+
          '                ( SELECT CODDOCUMENTO, VALOR '+#13+
          '                    FROM LANCTODOCUM         '+#13+
          '                   WHERE RTRIM(OPERACAO) = ''1'' OR RTRIM(OPERACAO) = ''2'' OR RTRIM(OPERACAO) = ''3'') TRD '+#13+
          '             ON (D.CODDOCUMENTO = TRD.CODDOCUMENTO )  '+#13+
          '          WHERE ( LD.DATALANCTO <= ' + sDataLimite + ' )      '+#13+
          '            AND ( LD.ESTORNO IS NULL )                        '+#13+
          '            AND ( LI.FLGESTORNADO IS NULL ) ' + #13 +
          '            AND ( NOT EXISTS ( SELECT 1   ' + #13 +
          '                                 FROM CONCILIADOC C            ' + #13 +
          '                                WHERE FLGTIPO = ''A''          ' + #13 +
          '                                  AND IDPARCFINANCIMOV IS NULL ' + #13 +
          '                                  AND DATA <= ' + sDataLimite + #13 +
          '            AND C.IDDOCUMENTO = LI.CODDOCUMENTO) )' + #13 +
          '            AND ( C.FLGTIPOCONTRATO = ''L'' OR LI.IDCONTRATOIMOVEL IS NULL ) '+#13+
          '            AND ( D.RECPAG = ''R'' )                          '+#13+ sParam +#13+
          '            AND ( (LD.CODALTERADOR IS NULL) OR                '+#13+
          '                  (LD.CODALTERADOR IN(T.CODALTMULTA, T.CODALTJUROS, T.CODALTCORRMON) AND'+#13+
          '                   LD.DATALANCTO < TO_DATE(''31/12/2004'',''DD/MM/YYYY'') AND           '+#13+
          '                   NOT EXISTS ( SELECT 1 FROM LANCOPERDIAIMOB                           '+#13+
          '                                        WHERE CODDOCUMENTO = LD.CODDOCUMENTO AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'')) ) OR     '+#13+

          '                  (LD.CODALTERADOR <> NVL(T.CODALTMULTA,0) AND       '+#13+
          '                   LD.CODALTERADOR <> NVL(T.CODALTJUROS,0) AND       '+#13+
          '                   LD.CODALTERADOR <> NVL(T.CODALTCORRMON,0)) )      '+#13+
          '            AND ( (LI.DATALIMITE IS NOT NULL AND LI.DATALIMITE <= ' + sDataLimite + ') OR '+#13+
          '                  (LI.DATALIMITE IS NULL AND LI.DATAVENCIMENTO <= ' + sDataLimite + ') )  '+#13+
          '          GROUP BY  '+#13+
          '                LI.IDCONTRATOIMOVEL, LI.CODTIPIMOVEL, LI.DATAVENCIMENTO, '+#13+
          '                LI.IDFORCLI, LI.CODDOCUMENTO, C.FLGSTATUS, C.CONNOME,    '+#13+
          '                C.CONNUMERO, C.CONDATAINICIO, P.NOME                     '+#13+
          '       ) L, '+#13+
          '       (    '+#13+
          '        SELECT L.IDCONTRATOIMOVEL, L.CODDOCUMENTO, SUM(L.VLRACUM) AS TOT_CORRECAO '+#13+
          '          FROM LANCOPERDIAIMOB L, PARAMIMOVEL P,                                  '+#13+
          '               ( SELECT CODDOCUMENTO, L2.IDOPERACAO, MAX(L2.DATAOPER) AS DTAPUR   '+#13+
          '                   FROM LANCOPERDIAIMOB L2, PARAMIMOVEL P2       '+#13+
          '                  WHERE ( L2.IDOPERACAO = P2.IDOPERATUALMULTA OR '+#13+
          '                          L2.IDOPERACAO = P2.IDOPERATUALJUROS OR '+#13+
          '                          L2.IDOPERACAO = P2.IDOPERATUALCM )     '+#13+
          '                    AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') AND DATAOPER <= ' + sDataLimite               +#13+
          '                  GROUP BY CODDOCUMENTO, L2.IDOPERACAO ) D       '+#13+
          '         WHERE L.DATAOPER = D.DTAPUR                  '+#13+
          '           AND L.CODDOCUMENTO = D.CODDOCUMENTO AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'')       '+#13+
          '           AND L.IDOPERACAO   = D.IDOPERACAO          '+#13+
          '           AND ( L.IDOPERACAO = P.IDOPERATUALMULTA OR '+#13+
          '                 L.IDOPERACAO = P.IDOPERATUALJUROS OR '+#13+
          '                 L.IDOPERACAO = P.IDOPERATUALCM )     '+#13+
          '         GROUP BY L.IDCONTRATOIMOVEL, L.CODDOCUMENTO  '+#13+
          '       ) C '+#13+
          ' WHERE L.CODTIPIMOVEL     = T.CODTIPIMOVEL(+)         '+#13+
          '   AND L.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+)     '+#13+
          '   AND L.CODDOCUMENTO     = C.CODDOCUMENTO(+)         '+#13+
          '   AND ( L.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL(+) ) ' + #13 +
          '   AND ( CI.IDSITCONTIMOB   = SC.IDSITCONTIMOB(+) ) ' + #13;
  If sSitContratual <> '' then
    sSql := sSql + ' AND SC.IDSITCONTIMOB = ' + QuotedStr(sSitContratual) + #13;

  sSql := sSql +
          '   AND ROUND(NVL(L.VLR_DOCUM,0) + NVL(C.TOT_CORRECAO,0),2) > 0'+#13+
          '   AND L.IDCONTRATOIMOVEL IS NULL '+#13+   //ERALDO
          '   AND NOT EXISTS (SELECT 1 FROM PARCFINANCIMOV P WHERE P.CODDOCUMENTO = L.CODDOCUMENTO) ' +#13+//marcio sanches spinosa xxxxxx
          ' GROUP BY L.CONNUMERO, L.IDCONTRATOIMOVEL, L.CODTIPIMOVEL, T.DESCTIPOIMOVEL,L.CODDOCUMENTO, '+#13+
          '       DECODE(L.IDCONTRATOIMOVEL, NULL, L.IDFORCLI, NULL),                   '+#13+
          '       DECODE(L.CONNOME, NULL, L.NF_FORCLI, L.CONNOME), L.CONDATAINICIO,     '+#13+
          '       DECODE(L.STATUS_CONTRATO, ''V'', ''Vigente'', ''E'', ''Encerrado'', ''R'', ''Rescindido'', ''S'', ''Suspenso'', NULL), '+#13+
          '       0, 0, ''                  '', 0, 0,'+#13+
          '       SC.DESCRICAO' + #13 +
          ' ORDER BY DIAS, CODTIPIMOVEL, DESCTIPOIMOVEL, CONNOME ';

  //Eraldo Silva SOL 146052 KINTANA 1017172 FIM




               CMDebugToFile(sSql,'C:\Planus\Temp\sqlAjustaProvCtrlImob.txt');  //eraldo

   cdsTemp := TCMClientDataSet.Create( nil );
   cdsTemp.Data := GetDataPacket( sSql );

   //Cássio Rovaroto - SIG nº 103988 - Início
   if dDataLimite < StrToDate('01/01/2021') then
   begin
    with cdsTemp do
    begin
      while not Eof do
      begin
        if FieldByName('DIAS').AsInteger < 61 then
        begin
          Delete;
        end
        else
        begin
          Edit;
          if FieldByName('DIAS').AsInteger < 121 then
          begin
            FieldByName('PERCENTUAL').AsInteger := 25;
            FieldByName('DSC_GRUPO').AsString := 'de 61 à 120 dias';
          end
          else
            if FieldByName('DIAS').AsInteger < 241 then
            begin
              FieldByName('PERCENTUAL').AsInteger := 50;
              FieldByName('DSC_GRUPO').AsString := 'de 121 à 240 dias';
            end
            else
              if FieldByName('DIAS').AsInteger < 361 then
              begin
                FieldByName('PERCENTUAL').AsInteger := 75;
                FieldByName('DSC_GRUPO').AsString := 'de 241 à 360 dias';
              end
              else
              begin
                FieldByName('PERCENTUAL').AsInteger := 100;
                FieldByName('DSC_GRUPO').AsString := 'acima de 360 dias';
              end;

          FieldByName('TOT_DIFERENCA').AsFloat := ComunsImobiliario.Arredonda(FieldByName('DIFERENCA').AsFloat,2);
          FieldByName('VLR_PROVISAO').AsFloat  := ComunsImobiliario.Arredonda(FieldByName('DIFERENCA').AsFloat *
                                                                              FieldByName('PERCENTUAL').AsFloat / 100, 2);
          Post;
          Next;
        end;
      end;
    end;
   end
   else
   begin
    while not cdsTemp.Eof do
      begin
        if cdsTemp.FieldByName('DIAS').AsInteger < 31 then
        begin
          cdsTemp.Delete;
        end
        else
        begin
          cdsTemp.Edit;
          if cdsTemp.FieldByName('DIAS').AsInteger < 61 then
          begin
            cdsTemp.FieldByName('PERCENTUAL').AsInteger := 1;
            cdsTemp.FieldByName('DSC_GRUPO').AsString := 'de 31 à 60 dias';
          end
          else
            if cdsTemp.FieldByName('DIAS').AsInteger < 91 then
            begin
              cdsTemp.FieldByName('PERCENTUAL').AsInteger := 5;
              cdsTemp.FieldByName('DSC_GRUPO').AsString := 'de 61 à 90 dias';
            end
            else
              if cdsTemp.FieldByName('DIAS').AsInteger < 121 then
              begin
                cdsTemp.FieldByName('PERCENTUAL').AsInteger := 10;
                cdsTemp.FieldByName('DSC_GRUPO').AsString := 'de 91 à 120 dias';
              end
              else
                if cdsTemp.FieldByName('DIAS').AsInteger < 181 then
                begin
                  cdsTemp.FieldByName('PERCENTUAL').AsInteger := 25;
                  cdsTemp.FieldByName('DSC_GRUPO').AsString := 'de 121 à 180 dias';
                end
                else
                  if cdsTemp.FieldByName('DIAS').AsInteger < 241 then
                  begin
                    cdsTemp.FieldByName('PERCENTUAL').AsInteger := 50;
                    cdsTemp.FieldByName('DSC_GRUPO').AsString := 'de 181 à 240 dias';
                  end
                  else
                    if cdsTemp.FieldByName('DIAS').AsInteger < 361 then
                    begin
                      cdsTemp.FieldByName('PERCENTUAL').AsInteger := 75;
                      cdsTemp.FieldByName('DSC_GRUPO').AsString := 'de 241 à 360 dias';
                    end
                    else
                    begin
                      cdsTemp.FieldByName('PERCENTUAL').AsInteger := 100;
                      cdsTemp.FieldByName('DSC_GRUPO').AsString := 'acima de 360 dias';
                    end;

          cdsTemp.FieldByName('TOT_DIFERENCA').AsFloat := ComunsImobiliario.Arredonda(cdsTemp.FieldByName('DIFERENCA').AsFloat,2);
          cdsTemp.FieldByName('VLR_PROVISAO').AsFloat  := ComunsImobiliario.Arredonda(cdsTemp.FieldByName('DIFERENCA').AsFloat *
                                                                              cdsTemp.FieldByName('PERCENTUAL').AsFloat / 100, 2);
          cdsTemp.Post;
          cdsTemp.Next;
        end;
      end;
   end;
   //Cássio Rovaroto - SIG nº 103988 - Fim
   // Retorna o cds Calculado
   Result := cdsTemp.Data;
end;

// -------------------------------------------------------------
// Procedure a ser executada a cada calculo de regra ( INTERNA )
// -------------------------------------------------------------
procedure TCtrlRelComunsImobiliario.OnResultRegra(Sender: TObject);
var fResult : Extended;
begin

end;


function TCtrlRelComunsImobiliario.SelecionaProvPerdaTipoImo(const iIdModulo,
                                                                   iIdOperacao    : Integer;
                                                             const dDataIni,
                                                                   dDataFim       : TDateTime;
                                                             const sTipoImovel,
                                                                   sSitContratual : String): OLEVariant;
var sSql, sParam: String;
begin
   sParam := '';
   if sTipoImovel <> '' then
     sParam := sParam + ' AND L.CODTIPIMOVEL = ' + QuotedStr(sTipoImovel) + #13;
   if dDataIni > 0 then
     sParam := sParam + ' AND L.DATAOPER >= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYY',dDataIni)) + ',''DD/MM/YYYY'')' + #13;
   if dDataFim > 0 then
     sParam := sParam + ' AND L.DATAOPER <= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYY',dDataFim)) + ',''DD/MM/YYYY'')' + #13;

   sSql := 'SELECT T.DESCCUSTORECIMO, L.CODTIPIMOVEL, L.DATAOPER, I.DESCTIPOIMOVEL, L.VLRDIA '+#13+
           '  FROM LANCOPERIMOB L,     '+#13+
           '       TIPOCUSTORECIMOV T, '+#13+
           '       TIPOIMOVEL I        '+#13+
           ' WHERE L.IDOPERACAO   = T.IDTIPOCUSTORECIMO '+#13+
           '   AND L.CODTIPIMOVEL = I.CODTIPIMOVEL      '+#13+
           '   AND L.IDOPERACAO   = ' + IntToStr(iIdOperacao) +#13+
           '   AND L.IDMODULO     = ' + IntToStr(iIdModulo)   +#13+
           sParam +#13;
   // SOL: 61969 Kintana: 523506 - Alterado por Arnaldo V. Scarin
   // Foi adicionado o Join entre as tabelas
   If sSitContratual <> '' then
     sSql := sSql +
           '   And Exists (Select 1'+#13+
           '               FROM LANCOPERDIAIMOB LB,' + #13 +
           '                    CONTRATOIMOVEL C,' + #13 +
           '                    SITCONTIMOB SC,' + #13 +
           '                    PESSOA P' + #13 +
           '               WHERE LB.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+)' + #13 +
           '                 AND LB.IDFORCLI = P.IDPESSOA(+)' + #13 +
           '                 AND C.IDSITCONTIMOB  = SC.IDSITCONTIMOB(+)' + #13 +
           '                 AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'')' + #13 +
           '                 AND LB.IDOPERACAO   = L.IDOPERACAO' + #13 +
           '                 AND LB.IDMODULO     = L.IDMODULO' + #13 +
           '                 AND LB.DATAOPER     = L.DATAOPER' + #13 +
           '                 AND LB.VLRDIA IS NOT NULL' + #13 +
           '                 AND SC.IDSITCONTIMOB = ' + QuotedStr(sSitContratual)+')'+#13;
   sSql := sSql + ' ORDER BY T.DESCCUSTORECIMO, L.DATAOPER, I.DESCTIPOIMOVEL ';

   Result := GetDataPacket( sSql );
end;

function TCtrlRelComunsImobiliario.SelecionaProvPerdaContrato(const iIdModulo,
                                                                    iIdOperacao    : Integer;
                                                              const dDataIni,
                                                                    dDataFim       : TDateTime;
                                                              const sTipoImovel,
                                                                    sSitContratual : String): OLEVariant;
var sSql, sParam: String;
begin
   sParam := '';
   if sTipoImovel <> '' then
     sParam := sParam + ' AND L.CODTIPIMOVEL = ' + QuotedStr(sTipoImovel);
   if dDataIni > 0 then
     sParam := sParam + ' AND L.DATAOPER >= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYY',dDataIni)) + ',''DD/MM/YYYY'')';
   if dDataFim > 0 then
     sParam := sParam + ' AND L.DATAOPER <= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYY',dDataFim)) + ',''DD/MM/YYYY'')';
   // SOL: 61969 Kintana: 523506 - Alterado por Arnaldo V. Scarin
   // Foi adicionado o Join entre as tabelas
   If sSitContratual <> '' then
     sParam := sParam + ' And ( C.IDSITCONTIMOB = '+QuotedStr(sSitContratual)+' ) ';

   sSql := 'SELECT L.DATAOPER, L.CODTIPIMOVEL, C.CONNUMERO, L.VLRDIA, '+#13+
           '       DECODE(L.IDCONTRATOIMOVEL,NULL, P.RAZAOSOCIAL, C.CONNOME) AS CONNOME '+#13+
           // SOL: 61969 Kintana: 523506 - Alterado por Arnaldo V. Scarin
           // Foi adicionado o Campo Descr_SitContr
           '       ,SC.DESCRICAO AS DESCR_SITCONTR' + #13 +
           '  FROM LANCOPERDIAIMOB L, '+#13+
           '       CONTRATOIMOVEL C,  '+#13+
           // SOL: 61969 Kintana: 523506 - Alterado por Arnaldo V. Scarin
           // Foi adicionado a Tabela SitContImob
           '       SITCONTIMOB SC,    ' + #13 +
           '       PESSOA P           '+#13+
           ' WHERE L.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+) '+#13+
           '   AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') AND L.IDFORCLI = P.IDPESSOA(+) '+#13+
           // SOL: 61969 Kintana: 523506 - Alterado por Arnaldo V. Scarin
           // Foi adicionado o Join entre as tabelas
           '   AND ( C.IDSITCONTIMOB     = SC.IDSITCONTIMOB (+) ) ' + #13 +
           '   AND L.IDOPERACAO   = ' + IntToStr(iIdOperacao) +#13+
           '   AND L.IDMODULO     = ' + IntToStr(iIdModulo)   +#13+
           '   AND L.VLRDIA IS NOT NULL '+#13+
           sParam +#13+
           ' ORDER BY DATAOPER, CODTIPIMOVEL, CONNOME ';

   Result := GetDataPacket( sSql );
end;

end.
