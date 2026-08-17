//******************************************************************************
// Data     : 24/01/2007
// Código   : AL_2
// Pendencia: 24238
// Desc     : Ao alterar+cancelar não volta para o mercado selecionado
//            Ao incluir 2 vezes está dando erro de Pk.
//            Ao Incluir+Confirmar ou Incluir+Cancelar não volta para o incluído
//******************************************************************************
// Data     : 18/01/2007
// Código   : AL_1
// Pendencia: 24238
// Desc     : acertando ao clicar em cancelar, pois o grid retornava vazio
//******************************************************************************
unit FCadMercadoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTInv, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  fcLabel, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ExtCtrls, uCmSqlParams, uMensErro, uSistema, uCMTypes,
  DBaseDados, Mask, wwdbedit, wwdblook, uCtrlInvestimento, uCtrlPadroes,
  //AL_2
  Menus, faMensagem;

type
  TfrmCadMercadoMT = class(TFrmCadastroGridMTInv)
    CMSqlParams1: TCMSqlParams;
    Label2: TLabel;
    dblTipoInvest: TwwDBLookupCombo;
    Label1: TLabel;
    dbeMercado: TwwDBEdit;
    CdsTipoInvest: TCMClientDataSet;
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    //AL_2
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    //AL_2
    procedure CmeCadastroCancel(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure dbGrdDblClick(Sender: TObject);
  private
    { Private declarations }
    CtrlInvestimento  : TCtrlInvestimento;
    //AL_2
    procedure Seleciona(iIdMercado: Integer = -1);

  public
    { Public declarations }
    //AL_2
    iIdMercadoAnt: Integer;

  end;

var
  frmCadMercadoMT: TfrmCadMercadoMT;

implementation

{$R *.DFM}

{ TfrmCadMercadoMT }

procedure TfrmCadMercadoMT.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlInvestimento := TCtrlInvestimento.Create;
   CtrlInvestimento.InitializeAs(Padroes);
   CtrlInvestimento.CdsMercado := cds;
   CdsTipoInvest.Data          := CtrlInvestimento.ListTipoInvest;
   Seleciona;
end;

procedure TfrmCadMercadoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlInvestimento);
end;

//AL_2
procedure TfrmCadMercadoMT.Seleciona(iIdMercado: Integer = -1);
begin
  cds.Data := CtrlInvestimento.ListMercado;
  If iIdMercado > 0 then
   Cds.Locate('IDMERCADO',iIdMercado,[lopartialkey]);
end;

//AL_2
procedure TfrmCadMercadoMT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin

  Accept := CtrlInvestimento.AplicaAtualMercado;  
  If CmeCadastro.Operacao in [OpInserir] then
     iIdMercadoAnt := CtrlInvestimento.IdMercado;

  if not Accept then
  begin
    If Pos('XPK' , uppercase(CtrlInvestimento.MessageInfo)) > 0 then
        MsgDlg('Usuário já Cadastrado!','Mensagem do Sistema',mtwarning,[mbOk],0)
     else
        MsgDlg('Ocorreu um erro na gravação do Registro.' + #13 +
               'Motivo: ' + CtrlInvestimento.MessageInfo,'Mensagem do Sistema',mtWarning,[mbOk],0);
    exit;
  end;

  inherited;

end;

procedure TfrmCadMercadoMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
   begin
      Seleciona(StrToInt(MontaSelect.ValoresChave[0]));
      Cds.Locate('IDMERCADO',MontaSelect.ValoresChave[0],[]);
   end;
end;

//AL_2
procedure TfrmCadMercadoMT.sbtnInserirClick(Sender: TObject);
begin
  //AL_2
  If Not Cds.IsEmpty then
    iIdMercadoAnt:= Cds.fieldbyname('idmercado').asinteger;

  inherited;
   if dblTipoInvest.CanFocus then
      dblTipoInvest.SetFocus;
end;

procedure TfrmCadMercadoMT.sbtnAlterarClick(Sender: TObject);
begin
  //AL_2
  If Not Cds.IsEmpty then
    iIdMercadoAnt:= Cds.fieldbyname('IDMERCADO').asinteger;

  inherited;
   if dblTipoInvest.CanFocus then
      dblTipoInvest.SetFocus;
end;

procedure TfrmCadMercadoMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := True;
  //AL_2
  if CmeCadastro.Operacao in [OpInserir,OpAlterar] then
  begin
     if Trim(dbeMercado.Text) = '' then
     begin
        MsgDlg('Descrição não Informada','Atenção' ,MtWarning,[mbok],0);
        if dbeMercado.CanFocus then
           dbeMercado.SetFocus;
        Accept := False;
     end
     else if Trim(dblTipoInvest.Text) = '' then
     begin
        MsgDlg('Tipo de Investimento não Informado','Atenção' ,MtWarning,[mbok],0);
        if dblTipoInvest.CanFocus then
           dblTipoInvest.SetFocus;
        Accept := False;
     end;
  end;
end;

procedure TfrmCadMercadoMT.bbtnConfirmarClick(Sender: TObject);
begin
  CmeCadastro.RepetirInsert := False;
  inherited;
  //AL_2
  Seleciona(iIdMercadoAnt);
end;

//AL_1
procedure TfrmCadMercadoMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  Seleciona(iIdMercadoAnt);
end;

//AL_1
procedure TfrmCadMercadoMT.sbtnApagarClick(Sender: TObject);
begin
  //AL_2
  If Not Cds.IsEmpty then
    iIdMercadoAnt:= Cds.fieldbyname('IDMERCADO').asinteger;
  inherited;
   Seleciona(iIdMercadoAnt);
end;

//AL_1
procedure TfrmCadMercadoMT.dbGrdDblClick(Sender: TObject);
begin
  //AL_2
  If Not Cds.IsEmpty then
    iIdMercadoAnt:= Cds.fieldbyname('IDMERCADO').asinteger;
  inherited;
  if dblTipoInvest.CanFocus then
      dblTipoInvest.SetFocus;
end;

end.
