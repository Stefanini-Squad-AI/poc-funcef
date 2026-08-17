unit fExecInversaoDoc;
{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 185493
Nº KINTANA..: 1743363
Data........: 24/07/2012
Responsável.: Helen V. Bianchi
Descrição...: Data de Ajuste poderá ser alterada pelo usuário e não virá mais
              pelo sistema contábil.
-------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 172902
Nº KINTANA..: 1577381
Data........: 14/03/2012
Responsável.: Helen V. Bianchi
Descrição...: Não deixar fazer lançamentos com Período contabil Bloqueado
-------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker,
  wwdblook, mContratoNumero, Db, Wwdatsrc, DBClient, wwclient, uCtrlImovel,
  uCmSqlParams, uCMClientDataSet, uModuloImobiliario, uCtrlOperImob,
  uCtrlParamIntegra,
  // Helen - SOL: 172902 KTN: 1577381
  uCtrlContab;

type
  RLancamentosImovel = record
   DataVencimento : TDate;
   MesReferencia  : string;
   AnoReferencia  : string;
   MesCompetencia : string;
   AnoCompetencia : string;
   DataLimite     : string;
   CodDocumento   : Integer;
  end;

  RDocumento = record
    DataVencimento : TDate;
    DataProgramada : TDate;
    DataLimite     : string;
    DataDisponibilidade : TDate;
    CodDocumento : Integer;
  end;

  TfrmExecInversaoDoc = class(TFrmOkCancelarImob)
    molContratoNumero: TmolContratoNumero;
    cboDocPago: TwwDBLookupCombo;
    cboDocAberto: TwwDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dtpDataAjuste: TCMDateTimePicker;
    dsDocPago: TwwDataSource;
    dsDocAberto: TwwDataSource;
    cdsDocPago: TwwClientDataSet;
    cdsDocAberto: TwwClientDataSet;
    CMSqlParams: TCMSqlParams;
    procedure molContratoNumerobtnBuscaContratoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlImovel   : TCtrlImovel;
    CtrlOperImob : TCtrlOperImob;
    iTipoOperAtualMulta : integer;
    iTipoOperAtualJuros : integer;
    iTipoOperAtualCM : integer;

    CtrlContab  : TCtrlContab; // Helen - SOL: 172902 KTN: 1577381

    function LookupDocPagoxContrato(iIdContratoImovel : Integer;  var cdsAux : TwwClientDataSet) : boolean;
    function LookupDocAbertoXContrato(iIdContratoImovel : Integer;  var cdsAux : TwwClientDataSet) : boolean;
    function LookupDataUltimoFechamentoContab: TDate;
    function VerificaPreenchimento : boolean;
    function InversaoDadosDocs(iCodDocumentoAberto, iCodDocumentoPago : integer) : boolean;
    function LookupDadosDoc(iCodDocumentoAberto, iCodDocumentoPago : Integer) : OLEVariant;
    function GetDataBaixaDocumento(iCodDocumento : integer) : TDate;
  public
    { Public declarations }
  end;

var
  frmExecInversaoDoc: TfrmExecInversaoDoc;

implementation
uses dMS, uComunsImobiliario, uSistema, dBaseDados, uVerificaPreenchimento,
     uMensErro;

{$R *.DFM}

function TfrmExecInversaoDoc.LookupDocPagoxContrato(iIdContratoImovel : Integer;
  var cdsAux: TwwClientDataSet): boolean;
var
  sSQL : string;
begin
  sSQL := ' SELECT DISTINCT LIM.CODDOCUMENTO, ' +#10#13+
          '        LIM.DATALIMITE,            ' +#10#13+ 
          '        (LIM.MESCOMPETENCIA ||''/''|| LIM.ANOCOMPETENCIA) AS COMP, ' +#10#13+
          // Helen - SOL: 172902 KTN: 1577381 - Adicionado campos do Doc
          '       DOC.*                      ' +#10#13+
          '   FROM LANCAMENTOSIMOVEL LIM,     ' +#10#13+
          '        PARAMCONTAB PCT,           ' +#10#13+
          '        DOCUMENTO DOC              ' +#10#13+
          '  WHERE LIM.IDCONTRATOIMOVEL = ' + IntToStr(iIdContratoImovel) +#10#13+
          '    AND LIM.CODDOCUMENTO = DOC.CODDOCUMENTO ' +#10#13+
          '    AND DOC.STATUS = 2 ' +#10#13+
          '    AND LIM.DATAVENCIMENTO >= (PCT.DATAULTFECHA + 1)' +#10#13+
          '   AND LIM.FLGTIPOLANCAMENTO = ''A''';
  cdsAux.Data := CtrlImovel.GetDataPacket(sSQL);

  if cdsAux.IsEmpty then
    Result := False
  else
    Result := True;
end;

procedure TfrmExecInversaoDoc.molContratoNumerobtnBuscaContratoClick(
  Sender: TObject);
begin
  inherited;
  molContratoNumero.btnBuscaContratoClick(Sender);
  try
    //dtpDataAjuste.Date := LookupDataUltimoFechamentoContab; - Helen SOL: 185493 KTN: 1743363
    if dtmMS.MS_Contrato.RetornouValor then
    begin
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled := True;
      molContratoNumero.edtConNumero.Text := dtmMS.MS_Contrato.ValoresChave[1];
      molContratoNumero.edtConNome.Text := dtmMS.MS_Contrato.ValoresChave[2];

      if not LookupDocPagoxContrato(StrToInt(dtmMS.MS_Contrato.ValoresChave[0]), cdsDocPago) then
        raise EValidacao.createVal(//'Não existem documentos pagos para este contrato ' +#13+ - Helen SOL: 185493 KTN: 1743363
                                   //'após ' + dtpDataAjuste.Text + '.', molContratoNumero.btnBuscaContrato)  - Helen SOL: 185493 KTN: 1743363
                                   'Não existem documentos pagos para este contrato. ', molContratoNumero.btnBuscaContrato)

      else
        cboDocPago.Enabled := True;

      if not LookupDocAbertoXContrato(StrToInt(dtmMS.MS_Contrato.ValoresChave[0]), cdsDocAberto) then
        raise EValidacao.createVal(//'Não existem documentos em aberto para este contrato ' +#13+ - Helen SOL: 185493 KTN: 1743363
                                   //'após ' + dtpDataAjuste.Text + '.', molContratoNumero.btnBuscaContrato)- Helen SOL: 185493 KTN: 1743363
                                   'Não existem documentos pagos para este contrato. ', molContratoNumero.btnBuscaContrato)
      else
        cboDocAberto.Enabled := True;

    end;
  except
    on E : EValidacao do
    begin
      if E.Show then
        MsgDlg(E.message, 'Aviso', mtWarning, [mbOk], 0);
      if E.Control.CanFocus then
        E.Control.SetFocus;
      bbtnConfirmar.Enabled := False;
      molContratoNumero.edtConNumero.Clear;
      molContratoNumero.edtConNome.Clear;
      Exit;
    end;
  end;
end;

procedure TfrmExecInversaoDoc.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlImovel := TCtrlImovel.Create;
  CtrlImovel.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                        Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                        ComunsImobiliario.MensErroMT);

  CtrlOperImob := TCtrlOperImob.Create(Sistema.IdEmpresa,
                                       Sistema.IdModulo,
                                       Sistema.IdUsuario,
                                       Sistema.IdEspAcesso,
                                       ParamIntegra.PlanoPrevGlobal,
                                       ParamIntegra.PatroGlobal,
                                       sistema.UsaPlanoPatro);

  CtrlOperImob.InitializeAs(CtrlImovel);
  // Helen - SOL: 172902 KTN: 1577381
  CtrlContab     := TCtrlContab.Create;
  CtrlContab.InitializeAs(CtrlImovel);


  cboDocPago.Enabled := False;
  cboDocAberto.Enabled := False;

  iTipoOperAtualMulta := ModuloImobiliario.AdminImob.iTipoOperAbonoMulta;
  iTipoOperAtualJuros := ModuloImobiliario.AdminImob.iTipoOperAtualJuros;
  iTipoOperAtualCM    := ModuloImobiliario.AdminImob.iTipoOperAtualCM;
