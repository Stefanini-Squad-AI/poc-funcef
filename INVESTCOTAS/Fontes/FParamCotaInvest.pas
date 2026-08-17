unit FParamCotaInvest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTInv, wwdblook, StdCtrls, wwdbdatetimepicker,
  CMDateTimePicker, Menus, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  fcLabel, faMensagem, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ExtCtrls, uCtrlPadroes, uMensErro, uCMTypes,
  uCtrlParamCotaInvest, uCtrlCarteiraInvest, uCmSqlParams, USistema, FTelaAut,
  Mask, DBCtrls, TREdit, uCtrlInvestCotas;

type
  TFrmParamCotaInvest = class(TFrmCadastroGridMTInv)
    CdsCarteira: TCMClientDataSet;
    DbLcCarteira: TwwDBLookupCombo;
    LblCarteira: TLabel;
    CMSqlParams: TCMSqlParams;
    GroupBox1: TGroupBox;
    pnlQuantidadeDec: TPanel;
    sttQtdDec: TStaticText;
    pnlQuantidadeDecDet: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    dbeQtdDec: TDBEdit;
    dbeValorCota: TDBEdit;
    Panel1: TPanel;
    StaticText1: TStaticText;
    Panel2: TPanel;
    Label1: TLabel;
    dbdDtaInicial: TCMDateTimePicker;
    Label6: TLabel;
    dbdDtaUltFech: TCMDateTimePicker;
    Label2: TLabel;
    dbdDtaEncerramento: TCMDateTimePicker;
    Panel3: TPanel;
    StaticText2: TStaticText;
    Panel4: TPanel;
    Label3: TLabel;
    DbRVlrInicial: TDBRealEdit;
    Panel5: TPanel;
    StaticText3: TStaticText;
    Panel6: TPanel;
    Label19: TLabel;
    dbeTaxaPerformace: TDBRealEdit;
    Label18: TLabel;
    CdsMoeda: TCMClientDataSet;
    Label21: TLabel;
    dblMoeCodigo: TwwDBLookupCombo;
    Label17: TLabel;
    dbeTaxaAdministracao: TDBRealEdit;
    Label20: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlParamCotaInvest : TCtrlParamCotaInvest;
    CtrlCarteiraInvest : TCtrlCarteiraInvest;
    CtrlInvestCotas : TCtrlInvestCotas;
  public
    { Public declarations }
  end;

var
  FrmParamCotaInvest: TFrmParamCotaInvest;

implementation

uses FAutorizaParametros;

{$R *.DFM}

procedure TFrmParamCotaInvest.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlParamCotaInvest := TCtrlParamCotaInvest.Create;
   CtrlParamCotaInvest.InitializeAs(Padroes);
   CtrlParamCotaInvest.cdsParamCotaInvest := Cds;

   CtrlCarteiraInvest  := TCtrlCarteiraInvest.Create;
   CtrlCarteiraInvest.InitializeAs(Padroes);
   CtrlCarteiraInvest.CdsCarteiraInvest := CdsCarteira;

   CtrlInvestCotas := TCtrlInvestCotas.Create;
   CtrlInvestCotas.InitializeAs(Padroes);
   CtrlInvestCotas.CdsMoeda := CdsMoeda;
end;

procedure TFrmParamCotaInvest.FormShow(Sender: TObject);
begin
  inherited;
   CdsMoeda.Data := CtrlInvestCotas.ListMoeda;
   CdsCarteira.Data := CtrlCarteiraInvest.ListCarteiraInvest;
   Cds.Data := CtrlParamCotaInvest.ListParamCotaInvest;
   if Cds.IsEmpty then
      CmeCadastro.Operacao := OpVazio
   else
      CmeCadastro.Operacao := OpIdle;

   CmeCadastro.AtualizaBotoes(Self);

end;

procedure TFrmParamCotaInvest.FormDestroy(Sender: TObject);
begin
  inherited;
   FreeAndNil(CtrlParamCotaInvest);
   FreeAndNil(CtrlCarteiraInvest);
   FreeAndNil(CtrlInvestCotas);
end;

