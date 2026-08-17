unit fAdvogXProcJur;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda, TB97,
  TB97Tlbr, Grids, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Db,
  Wwdbigrd, Wwdbgrid, wwdblook, Wwdatsrc, DBTables, DBClient, uCMClientDataSet, TB97Ctls,
  MontaSelect, uCtrlTransfProcAdvog, TB97Tlwn, uCtrlListTerceirosRH;

type
  TfrmAdvogXProcJur = class(TfrmSairAjuda)
    dsProcAdvog1: TwwDataSource;
    dsProcAdv2: TwwDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    grdAdv1: TwwDBGrid;
    Panel2: TPanel;
    grdAdv2: TwwDBGrid;
    sbtnAdicionarTudo: TSpeedButton;
    sbtnAdicionar: TSpeedButton;
    sbtnRemover: TSpeedButton;
    sbtnRemoverTudo: TSpeedButton;
    CdsProcAdv1: TCMClientDataSet;
    CdsProcAdv2: TCMClientDataSet;
    EdAdv1: TEdit;
    EdAdv2: TEdit;
    sbtnProcurarAdvogado1: TToolbarButton97;
    sbtnProcurarAdvogado2: TToolbarButton97;
    MontaSelect1: TMontaSelect;
    MontaSelect2: TMontaSelect;
    cbxSelUFCidade: TCheckBox;
    CdsUF: TCMClientDataSet;
    CdsCidade: TCMClientDataSet;
    townUFCidade: TToolWindow97;
    bbtnFecharMB: TBitBtn;
    rgUF: TRadioGroup;
    gbxUF: TGroupBox;
    dblcUF: TwwDBLookupCombo;
    lstUF: TListBox;
    lstCodUF: TListBox;
    lstSiglaUF: TListBox;
    rgCidade: TRadioGroup;
    gbxCidade: TGroupBox;
    dblcCidade: TwwDBLookupCombo;
    lstCidade: TListBox;
    lstCodCidade: TListBox;
    cbxCidadeNegativa: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure sbtnAdicionarClick(Sender: TObject);
    procedure sbtnRemoverClick(Sender: TObject);
    procedure sbtnAdicionarTudoClick(Sender: TObject);
    procedure sbtnRemoverTudoClick(Sender: TObject);
    procedure sbtnProcurarAdvogado1Click(Sender: TObject);
    procedure sbtnProcurarAdvogado2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgUFClick(Sender: TObject);
    procedure dblcUFCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure lstUFKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbxSelUFCidadeClick(Sender: TObject);
    procedure bbtnFecharMBClick(Sender: TObject);
  private
    CtrlTransfProcAdvog: TCtrlTransfProcAdvog;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    iIndiceAnt: integer;
    sListaIdUFSel, sListaIdCidadesSel: string;
    procedure SelAdvogado1;
    procedure SelAdvogado2;
    function  VerificarAdvogadosSel: boolean;
    procedure HabilitarBotoes;
    procedure HabilitarLista(RadioGroup: TRadioGroup; GroupBox: TGroupBox;
      Cds: TCMClientDataSet);
    procedure MudouEstado;
    function  GerarListaItens(RadioGroup: TRadioGroup; ListaCod, ListaDesc: TListBox): string;
    procedure InserirLista(Modificado: boolean; ListaCod, ListaDesc: TListBox;
      Cds: TCMClientDataSet; CampoCod, CampoDesc: string);
    procedure ApagarLista(Key: word; ListaCod, ListaDesc: TListBox);
    function  GerarParamSELECT(RadioGroup: TRadioGroup; ListaCod, ListaDesc: TListBox): string;
  end;

var
  frmAdvogXProcJur: TfrmAdvogXProcJur;

implementation

uses uMensErro, uCtrlPadroes, uSistema, uCtrlFuncoesRH, uCMTypes, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmAdvogXProcJur.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);
  CtrlTransfProcAdvog := TCtrlTransfProcAdvog.Create;
  CtrlTransfProcAdvog.InitializeAs(Padroes);
  CtrlTransfProcAdvog.CdsProcAdv1 := CdsProcAdv1;
  CtrlTransfProcAdvog.CdsProcAdv2 := CdsProcAdv2;
  CdsUF.Data := CtrlListTerceirosRH.ListEstado;
  CdsCidade.Data := CtrlListTerceirosRH.ListCidadeNasc(0, '', '');
  HabilitarBotoes;

  case (Sistema.IdModulo) of
    MODCON            : HelpContext := 760003;
    PROCJUD, PROCPREV : HelpContext := 1100026;
    SISTJURCONS : HelpContext := 7190003;
  end;
end;

procedure TfrmAdvogXProcJur.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlTransfProcAdvog);
  FreeAndNil(CtrlListTerceirosRH);
  inherited;
