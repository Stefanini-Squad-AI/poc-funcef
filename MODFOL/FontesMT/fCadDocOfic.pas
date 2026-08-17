unit fCadDocOfic;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, Mask, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, wwdblook, wwdbedit, ImgList,
  CmEventosCadastro, FCadastroMT, DBClient, uCMClientDataSet, uCtrlDocOfic,
  uCtrlListTerceirosRH;

type
  TfrmCadDocOfic = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedCodigo: TwwDBEdit;
    Label2: TLabel;
    dbedSigla: TwwDBEdit;
    Label3: TLabel;
    dblcTipoDoc: TwwDBLookupCombo;
    CdsTipoDoc: TCMClientDataSet;
    procedure dblcTipoDocChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private
    CtrlDocOfic: TCtrlDocOfic;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;

    procedure Sel(CodDocumento: string);
    function  GravarRegistro: boolean;
  end;

var
  frmCadDocOfic: TfrmCadDocOfic;

implementation

uses uMensErro, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmCadDocOfic.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlDocOfic := TCtrlDocOfic.Create;
  CtrlDocOfic.InitializeAs(Padroes);
  CtrlDocOfic.CdsDocOfic := Cds;
  Sel('-1');

  CdsTipoDoc.Data := CtrlListTerceirosRH.ListTipoDocPessoa;
end;

procedure TfrmCadDocOfic.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlDocOfic);
  FreeAndNil(CtrlListTerceirosRH);
  inherited;
end;

procedure TfrmCadDocOfic.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(MontaSelect.ValoresChave[0]);
end;

procedure TfrmCadDocOfic.CmeCadastroInsert(Sender: TObject);
begin
  Sel('-1');
  inherited;
end;

procedure TfrmCadDocOfic.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadDocOfic.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  Accept := GravarRegistro;
end;

procedure TfrmCadDocOfic.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  Accept := GravarRegistro;
end;

procedure TfrmCadDocOfic.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  Accept := GravarRegistro;
end;

procedure TfrmCadDocOfic.CmeCadastroConfirma(Sender: TObject);
begin
  if (Cds.State in [dsInsert, dsEdit]) then
    Cds.FieldByName('SIGLADOCUMENTO').asString := Trim(Cds.FieldByName('SIGLADOCUMENTO').asString);
  inherited;
end;

procedure TfrmCadDocOfic.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadDocOfic.dblcTipoDocChange(Sender: TObject);
var
  bOk: boolean;
begin
  if (Cds.State in [dsInsert, dsEdit]) then
  begin
    bOk := (Trim(dblcTipoDoc.Text) <> '');
    if (bOk) then
    begin
      bOk := not(CtrlDocOfic.DocumentoJaSelecionado(Cds.FieldByName('CodDocumento').asString,
        CdsTipoDoc.FieldByName('IdDocumento').asString));
      if (bOk) then
        Cds.FieldByName('IdDocumento').asString := CdsTipoDoc.FieldByName('IdDocumento').asString
      else        
        MsgDlg('Não é permitido a seleção deste Tipo de Documento'+CR_LF+
               'pois ele já foi selecionado em outro Documento Oficial.', 'Aviso',
               mtInformation, [mbOk,mbHelp], 0);
    end;

    if not(bOk) then
      Cds.FieldByName('IdDocumento').Clear;
  end;
end;

procedure TfrmCadDocOfic.bbtnConfirmarClick(Sender: TObject);
var
  bInserindo: boolean;
begin
  if (Trim(dbedCodigo.Text) = '') then
  begin
    MsgDlg('Preencha o Código Oficial.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedCodigo.SetFocus;
  end
  else
  if (Trim(dbedSigla.Text) = '') then
  begin
    MsgDlg('Preencha a Sigla do Documento.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedSigla.SetFocus;
  end
  else
  begin
    bInserindo := (Cds.State = dsInsert);
    inherited;
    if not(bInserindo) then
      CmeCadastroFind(Sender);
  end;
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmCadDocOfic.Sel(CodDocumento: string);
begin
  Cds.Data := CtrlDocOfic.ListDocOfic(CodDocumento);
end;

function TfrmCadDocOfic.GravarRegistro: boolean;
begin
  Result := CtrlDocOfic.GravarDocOfic;
  if not(Result) then
    raise exception.Create(CtrlDocOfic.MessageInfo);
end;

end.