end;

function TfrmExecInversaoDoc.LookupDocAbertoXContrato(
  iIdContratoImovel: Integer; var cdsAux: TwwClientDataSet): boolean;
var
  sSQL : string;
begin
  sSQL := 'SELECT DISTINCT LIM.CODDOCUMENTO, ' +#10#13+
          '       LIM.IDCONTRATOIMOVEL,      ' +#10#13+
          '       LIM.DATALIMITE,            ' +#10#13+ 
          '       (LIM.MESCOMPETENCIA ||''/''|| LIM.ANOCOMPETENCIA) AS COMP, ' +#10#13+
          // Helen - SOL: 172902 KTN: 1577381 - Adicionado campos do Doc
          '       DOC.*                      ' +#10#13+
          '  FROM LANCAMENTOSIMOVEL LIM,     ' +#10#13+
          '       PARAMCONTAB PCT,           ' +#10#13+
          '       DOCUMENTO DOC              ' +#10#13+
          ' WHERE LIM.IDCONTRATOIMOVEL = ' + IntToStr(iIdContratoImovel) +#10#13+
          '   AND LIM.CODDOCUMENTO = DOC.CODDOCUMENTO ' +#10#13+
          '   AND DOC.STATUS <> 2 ' +#10#13+
          '   AND LIM.DATAVENCIMENTO >= (PCT.DATAULTFECHA + 1)' +#10#13+
          '   AND LIM.FLGTIPOLANCAMENTO = ''A''';
  cdsAux.Data := CtrlImovel.GetDataPacket(sSQL);

  if cdsAux.IsEmpty then
    Result := False
  else
    Result := True;
