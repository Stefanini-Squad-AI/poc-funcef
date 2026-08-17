unit fParamPesqSal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, wwdblook, Spin, IvDictio,
  IvMulti, IvEMulti, ComCtrls, fSairAjuda, fParamReports_Padrao, CmParamReport, DBClient,
  uCMClientDataSet, uCtrlTabPesqui, uCtrlPesquisaSal;

type
  TfrmParamPesqSal = class(TfrmParamReports_Padrao)
    GroupBox1: TGroupBox;
    dblcPesq: TwwDBLookupCombo;
    rgTipoTab: TRadioGroup;
    rgExcluir: TRadioGroup;
    dblcEntid: TwwDBLookupCombo;
    CdsEntid: TCMClientDataSet;
    CdsPesq: TCMClientDataSet;
    rgNomeCodigo: TRadioGroup;
    gbxCorte: TGroupBox;
    ednPercCorte: TSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rgTipoTabClick(Sender: TObject);
    procedure rgExcluirClick(Sender: TObject);
    procedure dblcEntidChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlTabPesqui: TCtrlTabPesqui;
    CtrlPesquisaSal: TCtrlPesquisaSal;

    procedure HabilitarBtOk;
  end;

var
  frmParamPesqSal: TfrmParamPesqSal;

implementation

uses uCtrlPadroes, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmParamPesqSal.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTabPesqui := TCtrlTabPesqui.Create;
  CtrlTabPesqui.InitializeAs(Padroes);

  CtrlPesquisaSal := TCtrlPesquisaSal.Create;
  CtrlPesquisaSal.InitializeAs(Padroes);

  CdsPesq.Data := CtrlPesquisaSal.ListPesquisaSal;
  if not(CdsPesq.FieldByName('NOMEPESQSALAR').IsNull) then
  begin
    dblcPesq.LookupValue := CdsPesq.FieldByName('NOMEPESQSALAR').asString;
    dblcPesq.Update;
  end;
  
  HabilitarBtOk;
end;

procedure TfrmParamPesqSal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlPesquisaSal);
  FreeAndNil(CtrlTabPesqui);
  inherited;
end;

procedure TfrmParamPesqSal.dblcEntidChange(Sender: TObject);
begin
  HabilitarBtOk;
end;

procedure TfrmParamPesqSal.rgTipoTabClick(Sender: TObject);
begin
  rgExcluir.Visible := (rgTipoTab.ItemIndex = 0);
  dblcEntid.Visible := (rgTipoTab.ItemIndex = 0) and (rgExcluir.ItemIndex = 1);
end;

procedure TfrmParamPesqSal.rgExcluirClick(Sender: TObject);
begin
  dblcEntid.Visible := (rgExcluir.ItemIndex = 1);
  if (rgExcluir.ItemIndex = 1) then
    CdsEntid.Data := CtrlTabPesqui.ListPessoaComTendPesquisaSal(
      CdsPesq.FieldByName('IDPESQSALAR').asFloat);
end;

procedure TfrmParamPesqSal.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  Cmp_Padrao.ParamByName('TipoRelatorio').asInteger := rgTipoTab.ItemIndex;
  Cmp_Padrao.ParamByName('TipoExclusaoEmpresa').asInteger := rgExcluir.ItemIndex;
  Cmp_Padrao.ParamByName('IdPesquisa').asFloat := CdsPesq.FieldByName('IDPESQSALAR').asFloat;
  Cmp_Padrao.ParamByName('NomePesquisa').asString := CdsPesq.FieldByName('NOMEPESQSALAR').asString;
  Cmp_Padrao.ParamByName('DataPesquisa').asDateTime := CdsPesq.FieldByName('DATAREFPESQ').asDateTime;
  if (CdsEntid.Active) then
    Cmp_Padrao.ParamByName('IdEmpresa').asFloat := CdsEntid.FieldByName('IDPESSOA').asFloat
  else
    Cmp_Padrao.ParamByName('IdEmpresa').asFloat := 0;
  Cmp_Padrao.ParamByName('IndNomeCodigo').asInteger := rgNomeCodigo.ItemIndex;
  Cmp_Padrao.ParamByName('PercCorte').asInteger := ednPercCorte.Value;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmParamPesqSal.HabilitarBtOk;
begin
  bbtnConfirmar.Enabled := (Trim(dblcPesq.Text) <> '');
end;

end.
