//******************************************************************************
// Autor     : Fabio Fagundes
// Data      : 31/01/2006
// Código    : AL_1
// Motivo    : Implementação do Form
//******************************************************************************

unit FCadClassifAnbid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMTInv, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, fcLabel, ExtCtrls,
  ComCtrls, Mask, wwdbedit, Wwdotdot, Wwdbcomb,
  DBaseDados, uMensErro, uSistema, uCMTypes, uCmSqlParams,
  uInvestimento, uCtrlRendaFixa, uCtrlPadroes, uCtrlFundos;

type
  TFrmCadClassifAnbid = class(TFrmCadastroMTInv)
    pnlDtVigencia: TPanel;
    dbeDtVigencia: TwwDBComboBox;
    lblDtVigencia: TLabel;
    pnlTreeView: TPanel;
    Dock973: TDock97;
    tb97BotoesDetalhe: TToolbar97;
    BtInserir: TSpeedButton;
    BtAlterar: TSpeedButton;
    BtExcluir: TSpeedButton;
    TreeView: TTreeView;
    ImageListTreeView: TImageList;
    CMSqlParams1: TCMSqlParams;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
  private
    CtrlFundos     : TCtrlFundos;  
    procedure MontaTreeView;
    procedure Seleciona(iIdClassifAnbid: Integer = -1; dDtVigencia : TDateTime = 0);
    { Private declarations }
  public
    { Public declarations }
  end;
    pItem = ^TItem;
    TItem = record
       dDtVigencia      : TDateTime;
       sCodClassifAnbid : String;
       sDesClassifAnbid : String;
       sClassifAnalit   : String;
       sCodNivel        : String;
    end;

var
  FrmCadClassifAnbid: TFrmCadClassifAnbid;


implementation

{$R *.DFM}

procedure TFrmCadClassifAnbid.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
   begin
      MontaTreeView;
   end;
end;

procedure TFrmCadClassifAnbid.MontaTreeView;
Var
  wItem: pItem;
  nTreeNode1, nTreeNode2: TTreeNode;
Begin
   TreeView.Items.Clear;
   nTreeNode1 := nil;
   nTreeNode2 := nil;
end;

procedure TFrmCadClassifAnbid.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlFundos := TCtrlFundos.Create;
   CtrlFundos.InitializeAs(Padroes);
   CtrlFundos.CdsClassifAnbid := cds;
   Seleciona;
end;

procedure TFrmCadClassifAnbid.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   FreeAndNil(CtrlFundos);
end;

procedure TFrmCadClassifAnbid.Seleciona(iIdClassifAnbid : Integer = -1; dDtVigencia : TDateTime = 0);
begin
  cds.Data := CtrlFundos.ListClassifAnbid(iIdClassifAnbid, dDtVigencia);
end;

procedure TFrmCadClassifAnbid.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
   Accept := CtrlFundos.AplicaAtualClassifAnbid;
   if not Accept then
      MsgDlg('Ocorreu um erro na gravação do Registro.' + #13 +
             'Motivo: ' + CtrlFundos.MessageInfo,'Erro',mtError,[mbOk],0);
  inherited;
   Seleciona;
end;

procedure TFrmCadClassifAnbid.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
   begin
      Seleciona(StrToInt(MontaSelect.ValoresChave[0]));
      Cds.Locate('IDCLASSIFANBID',MontaSelect.ValoresChave[0],[]);
   end;
end;

procedure TFrmCadClassifAnbid.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
    CMeCadastroFind(Sender)
end;

procedure TFrmCadClassifAnbid.sbtnInserirClick(Sender: TObject);
begin
  inherited;
   if dbeDtVigencia.CanFocus then
      dbeDtVigencia.SetFocus;
//   Cds.FieldByName('FLGATIVA').AsString := 'N';
end;

procedure TFrmCadClassifAnbid.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
   if dbeDtVigencia.CanFocus then
      dbeDtVigencia.SetFocus;
end;

procedure TFrmCadClassifAnbid.bbtnConfirmarClick(Sender: TObject);
begin
   CmeCadastro.RepetirInsert := False;
  inherited;
end;

procedure TFrmCadClassifAnbid.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept :=((Trim( dbeDtVigencia.Text) <> '') and (CmeCadastro.Operacao in [OpInserir,OpAlterar]));

  If not Accept Then
    MsgDlg('Data de Vigência não Informada','Atenção' ,MtWarning,[mbok],0);
end;

end.
