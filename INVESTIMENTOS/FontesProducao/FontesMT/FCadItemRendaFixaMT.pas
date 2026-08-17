//******************************************************************************
// Data     : 08/11/2007
// Código   : AL_3
// Pendencia: 25684
// SOL      :
// Desc     : Permite a alteração do IDItemRenFix
//******************************************************************************
// Data     : 10/07/2007
// Código   : AL_2
// Pendencia: 25880
// SOL      :
// Desc     : Criação do novo tipo de item "Valor para Calculo" - Tipo N
//            para itens utilizados para cálculos intermediários nas regras
//******************************************************************************
// Data     : 08/02/2007
// Código   : AL_1
// Pendencia: 24453
// SOL      :
// Desc     : Implementação do Cadastro de Ítem de Renda Fixa (3 camadas)
//******************************************************************************

unit FCadItemRendaFixaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTInv, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Wwdotdot, Wwdbcomb, Mask, wwdbedit, fcLabel,
  uCtrlRendaFixa, uCtrlPadroes,DBaseDados, uMensErro, uSistema,
  uCmSqlParams, 
  //AL_1                       //AL_3
  Menus, faMensagem, uCMTypes, fTelaAut, uCtrlParamInvest;

type
  TFrmCadItemRendaFixaMT = class(TFrmCadastroGridMTInv)
    lblCodigoItem: TLabel;
    dbeCodigoItem: TwwDBEdit;
    lblDescItemRenFix: TLabel;
    dbeDescItemRenFix: TwwDBEdit;
    lblTipoItem: TLabel;
    dbTipoItem: TwwDBComboBox;
    CMSqlParams1: TCMSqlParams;
    Label1: TLabel;
    dbeIDItem: TwwDBEdit;
    pmnuIDItemRenFix: TPopupMenu;
    mnuGeraIDNeg: TMenuItem;
    mnuGeraIDPos: TMenuItem;
    N2: TMenuItem;
    mnuPermiteAlteracao: TMenuItem;
    cdsCopia: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure sbtnApagarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    //AL_1
    procedure CmeCadastroCancel(Sender: TObject);
    procedure dbGrdDblClick(Sender: TObject);
    procedure mnuGeraIDNegClick(Sender: TObject);
    procedure mnuGeraIDPosClick(Sender: TObject);
    procedure mnuPermiteAlteracaoClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlRendaFixa     : TCtrlRendaFixa;
    sAcao, sOldCodigo: String;

    //AL_3
    ItemRenFix: TParamRecI;
    Codigo: TParamRecS;

    bValida: Boolean;
    sSql : String;
    //AL_1
    procedure Seleciona(iIdItemRenfix : Integer = 0);

  public
    { Public declarations }
    //AL_1
    iIdItemRenfixAnt: Integer;
  end;

var
  FrmCadItemRendaFixaMT: TFrmCadItemRendaFixaMT;

implementation

uses FAutorizaParametros;

{$R *.DFM}

procedure TFrmCadItemRendaFixaMT.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlRendaFixa := TCtrlRendaFixa.Create;
   CtrlRendaFixa.InitializeAs(Padroes);
   CtrlRendaFixa.CdsItemRenFix := cds;
   Seleciona;
end;

procedure TFrmCadItemRendaFixaMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   FreeAndNil(CtrlRendaFixa);
end;

//AL_1
procedure TFrmCadItemRendaFixaMT.Seleciona(iIdItemRenfix : Integer = 0);
begin
  cds.Data := CtrlRendaFixa.ListItemRenFix;
  //AL_1
  If iIdItemRenfix <> 0 then
    Cds.Locate('IDITEMRENFIX',iIdItemRenfix,[lopartialkey]);
  //AL_3
  dbeIDItem.ReadOnly := True;
  Codigo.NewValue := '';
  Codigo.OldValue := '';
  ItemRenFix.NewValue := 0;
  ItemRenFix.OldValue := 0;