end;

procedure TfrmAdvogXProcJur.sbtnProcurarAdvogado1Click(Sender: TObject);
begin
  MontaSelect1.Executar;
  sbtnProcurarAdvogado1.Down := false;

  if (MontaSelect1.RetornouValor) then
  begin
    EdAdv1.Text := MontaSelect1.ValoresChave[1];
    SelAdvogado1;
  end;
end;

procedure TfrmAdvogXProcJur.sbtnProcurarAdvogado2Click(Sender: TObject);
begin
  MontaSelect2.Executar;
  sbtnProcurarAdvogado2.Down := false;

  if (MontaSelect2.RetornouValor) then
  begin
    EdAdv2.Text := MontaSelect2.ValoresChave[1];
    SelAdvogado2;
  end;
end;

procedure TfrmAdvogXProcJur.sbtnAdicionarClick(Sender: TObject);
begin
  if (VerificarAdvogadosSel) then
  begin
    CdsProcAdv1.Edit;
    CdsProcAdv1.FieldByName('IDADVOGRECDA').asFloat := StrToFloat(MontaSelect2.ValoresChave[0]);
    CdsProcAdv1.Post;
    if (TComponent(Sender).Name = 'sbtnAdicionar') then
    begin
      CtrlTransfProcAdvog.GravarProcAdv1;
      SelAdvogado1;
      SelAdvogado2;
    end;
  end;
end;

procedure TfrmAdvogXProcJur.sbtnAdicionarTudoClick(Sender: TObject);
begin
  if (VerificarAdvogadosSel) then
  begin
    CdsProcAdv1.DisableControls;
    CdsProcAdv1.First;

    while not(CdsProcAdv1.EOF) do
    begin
      sbtnAdicionarClick(Sender);
      CdsProcAdv1.Next;
    end;  

    CtrlTransfProcAdvog.GravarProcAdv1;
    SelAdvogado1;
    SelAdvogado2;
    CdsProcAdv1.EnableControls;
  end;
end;

procedure TfrmAdvogXProcJur.sbtnRemoverClick(Sender: TObject);
begin
  if (VerificarAdvogadosSel) then
  begin
    CdsProcAdv2.Edit;
    CdsProcAdv2.FieldByName('IDADVOGRECDA').asFloat := StrToFloat(MontaSelect1.ValoresChave[0]);
    CdsProcAdv2.Post;
    if (TComponent(Sender).Name = 'sbtnRemover') then
    begin
      CtrlTransfProcAdvog.GravarProcAdv2;
      SelAdvogado1;
      SelAdvogado2;
    end;
  end;
end;

procedure TfrmAdvogXProcJur.sbtnRemoverTudoClick(Sender: TObject);
begin
  if (VerificarAdvogadosSel) then
  begin
    CdsProcAdv2.DisableControls;
    CdsProcAdv2.First;

    while not(CdsProcAdv2.EOF) do
    begin
      sbtnRemoverClick(Sender);
      CdsProcAdv2.Next;
    end;

    CtrlTransfProcAdvog.GravarProcAdv2;
    SelAdvogado1;
    SelAdvogado2;
    CdsProcAdv2.EnableControls;
  end;
end;

function TfrmAdvogXProcJur.VerificarAdvogadosSel: boolean;
begin
  if (Trim(EdAdv1.Text) = '') or (Trim(EdAdv2.Text) = '') then
  begin
    MsgDlg('Ambos advogados devem estar selecionados.', 'Atenção', mtWarning, [mbOk, mbHelp], 0);
    Result := false;
  end
  else
    Result := true;
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmAdvogXProcJur.HabilitarBotoes;
begin
  sbtnAdicionar.Enabled := (CdsProcAdv1.Active) and (CdsProcAdv1.RecordCount > 0);
  sbtnAdicionarTudo.Enabled := (CdsProcAdv1.Active) and (CdsProcAdv1.RecordCount > 0);
  sbtnRemover.Enabled := (CdsProcAdv2.Active) and (CdsProcAdv2.RecordCount > 0);
  sbtnRemoverTudo.Enabled := (CdsProcAdv2.Active) and (CdsProcAdv2.RecordCount > 0);
end;

procedure TfrmAdvogXProcJur.SelAdvogado1;
begin
  CdsProcAdv1.Data := CtrlTransfProcAdvog.ListProcAdvogado(
    StrToFloat(MontaSelect1.ValoresChave[0]), sListaIdUFSel, sListaIdCidadesSel, cbxCidadeNegativa.Checked);
  HabilitarBotoes;
end;

procedure TfrmAdvogXProcJur.SelAdvogado2;
begin
  CdsProcAdv2.Data := CtrlTransfProcAdvog.ListProcAdvogado(
    StrToFloat(MontaSelect2.ValoresChave[0]),'','');
  HabilitarBotoes;