end;

function TfrmExecInversaoDoc.LookupDataUltimoFechamentoContab: TDate;
var
  sSQL : string;
  cds  : TwwClientDataSet;
begin
  cds := TwwClientDataSet.Create(nil);
  try
    sSQL := 'SELECT (DATAULTFECHA + 1) DATAFECHA FROM PARAMCONTAB ';
    cds.Data := CtrlImovel.GetDataPacket(sSQL);
    Result := cds.FieldByName('DATAFECHA').asDateTime;
  finally
    FreeandNil(cds);
  end;
end;
function TfrmExecInversaoDoc.VerificaPreenchimento: boolean;
begin
  Result := False;
  try
    if molContratoNumero.iContrato <= 0 then
      raise EValidacao.createVal('Contrato não informado.', molContratoNumero.btnBuscaContrato);

    if Length(trim(cboDocPago.Text)) <= 0 then
     raise EValidacao.createVal('1º Documento não informado.', cboDocPago);

    if Length(trim(cboDocAberto.Text)) <= 0 then
     raise EValidacao.createVal('2º Documento não informado.', cboDocPago);
  except
  on E : EValidacao do
    begin
      if E.Show then
        MsgDlg(E.message, 'Aviso', mtWarning, [mbOk], 0);
      if E.Control.CanFocus then
        E.Control.SetFocus;
      Exit;
    end;
  end;
  Result := True;
end;

procedure TfrmExecInversaoDoc.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  molContratoNumero.edtConNumero.Clear;
  molContratoNumero.edtConNome.Clear;
  dtpDataAjuste.Clear;
  cboDocPago.Enabled := False;
  cboDocAberto.Enabled := False;
  cboDocPago.Clear;
  cboDocAberto.Clear;
  cdsDocPago.EmptyDataSet;
  cdsDocAberto.EmptyDataSet;
  bbtnConfirmar.Enabled := False;
end;

procedure TfrmExecInversaoDoc.bbtnConfirmarClick(Sender: TObject);
var
  bOK : boolean;
  dDataAtualizacao, dDataBaixa : TDate;
  sMensagem : string;
