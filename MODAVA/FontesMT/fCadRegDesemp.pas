unit fCadRegDesemp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  FCadastroMestreDetMT, MontaSelect, DBTables, Db, Wwdatsrc, TB97Ctls, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  Mask, DBCtrls, wwdbdatetimepicker, CMDateTimePicker, wwdblook, CmEventosCadastro, ImgList,
  DBClient, uCMClientDataSet, TREdit, uCtrlTipAval, uCtrlFatorAval,
  uCtrlPesoFatGrp, uCtrlPessoaFuncionario, uCtrlRegAval, uCtrlRegDesemp, uCtrlGlobalRH,
  TB97Tlwn, IvEMulti, uCmSqlParams;

type
  TfrmCadRegDesemp = class(TFrmCadastroMestreDetMT)
    Label1: TLabel;
    dbedMatricula: TDBEdit;
    Label10: TLabel;
    dbedNome: TDBEdit;
    tbshFortes: TTabSheet;
    tbshMetas: TTabSheet;
    tbshResumo: TTabSheet;
    tbshGerais: TTabSheet;
    Label9: TLabel;
    dbrcedFortes: TDBRichEdit;
    Label11: TLabel;
    dbrcedFracos: TDBRichEdit;
    Label12: TLabel;
    dbrcedLimites: TDBRichEdit;
    Label16: TLabel;
    Label17: TLabel;
    Label13: TLabel;
    dbrcedResumo: TDBRichEdit;
    Label15: TLabel;
    dbrcedObs1: TDBRichEdit;
    Label14: TLabel;
    dbrcedObs2: TDBRichEdit;
    Label6: TLabel;
    dblckFator: TwwDBLookupCombo;
    Label7: TLabel;
    Label18: TLabel;
    dbedPeso: TDBEdit;
    Label19: TLabel;
    dbedNota: TDBEdit;
    MontaSelectFunc: TMontaSelect;
    CdsDet: TCMClientDataSet;
    CdsTipoAval: TCMClientDataSet;
    CdsFator: TCMClientDataSet;
    gbxAvaliador: TGroupBox;
    dbedAvaliador: TDBEdit;
    bbtnBuscarEmpregado: TBitBtn;
    Label2: TLabel;
    dblckTipoEntr: TwwDBLookupCombo;
    Label3: TLabel;
    dbedDatPlan: TCMDateTimePicker;
    Label4: TLabel;
    dbedDatReal: TCMDateTimePicker;
    Label5: TLabel;
    dbedAvaliacao: TDBEdit;
    rdbedGrau: TDBRealEdit;
    MontaSelectAvaliador: TMontaSelect;
    spbtnRegIndivPessoa: TSpeedButton;
    dbrcedMedidas: TDBRichEdit;
    dbrcedMetas: TDBRichEdit;
    bbtnDica: TBitBtn;
    dsFator: TwwDataSource;
    townDica: TToolWindow97;
    btnFecharDica: TBitBtn;
    dbmemOBS: TDBMemo;
    CMSqldet: TCMSqlParams;
    CdsDetGRAU: TFloatField;
    CdsDetDESCRFATORAVAL: TStringField;
    CdsDetPESO: TFloatField;
    CdsDetNOTA: TFloatField;
    CdsDetIDPESSOA: TFloatField;
    CdsDetCODTIPOAVAL: TFloatField;
    CdsDetIDFATORAVAL: TFloatField;
    CdsDetNUMSEQ: TFloatField;
    CdsDetOBSFATORAVAL: TMemoField;
    Btndica2: TBitBtn;
    procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnBuscarEmpregadoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblckTipoEntrChange(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure dsStateChange(Sender: TObject);
    procedure rdbedGrauChange(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure spbtnRegIndivPessoaClick(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure bbtnDicaClick(Sender: TObject);
    procedure btnFecharDicaClick(Sender: TObject);
    procedure CdsDetGRAUChange(Sender: TField);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure tbsDetShow(Sender: TObject);
  private
    CtrlTipAval: TCtrlTipAval;
    CtrlFatorAval: TCtrlFatorAval;
    CtrlRegAval: TCtrlRegAval;
    CtrlRegDesemp: TCtrlRegDesemp;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlPesoFatGrp: TCtrlPesoFatGrp;
    CtrlGlobalRH: TCtrlGlobalRH;

    dIdPessoa: double;
    iOldPageIndex, FlgFiltraFator: integer;
    sUsoGeralIdPessoaAux, sCodGrp: string;
    bInserindo: boolean;

    procedure Sel(IdPessoa: double; CodTipoAval, NumSeq: integer);
    function  GravarRegistro(Exclusao: boolean = false): boolean;
  end;

var
  frmCadRegDesemp: TfrmCadRegDesemp;              

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH, fCadRegTrein, dCds;

const
  // Constantes que são concatenadas durante o processamento de uma função. Usadas desta
  // forma para a melhor tradução pelo padrão.
  MSG_AVISO_TIP_AVAL = 'Você deve selecionar um Tipo de Avaliação antes :1 de Manipular os Fatores e Pontos.';

{$R *.DFM}

procedure TfrmCadRegDesemp.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTipAval := TCtrlTipAval.Create;
  CtrlTipAval.InitializeAs(Padroes);

  CtrlFatorAval := TCtrlFatorAval.Create;
  CtrlFatorAval.InitializeAs(Padroes);

  CtrlRegAval := TCtrlRegAval.Create;
  CtrlRegAval.InitializeAs(Padroes);

  CtrlRegDesemp := TCtrlRegDesemp.Create;
  CtrlRegDesemp.InitializeAs(Padroes);
  CtrlRegDesemp.CdsHstAval := Cds;
  CtrlRegDesemp.CdsHstDesemp := CdsDet;

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlPesoFatGrp := TCtrlPesoFatGrp.Create;
  CtrlPesoFatGrp.InitializeAs(Padroes);

  CdsTipoAval.Data := CtrlTipAval.ListTipoAval(0, '0,1');
  CdsFator.Data := CtrlFatorAval.ListFatorAval(0, '0,1');

  sUsoGeralIdPessoaAux := CtrlUsoGeralRH.IdUsuarioGeral;
  CtrlUsoGeralRH.IdUsuarioGeral := '';

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('FLGFILTRAFATOR');
  FlgFiltraFator := dmCds.Cds.FieldByName('FLGFILTRAFATOR').asInteger;

  Sel(-1, -1, -1);

  if (CtrlUsoGeralRH.UsuXCCusto <> '') then
  begin
    MontaSelect.Filtro.Add('FUNCIONARIO.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto);
    MontaSelectFunc.Filtro.Add('FUNCIONARIO.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto);
  end;

  if (CtrlUsoGeralRH.UsuXFilial <> '') then
  begin
    MontaSelect.Filtro.Add('FUNCIONARIO.IDESTAB IN ' +CtrlUsoGeralRH.UsuXFilial);
    MontaSelectFunc.Filtro.Add('FUNCIONARIO.IDESTAB IN ' +CtrlUsoGeralRH.UsuXFilial);
  end;

  iOldPageIndex := 0;
  bInserindo := false;
  pgctrlDetalhe.ActivePageIndex := 0;
end;

procedure TfrmCadRegDesemp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlTipAval);
  FreeAndNil(CtrlFatorAval);
  FreeAndNil(CtrlRegAval);
  FreeAndNil(CtrlRegDesemp);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlPesoFatGrp);
  FreeAndNil(CtrlGlobalRH);
  CtrlUsoGeralRH.IdUsuarioGeral := sUsoGeralIdPessoaAux;
  inherited;
end;

procedure TfrmCadRegDesemp.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
  begin
    bInserindo := false;
    Sel(StrToFloat(MontaSelect.ValoresChave[0]), StrToInt(MontaSelect.ValoresChave[1]),
      StrToInt(MontaSelect.ValoresChave[2]));
  end;
end;

procedure TfrmCadRegDesemp.CmeDetalheInsert(Sender: TObject);
begin
  inherited;

  CdsDet.FieldByName('IDPESSOA').asFloat := dIdPessoa;
  CdsDet.FieldByName('NUMSEQ').asInteger := Cds.FieldByName('NUMSEQ').asInteger;
  CdsDet.FieldByName('PESO').asFloat := 0;
  CdsDet.FieldByName('NOTA').asFloat := 0;
end;

procedure TfrmCadRegDesemp.CmeCadastroDelete(Sender: TObject);
begin
  CdsDet.First;
  while not(CdsDet.EOF) do
    CdsDet.Delete;
  inherited;
end;

procedure TfrmCadRegDesemp.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadRegDesemp.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadRegDesemp.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadRegDesemp.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(true);
end;

procedure TfrmCadRegDesemp.dsStateChange(Sender: TObject);
begin
  inherited;
  spbtnRegIndivPessoa.Enabled := (Cds.State in [dsInsert,dsEdit]);
  if (CdsDet.State in [dsInsert,dsEdit]) and (dbedAvaliador.CanFocus) then
    dbedAvaliador.SetFocus;
end;

procedure TfrmCadRegDesemp.dsDetStateChange(Sender: TObject);
begin
  inherited;
  // if (CdsDet.State in [dsInsert,dsEdit]) and (dblckFator.CanFocus) then
  //    dblckFator.SetFocus;
end;

procedure TfrmCadRegDesemp.tbcDetalheChange(Sender: TObject);
begin
  inherited;
  
  if (Trim(dblckTipoEntr.Text) = '') and (pgctrlDetalhe.ActivePageIndex = 1) then
  begin
    Dock973.Visible := false;
    tbcDetalhe.TabIndex := iOldPageIndex;
    pgctrlDetalhe.ActivePageIndex := iOldPageIndex;
    MsgDlg(FU.CMTranslateMsg(MSG_AVISO_TIP_AVAL, [CR_LF]),
           FU.CMTranslate('Aviso'), mtInformation, [mbOk,mbHelp], 0);
  end
  else
  begin
    Dock973.Visible := (pgctrlDetalhe.ActivePageIndex = 1);
    iOldPageIndex := pgctrlDetalhe.ActivePageIndex;
  end;
  if (sbtnInserir.Down) and (dIdPessoa <> -1) and (CdsDet.RecordCount = 0) and
     (pgctrlDetalhe.ActivePageIndex = 1) then
  begin
    if (FlgFiltraFator = 1) and (sCodGrp <> '') then
      CdsFator.Data := CtrlFatorAval.ListFatorAvalFiltrado(0, '0,1', sCodGrp);
    CdsFator.First;
    while not CdsFator.Eof do
    begin
      CdsDet.Append;
      CdsDet.FieldByName('IDPESSOA').asFloat := dIdPessoa;
      CdsDet.FieldByName('NUMSEQ').asInteger := Cds.FieldByName('NUMSEQ').asInteger;
      CdsDet.FieldByName('CODTIPOAVAL').asInteger := CdsTipoAval.FieldByName('CODTIPOAVAL').asInteger;
      CdsDet.FieldByName('IDFATORAVAL').asInteger := CdsFator.FieldByName('IDFATORAVAL').asInteger;
      CdsDet.FieldByName('DESCRFATORAVAL').asString := CdsFator.FieldByName('DESCRFATORAVAL').asString;
      CdsDet.Post;
      CdsFator.Next;
    end;
    CdsFator.First;
    CdsDet.First;
    sbtnAltDet.Enabled := true;
    sbtnExcluiDet.Enabled := true;
  end;
end;

procedure TfrmCadRegDesemp.dblckTipoEntrChange(Sender: TObject);
begin
  if (Cds.State = dsInsert) then
    Cds.FieldByName('NUMSEQ').asInteger := CtrlRegAval.GetProxNumSeqPessoa(dIdPessoa,
      CdsTipoAval.FieldByName('CODTIPOAVAL').asInteger);
end;

procedure TfrmCadRegDesemp.rdbedGrauChange(Sender: TObject);
var
  IdFator: integer;
begin
  if (CdsDet.State in [dsInsert, dsEdit]) then
  begin
    IdFator := CdsFator.FieldByName('IDFATORAVAL').asInteger;
    if sCodGrp <> '' then
    begin
      dmCds.Cds.Data := CtrlPesoFatGrp.ListPeso(IdFator, sCodGrp);
      CdsDet.FieldByName('PESO').asFloat := dmCds.Cds.FieldByName('PESO').asFloat;
    end
    else
      CdsDet.FieldByName('PESO').asFloat := 0;
      
    CdsDet.FieldByName('NOTA').asFloat := Round(CdsDet.FieldByName('PESO').asFloat *
      StrToIntDef(rdbedGrau.Text, 0));
  end;
end;

procedure TfrmCadRegDesemp.sbtnInserirClick(Sender: TObject);
begin
  dsDet.AutoEdit :=true;
  MontaSelectFunc.Executar;
  if (MontaSelectFunc.RetornouValor) then
  begin
    Dock973.Visible := false;
    tbcDetalhe.TabIndex := 0;
    pgctrlDetalhe.ActivePageIndex := 0;
    iOldPageIndex := 0;

    Sel(-1, -1, -1);
    dIdPessoa := StrToFloat(MontaSelectFunc.ValoresChave[1]);

    inherited;
    Cds.FieldByName('MATRICULA').asString := MontaSelectFunc.ValoresChave[2];
    Cds.FieldByName('NOME').asString := MontaSelectFunc.ValoresChave[0];
    Cds.FieldByName('IDPESSOA').asFloat := dIdPessoa;
    Cds.FieldByName('AVALIADOR').asString := Sistema.NomeUsuario;
    Cds.FieldByName('CODGRPFUNC').asString := MontaSelectFunc.ValoresChave[3];
    sCodGrp := MontaSelectFunc.ValoresChave[3];
  end
  else
  begin
    if (bInserindo) then
      bbtnCancelarClick(Sender);

    sbtnInserir.Down := false;
  end;
end;

procedure TfrmCadRegDesemp.bbtnBuscarEmpregadoClick(Sender: TObject);
begin
  if (Cds.State in [dsInsert, dsEdit]) then
  begin
    MontaSelectAvaliador.Executar;
    if (MontaSelectAvaliador.RetornouValor) then
      dbedAvaliador.Text := MontaSelectAvaliador.ValoresChave[0];
  end;
end;

procedure TfrmCadRegDesemp.spbtnRegIndivPessoaClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadRegTrein, frmCadRegTrein);
  with (frmCadRegTrein) do
  begin
    Top := 10;
    MontaSelect := MontaSelectFunc;
    bEmpregado := true;
    IdPessoa := dIdPessoa;
    Sel(true);

    sbtnAlterar.Enabled := true;
    sbtnProcurar.Visible := false;
    sbtnProcurarCand.Visible := false;
  end;
end;

procedure TfrmCadRegDesemp.bbtnOkDetClick(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert, dsEdit]) then
  begin
  CdsDet.FieldByName('DESCRFATORAVAL').asString := dblckFator.Text;
  CdsDet.FieldByName('CODTIPOAVAL').asInteger := Cds.FieldByName('CODTIPOAVAL').asInteger;
    end;
  inherited;
end;

procedure TfrmCadRegDesemp.bbtnConfirmarClick(Sender: TObject);
var
  iTotAval: integer;
begin
  if (Trim(dblckTipoEntr.Text) = '') then
    MsgDlg(FU.CMTranslate('Indique o Tipo de Avaliação.'),
      FU.CMTranslate('Aviso'), mtInformation, [mbOk,mbHelp], 0)
  else
  begin
    iTotAval := 0;

    CdsDet.DisableControls;
    CdsDet.First;
    while not(CdsDet.EOF) do
    begin
      iTotAval := iTotAval + CdsDet.FieldByName('NOTA').asInteger;
      CdsDet.Next;
    end;
    CdsDet.First;
    CdsDet.EnableControls;

    Cds.FieldByName('AVALIACAO').asInteger := iTotAval;

    bInserindo := (Cds.State = dsInsert);
    inherited;
    if not(bInserindo) then
      CmeCadastroFind(Sender);
  end;
  dsDet.AutoEdit :=false;
end;

procedure TfrmCadRegDesemp.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  dsDet.AutoEdit :=false;
  bInserindo := false;
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmCadRegDesemp.Sel(IdPessoa: double; CodTipoAval, NumSeq: integer);
begin
  Cds.Data := CtrlRegAval.ListPessoaHistAval(IdPessoa, CodTipoAval, NumSeq);

  sCodGrp := Cds.FieldByName('CODGRPFUNC').asString;
  if (FlgFiltraFator = 1) and (sCodGrp <> '') then
    CdsFator.Data := CtrlFatorAval.ListFatorAvalFiltrado(0, '0,1', sCodGrp);
  dIdPessoa := Cds.FieldByName('IDPESSOA').asFloat;

  CdsDet.Data := CtrlRegDesemp.ListRegDesemp(IdPessoa, CodTipoAval, NumSeq, sCodGrp);
end;

function TfrmCadRegDesemp.GravarRegistro(Exclusao: boolean): boolean;
begin
  if (Exclusao) then
    Result := CtrlRegDesemp.ExcluirRegDesemp
  else
    Result := CtrlRegDesemp.GravarRegDesemp;
    
  if not(Result) then
    MsgDlg(CtrlRegDesemp.MessageInfo, FU.CMTranslate('Erro'), mtError, [mbOk,mbHelp], 0);
end;

procedure TfrmCadRegDesemp.bbtnDicaClick(Sender: TObject);
begin
  inherited;
  townDica.Top := 100;
  townDica.BringToFront;
  townDica.Visible := true;
  Self.Enabled := false;
end;

procedure TfrmCadRegDesemp.btnFecharDicaClick(Sender: TObject);
begin
  inherited;
  Self.Enabled := true;
  townDica.Visible := false;
end;

procedure TfrmCadRegDesemp.CdsDetGRAUChange(Sender: TField);
begin
  inherited;
  // dbgrddet.SetFocus;
  cdsdet.edit;
  
end;

procedure TfrmCadRegDesemp.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
   if (CdsDet.State in [dsInsert,dsEdit]) and (dblckFator.CanFocus) then
      dblckFator.SetFocus;
end;

procedure TfrmCadRegDesemp.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  BtnDica2.Visible := False;
   if (CdsDet.State in [dsInsert,dsEdit]) and (dblckFator.CanFocus) then
      dblckFator.SetFocus;
end;

procedure TfrmCadRegDesemp.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  dsDet.AutoEdit :=true;
end;

procedure TfrmCadRegDesemp.tbsDetShow(Sender: TObject);
begin
  inherited;
  BtnDica2.Visible := True;
end;

end.
