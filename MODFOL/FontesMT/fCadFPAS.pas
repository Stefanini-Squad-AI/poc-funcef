unit fCadFPAS;
//******************************************************************************
//Nº SOL: 259921/18014 - ER145
//Nº PPM: 1217940
//Data da Alteração: 09/03/2016
//Alteração Form: Alteração do campo Código Terceiros para Código Terceiros
//               (eSocial).
//Responsável: Michelle Suellyn Mota
//Descrição: Alteração do campo Código Terceiros para Código Terceiros
//           (eSocial). Campo da tabela modificado de number(3) para char(4).
{--------------------------------------------------------------------------------
Rotina......: varias
N. Sol......: 229353-16212
N. Kintana..: 434575
Data........: 18-09-2014
Responsável.: Higor Nayde
Descrição...: ajuste referente ao e-social
--------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask,
  DBCtrls, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97,
  TB97Ctls, MAHlpBtn, TB97Tlbr, Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, ExtCtrls,
  TabControlDetalhe, wwdbedit, CmEventosCadastro, ImgList, FCadastroMestreDetMT, DBClient,
  uCMClientDataSet, TREdit, uCtrlFPAS;

type
  TfrmCadFPAS = class(TFrmCadastroMestreDetMT)
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    Label1: TLabel;
    dbedDescrDet: TDBEdit;
    Label3: TLabel;
    dbedCodigoDet: TDBEdit;
    Label4: TLabel;
    tbshPercent: TTabSheet;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    dbedDescr: TwwDBEdit;
    CdsDet: TCMClientDataSet;
    DBRealEdit1: TDBRealEdit;
    DBRealEdit2: TDBRealEdit;
    DBRealEdit4: TDBRealEdit;
    DBRealEdit6: TDBRealEdit;
    DBRealEdit5: TDBRealEdit;
    DBRealEdit3: TDBRealEdit;
    Label11: TLabel;
    edtCodTerceiros: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure dsStateChange(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure edtCodTerceirosKeyPress(Sender: TObject; var Key: Char);
    procedure sbtnExcluiDetClick(Sender: TObject);
  private
    CtrlFPAS: TCtrlFPAS;

    procedure Sel(IdFPAS: integer);
    function  GravarRegistro(Exclusao: boolean): boolean;
  end;

var
  frmCadFPAS: TfrmCadFPAS;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadFPAS.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlFPAS := TCtrlFPAS.Create;
  CtrlFPAS.InitializeAs(Padroes);
  CtrlFPAS.Cds := Cds;
  CtrlFPAS.CdsDet := CdsDet;
  Sel(-1);
end;

procedure TfrmCadFPAS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlFPAS);
  inherited;
end;

procedure TfrmCadFPAS.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadFPAS.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadFPAS.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  CdsDet.FieldByName('IDFPAS').asInteger := Cds.FieldByName('IDFPAS').asInteger;
  CdsDet.FieldByName('PERCCONVPREVID').Clear;
  CdsDet.FieldByName('DESCRICAO').Clear;
end;

procedure TfrmCadFPAS.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadFPAS.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(false);
end;

procedure TfrmCadFPAS.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(false);
end;

procedure TfrmCadFPAS.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(true);
end;

procedure TfrmCadFPAS.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadFPAS.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert, dsEdit]) and (dbedCodigoDet.CanFocus) then
    dbedCodigoDet.SetFocus;
end;

procedure TfrmCadFPAS.bbtnOkDetClick(Sender: TObject);
begin
  if (Trim(dbedCodigoDet.Text) = '') then
  begin
    MsgDlg('Digite o Código.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dbedCodigoDet.SetFocus;
  end
  else
  if (Trim(dbedDescrDet.Text) = '') then
  begin
    MsgDlg('Digite a Descrição.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dbedDescrDet.SetFocus;
  end
  else
  if (Trim(edtCodTerceiros.Text) = '') then          // Higor SOL 229353-16212 / PPM 434575
  begin
    //MsgDlg('Preencha o Código de Terceiros', 'Aviso', mtWarning, [mbOk,mbHelp], 0); //Michelle Mota - SOL: 259921.18014 - PPM: 1217940
    MsgDlg('Preencha o Código de Terceiros (eSocial).', 'Aviso', mtWarning, [mbOk,mbHelp], 0);//Michelle Mota - SOL: 259921.18014 - PPM: 1217940
    edtCodTerceiros.SetFocus;
  end
  else //Michelle Mota - SOL: 259921.18014 - PPM: 1217940
    inherited;
end;

procedure TfrmCadFPAS.bbtnConfirmarClick(Sender: TObject);
var
  bInserindo: boolean;
begin
  if (Trim(dbedCodigo.Text) = '') then
  begin
    MsgDlg('Preencha o Código.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedCodigo.SetFocus;
  end
  else
  if (Trim(dbedDescr.Text) = '') then
  begin
    MsgDlg('Preencha a Descrição.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedDescr.SetFocus;
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

procedure TfrmCadFPAS.Sel(IdFPAS: integer);
begin
  Cds.Data := CtrlFPAS.ListMestre(IdFPAS);
  CdsDet.Data := CtrlFPAS.ListDetalhe(IdFPAS);
end;

function TfrmCadFPAS.GravarRegistro(Exclusao: boolean): boolean;
begin
  if (Exclusao) then
    Result := CtrlFPAS.Excluir
  else
    Result := CtrlFPAS.Gravar;

  if not(Result) then
    raise exception.Create(CtrlFPAS.MessageInfo);
end;

// Higor SOL 229353-16212 / PPM 434575
procedure TfrmCadFPAS.edtCodTerceirosKeyPress(Sender: TObject;
  var Key: Char);
begin
  If not( key in['0'..'9',#08] ) then
     key:=#0;
  inherited;
end;

// Higor SOL 229353-16212 / PPM 434575
procedure TfrmCadFPAS.sbtnExcluiDetClick(Sender: TObject);
begin

  if (MsgDlg('Deseja realmente excluir este registro?', 'Informação', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
  inherited;

end;

end.
