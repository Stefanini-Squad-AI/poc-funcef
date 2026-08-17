{--------------------------------------------------------------------------------------------------
Nº SOL......: 246384
Nº PPM.;....: 635854
Data........: 09/04/2015
Responsável.: Petri Nocentini
Descrição...: Alteração de mensagens e correto retorno para telas. Comformidade com especificação
--------------------------------------------------------------------------------------------------
Nº SOL......: 137268-7062
Nº KINTANA..: 1497173
Data........: 11/09/2013
Responsável.: Edilaine Ferraresi
Descrição...: alteração layout e inclusão valorteto
Rotinas.....: .dfm
--------------------------------------------------------------------------------------------------
Nº SOL......: 185805
Nº KINTANA..: 1763461
Data........: 08/01/2013
Responsável.: Thiago Melo
Descrição...: Alteração de layout e inclusão de flags (email de cobrança)
--------------------------------------------------------------------------------------------------
Nº SOL......: 177768
Nº KINTANA..: 1635450
Data........: 19/11/2012
Responsável.: Thiago Melo
Descrição...: Alteração na forma de Registro Individual de Treinamento.
--------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 116914
Nº KINTANA..: 558952
Data........: 04/04/2011
Responsável.: Thaise Amaral Martins
Descrição...: Criação de cadastro para as siglas dos cursos.
--------------------------------------------------------------------------------------------------}

unit FCadSiglas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask,
  DBCtrls, uCtrlCadSiglas, Grids, Wwdbigrd, Wwdbgrid, uCmSqlParams, DBGrids,
  wwdbedit, TREdit, uCMTypes;

type
  TFrmCadSiglas = class(TFrmCadastroMT)
    dbedSigla: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    dbedDescr: TDBEdit;
    CdsAux: TCMClientDataSet;
    ToolbarButton971: TToolbarButton97;
    sbtnRelCurso: TToolbarButton97;
    pnlRelCursos: TPanel;
    Label3: TLabel;
    CdsRelacaoCurso: TCMClientDataSet;
    DsRelacaoCurso: TDataSource;
    CdsRelacaoCursoDESCRICAO: TStringField;
    CdsRelacaoCursoSIGLA: TStringField;
    CdsRelacaoCursoIDCURSO: TFloatField;
    dbgRelCursos: TDBGrid;
    grpFidelizacao: TGroupBox;
    lblTempo: TLabel;
    txtTempo: TwwDBEdit;
    ckbFidelizaSim: TRadioButton;
    ckbFidelizaNao: TRadioButton;
    dbCkbFidelizacao: TDBCheckBox;
    rgrpProjFinal: TDBRadioGroup;
    rgrpProporcionaliza: TDBRadioGroup;
    rgrpEmail: TDBRadioGroup;
    lblMeses: TLabel;
    dbedVlrTeto: TDBRealEdit;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure sbtnRelCursoClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    // Thiago Melo SOL 185805 Kintana 1763461 INI
    procedure ckbFidelizaSimClick(Sender: TObject);
    procedure ckbFidelizaNaoClick(Sender: TObject);
    procedure dbCkbFidelizacaoClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    // Thiago Melo SOL 185805 Kintana 1763461 FIM
  private
    CtrlCadSiglas: TCtrlCadSiglas;

    procedure Sel(IdSiglaCurso: double);
    function  GravarRegistro: boolean;
    procedure EscondeRelCursos(SN: boolean);

  public
    { Public declarations }
  end;

var
  FrmCadSiglas: TFrmCadSiglas;

implementation
uses uMensErro, uCtrlPadroes;
{$R *.DFM}

procedure TFrmCadSiglas.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlCadSiglas := TCtrlCadSiglas.Create;
  CtrlCadSiglas.InitializeAs(Padroes);
  CtrlCadSiglas.Cds := Cds;
  Sel(-1);

  // Thiago Melo SOL 185805 Kintana 1763461 INI
  rgrpProjFinal.ItemIndex := 1;
  rgrpProporcionaliza.ItemIndex := 1;
  rgrpEmail.ItemIndex := 1;
 // Thiago Melo SOL 185805 Kintana 1763461 FIm
end;

function TFrmCadSiglas.GravarRegistro: boolean;
begin
  Result := CtrlCadSiglas.Gravar;
  if not(Result) then
    raise exception.Create(CtrlCadSiglas.MessageInfo);
end;

procedure TFrmCadSiglas.Sel(IdSiglaCurso: double);
begin
  Cds.Data := CtrlCadSiglas.ListGeral(IdSiglaCurso);
end;

procedure TFrmCadSiglas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlCadSiglas);
  inherited;
end;

procedure TFrmCadSiglas.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  Accept := GravarRegistro;
end;

procedure TFrmCadSiglas.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  Accept := GravarRegistro;
end;

