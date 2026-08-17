//******************************************************************************
// Autor     : Marco Turon
// Data	     : 29/08/2007
// Código    : AL_1
// Pendencia : 25678
// SOL       :
// Motivo    : Implementação de Marcação a Mercado - Criação da tela
//******************************************************************************
unit FCadParamCalcMKTMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTInv, Menus, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  fcLabel, faMensagem, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls,
  TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, uCmSqlParams,
  uCtrlCalculoMKT, uCtrlRendaFixa, uCtrlPadroes, uMensErro, wwdblook, CMDBLookupCombo;

type
  TfrmCadParamCalcMKTMT = class(TFrmCadastroGridMTInv)
    CMSqlParams1: TCMSqlParams;
    lblTipoItem: TLabel;
    Label1: TLabel;
    cdsClasseTit: TCMClientDataSet;
    cdsFormatoCalc: TCMClientDataSet;
    CMSqlParams2: TCMSqlParams;
    CMSqlParams3: TCMSqlParams;
    dblClasseTit: TCMDBLookupCombo;
    dblFormaCalc: TCMDBLookupCombo;
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
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
  private
    { Private declarations }
    CtrlMKT: TCtrlCalculoMKT;
    CtrlRendaFixa: TCtrlRendaFixa;
    Procedure Seleciona(iClasse: Integer = -1; iFormato: Integer = -1);
  public
    { Public declarations }
  end;

var
  frmCadParamCalcMKTMT: TfrmCadParamCalcMKTMT;

implementation

{$R *.DFM}

procedure TfrmCadParamCalcMKTMT.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlMKT := TCtrlCalculoMKT.Create;
   CtrlMKT.InitializeAs(Padroes);
   CtrlRendaFixa := TCtrlRendaFixa.Create;
   CtrlRendaFixa.InitializeAs(Padroes);
   CtrlMKT.CdsParamCalcMKT := Cds;
   cdsClasseTit.Data := CtrlRendaFixa.ListClasseRenFix;
   cdsFormatoCalc.Data := CtrlMKT.ListFormaCalcMKT;
end;

procedure TfrmCadParamCalcMKTMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   FreeAndNil(CtrlRendaFixa);
   FreeAndNil(CtrlMKT);
   Cds.Close;
   cdsClasseTit.Close;
   cdsFormatoCalc.Close;
end;

procedure TfrmCadParamCalcMKTMT.Seleciona(iClasse: Integer = -1; iFormato: Integer = -1);
begin
   Cds.Data := CtrlMKT.ListParamCalcMKT;
   if (iClasse > 0) and (iFormato > 0) then
      Cds.Locate('IDCLASSETIT;IDFORMACALCMKT', VarArrayOf([iClasse, iFormato]), []);
end;

procedure TfrmCadParamCalcMKTMT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
var iClasse, iForma: Integer;
begin
   inherited;
   if Trim(dblClasseTit.Text) <> '' then
      Cds.FieldByName('DESCCLASSETIT').AsString := cdsClasseTit.FieldByName('DESCCLASSETIT').AsString;
   if Trim(dblFormaCalc.Text) <> '' then
      Cds.FieldByName('DESCFORMACALCMKT').AsString := cdsFormatoCalc.FieldByName('DESCFORMACALCMKT').AsString;
   iClasse := Cds.FieldByName('IDCLASSETIT').AsInteger;
   iForma := Cds.FieldByName('IDFORMACALCMKT').AsInteger;
   Accept := CtrlMKT.AplicaAtualParamCalcMKT;
   if not Accept then
      MsgDlg('Não foi possível incluir este parâmetro.' + #13 +
             'Motivo: ' + CtrlMKT.MessageInfo,'Mensagem do Sistema',mtWarning,[mbOk],0);
   Seleciona(iClasse, iForma);
end;

procedure TfrmCadParamCalcMKTMT.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
var iClasse, iForma: Integer;
begin
   inherited;
   if Trim(dblClasseTit.Text) <> '' then
      Cds.FieldByName('DESCCLASSETIT').AsString := cdsClasseTit.FieldByName('DESCCLASSETIT').AsString;
   if Trim(dblFormaCalc.Text) <> '' then
      Cds.FieldByName('DESCFORMACALCMKT').AsString := cdsFormatoCalc.FieldByName('DESCFORMACALCMKT').AsString;

   iClasse := Cds.FieldByName('IDCLASSETIT').AsInteger;
   iForma := Cds.FieldByName('IDFORMACALCMKT').AsInteger;

   Accept := CtrlMKT.AplicaAtualParamCalcMKT;

   if not Accept then
      MsgDlg('Não foi possível alterar este parâmetro.' + #13 +
             'Motivo: ' + CtrlMKT.MessageInfo,'Mensagem do Sistema',mtWarning,[mbOk],0);

   Seleciona(iClasse, iForma);

end;

procedure TfrmCadParamCalcMKTMT.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := CtrlMKT.AplicaAtualParamCalcMKT;
   if not Accept then
      MsgDlg('Não foi possível excluir este parâmetro.' + #13 +
             'Motivo: ' + CtrlMKT.MessageInfo,'Mensagem do Sistema', mtWarning, [mbOk],0);
end;

procedure TfrmCadParamCalcMKTMT.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      Cds.Locate('IDCLASSETIT;IDFORMACALCMKT', VarArrayOf([MontaSelect.ValoresChave[0], MontaSelect.ValoresChave[1]]), []);
end;

procedure TfrmCadParamCalcMKTMT.CmeCadastroConfirma(Sender: TObject);
begin
   inherited;
//   CMeCadastroFind(Sender)
end;

procedure TfrmCadParamCalcMKTMT.sbtnInserirClick(Sender: TObject);
begin
   inherited;
   if dblClasseTit.CanFocus then
      dblClasseTit.SetFocus;
end;

procedure TfrmCadParamCalcMKTMT.sbtnAlterarClick(Sender: TObject);
begin
   inherited;
   if dblClasseTit.CanFocus then
      dblClasseTit.SetFocus;
end;

procedure TfrmCadParamCalcMKTMT.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   Accept := True;

   if Trim(dblClasseTit.Text) = '' then
   begin
      MsgDlg('Selecione uma Classe de Títulos.', 'Warning', mtWarning, [mbOk], 0);
      if dblClasseTit.CanFocus then
         dblClasseTit.SetFocus;
      Accept := False;
   end;

   if Trim(dblFormaCalc.Text) = '' then
   begin
      MsgDlg('Selecione uma forma de cálculo', 'Warning', mtWarning, [mbOk], 0);
      if dblFormaCalc.CanFocus then
         dblFormaCalc.SetFocus;
      Accept := False;
   end;

   inherited;

end;

procedure TfrmCadParamCalcMKTMT.bbtnConfirmarClick(Sender: TObject);
begin
   CmeCadastro.RepetirInsert := False;
   inherited;
end;

procedure TfrmCadParamCalcMKTMT.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   Seleciona(Cds.FieldByName('IDCLASSETIT').AsInteger, Cds.FieldByName('IDFORMACALCMKT').AsInteger)
end;

procedure TfrmCadParamCalcMKTMT.FormShow(Sender: TObject);
begin
   Seleciona;
   inherited;
end;

end.
