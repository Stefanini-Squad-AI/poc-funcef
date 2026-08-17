unit FCadIR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, TREdit, Mask, wwdblook,
  UmensErro, UDataBase, wwdbdatetimepicker, CMDateTimePicker,
  CmEventosCadastro, ImgList ;


type
  TfrmCadIR = class(TfrmCadastroCS)
    rgpTipo: TRadioGroup;
    dbLInvest: TwwDBLookupCombo;
    lblTipoInv: TLabel;
    Label2: TLabel;
    dbdDtaRef: TCMDateTimePicker;
    dbrAliquota: TDBRealEdit;
    Label4: TLabel;
    Label5: TLabel;
    qryTipoInvestimento: TwwQuery;
    qryTipoOperacao: TwwQuery;
    qryTipoInvestimentoDESCTIPOINVEST: TStringField;
    qryTipoInvestimentoIDTIPOINVEST: TFloatField;
    qryTipoOperacaoDESCTIPOOPERACAO: TStringField;
    qryTipoOperacaoIDTIPOOPERACAO: TFloatField;
    Label6: TLabel;
    lblTipoOper: TLabel;
    Label7: TLabel;
    dbLOperacao: TwwDBLookupCombo;
    dblMercado: TwwDBLookupCombo;
    qryTipoMercado: TwwQuery;
    qryTipoMercadoDESCMERCADO: TStringField;
    qryTipoMercadoIDMERCADO: TFloatField;
    qryIDTABELAIR: TFloatField;
    qryIDTIPOINVEST: TFloatField;
    qryIDTIPOOPERACAO: TFloatField;
    qryDTREF: TDateTimeField;
    qryALIQUOTA: TFloatField;
    qryIDMERCADO: TFloatField;
    qryCODTIPRENFIXA: TStringField;
    procedure FormShow(Sender: TObject);
    procedure rgpTipoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnInserirClick(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    procedure Posiciona(fIDTabelaIR : Double);
  public
    { Public declarations }
  end;

var
  frmCadIR: TfrmCadIR;

implementation

uses DBaseDados;

{$R *.DFM}

procedure TfrmCadIR.CmeCadastroInsert(Sender: TObject);
Begin
   Inherited;
   rgpTipo.SetFocus;
End;

procedure TfrmCadIR.CmeCadastroEdit(Sender: TObject);
Begin
   Inherited;
   rgpTipo.SetFocus;
End;

procedure TfrmCadIR.CmeCadastroFind(Sender: TObject);
Begin
   Inherited;
   If MontaSelect.RetornouValor Then
   Begin
      If Trim(MontaSelect.ValoresChave[1]) = '' Then  //Campo de Tipo de Operação
      Begin
         rgpTipo.ItemIndex   := 0;
         lblTipoOper.Enabled := False;
         dbLOperacao.Enabled := False;
      End
      Else
      Begin
         rgpTipo.ItemIndex   := 1;
         lblTipoOper.Enabled := True;
         dbLOperacao.Enabled := True;
      End;

      If Trim(MontaSelect.ValoresChave[2]) = '' Then
      Begin
         lblTipoInv.Enabled := False;
         dbLInvest.Enabled  := False;
      End
      Else
      Begin
         lblTipoInv.Enabled := True;
         dbLInvest.Enabled  := True;
      End;
      Posiciona(StrToFloat(MontaSelect.ValoresChave[0]));
   End
   Else
   Begin
      Posiciona(-1);
      lblTipoOper.Enabled := False;
      dbLOperacao.Enabled := False;
      lblTipoInv.Enabled  := True;
      dbLInvest.Enabled   := True;
   End;
End;

Procedure TfrmCadIR.Posiciona(fIDTabelaIR : Double);
Begin
   qry.Close;
   qry.ParamByName('IDTABELAIR').AsFloat := fIDTabelaIR;
   qry.Open;
End;

procedure TfrmCadIR.FormShow(Sender: TObject);
begin
  inherited;
  Qry.Close;
  Qry.Open;
  qryTipoInvestimento.Close;
  qryTipoInvestimento.Open;
  qryTipoOperacao.Close;
  qryTipoOperacao.Open;
  QryTipoMercado.Close;
  QryTipoMercado.Open;
end;

procedure TfrmCadIR.rgpTipoClick(Sender: TObject);
begin
  inherited;
   If rgpTipo.ItemIndex = 0  Then
   Begin
      lblTipoOper.Enabled      := False;
      dbLOperacao.Enabled := False;
      lblTipoInv.Enabled      := True;
      dbLInvest.Enabled   := True;
   End
   Else
   Begin
      lblTipoOper.Enabled      := True;
      dbLOperacao.Enabled := True;
      lblTipoInv.Enabled      := False;
      dbLInvest.Enabled   := False;
   End;
end;

procedure TfrmCadIR.bbtnConfirmarClick(Sender: TObject);
begin
   If (rgpTipo.ItemIndex = 0) And (Trim(dbLInvest.Text) = '')  Then
   Begin
      MsgDlg('Descrição do Tipo de Investimento em branco.','Mensagem do Sistema',mtWarning,[mbOK],0);
      dbLInvest.SetFocus;
      Exit;
   End
   Else If (rgpTipo.ItemIndex = 1) And (Trim(dbLOperacao.Text) = '')  Then
   Begin
      MsgDlg('Descrição do Tipo de Operação em branco.','Mensagem do Sistema',mtWarning,[mbOK],0);
      dbLOperacao.SetFocus;
      Exit;
   End;

   If (Trim(dblMercado.Text) = '') And
      (qryTipoInvestimento.FieldByName('IDTIPOINVEST').AsInteger<>1) Then
   Begin
      MsgDlg('Descrição do Tipo de Mercado em branco.','Mensagem do Sistema',mtWarning,[mbOK],0);
      dblMercado.SetFocus;
      Exit;
   End;

   If Trim(dbdDtaRef.Text) = '' Then
   Begin
      MsgDlg('Data de Vigência em branco.','Mensagem do Sistema',mtWarning,[mbOK],0);
      dbdDtaRef.SetFocus;
      Exit;
   End;

   If dbrAliquota.Value < 0 Then
   Begin
      MsgDlg('Alíquota menor que zero.','Mensagem do Sistema',mtWarning,[mbOK],0);
      dbrAliquota.SetFocus;
      Exit;
   End;

   If qry.State = dsInsert Then
      qry.FieldByName('IDTABELAIR').asInteger := LeUltRegistro(nil,'TABELAIR');

  inherited;
end;

procedure TfrmCadIR.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Qry.Close;
  QryTipoOperacao.Close;
  QryTipoInvestimento.Close;
  QryTipoMercado.Close;
end;

procedure TfrmCadIR.sbtnInserirClick(Sender: TObject);
begin
  inherited;
   rgpTipo.ItemIndex   := 0;
   lblTipoOper.Enabled      := False;
   dbLOperacao.Enabled := False;
   lblTipoInv.Enabled      := True;
   dbLInvest.Enabled   := True;
end;

procedure TfrmCadIR.CmeCadastroConfirma(Sender: TObject);
Begin
   dtmBaseDados.DbBaseDados.ApplyUpdates([qry]);
End;

end.
