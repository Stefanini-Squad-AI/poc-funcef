unit fCadPesqEmpr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, CmEventosCadastro,
  ImgList, MontaSelect, DBTables, IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, MAHlpBtn,
  TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, ExtCtrls,
  TabControlDetalhe, wwdblook, Mask, DBCtrls, TREdit, DBClient, uCMClientDataSet,
  FCadastroMestreDetMT, uCtrlCargo, uCtrlListTerceirosRH, uCtrlPesquisaSal,
  uCtrlPesquisaEmpresa;

type
  TfrmCadPesqEmpr = class(TFrmCadastroMestreDetMT)
    tbsTend: TTabSheet;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    dbreFreq: TDBRealEdit;
    dbreSalNom: TDBRealEdit;
    dbreSalReal: TDBRealEdit;
    sbtnGrafico: TToolbarButton97;
    sbtnTendencia: TToolbarButton97;
    gbxPesquisa: TGroupBox;
    dbedCodPesqui: TDBEdit;
    dbedData: TDBEdit;
    dbedCodCargo: TDBEdit;
    dblckPesquisa: TwwDBLookupCombo;
    dblckCargo: TwwDBLookupCombo;
    dblckEntid: TwwDBLookupCombo;
    CdsDet: TCMClientDataSet;
    CdsEntid: TCMClientDataSet;
    CdsCargo: TCMClientDataSet;
    CdsPesquisa: TCMClientDataSet;
    Label8: TLabel;
    Label9: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dbedMenor: TDBRealEdit;
    dbedMenorR: TDBRealEdit;
    dbedPrimQ: TDBRealEdit;
    dbedPrimQR: TDBRealEdit;
    dbedModa: TDBRealEdit;
    dbedModaR: TDBRealEdit;
    dbedMedia: TDBRealEdit;
    dbedMediaR: TDBRealEdit;
    dbedMediana: TDBRealEdit;
    dbedMedianaR: TDBRealEdit;
    dbedTercQ: TDBRealEdit;
    dbedTercQR: TDBRealEdit;
    dbedMaior: TDBRealEdit;
    dbedMaiorR: TDBRealEdit;
    Label13: TLabel;
    dbedFreq: TDBEdit;
    procedure CmeDetalheInsert(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnGraficoClick(Sender: TObject);
    procedure sbtnTendenciaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsStateChange(Sender: TObject);
    procedure dblckPesquisaChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
  private
    CtrlPesquisaEmpresa: TCtrlPesquisaEmpresa;
    CtrlCargo: TCtrlCargo;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlPesquisaSal: TCtrlPesquisaSal;

    procedure Sel(SelPrincipal: boolean; IdPesqSalar, IdCargo, IdEmpresaParticip: double);
    procedure PreencherCorCombos(Inserindo: boolean);
    function  GravarRegistro(Exclusao: boolean): boolean;
  end;

var
  frmCadPesqEmpr: TfrmCadPesqEmpr;

implementation

uses uMensErro, fColetaSal, fChartDado, uSistema, uCtrlPadroes, fAguarde, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmCadPesqEmpr.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPesquisaEmpresa := TCtrlPesquisaEmpresa.Create;
  CtrlPesquisaEmpresa.InitializeAs(Padroes);
  CtrlPesquisaEmpresa.CdsPesquisaEmpresa := Cds;
  CtrlPesquisaEmpresa.CdsDadosPesquisaEmpresa := CdsDet;

  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlPesquisaSal := TCtrlPesquisaSal.Create;
  CtrlPesquisaSal.InitializeAs(Padroes);

  CdsPesquisa.Data := CtrlPesquisaSal.ListPesquisaSal;
  CdsCargo.Data := CtrlCargo.ListCargo;
  CdsEntid.Data := CtrlListTerceirosRH.ListEmpresa_e_PessoaTerceiros;

  Sel(true, -1, -1, -1);

  Height := 432;
end;

procedure TfrmCadPesqEmpr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlCargo);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlPesquisaSal);
  FreeAndNil(CtrlPesquisaEmpresa);
  inherited;
