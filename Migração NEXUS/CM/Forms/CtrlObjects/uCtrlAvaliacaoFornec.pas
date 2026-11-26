{ --------------------------------------------------------------------------------------------------
//Rotina......: -
//SOL..........: 188852
//Kintana......: 1784376
//Data.........: 22/03/2013
//Responsável..: higor Nayde Ferreira
//Descrição....: Aviso para avaliação de fornecedores para pagamentos feitos antes da execução do serviço.
 --------------------------------------------------------------------------------------------------
// Autor(a)....: Edilaine Ferraresi
// Data........: 16/12/2013
// SOL.........: 188851
// Kintana.....: 1784371
// Rotina......: TrazMesAtual
// Descricao...: ajuste para considerar mes e ano da avaliação
//----------------------------------------------------------------------------------------------------
//Rotina......: -
//SOL..........: 188848
//Kintana......: 1784328
//Data.........: 09/01/2013
//Responsável..: Rodrigo de Brito Figueredo
//Descrição....: Modificado select usado para preencher o cdsAvaliacaoFornec para trazer o campo TRGUSERINCLUSAO
//----------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 176923
Nº KINTANA..: 1617670
Data........: 18/01/2013
Responsável.: Vander Campos 
Descrição...: Avaliação de fornecedores
--------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 136120
Nº KINTANA..: 812527
Data........: 28/11/2011
Responsável.: Thaise Amaral Martins
Descrição...: Criação da desta Ctrl Para auxiliar no cadastro de fornecedor
-----------------------------------------------------------------------------------------------------}

unit uCtrlAvaliacaoFornec;

interface
Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uDbAvaliacaofornec, Forms, DBTables;

Type
  TCtrlAvaliacaoFornec = class(TCmControlObject)
  protected
    procedure DoChangeDataBase; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbAvaliacaoFornec: TDbAvaliacaofornec;
    Fcds: TClientDataSet;
    procedure Setcds(const Value: TClientDataSet);

  public
    cdsAux: TClientDataSet;
    nIdAvaliacao: Integer; //higor Nayde Ferreira SOL 188852 KTN 1784376
    property cds: TClientDataSet read Fcds write Setcds;

    //-------------------------------------------------------------------------
    // Métodos
    //-------------------------------------------------------------------------
    constructor Create;  Override;
    destructor  Destroy; Override;
    //-------------------------------------------------------------------------
    // Metodos da Regra de Negócio
    //-------------------------------------------------------------------------
    function  Gravar: Boolean;
    function AvaliacaoFornec(IdPessoa: Integer): OleVariant;
    function LerSequencia: integer;
    //higor Nayde Ferreira SOL 188852 KTN 1784376
    function BuscaAvaliacao(IdForcl:integer):String;
    function BuscaDocumento(noDocumento,vidforcli: integer):integer;
    function AtualizaAvaliacao(sNODocumento,sCodDocumento,sIDAvaliacao,sIDForcli:integer):String;
    function AtualizaAvaliaDocumento(sNODocumento,sCodDocumento,sIDAvaliacao,sIDForcli:integer;sflgsExecutado : string; const sflgservico : string = 'S'; const sflgsDocumentoExec : string = 'N'):String;
    //higor Nayde Ferreira SOL 188852 KTN 1784376
    procedure GravarAlaviacao(iIDAVALIACAO, iIDNATUREZA, iIDPESSOA: Integer;
                              dDTAVALIACAO, dDTEXECUCAO: TDateTime;
                              sQUALIDADETECNICA, sDESCRICAOSERVICO, sMOTIVOQUALIFICACAO: String);
    function VerificaExistencia(idAvaliacao: Integer): Boolean;
    procedure DeletarAvaliacao(iIdPessoa: Integer; lIdsAvaliacao: String);
    function BuscarNomeContrato(IdContrato: Integer): String;
    function SelecionaDataAtual:TDateTime;
    function AvaliaFornec(CodCentrCust: String): Boolean; Overload;
    function AvaliaFornec(CodCentrCust: String; IDTIPOCUSTORECIMO: Integer): Boolean; Overload; //Thaise - para carregar os dados exclusivamente no AdminImob
    function TrazAnoAtual(idPessoa: Integer; DtEmissao: TDateTime): Boolean;
    function TrazMesAtual(idPessoa: Integer; DtEmissao: TDateTime): Boolean;
    function AbreJustificativas(idPessoa: Integer): OleVariant;
    function BuscarCentCust(CentCust: String): String;
    function FornecPassivo(IdPessoa: Integer): Boolean;

    function InsereValoresTemp(IDAVAL, IDUSER: Integer;
                                DTAVALIACAO, DTEXECUCAO, DTPESQUISA: TDateTime;
                                QUALIDADETECNICA, DESCRICAOSERVICO,
                                MOTIVOQUALIFICACAO, DESCRJUSTIFICATIVA, NATUREZA: String): String;
    function DeletaValoresTemp(IDUSER: Integer): String;

    function VerificaQualificacao(rIdPessoa: Integer): Boolean; //higor Nayde Ferreira SOL 188852 KTN 1784376

  end;


