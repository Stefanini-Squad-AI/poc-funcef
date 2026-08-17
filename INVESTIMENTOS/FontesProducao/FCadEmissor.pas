//******************************************************************************
// Data     : 20/07/2007
// Codigo   : AL_4
// Pendencia: 25944
// Linha(s) : Retirada da crítica JaExiste emissor Cadastrado
//******************************************************************************
// Data     : 19/07/2007
// Codigo   : AL_3
// Pendencia: 24875
// Linha(s) : Inclusão do Porte do Emissor, Agência de Risco,Rating's e RiskBank
//******************************************************************************
// Data     : 31/03/2006
// Codigo   : AL_2
// Pendencia:
// Linha(s) : Ajuste na troca de foco do TabControl
//******************************************************************************
// Data     : 25/11/2005
// Codigo   : AL_1
// Pendencia: 20802
// Linha(s) : Ajustes gerais no form, Procura, Inclusão, Alteração e Exclusão
//******************************************************************************
unit FCadEmissor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPessoa, StdCtrls, Db, ExtDlgs, Pessoa, Menus, MontaSelect, DBTables,
  Wwdatsrc, Wwquery, TB97, MAHlpBtn, Buttons, Grids, Wwdbigrd, Wwdbgrid,
  checklst, DBCtrls, ExtCtrls, TabControlDetalhe,
  wwdblook, Mask, wwdbedit, UMensErro, TB97Ctls, TB97Tlbr, IvDictio,
  IvMulti, IvEMulti, CMDBLookupCombo, Wwdbspin, CmEventosCadastro, ImgList,
  ComCtrls, wwdbdatetimepicker, CMDateTimePicker, TREdit, Wwdotdot,
  //AL_3
  Wwdbcomb;