begin
  bOK := False;
  inherited;
  //Helen SOL: 185493 KTN: 1743363 - Inicio
  if dtpDataAjuste.Text = '' then begin
      MsgDlg('Informe a data ajuste para Inversão de Vencimento de Documentos.','Aviso',mtWarning,[mbOk],0);
      dtpDataAjuste.SetFocus;
      Exit;
   end;
  //Helen SOL: 185493 KTN: 1743363 - Fim
  // Helen - SOL: 172902 KTN: 1577381 - Inicio
  if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,dtpDataAjuste.Text) then
  begin
     MsgDlg('Período Contábil Bloqueado. Data de Ajuste. ', 'Aviso', mtWarning, [mbOk], 0);
     exit;
  end;
  if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,cdsDocPago.FieldByName('datavencto').AsString) then
  begin
     MsgDlg('Período Contábil Bloqueado. Data de Vencimento. Documento :' + cdsDocPago.FieldByName('CODDOCUMENTO').AsString , 'Aviso', mtWarning, [mbOk], 0);
     exit;
  END;
  if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,cdsDocPago.FieldByName('dataemissao').AsString) then
  begin
     MsgDlg('Período Contábil Bloqueado. Data de emissão. Documento :' + cdsDocPago.FieldByName('CODDOCUMENTO').AsString , 'Aviso', mtWarning, [mbOk], 0);
     exit;
  end;
  if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,cdsDocAberto.FieldByName('datavencto').AsString) then
  begin
     MsgDlg('Período Contábil Bloqueado. Data de Vencimento. Documento :' + cdsDocAberto.FieldByName('CODDOCUMENTO').AsString , 'Aviso', mtWarning, [mbOk], 0);
     exit;
  end;
  if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,cdsDocAberto.FieldByName('dataemissao').AsString) then
  begin
     MsgDlg('Período Contábil Bloqueado. Data de Emissão. Documento :' + cdsDocAberto.FieldByName('CODDOCUMENTO').AsString , 'Aviso', mtWarning, [mbOk], 0);
     exit;
  end;    
  // Helen - SOL: 172902 KTN: 1577381 - Fim
  CtrlImovel.StartTransaction;
  try
    if VerificaPreenchimento then
    begin
      if InversaoDadosDocs(cdsDocAberto.FieldByName('CODDOCUMENTO').asInteger,
                           cdsDocPago.FieldByName('CODDOCUMENTO').asInteger) then
        bOK := True
      else
      begin
        //sMensagem := 'Erro na Rotina de Inversão de Vencimento dos Documentos';
        raise Exception.Create('Erro na Rotina de Inversão de Vencimento dos Documentos');
      end;

      if bOK then
      begin
        if cdsDocAberto.FieldByName('DATALIMITE').asDateTime < Date then
        begin
          CtrlOperImob.iCodDocumentoAjuste := cdsDocAberto.FieldByName('CODDOCUMENTO').asInteger;
          dDataAtualizacao := cdsDocAberto.FieldByName('DATALIMITE').asDateTime;
          while dDataAtualizacao <> Date do
          begin
            if CtrlOperImob.AtualizaDocsVencidos('',
                                                 iTipoOperAtualMulta,
                                                 iTipoOperAtualJuros,
                                                 iTipoOperAtualCM,
                                                 dDataAtualizacao,
                                                 cdsDocAberto.FieldByName('IDCONTRATOIMOVEL').asInteger,
                                                 False) then
              dDataAtualizacao := dDataAtualizacao + 1
            else
              raise Exception.Create('Erro na Rotina de Atualização de Documentos');
          end;
          bOK := True;
        end
        else
          bOK := True;
      end;

      if bOK then
      begin
        dDataBaixa := GetDataBaixaDocumento(cdsDocPago.FieldByName('CODDOCUMENTO').asInteger);
        if cdsDocPago.FieldByName('DATALIMITE').asDateTime < dDataBaixa then
        begin
          dDataAtualizacao := cdsDocPago.FieldByName('DATALIMITE').asDateTime;
          while dDataAtualizacao <> dDataBaixa do
          begin
            if CtrlOperImob.AtualizaDocsVencidos('',
                                                 iTipoOperAtualMulta,
                                                 iTipoOperAtualJuros,
                                                 iTipoOperAtualCM,
                                                 dDataAtualizacao,
                                                 cdsDocAberto.FieldByName('IDCONTRATOIMOVEL').asInteger,
                                                 False) then
              dDataAtualizacao := dDataAtualizacao + 1
            else
              raise Exception.Create('Erro na Rotina de Atualização de Documentos');
          end;
          bOK := True;
        end
        else
          bOK := True;
      end;
    end;

    if bOK then
    begin
      if CtrlImovel.InTransaction then
        CtrlImovel.Commit;
      MsgDlg('Inversão de Documentos realizada com sucesso!', 'Aviso', mtInformation, [mbOK], 0);
      bbtnCancelarClick(Self);
      bbtnCancelar.Enabled := False;
    end;
  except
    on E: Exception do
    begin
      MsgDlg(E.Message, 'Aviso', mtWarning, [mbOK], 0);
      if CtrlImovel.InTransaction then
        CtrlImovel.Rollback;
    end;
  end;
end;

function TfrmExecInversaoDoc.InversaoDadosDocs(iCodDocumentoAberto,
  iCodDocumentoPago: integer): boolean;
var
  aLancamentosImovel: array[0..1] of RLancamentosImovel;
  aDocumento: array[0..1] of RDocumento;
  cdsAux : TCMClientDataSet;
  i : integer;
  sSQL : string;
