//******************************************************************************
// Data      : 01/08/2007
// Código    : AL_131
// Pendencia : 26012
// SOL       :
// Motivo    : Implementações do cadastro de CarteiraInvest em 3 camadas
//             Passa a não obrigar o Tipo de Investimento na Carteira para que a carteira
//             possa ter vários segmentos
//******************************************************************************

unit FCadCarteiraInvestMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTInv, Menus, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  fcLabel, faMensagem, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls,
  TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, uCtrlInvestimento, DBCtrls,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, Mask, wwdbedit,uCtrlPadroes,
  uMensErro, uCmSqlParams;

type
  TFrmCadCarteiraInvestMT = class(TFrmCadastroGridMTInv)
    Label2: TLabel;
    DBENomeCarteira: TwwDBEdit;
    Label7: TLabel;
    DbLkTipoInvestimento: TwwDBLookupCombo;
    Label9: TLabel;
    DbLkTipoMercado: TwwDBLookupCombo;
    lblConselheiro: TLabel;
    dblkConselheiro: TwwDBLookupCombo;
    DBLkPatro: TwwDBLookupCombo;
    DBLkPlano: TwwDBLookupCombo;
    Label6: TLabel;
    DBLkGestor: TwwDBLookupCombo;
    Label1: TLabel;
    Label3: TLabel;
    dbdtDataInicio: TCMDateTimePicker;
    DBCkBCartProp: TDBCheckBox;
    DBCkBFLGCARTTERC: TDBCheckBox;
    dbckCartLastro: TDBCheckBox;
    DBCkBOrdemMov: TDBCheckBox;
    DbRdAtualiza: TDBRadioGroup;
    Label5: TLabel;
    CMSqlParams1: TCMSqlParams;
    dbckContabiliza: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
  private
    { Private declarations }
    CtrlInvestimento : TCtrlInvestimento;
    procedure Seleciona(iIdCarteira : Integer = -1);
    procedure AtualizaCheckBox;
  public
    { Public declarations }
  end;

var
  FrmCadCarteiraInvestMT: TFrmCadCarteiraInvestMT;

implementation

{$R *.DFM}

procedure TFrmCadCarteiraInvestMT.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlInvestimento := TCtrlInvestimento.Create;
   CtrlInvestimento.InitializeAs(Padroes);
   CtrlInvestimento.CdsCarteiraInvest := cds;
   Seleciona;
end;

procedure TFrmCadCarteiraInvestMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   FreeAndNil(CtrlInvestimento);
end;

procedure TFrmCadCarteiraInvestMT.Seleciona(iIdCarteira : Integer = -1);
begin
   cds.Data := CtrlInvestimento.ListCarteira(-1, -1, 0);
end;

procedure TFrmCadCarteiraInvestMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
   Accept := CtrlInvestimento.AplicaAtualCarteiraInvest;

   if not Accept then
      MsgDlg('Ocorreu um erro na gravação do Registro.' + #13 +
             'Motivo: ' + CtrlInvestimento.MessageInfo,'Atenção',mtWarning,[mbOk],0);
  inherited;
end;

procedure TFrmCadCarteiraInvestMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
   begin
      Seleciona(StrToInt(MontaSelect.ValoresChave[0]));
      Cds.Locate('IDCARTEIRAINVEST',MontaSelect.ValoresChave[0],[]);
   end;
end;

procedure TFrmCadCarteiraInvestMT.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
   CMeCadastroFind(Sender)
end;

procedure TFrmCadCarteiraInvestMT.sbtnInserirClick(Sender: TObject);
begin
  inherited;
   if DBENomeCarteira.CanFocus then
      DBENomeCarteira.SetFocus;
   cds.FieldByName('FLGCARTPROP').AsInteger   := 0;
   cds.FieldByName('FLGCALCDIARIO').AsInteger := 0;
   cds.FieldByName('FLGTRATALOTE').AsString   := 'N';
   cds.FieldByName('FLGORDMOVINV').AsString   := 'N';
   cds.FieldByName('FLGCARTLASTRO').AsString  := 'N';
   cds.FieldByName('FLGCARTTERC').AsString    := 'N';
   AtualizaCheckBox;
end;

procedure TFrmCadCarteiraInvestMT.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
   if DBENomeCarteira.CanFocus then
      DBENomeCarteira.SetFocus;
   AtualizaCheckBox;
end;

procedure TFrmCadCarteiraInvestMT.AtualizaCheckBox;
begin
   DBCkBCartProp.Checked    := (cds.FieldByName('FLGCARTPROP').AsString = '1');
   DBCkBFLGCARTTERC.Checked := (cds.FieldByName('FLGCARTTERC').AsString = 'S');
   dbckCartLastro.Checked   := (cds.FieldByName('FLGCARTLASTRO').AsString = 'S');
   DBCkBOrdemMov.Checked    := (cds.FieldByName('FLGORDMOVINV').AsString = 'S');
   dbckContabiliza.Checked  := (cds.FieldByName('FLGCONTABILIZA').AsString = 'S');
end;

procedure TFrmCadCarteiraInvestMT.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := False;
  if Trim(DBENomeCarteira.Text) = '' then
  begin
     MsgDlg('Nome da Carteira de Investimento não Informado','Atenção' ,MtWarning,[mbok],0);
     if DBENomeCarteira.CanFocus then
        DBENomeCarteira.SetFocus;
     Exit;
  end
  else if Trim(dbdtDataInicio.Text) = '' then
  begin
     MsgDlg('Data de Inicio não pode estar vazia.','Atenção',mtWarning,[mbOK],0);
     if dbdtDataInicio.CanFocus then
        dbdtDataInicio.SetFocus;
     Exit;
  end
  else
     Accept := True;
end;

procedure TFrmCadCarteiraInvestMT.bbtnConfirmarClick(Sender: TObject);
begin
    CmeCadastro.RepetirInsert := False;
  inherited;
end;

procedure TFrmCadCarteiraInvestMT.bbtnCancelarClick(Sender: TObject);
begin
   Seleciona;
  inherited;
end;

procedure TFrmCadCarteiraInvestMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
   AtualizaCheckBox;
end;

end.
