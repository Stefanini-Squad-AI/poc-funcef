{--------------------------------------------------------------------------------------------------
Rotina......: Cadastro de Cursos
Nº SOL......: 137268
Nº KINTANA..: 829513
Data........: 22/12/2011
Responsável.: Eraldo Luis da Silva
Descrição...: Integração do Módulo de Treinamento com o Financeiro para a emissão de AP.
--------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 116914
Nº KINTANA..: 558952
Data........: 04/04/2011
Responsável.: Thaise Amaral Martins
Descrição...: Inserir o dbLookup dblcSigla, para escolher a sigla para o curso.
--------------------------------------------------------------------------------------------------}
unit fCadCurso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MontaSelect, Db,
  DBClient, uCMClientDataSet, FCadastroMestreDetMT, CmEventosCadastro, ImgList, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, TREdit, wwdblook, Mask, DBCtrls,
  uCtrlCurso, uCtrlListTerceirosRH, uCtrlRegTrein, uCtrlCursoxAvalDes, uCtrlFatorAval,
  uCtrlFatorAvalCurso, uCtrlGlobalRH, uCmSqlParams, uCtrlCursoxFatorAval;

type
  TfrmCadCurso = class(TFrmCadastroMestreDetMT)
    tbshObserv: TTabSheet;
    Label1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    dbedCodigo: TDBEdit;
    dbedDescr: TDBEdit;
    dbedAbrev: TDBEdit;
    dblcUnidNegocio: TwwDBLookupCombo;
    wwDBLookupCombo1: TwwDBLookupCombo;
    dblcPacote: TwwDBLookupCombo;
    dblcEntid: TwwDBLookupCombo;
    Label9: TLabel;
    dbedValor: TDBRealEdit;
    Label10: TLabel;
    dbedDurPrat: TDBRealEdit;
    Label11: TLabel;
    dbedDurTeor: TDBRealEdit;
    Label12: TLabel;
    dbedObserv: TDBMemo;
    Label3: TLabel;
    dbedObserv2: TDBMemo;
    CdsEntid: TCMClientDataSet;
    CdsGrupoTr: TCMClientDataSet;
    CdsTipCurso: TCMClientDataSet;
    CdsPacote: TCMClientDataSet;
    CdsDet: TCMClientDataSet;
    Label13: TLabel;
    dblcFator: TwwDBLookupCombo;
    CdsFator: TCMClientDataSet;
    dsDet2: TwwDataSource;
    CdsDet2: TCMClientDataSet;
    tbshAvalAplic: TTabSheet;
    pnlControlesDet2: TPanel;
    Label14: TLabel;
    dblcFatorAvalCurso: TwwDBLookupCombo;
    dbgrdDet2: TwwDBGrid;
    CdsFatorAvalCurso: TCMClientDataSet;
    CMSqlParams1: TCMSqlParams;
    cdsUnidNegocio: TCMClientDataSet;
    dblcSigla: TwwDBLookupCombo;
    Label16: TLabel;
    CdsSiglas: TCMClientDataSet;
    DsSiglas: TwwDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure dsStateChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblcEntidEnter(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
  private
    CtrlCurso: TCtrlCurso;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlRegTrein: TCtrlRegTrein;
    CtrlCursoxAvalDes: TCtrlCursoxAvalDes;
    CtrlFatorAval: TCtrlFatorAval;
    CtrlFatorAvalCurso: TCtrlFatorAvalCurso;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlCursoxFatorAval: TCtrlCursoxFatorAval;

    procedure Sel(IdCurso: double);
    function  GravarRegistro(Exclusao: boolean): boolean;
  end;

var
  frmCadCurso: TfrmCadCurso;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlUsoGeralRH, dCds;

{$R *.DFM}

procedure TfrmCadCurso.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlCurso := TCtrlCurso.Create;
  CtrlCurso.InitializeAs(Padroes);
  CtrlCurso.Cds := Cds;
  CtrlCurso.CdsDet := CdsDet;
  CtrlCurso.CdsDet2 := CdsDet2;

  CtrlCursoxAvalDes := TCtrlCursoxAvalDes.Create;
  CtrlCursoxAvalDes.InitializeAs(Padroes);

  CtrlCursoxFatorAval := TCtrlCursoxFatorAval.Create;
  CtrlCursoxFatorAval.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlRegTrein := TCtrlRegTrein.Create(true, Sistema.UsaRAD, false, false, Sistema.IdEmpresa,
    Sistema.IdUsuario, Sistema.NomeUsuario, CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlRegTrein.InitializeAs(Padroes);

  CtrlFatorAval := TCtrlFatorAval.Create;
  CtrlFatorAval.InitializeAs(Padroes);

  CtrlFatorAvalCurso := TCtrlFatorAvalCurso.Create;
  CtrlFatorAvalCurso.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);
  dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('FLGAVALALUNO,FLGCURSOXAVAL');

  //gbxAvalTeorPrat.Visible := (dmCds.Cds.FieldByName('FLGAVALALUNO').asInteger = 0);
  //gbxPercMax.Visible := (dmCds.Cds.FieldByName('FLGAVALALUNO').asInteger = 1);


  CdsGrupoTr.Data := CtrlCurso.ListGrupoTr;
  CdsPacote.Data := CtrlCurso.ListPacote;
  //Cássio - SOL 116916 KINTANA 558985 - Início
  //CdsTipCurso.Data := CtrlCurso.ListTipCurso;
  cdsUnidNegocio.Data := CtrlCurso.ListUnidNegoc;
  CdsSiglas.Data := CtrlCurso.ListSiglas;
  //Cássio - SOL 116916 KINTANA 558985 - Fim
  //CdsEntid.Data := CtrlListTerceirosRH.ListEmpresa_e_PessoaTerceiros;
  CdsEntid.Data := CtrlRegTrein.ListEntid;
  CdsFator.Data := CtrlFatorAval.ListFatorAval(0, '0,1');
  CdsFatorAvalCurso.Data := CtrlFatorAvalCurso.ListFatorAvalCurso(0,-1);
  //tbsDet.TabVisible := CdsFator.RecordCount > 0;
  if (dmCds.Cds.FieldByName('FLGCURSOXAVAL').asInteger = 0) or (CdsFator.RecordCount = 0) then
  begin
    tbcDetalhe.detdbGrids.Clear;
    tbcDetalhe.detdbGrids.Add('');
    tbcDetalhe.detdbGrids.Add('');

    tbcDetalhe.Tabs.Clear;
    tbcDetalhe.Tabs.Add('Conteúdo e Observações');
    //tbcDetalhe.Tabs.Add('Critério de Aprovação');

    if (CdsFator.RecordCount) > 0 then
    begin
      tbcDetalhe.detdbGrids.Add('dbgrdDet');
      tbcDetalhe.Tabs.Add('Competências Trabalhadas');
    end
    else
    begin
      tbsDet.TabVisible := False;
      tbsDet.Destroy;
    end;

    if (dmCds.Cds.FieldByName('FLGCURSOXAVAL').asInteger = 1) then
    begin
      tbcDetalhe.detdbGrids.Add('dbgrdDet2');
      tbcDetalhe.Tabs.Add('Avaliações Aplicáveis');
    end
    else
    begin
      tbshAvalAplic.TabVisible := False;
      tbshAvalAplic.Destroy;
    end;
  end;

  Sel(-1);
end;

procedure TfrmCadCurso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlCurso);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlRegTrein);
  FreeAndNil(CtrlCursoxAvalDes);
  FreeAndNil(CtrlCursoxFatorAval);
  FreeAndNil(CtrlFatorAval);
  FreeAndNil(CtrlFatorAvalCurso);
  FreeAndNil(CtrlGlobalRH);
  inherited;
