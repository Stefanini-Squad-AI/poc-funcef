//********************************************************************************************************
// Autor     : Fabio Fagundes
// Data	     : 05/12/2007
// Codigo    : AL_1
// Pendência : 26483
// SOL       :
// Função    : Implementação da funcionalidade
//********************************************************************************************************
unit fConfOrdemMovRFMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTInvFMD, Menus, MontaSelect, Db, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, fcLabel, faMensagem, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, uCmSqlParams,
  uCtrlPadroes, uCtrlParamInvest, uCtrlInvestimento, uCtrlRendaFixa, uMensErro,
  DBCtrls, TREdit;

type
  TfrmConfOrdemMovRFMT = class(TFrmCadastroGridMTInvFMD)
    sqlPCds: TCMSqlParams;
    lblDtOperacao: TLabel;
    dbDtaOperacao: TCMDateTimePicker;
    lblOperacao: TLabel;
    dblkOperacao: TwwDBLookupCombo;
    lblEmissor: TLabel;
    dblkEmissor: TwwDBLookupCombo;
    lblForCli: TLabel;
    dblkForCli: TwwDBLookupCombo;
    dblkCarteira: TwwDBLookupCombo;
    dblkInvestimento: TwwDBLookupCombo;
    lblInvestimento: TLabel;
    lblCarteira: TLabel;
    dblkPlanoPatro: TwwDBLookupCombo;
    lblPlanoPatro: TLabel;
    sqlTipoOperacao: TCMSqlParams;
    cdsTipoOperacao: TCMClientDataSet;
    sqlContraParte: TCMSqlParams;
    cdsContraParte: TCMClientDataSet;
    sqlPlanoPatro: TCMSqlParams;
    cdsPlanoPatro: TCMClientDataSet;
    cdsCarteira: TCMClientDataSet;
    sqlCarteira: TCMSqlParams;
    sqlInvestimento: TCMSqlParams;
    cdsInvestimento: TCMClientDataSet;
    CdsEmissor: TCMClientDataSet;
    sqlEmissor: TCMSqlParams;
    lblDtVento: TLabel;
    dbDtaVencto: TCMDateTimePicker;
    Label17: TLabel;
    dbePuOperacao: TDBRealEdit;
    dbrQtdeOperacao: TDBRealEdit;
    dbDtaLiquidacao: TCMDateTimePicker;
    lblDtLiquidacao: TLabel;
    dbrVlrOperacao: TDBRealEdit;
    Label16: TLabel;
    dbckConfirma: TDBCheckBox;
    CdsIDORDEMRENFIX: TFloatField;
    CdsDATAORDEM: TDateTimeField;
    CdsIDPLANPREVCTBPATR: TFloatField;
    CdsIDTIPOOPERACAO: TFloatField;
    CdsIDFORCLI: TFloatField;
    CdsIDINVESTIMENTO: TFloatField;
    CdsIDCARTEIRAINVEST: TFloatField;
    CdsQUANTIDADE: TFloatField;
    CdsPUOPERACAO: TFloatField;
    CdsVALOR: TFloatField;
    CdsSTACONFIRMA: TStringField;
    CdsSTAAUTORIZA: TStringField;
    CdsIDEMISSOR: TFloatField;
    CdsDATALIQUIDACAO: TDateTimeField;
    CdsDATAVENCIMENTO: TDateTimeField;
    CdsSTALANCADA: TStringField;
    CdsIDUSUARIOCONF: TFloatField;
    CdsIDUSUARIOAUT: TFloatField;
    CdsUSUARIOCONF: TStringField;
    CdsIDOPERRENFIXAPLIC: TFloatField;
    CdsIDOPERRENFIX: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure sbtnAlterarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlInvestimento: TCtrlInvestimento;
    CtrlRendaFixa: TCtrlRendaFixa;

  public
    { Public declarations }
  end;

var
  frmConfOrdemMovRFMT: TfrmConfOrdemMovRFMT;

implementation

{$R *.DFM}

procedure TfrmConfOrdemMovRFMT.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlInvestimento := TCtrlInvestimento.Create;
   CtrlInvestimento.InitializeAs(Padroes);
   CtrlRendaFixa := TCtrlRendaFixa.Create;
   CtrlRendaFixa.InitializeAs(Padroes);
   CtrlRendaFixa.CdsOrdemRenFix := Cds;
   Cds.Data := CtrlRendaFixa.ListOrdemRenFix(-1);
end;

procedure TfrmConfOrdemMovRFMT.FormShow(Sender: TObject);
begin
   cdsContraParte.Data := CtrlInvestimento.ListForCli;
   cdsCarteira.Data := CtrlRendaFixa.ListCarteiraRenFix;
   CdsEmissor.Data := CtrlRendaFixa.ListEmissorRenFix;
   cdsPlanoPatro.Data := CtrlInvestimento.ListPlanoPatro;
   cdsTipoOperacao.Data := CtrlRendaFixa.ListTipoOperRF(-1);
   cdsInvestimento.Data := CtrlRendaFixa.ListInvestimentoRenFix(-1, -1, 'S');
  inherited;
end;

procedure TfrmConfOrdemMovRFMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   FreeAndNil(CtrlInvestimento);
   FreeAndNil(CtrlRendaFixa);

   cdsTipoOperacao.Close;
   cdsContraParte.Close;
   cdsInvestimento.Close;
   cdsCarteira.Close;
   CdsEmissor.Close;
   cdsPlanoPatro.Close;
  inherited;
end;

procedure TfrmConfOrdemMovRFMT.bbtnConfirmarClick(Sender: TObject);
begin
   if (CdsSTACONFIRMA.AsString = 'N') or (CdsSTACONFIRMA.IsNull) then
      CdsIDUSUARIOCONF.Clear
   else
      CdsIDUSUARIOCONF.AsInteger := CtrlPInv.IDUsuario;
  inherited;
   Cds.Data := CtrlRendaFixa.ListOrdemRenFix(StrToInt(MontaSelect.ValoresChave[0]));
   sbtnInserir.Down := False;
   bbtnCancelarClick(Sender);
end;

procedure TfrmConfOrdemMovRFMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
   begin
      Cds.Data := CtrlRendaFixa.ListOrdemRenFix(StrToInt(MontaSelect.ValoresChave[0]));
   end;
end;

procedure TfrmConfOrdemMovRFMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
    Accept := CtrlRendaFixa.AplicaAtualOrdemRenFix;
  inherited;

end;

procedure TfrmConfOrdemMovRFMT.sbtnAlterarClick(Sender: TObject);
begin
    if not CtrlRendaFixa.VerificaOrdemAutorizada(Cds.FieldByName('IDORDEMRENFIX').AsInteger) then
    begin
       MsgDlg('Esta ordem já está autorizada e não pode ser alterada.','Mensagem do Sistema',mtWarning,[MbOk],0);
       sbtnAlterar.Down := False;
       Exit;
    end;

    if not CtrlRendaFixa.VerificaOrdemLancada(Cds.FieldByName('IDORDEMRENFIX').AsInteger) then
    begin
       MsgDlg('Esta ordem já está lancada e não pode ser alterada.','Mensagem do Sistema',mtWarning,[MbOk],0);
       sbtnAlterar.Down := False;
       Exit;
    end;
    
  inherited;
  if dbGrd.CanFocus then
      dbGrd.SetFocus;
   pnlControles.SendToBack;
   dbGrd.Visible := True;
   dbGrd.Enabled := True;
   pnlDados.Enabled := False;
end;

end.
