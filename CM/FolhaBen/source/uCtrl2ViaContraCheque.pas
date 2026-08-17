(* -----------------------------------------------------------------------------
ATENÇÃO:
  Antes de executar qualquer alteração no contra-cheque, verificar com o
  responsável pelo sistema de Auto-Atendimento se esta alteração não implicará
  em alguma modificação do sistema. Caso isto não ocorra, haverá o risco dos
  valores ou layout dos contra-cheque emitidos pela web ou por outros sistemas
  não coincidirem.
  DAVID - 20/10/2003
------------------------------------------------------------------------------*)

unit uCtrl2ViaContraCheque;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes;

Type
  TCtrl2ViaContraCheque = class(TCmControlObject)

  private

  protected

  public
    function ListaRecebedor(PIdTitular : integer): Olevariant;
    function ListaHistorico(PIdTitular, PIdRecebedor : integer): Olevariant;
    function AgrupaRubrica: boolean;
    function BuscaDadosRelatorio(prmFLGUSACODRUBEXT : Integer; bFlgAgrupaRubrica : Boolean;
                                 sIdHstFolhaBenef, sIdTitular, sIdRecebedor : string): Olevariant;
    function BuscaDadosFundacao(pIdfundacao : integer): OleVariant;
    function BuscaDataInicio(pIDRUBRICA, pIDPLANOPREV, pIDRESPONSAVEL, pIDPESSJUR : integer): String;
    function BuscaFLGUSACODRUBEXT: Integer;
    function ListaDataPagamento(PIdTitular, PIdRecebedor: integer): Olevariant;
    function BuscaDadosRelRegUnico(
             prmFLGUSACODRUBEXT: Integer; bFlgAgrupaRubrica: Boolean;
             sIdHstFolhaBenef, sIdTitular, sIdRecebedor: string): Olevariant;
  published

end;

implementation

{ TCtrl2ViaContraCheque }

function TCtrl2ViaContraCheque.ListaRecebedor(PIdTitular : integer): Olevariant;
begin
  result := GetDataPacket(' SELECT                                '+
                          '	BF.IDRESPONSAVEL AS IDRECEBEDOR,  '+
                          '	P.NOME,                           '+
                          '	BF.IDTITULAR,                     '+
                          '	''B'' AS TIPO                     '+
                          ' FROM                                  '+
                          '	BFCIARIOTITPLAN BF,               '+
                          '	PESSOA P                          '+
                          ' WHERE BF.IDTITULAR = '+IntTostr(PIdtitular)+
                          '   AND P.IDPESSOA = BF.IDRESPONSAVEL   '+
                          ' UNION                                 '+
                          ' SELECT                                '+
                          '	RI.IDFAVORECIDO AS IDRECEBEDOR,   '+
                          '	P.NOME,                           '+
                          '	RI.IDPESSOA AS IDTITULAR,         '+
                          '	''P'' AS TIPO                     '+
                          ' FROM                                  '+
                          '	RUBRICAINDIV RI,                  '+
                          '	PESSOA P                          '+
                          ' WHERE RI.IDPESSOA = '+IntTostr(PIdtitular)+
                          '   AND P.IDPESSOA = RI.IDFAVORECIDO    '+
                          '   AND RI.FLGPENSAOALIM = 1            '+
                          '   AND RI.FLGTPRUBMANUT = 1            '+
                          ' UNION                                 '+
                          ' SELECT                                '+
                          '     PP.IDPESSOA AS IDRECEBEDOR,       '+
                          '     P.NOME,                           '+
                          '     PP.IDPESSOA AS IDTITULAR,         '+
                          '     ''B'' AS TIPO                     '+
                          ' FROM                                  '+
                          '     PARTPREVPLAN PP,                  '+
                          '     PESSOA P                          '+
                          ' WHERE PP.IDPESSOA = '+IntTostr(PIdtitular)+
                          '   AND P.IDPESSOA = PP.IDPESSOA        ');
end;


function TCtrl2ViaContraCheque.ListaHistorico(PIdTitular, PIdRecebedor : integer): Olevariant;
begin
  result := GetDataPacket(' SELECT	DISTINCT                                       '+
                          '  	HIS.HISTORICO,                                       '+
                          '   HST.MESCOBRANCA,                                     '+
                          '   HST.IDHSTFOLHABENEF                                  '+
                          ' FROM HISTRUBSAL HST, HSTFOLHABENEF HIS                 '+
                          ' WHERE HST.IDTITULAR = '        +IntToStr(PIdTitular)    +
                          '       AND HST.IDRESPONSAVEL = '+IntToStr(PIdRecebedor)  +
                          '       AND HIS.IDHSTFOLHABENEF = HST.IDHSTFOLHABENEF    '+
                          ' ORDER BY  HST.MESCOBRANCA DESC                         ');
