//******************************************************************************
// Data      : 19/07/2007
// Código    : AL_1
// Desc      : Acerto no refresh após inserir e cancelar
//******************************************************************************

unit FCadMotivoBloqueioMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTInv, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  fcLabel, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ExtCtrls, uCtrlPadroes, uMensErro, uSistema, uCMTypes,
  DBaseDados, uCtrlInvestimento, uCmSqlParams, Mask, wwdbedit,
  //AL_1
  Menus, faMensagem;

type
  TfrmCadMotivoBloqueioMT = class(TFrmCadastroGridMTInv)
    LbLDescParamEmissor: TLabel;
    dbeDescricao: TwwDBEdit;
    Label2: TLabel;
    dbeSigla: TwwDBEdit;
    CMSqlParams1: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    //AL_1
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlInvestimento  : TCtrlInvestimento;
    procedure Seleciona(iIdMotivo : Integer = -1);

  public
    { Public declarations }
  end;

var
  frmCadMotivoBloqueioMT: TfrmCadMotivoBloqueioMT;

implementation

{$R *.DFM}

procedure TfrmCadMotivoBloqueioMT.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlInvestimento := TCtrlInvestimento.Create;
   CtrlInvestimento.InitializeAs(Padroes);
   CtrlInvestimento.CdsMotivoBloqueio := cds;
   Seleciona;
end;

procedure TfrmCadMotivoBloqueioMT.Seleciona(iIdMotivo: Integer = -1);
begin
  cds.Data := CtrlInvestimento.ListMotivoBloqueio;
end;

procedure TfrmCadMotivoBloqueioMT.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := True;
  if CmeCadastro.Operacao in [OpInserir,OpAlterar] then;
  begin
     if Trim(dbeDescricao.Text) = '' then
     begin
        MsgDlg('Descrição não Informada.','Atenção' ,MtWarning,[mbok],0);
        if dbeDescricao.CanFocus then
           dbeDescricao.SetFocus;
        Accept := False;
     end
     else if Trim(dbeSigla.Text) = '' then
     begin
        MsgDlg('Sigla não Informada.','Atenção' ,MtWarning,[mbok],0);
        if dbeSigla.CanFocus then
           dbeSigla.SetFocus;
        Accept := False;
     end;
  end;
end;

procedure TfrmCadMotivoBloqueioMT.bbtnConfirmarClick(Sender: TObject);
begin
   CmeCadastro.RepetirInsert := False;
  inherited;
end;

procedure TfrmCadMotivoBloqueioMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   FreeAndNil(CtrlInvestimento);
end;

procedure TfrmCadMotivoBloqueioMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
   Accept := CtrlInvestimento.AplicaAtualMotivoBloqueio;
   if not Accept then
      MsgDlg('Ocorreu um erro na gravação do Registro.' + #13 +
             'Motivo: ' + CtrlInvestimento.MessageInfo,'Erro',mtError,[mbOk],0);
  inherited;
   Seleciona;
end;

procedure TfrmCadMotivoBloqueioMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
   begin
      Seleciona(StrToInt(MontaSelect.ValoresChave[0]));
      Cds.Locate('IDMOTIVOBLOQUEIO',MontaSelect.ValoresChave[0],[]);
   end;
end;

procedure TfrmCadMotivoBloqueioMT.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
   if dbeDescricao.CanFocus then
      dbeDescricao.SetFocus;
end;

procedure TfrmCadMotivoBloqueioMT.sbtnInserirClick(Sender: TObject);
begin
  inherited;
   if dbeDescricao.CanFocus then
      dbeDescricao.SetFocus;
end;

//AL_1
procedure TfrmCadMotivoBloqueioMT.bbtnCancelarClick(Sender: TObject);
begin
   Seleciona;
  inherited;
end;

end.
