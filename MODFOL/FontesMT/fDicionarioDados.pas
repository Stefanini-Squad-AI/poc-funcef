unit fDicionarioDados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  Buttons, Wwdbigrd, Grids, Wwdbgrid, DBCtrls, StdCtrls, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, DBTables, MontaSelect, DBClient,
  uCMClientDataSet, fcLabel, uCtrlDicionarioDados;

type
  TfrmDicionarioDados = class(TfrmSairAjuda)
    pnlBotoes: TPanel;
    bbtnCadGrupo: TBitBtn;
    bbtnVisao: TBitBtn;
    btnCadCampos: TBitBtn;
    dsGrupos: TwwDataSource;
    dsTable: TwwDataSource;
    dsCmpBd: TwwDataSource;
    dsCampos: TwwDataSource;
    MontaSelect: TMontaSelect;
    btnConsultar: TBitBtn;
    btnAtualizar: TBitBtn;
    btnAssociarCamposGrupos: TBitBtn;
    pnlFundo2: TPanel;
    pnlGrupo: TPanel;
    dbgrPrincipal: TwwDBGrid;
    pnlCampos: TPanel;
    lblCampos: TLabel;
    dbgrdCampos: TwwDBGrid;
    Splitter1: TSplitter;
    CdsGrupos: TCMClientDataSet;
    CdsTable: TCMClientDataSet;
    CdsCmpBd: TCMClientDataSet;
    CdsCampos: TCMClientDataSet;
    Bevel1: TBevel;
    lblVisao: TfcLabel;
    procedure bbtnVisaoClick(Sender: TObject);
    procedure dsTableDataChange(Sender: TObject; Field: TField);
    procedure dsGruposDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure bbtnCadGrupoClick(Sender: TObject);
    procedure btnCadCamposClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnAssociarCamposGruposClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlDicionarioDados: TCtrlDicionarioDados;
  end;

var
  frmDicionarioDados: TfrmDicionarioDados;

implementation

uses uSistema, uMensErro, uCtrlPadroes, fTelaAut, fAguarde, fCadCampos, fCadGrupoArquivo,
  fAssociacaoGruposCampos;

{$R *.DFM}

procedure TfrmDicionarioDados.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlDicionarioDados := TCtrlDicionarioDados.Create;
  CtrlDicionarioDados.InitializeAs(Padroes);

  CdsGrupos.Data := CtrlDicionarioDados.ListGrupos;
  CdsTable.Data := CtrlDicionarioDados.ListTable;
end;

procedure TfrmDicionarioDados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlDicionarioDados);
  inherited;
end;

procedure TfrmDicionarioDados.dsTableDataChange(Sender: TObject; Field: TField);
begin
  CdsCampos.DisableControls;
  CdsCampos.Data := CtrlDicionarioDados.ListCampos(CdsTable.FieldByName('DESCRICAO').asString);
  CdsCampos.EnableControls;
end;

procedure TfrmDicionarioDados.dsGruposDataChange(Sender: TObject; Field: TField);
begin
  CdsCmpBd.DisableControls;
  CdsCmpBd.Data := CtrlDicionarioDados.ListCmpBd(CdsGrupos.FieldByName('DESCRICAO').asString);
  CdsCmpBd.EnableControls;
end;

procedure TfrmDicionarioDados.btnConsultarClick(Sender: TObject);
var
  Aux: array [1..4] of string;
begin
  MontaSelect.Executar;

  if (MontaSelect.RetornouValor) then
  begin
    Aux[1] := MontaSelect.ValoresChave[0]; //CodGrupoArquivo
    Aux[2] := MontaSelect.ValoresChave[1]; //DescGrupoArquivo
    Aux[3] := MontaSelect.ValoresChave[2]; //IdCampo
    Aux[4] := MontaSelect.ValoresChave[3]; //ENTIDADE

    frmAguarde.Mostra('Pesquisando Dados...');
    frmAguarde.Refresh;

    if (dbgrPrincipal.DataSource = dsGrupos) then
    begin
      CdsGrupos.Locate('DESCRICAO', Aux[2], []); //Caso seja pelo GRPARQUIVO
      CdsCmpBd.DisableControls;
      CdsCmpBd.Data := CtrlDicionarioDados.ListCmpBd(CdsGrupos.FieldByName('DESCRICAO').asString);
      CdsCmpBd.EnableControls;

      frmAguarde.Apaga;
      if not(CdsCmpBd.Locate('IDCAMPO', Aux[3], [])) then
        MsgDlg('Campo ' +Aux[3]+ ' não encontrado.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    end
    else
    begin
      CdsTable.Locate('DESCRICAO', Aux[4], []); //Caso seja pelo DDTABLE
      CdsCampos.DisableControls;
      CdsCampos.Data := CtrlDicionarioDados.ListCampos(CdsTable.FieldByName('DESCRICAO').asString);
      CdsCampos.EnableControls;

      frmAguarde.Apaga;
      if not(CdsCampos.Locate('IDCAMPO', Aux[3], [])) then
        MsgDlg('Campo ' +Aux[3]+ ' não encontrado.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    end;
  end;

  dbgrPrincipal.Refresh;
  dbgrPrincipal.UpdateControlState;
  dbgrPrincipal.Realign;
  dbgrPrincipal.Show;
end;

procedure TfrmDicionarioDados.bbtnVisaoClick(Sender: TObject);
begin
  if (dbgrPrincipal.DataSource = dsGrupos) then
  begin
    lblVisao.Caption := 'Tabelas';
    dbgrPrincipal.DataSource := dsTable;
    dbgrdCampos.DataSource := dsCampos;
  end
  else
  begin
    lblVisao.Caption := 'Grupos de Dados';
    dbgrPrincipal.DataSource := dsGrupos;
    dbgrdCampos.DataSource := dsCmpBd;
  end;
end;

procedure TfrmDicionarioDados.btnAtualizarClick(Sender: TObject);
begin
  frmAguarde.Mostra('Atualizando Dados...');

  CdsGrupos.DisableControls;
  CdsTable.DisableControls;
  CdsCmpBd.DisableControls;
  CdsCampos.DisableControls;

  CdsGrupos.Data := CtrlDicionarioDados.ListGrupos;
  CdsTable.Data := CtrlDicionarioDados.ListTable;
  CdsCmpBd.Data := CtrlDicionarioDados.ListCmpBd(CdsGrupos.FieldByName('DESCRICAO').asString);
  CdsCampos.Data := CtrlDicionarioDados.ListCampos(CdsTable.FieldByName('DESCRICAO').asString);

  CdsGrupos.EnableControls;
  CdsTable.EnableControls;
  CdsCmpBd.EnableControls;
  CdsCampos.EnableControls;

  frmAguarde.Apaga;
end;

procedure TfrmDicionarioDados.bbtnCadGrupoClick(Sender: TObject);
begin
  AbrirForm(frmCadGrupoArquivo, TfrmCadGrupoArquivo, false);
end;

procedure TfrmDicionarioDados.btnCadCamposClick(Sender: TObject);
begin
  AbrirForm(frmCadCampos,TfrmCadCampos, false);
end;

procedure TfrmDicionarioDados.btnAssociarCamposGruposClick(Sender: TObject);
begin
  AbrirForm(frmAssociacaoGruposCampos, TfrmAssociacaoGruposCampos, false);
end;

end.