end;

function TCtrl2ViaContraCheque.AgrupaRubrica: boolean;
var cdsAux : TcmClientDataSet;
begin
  cdsAux := TcmClientDataSet.Create(nil);
  try
    result := False;
    cdsAux.Data := GetDataPacket('SELECT VALORPARAM FROM PARAMFOLHA WHERE NOMEPARAM = ''FLGAGRUPARUBRICA''');
    if not cdsAux.IsEmpty then
      result := not cdsAux.FieldByName('VALORPARAM').asInteger = 0;
  finally
    cdsAux.Free;
  end;
end;

function TCtrl2ViaContraCheque.BuscaDadosRelatorio(prmFLGUSACODRUBEXT: Integer; bFlgAgrupaRubrica: Boolean;
                                                   sIdHstFolhaBenef, sIdTitular, sIdRecebedor: string): Olevariant;
var sSql : string;
begin
    sSql := ' SELECT HST.IDRESPONSAVEL, HST.IDPLANOPREV, HST.IDPESSJUR, HST.MESCOBRANCA, '+
            ' PVD.IDPROVENTO, TIT.NOME AS TITULAR, BEN.NOME, PT.NOME AS PATROCINADORA, ';


    If prmFLGUSACODRUBEXT = 0 Then
      sSql := sSql + ' PVD.IDPROVENTO AS CODIGO, PVD.DESCRICAO AS DESCRICAO, '
    Else
{Inicio Tavares 21/01/2002}
//      sSql := sSql + ' PVD.CODPROVDESC AS CODIGO, PVD.DESCRPROVDESC AS DESCRICAO, ';
      sSql := sSql + ' NVL(PVD.CODPROVDESC, PVD.IDPROVENTO) AS CODIGO, PVD.DESCRPROVDESC AS DESCRICAO, ';
{Fim Tavares 21/01/2002}


    sSql := sSql + ' ELP.MATRICULA, PPP.INSCRICAONUMERO, PFI.DATANASC, '+
                   ' PVD.FLGDESCONTO, PL.NOME AS PLANO, HST.NUMPROCINSS, '+
                   ' DECODE(PFI.FLGISENTOIRRF,1,''SIM'',''NÃO'') ISENTOIRRF, '+
                   ' PFI.NUMDEPIRRF, AG.NUMAGENCIA, HST.CONTACORRENTE, PVD.FLGESPECIAL, ';

    sSql := sSql + ' EP.IDPESSOA, EP.IDENDERECO, EP.LOGRADOURO, EP.CEP, '+
                   ' EST.CODESTADO, EP.NUMERO, EP.COMPLEMENTO, EP.BAIRRO, '+
                   ' CID.NOME AS CIDADE, EP.TIPOENDERECO, EP.NOME, '+
                   ' AGN.NOME AS AGENCIA, '+
                   ' DECODE(PVD.FLGDESCONTO,0,''PROVENTO'',1,''DESCONTO'',''INFORMATIVA'') AS PD, '+
                   ' DECODE(PVD.FLGDESCONTO,1,''D'',0,''P'',''I'') AS TPRUBRICA, ';

    If bFlgAgrupaRubrica Then
      sSql := sSql + ' BC.NOME AS BANCO, '+
                     ' SUBSTR(HST.MES,6,2)||'+'''/'''+'||SUBSTR(HST.MES,1,4) AS MES, '+
                     ' HST.VALORPROVENTO, HST.DATAPAGAMENTO AS DATACREDITO, '+
                     ' DECODE(PVD.FLGDESCONTO,2,HST.VALORINFO||'' (I)'',0,NULL,1, '+
                     ' DECODE(HST.VALORRECEBIDO-HST.VALORPROVENTO,0, '+
                     ' DECODE(HST.VALORINFO,0,NULL,HST.VALORINFO||'' (I)''), '+
                     ' HST.VALORRECEBIDO-HST.VALORPROVENTO||'' (R)'')) INFORMATIVO, '+
                     ' DECODE(PVD.FLGDESCONTO,0,HST.VALORPROVENTO,0.0) AS VLPROVENTO, '+
                     ' DECODE(PVD.FLGDESCONTO,1,HST.VALORPROVENTO,0.0) AS VLDESCONTO, '+
                     ' HST.VALORPROVENTO - HST.VALORRECEBIDO AS RESIDUO '
    Else
      sSql := sSql + ' BC.NOME AS BANCO, '+
                     ' SUBSTR(HST.MES,6,2)||'+'''/'''+'||SUBSTR(HST.MES,1,4) AS MES, '+
                     ' HST.MESCOBRANCA, HST.DATAPAGAMENTO AS DATACREDITO, '+
                     ' SUM(HST.VALORPROVENTO) VALORPROVENTO, '+
                     ' DECODE(PVD.FLGDESCONTO,2,SUM(HST.VALORINFO)||'' (I)'',0,NULL,1, '+
                     ' DECODE(SUM(HST.VALORRECEBIDO-HST.VALORPROVENTO),0, '+
                     ' DECODE(SUM(HST.VALORINFO),0,NULL,SUM(HST.VALORINFO)||'' (I)''), '+
                     ' SUM(HST.VALORRECEBIDO-HST.VALORPROVENTO)||'' (R)'')) INFORMATIVO, '+
                     ' SUM(DECODE(PVD.FLGDESCONTO,0,HST.VALORPROVENTO,0.0)) AS VLPROVENTO, '+
                     ' SUM(DECODE(PVD.FLGDESCONTO,1,HST.VALORPROVENTO,0.0)) AS VLDESCONTO, '+
                     ' SUM(HST.VALORPROVENTO - HST.VALORRECEBIDO) AS RESIDUO ';

    sSql := sSql + (* FROM *)
                   ' FROM HISTRUBSAL HST, ELEGPATRO ELP, PARTPREVPLAN PPP, PLANPREV PL, '+
                   ' PESSOA TIT, PESSOA BEN, PESSOAFISICA PFI, PROVDESC PVD, ENDPESS EP, '+
                   ' PESSOA BC, PESSOA AGN , PESSOA PT, '+
                   ' BANCO BCO, AGENCIABANCARIA AG, CIDADES CID, ESTADO EST, '+
                   ' HSTFOLHABENEF H '+//Bruno Bastos - 06/04/2004
                   (* WHERE *)