implementation

{ TCtrlAvaliacaoFornec }

function TCtrlAvaliacaoFornec.AbreJustificativas(
  idPessoa: Integer): OleVariant;
var sSql: String;
begin
  sSql:= 'SELECT DTAVALIACAO, DESCRJUSTIFICATIVA FROM AVALIACAOFORNEC ' +
         'WHERE IDPESSOA = ' + InttoStr(idPessoa) +
         ' AND DESCRJUSTIFICATIVA IS NOT NULL ';

  Result:= GetDataPacket(sSql);
end;

function TCtrlAvaliacaoFornec.AvaliacaoFornec(
  IdPessoa: Integer): OleVariant;
var sSql: String;
begin
  sSql:= 'SELECT AV.IDAVALIACAO, AV.IDNATUREZA, AV.IDPESSOA, AV.DTAVALIACAO, AV.DTEXECUCAO, AV.QUALIDADETECNICA,  ' + //Rodrigo de Brito Figueredo Sol 188848 Kintana 1784328
         'DECODE(AV.QUALIDADETECNICA, ''P'', ''Satisfatória'', ''N'', ''Insatisfatória'') QUALIDADETECNICAEXT, ' +    //Rodrigo de Brito Figueredo Sol 188848 Kintana 1784328
         'AV.DESCRICAOSERVICO, AV.MOTIVOQUALIFICACAO, AV.TRGUSERINCLUSAO, ' + //Rodrigo de Brito Figueredo Sol 188848 Kintana 1784328
         'AV.DESCRJUSTIFICATIVA, N.DESCRICAO,' +
         ' U.NOME, AV.TRGDTINCLUSAO, AV.NODOCUMENTO ' +// VANDER  //higor Nayde Ferreira SOL 188852 KTN 1784376
         ' FROM AVALIACAOFORNEC AV, NATUREZACONTR N' +
         //
         ', PESSOA U '+ // VANDER
         //
         'WHERE AV.IDNATUREZA = N.IDNATUREZA(+) ' +
         ' AND AV.IDPESSOA = ' + IntToStr(IdPessoa) +
         ' AND SUBSTR(av.trguserinclusao,3,30) = U.IDPESSOA(+) ' + // VANDER -
         //'AND DESCRJUSTIFICATIVA IS NULL ' +
         ' ORDER BY AV.DTAVALIACAO';
  Result:= GetDataPacket(sSql);
end;

function TCtrlAvaliacaoFornec.AvaliaFornec(CodCentrCust: String): Boolean;
begin
  cdsAux.Data:= GetDataPacket('SELECT COUNT(CODCENTRORESPON)QTDCODRESP FROM CENTRESPON ' +
                              'WHERE AVALIAFORNECEDOR = ''S'' ' +
                              'AND TRIM(CODCENTRORESPON) IN (' + CodCentrCust + ')');

  Result:= cdsAux.FieldByName('QTDCODRESP').AsInteger > 0;

end;

function TCtrlAvaliacaoFornec.AvaliaFornec(CodCentrCust: String;
  IDTIPOCUSTORECIMO: Integer): Boolean;
