//******************************************************************************
// Data      : 19/07/2007
// Código    : AL_1
// Pendencia :
// SOL       :
// Desc      : Acerto no refresh após inserir e cancelar
//******************************************************************************
unit FCadClassRiscoRenFixMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTInv, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  fcLabel, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ExtCtrls, fcCombo, fcColorCombo, Wwdbspin, Mask,
  wwdbedit, uCmSqlParams, uMensErro, uSistema, uCMTypes, uCtrlRendaFixa,
  DBaseDados, uCtrlPadroes,
  //AL_1
  Menus, faMensagem;

type
  TfrmCadClassRiscoRenFixMT = class(TFrmCadastroGridMTInv)
    CMSqlParams1: TCMSqlParams;
    Label1: TLabel;
    dbeNome: TwwDBEdit;
    dbsNivel: TwwDBSpinEdit;
    Label2: TLabel;
    Label3: TLabel;
    dbcCor: TfcColorCombo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    //AL_1
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlRendaFixa     : TCtrlRendaFixa;
    procedure Seleciona(iIdClasse : Integer = -1);

  public
    { Public declarations }
  end;

var
  frmCadClassRiscoRenFixMT: TfrmCadClassRiscoRenFixMT;

implementation


{$R *.DFM}

procedure TfrmCadClassRiscoRenFixMT.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlRendaFixa := TCtrlRendaFixa.Create;
   CtrlRendaFixa.InitializeAs(Padroes);
   CtrlRendaFixa.CdsClassRiscoRenFix := cds;
   Seleciona;
end;

procedure TfrmCadClassRiscoRenFixMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   FreeAndNil(CtrlRendaFixa);
end;

procedure TfrmCadClassRiscoRenFixMT.Seleciona(iIdClasse : Integer = -1);
begin
  cds.Data := CtrlRendaFixa.ListClassRiscoRenFix;
end;

procedure TfrmCadClassRiscoRenFixMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
   Accept := CtrlRendaFixa.AplicaAtualClassRiscoRenFix;
   if not Accept then
      MsgDlg('Ocorreu um erro na gravação do Registro.' + #13 +
             'Motivo: ' + CtrlRendaFixa.MessageInfo,'Erro',mtError,[mbOk],0);
  inherited;
   Seleciona;
end;

procedure TfrmCadClassRiscoRenFixMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
   begin
      Seleciona(StrToInt(MontaSelect.ValoresChave[0]));
      Cds.Locate('IDCLASSRISCORENFIX',MontaSelect.ValoresChave[0],[]);
   end;
end;

procedure TfrmCadClassRiscoRenFixMT.CmeCadastroAfterConfirma(
  Sender: TObject);
begin
  inherited;
    CMeCadastroFind(Sender)
end;

procedure TfrmCadClassRiscoRenFixMT.sbtnInserirClick(Sender: TObject);
begin
  inherited;
   if dbeNome.CanFocus then
      dbeNome.SetFocus;
end;

procedure TfrmCadClassRiscoRenFixMT.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
   if dbeNome.CanFocus then
      dbeNome.SetFocus;
end;

procedure TfrmCadClassRiscoRenFixMT.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept :=((Trim( dbeNome.Text) <> '') and (CmeCadastro.Operacao in [OpInserir,OpAlterar]));

  If not Accept Then
    MsgDlg('Descrição não Informada','Atenção' ,MtWarning,[mbok],0);
end;

procedure TfrmCadClassRiscoRenFixMT.bbtnConfirmarClick(Sender: TObject);
begin
   CmeCadastro.RepetirInsert := False;
  inherited;
end;

//AL_1
procedure TfrmCadClassRiscoRenFixMT.bbtnCancelarClick(Sender: TObject);
begin
   Seleciona;
  inherited;
end;

end.