end;

procedure TFrmCadItemRendaFixaMT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
//AL_1
Var
  sDescricao: String;
begin
   //AL_1
   //AL_3
   Codigo.NewValue := Trim(dbeCodigoItem.Text);
   ItemRenFix.NewValue := Cds.fieldbyname('IDITEMRENFIX').AsInteger;
   sDescricao := Trim(dbeDescItemRenFix.Text);

   Accept := CtrlRendaFixa.AplicaAtualItemRenFix(Codigo, sDescricao, sAcao, ITemRenFix);

   //AL_1
   If CmeCadastro.Operacao in [OpInserir] then
     iIdItemRenfixAnt := CtrlRendaFixa.IdItemRenFix;

   if not Accept then
      MsgDlg('Ocorreu um erro na gravação do Registro.' + #13 +
             'Motivo: ' + CtrlRendaFixa.MessageInfo,'Mensagem do Sistema',mtWarning,[mbOk],0);

   inherited;

   //AL_1
   Seleciona(iIdItemRenfixAnt);
end;

procedure TFrmCadItemRendaFixaMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
   begin
      Seleciona(StrToInt(MontaSelect.ValoresChave[0]));
      Cds.Locate('IDITEMRENFIX',MontaSelect.ValoresChave[0],[]);
   end;
end;

procedure TFrmCadItemRendaFixaMT.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  CMeCadastroFind(Sender)
end;

procedure TFrmCadItemRendaFixaMT.sbtnInserirClick(Sender: TObject);
begin
   //AL_3
   cdsCopia.Data := Cds.Data;

   sAcao := 'I';

   //AL_3
   Codigo.OldValue := '';
   ItemRenFix.OldValue := 0;

   //AL_1
   if not Cds.IsEmpty then
     iIdItemRenfixAnt:= Cds.fieldbyname('IDITEMRENFIX').AsInteger;

   inherited;

   if dbeCodigoItem.CanFocus then
      dbeCodigoItem.SetFocus;
end;

procedure TFrmCadItemRendaFixaMT.sbtnAlterarClick(Sender: TObject);
begin
   //AL_3
   cdsCopia.Data := Cds.Data;

   sAcao := 'A';
   //AL_3
   Codigo.OldValue := Trim(dbeCodigoItem.Text);
   ItemRenFix.OldValue := Cds.fieldbyname('IDITEMRENFIX').AsInteger;

   //AL_1
   if not Cds.IsEmpty then
     iIdItemRenfixAnt:= Cds.fieldbyname('IDITEMRENFIX').asinteger;
     
  inherited;

   if dbeCodigoItem.CanFocus then
      dbeCodigoItem.SetFocus;
end;

procedure TFrmCadItemRendaFixaMT.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := False;

  if Trim(dbeDescItemRenFix.Text) = '' then
  begin
     MsgDlg('Falta a descrição do Item.', 'Warning', mtWarning, [mbOk], 0);
     if dbeDescItemRenFix.CanFocus then
        dbeDescItemRenFix.SetFocus;
     Exit;
  end;

  if Trim(dbeCodigoItem.Text) = '' then
  begin
     MsgDlg('Falta o Código do Item.', 'Warning', mtWarning, [mbOk], 0);
     if dbeCodigoItem.CanFocus then
        dbeCodigoItem.SetFocus;
     Exit;
  end;

  //AL_1
  if (Cds.State = dsInsert) then
  begin
     // Verificando se tem um codigo idual, terá uma chave única no banco
     sSQL := 'SELECT * FROM ITEMRENFIX WHERE CODITEMRENFIX = '+ QuotedStr(Trim(dbeCodigoItem.Text));
     CdsAux.Data := CtrlRendaFixa.ListAux(sSql);
     if not CdsAux.IsEmpty then
     begin
        MsgDlg('O Código do Item já Existe.', 'Warning', mtWarning, [mbOk], 0);
        if dbeCodigoItem.CanFocus then
           dbeCodigoItem.SetFocus;
        Exit;
     end;
  end;

  Accept := True;
  bValida := True;
