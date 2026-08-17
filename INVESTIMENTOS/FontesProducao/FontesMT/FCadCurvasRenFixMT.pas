//******************************************************************************
// Data      : 19/07/2007
// Código    : AL_1
// Pendencia :
// SOL       :
// Desc      : Acerto no refresh após inserir e cancelar
//******************************************************************************
unit FCadCurvasRenFixMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTInv, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  fcLabel, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ExtCtrls,
  uCtrlRendaFixa, uCtrlPadroes,DBaseDados, uMensErro, uSistema,
  uCmSqlParams, Mask, wwdbedit,
  //AL_1
  Menus, faMensagem;

type
  TFrmCadCurvasRenFixMT = class(TFrmCadastroGridMTInv)
    lblPerfil: TLabel;
    dbeDescCurvasRenFix: TwwDBEdit;
    CMSqlParams1: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    //AL_1
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlRendaFixa     : TCtrlRendaFixa;
    sSql : String;
    //AL_1
    procedure Seleciona(iIdCurvaRenfix: Integer = -1);
    procedure MensErroTela(sMsg: string);

  public
    { Public declarations }
  end;

var
  FrmCadCurvasRenFixMT: TFrmCadCurvasRenFixMT;

implementation

{$R *.DFM}

procedure TFrmCadCurvasRenFixMT.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlRendaFixa := TCtrlRendaFixa.Create;
   CtrlRendaFixa.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                             Sistema.ConnectionSide, Sistema.AppRemoteServer, True );

   CtrlRendaFixa.CdsCurvaRenFix := cds;
   //AL_1
   Seleciona;
end;

procedure TFrmCadCurvasRenFixMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   FreeAndNil(CtrlRendaFixa);
end;

//AL_1
procedure TFrmCadCurvasRenFixMT.Seleciona(iIdCurvaRenfix : Integer = -1);
begin
  cds.Data := CtrlRendaFixa.ListCurvaRenFix;
end;

procedure TFrmCadCurvasRenFixMT.MensErroTela(sMsg: string);
begin
   MsgDlg(sMsg, 'Aviso', mtWarning, [mbOK], 0)
end;

procedure TFrmCadCurvasRenFixMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
   Accept := CtrlRendaFixa.AplicaAtualCurvaRenFix;
  inherited;
   //AL_1
   Seleciona;
end;

procedure TFrmCadCurvasRenFixMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
   begin
      Seleciona(StrToInt(MontaSelect.ValoresChave[0]));
      Cds.Locate('IDCURVARENFIX',MontaSelect.ValoresChave[0],[]);
   end;
end;

procedure TFrmCadCurvasRenFixMT.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  CMeCadastroFind(Sender)
end;

procedure TFrmCadCurvasRenFixMT.sbtnInserirClick(Sender: TObject);
begin
   inherited;
   if dbeDescCurvasRenFix.CanFocus then
      dbeDescCurvasRenFix.SetFocus;
end;

procedure TFrmCadCurvasRenFixMT.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
   if dbeDescCurvasRenFix.CanFocus then
      dbeDescCurvasRenFix.SetFocus;
end;

procedure TFrmCadCurvasRenFixMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := False;
  if Trim(dbeDescCurvasRenFix.Text) = '' then
  begin
     MsgDlg('Falta a descrição do Classe.', 'Warning', mtWarning, [mbOk], 0);
     if dbeDescCurvasRenFix.CanFocus then
        dbeDescCurvasRenFix.SetFocus;
     Exit;
  end;
  Accept := True;
end;

procedure TFrmCadCurvasRenFixMT.FormShow(Sender: TObject);
begin
  inherited;
   //AL_1
   Seleciona;
end;

procedure TFrmCadCurvasRenFixMT.bbtnConfirmarClick(Sender: TObject);
begin
   CmeCadastro.RepetirInsert := False;
  inherited;
end;

//AL_1
procedure TFrmCadCurvasRenFixMT.bbtnCancelarClick(Sender: TObject);
begin
   Seleciona;
  inherited;
end;

end.