end;

procedure TfrmCadPesqEmpr.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    Sel(true, StrToFloat(MontaSelect.ValoresChave[0]), StrToFloat(MontaSelect.ValoresChave[1]),
      StrToFloat(MontaSelect.ValoresChave[2]));
    PreencherCorCombos(false);
  end;
end;

procedure TfrmCadPesqEmpr.CmeCadastroDelete(Sender: TObject);
begin
  CdsDet.First;
  while not(CdsDet.EOF) do
    CdsDet.Delete;
  inherited;
end;

procedure TfrmCadPesqEmpr.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  PreencherCorCombos(Cds.State = dsInsert);
  sbtnGrafico.Enabled := not(Cds.State in [dsInsert,dsEdit]) and not(Cds.IsEmpty) and
    (dbedMaior.Value > 0);
end;

procedure TfrmCadPesqEmpr.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadPesqEmpr.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(false);
end;

procedure TfrmCadPesqEmpr.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(false);
end;

procedure TfrmCadPesqEmpr.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(true);
end;

procedure TfrmCadPesqEmpr.dsStateChange(Sender: TObject);
begin
  inherited;
  sbtnTendencia.Enabled := (Cds.State in [dsInsert,dsEdit]);
  sbtnGrafico.Enabled := not(Cds.State in [dsInsert,dsEdit]) and not(Cds.IsEmpty) and
    (dbedMaior.Value > 0);
  gbxPesquisa.Enabled := (Cds.State = dsInsert);
  
  if (Cds.State = dsInsert) then
  begin
    dblckPesquisa.SetFocus;

    CdsDet.First;
    while not(CdsDet.EOF) do
      CdsDet.Delete;

    PreencherCorCombos(true);
  end;
end;

procedure TfrmCadPesqEmpr.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert,dsEdit]) and (dbreFreq.CanFocus) then
    dbreFreq.SetFocus;
end;

procedure TfrmCadPesqEmpr.dblckPesquisaChange(Sender: TObject);
begin
  if (Cds.State in [dsInsert, dsEdit]) then
    Cds.FieldByName('DATAREFPESQ').asDateTime := CdsPesquisa.FieldByName('DATAREFPESQ').asDateTime;
end;

procedure TfrmCadPesqEmpr.CmeDetalheInsert(Sender: TObject);
begin
  if (Cds.FieldByName('IDEMPRESAPARTIC').asInteger <> Sistema.IdEmpresa) or
     (MsgDlg('Varre o Cadastro para Coleta?', 'Confirmação', mtConfirmation,
      [mbYes, mbNo], 0) = mrNo) then
    inherited
  else
  begin
    with TfrmColetaSal.Create(Application) do
    begin
      dblckCargo.LookupValue := dbedCodCargo.Text;
      dblckCargo.Update;
      dblckCargoCloseUp(nil, nil, nil, true);

      if (ShowModal = mrOk) then
        CtrlPesquisaEmpresa.InserirColetaSalarial(ListaQuantSal, ListaSalNominal,
          ListaSalReal);

      Free;
    end;
    sbtnTendenciaClick(Self);
    CdsDet.First;
    bbtnCancelarDetClick(Sender);
  end;
end;

procedure TfrmCadPesqEmpr.sbtnGraficoClick(Sender: TObject);
begin
  with TFrmChartDado.Create(Application) do
  begin
    CdsTendencia.Data := Cds.Data;

    NomePesquisa := Trim(dblckPesquisa.Text) +' - '+ Trim(dbedData.Text);
    NomeCargo := Trim(dblckCargo.Text);
    NomeEntidade := Trim(dblckEntid.Text);
    IdEntidade := Cds.FieldByName('IDEMPRESAPARTIC').asFloat;

    ShowModal;
    Free;
  end;
end;

procedure TfrmCadPesqEmpr.sbtnTendenciaClick(Sender: TObject);
begin
  frmAguarde.Mostra('Calculando Tendência...');
  CtrlPesquisaEmpresa.CalcularTendencia;
  frmAguarde.Apaga;