end;

procedure TfrmAdvogXProcJur.rgUFClick(Sender: TObject);
begin
  inherited;
  if (Sender = rgUF) then
  begin
    HabilitarLista(rgUF, gbxUF, CdsUF);
    MudouEstado;
  end
  else
  if (Sender = rgCidade) then
    HabilitarLista(rgCidade, gbxCidade, CdsCidade);
end;

procedure TfrmAdvogXProcJur.HabilitarLista(RadioGroup: TRadioGroup; GroupBox: TGroupBox;
  Cds: TCMClientDataSet);
begin
  if (Cds.IsEmpty) then
    RadioGroup.ItemIndex := 0;
  GroupBox.Visible := (RadioGroup.ItemIndex > 0);
end;

procedure TfrmAdvogXProcJur.MudouEstado;
begin
  CdsCidade.Data := CtrlListTerceirosRH.ListCidadeNasc(0,
    GerarListaItens(rgUF, lstSiglaUF, lstUF));
end;

function TfrmAdvogXProcJur.GerarListaItens(RadioGroup: TRadioGroup;
  ListaCod, ListaDesc: TListBox): string;
var
  c: integer;
begin
  Result := '';
  if (RadioGroup.ItemIndex * ListaDesc.Items.Count > 0) then
  begin
    for c:=0 to ListaDesc.Items.Count-1 do
    begin
      if (ListaDesc.Items[c] = '') then
        break;

      if (Result = '') then
        Result := Result + ListaCod.Items[c]
      else
        Result := Result +','+ ListaCod.Items[c];
    end;
  end;
end;

procedure TfrmAdvogXProcJur.dblcUFCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if (Sender = dblcUF) and (Modified) then
  begin
    InserirLista(Modified, lstCodUF, lstUF, CdsUF, 'IDESTADO', 'NOMEESTADO');
    lstSiglaUF.Items.Add(CdsUF.FieldByName('CODESTADO').asString);
    MudouEstado;
  end
  else
  if (Sender = dblcCidade) then
    InserirLista(Modified, lstCodCidade, lstCidade, CdsCidade, 'IDCIDADES', 'NOME');
end;

procedure TfrmAdvogXProcJur.InserirLista(Modificado: boolean; ListaCod, ListaDesc: TListBox;
  Cds: TCMClientDataSet; CampoCod, CampoDesc: string);
begin
  if (Modificado) then
  begin
    ListaCod.Items.Add(Cds.FieldByName(CampoCod).asString);
    ListaDesc.Items.Add(Cds.FieldByName(CampoDesc).asString);
  end;
end;

procedure TfrmAdvogXProcJur.lstUFKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Sender = lstUF) and (Key = VK_DELETE) and (lstUF.Items.Count > 0) then
  begin
    ApagarLista(Key, lstCodUF, lstUF);
    lstSiglaUF.Items.Delete(iIndiceAnt);
    MudouEstado;
  end
  else
  if (Sender = lstCidade) then
    ApagarLista(Key, lstCodCidade, lstCidade);
end;

procedure TfrmAdvogXProcJur.ApagarLista(Key: word; ListaCod, ListaDesc: TListBox);
begin
  if (Key = VK_DELETE) and (ListaDesc.Items.Count > 0) then
  begin
    iIndiceAnt := ListaDesc.ItemIndex;
    ListaDesc.Items.Delete(iIndiceAnt);
    ListaCod.Items.Delete(iIndiceAnt);
  end;
end;

procedure TfrmAdvogXProcJur.cbxSelUFCidadeClick(Sender: TObject);
begin
  inherited;
  townUFCidade.Visible := cbxSelUFCidade.Checked;
end;

procedure TfrmAdvogXProcJur.bbtnFecharMBClick(Sender: TObject);
begin
  inherited;
  // Cria a lista de IDs das UFs selecionadas
  sListaIdUFSel := GerarParamSELECT(rgUF, lstCodUF, lstUF);

  // Cria a lista de IDs das Cidades selecionadas
  sListaIdCidadesSel := GerarParamSELECT(rgCidade, lstCodCidade, lstCidade);

  townUFCidade.Visible := False;
  cbxSelUFCidade.Checked := False;

  if (EdAdv1.Text <> '') then
    SelAdvogado1;
end;

function TfrmAdvogXProcJur.GerarParamSELECT(RadioGroup: TRadioGroup;
  ListaCod, ListaDesc: TListBox): string;
begin
  Result := GerarListaItens(RadioGroup, ListaCod, ListaDesc);
  if (Result <> '') then
    if (Pos(',', Result) = 0) then
      Result := ' = '+ Result
    else
      Result := 'IN ('+ Result +')';
end;

end.