procedure TFrmCadSiglas.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TFrmCadSiglas.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[2]));
end;

procedure TFrmCadSiglas.CmeCadastroDelete(Sender: TObject);
begin
  // Thiago Melo SOL 185805 Kintana 1763461 INI
  CdsAux.Data:= CtrlCadSiglas.BuscaSigla(Cds.FieldByName('IDSIGLACURSO').AsFloat);
  if not CdsAux.IsEmpty then
  begin
    MsgDlg('Sigla em utilização!', 'Aviso', mtWarning, [mbOk], 0); // Petri - SOL 246384 / PPM 635854
    Sel(-1);                              // Edilaine - SOL 137268-7062 / KTN 1497173
    CmeCadastro.Operacao := opIdle;       // Edilaine - SOL 137268-7062 / KTN 1497173
    CmeCadastro.AtualizaBotoes(Self);     // Edilaine - SOL 137268-7062 / KTN 1497173
    EscondeRelCursos(TRUE);               // Petri - SOL 246384 / PPM 635854
    Abort;
  end;
  inherited;
  // Thiago Melo SOL 185805 Kintana 1763461 FIM
end;

procedure TFrmCadSiglas.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  CdsAux.Data:= CtrlCadSiglas.BuscaSigla(Cds.FieldByName('IDSIGLACURSO').AsFloat);
  //dbedSigla.Enabled:= CdsAux.IsEmpty;    // Edilaine - SOL 137268-7062 / KTN 1497173
end;

procedure TFrmCadSiglas.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  dbedSigla.Enabled:= True;
end;

procedure TFrmCadSiglas.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  dbedSigla.Enabled:= True;
end;

procedure TFrmCadSiglas.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  dbedSigla.Enabled:= True;
end;

procedure TFrmCadSiglas.sbtnRelCursoClick(Sender: TObject);
begin
  //inherited;
  if not pnlRelCursos.Visible then
    EscondeRelCursos(False)
  else
    EscondeRelCursos(True);
end;

procedure TFrmCadSiglas.EscondeRelCursos(SN: boolean);
begin
  if SN then
  begin
    CdsRelacaoCurso.Close;
    pnlRelCursos.Visible:= False;
    pnlRelCursos.Align:= AlNone;
    pnlFundo.Enabled:= False;
    pnlFundo.Locked:= True;

    // Thiago Melo SOL 185805 Kintana 1763461 INI
    grpFidelizacao.Visible := True;
    rgrpProjFinal.Visible := True;
    rgrpProporcionaliza.Visible := True;
    rgrpEmail.Visible := True;
    // Thiago Melo SOL 185805 Kintana 1763461 FIM
  end
  else
  begin
    CdsRelacaoCurso.Close;
    CdsRelacaoCurso.Data:= CtrlCadSiglas.BuscarRelacaoCursos(Cds.FieldByName('IDSIGLACURSO').AsInteger);
    CdsRelacaoCurso.Open;
    pnlRelCursos.Visible:= True;
    pnlRelCursos.Align:= alClient;
    pnlFundo.Enabled:= True;
    pnlFundo.Locked:= False;

    // Thiago Melo SOL 185805 Kintana 1763461 INI
    grpFidelizacao.Visible := False;
    rgrpProjFinal.Visible := False;
    rgrpProporcionaliza.Visible := False;
    rgrpEmail.Visible := False;
    // Thiago Melo SOL 185805 Kintana 1763461 FIM
  end;
end;

procedure TFrmCadSiglas.sbtnInserirClick(Sender: TObject);
begin
  if pnlRelCursos.Visible then
    EscondeRelCursos(True);
  inherited;
end;

procedure TFrmCadSiglas.sbtnProcurarClick(Sender: TObject);
begin
  if pnlRelCursos.Visible then
    EscondeRelCursos(True);
  inherited;
end;

procedure TFrmCadSiglas.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
//  sbtnRelCurso.Enabled:= ds.DataSet.State = dsBrowse;

  inherited;

  sbtnRelCurso.Enabled:= sbtnApagar.Enabled;
end;

procedure TFrmCadSiglas.bbtnConfirmarClick(Sender: TObject);
begin
  if (ds.DataSet.State = dsInsert) and (CtrlCadSiglas.PossuiSigla(Cds.FieldByName('SIGLA').AsString)) then
  begin
  // Thiago Melo SOL 185805 Kintana 1763461 INI
//    MsgDlg('Sigla já cadastrada!', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    MsgDlg('Sigla já cadastrada!', 'Aviso', mtWarning, [mbOk], 0);
  // Thiago Melo SOL 185805 Kintana 1763461 FIM
    dbedSigla.SetFocus;
    Abort;
  end;

  if Trim(Cds.FieldByName('SIGLA').AsString) = '' then
  begin
  // Thiago Melo SOL 185805 Kintana 1763461 INI