end;

procedure TfrmCadPesqEmpr.bbtnOkDetClick(Sender: TObject);
begin
  if (Trim(dbreFreq.Text) = '') then
  begin
    MsgDlg('Digite a Frequência.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dbreFreq.SetFocus;
  end
  else
  if (Trim(dbreSalNom.Text) = '') then
  begin
    MsgDlg('Digite o Salário Nominal.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dbreSalNom.SetFocus;
  end
  else
  if (Trim(dbreSalReal.Text) = '') then
  begin
    MsgDlg('Digite o Salário Real.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dbreSalReal.SetFocus;
  end
  else
    inherited;
end;

procedure TfrmCadPesqEmpr.bbtnConfirmarClick(Sender: TObject);
begin
  if (Trim(dblckPesquisa.Text) = '') then
  begin
    MsgDlg('Selecione a Pesquisa Salarial.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dblckPesquisa.SetFocus;
  end
  else
  if (Trim(dblckCargo.Text) = '') then
  begin
    MsgDlg('Selecione o Cargo.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dblckCargo.SetFocus;
  end
  else
  if (Trim(dblckEntid.Text) = '') then
  begin
    MsgDlg('Selecione a Entidade.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dblckEntid.SetFocus;
  end
  else
  begin
    CdsDet.First;
    while not(CdsDet.EOF) do
    begin
      CdsDet.Edit;
      CdsDet.FieldByName('IDPESQSALAR').asFloat := Cds.FieldByName('IDPESQSALAR').asFloat;
      CdsDet.FieldByName('IDCARGO').asFloat := Cds.FieldByName('IDCARGO').asFloat;
      CdsDet.FieldByName('IDEMPRPART').asFloat := Cds.FieldByName('IDEMPRESAPARTIC').asFloat;
      CdsDet.Post;
      CdsDet.Next;
    end;
    inherited;
    Sel(false, Cds.FieldByName('IDPESQSALAR').asFloat, Cds.FieldByName('IDCARGO').asFloat,
      Cds.FieldByName('IDEMPRESAPARTIC').asFloat);
  end;
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmCadPesqEmpr.Sel(SelPrincipal: boolean; IdPesqSalar, IdCargo,
  IdEmpresaParticip: double);
begin
  if (SelPrincipal) then
    Cds.Data := CtrlPesquisaEmpresa.ListPesquisaEmpresa(IdPesqSalar, IdCargo,
      IdEmpresaParticip);

  CdsDet.Data := CtrlPesquisaEmpresa.ListDadosPesquisaEmpresa(IdPesqSalar, IdCargo,
    IdEmpresaParticip);

  TFloatField(CdsDet.FieldByName('NOMINAL')).DisplayFormat := '###,###,##0.00';
  TFloatField(CdsDet.FieldByName('REAL')).DisplayFormat := '###,###,##0.00';
end;

function TfrmCadPesqEmpr.GravarRegistro(Exclusao: boolean): boolean;
begin
  if (Exclusao) then
    Result := CtrlPesquisaEmpresa.ExcluirPesquisaEmpresa
  else
    Result := CtrlPesquisaEmpresa.GravarPesquisaEmpresa;

  if not(Result) then
    raise Exception.Create(CtrlPesquisaEmpresa.MessageInfo);
end;

procedure TfrmCadPesqEmpr.PreencherCorCombos(Inserindo: boolean);
begin
  if (Inserindo) then
  begin
    dblckPesquisa.Color := clWindow;
    dblckPesquisa.Font.Color := clBlack;
    dblckCargo.Color := clWindow;
    dblckCargo.Font.Color := clBlack;
    dblckEntid.Color := clWindow;
    dblckEntid.Font.Color := clBlack;
  end
  else
  begin
    dblckPesquisa.Color := clGray;
    dblckPesquisa.Font.Color := clWhite;
    dblckCargo.Color := clGray;
    dblckCargo.Font.Color := clWhite;
    dblckEntid.Color := clGray;
    dblckEntid.Font.Color := clWhite;
  end;
end;

end.