//início - André Tavares - 29/12/2003 - pendência 15660
//                   ' WHERE HST.IDHSTFOLHABENEF = '+sIdHstFolhaBenef+
                   ' WHERE HST.IDHSTFOLHABENEF in ('+sIdHstFolhaBenef+ ')'+
                   ' AND HST.IDHSTFOLHABENEF = H.IDHSTFOLHABENEF '+//Bruno Bastos - 06/04/2004
//fim - André Tavares - 29/12/2003 - pendência 15660
                   ' AND HST.IDTITULAR = ' + sIdTitular+
                   ' AND HST.IDRESPONSAVEL = ' + sIdRecebedor+
                   ' AND HST.IDPLANOPREV = PL.IDPLANOPREV '+
                   ' AND PVD.IDPROVENTO = HST.IDRUBRICA '+
                   ' AND ELP.IDPESSOA = HST.IDTITULAR '+
                   ' AND ELP.IDPESSJUR = HST.IDPATRO '+
                   ' AND PPP.IDPESSJUR = HST.IDPATRO '+
                   //Bruno Bastos - 06/04/2004 ' AND PPP.IDPLANOPREV = HST.IDPLANOORIGEM '+
                   //Bruno Bastos - 06/04/2004 - Início
                   ' AND ((PPP.IDPLANOPREV = HST.IDPLANOORIGEM AND H.FLGTIPOFOLHA <> 2) OR '+
                   '     (PPP.IDPLANOPREV = HST.IDPLANOPREV AND H.FLGTIPOFOLHA = 2)) '+
                   //Bruno Bastos - 06/04/2004 - Fim
                   ' AND PPP.IDPESSOA = HST.IDTITULAR '+
                   ' AND PPP.IDPESSJUR = PT.IDPESSOA '+
                   ' AND PPP.IDPESSOA  = TIT.IDPESSOA '+
                   ' AND PFI.IDPESSOA = HST.IDRESPONSAVEL '+

