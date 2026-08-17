{-------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
Nº SOL............: 229878.16779
Nº PPM............: 610132
Data da Alteração.: 25/02/2015
Responsável.......: William Santana
Descrição.........: Desenvolvimento do produto referente ao SOL 229878. 
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------}
unit fCadCNAE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask,
  DBCtrls, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97,
  TB97Ctls, MAHlpBtn, TB97Tlbr, Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, ExtCtrls,
  ImgList, TabControlDetalhe, CmEventosCadastro, FCadastroMestreDetMT, DBClient,
  uCMClientDataSet, uCtrlCNAE;

type
  TfrmCadCNAE = class(TFrmCadastroMestreDetMT)
    dbedCodigo: TDBEdit;
    dbedDescr: TDBEdit;
    Label2: TLabel;
    Label1: TLabel;
    dbedDescrDet: TDBEdit;
    Label3: TLabel;
    dbedCodigoDet: TDBEdit;
    Label4: TLabel;
    CdsDet: TCMClientDataSet;
    dbeAliquota: TDBEdit;
    lblAliquota: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure dsDetStateChange(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure ValidaKeyDecimal(Sender: TObject; var Key: Char); //William Santana - SOL 229878.16779 PPM 610132
  private
    CtrlCNAE: TCtrlCNAE;
    
    procedure Sel(IdCatCNAE: integer);
    function  GravarRegistro(Exclusao: boolean): boolean;

  end;

var
  frmCadCNAE: TfrmCadCNAE;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadCNAE.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlCNAE := TCtrlCNAE.Create;
  CtrlCNAE.InitializeAs(Padroes);
  CtrlCNAE.Cds := Cds;  
  CtrlCNAE.CdsDet := CdsDet;
  Sel(-1);
end;

procedure TfrmCadCNAE.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlCNAE);
  inherited;
end;

procedure TfrmCadCNAE.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadCNAE.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadCNAE.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  CdsDet.FieldByName('IDCATCNAE').asInteger := Cds.FieldByName('IDCATCNAE').asInteger;
  CdsDet.FieldByName('IDITEMCNAE').Clear;
  CdsDet.FieldByName('DESCRICAO').Clear;
end;

procedure TfrmCadCNAE.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadCNAE.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(false);
end;

procedure TfrmCadCNAE.CmeCadastroApplyEdit(sender: TObject;var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(false);
end;

procedure TfrmCadCNAE.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(true);
end;

procedure TfrmCadCNAE.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadCNAE.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert, dsEdit]) and (dbedCodigoDet.CanFocus) then
    dbedCodigoDet.SetFocus;
end;

procedure TfrmCadCNAE.bbtnOkDetClick(Sender: TObject);
begin
  if (Trim(dbedCodigoDet.Text) = '') then
  begin
   // MsgDlg('Digite o Código.', 'Aviso', mtWarning, [mbOk,mbHelp], 0); //William Santana - SOL 229878.16779 PPM 610132
    MsgDlg('Preencha o Código.', 'Aviso', mtWarning, [mbOk,mbHelp], 0); //William Santana - SOL 229878.16779 PPM 610132
    dbedCodigoDet.SetFocus;
  end
  else
  if (Trim(dbedDescrDet.Text) = '') then
  begin
   // MsgDlg('Digite a Descrição.', 'Aviso', mtWarning, [mbOk,mbHelp], 0); //William Santana - SOL 229878.16779 PPM 610132
    MsgDlg('Preencha o Descrição.', 'Aviso', mtWarning, [mbOk,mbHelp], 0); //William Santana - SOL 229878.16779 PPM 610132
    dbedDescrDet.SetFocus;
  end
  //Início - William Santana - SOL 229878.16779 PPM 610132
  else
  if (Trim(dbeAliquota.Text) = '') then
  begin
    MsgDlg('Preencha a Alíquota', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dbeAliquota.SetFocus;
  end
  //Término - William Santana - SOL 229878.16779 PPM 610132
  else
    inherited;
end;

procedure TfrmCadCNAE.bbtnConfirmarClick(Sender: TObject);
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
  //Início - William Santana - SOL 229878.16779 PPM 610132
  else
  if (Trim(dbeAliquota.Text) = '') then
  begin
    MsgDlg('Preencha a Alíquota', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dbeAliquota.SetFocus;
  end
  //Término - William Santana - SOL 229878.16779 PPM 610132
  else
  begin
    bInserindo := (Cds.State = dsInsert);
    inherited;
    if not(bInserindo) then
      CmeCadastroFind(Sender);
  end;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmCadCNAE.Sel(IdCatCNAE: integer);
begin
  Cds.Data := CtrlCNAE.ListMestre(IdCatCNAE);
  CdsDet.Data := CtrlCNAE.ListDetalhe(IdCatCNAE);
end;

function TfrmCadCNAE.GravarRegistro(Exclusao: boolean): boolean;
begin
  if (Exclusao) then
    Result := CtrlCNAE.Excluir
  else
    Result := CtrlCNAE.Gravar;

  if not(Result) then
    raise exception.Create(CtrlCNAE.MessageInfo);
end;

//Início - William Santana - SOL 229878.16779 PPM 610132
procedure TfrmCadCNAE.ValidaKeyDecimal(Sender: TObject; var Key: Char);
begin
  if (key in ['0' .. '9', ',', #8, #13, DecimalSeparator]) then
  begin
   if (Key = DecimalSeparator) and
      (Pos(DecimalSeparator, TEdit(Sender).Text) > 0) then
         Key := #0;
  end
  else Key := #0;
end;
//Término - William Santana - SOL 229878.16779 PPM 610132

end.
