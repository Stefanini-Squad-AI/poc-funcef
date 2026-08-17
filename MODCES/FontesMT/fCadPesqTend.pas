unit fCadPesqTend;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCadastroMT,
  CmEventosCadastro, ImgList, MontaSelect, DBTables, IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, wwdblook, Mask, DBCtrls, TREdit, DBClient, uCMClientDataSet,
  Wwquery, uCtrlCargo, uCtrlListTerceirosRH, uCtrlPesquisaSal, uCtrlPesquisaEmpresa;

type
  TfrmCadPesqTend = class(TFrmCadastroMT)
    sbtnGrafico: TToolbarButton97;
    gbxPesquisa: TGroupBox;
    dbedCodPesqui: TDBEdit;
    dbedData: TDBEdit;
    dbedCodCargo: TDBEdit;
    dblckPesquisa: TwwDBLookupCombo;
    dblckCargo: TwwDBLookupCombo;
    dblckEntid: TwwDBLookupCombo;
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
    CdsEntid: TCMClientDataSet;
    CdsCargo: TCMClientDataSet;
    CdsPesquisa: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnGraficoClick(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure dblckPesquisaChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
  private
    CtrlPesquisaEmpresa: TCtrlPesquisaEmpresa;
    CtrlCargo: TCtrlCargo;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlPesquisaSal: TCtrlPesquisaSal;

    bInserindo: boolean;

    procedure Sel(IdPesqSalar, IdCargo, IdEmpresaParticip: double);
    procedure PreencherCorCombos(Inserindo: boolean);
    function  GravarRegistro: boolean;
  end;

var
  frmCadPesqTend: TfrmCadPesqTend;

implementation

uses uMensErro, fColetaSal, fChartDado, uSistema, uCtrlPadroes, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmCadPesqTend.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPesquisaEmpresa := TCtrlPesquisaEmpresa.Create;
  CtrlPesquisaEmpresa.InitializeAs(Padroes);
  CtrlPesquisaEmpresa.CdsPesquisaEmpresa := Cds;

  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlPesquisaSal := TCtrlPesquisaSal.Create;
  CtrlPesquisaSal.InitializeAs(Padroes);

  CdsPesquisa.Data := CtrlPesquisaSal.ListPesquisaSal;
  CdsCargo.Data := CtrlCargo.ListCargo;
  
  Sel(-1, -1, -1);
end;

procedure TfrmCadPesqTend.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlCargo);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlPesquisaSal);
  FreeAndNil(CtrlPesquisaEmpresa);
  inherited;
end;

procedure TfrmCadPesqTend.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    Sel(StrToFloat(MontaSelect.ValoresChave[0]), StrToFloat(MontaSelect.ValoresChave[1]),
      StrToFloat(MontaSelect.ValoresChave[2]));
    PreencherCorCombos(false);
  end;
end;

procedure TfrmCadPesqTend.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  // Não traz as Empresas Proprietárias
  if not(bInserindo) then
  begin
    CdsEntid.Data := CtrlListTerceirosRH.ListPessoaTerceiro;
    bInserindo := true;
  end;  
end;

procedure TfrmCadPesqTend.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  PreencherCorCombos(Cds.State = dsInsert);
  sbtnGrafico.Enabled := not(Cds.State in [dsInsert,dsEdit]) and not(Cds.IsEmpty) and
    (dbedMaior.Value > 0);
end;

procedure TfrmCadPesqTend.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadPesqTend.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadPesqTend.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadPesqTend.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadPesqTend.dsStateChange(Sender: TObject);
begin
  inherited;
  sbtnGrafico.Enabled := not(Cds.State in [dsInsert,dsEdit]) and not(Cds.IsEmpty) and
    (dbedMaior.Value > 0);
  gbxPesquisa.Enabled := (Cds.State = dsInsert);

  if (Cds.State = dsInsert) then
  begin
    dblckPesquisa.SetFocus;
    PreencherCorCombos(true);
  end;
end;

procedure TfrmCadPesqTend.dblckPesquisaChange(Sender: TObject);
begin
  if (Cds.State in [dsInsert, dsEdit]) then
    Cds.FieldByName('DATAREFPESQ').asDateTime := CdsPesquisa.FieldByName('DATAREFPESQ').asDateTime;
end;

procedure TfrmCadPesqTend.sbtnGraficoClick(Sender: TObject);
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

procedure TfrmCadPesqTend.bbtnConfirmarClick(Sender: TObject);
var
  bInserindo: boolean;
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
    bInserindo := (Cds.State = dsInsert);
    inherited;
    if not(bInserindo) then
      CmeCadastroFind(Sender);
  end;
//    Sel(Cds.FieldByName('IDPESQSALAR').asFloat, Cds.FieldByName('IDCARGO').asFloat,
//      Cds.FieldByName('IDEMPRESAPARTIC').asFloat);
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmCadPesqTend.Sel(IdPesqSalar, IdCargo, IdEmpresaParticip: double);
begin
  Cds.Data := CtrlPesquisaEmpresa.ListPesquisaEmpresa(IdPesqSalar, IdCargo,
    IdEmpresaParticip);
  CdsEntid.Data := CtrlListTerceirosRH.ListEmpresa_e_PessoaTerceiros;
  bInserindo := false;
end;

function TfrmCadPesqTend.GravarRegistro: boolean;
begin
  Result := CtrlPesquisaEmpresa.GravarPesquisaEmpresa(false);
  if not(Result) then
    raise Exception.Create(CtrlPesquisaEmpresa.MessageInfo);
end;

procedure TfrmCadPesqTend.PreencherCorCombos(Inserindo: boolean);
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
