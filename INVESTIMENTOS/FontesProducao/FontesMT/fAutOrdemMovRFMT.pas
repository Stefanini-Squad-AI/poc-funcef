//********************************************************************************************************
// Autor     : Fabio Fagundes
// Data	     : 05/12/2007
// Codigo    : AL_1
// Pendência : 26483
// SOL       :
// Função    : Implementação da funcionalidade
//********************************************************************************************************

unit fAutOrdemMovRFMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTInvFMD, Menus, MontaSelect, Db, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, fcLabel, faMensagem, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  uCtrlPadroes, uCtrlParamInvest, uCtrlInvestimento, uCtrlRendaFixa, uMensErro,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker, uCmSqlParams;

type
  TfrmAutOrdemMovRFMT = class(TFrmCadastroGridMTInvFMD)
    sqlTipoOperacao: TCMSqlParams;
    cdsTipoOperacao: TCMClientDataSet;
    sqlContraParte: TCMSqlParams;
    cdsContraParte: TCMClientDataSet;
    sqlPlanoPatro: TCMSqlParams;
    cdsPlanoPatro: TCMClientDataSet;
    sqlCarteira: TCMSqlParams;
    cdsCarteira: TCMClientDataSet;
    sqlInvestimento: TCMSqlParams;
    cdsInvestimento: TCMClientDataSet;
    CdsEmissor: TCMClientDataSet;
    sqlEmissor: TCMSqlParams;
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
    lblCarteira: TLabel;
    dblkInvestimento: TwwDBLookupCombo;
    lblInvestimento: TLabel;
    dblkPlanoPatro: TwwDBLookupCombo;
    lblPlanoPatro: TLabel;
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
    CdsIDUSUARIOAUT: TFloatField;
    CdsUSUARIOAUT: TStringField;
    CdsAutorizador: TCMClientDataSet;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    CMDateTimePicker1: TCMDateTimePicker;
    wwDBLookupCombo1: TwwDBLookupCombo;
    wwDBLookupCombo2: TwwDBLookupCombo;
    wwDBLookupCombo3: TwwDBLookupCombo;
    wwDBLookupCombo4: TwwDBLookupCombo;
    wwDBLookupCombo5: TwwDBLookupCombo;
    wwDBLookupCombo6: TwwDBLookupCombo;
    SqlAutorizador: TCMSqlParams;
    CdsAutorizadorIDUSUARIO: TFloatField;
    CdsAutorizadorNOMEUSUARIO: TStringField;
    CdsAutorizadorFLGATIVO: TStringField;
    CdsIDUSUARIOCONF: TFloatField;
    CdsIDOPERRENFIXAPLIC: TFloatField;
    CdsIDOPERRENFIX: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure dbGrdDblClick(Sender: TObject);
  private
    { Private declarations }
    CtrlInvestimento: TCtrlInvestimento;
    CtrlRendaFixa: TCtrlRendaFixa;
  public
    { Public declarations }
  end;

var
  frmAutOrdemMovRFMT: TfrmAutOrdemMovRFMT;

implementation

{$R *.DFM}

procedure TfrmAutOrdemMovRFMT.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlInvestimento := TCtrlInvestimento.Create;
   CtrlInvestimento.InitializeAs(Padroes);
   CtrlRendaFixa := TCtrlRendaFixa.Create;
   CtrlRendaFixa.InitializeAs(Padroes);
   CtrlRendaFixa.CdsOrdemRenFix := Cds;
   Cds.Data := CtrlRendaFixa.ListOrdemRenFix(-1);
end;

procedure TfrmAutOrdemMovRFMT.FormShow(Sender: TObject);
begin
   cdsContraParte.Data  := CtrlInvestimento.ListForCli;
   cdsCarteira.Data     := CtrlRendaFixa.ListCarteiraRenFix;
   CdsEmissor.Data      := CtrlRendaFixa.ListEmissorRenFix;
   cdsPlanoPatro.Data   := CtrlInvestimento.ListPlanoPatro;
   cdsTipoOperacao.Data := CtrlRendaFixa.ListTipoOperRF(-1);
   cdsInvestimento.Data := CtrlRendaFixa.ListInvestimentoRenFix(-1, -1, 'S');
   CdsAutorizador.Data  := CtrlInvestimento.ListAutorizadorDeOperacao(CtrlPInv.IDUsuario);
  inherited;
end;

procedure TfrmAutOrdemMovRFMT.FormClose(Sender: TObject;
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
   CdsAutorizador.Close;
  inherited;
end;

procedure TfrmAutOrdemMovRFMT.bbtnConfirmarClick(Sender: TObject);
begin
   if (CdsSTAAUTORIZA.AsString = 'N') or (CdsSTAAUTORIZA.IsNull) then
      CdsIDUSUARIOAUT.Clear
   else
      CdsIDUSUARIOAUT.AsInteger := CdsAutorizador.FieldByName('IDUSUARIO').AsInteger;
  inherited;
   Cds.Data := CtrlRendaFixa.ListOrdemRenFix(StrToInt(MontaSelect.ValoresChave[0]));
   sbtnInserir.Down := False;
   //bbtnCancelarClick(Sender);
end;

procedure TfrmAutOrdemMovRFMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
   begin
      Cds.Data := CtrlRendaFixa.ListOrdemRenFix(StrToInt(MontaSelect.ValoresChave[0]));
   end;
end;

procedure TfrmAutOrdemMovRFMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
   Accept := CtrlRendaFixa.AplicaAtualOrdemRenFix;
  inherited;
end;

procedure TfrmAutOrdemMovRFMT.sbtnAlterarClick(Sender: TObject);
begin
    if not CtrlRendaFixa.VerificaOrdemLancada(Cds.FieldByName('IDORDEMRENFIX').AsInteger) then
    begin
       MsgDlg('Esta ordem já está lancada e não pode ser alterada.','Mensagem do Sistema',mtWarning,[MbOk],0);
       sbtnAlterar.Down := False;
       Exit;
    end;

   if CdsAutorizador.IsEmpty then
   begin
       MsgDlg('O usuário não tem permissão de autorização.','Mensagem do Sistema',mtWarning,[MbOk],0);
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

procedure TfrmAutOrdemMovRFMT.dbGrdDblClick(Sender: TObject);
begin
//  inherited;

end;

end.