begin;

  cdsAux.Data:= GetDataPacket('SELECT COUNT(CODCENTRORESPON) QTDCODRESP FROM CENTRESPON ' +
                              'where CODCENTRORESPON in (select CODCENTRORESPON from PADRLANCIMOVEL ' +
                              'where IDTIPOCUSTORECIMO = ' + InttoStr(IDTIPOCUSTORECIMO)+')' +
                              'AND avaliafornecedor = ''S'' ');


  {cdsAux.Data:= GetDataPacket('SELECT COUNT(CODCENTRORESPON)QTDCODRESP FROM CENTRESPON ' +
                              'WHERE AVALIAFORNECEDOR = ''S'' ' +
                              'AND TRIM(CODCENTRORESPON) IN (' +BuscarCentCust(CodCentrCust) + ')');
  }

  Result:= cdsAux.FieldByName('QTDCODRESP').AsInteger > 0;

end;

function TCtrlAvaliacaoFornec.BuscarCentCust(CentCust: String): String;
begin
  cdsAux.Data:= GetDataPacket('SELECT R.CODCENTRORESPON FROM CENTRESPON R, CENTCUST C ' +
                              'WHERE R.CODCENTROCUSTO = C.CODCENTROCUSTO ' +
                              'AND C.CODCENTROCUSTO = ' + CentCust);

  Result:= QuotedStr(cdsAux.FieldByName('CODCENTRORESPON').AsString);

end;

function TCtrlAvaliacaoFornec.BuscarNomeContrato(
  IdContrato: Integer): String;
begin
  cdsAux.Data:= GetDataPacket('SELECT DESCRICAO FROM NATUREZACONTR ' +
                              'WHERE IDNATUREZA = ' + IntToStr(IdContrato));

  Result:= cdsAux.FieldByName('DESCRICAO').AsString;
end;


constructor TCtrlAvaliacaoFornec.Create;
begin
  inherited;
  _DbAvaliacaoFornec := TDbAvaliacaofornec.Create(Self);
  FCds    := TClientDataSet.Create(nil);
  cdsAux := TClientDataSet.Create(nil);
end;

procedure TCtrlAvaliacaoFornec.DeletarAvaliacao(iIdPessoa: Integer;
  lIdsAvaliacao: String);
var qryDeleta: TQuery;
begin
  qryDeleta:= TQuery.Create(nil);
  qryDeleta.DatabaseName:= DatabaseName;

  qryDeleta.Close;
  qryDeleta.Sql.Clear;
  qryDeleta.Sql.Add('DELETE FROM AVALIACAOFORNEC ' +
                    ' WHERE IDPESSOA  = ' + IntToStr(iIdPessoa) +
                    ' AND IDAVALIACAO NOT IN(' + lIdsAvaliacao + ')' +
                    ' AND DESCRJUSTIFICATIVA IS NULL');
  qryDeleta.ExecSQL;

  try
    StartTransaction;
    Commit;
  except
    on E:Exception Do
    begin
      Rollback;
      MessageInfo := E.Message;
    end;
  end;

end;

destructor TCtrlAvaliacaoFornec.Destroy;
begin
  If Fcds.Active Then
     Fcds.Close;

  Fcds := nil;
  Fcds.Free;

  _DbAvaliacaoFornec.Free;
  inherited;
end;

procedure TCtrlAvaliacaoFornec.DoChangeDataBase;
begin
  inherited;
  _DbAvaliacaoFornec.DataBaseName := DatabaseName;
end;

function TCtrlAvaliacaoFornec.FornecPassivo(IdPessoa: Integer): Boolean;
begin
  cdsAux.Data:= GetDataPacket('SELECT FLGAVALIAFORNEC ' +
                              'FROM PESSOA ' +
                              'WHERE IDPESSOA = ' + IntToStr(IdPessoa));

  Result:= (cdsAux.FieldByName('FLGAVALIAFORNEC').AsString = 'N');

end;

function TCtrlAvaliacaoFornec.Gravar: Boolean;
Var
  Msg: String;
begin
   Try
      StartTransaction;
      Result := ApplyCds(fcds, _DbAvaliacaoFornec, [], []);
      Msg    := _DbAvaliacaoFornec.MessageInfo;

      If Not Result Then
         Raise Exception.Create( Msg );

      Commit;
   Except
      On E:Exception Do
      Begin
         Rollback;
         Result := False;
         MessageInfo := E.Message;
      End;
   End;
end;