{ Inicio Tavares 21/01/2003
                   ' AND EP.IDPESSOA(+) = HST.IDRESPONSAVEL '+

                   (* IMPEDE QUE A QRY RETORNE 2 LINHAS *)
                   ' AND BEN.IDENDCORRESP = EP.IDENDERECO '+
                   (* --------------------------------- *)
}
                   ' AND  BEN.IDPESSOA     = EP.IDPESSOA(+)   '+
                   ' AND  BEN.IDENDCORRESP = EP.IDENDERECO(+) '+
{ Fim Tavares 21/01/2003 }

                   ' AND EP.IDCIDADES = CID.IDCIDADES(+) '+
                   ' AND EST.IDESTADO(+) = CID.IDESTADO '+
                   ' AND BEN.IDPESSOA = HST.IDRESPONSAVEL '+
                   ' AND RTRIM(HST.NUMBANCO) = BCO.NUMBANCO(+) '+
                   ' AND HST.NUMAGENCIA = AG.NUMAGENCIA(+) '+
                   ' AND AGN.IDPESSOA(+) = AG.IDPESSOA '+
                   ' AND BC.IDPESSOA(+) = BCO.IDPESSOA '+
                   ' AND ((AG.IDBANCO = BCO.IDPESSOA) OR (AG.IDBANCO IS NULL)) ';

    If bFlgAgrupaRubrica Then Begin
//início - André Tavares - 29/12/2003 - pendência 15660
{
      sSql := sSql + ' ORDER BY BEN.NOME, PVD.FLGDESCONTO, ';
      sSql := sSql + ' CODIGO ';
}
      sSql := sSql + ' HST.MESCOBRANCA DESC, ';
      sSql := sSql + ' BEN.NOME ASC,         ';
      sSql := sSql + ' PVD.FLGDESCONTO ASC,  ';
      sSql := sSql + ' CODIGO ASC            ';
//fim - André Tavares - 29/12/2003 - pendência 15660

      {
      If prmFLGUSACODRUBEXT = 0 Then
        sSql := sSql + ' PVD.IDPROVENTO '
      Else
        sSql := sSql + ' PVD.CODPROVDESC ';
      }
    End
    Else
    begin
      sSql := sSql + ' GROUP BY HST.MESCOBRANCA, ';
      If prmFLGUSACODRUBEXT = 0 Then
        sSql := sSql + ' PVD.IDPROVENTO, PVD.FLGESPECIAL, HST.IDRESPONSAVEL, HST.IDPLANOPREV, '+
                       ' HST.IDPESSJUR, TIT.NOME, BEN.NOME, PT.NOME, PVD.IDPROVENTO, PVD.DESCRICAO, '+
                       ' ELP.MATRICULA, PPP.INSCRICAONUMERO, PFI.DATANASC, PVD.FLGDESCONTO, '+
                       ' PL.NOME, HST.NUMPROCINSS, PFI.FLGISENTOIRRF, '+
                       ' PFI.NUMDEPIRRF, AG.NUMAGENCIA, HST.CONTACORRENTE, BC.NOME, HST.MES, HST.MESCOBRANCA, '+
                       ' HST.DATAPAGAMENTO, EP.IDPESSOA, EP.IDENDERECO, EP.LOGRADOURO, '+
                       ' EP.CEP, EST.CODESTADO, EP.NUMERO, EP.COMPLEMENTO, EP.BAIRRO, CID.NOME, EP.TIPOENDERECO, '+
                       ' EP.NOME, AGN.NOME, DECODE(PVD.FLGDESCONTO, 1, ''D'', 0, ''P'', ''I'') '+
                       (* ORDER BY *)
//início - André Tavares - 29/12/2003 - pendência 15660
//                       ' ORDER BY BEN.NOME, PVD.FLGDESCONTO, CODIGO ' //PVD.IDPROVENTO '
                       ' ORDER BY HST.MESCOBRANCA DESC, BEN.NOME ASC, PVD.FLGDESCONTO ASC, CODIGO ASC' //PVD.IDPROVENTO '
//fim - André Tavares - 29/12/2003 - pendência 15660
      Else
        sSql := sSql + ' NVL(PVD.CODPROVDESC, PVD.IDPROVENTO), ' + // ' PVD.CODPROVDESC, ' +
                       ' PVD.FLGESPECIAL, HST.IDRESPONSAVEL, HST.IDPLANOPREV, '+
                       ' HST.IDPESSJUR, TIT.NOME, BEN.NOME, PT.NOME, PVD.IDPROVENTO, PVD.DESCRPROVDESC, '+
                       ' ELP.MATRICULA, PPP.INSCRICAONUMERO, PFI.DATANASC, PVD.FLGDESCONTO, '+
                       ' PL.NOME, HST.NUMPROCINSS, PFI.FLGISENTOIRRF, '+
                       ' PFI.NUMDEPIRRF, AG.NUMAGENCIA, HST.CONTACORRENTE, BC.NOME, HST.MES, HST.MESCOBRANCA, '+
                       ' HST.DATAPAGAMENTO, EP.IDPESSOA, EP.IDENDERECO, EP.LOGRADOURO, '+
                       ' EP.CEP, EST.CODESTADO, EP.NUMERO, EP.COMPLEMENTO, EP.BAIRRO, CID.NOME, EP.TIPOENDERECO, '+
                       ' EP.NOME, AGN.NOME, DECODE(PVD.FLGDESCONTO, 1, ''D'', 0, ''P'', ''I'') '+
                       (* ORDER BY *)