begin
  Result := False;
  cdsAux := TCmClientDataSet.Create(nil);
  i := 0;
  try
    cdsAux.Data := LookupDadosDoc(iCodDocumentoAberto, iCodDocumentoPago);
    cdsAux.First;
    while not cdsAux.Eof do
    begin
      aLancamentosImovel[i].CodDocumento   := cdsAux.FieldByName('CODDOCUMENTOIMOB').asInteger;
      aLancamentosImovel[i].DataVencimento := cdsAux.FieldByName('DATAVENCIMENTO').asDateTime;
      aLancamentosImovel[i].MesReferencia  := cdsAux.FieldByName('MESREFERENCIA').asString;
      aLancamentosImovel[i].AnoReferencia  := cdsAux.FieldByName('ANOREFERENCIA').asString;
      aLancamentosImovel[i].MesCompetencia  := cdsAux.FieldByName('MESCOMPETENCIA').asString;
      aLancamentosImovel[i].AnoCompetencia  := cdsAux.FieldByName('ANOCOMPETENCIA').asString;

      if cdsAux.FieldByName('DATALIMITEIMOB').IsNull then
        aLancamentosImovel[i].DataLimite   := ''
      else
        aLancamentosImovel[i].DataLimite   := cdsAux.FieldByName('DATALIMITEIMOB').asString;

      aDocumento[i].CodDocumento           := cdsAux.FieldByName('CODDOCUMENTO').asInteger;
      aDocumento[i].DataVencimento         := cdsAux.FieldByName('DATAVENCTO').asDateTime;
      aDocumento[i].DataProgramada         := cdsAux.FieldByName('DATAPROGRAMADA').asDateTime;

      if cdsAux.FieldByName('DATALIMITE').IsNull then
        aDocumento[i].DataLimite           := ''
      else
        aDocumento[i].DataLimite           := cdsAux.FieldByName('DATALIMITE').asString;

      aDocumento[i].DataDisponibilidade    := cdsAux.FieldByName('DATADISPONIB').asDateTime;
      Inc(i);
      cdsAux.Next;
    end;

    for i := 0 to Length(aLancamentosImovel) -1 do
    begin
      sSQL :=  'UPDATE LANCAMENTOSIMOVEL ' +#10#13+
               '   SET DATAVENCIMENTO = ' + QuotedStr(DateTimeToStr(aLancamentosImovel[i].DataVencimento)) + ', ' +#10#13+
               '       MESREFERENCIA = ' + aLancamentosImovel[i].MesReferencia + ', '+#10#13+
               '       ANOREFERENCIA = ' + aLancamentosImovel[i].AnoReferencia + ', '+#10#13+
               '       MESCOMPETENCIA = ' + aLancamentosImovel[i].MesCompetencia + ', '+#10#13+
               '       ANOCOMPETENCIA = ' + aLancamentosImovel[i].AnoCompetencia + ', '+#10#13+
               '       DATALIMITE = ' + QuotedStr(aLancamentosImovel[i].DataLimite) +#10#13+
               ' WHERE CODDOCUMENTO = ' + IntToStr(aLancamentosImovel[i].CodDocumento);
      if not CtrlImovel.ExecSql(sSQL) then
         raise Exception.Create('Erro na Rotina de Inversão de Vencimento de Documentos.');
    end;

    for i := 0 to Length(aDocumento) -1 do
    begin
      sSQL := 'UPDATE DOCUMENTO ' +#10#13+
              '   SET DATAVENCTO = ' + QuotedStr(DateToStr(aDocumento[i].DataVencimento)) + ', ' +#13#10+
              '       DATAPROGRAMADA = ' + QuotedStr(DateToStr(aDocumento[i].DataProgramada)) + ', ' +#13#10+
              '       DATALIMITE = ' + QuotedStr(aDocumento[i].DataLimite) + ', ' +#13#10+
              '       DATADISPONIB = ' + QuotedStr(DateToStr(aDocumento[i].DataDisponibilidade)) +#13#10+
              ' WHERE CODDOCUMENTO = ' + IntToStr(aDocumento[i].CodDocumento);
      if not CtrlImovel.ExecSql(sSQL) then
        raise Exception.Create('Erro na Rotina de Inversão de Vencimento de Documentos.');
    end;
    Result := True;
  finally
    FreeAndNil(cdsAux);
  end;
end;

