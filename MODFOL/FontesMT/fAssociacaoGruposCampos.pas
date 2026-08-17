unit fAssociacaoGruposCampos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda, Db,
  Wwdatsrc, DBCtrls, DBTables, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, MontaSelect, fcLabel,
  DBClient, uCMClientDataSet, uCtrlAssociacaoGruposCampos;

type
  TfrmAssociacaoGruposCampos = class(TfrmSairAjuda)
    ds: TwwDataSource;
    Panel3: TPanel;
    dsSel: TwwDataSource;
    dsDisp: TwwDataSource;
    MontaSelectSel: TMontaSelect;
    MontaSelectDisp: TMontaSelect;
    spbtnInserir: TSpeedButton;
    spbtnExcluir: TSpeedButton;
    wwDBGrid2: TwwDBGrid;
    bbtnProcurarSel: TBitBtn;
    fcLabel1: TfcLabel;
    wwDBGrid1: TwwDBGrid;
    bbtnProcurarDisp: TBitBtn;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    fcLabel2: TfcLabel;
    Cds: TCMClientDataSet;
    CdsSel: TCMClientDataSet;
    CdsDisp: TCMClientDataSet;
    Panel1: TPanel;
    Panel2: TPanel;
    wwDBGrid3: TwwDBGrid;
    Splitter1: TSplitter;
    procedure spbtnExcluirClick(Sender: TObject);
    procedure spbtnInserirClick(Sender: TObject);
    procedure bbtnProcurarSelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnProcurarDispClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CdsBeforeScroll(DataSet: TDataSet);
    procedure CdsAfterScroll(DataSet: TDataSet);
  private
    CtrlAssociacaoGruposCampos: TCtrlAssociacaoGruposCampos;
    
    bPrimeiraVez: boolean;
    sCodGrupoArquivo: string;
    
    procedure Sel;
  end;

var
  frmAssociacaoGruposCampos: TfrmAssociacaoGruposCampos;

implementation

uses uSistema, uMensErro, uCtrlPadroes, fAguarde, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmAssociacaoGruposCampos.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlAssociacaoGruposCampos := TCtrlAssociacaoGruposCampos.Create;
  CtrlAssociacaoGruposCampos.InitializeAs(Padroes);
  CtrlAssociacaoGruposCampos.Cds := CdsSel;

  bPrimeiraVez := true;
  Cds.Data := CtrlAssociacaoGruposCampos.ListGrupos;
  bPrimeiraVez := false;
end;

procedure TfrmAssociacaoGruposCampos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlAssociacaoGruposCampos);
  inherited;
end;

procedure TfrmAssociacaoGruposCampos.CdsBeforeScroll(DataSet: TDataSet);
begin
  sCodGrupoArquivo := Cds.FieldByName('CODGRUPOARQUIVO').asString;
end;

procedure TfrmAssociacaoGruposCampos.CdsAfterScroll(DataSet: TDataSet);
begin
  if (bPrimeiraVez) or (sCodGrupoArquivo <> Cds.FieldByName('CODGRUPOARQUIVO').asString) then
    Sel;
end;

procedure TfrmAssociacaoGruposCampos.bbtnProcurarSelClick(Sender: TObject);
begin
  CdsSel.DisableControls;

  MontaSelectDisp.Filtro.Clear;
  MontaSelectDisp.Filtro.Add('CMPBD.IDCAMPO = CMPBDGRP.IDCAMPO');
  MontaSelectDisp.Filtro.Add('CMPBDGRP.CODGRUPOARQUIVO = '+
    QuotedStr(Cds.FieldByName('CODGRUPOARQUIVO').asString));
  MontaSelectDisp.Executar;

  if (MontaSelectDisp.RetornouValor) then
    CdsSel.Locate('IDCAMPO', MontaSelectDisp.ValoresChave[0], []);

  CdsSel.EnableControls;
end;

procedure TfrmAssociacaoGruposCampos.bbtnProcurarDispClick(Sender: TObject);
begin
  CdsSel.DisableControls;

  MontaSelectSel.Filtro.Clear;
  MontaSelectSel.Filtro.Add('CMPBD.CAMPODOBANCO > 0');

  CdsSel.First;
  while not(CdsSel.EOF) do
  begin
    MontaSelectSel.Filtro.Add('CMPBD.IDCAMPO <> '+
      QuotedStr(CdsSel.FieldByName('IDCAMPO').asString));
    CdsSel.Next;
  end;

  MontaSelectSel.Executar;
  if (MontaSelectSel.RetornouValor) then
    CdsDisp.Locate('IDCAMPO', MontaSelectSel.ValoresChave[0], []);

  CdsSel.EnableControls;
end;

procedure TfrmAssociacaoGruposCampos.spbtnInserirClick(Sender: TObject);
begin
  CdsSel.DisableControls;

  frmAguarde.Mostra('Incluindo Campo...');
  frmAguarde.Refresh;

  CdsSel.Insert;
  CdsSel.FieldByName('IDCAMPO').asString := CdsDisp.FieldByName('IDCAMPO').asString;
  CdsSel.FieldByName('CODGRUPOARQUIVO').asString := Cds.FieldByName('CODGRUPOARQUIVO').asString;
  CdsSel.Post;

  if not(CtrlAssociacaoGruposCampos.Gravar) then
  begin
    CdsSel.Cancel;
    MsgDlg('O erro abaixo ocorreu ao tentar Inserir o campo:'+CR_LF+CR_LF+
      CtrlAssociacaoGruposCampos.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0);
  end
  else
    Sel;

  CdsSel.EnableControls;
end;

procedure TfrmAssociacaoGruposCampos.spbtnExcluirClick(Sender: TObject);
begin
  CdsSel.DisableControls;

  frmAguarde.Mostra('Excluindo Campo...');
  frmAguarde.Refresh;

  CdsSel.Delete;
//  CdsSel.FieldByName('IDCAMPO').asString := CdsSel.FieldByName('IDCAMPO').asString;
//  CdsSel.FieldByName('CODGRUPOARQUIVO').asString := CdsSel.FieldByName('CODGRUPOARQUIVO').asString;
//  CdsSel.Post;

  if not(CtrlAssociacaoGruposCampos.Gravar) then
  begin
    CdsSel.Cancel;
    MsgDlg('O erro abaixo ocorreu ao tentar Excluir o campo:'+CR_LF+CR_LF+
      CtrlAssociacaoGruposCampos.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0);
  end
  else
    Sel;

  CdsSel.EnableControls;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

Procedure TfrmAssociacaoGruposCampos.Sel;
begin
  frmAguarde.Mostra('Selecionando Dados...');
  frmAguarde.Refresh;

  CdsSel.Data := CtrlAssociacaoGruposCampos.ListCamposSel(
    Cds.FieldByName('CODGRUPOARQUIVO').asString);

  CdsDisp.Data := CtrlAssociacaoGruposCampos.ListCamposDisp(
    Cds.FieldByName('CODGRUPOARQUIVO').asString);

  frmAguarde.Apaga;
end;

end.