end;

procedure TfrmCadCurso.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadCurso.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
  Cds.FieldByName('TEMAVAL').asInteger := 0;
  Cds.FieldByName('TEMAVPR').asInteger := 0;
end;

procedure TfrmCadCurso.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadCurso.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(false);
end;

procedure TfrmCadCurso.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(false);
end;

procedure TfrmCadCurso.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(true);
end;

procedure TfrmCadCurso.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedDescr.CanFocus) then
    dbedDescr.SetFocus;
end;

procedure TfrmCadCurso.dblcEntidEnter(Sender: TObject);
begin
  inherited;
  if (dbedCodigo.Text <> '') then
    CdsEntid.Data := CtrlRegTrein.ListEntid(Cds.FieldByName('IDCURSO').asFloat);
end;

procedure TfrmCadCurso.bbtnOkDetClick(Sender: TObject);
begin
  if (pgctrlDetalhe.ActivePage = tbsDet) then
    CdsDet.FieldByName('DESCRFATORAVAL').AsString := trim(dblcFator.Text)
  else
  begin
    CdsDet2.FieldByName('FATORAVAL').AsString := CdsFatorAvalCurso.FieldByName('DESCRICAO').AsString;
    CdsDet2.FieldByName('APLICACAO').AsString := CdsFatorAvalCurso.FieldByName('APLICACAO').AsString;
  end;
  inherited;
end;

procedure TfrmCadCurso.bbtnConfirmarClick(Sender: TObject);
var
  bInserindo: boolean;
begin
  if (Trim(dbedDescr.Text) = '') then
  begin
    MsgDlg('Preencha a Descrição.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedDescr.SetFocus;
  end;

  if (Trim(dblcSigla.Text) = '') then
  begin
    MsgDlg('Preencha a Sigla.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dblcSigla.SetFocus;
    Abort;
  end;

  //Cássio - SOL 116916 KINTANA 558985 - Início
  if (Trim(dblcUnidNegocio.Text) = '') then
  begin
    MsgDlg('Informe a Atividade/Projeto do Curso', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dblcUnidNegocio.SetFocus;
  end
  else
  begin
    if (Cds.FieldByName('DUR_TEOR').IsNull) then
      Cds.FieldByName('DUR_TEOR').asInteger := 0;
    if (Cds.FieldByName('DUR_PRAT').IsNull) then
      Cds.FieldByName('DUR_PRAT').asInteger := 0;

    bInserindo := (Cds.State = dsInsert);
    inherited;
    if not(bInserindo) then
      CmeCadastroFind(Sender);
  end;
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmCadCurso.Sel(IdCurso: double);
begin
  Cds.Data := CtrlCurso.ListGeral(IdCurso);
  CdsDet.Data := CtrlCursoxAvalDes.ListCursoxAvalDes(IdCurso);
  CdsDet2.Data := CtrlCursoxFatorAval.ListCursoxFatorAval(IdCurso);
end;

function TfrmCadCurso.GravarRegistro(Exclusao: boolean): boolean;
begin
  if (Exclusao) then
    Result := CtrlCurso.Excluir
  else
    Result := CtrlCurso.Gravar;

  if not(Result) then
    raise Exception.Create(CtrlCurso.MessageInfo);
end;

end.