function TfrmExecInversaoDoc.LookupDadosDoc(
  iCodDocumentoAberto, iCodDocumentoPago : Integer): OLEVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT DISTINCT ' + IntToStr(iCodDocumentoPago) + ' AS CODDOCUMENTOIMOB,    ' +#10#13+
          '       LTI.DATAVENCIMENTO,                               ' +#10#13+
          '       LTI.MESCOMPETENCIA,                               ' +#10#13+
          '       LTI.ANOCOMPETENCIA,                               ' +#10#13+
          '       LTI.MESREFERENCIA,                                ' +#10#13+
          '       LTI.ANOREFERENCIA,                                ' +#10#13+
          '       LTI.DATALIMITE AS DATALIMITEIMOB,                 ' +#10#13+
          //'       DOC.CODDOCUMENTO,                                 ' +#10#13+
            IntToStr(iCodDocumentoPago) + ' AS CODDOCUMENTO,        ' +#10#13+
          '       DOC.DATAVENCTO,                                   ' +#10#13+
          '       DOC.DATAPROGRAMADA,                               ' +#10#13+
          '       DOC.DATALIMITE,                                   ' +#10#13+
          '       DOC.DATADISPONIB                                  ' +#10#13+
          '  FROM LANCAMENTOSIMOVEL LTI,                            ' +#10#13+
          '       DOCUMENTO DOC                                     ' +#10#13+
          ' WHERE LTI.CODDOCUMENTO = ' + IntToStr(iCodDocumentoAberto)+#10#13+
          '   AND DOC.CODDOCUMENTO = LTI.CODDOCUMENTO               ' +#10#13+
          ' UNION ALL                                               ' +#10#13+
          'SELECT DISTINCT ' + IntToStr(iCodDocumentoAberto) + ' AS CODDOCUMENTOIMOB,    ' +#10#13+
          '       LTI.DATAVENCIMENTO,                               ' +#10#13+
          '       LTI.MESCOMPETENCIA,                               ' +#10#13+
          '       LTI.ANOCOMPETENCIA,                               ' +#10#13+
          '       LTI.MESREFERENCIA,                                ' +#10#13+
          '       LTI.ANOREFERENCIA,                                ' +#10#13+
          '       LTI.DATALIMITE,                                   ' +#10#13+
          //'       DOC.CODDOCUMENTO,                                 ' +#10#13+
            IntToStr(iCodDocumentoAberto) + ' AS CODDOCUMENTO,        ' +#10#13+
          '       DOC.DATAVENCTO,                                   ' +#10#13+
          '       DOC.DATAPROGRAMADA,                               ' +#10#13+
          '       DOC.DATALIMITE,                                   ' +#10#13+
          '       DOC.DATADISPONIB                                  ' +#10#13+
          '  FROM LANCAMENTOSIMOVEL LTI,                            ' +#10#13+
          '       DOCUMENTO DOC                                     ' +#10#13+
          ' WHERE LTI.CODDOCUMENTO = ' + IntToStr(iCodDocumentoPago)  +#10#13+
          '   AND DOC.CODDOCUMENTO = LTI.CODDOCUMENTO ';
  Result := CtrlImovel.GetDataPacket(sSQL);
end;

function TfrmExecInversaoDoc.GetDataBaixaDocumento(
  iCodDocumento: integer): TDate;
var
  sSQL : string;
  cdsAux : TCMClientDataSet;
begin
  cdsAux := TCMClientDataSet.Create(nil);
  try
   sSQL := 'SELECT DATABAIXA FROM RECBTOPAGTO WHERE CODDOCUMENTO = ' + IntToStr(iCodDOcumento);
   cdsAux.Data := CtrlImovel.GetDataPacket(sSQL);
   Result := cdsAux.FieldByName('DATABAIXA').AsDateTime;
  finally
    FreeAndNil(cdsAux);
  end;
end;

procedure TfrmExecInversaoDoc.bbtnSairClick(Sender: TObject);
begin
  if Length(trim(molContratoNumero.edtConNome.Text)) > 0 then
  begin
    if MsgDlg('Alguns dados informados ainda não foram gravados.' +#13#10+
              'Deseja realmente sair da tela?', 'Aviso', mtWarning, mbOKCancel, 0) = mrOk then
     inherited;
  end
  else
    inherited;
end;

procedure TfrmExecInversaoDoc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlContab);// Helen - SOL: 172902 KTN: 1577381
end;

end.