//início - André Tavares - 29/12/2003 - pendência 15660
//                       ' ORDER BY BEN.NOME, PVD.FLGDESCONTO, CODIGO ' //PVD.CODPROVDESC '
                       ' ORDER BY HST.MESCOBRANCA DESC, BEN.NOME ASC, PVD.FLGDESCONTO ASC, CODIGO ASC ' //PVD.CODPROVDESC '
//fim - André Tavares - 29/12/2003 - pendência 15660
    End;

    result := GetDataPacket(sSql);

end;

function TCtrl2ViaContraCheque.BuscaDadosFundacao(pIdfundacao : integer): OleVariant;
begin
  result := GetDataPacket(' SELECT P.NOME , P.RAZAOSOCIAL, E.LOGRADOURO,                              '+
                          '        E.NUMERO , E.COMPLEMENTO, E.BAIRRO,                                '+
                          '        C.NOME AS CIDADE, C.CODESTADO, E.CEP, I.IMAGEM, I.IDIMAGEM,        '+
                          '        (E.LOGRADOURO||'', ''||E.NUMERO) AS ENDERECO,                      '+
                          '        (E.BAIRRO||'' - ''||C.NOME||'' - ''||C.CODESTADO) AS BARCIDUF      '+
                          ' FROM PESSOA P, ENDPESS E, IMAGENS I, CIDADES C                            '+
                          ' WHERE (P.IDPESSOA = ' + IntToStr(pIdFundacao)+ ') AND                     '+
                          '       (E.IDPESSOA(+) = P.IDPESSOA) AND                                    '+
                          '       (E.IDCIDADES   = C.IDCIDADES(+))  AND                               '+
                          '       (I.IDIMAGEM(+) = P.IDIMAGEM)');
end;




function TCtrl2ViaContraCheque.BuscaDataInicio(pIDRUBRICA, pIDPLANOPREV, pIDRESPONSAVEL,
                                               pIDPESSJUR : integer): String;
var cdsAux : TcmClientDataSet;
begin
  cdsAux := TcmClientDataSet.Create(nil);
  try
    result := '';
    cdsAux.Data := GetDataPacket(' SELECT BBF.DATAINICIO FROM BENEFBFCIARIO BBF, BENEFPLANPREV BPV '+
                                 ' WHERE  BPV.IDRUBRICA = '+ IntToStr(pIDRUBRICA)                   +
                                 ' AND BPV.IDPLANOPREV = '+ IntToStr(pIDPLANOPREV)                  +
                                 ' AND BBF.IDPLANOPREV = BPV.IDPLANOPREV                           '+
                                 ' AND BBF.IDBENEFICIO = BPV.IDBENEFICIO                           '+
                                 ' AND BBF.IDPESSOA = '+ IntToStr(pIDRESPONSAVEL)                   +
                                 ' AND BBF.IDPESSJUR = '+ IntToStr(pIDPESSJUR)                      +
                                 ' AND BBF.IDSITBENEFICIO = 1');
    if not cdsAux.IsEmpty then
      result := cdsAux.FieldByName('DATAINICIO').asString;
  finally
    cdsAux.Free;
  end;
end;


function TCtrl2ViaContraCheque.BuscaFLGUSACODRUBEXT: Integer;
var cdsAux : TcmClientDataSet;
begin
  cdsAux := TcmClientDataSet.Create(nil);
  try
    result := -1;
    cdsAux.Data := GetDataPacket(' SELECT VALORPARAM FROM PARAMFOLHA WHERE NOMEPARAM = ''FLGUSACODRUBEXT'' ');
    if not cdsAux.IsEmpty then
       result := cdsAux.FieldByName('VALORPARAM').asInteger;
  finally
    cdsAux.Free;
  end;
end;

function TCtrl2ViaContraCheque.ListaDataPagamento(PIdTitular,
  PIdRecebedor: integer): Olevariant;