end;

procedure TFrmCadItemRendaFixaMT.sbtnApagarClick(Sender: TObject);
begin
   sAcao := 'E';
   //AL_1
   //AL_3
   Codigo.OldValue := Cds.Fieldbyname('CODITEMRENFIX').AsString;
   ItemRenFix.OldValue := Cds.fieldbyname('IDITEMRENFIX').AsInteger;
   If Not Cds.IsEmpty then
    iIdItemRenfixAnt:= Cds.fieldbyname('IDITEMRENFIX').asinteger;
  inherited;
  Seleciona(iIdItemRenfixAnt);
end;

procedure TFrmCadItemRendaFixaMT.FormShow(Sender: TObject);
begin
  inherited;
  //AL_3
  Codigo.OldValue := '';
  if Pos('.CM',Sistema.NomeUsuario) < 0 then
  MontaSelect.Filtro.Add('IDITEMRENFIX > 0');

  //AL_3
  fraMens.Mostra;
  fraMens.Mes := 'Aguarde, verificando Itens obrigatórios';
  CtrlRendaFixa.InsereItensRFNeg;
  fraMens.Apaga;

  Seleciona;
end;

procedure TFrmCadItemRendaFixaMT.bbtnConfirmarClick(Sender: TObject);
begin
   CmeCadastro.RepetirInsert := False;
   inherited;
   //AL_3
   dbeIDItem.ReadOnly := True;
end;

//AL_1
procedure TFrmCadItemRendaFixaMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  //Seleciona;
  Seleciona(iIdItemRenfixAnt);
end;

//AL_1
procedure TFrmCadItemRendaFixaMT.dbGrdDblClick(Sender: TObject);
begin
  if not Cds.IsEmpty then
    iIdItemRenfixAnt:= Cds.fieldbyname('IDITEMRENFIX').asinteger;
  inherited;
  if dbeCodigoItem.CanFocus then
      dbeCodigoItem.SetFocus;
end;

//AL_3
procedure TFrmCadItemRendaFixaMT.mnuGeraIDNegClick(Sender: TObject);
var iMenor: Integer;
begin
   inherited;
   //Fazer
   cdsCopia.First;
   iMenor := 0;
   while not cdsCopia.eof do
   begin
      if cdsCopia.FieldByName('IDITEMRENFIX').AsInteger < iMenor then
         iMenor := cdsCopia.FieldByName('IDITEMRENFIX').AsInteger;
      cdsCopia.Next
   end;

   if Cds.State in [dsEdit, dsInsert] then
      Cds.FieldByName('IDITEMRENFIX').AsInteger := (iMenor - 1)
   else
      MsgDlg('Novo Item Negativo: ' + IntToStr(iMenor-1), 'Mensagem do Sistema', mtInformation, [mbOk], 0);
end;

//AL_3
procedure TFrmCadItemRendaFixaMT.mnuGeraIDPosClick(Sender: TObject);
begin
  inherited;
  Cds.FieldByName('IDITEMRENFIX').AsInteger := CtrlRendaFixa.GetSequence('ITEMRENFIX');
end;

//AL_3
procedure TFrmCadItemRendaFixaMT.mnuPermiteAlteracaoClick(Sender: TObject);
begin
   inherited;
   if (Pos('.CM', CtrlPInv.NomeUsuario) <> 0) or
      (AbrirFormModal(frmAutorizaParametros, TfrmAutorizaParametros) = mrOk) then
      dbeIDItem.ReadOnly := False;
end;

procedure TFrmCadItemRendaFixaMT.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   //AL_3
   dbeIDItem.ReadOnly := True;
   Codigo.NewValue := '';
   Codigo.OldValue := '';
   ItemRenFix.NewValue := 0;
   ItemRenFix.OldValue := 0;
end;

end.