type
  TfrmCadEmissor = class(TfrmPessoa)
    TbsEmissor: TTabSheet;
    LblSigla: TLabel;
    LblOrigem: TLabel;
    Label2: TLabel;
    DBESIGLA: TwwDBEdit;
    LblSetorEmissor: TLabel;
    DBLkSetorEmissor: TwwDBLookupCombo;
    qrySetorEmissor: TwwQuery;
    dsSetorEmissor: TwwDataSource;
    DBLkOrigemCapital: TwwDBLookupCombo;
    DBLkTipoCapital: TwwDBLookupCombo;
    QryOrigemCapital: TwwQuery;
    qryTipoCapital: TwwQuery;
    DSTipoCapital: TwwDataSource;
    DSOrigemCapital: TwwDataSource;
    QryOrigemCapitalCODORICAPEMISSOR: TStringField;
    qryTipoCapitalCODTPCAPEMISSOR: TStringField;
    QryProcuraEmissor: TwwQuery;
    qryAux: TwwQuery;
    QryOrigemCapitalDESCORICAPEMISSOR: TStringField;
    qryTipoCapitalDESCTPCAPEMISSOR: TStringField;
    qrySetorEmissorCODSETOREMISSOR: TStringField;
    qrySetorEmissorDESCSETOREMISSOR: TStringField;
    qrySetorEmissorSETORANALIT: TStringField;
    qrySubTipoIDEMISSOR: TFloatField;
    qrySubTipoIDSETOREMISSOR: TStringField;
    qrySubTipoCODORICAPEMISSOR: TStringField;
    qrySubTipoCODTPCAPEMISSOR: TStringField;
    qrySubTipoFLGINSTFIN: TStringField;
    qrySubTipoIDCLASSINSTFIN: TFloatField;
    qrySubTipoCODCETIP: TStringField;
    qrySubTipoCONTACETIP: TStringField;
    qryClassInstFin: TwwQuery;
    dtsClassInstFin: TwwDataSource;
    qryClassInstFinIDCLASSINSTFIN: TFloatField;
    qryClassInstFinDESCCLASSINSTFIN: TStringField;
    chkdbInstFin: TDBCheckBox;
    pnlInstFin: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    cboClassInstFin: TwwDBLookupCombo;
    qrySubTipoSIGLAEMISSOR: TStringField;
    PopEmiInst: TPopupMenu;
    Emissores1: TMenuItem;
    AgnciasBancrias1: TMenuItem;
    MSAgenciaBancaria: TMontaSelect;
    Label5: TLabel;
    MSEmissor: TMontaSelect;
    //AL_3
    Label6: TLabel;
    lblAgenciaRisco: TLabel;
    dblkagenciarisco: TwwDBLookupCombo;
    qrySubTipoIDAGENCIARISCO: TFloatField;
    QryAgenciaRisco: TwwQuery;
    QryAgenciaRiscoIDAGENCIARISCO: TFloatField;
    QryAgenciaRiscoDESCAGENCIARISCO: TStringField;
    dbporteemissor: TwwDBComboBox;
    qrySubTipoPORTEEMISSOR: TStringField;
    LblRating: TLabel;
    Label8: TLabel;
    dbedtrating: TwwDBEdit;
    DBRealEdit2: TDBRealEdit;
    qrySubTipoRATING: TStringField;
    qrySubTipoRISKBANK: TFloatField;
    Label7: TLabel;
    DbLkcSegmentacao: TwwDBLookupCombo;
    qrySegmentacao: TwwQuery;
    qrySegmentacaoIDSEGMENTACAO: TFloatField;
    qrySegmentacaoDESCSEGMENTACAO: TStringField;
    qrySubTipoIDSEGMENTACAO: TFloatField;

    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    function JaExiste : boolean ;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure pgctrlDetalheChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbcDetalheChange(Sender: TObject);
    procedure chkdbInstFinClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure Emissores1Click(Sender: TObject);
    Procedure BuscaEmissor;
    procedure AgnciasBancrias1Click(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    bEmissor:Boolean; //Thiago Passos CGPC 28
  public
    { Public declarations }
    Saindo: boolean;
    wNome : string;
  end;

var  frmCadEmissor: TfrmCadEmissor;

implementation

Uses UBibliotecaInvest;

{$R *.DFM}
procedure TfrmCadEmissor.CmeCadastroConfirma(Sender: TObject);
begin
   // AL_2 - Ini
   if Trim(qrysubtipo.FieldByName('SiglaEmissor').AsString) = '' then
   begin
      MsgDlg('Sigla do Emissor deve ser Informada', 'Aviso', mtError, [mbOk, mbHelp], 0);
      tbcDetalhe.TabIndex := TbsEmissor.PageIndex;
      pgctrlDetalhe.activepage := TbsEmissor;
      if DbeSigla.Canfocus then
         DbeSigla.SetFocus;
      exit;
   end
   else
   if Trim(qrysubtipo.FieldByName('CodTpCapEmissor').AsString) = '' then
   begin
      MsgDlg('Tipo do Capital do Emissor deve ser Informado', 'Aviso', mtError, [mbOk, mbHelp], 0);
      tbcDetalhe.TabIndex := TbsEmissor.PageIndex;
      pgctrlDetalhe.activepage := TbsEmissor;
      if DBLkTipoCapital.CanFocus then
         DBLkTipoCapital.SetFocus;
      exit;
   end
   else
   if qrysubtipo.FieldByName('CodOriCapEmissor').AsString = '' then
   begin
      MsgDlg('Origem do Capital do Emissor deve ser Informada', 'Aviso', mtError, [mbOk, mbHelp], 0);
      tbcDetalhe.TabIndex := TbsEmissor.PageIndex;
      pgctrlDetalhe.activepage := TbsEmissor;
      if DBLkOrigemCapital.CanFocus then
         DBLkOrigemCapital.SetFocus;
      exit;
   end
   else
   if qrysubtipo.FieldByName('idSetorEmissor').AsString = '' then
   begin
       MsgDlg('Setor do Emissor deve ser Informado', 'Aviso', mtError, [mbOk, mbHelp], 0);
       tbcDetalhe.TabIndex := TbsEmissor.PageIndex;
       pgctrlDetalhe.activepage := TbsEmissor;
       if DBLkSetorEmissor.CanFocus then
          DBLkSetorEmissor.SetFocus;
       exit;
   end;
   inherited;
end;

procedure TfrmCadEmissor.CmeCadastroDelete(Sender: TObject);
var
 PodeExcluir : boolean ;
 sSql        : String ;
begin
 try
  PodeExcluir := True;
  qryAux.Close;
  qryAux.SQL.Clear;
  sSql := 'SELECT PXE.IDPARAMEMISSOR, PXE.IDEMISSOR FROM PARAMXEMISSOR PXE WHERE PXE.IDEMISSOR = '''+qrySubTipo.FieldByname('IdEmissor').AsString + '''';
  qryAux.SQL.Add(sSQL);
  qryAux.Open;
  if ( not qryAux.IsEmpty) then
   begin
    PodeExcluir := False;
    MsgDlg('Emissor com Parametros Associados, Não pode ser Excluída',LerMensagem(2),mtError,[mbOk],0);
   end;
  qryAux.Close;
  qryAux.SQL.Clear;
  sSql := 'SELECT VPE.IDPARAMEMISSOR,VPE.IDEMISSOR FROM VALPARAMXEMISSOR VPE WHERE VPE.IDEMISSOR = '''+qrySubTipo.FieldByname('IdEmissor').AsString + '''';
  qryAux.SQL.Add(sSQL);
  qryAux.Open;
  if not qryAux.IsEmpty then
   begin
    PodeExcluir := False;
    MsgDlg('Emissor com Valores de Parametros Associados, Não pode ser Excluída',LerMensagem(2),mtError,[mbOk],0);
   end;
  qryAux.Close;
  qryAux.SQL.Clear;
  sSql := 'SELECT EXB.IDBOLSAVALORES,EXB.IDEMISSOR FROM EMISSORXBOLSA EXB WHERE EXB.IDEMISSOR = '''+QrySubTipo.FieldByname('IdEmissor').AsString + '''';
  qryAux.SQL.Add(sSQL);
  qryAux.Open;
  if ( not qryAux.IsEmpty) then
   begin
    PodeExcluir := False;
    MsgDlg('Emissor já cadastrado em Bolsa de Valores , Não pode ser Excluída',LerMensagem(2),mtError,[mbOk],0);
   end;
  if PodeExcluir then
   inherited;
  qryAux.Close;
 except raise ;
 end;
end;

Function TfrmCadEmissor.JaExiste: Boolean;
var
 ssql: string;
begin
   Try
      qryProcuraEmissor.Sql.Clear;
      sSql := 'SELECT E.IDEMISSOR,E.SIGLAEMISSOR FROM EMISSOR E WHERE E.SIGLAEMISSOR = '''+qrySubTipo.FieldByname('SiglaEmissor').AsString + '''';
      qryProcuraEmissor.SQL.Add(sSQL);
      qryProcuraEmissor.Open;
      if qry.State = dsInsert then
         Result := not qryProcuraEmissor.IsEmpty
      else if qry.State = dsEdit then
         Result := qryProcuraEmissor.IsEmpty;
      qryProcuraEmissor.Close;
   Except
      raise;
   End;
end;


procedure TfrmCadEmissor.bbtnConfirmarClick(Sender: TObject);
begin
  // AL_2 - Ini
  If Qrysubtipo.FieldByName('SiglaEmissor').AsString = '' then begin
    MsgDlg('Sigla do Emissor deve ser Informada', 'Aviso', mtError, [mbOk], 0);
    tbcDetalhe.TabIndex := TbsEmissor.PageIndex;
    PgctrlDetalhe.activepage := TbsEmissor;
    if DbeSigla.Canfocus then
       DbeSigla.SetFocus;
    Exit;
  end;
  If Trim(DBLkOrigemCapital.Text) = '' then begin
    MsgDlg('Origem do Capital deve ser Informada', 'Aviso', mtError, [mbOk], 0);
    tbcDetalhe.TabIndex := TbsEmissor.PageIndex;
    PgctrlDetalhe.activepage := TbsEmissor;
    if DBLkOrigemCapital.CanFocus then
       DBLkOrigemCapital.SetFocus;
    Exit;
  end;
  If Trim(DBLkTipoCapital.Text) = '' then begin
    MsgDlg('Tipo de Capital deve ser Informado', 'Aviso', mtError, [mbOk], 0);
    tbcDetalhe.TabIndex := TbsEmissor.PageIndex;
    PgctrlDetalhe.activepage := TbsEmissor;
    if DBLkTipoCapital.CanFocus then
       DBLkTipoCapital.SetFocus;
    Exit;
  end;
  If Trim(DBLkSetorEmissor.Text) = '' then begin
    MsgDlg('Setor do Emissor deve ser Informado', 'Aviso', mtError, [mbOk], 0);
    tbcDetalhe.TabIndex := TbsEmissor.PageIndex;
    PgctrlDetalhe.activepage := TbsEmissor;
    if DBLkSetorEmissor.CanFocus then
       DBLkSetorEmissor.SetFocus;
    Exit;
  end;
  If Trim(DbLkcSegmentacao.Text) = '' then begin
    MsgDlg('Segmentação de Mercado deve ser Informado', 'Aviso', mtError, [mbOk], 0);
    tbcDetalhe.TabIndex := TbsEmissor.PageIndex;
    PgctrlDetalhe.activepage := TbsEmissor;
    if DbLkcSegmentacao.CanFocus then
       DbLkcSegmentacao.SetFocus;
    Exit;
  end;
  // AL_2 - Fim

  inherited;

  pgctrlDetalhe.ActivePage := tbsDocumento;

  If qrySubTipo.FieldByName('FLGINSTFIN').AsString <> 'S' Then
  begin
     chkdbInstFin.Checked := false;
     //AL_3
     dblkagenciarisco.Visible := True;
     lblAgenciaRisco.Visible := True;
     LblRating.Visible := True;
     dbedtrating.Visible := True;
  end
  else // Se não for instituição financeira
  begin
     dblkagenciarisco.Visible := False;
     lblAgenciaRisco.Visible := False;
     LblRating.Visible := False;
     dbedtrating.Visible := False;
  end; //Fim AL_3



  {  if Trim(DbLkcSegmentacao.Text)='' then
    begin
      MsgDlg('A Segmentação de Mercado não foi preenchido',
                 'Mensagem do Sistema', mtError, [mbOk], 0);
      exit;
    end;     }


end;

procedure TfrmCadEmissor.pgctrlDetalheChange(Sender: TObject);
begin
  inherited;
  // AL_2
  If pgctrlDetalhe.ActivePage = TbsEmissor Then Begin
    //AL_3
    If qrySubTipo.FieldByName('FLGINSTFIN').AsString <> 'S' Then
    begin  // Fim AL_3
       chkdbInstFin.Checked := false;
       //AL_3
       dblkagenciarisco.Visible := True;
       lblAgenciaRisco.Visible := True;
       LblRating.Visible := True;
       dbedtrating.Visible := True;
    end
    else // Se não for instituição financeira
    begin
       dblkagenciarisco.Visible := False;
       lblAgenciaRisco.Visible := False;
       LblRating.Visible := False;
       dbedtrating.Visible := False;
    end; //Fim AL_3
  End;
end;

procedure TfrmCadEmissor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  QryTipoCapital.Close;
  QryOrigemCapital.Close;
  QrySetorEmissor.Close;
  // AL_2
  qryClassInstFin.Close;
end;

procedure TfrmCadEmissor.tbcDetalheChange(Sender: TObject);
begin
  inherited;
  If pgctrlDetalhe.ActivePage = TbsEmissor Then Begin
    pnlInstFin.Visible := (qrySubTipo.FieldByName('FlgInstFin').AsString='S');
    If qrySubTipo.FieldByName('FLGINSTFIN').AsString <> 'S' Then
    begin
       chkdbInstFin.Checked := False;
       //AL_3
       dblkagenciarisco.Visible := True;
       lblAgenciaRisco.Visible := True;
       LblRating.Visible := True;
       dbedtrating.Visible := True;
    end
    else // Se não for instituição financeira
    begin
       dblkagenciarisco.Visible := False;
       lblAgenciaRisco.Visible := False;
       LblRating.Visible := False;
       dbedtrating.Visible := False;
    end; //Fim AL_3

  End;
end;

procedure TfrmCadEmissor.chkdbInstFinClick(Sender: TObject);
begin
  inherited;
//  Caso Checado
  If ChkdbInstFin.Checked = True Then Begin
// Testa se o Emissor é Agencia Bancaria
    If QrySubTipo.State in [dsEdit, dsInsert] Then Begin
      If Not FazQuery(QryAux,'SELECT IDPESSOA FROM AGENCIABANCARIA WHERE IDPESSOA = '+
                              QuotedStr(QrySubTipo.FieldByName('IDEMISSOR').AsString)) Then Begin
        MsgDlg('Emissor deve estar cadastrado como agência bancária',
                'Mensagem do Sistema', mtError, [mbOk, mbHelp], 0);
        ChkdbInstFin.Checked := False;
        Exit;
      End;
    End;
    PnlInstFin.Visible:=True;
  End Else Begin
    PnlInstFin.Visible:=False;
  End;
end;

procedure TfrmCadEmissor.FormCreate(Sender: TObject);
begin
  inherited;
  Saindo := false;
end;

procedure TfrmCadEmissor.bbtnSairClick(Sender: TObject);
begin
  Saindo := true;
  inherited
end;

procedure TfrmCadEmissor.sbtnAlterarClick(Sender: TObject);
begin
  Saindo := true;
  inherited;
  if chkdbInstFin.State  = cbGrayed then
     chkdbInstFin.State := cbUnchecked;

  If qrySubTipo.FieldByName('FLGINSTFIN').AsString <> 'S' Then
  begin
     chkdbInstFin.Checked := false;
     //AL_3
     dblkagenciarisco.Visible := True;
     lblAgenciaRisco.Visible := True;
     LblRating.Visible := True;
     dbedtrating.Visible := True;
  end
  else // Se não for instituição financeira
  begin
     dblkagenciarisco.Visible := False;
     lblAgenciaRisco.Visible := False;
     LblRating.Visible := False;
     dbedtrating.Visible := False;
  end; //Fim AL_3

  Saindo := false;
end;

procedure TfrmCadEmissor.sbtnInserirClick(Sender: TObject);
Var
  wNomeAnt:String;
begin
  Saindo  := True;
  wNomeAnt:= DbedNomeFantasia.Text;
  inherited;
  QrySubtipo.FieldByName('FLGINSTFIN').AsString:='N';
  Qry.FieldByName('NOME').AsString:=wNome;
  wNome := '';
  Saindo := False;
  If qrySubTipo.FieldByName('FLGINSTFIN').AsString <> 'S' Then
  begin
     chkdbInstFin.Checked := false;
     //AL_3
     dblkagenciarisco.Visible := True;
     lblAgenciaRisco.Visible := True;
     LblRating.Visible := True;
     dbedtrating.Visible := True;
  end
  else // Se não for instituição financeira
  begin
     dblkagenciarisco.Visible := False;
     lblAgenciaRisco.Visible := False;
     LblRating.Visible := False;
     dbedtrating.Visible := False;
  end; //Fim AL_3
end;

Procedure TfrmCadEmissor.BuscaEmissor;
Begin
//   inherited;
   // AL_1 - ini
   MontaSelect.CamposChave.Assign(MSEmissor.CamposChave);
   MontaSelect.Caption := MSEmissor.Caption;
   MontaSelect.Colunas.Assign(MSEmissor.Colunas);
   MontaSelect.Descricao.Assign(MSEmissor.Descricao);
   MontaSelect.Filtro.Assign(MSEmissor.Filtro);
   MontaSelect.Larguras.Assign(MSEmissor.Larguras);
   MontaSelect.Mascaras.Assign(MSEmissor.Mascaras);
   MontaSelect.Tabelas.Assign(MSEmissor.Tabelas);
   MontaSelect.TipodeDado.Assign(MSEmissor.TipodeDado);
   MontaSelect.CamposChave.Assign(MSEmissor.CamposChave);
   MontaSelect.CamposChave.Assign(MSEmissor.CamposChave);
   MontaSelect.CamposChave.Assign(MSEmissor.CamposChave);
   MontaSelect.CamposChave.Assign(MSEmissor.CamposChave);

   sbtnProcurar.Tag := 1;
   sbtnProcurar.OnClick(Self);
   sbtnProcurar.Tag := 0;

   pnlInstFin.Visible := (qrySubTipo.FieldByName('FlgInstFin').AsString='S');
   // AL_1 - Fim
End;

procedure TfrmCadEmissor.Emissores1Click(Sender: TObject);
begin
  inherited;

  BuscaEmissor;
  // AL_1
end;

procedure TfrmCadEmissor.AgnciasBancrias1Click(Sender: TObject);
begin
   inherited;
   // Al_1 - Ini

   MontaSelect.CamposChave.Assign(MSAgenciaBancaria.CamposChave);
   MontaSelect.Caption := MSAgenciaBancaria.Caption;
   MontaSelect.Colunas.Assign(MSAgenciaBancaria.Colunas);
   MontaSelect.Descricao.Assign(MSAgenciaBancaria.Descricao);
   MontaSelect.Filtro.Assign(MSAgenciaBancaria.Filtro);
   MontaSelect.Larguras.Assign(MSAgenciaBancaria.Larguras);
   MontaSelect.Mascaras.Assign(MSAgenciaBancaria.Mascaras);
   MontaSelect.Tabelas.Assign(MSAgenciaBancaria.Tabelas);
   MontaSelect.TipodeDado.Assign(MSAgenciaBancaria.TipodeDado);
   MontaSelect.CamposChave.Assign(MSAgenciaBancaria.CamposChave);
   MontaSelect.CamposChave.Assign(MSAgenciaBancaria.CamposChave);
   MontaSelect.CamposChave.Assign(MSAgenciaBancaria.CamposChave);
   MontaSelect.CamposChave.Assign(MSAgenciaBancaria.CamposChave);

   sbtnProcurar.Tag := 1;
   sbtnProcurar.OnClick(Self);
   sbtnProcurar.Tag := 0;

   If MontaSelect.RetornouValor Then
   Begin
      wNome := MontaSelect.ValoresChave[1];
   End;

   // AL_1 - Fim
end;

procedure TfrmCadEmissor.sbtnProcurarClick(Sender: TObject);
begin
  // AL_1
  if sbtnProcurar.Tag = 1 then
  begin
     inherited;
     If qrySubTipo.FieldByName('FLGINSTFIN').AsString <> 'S' Then
     begin
        chkdbInstFin.Checked := false;
        //AL_3
        dblkagenciarisco.Visible := True;
        lblAgenciaRisco.Visible := True;
        LblRating.Visible := True;
        dbedtrating.Visible := True;
     end
     else // Se não for instituição financeira
     begin
        dblkagenciarisco.Visible := False;
        lblAgenciaRisco.Visible := False;
        LblRating.Visible := False;
        dbedtrating.Visible := False;
     end; //Fim AL_3
  end;
end;

procedure TfrmCadEmissor.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  pgctrlDetalhe.ActivePage := tbsDocumento;
  If qrySubTipo.FieldByName('FLGINSTFIN').AsString <> 'S' Then
  begin
     chkdbInstFin.Checked := false;
     //AL_3
     dblkagenciarisco.Visible := True;
     lblAgenciaRisco.Visible := True;
     LblRating.Visible := True;
     dbedtrating.Visible := True;
  end
  else // Se não for instituição financeira
  begin
     dblkagenciarisco.Visible := False;
     lblAgenciaRisco.Visible := False;
     LblRating.Visible := False;
     dbedtrating.Visible := False;
  end; //Fim AL_3
end;

procedure TfrmCadEmissor.FormShow(Sender: TObject);
begin
   // AL_2
   QryTipoCapital.Open;
   QryOrigemCapital.Open;
   QrySetorEmissor.Open;
   qryClassInstFin.Open;

   qrySegmentacao.open;
   inherited;
end;

end.

