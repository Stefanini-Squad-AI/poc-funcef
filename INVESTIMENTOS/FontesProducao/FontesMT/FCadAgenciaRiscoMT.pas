//******************************************************************************
// Data     : 23/07/2007
// Pendencia: 24875
// Desc     :  Implementação de Agência de Risco
//******************************************************************************
unit FCadAgenciaRiscoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCtrlInvestimento,uCtrlPadroes,uMensErro,uCMTypes, FCadastroGridMTInv,
  Menus, MontaSelect, Db, DBClient, uCMClientDataSet, CmEventosCadastro,
  ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti, fcLabel, faMensagem,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, uCmSqlParams, Mask, wwdbedit;


type
  TFrmCadAgenciaRiscoMT = class(TFrmCadastroGridMTInv)
    CMSqlParams1: TCMSqlParams;
    dbeDescricao: TwwDBEdit;
    LbLDescParamEmissor: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlInvestimento: TCtrlInvestimento;
    Procedure Seleciona(iIdAgenciaRisco: Integer = -1);

  public
    { Public declarations }
    iIdAgenciaAnt: Integer;
  end;

var
  FrmCadAgenciaRiscoMT: TFrmCadAgenciaRiscoMT;

implementation

{$R *.DFM}

procedure TFrmCadAgenciaRiscoMT.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlInvestimento := TCtrlInvestimento.Create;
   CtrlInvestimento.InitializeAs(Padroes);
   CtrlInvestimento.CdsAgenciaRisco := Cds;
   Seleciona;
end;

procedure TFrmCadAgenciaRiscoMT.Seleciona(iIdAgenciaRisco: Integer = -1);
begin
   Cds.Data := CtrlInvestimento.ListAgenciaRisco;
   If iIdAgenciaRisco > 0 then
     Cds.Locate('IDAGENCIARISCO',iIdAgenciaRisco,[])
end;

procedure TFrmCadAgenciaRiscoMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
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
      end;
   end;
end;

procedure TFrmCadAgenciaRiscoMT.sbtnInserirClick(Sender: TObject);
begin
   If Not Cds.IsEmpty then
     iIdAgenciaAnt := cds.FieldByName('IDAGENCIARISCO').AsInteger;
   inherited;
   if dbeDescricao.CanFocus then
       dbeDescricao.SetFocus;
end;

procedure TFrmCadAgenciaRiscoMT.sbtnAlterarClick(Sender: TObject);
begin
   if Not Cds.IsEmpty then
     iIdAgenciaAnt := cds.FieldByName('IDAGENCIARISCO').AsInteger;
   inherited;
   if dbeDescricao.CanFocus then
       dbeDescricao.SetFocus;
end;

procedure TFrmCadAgenciaRiscoMT.sbtnApagarClick(Sender: TObject);
begin
   if Not Cds.IsEmpty then
     iIdAgenciaAnt := cds.FieldByName('IDAGENCIARISCO').AsInteger;
   inherited;
   Seleciona(iIdAgenciaAnt);
end;

procedure TFrmCadAgenciaRiscoMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin

   Accept := CtrlInvestimento.AplicaAgenciaRisco;

   If CmeCadastro.Operacao in [OpInserir] then
     iIdAgenciaAnt := CtrlInvestimento.IdAgenciaRisco;

   if not Accept then
      MsgDlg('Ocorreu um erro na gravação do Registro.' + #13 +
                'Motivo: ' + CtrlInvestimento.MessageInfo,'Mensagem do Sistema',mtwarning,[mbOk],0);
   inherited;

   Seleciona(iIdAgenciaAnt);

end;

procedure TFrmCadAgenciaRiscoMT.bbtnConfirmarClick(Sender: TObject);
begin
   CmeCadastro.RepetirInsert := False;
   inherited;
   Seleciona(iIdAgenciaAnt);
end;

procedure TFrmCadAgenciaRiscoMT.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   Seleciona(iIdAgenciaAnt);
end;

procedure TFrmCadAgenciaRiscoMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
      Cds.Locate('IDAGENCIARISCO',MontaSelect.ValoresChave[0],[]);
end;

procedure TFrmCadAgenciaRiscoMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlInvestimento);
end;

end.