begin
  result := GetDataPacket(' SELECT DISTINCT                                        '+
                          '   HST.DATAPAGAMENTO,                                   '+
                          '   HST.IDHSTFOLHABENEF                                  '+
                          ' FROM HISTRUBSAL HST                                    '+
                          ' WHERE HST.IDTITULAR = '        +IntToStr(PIdTitular)    +
                          '       AND HST.IDRESPONSAVEL = '+IntToStr(PIdRecebedor)  +
                          '       AND HST.DATAPAGAMENTO IS NOT NULL                '+
                          ' ORDER BY  HST.DATAPAGAMENTO  DESC                      ');
end;


// este método somente será utilizado no auto-atendimento
function TCtrl2ViaContraCheque.BuscaDadosRelRegUnico(
  prmFLGUSACODRUBEXT: Integer; bFlgAgrupaRubrica: Boolean;
  sIdHstFolhaBenef, sIdTitular, sIdRecebedor: string): Olevariant;
var
  cdsLocal : TCmClientDataSet;
  iLprovento, iLdesconto, iLinformativo, i : integer;
  sSql : string;
  TotProvent, TotDesc, TotResid, Liquido : Double;
begin
  iLprovento    := 1;
  iLdesconto    := 1;
  iLinformativo := 1;

  TotProvent := 0;
  TotDesc    := 0;
  TotResid   := 0;
  Liquido    := 0;

  sSql := ' SELECT ';
  cdsLocal := TCmClientDataSet.Create( nil );
  try
    cdsLocal.Data := BuscaDadosRelatorio( prmFLGUSACODRUBEXT, bFlgAgrupaRubrica,
                                          sIdHstFolhaBenef, sIdTitular, sIdRecebedor);

    for i := 0 to cdslocal.fieldCount - 1 do
    begin
      if (cdsLocal.Fields[i].FieldName <> 'MES') and (cdsLocal.Fields[i].FieldName <> 'CODIGO') and
         (cdsLocal.Fields[i].FieldName <> 'DESCRICAO') and (cdsLocal.Fields[i].FieldName <> 'RESIDUO') then
        sSql := sSql + ' NVL( ' + quotedStr(cdsLocal.FieldByName(cdsLocal.Fields[i].FieldName).asString) + ', ''  '')' + ' AS '+ cdsLocal.Fields[i].FieldName + ',';
    end;

    cdsLocal.First;
    while not cdsLocal.Eof do
    begin
      //rubricas proventos
      if cdsLocal.FieldByName('TPRUBRICA').asString = 'P' then
      begin
        sSql := sSql + quotedStr(cdsLocal.FieldByName('MES').asString)         + ' AS ' + 'MES_P' + intToStr(iLprovento)+ ',';
        sSql := sSql + 'NVL('+ quotedStr(BuscaDataInicio(cdsLocal.fieldByName('IDPROVENTO').asInteger, cdsLocal.fieldByName('IDPLANOPREV').asInteger,
                        cdsLocal.fieldByName('IDRESPONSAVEL').asInteger, cdsLocal.fieldByName('IDPESSJUR').asInteger)) +
                        ',''    '' ) AS DATAINICIO_P' + intToStr(iLprovento)+ ',';
        sSql := sSql + quotedStr(cdsLocal.FieldByName('CODIGO').asString)      + ' AS ' + 'CODIGO_P' + intToStr(iLprovento)+ ',';
        sSql := sSql + quotedStr(cdsLocal.FieldByName('DESCRICAO').asString)   + ' AS ' + 'DESCRICAO_P' + intToStr(iLprovento)+ ',';
        sSql := sSql + quotedStr(FormatFloat('#,##0.00', cdsLocal.FieldByName('VLPROVENTO').asFloat ))  + ' AS ' + 'VLPROVENTO_P' + intToStr(iLprovento)+ ',';
        sSql := sSql + quotedStr(FormatFloat('#,##0.00', cdsLocal.FieldByName('RESIDUO').asFloat ))     + ' AS ' + 'RESIDUO_P' + intToStr(iLprovento)+ ',';
        iLprovento := iLprovento + 1;
      end
      // rubricas de descontos
      else if cdsLocal.FieldByName('TPRUBRICA').asString = 'D' then
      begin
        sSql := sSql + quotedStr(cdsLocal.FieldByName('MES').asString)         + ' AS ' + 'MES_D' + intToStr(iLdesconto)+ ',';
        sSql := sSql + 'NVL('+ quotedStr(BuscaDataInicio(cdsLocal.fieldByName('IDPROVENTO').asInteger, cdsLocal.fieldByName('IDPLANOPREV').asInteger,
                        cdsLocal.fieldByName('IDRESPONSAVEL').asInteger, cdsLocal.fieldByName('IDPESSJUR').asInteger)) +
                        ',''    '' ) AS DATAINICIO_D' + intToStr(iLdesconto)+ ',';
        sSql := sSql + quotedStr(cdsLocal.FieldByName('CODIGO').asString)      + ' AS ' + 'CODIGO_D' + intToStr(iLdesconto)+ ',';
        sSql := sSql + quotedStr(cdsLocal.FieldByName('DESCRICAO').asString)   + ' AS ' + 'DESCRICAO_D' + intToStr(iLdesconto)+ ',';
        sSql := sSql + quotedStr(FormatFloat('#,##0.00', cdsLocal.FieldByName('VLDESCONTO').asFloat ))  + ' AS ' + 'VLDESCONTO_D' + intToStr(iLdesconto)+ ',';
        sSql := sSql + quotedStr(FormatFloat('#,##0.00', cdsLocal.FieldByName('RESIDUO').asFloat ))     + ' AS ' + 'RESIDUO_D' + intToStr(iLdesconto)+ ',';
        iLdesconto := iLdesconto + 1;
      end
      // Rubricas informativas   (DAVID - 20/10/2003)
      else if cdsLocal.FieldByName('TPRUBRICA').asString = 'I' then
      begin
        sSql := sSql + quotedStr(cdsLocal.FieldByName('MES').asString)         + ' AS ' + 'MES_I' + intToStr(iLinformativo)+ ',';
        sSql := sSql + 'NVL('+ quotedStr(BuscaDataInicio(cdsLocal.fieldByName('IDPROVENTO').asInteger, cdsLocal.fieldByName('IDPLANOPREV').asInteger,
                        cdsLocal.fieldByName('IDRESPONSAVEL').asInteger, cdsLocal.fieldByName('IDPESSJUR').asInteger)) +
                        ',''    '' ) AS DATAINICIO_I' + intToStr(iLinformativo)+ ',';
        sSql := sSql + quotedStr(cdsLocal.FieldByName('CODIGO').asString)      + ' AS ' + 'CODIGO_I' + intToStr(iLinformativo)+ ',';
        sSql := sSql + quotedStr(cdsLocal.FieldByName('DESCRICAO').asString)   + ' AS ' + 'DESCRICAO_I' + intToStr(iLinformativo)+ ',';
        sSql := sSql + quotedStr(FormatFloat('#,##0.00', cdsLocal.FieldByName('VALORPROVENTO').asFloat ))  + ' AS ' + 'VLINFORMATIVO_I' + intToStr(iLinformativo)+ ',';
        sSql := sSql + quotedStr(FormatFloat('#,##0.00', cdsLocal.FieldByName('RESIDUO').asFloat ))     + ' AS ' + 'RESIDUO_I' + intToStr(iLinformativo)+ ',';
        iLinformativo := iLinformativo + 1;
      end;

      // Totaliza os valores
      TotProvent := TotProvent + cdsLocal.FieldByName('VLPROVENTO').asFloat;
      TotDesc    := TotDesc + cdsLocal.FieldByName('VLDESCONTO').asFloat;
      TotResid   := TotResid + cdsLocal.FieldByName('RESIDUO').asFloat;
      Liquido    := TotProvent - TotDesc;

      cdsLocal.next;
    end; //WHILE

    // PÕE CAMPO VAZIO PARA O QUE RESTOU DOS 10 TAGS DE CADA CAMPO
    for i := iLdesconto to 10 do
    begin
      sSql := sSql + quotedStr('   ') + ' AS MES_D' + intToStr(i)+ ',';
      sSql := sSql + quotedStr('   ') + ' AS DATAINICIO_D' + intToStr(i)+ ',';
      sSql := sSql + quotedStr('   ') + ' AS CODIGO_D' + intToStr(i)+ ',';
      sSql := sSql + quotedStr('   ') + ' AS DESCRICAO_D' + intToStr(i)+ ',';
      sSql := sSql + quotedStr('   ') + ' AS VLDESCONTO_D' + intToStr(i)+ ',';
      sSql := sSql + quotedStr('   ') + ' AS RESIDUO_D' + intToStr(i)+ ',';
    end;

    // PÕE CAMPO VAZIO PARA O QUE RESTOU DOS 10 TAGS DE CADA CAMPO
    for i := iLprovento to 10 do
    begin
      sSql := sSql + quotedStr('   ') + ' AS MES_P' + intToStr(i)+ ',';
      sSql := sSql + quotedStr('   ') + ' AS DATAINICIO_P' + intToStr(i)+ ',';
      sSql := sSql + quotedStr('   ') + ' AS CODIGO_P' + intToStr(i)+ ',';
      sSql := sSql + quotedStr('   ') + ' AS DESCRICAO_P' + intToStr(i)+ ',';
      sSql := sSql + quotedStr('   ') + ' AS VLPROVENTO_P' + intToStr(i)+ ',';
      sSql := sSql + quotedStr('   ') + ' AS RESIDUO_P' + intToStr(i)+ ',';
    end;

    // PÕE CAMPO VAZIO PARA O QUE RESTOU DOS 10 TAGS DE CADA CAMPO
    for i := iLinformativo to 10 do
    begin
      sSql := sSql + quotedStr('   ') + ' AS MES_I' + intToStr(i)+ ',';
      sSql := sSql + quotedStr('   ') + ' AS DATAINICIO_I' + intToStr(i)+ ',';
      sSql := sSql + quotedStr('   ') + ' AS CODIGO_I' + intToStr(i)+ ',';
      sSql := sSql + quotedStr('   ') + ' AS DESCRICAO_I' + intToStr(i)+ ',';
      sSql := sSql + quotedStr('   ') + ' AS VLINFORMATIVO_I' + intToStr(i)+ ',';
      sSql := sSql + quotedStr('   ') + ' AS RESIDUO_I' + intToStr(i)+ ',';
    end;

    sSql := sSql + quotedStr(FormatFloat('#,##0.00', TotProvent)) + ' AS TOTALPROVENTOS,';
    sSql := sSql + quotedStr(FormatFloat('#,##0.00', TotDesc))    + ' AS TOTALDESCONTOS,';
    sSql := sSql + quotedStr(FormatFloat('#,##0.00', TotResid))   + ' AS TOTALRESIDUOS,';
    sSql := sSql + quotedStr(FormatFloat('#,##0.00', Liquido))    + ' AS TOTALLIQUIDO';

    sSql := sSql + ' FROM DUAL ';

    Result := GetDataPacket(sSql);

  finally
    cdsLocal.Free;
  end;