procedure TCtrlAvaliacaoFornec.GravarAlaviacao(iIDAVALIACAO, iIDNATUREZA,
  iIDPESSOA: Integer; dDTAVALIACAO, dDTEXECUCAO: TDateTime; sQUALIDADETECNICA,
  sDESCRICAOSERVICO, sMOTIVOQUALIFICACAO: String);
var sSql: String;
    qryInsereAltera: TQuery;
    FlgAvaliacaoExtra: String;
begin
  qryInsereAltera:= TQuery.Create(nil);
  qryInsereAltera.DatabaseName:= DatabaseName;

  if not VerificaExistencia(iIDAVALIACAO) then
    sSql:= 'INSERT INTO AVALIACAOFORNEC (IDAVALIACAO, IDNATUREZA, IDPESSOA, DTAVALIACAO, DTEXECUCAO,' +
           ' QUALIDADETECNICA, DESCRICAOSERVICO, MOTIVOQUALIFICACAO) ' +
           'VALUES (' +
           IntToStr(iIDAVALIACAO) + ', ' +
           IntToStr(iIDNATUREZA) + ', ' +
           IntToStr(iIDPESSOA) + ', ' +
           QuotedStr(DateTimeToStr(dDTAVALIACAO)) + ', ' +
           QuotedStr(DateTimeToStr(dDTEXECUCAO)) + ', ' +
           QuotedStr(sQUALIDADETECNICA) + ',' +
           QuotedStr(sDESCRICAOSERVICO) + ', ' +
           QuotedStr(sMOTIVOQUALIFICACAO) + ')'
  else
    sSql:= 'UPDATE AVALIACAOFORNEC SET ' +
           'IDNATUREZA = ' + IntToStr(iIDNATUREZA) + ', ' +
           'DTAVALIACAO = ' + QuotedStr(DateTimeToStr(dDTAVALIACAO)) + ', ' +
           'DTEXECUCAO = ' + QuotedStr(DateTimeToStr(dDTEXECUCAO)) + ', ' +
           'QUALIDADETECNICA = ' + QuotedStr(sQUALIDADETECNICA) + ', ' +
           'DESCRICAOSERVICO = ' + QuotedStr(sDESCRICAOSERVICO) + ', ' +
           'MOTIVOQUALIFICACAO = ' + QuotedStr(sMOTIVOQUALIFICACAO) +
           ' WHERE IDAVALIACAO = ' + IntToStr(iIDAVALIACAO) +
           ' AND IDPESSOA = ' + IntToStr(iIDPESSOA) +
           ' AND DESCRJUSTIFICATIVA IS NULL ';

  qryInsereAltera.Close;
  qryInsereAltera.Sql.Clear;
  qryInsereAltera.Sql.Add(sSql);
  qryInsereAltera.ExecSql;



  try
    StartTransaction;
    Commit;
  except
    on E:Exception Do
    begin
      Rollback;
      MessageInfo := E.Message;
    end;
  end;
  //FreeAndNil(qryInsereAltera);
end;


function TCtrlAvaliacaoFornec.DeletaValoresTemp(IDUSER: Integer): String;
begin
  Result := 'delete from TEMPAVALIACAOFORNEC where IdUsuario = ' + IntToStr(IDUSER) ;
end;


function TCtrlAvaliacaoFornec.InsereValoresTemp(IDAVAL, IDUSER: Integer;
  DTAVALIACAO, DTEXECUCAO, DTPESQUISA: TDateTime; QUALIDADETECNICA, DESCRICAOSERVICO,
  MOTIVOQUALIFICACAO, DESCRJUSTIFICATIVA, NATUREZA: String): String;
begin

  Result := 'INSERT INTO TEMPAVALIACAOFORNEC(IdUsuario, IDAVALIACAO, DTAVALIACAO, DTEXECUCAO, ' +
                                          'QUALIDADETECNICA, DESCRICAOSERVICO, ' +
                                          'MOTIVOQUALIFICACAO, DESCRJUSTIFICATIVA, NATUREZA) ' +
          ' VALUES( ' +
          IntToStr(IDUSER) + ', ' +
          IntToStr(IDAVAL) + ', ' +
          QuotedStr(DateTimeToStr(DTAVALIACAO)) + ', ' +
          QuotedStr(DateTimeToStr(DTEXECUCAO)) + ', ' +
          QuotedStr(QUALIDADETECNICA) + ', ' +
          QuotedStr(DESCRICAOSERVICO) + ', ' +
          QuotedStr(MOTIVOQUALIFICACAO) + ', ' +
          QuotedStr(DESCRJUSTIFICATIVA) + ', ' +
          QuotedStr(NATUREZA) + ' )';