procedure TFrmParamCotaInvest.bbtnConfirmarClick(Sender: TObject);
begin
   CmeCadastro.RepetirInsert := False;
  inherited;
   Cds.Data := CtrlParamCotaInvest.ListParamCotaInvest;
   DbRVlrInicial.DecDigits := Cds.FieldByName('QTDDECVLR').AsInteger;
end;

procedure TFrmParamCotaInvest.sbtnInserirClick(Sender: TObject);
begin
  inherited;

   LblCarteira.Enabled := True;
   DbLcCarteira.Enabled := True;  

   if DbLcCarteira.CanFocus then
      DbLcCarteira.SetFocus;
end;

procedure TFrmParamCotaInvest.sbtnAlterarClick(Sender: TObject);
begin
//   if (AbrirFormModal(frmAutorizaParametros,TfrmAutorizaParametros) = mrOk) then
//   begin
      inherited;
      LblCarteira.Enabled := False;
      DbLcCarteira.Enabled := False;

      if dbdDtaInicial.CanFocus then
         dbdDtaInicial.SetFocus;
//   end;
end;

procedure TFrmParamCotaInvest.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
      Cds.Locate('IDPARAMCOTAINVEST',MontaSelect.ValoresChave[0],[]);
end;

procedure TFrmParamCotaInvest.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

   Accept := False;

   if Trim(DbLcCarteira.Text) = '' then
   begin
      MsgDlg('Informe a Carteira.', 'Warning', mtWarning, [mbOk], 0);
      if DbLcCarteira.CanFocus then
         DbLcCarteira.SetFocus;
      Exit;
   end;

   if Trim(dbdDtaInicial.Text) = '' then
   begin
      MsgDlg('Informe a Data Inicial.', 'Warning', mtWarning, [mbOk], 0);
      if dbdDtaInicial.CanFocus then
         dbdDtaInicial.SetFocus;
      Exit;
   end;

   if Trim(dbdDtaUltFech.Text) = '' then
   begin
      MsgDlg('Informe a Data de Último Fechamento.', 'Warning', mtWarning, [mbOk], 0);
      if dbdDtaUltFech.CanFocus then
         dbdDtaUltFech.SetFocus;
      Exit;
   end;

   Accept := True;
end;

procedure TFrmParamCotaInvest.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
   Accept := False;

   CdsAux.Data := CtrlParamCotaInvest.ListParamCotaInvest(-1,StrToInt(DbLcCarteira.LookupValue));
   DbRVlrInicial.DecDigits := Cds.FieldByName('QTDDECVLR').AsInteger;   

   if not CdsAux.IsEmpty then
   begin
      MsgDlg('A Carteira informada já está parametrizada.', 'Warning', mtWarning, [mbOk], 0);
      if DbLcCarteira.CanFocus then
         DbLcCarteira.SetFocus;
      Exit;
   end;

   Accept := CtrlParamCotaInvest.AplicaAtualParamCotaInvest;
   if not Accept then
      MsgDlg('Ocorreu um erro na gravação do Registro.' + #13 +
             'Motivo: ' + CtrlParamCotaInvest.MessageInfo,'Erro',mtError,[mbOk],0);
end;

procedure TFrmParamCotaInvest.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
   Accept := CtrlParamCotaInvest.AplicaAtualParamCotaInvest;
   if not Accept then
      MsgDlg('Ocorreu um erro na gravação do Registro.' + #13 +
             'Motivo: ' + CtrlParamCotaInvest.MessageInfo,'Erro',mtError,[mbOk],0);
end;

procedure TFrmParamCotaInvest.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
   Accept := CtrlParamCotaInvest.AplicaAtualParamCotaInvest;
   if not Accept then
      MsgDlg('Ocorreu um erro na exclusão do Registro.' + #13 +
             'Motivo: ' + CtrlParamCotaInvest.MessageInfo,'Erro',mtError,[mbOk],0);
end;

procedure TFrmParamCotaInvest.bbtnCancelarClick(Sender: TObject);
begin
   Cds.Data := CtrlParamCotaInvest.ListParamCotaInvest;
   DbRVlrInicial.DecDigits := Cds.FieldByName('QTDDECVLR').AsInteger;   
  inherited;
end;

end.
