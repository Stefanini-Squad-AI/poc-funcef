unit fCadSPCConsiste;

//------------------------------------------------------------------------------
//N. Sol.............: 131939
//N. Kintana.........: 755306
//Data...............: 08/03/2010
//Responsável........: Ricardo Alves
//Descrição..........: implementação e Validação dos campos data de Composição e
//  Plano Contábil na janela Consistência de Regras.

{------------------------------------------------------------------------------
  Desenvolvedor: Alex Pereira
  Data         : 14/03/2005
  Pendência    : 18814
  Solução      : Prever saldo de movimentações e saldo atual
------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
  Desenvolvedor: Alex Pereira
  Data         : 25/01/2005
  Pendência    : 18515
  Solução      : Permitir o cadastramento de contas analíticas,
                 motivo conta: 3511
------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask, DBCtrls, uCtrlSPCConsiste,
  wwdblook, CMProcuraMask, uCtrlContab, uCmSqlParams, uMensErro,
  wwdbdatetimepicker, CMDateTimePicker, uCtrlPlano, uCtrlPlanoConta;

type
  TfrmCadSPCConsiste = class(TFrmCadastroMestreDetMT)
    CdsIDSPCCONSISTE: TFloatField;
    CdsDESCRICAO: TStringField;
    cdsDet: TCMClientDataSet;
    cdsDetIDITEMSPCCONSISTE: TFloatField;
    cdsDetIDSPCCONSISTE: TFloatField;
    cdsDetPLANO: TFloatField;
    cdsDetPLACONTA: TStringField;
    Label1: TLabel;
    dbedtDescricao: TDBEdit;
    CMProcuraMaskContabil: TCMProcuraMaskContabil;
    CdsTIPOCONSISTE: TStringField;
    rdgCalcula: TDBRadioGroup;
    cdsDetFLGSALDOOUMOVIM: TStringField;
    Label2: TLabel;
    cbbPlano: TwwDBLookupCombo;
    lblDTSPCCONSISTE: TLabel;
    dtpDtSpcConsiste: TCMDateTimePicker;
    btnCriarData: TToolbarButton97;
    cdsPlano: TCMClientDataSet;
    cdsDetDTSPCCONSISTE: TDateTimeField;
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dtpDtSpcConsisteCloseUp(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure btnCriarDataClick(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
  private
    CtrlSPCConsiste : TCtrlSPCConsiste;
    CtrlContab      : TCtrlContab;

    // Ricardo A. SOL 131939 KTN 755306
    CtrlPlano       : TCtrlPlano;
    CtrlPlanoConta  : TCtrlPlanoConta;
    iNumPlano       : Integer;
    iQntVigencia    : Integer;
    sTipoRent       : String;
    _cdsAux          : TCmClientDataSet;

    procedure Seleciona( piIdSPCConsiste : Integer; psTipoConsiste : String; pdDtSpcConsiste: TDate);
    function VerificaDataDisponibilidade(iTipoConsiste, iPlano: integer; dDataConsiste: string): boolean;
    function QntVigenciasXTipDisponibilidade(iTipoConsiste: integer): integer;
    // FIM Ricardo A. SOL 131939 KTN 755306
  public
    procedure MsgCtrl( sMsg : string );
  end;

var
  frmCadSPCConsiste: TfrmCadSPCConsiste;

implementation

uses DBaseDados, uSistema, uCtrlParamIntegra, uCmTypes;

{$R *.DFM}

procedure TfrmCadSPCConsiste.CmeCadastroInsert(Sender: TObject);
begin
  Cds.Close;
  CdsDet.Close;

  Cds.CreateDataSet;
  CdsDet.CreateDataSet;

  // Ricardo A. SOL 131939 KTN 755306
  dtpDtSpcConsiste.Enabled := True;
  btnCriarData.Enabled := False;
  cbbPlano.Enabled := True;
  dbedtDescricao.Enabled := True;
  dbedtDescricao.SetFocus;
  // FIM Ricardo A. SOL 131939 KTN 755306

  inherited;
end;

procedure TfrmCadSPCConsiste.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  CdsTIPOCONSISTE.AsString := 'RC';
  Accept := CtrlSPCConsiste.Gravar;
end;

procedure TfrmCadSPCConsiste.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlSPCConsiste := TCtrlSPCConsiste.Create;
  CtrlSPCConsiste.Initialize( dtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                              Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgCtrl );

  CtrlSPCConsiste.cdsSPCConsiste     := Cds;
  CtrlSPCConsiste.cdsItemSPCConsiste := CdsDet;

  CtrlContab := TCtrlContab.Create;
  CtrlContab.InitializeAs( CtrlSPCConsistE );
  if not CtrlContab.SelecionaParametros( Sistema.IdEmpresa ) then
    MsgDlg( CtrlContab.MessageInfo, 'Aviso', mtWarning, [mbOK],0 );

  CMProcuraMaskContabil.Plano   := ParamIntegra.Plano;
  CMProcuraMaskContabil.Mascara := CtrlContab.MascaraContaParam;

  cdsDetPLACONTA.EditMask := CtrlContab.MascaraContaParam + ';0; ';

  // Ricardo A. SOL 131939 KTN 755306
  CtrlPlano := TCtrlPlano.Create;
  CtrlPlano.InitializeAs( CtrlSPCConsiste );

  CtrlPlanoConta := TCtrlPlanoConta.Create;
  CtrlPlanoConta.InitializeAs( CtrlSPCConsiste );

  CdsPlano.Data := CtrlPlano.ListPlano( 0 );

  cbbPlano.Enabled := False;

  dtpDtSpcConsiste.Enabled := False;
  btnCriarData.Enabled := False;

  iQntVigencia := 0;
  _CdsAux := TCMClientDataSet.Create(Self);
  // FIM Ricardo A. SOL 131939 KTN 755306
end;

procedure TfrmCadSPCConsiste.MsgCtrl(sMsg: string);
begin
  MsgDlg( sMsg, 'Aviso', mtWarning, [mbOK],0 );
end;

procedure TfrmCadSPCConsiste.FormDestroy(Sender: TObject);
begin
  inherited;
  CtrlSPCConsiste.Free;
  CtrlContab.Free;

  // Ricardo A. SOL 131939 KTN 755306
  _cdsAux.Free;
  CtrlPlano.Free;
  CtrlPlanoConta.Free;
  // FIM Ricardo A. SOL 131939 KTN 755306
end;

procedure TfrmCadSPCConsiste.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  CdsTIPOCONSISTE.AsString := 'RC';
  Accept := CtrlSPCConsiste.Gravar;
end;

procedure TfrmCadSPCConsiste.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
//  Accept := CtrlSPCConsiste.Deletar;

  // Ricardo A. SOL 131939 KTN 755306
  if QntVigenciasXTipDisponibilidade(iQntVigencia) > 1 then
  begin
    Accept := CtrlSPCConsiste.DeletarItemSpcConsiste;
    dtpDtSpcConsiste.Clear;
  end
  else
    Accept := CtrlSPCConsiste.Deletar;
  // FIM Ricardo A. SOL 131939 KTN 755306
end;

procedure TfrmCadSPCConsiste.CmeCadastroFind(Sender: TObject);
begin
  inherited;

  if MontaSelect.RetornouValor Then
  begin
//    cds.Close;
//    cds.Data := CtrlSPCConsiste.SelecionaSPCConsiste( StrToInt( MontaSelect.ValoresChave[0] ), MontaSelect.ValoresChave[1] );
//
//    cdsDet.Close;
//    cdsDet.Data := CtrlSPCConsiste.SelecionaItemSPCConsiste( StrToInt( MontaSelect.ValoresChave[0] ), StrToDate(MontaSelect.ValoresChave[2]));

    // Ricardo A. SOL 131939 KTN 755306
    Seleciona( StrToInt( MontaSelect.ValoresChave[0] ),
      MontaSelect.ValoresChave[1], StrToDate(MontaSelect.ValoresChave[2] ) );
    btnCriarData.Enabled := True;
    iQntVigencia := StrToInt(MontaSelect.ValoresChave[0]);
    // FIM Ricardo A. SOL 131939 KTN 755306
  end;
end;

procedure TfrmCadSPCConsiste.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  cdsDetPLANO.AsInteger := ParamIntegra.Plano;

  // Ricardo A. SOL 131939 KTN 755306
  if ( Trim( cbbPlano.LookUpValue ) <> '' ) then
    cdsDetPLANO.AsString := cbbPlano.LookUpValue
  else
    cdsDetPLANO.AsInteger := ParamIntegra.Plano;

  btnCriarData.Enabled := False;
  // FIM Ricardo A. SOL 131939 KTN 755306
end;




procedure TfrmCadSPCConsiste.CmeDetalheBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  if cdsDetPLACONTA.IsNull then
  begin
    MsgDlg('Preencha o campo com uma conta contábil.','Aviso', mtWarning, [mbOK],0);
    Abort;
  end;

  // Ricardo A. SOL 131939 KTN 755306
  if not CtrlPlanoConta.ContaExiste( cdsDetPLANO.Value, cdsDetPLACONTA.Value ) then
  begin
    MsgDlg('A conta ' + cdsDetPLACONTA.Value + ' não existe no plano contábil ' +
      cdsDetPLANO.AsString + '.', 'Aviso', mtWarning, [mbOK],0);
    Abort;
  end;
  // FIM Ricardo A. SOL 131939 KTN 755306

  if not (rdgCalcula.ItemIndex in [0..1]) then
  begin
     MsgDlg('Informe o tipo de cálculo do valor!','Aviso', mtWarning, [mbOK],0);
     Abort;
  end;

  // Ricardo A. SOL 131939 KTN 755306
  if Trim(dtpDtSpcConsiste.Text) = '' then
  begin
    MsgCtrl('Defina uma data de composição.');
    dtpDtSpcConsiste.SetFocus;
    Abort;
  end
  else
    begin
      if CdsDet.State in [dsEdit, dsInsert] then
        CdsDetDTSPCCONSISTE.AsDateTime := dtpDtSpcConsiste.Date;
    end;
  // FIM Ricardo A. SOL 131939 KTN 755306

end;




procedure TfrmCadSPCConsiste.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  if trim( CdsDESCRICAO.AsString ) = '' then
  begin
    MsgDlg('Preencha a descrição.','Aviso', mtWarning, [mbOK],0);
    dbedtDescricao.SetFocus;
    Abort;
  end;

  if CmeCadastro.Operacao <> opApagar then
  begin
    if cdsDet.RecordCount < 1 then
    begin
      MsgDlg('Inclua no mínimo uma conta contábil.','Aviso', mtWarning, [mbOK],0);
      Abort;
    end;
  end;

  // Ricardo A. SOL 131939 KTN 755306
  if Trim(dtpDtSpcConsiste.Text) = '' then
  begin
    MsgDlg('Informe uma data de composição.','Aviso', mtWarning, [mbOK],0);
    dtpDtSpcConsiste.Enabled := True;
    dtpDtSpcConsiste.SetFocus;
    Abort;
  end
  else
  begin
    if btnCriarData.Down then
    begin
      CdsDet.First;
      while not cdsDet.Eof do
      begin
        CdsDet.Edit;
        CdsDetDTSPCCONSISTE.asDateTime := dtpDtSpcConsiste.Date;
        CdsDet.Post;
        CdsDet.Next;
      end;
    end;
  end;
  // FIM Ricardo A. SOL 131939 KTN 755306
end;

procedure TfrmCadSPCConsiste.bbtnConfirmarClick(Sender: TObject);
begin
  if dsDet.State in [dsInsert, dsEdit] then
  begin
    CmeDetalhe.Confirma( Self );
    CmeDetalhe.Cancel( Self );
  end;
  inherited;       
end;

procedure TfrmCadSPCConsiste.dtpDtSpcConsisteCloseUp(Sender: TObject);
var
  sDia, sMes, sAno: Word;
begin
  // Ricardo A. SOL 131939 KTN 755306
  if Trim( dtpDtSpcConsiste.Text ) <> '' then
  begin
    DecodeDate(dtpDtSpcConsiste.Date, sAno, sMes, sDia);
    if dtpDtSpcConsiste.Date <> StrToDateTime('01/'+ IntToStr(sMes)+'/'+ IntToStr(sAno)) then
    begin
      MsgCtrl('A data de composição do Tipo de Rentabilidade deve ser definida para o 1º dia do período desejado');

      dtpDtSpcConsiste.Clear;

      if dtpDtSpcConsiste.Enabled and dtpDtSpcConsiste.Visible then
        dtpDtSpcConsiste.SetFocus;
      CmeDetalhe.Cancel(Self);
      Exit;
    end;

    if btnCriarData.Down then
    begin
      if VerificaDataDisponibilidade(CdsIDSPCCONSISTE.AsInteger, iNumPlano, dtpDtSpcConsiste.Text) then
      begin
        MsgCtrl('Data de Composição já utilizada para este Tipo de Rentabilidade');
        dtpDtSpcConsiste.Clear;

        if dtpDtSpcConsiste.Enabled and dtpDtSpcConsiste.Visible then
          dtpDtSpcConsiste.SetFocus;
        CmeDetalhe.Cancel(Self);
      end;
    end;
  end;
  // FIM Ricardo A. SOL 131939 KTN 755306
end;

procedure TfrmCadSPCConsiste.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  // Ricardo A. SOL 131939 KTN 755306
  if cdsDet.IsEmpty then
  begin
    btnCriarData.Down := False;
    btnCriarData.Enabled := False;
  end
  else
    btnCriarData.Enabled := True;
  // FIM Ricardo A. SOL 131939 KTN 755306
end;

procedure TfrmCadSPCConsiste.btnCriarDataClick(Sender: TObject);
begin
  // Ricardo A. SOL 131939 KTN 755306
  iNumPlano := CdsDetPLANO.AsInteger;
  sbtnAlterarClick(Self);
  dbedtDescricao.Enabled := False;
  
  dtpDtSpcConsiste.Clear;
  dtpDtSpcConsiste.Enabled := True;
  dtpDtSpcConsiste.SetFocus;
  cbbPlano.Value := IntToStr(iNumPlano);

  _cdsAux.Data := CdsDet.Data;
  cdsDet.Close;
  CdsDet.Data := CtrlSPCConsiste.SelecionaItemSPCConsiste(-1, -1);
  _cdsAux.First;
  while not _cdsAux.Eof do
  begin
    CdsDet.Insert;
    CdsDetPLANO.AsInteger := _cdsAux.FieldByName('PLANO').AsInteger;
    CdsDetPLACONTA.asString := _cdsAux.FieldByName('PLACONTA').asString;
    CdsDetIDSPCCONSISTE.asInteger := _cdsAux.fieldByname('IDSPCCONSISTE').asInteger;
    cdsDetFLGSALDOOUMOVIM.AsString := _cdsAux.fieldByname('FLGSALDOOUMOVIM').AsString;
    CdsDet.Post;
    _cdsAux.Next;
  end;
  // FIM Ricardo A. SOL 131939 KTN 755306
end;

function TfrmCadSPCConsiste.VerificaDataDisponibilidade(iTipoConsiste,
  iPlano: integer; dDataConsiste: string): boolean;
var
  sSQL: string;
  cdsAux: TCmClientDataSet;
begin
  // Ricardo A. SOL 131939 KTN 755306
  Result := False;
  cdsAux := TCMClientDataSet.Create(nil);
  try
    sSQL := 'SELECT COUNT(IDITEMSPCCONSISTE) AS QNTITEMCONSISTE ' + #13 +
            '  FROM ITEMSPCCONSISTE ' + #13 +
            ' WHERE IDSPCCONSISTE = ' +  IntToStr(iTipoConsiste) + #13+
            '   AND PLANO = ' + IntToStr(iPlano) + #13 +
            '   AND DTSPCCONSISTE = ' + QuotedStr(dDataConsiste);
    cdsAux.Data := CtrlSPCConsiste.GetDataPacket(sSQL);

    if (cdsAux.IsEmpty) or (cdsAux.FieldByName('QNTITEMCONSISTE').asInteger < 1) then
      Result := False
    else
      Result := True;
  finally
    FreeAndNil(cdsAux);
  end;
  // FIM Ricardo A. SOL 131939 KTN 755306
end;

function TfrmCadSPCConsiste.QntVigenciasXTipDisponibilidade(
  iTipoConsiste: integer): integer;
var
  sSQL: string;
  cdsAux: TCMClientDataSet;
begin
  // Ricardo A. SOL 131939 KTN 755306
  cdsAux := TCMClientDataSet.Create(nil);
  try
    sSQL := 'SELECT DISTINCT I.DTSPCCONSISTE AS QNTVIGENCIAS ' +
            '  FROM ITEMSPCCONSISTE I, ' +
            '       SPCCONSISTE S    ' +
            ' WHERE I.IDSPCCONSISTE = S.IDSPCCONSISTE ' +
            '   AND I.IDSPCCONSISTE = ' + IntToStr(iTipoConsiste);

    cdsAux.Data := CtrlSPCConsiste.GetDataPacket(sSQL);
    Result := cdsAux.RecordCount;
  finally
    FreeAndNil(cdsAux);
  end;
  // FIM Ricardo A. SOL 131939 KTN 755306
end;

procedure TfrmCadSPCConsiste.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  // Ricardo A. SOL 131939 KTN 755306
  Seleciona(iQntVigencia, sTipoRent, dtpDtSpcConsiste.Date);
  btnCriarData.Down := False;
  if iQntVigencia <> 0 then
    btnCriarData.Enabled := True;
  // FIM Ricardo A. SOL 131939 KTN 755306
end;

procedure TfrmCadSPCConsiste.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  // Ricardo A. SOL 131939 KTN 755306
  btnCriarData.Enabled := False;
  // FIM Ricardo A. SOL 131939 KTN 755306
end;


procedure TfrmCadSPCConsiste.Seleciona(piIdSPCConsiste: Integer;
  psTipoConsiste: String; pdDtSpcConsiste: TDate);
begin
  // Ricardo A. SOL 131939 KTN 755306
  cds.Close;
  cds.Data := CtrlSPCConsiste.SelecionaSPCConsiste( piIdSPCConsiste, psTipoConsiste);

  cdsDet.Close;
  cdsDet.Data := CtrlSPCConsiste.SelecionaItemSPCConsiste( piIdSPCConsiste, pdDtSpcConsiste );

  If ( CdsDet.RecordCount > 0 ) Then
  Begin
    cbbPlano.LookupValue := CdsDet.FieldByName('PLANO').AsString;
    dtpDtSpcConsiste.Date := CdsDet.FieldByName('DTSPCCONSISTE').AsDateTime;
  End;
  // FIM Ricardo A. SOL 131939 KTN 755306
end;

procedure TfrmCadSPCConsiste.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  // Ricardo A. SOL 131939 KTN 755306
  cbbPlano.Enabled := False;
  dtpDtSpcConsiste.Enabled := False;
  // FIM Ricardo A. SOL 131939 KTN 755306
end;

procedure TfrmCadSPCConsiste.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  // Ricardo A. SOL 131939 KTN 755306
  if cdsDet.IsEmpty then
  begin
    cbbPlano.Enabled := False;
    cbbPlano.Clear;

    dtpDtSpcConsiste.Enabled := False;
    dtpDtSpcConsiste.Clear;
  end;
  // FIM Ricardo A. SOL 131939 KTN 755306
end;

procedure TfrmCadSPCConsiste.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  // Ricardo A. SOL 131939 KTN 755306
  cbbPlano.Enabled := False;
  dtpDtSpcConsiste.Enabled := False;
  // FIM Ricardo A. SOL 131939 KTN 755306
end;

procedure TfrmCadSPCConsiste.CmeDetalheConfirma(Sender: TObject);
begin
  inherited;
  // Ricardo A. SOL 131939 KTN 755306
  cbbPlano.Enabled := ( cdsDet.RecordCount = 0 );
  dtpDtSpcConsiste.Enabled := (cdsDet.RecordCount = 0);
  // FIM Ricardo A. SOL 131939 KTN 755306
end;

procedure TfrmCadSPCConsiste.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  // Ricardo A. SOL 131939 KTN 755306
  if cdsDet.IsEmpty then
  begin
    btnCriarData.Down := False;
    btnCriarData.Enabled := False;
  end
  else
    btnCriarData.Enabled := True;
  // FIM Ricardo A. SOL 131939 KTN 755306
  
end;

end.