end;

function TCtrlAvaliacaoFornec.LerSequencia: integer;
begin
  cdsAux.Data:= GetDataPacket('SELECT CM.SEQAVAL.NEXTVAL SEQ FROM DUAL');
  Result:= cdsAux.FieldByName('SEQ').AsInteger;
end;

function TCtrlAvaliacaoFornec.SelecionaDataAtual: TDateTime;
begin
  cdsAux.Data:= GetDataPacket('SELECT TRUNC(SYSDATE) DATAATUAL FROM DUAL');
  Result:= cdsAux.FieldByName('DATAATUAL').AsDateTime;
end;

procedure TCtrlAvaliacaoFornec.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

function TCtrlAvaliacaoFornec.TrazAnoAtual(idPessoa: Integer; DtEmissao: TDateTime): Boolean;
begin
  cdsAux.Data:= GetDataPacket('SELECT EXTRACT(YEAR FROM (DTAVALIACAO)) ANOAVAL '+
                              'FROM AVALIACAOFORNEC '+
                              'WHERE EXTRACT(YEAR FROM (DTAVALIACAO)) = '  +
                              'EXTRACT(YEAR FROM To_Date(' + QuotedStr(DateTimeToStr(DtEmissao))  + ', ''DD/MM/YYYY''))' +
                              ' AND IDPESSOA = ' + InttoStr(idPessoa) +
                              ' AND DESCRJUSTIFICATIVA IS NULL');




  Result:= Not cdsAux.IsEmpty;
end;

function TCtrlAvaliacaoFornec.TrazMesAtual(idPessoa: Integer; DtEmissao: TDateTime): Boolean;
begin
  if not TrazAnoAtual(idPessoa, DtEmissao) then
    Result:= False
  else begin
    cdsAux.Data:= GetDataPacket('SELECT EXTRACT(MONTH FROM (DTAVALIACAO)) ANOAVAL ' +
                                'FROM AVALIACAOFORNEC ' +
                                'WHERE EXTRACT(MONTH FROM (DTAVALIACAO)) = ' +
                                'EXTRACT(MONTH FROM To_Date(' + QuotedStr(DateTimeToStr(DtEmissao))  + ', ''DD/MM/YYYY''))' +

                                'AND EXTRACT(YEAR FROM (DTAVALIACAO)) = ' +                                                   //Edilaine - SOL 188851 / KTN 1784371
                                'EXTRACT(YEAR FROM To_Date(' + QuotedStr(DateTimeToStr(DtEmissao))  + ', ''DD/MM/YYYY''))' +  //Edilaine - SOL 188851 / KTN 1784371
                                
                                ' AND IDPESSOA = ' + InttoStr(idPessoa) +
                                ' AND DESCRJUSTIFICATIVA IS NULL');

    Result:= Not cdsAux.IsEmpty;
  end;
end;

function TCtrlAvaliacaoFornec.VerificaExistencia(
  idAvaliacao: Integer): Boolean;
begin
  cdsAux.Data:= GetDataPacket('SELECT IDAVALIACAO FROM AVALIACAOFORNEC ' +
                              'WHERE IDAVALIACAO = ' + IntToStr(idAvaliacao));
  Result:= not cdsAux.IsEmpty;
end;

//higor Nayde Ferreira SOL 188852 KTN 1784376
function TCtrlAvaliacaoFornec.VerificaQualificacao(rIdPessoa: Integer): Boolean;
var sSql : string;
    cdsQualidade: TClientDataSet;
begin
  cdsQualidade := TClientDataSet.Create(nil);//higor Nayde Ferreira SOL 188852 KTN 1784376

   cdsQualidade.Data := GetDataPacket('SELECT COUNT(QUALIDADETECNICA) AS RESULTADO '+
                            'FROM AVALIACAOFORNEC '+
                            'WHERE QUALIDADETECNICA = ''N'''+
                            ' AND IDPESSOA = ' + IntToStr(rIdPessoa));

   if (cdsQualidade.FieldByName('RESULTADO').AsInteger >= 4) then
      result := true
   else
      result := false; //higor Nayde Ferreira SOL 188852 KTN 1784376