//    MsgDlg('Informe a Sigla!', 'Aviso', mtWarning, [mbOk, mbHelp], 0);

    MsgDlg('Informe a Sigla!', 'Aviso', mtWarning, [mbOk], 0);
  // Thiago Melo SOL 185805 Kintana 1763461 FIM
    dbedSigla.SetFocus;
    Abort;
  end;

  // Thiago Melo SOL 185805 Kintana 1763461 INI
  if txtTempo.Visible then begin
    if Trim(Cds.FieldByName('TEMPO').AsString) = '' then
    begin
      MsgDlg('Informe o Tempo!', 'Aviso', mtWarning, [mbOk], 0); // Petri - SOL 246384 / PPM 635854
      txtTempo.SetFocus;
      Abort;
    end;
  end;
  // Thiago Melo SOL 185805 Kintana 1763461 FIM  

  inherited;
  // Petri - SOL 246384 / PPM 635854 inicio
  if cds.Active then
     CmeCadastro.Cancel(self);
  if cds.IsEmpty then
     CmeCadastro.Operacao := opVazio
  else
      CmeCadastro.Operacao := opIdle;
  rgrpProjFinal.ItemIndex := 1;
  rgrpProporcionaliza.ItemIndex := 1;
  rgrpEmail.ItemIndex := 1;
  //  Petri - SOL 246384 / PPM 635854 fim

  CmeCadastro.AtualizaBotoes(Self);

end;

procedure TFrmCadSiglas.sbtnAlterarClick(Sender: TObject);
begin
  if pnlRelCursos.Visible then
    EscondeRelCursos(True);
  inherited;
end;

procedure TFrmCadSiglas.ckbFidelizaSimClick(Sender: TObject);
begin
  inherited;
  if ckbFidelizaSim.Checked then begin
    ckbFidelizaNao.Checked   := False;
    dbCkbFidelizacao.Checked := True;
    if Cds.State in [DsInsert, DsEdit] then begin
      Cds.FieldByName('flgfideliza').AsString := '1';
    end;
  end
  else begin
    ckbFidelizaNao.Checked   := True;
    dbCkbFidelizacao.Checked := False;
    if Cds.State in [DsInsert, DsEdit] then begin
      Cds.FieldByName('flgfideliza').AsString := '0';
    end;
  end;
end;

procedure TFrmCadSiglas.ckbFidelizaNaoClick(Sender: TObject);
begin
  inherited;
  if ckbFidelizaNao.Checked then begin
    ckbFidelizaSim.Checked   := False;
    dbCkbFidelizacao.Checked := False;
    if Cds.State = DsEdit then begin
      Cds.FieldByName('flgfideliza').AsString := '0';
    end;
  end
  else begin
    ckbFidelizaSim.Checked   := True;
    dbCkbFidelizacao.Checked := True;
    if Cds.State = DsEdit then begin
      Cds.FieldByName('flgfideliza').AsString := '1';
    end;
  end;
end;

procedure TFrmCadSiglas.dbCkbFidelizacaoClick(Sender: TObject);
begin
  inherited;
  if dbCkbFidelizacao.Checked then begin
    lblTempo.Visible := True;
    lblMeses.Visible := True;
    txtTempo.Visible := True;
    if Cds.State = DsBrowse then begin
      ckbFidelizaSim.Checked := True;
    end;
  end
  else begin
    lblTempo.Visible := False;
    lblMeses.Visible := False;
    txtTempo.Visible := False;
     if Cds.State = DsBrowse then begin
      ckbFidelizaNao.Checked := True;
    end;
  end;
end;

procedure TFrmCadSiglas.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  // Thiago Melo SOL 185805 Kintana 1763461 INI
  rgrpProjFinal.ItemIndex := 1;
  rgrpProporcionaliza.ItemIndex := 1;
  rgrpEmail.ItemIndex := 1;
 // Thiago Melo SOL 185805 Kintana 1763461 FIM
end;

procedure TFrmCadSiglas.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  // Thiago Melo SOL 185805 Kintana 1763461 INI
  rgrpProjFinal.ItemIndex := 1;
  rgrpProporcionaliza.ItemIndex := 1;
  rgrpEmail.ItemIndex := 1;
 // Thiago Melo SOL 185805 Kintana 1763461 FIM
end;


procedure TFrmCadSiglas.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  if (CmeCadastro.Operacao <> opApagar) then
  begin
     Sel(-1);
     CmeCadastro.AtualizaBotoes(Self);
     // Petri - SOL 246384 / PPM 635854 inicio
     EscondeRelCursos(TRUE);
     rgrpProjFinal.ItemIndex := 1;
     rgrpProporcionaliza.ItemIndex := 1;
     rgrpEmail.ItemIndex := 1;
     // Petri - SOL 246384 / PPM 635854 fim
  end;
end;

end.