end;


end.

(* -----------------------------------------------------------------------------
ATENÇÃO:
  Antes de executar qualquer alteração no contra-cheque, verificar com o
  responsável pelo sistema de Auto-Atendimento se esta alteração não implicará
  em alguma modificação do sistema. Caso isto não ocorra, haverá o risco dos
  valores ou layout dos contra-cheque emitidos pela web ou por outros sistemas
  não coincidirem.
  DAVID - 20/10/2003
------------------------------------------------------------------------------*)

(*
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei de Brito Marins.                                       |
| PERÍODO DE IMPLEMENTAÇÃO: DE 20/12/2002 A 20/12/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (CBS) - Pendência 11154.                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Alteração na qry principal do relatório para     |
|   emitir contra-cheque de quem não tem conta corrente cadastrada.            |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS E ANDRÉ TAVARES                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 10/01/2003 A 10/01/2003                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - Recolocar o método ListaDataPagamento que foi retirado, pois este método |
|   é usado no contra-cheque pelo AutoAtendimento.                             |
|                                                                              |
|==============================================================================|
| DESENVOLVEDOR: ANDRÉ TAVARES                                                 |
| PERÍODO DE IMPLEMENTAÇÃO: DE 21/01/2003                                      |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:  FCRT                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: ALTERAÇÃO NA QUERY PRINCIPAL PARA EXIBIR O       |
|* CONTRACHEQUE DE QUEM NAO TEM NENHUM ENDERECO CADASTRADO                     |
|* implementado um nvl para colocar o codigo de rubrica interna como default.  |
|==============================================================================|
| DESENVOLVEDOR: ANDRÉ TAVARES                                                 |
| PERÍODO DE IMPLEMENTAÇÃO: DE 07/03/2003                                      |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:  FCRT                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Implementação do método BuscaDadosRelRegUnico    |
|para ser utilizado no autoatendimento                                         |
|==============================================================================|
| DESENVOLVEDOR: ANDRÉ TAVARES                                                 |
| PERÍODO DE IMPLEMENTAÇÃO: DE 13/05/2003                                      |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:  CM                                                                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Resolução da pendência 13995                     |
|==============================================================================|
| DESENVOLVEDOR: ANDRÉ TAVARES                                                 |
| PERÍODO DE IMPLEMENTAÇÃO: DE 29/12/2003                                      |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:  FCRT                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Resolução da pendência 15660                     |
|==============================================================================|

*)