end;



function TCtrlAvaliacaoFornec.BuscaAvaliacao(IdForcl: integer): String;
var cdsAvaliacaoForn: TClientDataSet;
begin //higor Nayde Ferreira SOL 188852 KTN 1784376
  cdsAvaliacaoForn:= TClientDataSet.Create(nil);
  cdsAvaliacaoForn.Data:= GetDataPacket(
                  'SELECT DECODE(MAX(IDAVALIACAO),NULL,1,MAX(IDAVALIACAO)) AS AVALIACAOMAX '+
                  ' FROM AVALIACAOFORNEC ' +
                  ' WHERE IDPESSOA  = ' + IntToStr(IdForcl));
  Result := cdsAvaliacaoForn.FieldByName('AVALIACAOMAX').AsString;
  cdsAvaliacaoForn.Destroy;
end;  //higor Nayde Ferreira SOL 188852 KTN 1784376

function TCtrlAvaliacaoFornec.AtualizaAvaliacao(sNODocumento, sCodDocumento,sIDAvaliacao,sIDForcli: integer): String;
var sSql: String;
    qryInsereAltera: TQuery;
    FlgAvaliacaoExtra: String;
begin    //higor Nayde Ferreira SOL 188852 KTN 1784376
  qryInsereAltera:= TQuery.Create(nil);
  qryInsereAltera.DatabaseName:= DatabaseName;
  try
 // if not VerificaExistencia(iIDAVALIACAO) then

    StartTransaction;
    //if (sflgsExecutado = 'S') then begin
      sSql:= 'UPDATE AVALIACAOFORNEC ' +
             ' SET CODDOCUMENTO = '+IntToStr(sCodDocumento) +
             ' , NODOCUMENTO = '+IntToStr(sNODocumento) +
             ' WHERE IDAVALIACAO = '+ IntToStr(sIDAvaliacao) +
             ' AND IDPESSOA = '+ IntToStr(sIDForcli);


      qryInsereAltera.Close;
      qryInsereAltera.Sql.Clear;
      qryInsereAltera.Sql.Add(sSql);
      qryInsereAltera.ExecSql;
   // end;
   // if (sflgsDocumentoExec = 'S') then begin
      {  sSql:= 'UPDATE DOCUMENTO ' +
           ' SET FLGSERVICOEXEC = '''+sflgservico + ''' WHERE CODDOCUMENTO = '+ IntToStr(sCodDocumento)+
           //' AND NODOCUMENTO =' +IntToStr(sNODocumento);
           ' AND IDFORCLI = ' + IntToStr(sIDForcli);


      qryInsereAltera.Close;
      qryInsereAltera.Sql.Clear;
      qryInsereAltera.Sql.Add(sSql);
      qryInsereAltera.ExecSql;
   // end;  }


    Commit;
  except
    on E:Exception Do
    begin
      Rollback;
      MessageInfo := E.Message;
    end;
  end;   //higor Nayde Ferreira SOL 188852 KTN 1784376
end;

function TCtrlAvaliacaoFornec.BuscaDocumento(noDocumento,vidforcli: integer): integer;
var cdsAvaliacaoForn: TClientDataSet;
SQL:String;
begin     //higor Nayde Ferreira SOL 188852 KTN 1784376
  cdsAvaliacaoForn:= TClientDataSet.Create(nil);

  SQL:=('SELECT DISTINCT DECODE((SELECT COUNT(doc.CODDOCUMENTO)'+
                                        '                         from DOCUMENTO doc'+
                                        '                        where NODOCUMENTO = '+ IntToStr(noDocumento)+'),'+
                                        '                       1,'+
                                        '                       (SELECT d1.CODDOCUMENTO as teste'+
                                        '                          FROM DOCUMENTO d1'+
                                        '                         WHERE d1.NODOCUMENTO = '+IntToStr(noDocumento)+'),'+
                                        '                       (SELECT MAX(CODDOCUMENTO)'+
                                        '                          FROM DOCUMENTO'+
                                        '    WHERE TO_CHAR(TRGDTINCLUSAO, ''DD/MM/YYYY'') ='''+ FormatDateTime('dd/mm/yyyy',now)+ ''' AND ' +
                                        '   NODOCUMENTO = '+IntToStr(noDocumento)+' AND IDFORCLI = '+ IntToStr(vidforcli) +')) AS DOCUMENTO'+
                                        ' FROM  DOCUMENTO doc1'+
                                        ' WHERE NODOCUMENTO = '+IntToStr(noDocumento));

  cdsAvaliacaoForn.Data:= GetDataPacket('SELECT distinct DECODE((SELECT count(doc.CODDOCUMENTO)'+
                                        '                         from DOCUMENTO doc'+
                                        '                        where NODOCUMENTO = '+ IntToStr(noDocumento)+'),'+
                                        '                       1,'+
                                        '                       (SELECT d1.coddocumento as teste'+
                                        '                          FROM DOCUMENTO d1'+
                                        '                         WHERE d1.NODOCUMENTO = '+IntToStr(noDocumento)+'),'+
                                        '                       (SELECT MAX(CODDOCUMENTO)'+
                                        '                          FROM DOCUMENTO'+
                                        '    WHERE TO_CHAR(TRGDTINCLUSAO, ''DD/MM/YYYY'') ='''+ FormatDateTime('dd/mm/yyyy',now)+ ''' AND ' +
                                        '   NODOCUMENTO = '+IntToStr(noDocumento)+' AND IDFORCLI = '+ IntToStr(vidforcli) +')) AS DOCUMENTO'+
                                        ' FROM  DOCUMENTO doc1'+
                                        ' WHERE NODOCUMENTO = '+IntToStr(noDocumento));

  Result := cdsAvaliacaoForn.FieldByName('DOCUMENTO').AsInteger;





  cdsAvaliacaoForn.Destroy;
end;    //higor Nayde Ferreira SOL 188852 KTN 1784376

function TCtrlAvaliacaoFornec.AtualizaAvaliaDocumento(sNODocumento,
  sCodDocumento, sIDAvaliacao, sIDForcli: integer; sflgsExecutado: string;
  const sflgservico, sflgsDocumentoExec: string): String;
var sSql: String;
    qryInsereAltera: TQuery;
    FlgAvaliacaoExtra: String;
begin     //higor Nayde Ferreira SOL 188852 KTN 1784376
  qryInsereAltera:= TQuery.Create(nil);
  qryInsereAltera.DatabaseName:= DatabaseName;
  try
 // if not VerificaExistencia(iIDAVALIACAO) then

    StartTransaction;
    if (sflgsExecutado = 'S') then begin
      sSql:= 'UPDATE AVALIACAOFORNEC ' +
             ' SET CODDOCUMENTO = '+IntToStr(sCodDocumento) +
             ' , NODOCUMENTO = '+IntToStr(sNODocumento) +
             ' WHERE IDAVALIACAO = '+ IntToStr(sIDAvaliacao) +
             ' AND IDPESSOA = '+ IntToStr(sIDForcli);


      qryInsereAltera.Close;
      qryInsereAltera.Sql.Clear;
      qryInsereAltera.Sql.Add(sSql);
      qryInsereAltera.ExecSql;
    end;
    if (sflgsDocumentoExec = 'S') then begin
        sSql:= 'UPDATE DOCUMENTO ' +
           ' SET FLGSERVICOEXEC = '''+sflgservico + ''' WHERE CODDOCUMENTO = '+ IntToStr(sCodDocumento)+
           //' AND NODOCUMENTO =' +IntToStr(sNODocumento);
           ' AND IDFORCLI = ' + IntToStr(sIDForcli);


      qryInsereAltera.Close;
      qryInsereAltera.Sql.Clear;
      qryInsereAltera.Sql.Add(sSql);
      qryInsereAltera.ExecSql;
    end;

    Commit;
  except
    on E:Exception Do
    begin
      Rollback;
      MessageInfo := E.Message;
    end;
  end;  //higor Nayde Ferreira SOL 188852 KTN 1784376
end;
//higor Nayde Ferreira SOL 188852 KTN 1784376
end.
