unit FCadTipoRentabilidade;

{==============================================================================
// HISTÓRICO DE ALTERAÇÕES
//------------------------------------------------------------------------------
{=========================================================================================
 Autor.....: Marcelo Cardoso Santos Filho
 SIG.......: 26555
 Data      : 16/02/2017
 Descrição : Incluindo verificação para grupo "Patrimônio Social"
 =========================================================================================
N. SOL.............: 139049
N. Kintana.........: 851752
Data...............: 05/07/2010
Responsável........: Cássio Camargo
Descrição..........: Correção em tela para que sejam carregadas as contas
                     contábeis relacionadas ao Plano de Contas selecionado ou
                     vigente na Data de Composição do Tipo de Rentabilidade.

N. Sol.............:  43993
N. Kintana.........: 523266
Data...............: 03/09/2009
Responsável........: Cássio Camargo
Descrição..........: implementação e Validação do campos data de Composição

  Desenvolvedor: Augusto
  Data         : 27/10/2007
  Pendência    : 22595
  Descrição    : 1) Incluir controle de plano para as rentabilidades
                 2) Incluir controle para possibilitar duplicar um tipo de rentabilidade
------------------------------------------------------------------------------}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask, DBCtrls,
  CMProcuraMask, uCtrlContab, uCtrlSPCConsiste, dBaseDados,
  uSistema, uCtrlParamIntegra, uCmTypes, uCmControlObject, uCmSqlParams,
  uCtrlPlano,
  uMensErro, wwdblook, CmParamReport, wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmCadTipoRentabilidade = class(TFrmCadastroMestreDetMT)
    Label1: TLabel;
    dbedtDescricao: TDBEdit;
    CdsIDSPCCONSISTE: TFloatField;
    CdsDESCRICAO: TStringField;
    CdsTIPOCONSISTE: TStringField;
    CdsDet: TCMClientDataSet;
    CdsDetIDITEMSPCCONSISTE: TFloatField;
    CdsDetPLANO: TFloatField;
    CdsDetPLACONTA: TStringField;
    CMProcuraMaskContabil: TCMProcuraMaskContabil;
    CdsDetIDSPCCONSISTE: TFloatField;
    SqlAux: TCMSqlParams;
    CdsAux: TCMClientDataSet;
    CdsPlano: TCMClientDataSet;
    Label2: TLabel;
    DbLkcPlano: TwwDBLookupCombo;
    sbtnDuplicaPlanilha: TToolbarButton97;
    FrmOpcoesDuplica: TCmParamReport;
    CdsAuxDet: TCMClientDataSet;
    lblDTSPCCONSISTE: TLabel;
    dtpDtSpcConsiste: TCMDateTimePicker;
    CdsDetDTSPCCONSISTE: TDateTimeField;
    sbtnCriarData: TToolbarButton97;
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
    procedure CMProcuraMaskContabilExit(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure sbtnDuplicaPlanilhaClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnCriarDataClick(Sender: TObject);
    procedure dtpDtSpcConsisteCloseUp(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure DbLkcPlanoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    CtrlSPCConsiste : TCtrlSPCConsiste;
    CtrlContab      : TCtrlContab;
    CtrlPlano       : TCtrlPlano;
    iNumPlano       : Integer;
    iQntVigencia    : Integer;
    sTipoRent       : String;
    _cdsAux          : TCmClientDataSet;

    Procedure Seleciona( piIdSPCConsiste : Integer; psTipoConsiste : String; pdDtSpcConsiste: TDate);
    function VerificaDataDisponibilidade(iTipoConsiste, iPlano: integer; dDataConsiste: String) : boolean;
    function QntVigenciasXTipDisponibilidade(iTipoConsiste: integer): integer;

  public
    { Public declarations }
    procedure MsgCtrl( sMsg : string );
  end;

var
  FrmCadTipoRentabilidade: TFrmCadTipoRentabilidade;

implementation

{$R *.DFM}

procedure TFrmCadTipoRentabilidade.CmeCadastroInsert(Sender: TObject);
begin

  Cds.Close;
  CdsDet.Close;

  Cds.CreateDataSet;
  CdsDet.CreateDataSet;

  inherited;

  DbLkcPlano.Enabled := True;
  //Cássio - SOL Nº 43993 KINTANA Nº 523266
  dtpDtSpcConsiste.Enabled := True;
  sbtnCriarData.Enabled := False;
  dbedtDescricao.Enabled := True;
  dbedtDescricao.SetFocus;

end;

procedure TFrmCadTipoRentabilidade.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  CdsTIPOCONSISTE.AsString := 'TR';
  Accept := CtrlSPCConsiste.Gravar;
end;

procedure TFrmCadTipoRentabilidade.FormCreate(Sender: TObject);
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

  CtrlPlano := TCtrlPlano.Create;
  CtrlPlano.InitializeAs( CtrlSPCConsiste );

  CdsPlano.Data := CtrlPlano.ListPlano( 0 );

  DbLkcPlano.Enabled := False;
  //Cássio - SOL Nº 43993 KINTANA Nº 523266 - Início
  dtpDtSpcConsiste.Enabled := False;
  sbtnCriarData.Enabled := False;
  //Cássio - SOL Nº 43993 KINTANA Nº 523266 - Início

  CMProcuraMaskContabil.Plano   := ParamIntegra.Plano;
  CMProcuraMaskContabil.Mascara := CtrlContab.MascaraContaParam;

  cdsDetPLACONTA.EditMask := CtrlContab.MascaraContaParam + ';0; ';

  iQntVigencia := 0;
  sTipoRent := '';
  _CdsAux := TCMClientDataSet.Create(Self);
end;

procedure TFrmCadTipoRentabilidade.FormDestroy(Sender: TObject);
begin
  inherited;
  CtrlSPCConsiste.Free;
  CtrlContab.Free;
  _cdsAux.Free;
end;

procedure TFrmCadTipoRentabilidade.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  CdsTIPOCONSISTE.AsString := 'TR';
  Accept := CtrlSPCConsiste.Gravar;
end;

procedure TFrmCadTipoRentabilidade.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  if QntVigenciasXTipDisponibilidade(iQntVigencia) > 1 then
  begin
    Accept := CtrlSPCConsiste.DeletarItemSpcConsiste;
    dtpDtSpcConsiste.Clear;
  end
  else
    Accept := CtrlSPCConsiste.Deletar;
end;

procedure TFrmCadTipoRentabilidade.CmeCadastroFind(Sender: TObject);
var
  iPlano : Integer;
begin
  inherited;

  if MontaSelect.RetornouValor Then
  begin

    Seleciona( StrToInt( MontaSelect.ValoresChave[0] ), MontaSelect.ValoresChave[1], StrToDate(MontaSelect.ValoresChave[2]));
    sbtnCriarData.Enabled := True;
    iQntVigencia := StrToInt(MontaSelect.ValoresChave[0]);
    sTipoRent := MontaSelect.ValoresChave[1];


    //Cássio - SOL Nº 139049 KINTANA Nº 851752 - Início
    if CtrlContab.SelecionaPlanoData(Sistema.IdEmpresa, DateToStr(CdsDetDTSPCCONSISTE.AsDateTime)) then
    begin
      iPlano := CtrlContab.PlanoData;
      CMProcuraMaskContabil.Plano := iPlano;
    end;
    //Cássio - SOL Nº 139049 KINTANA Nº 851752 - Fim
  end;

end;

procedure TFrmCadTipoRentabilidade.CmeDetalheInsert(Sender: TObject);
begin
  inherited;

  If ( Trim( DbLkcPlano.LookUpValue ) <> '' ) Then Begin

    cdsDetPLANO.AsString := DbLkcPlano.LookUpValue;

  End Else Begin

    cdsDetPLANO.AsInteger := ParamIntegra.Plano;

  End;
  //Cássio - SOL Nº 43993 KINTANA Nº 523266
  sbtnCriarData.Enabled := False;
end;

procedure TFrmCadTipoRentabilidade.CmeDetalheBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
  inherited;

  if cdsDetPLACONTA.IsNull then
  begin
    MsgDlg('Preencha o campo com uma conta contábil.','Aviso', mtWarning, [mbOK],0);
    Abort;
  end;
  //Cássio - SOL Nº 43993 KINTANA Nº 523266 - Início
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
  //Cássio - SOL Nº 43993 KINTANA Nº 523266 - Fim
end;

procedure TFrmCadTipoRentabilidade.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
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

  if Trim(dtpDtSpcConsiste.Text) = '' then
  begin
    MsgDlg('Informe uma data de composição.','Aviso', mtWarning, [mbOK],0);
    dtpDtSpcConsiste.Enabled := True;
    dtpDtSpcConsiste.SetFocus;
    Abort;
  end
  else
  begin
    if sbtnCriarData.Down then
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
end;

procedure TFrmCadTipoRentabilidade.bbtnConfirmarClick(Sender: TObject);
begin
  if dsDet.State in [dsInsert, dsEdit] then
  begin
    CmeDetalhe.Confirma( Self );
    CmeDetalhe.Cancel( Self );
  end;
  inherited;
end;

procedure TFrmCadTipoRentabilidade.MsgCtrl(sMsg: string);
begin
  MsgDlg( sMsg, 'Aviso', mtWarning, [mbOK],0 );
end;

procedure TFrmCadTipoRentabilidade.CMProcuraMaskContabilExit(
  Sender: TObject);
Var
  str       : String;
  cPlaGrupo : Char;

begin
  inherited;

  //Cássio - SOL Nº 139049 KINTANA Nº 851752 - Inicio
  //Validação incluída para tratar Access Violation que ocorria quando não
  //selecionada nenhuma PLACONTA.
  if not CdsDetPLACONTA.IsNull then
  begin
  //Cássio - SOL Nº 139049 KINTANA Nº 851752 - Fim
    SqlAux.Sql.Clear;
    SqlAux.Sql.Add('SELECT PLAGRUPO FROM PLANOCONTA WHERE PLANO = '+
                   IntToStr(CMProcuraMaskContabil.Plano)+' AND PLACONTA = '+
                   QuotedStr(CdsDet.FieldByName('PLACONTA').AsString));

    SqlAux.Open;

    If CdsAux.FieldByName('PLAGRUPO').AsString[1] <> '' Then
      cPlaGrupo := CdsAux.FieldByName('PLAGRUPO').AsString[1];

    If (cPlaGrupo <> 'A') And (cPlaGrupo <> 'P') And
       (cPlaGrupo <> 'R') And (cPlaGrupo <> 'D') And
       (cPlaGrupo <> 'S')//MARCELO CARDOSO - SIG26555 - Incluindo verificação para grupo "Patrimônio Social"
    Then

      MsgDlg('As contas tem de ser de um desses grupos relacionados na tela.', 'Aviso',mtWarning, [mbOk], 0);
  end;
end;

procedure TFrmCadTipoRentabilidade.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;

  DbLkcPlano.Enabled := False;
  //Cássio - SOL Nº 43993 KINTANA Nº 523266
  dtpDtSpcConsiste.Enabled := False;

end;

procedure TFrmCadTipoRentabilidade.CmeCadastroCancel(Sender: TObject);
begin
  inherited;

  DbLkcPlano.Enabled := False;
  DbLkcPlano.Clear;

  //Cássio - SOL Nº 43993 KINTANA Nº 523266
  dtpDtSpcConsiste.Enabled := False;
  dtpDtSpcConsiste.Clear;

  cds.EmptyDataSet;
  CdsDet.EmptyDataSet;
end;

procedure TFrmCadTipoRentabilidade.CmeCadastroEdit(Sender: TObject);
begin
  inherited;

  DbLkcPlano.Enabled := False;
  //Cássio - SOL Nº 43993 KINTANA Nº 523266
  dtpDtSpcConsiste.Enabled := False;
end;

procedure TFrmCadTipoRentabilidade.CmeDetalheConfirma(Sender: TObject);
begin
  inherited;

  DbLkcPlano.Enabled := ( cdsDet.RecordCount = 0 );
  //Cássio - SOL Nº 43993 KINTANA Nº 523266
  dtpDtSpcConsiste.Enabled := (cdsDet.RecordCount = 0);
end;

Procedure TFrmCadTipoRentabilidade.sbtnDuplicaPlanilhaClick( Sender: TObject );
Var
  CtrlSPCConsisteLocal : TCtrlSPCConsiste;
Begin

  Inherited;

  If ( Trim( dbedtDescricao.Text ) <> '' ) And ( FrmOpcoesDuplica.Execute ) Then Begin

    Try

      { Tipo de rentabilidade }
      CtrlSPCConsisteLocal := TCtrlSPCConsiste.Create;
      CtrlSPCConsisteLocal.InitializeAs( CtrlSPCConsiste );

      CtrlSPCConsisteLocal.cdsSPCConsiste := CdsAux;

      CdsAux.Data := CtrlSPCConsisteLocal.SelecionaSPCConsiste( -1, '' );

      CdsAux.Insert;

      CdsAux.FieldByName('DESCRICAO').AsString     := FrmOpcoesDuplica.ParamValues[0].Value;
      CdsAux.FieldByName('TIPOCONSISTE').AsString  := 'TR';

      { Itens  }

      CtrlSPCConsisteLocal.cdsItemSPCConsiste := CdsAuxDet;

      CdsAuxDet.Data := CtrlSPCConsisteLocal.SelecionaItemSPCConsiste( -1, -1);

      CtrlSPCConsiste.cdsItemSPCConsiste.First;
      While ( Not CtrlSPCConsiste.cdsItemSPCConsiste.Eof ) Do Begin

        CdsAuxDet.Insert;

        CdsAuxDet.FieldByName('PLANO').AsInteger    := FrmOpcoesDuplica.ParamValues[1].Value;
        CdsAuxDet.FieldByName('PLACONTA').AsInteger := CtrlSPCConsiste.cdsItemSPCConsiste.FieldByName('PLACONTA').AsInteger;
        CdsAuxDet.FieldByName('DTSPCCONSISTE').asDateTime := CtrlSPCConsiste.cdsItemSPCConsiste.FieldByName('DTSPCCONSISTE').asDateTime;

        CdsAuxDet.Post;

        CtrlSPCConsiste.cdsItemSPCConsiste.Next;

      End;

      If ( Not CtrlSPCConsisteLocal.Gravar ) Then Begin

        MsgDlg( 'Erro ao duplicar Tipo de Rentabilidade.' + #13 +
                'Verifique se as contas contábeis existem no plano de destino.' ,

                'Erro', mtError, [mbOk], 0 );

        Seleciona( CtrlSPCConsisteLocal.DbSPCConsiste.IdSpcConsiste.AsInteger , 'TR', StrToDate('01/01/2005'));
        
      End;


    Finally

      FreeAndNil( CtrlSPCConsisteLocal );

    End;

  End;

  sbtnDuplicaPlanilha.Down := False;

End;

procedure TFrmCadTipoRentabilidade.Seleciona( piIdSPCConsiste : Integer; psTipoConsiste : String;
                                              pdDtSpcConsiste: TDate);
begin

  cds.Close;
  cds.Data := CtrlSPCConsiste.SelecionaSPCConsiste( piIdSPCConsiste, psTipoConsiste);

  cdsDet.Close;
  cdsDet.Data := CtrlSPCConsiste.SelecionaItemSPCConsiste( piIdSPCConsiste, pdDtSpcConsiste );

  If ( CdsDet.RecordCount > 0 ) Then
  Begin
    DbLkcPlano.LookupValue := CdsDet.FieldByName('PLANO').AsString;
    //Cássio - SOL Nº43993 KINTANA Nº523266
    dtpDtSpcConsiste.Date := CdsDet.FieldByName('DTSPCCONSISTE').AsDateTime;
  End;

end;

procedure TFrmCadTipoRentabilidade.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  sbtnCriarData.Down := False;
  sbtnCriarData.Enabled := False;
end;

procedure TFrmCadTipoRentabilidade.sbtnCriarDataClick(Sender: TObject);
begin
  inherited;
  iNumPlano := CdsDetPLANO.AsInteger;
  sbtnAlterarClick(Self);
  dbedtDescricao.Enabled := False;
  
  dtpDtSpcConsiste.Clear;
  dtpDtSpcConsiste.Enabled := True;
  dtpDtSpcConsiste.SetFocus;
  DbLkcPlano.Value := IntToStr(iNumPlano);

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
    //CdsDetDTSPCCONSISTE.asDateTime := dtpDtSpcConsiste.Date;
    CdsDet.Post;
    _cdsAux.Next;
  end;

end;

function TFrmCadTipoRentabilidade.VerificaDataDisponibilidade(
  iTipoConsiste, iPlano: integer; dDataConsiste: string): boolean;
var sSQL: string;
    cdsAux: TCmClientDataSet;
begin
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
end;

procedure TFrmCadTipoRentabilidade.dtpDtSpcConsisteCloseUp(
  Sender: TObject);
var
  sDia, sMes, sAno : word;
begin
  inherited;
  if Trim(dtpDtSpcConsiste.Text) <> '' then
  begin
    DecodeDate(dtpDtSpcConsiste.Date, sAno, sMes, sDia);
    if dtpDtSpcConsiste.Date <> StrToDateTime('01/'+ IntToStr(sMes)+'/'+ IntToStr(sAno)) then
    begin
      MsgCtrl('A data de composição do Tipo de Rentabilidade deve ser definida para o 1º dia do período desejado');
      dtpDtSpcConsiste.Clear;
      dtpDtSpcConsiste.SetFocus;
      CmeDetalhe.Cancel(Self);
      Exit;
    end;

    if sbtnCriarData.Down then
    begin
      if VerificaDataDisponibilidade(CdsIDSPCCONSISTE.AsInteger, iNumPlano, dtpDtSpcConsiste.Text) then
      begin
        MsgCtrl('Data de Composição já utilizada para este Tipo de Rentabilidade');
        dtpDtSpcConsiste.Clear;
        dtpDtSpcConsiste.SetFocus;
        CmeDetalhe.Cancel(Self);
      end;
    end;
  end;
end;

function TFrmCadTipoRentabilidade.QntVigenciasXTipDisponibilidade(
  iTipoConsiste: integer): integer;
var
  sSQL: string;
  cdsAux: TCMClientDataSet;
begin
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
end;

procedure TFrmCadTipoRentabilidade.CmeCadastroAfterConfirma(
  Sender: TObject);
begin
  inherited;
  Seleciona(iQntVigencia, sTipoRent, dtpDtSpcConsiste.Date);
  sbtnCriarData.Down := False;
  if iQntVigencia <> 0 then
    sbtnCriarData.Enabled := True;
end;

procedure TFrmCadTipoRentabilidade.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  sbtnCriarData.Enabled := False;
end;

procedure TFrmCadTipoRentabilidade.DbLkcPlanoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  //Cássio - SOL Nº 139049 KINTANA Nº 851752
  CMProcuraMaskContabil.Plano := CdsPlano.FieldByName('PLANO').asInteger;
end;

end.
