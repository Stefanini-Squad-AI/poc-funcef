//********************************************************************************************************
// Autor     : Fabio Fagundes
// Data	     : 05/12/2007
// Codigo    : AL_1
// Pendência : 26483
// SOL       :
// Função    : Implementação da funcionalidade
//********************************************************************************************************

unit FCadOrdemMovRFMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTInvFMD, Menus, MontaSelect, Db, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, fcLabel, faMensagem, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, uCmSqlParams, TREdit,
  uCtrlPadroes, uCtrlParamInvest, uCtrlInvestimento, uCtrlRendaFixa, uMensErro,
  UBibliotecaInvest;

type
  TfrmCadOrdemMovRFMT = class(TFrmCadastroGridMTInvFMD)
    sqlTipoOperacao: TCMSqlParams;
    cdsTipoOperacao: TCMClientDataSet;
    sqlContraParte: TCMSqlParams;
    cdsContraParte: TCMClientDataSet;
    sqlInvestimento: TCMSqlParams;
    cdsInvestimento: TCMClientDataSet;
    sqlCarteira: TCMSqlParams;
    cdsCarteira: TCMClientDataSet;
    lblDtOperacao: TLabel;
    dbDtaOperacao: TCMDateTimePicker;
    lblOperacao: TLabel;
    dblkOperacao: TwwDBLookupCombo;
    lblForCli: TLabel;
    dblkForCli: TwwDBLookupCombo;
    lblInvestimento: TLabel;
    dblkInvestimento: TwwDBLookupCombo;
    lblCarteira: TLabel;
    dblkCarteira: TwwDBLookupCombo;
    sqlPCds: TCMSqlParams;
    sqlPlanoPatro: TCMSqlParams;
    cdsPlanoPatro: TCMClientDataSet;
    dblkEmissor: TwwDBLookupCombo;
    lblEmissor: TLabel;
    sqlEmissor: TCMSqlParams;
    CdsEmissor: TCMClientDataSet;
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
    CdsNATUREZAOPERACAO: TStringField;
    sbtnBuscaSaldos: TToolbarButton97;
    msBuscaSaldos: TMontaSelect;
    CdsIDOPERRENFIXAPLIC: TFloatField;
    cdsTipoOperacaoIDTIPOOPERACAO: TFloatField;
    cdsTipoOperacaoIDTIPOINVEST: TFloatField;
    cdsTipoOperacaoDESCTIPOOPERACAO: TStringField;
    cdsTipoOperacaoNATUREZAOPERACAO: TStringField;
    lblDtVento: TLabel;
    dbDtaVencto: TCMDateTimePicker;
    Label17: TLabel;
    dbePuOperacao: TDBRealEdit;
    dbrQtdeOperacao: TDBRealEdit;
    Label5: TLabel;
    dbDtaLiquidacao: TCMDateTimePicker;
    lblDtLiquidacao: TLabel;
    dbrVlrOperacao: TDBRealEdit;
    Label16: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dbDtaOperacaoEnter(Sender: TObject);
    procedure dbDtaOperacaoCloseUp(Sender: TObject);
    procedure dbDtaOperacaoExit(Sender: TObject);
    procedure dblkOperacaoEnter(Sender: TObject);
    procedure dblkOperacaoExit(Sender: TObject);
    procedure dblkForCliEnter(Sender: TObject);
    procedure dblkForCliCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkForCliExit(Sender: TObject);
    procedure dblkInvestimentoEnter(Sender: TObject);
    procedure dblkInvestimentoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkInvestimentoExit(Sender: TObject);
    procedure dblkCarteiraEnter(Sender: TObject);
    procedure dblkCarteiraCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkCarteiraExit(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure dblkEmissorEnter(Sender: TObject);
    procedure dblkEmissorExit(Sender: TObject);
    procedure dblkOperacaoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkEmissorCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkPlanoPatroExit(Sender: TObject);
    procedure dblkPlanoPatroCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkPlanoPatroEnter(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dbePuOperacaoExit(Sender: TObject);
    procedure dbrQtdeOperacaoExit(Sender: TObject);
    procedure dbrVlrOperacaoExit(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure sbtnBuscaSaldosClick(Sender: TObject);
    procedure pnlControlesEnter(Sender: TObject);
  private
    { Private declarations }
    dDataAnt: TDateTime;
    iTipoOperAnt, iForCliAnt, iInvestAnt, iCartAnt, iEmissorAnt, iPlanoPatroAnt: Integer;
    CtrlInvestimento: TCtrlInvestimento;
    CtrlRendaFixa: TCtrlRendaFixa;

    procedure CalculaValores(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmCadOrdemMovRFMT: TfrmCadOrdemMovRFMT;

implementation

uses uOperComum;

{$R *.DFM}

procedure TfrmCadOrdemMovRFMT.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlInvestimento := TCtrlInvestimento.Create;
   CtrlInvestimento.InitializeAs(Padroes);
   CtrlRendaFixa := TCtrlRendaFixa.Create;
   CtrlRendaFixa.InitializeAs(Padroes);
   CtrlRendaFixa.CdsOrdemRenFix := Cds;
   Cds.Data := CtrlRendaFixa.ListOrdemRenFix(-1);
end;

procedure TfrmCadOrdemMovRFMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FreeAndNil(CtrlInvestimento);
   FreeAndNil(CtrlRendaFixa);

   cdsTipoOperacao.Close;
   cdsContraParte.Close;
   cdsInvestimento.Close;
   cdsCarteira.Close;
   CdsEmissor.Close;
   cdsPlanoPatro.Close;
   CdsAux.Close;
   inherited;
end;

procedure TfrmCadOrdemMovRFMT.FormShow(Sender: TObject);
begin
   cdsContraParte.Data := CtrlInvestimento.ListForCli;
   cdsCarteira.Data := CtrlRendaFixa.ListCarteiraRenFix;
   CdsEmissor.Data := CtrlRendaFixa.ListEmissorRenFix;
   cdsPlanoPatro.Data := CtrlInvestimento.ListPlanoPatro;
   cdsTipoOperacao.Data := CtrlRendaFixa.ListTipoOperRF(-1);
   cdsInvestimento.Data := CtrlRendaFixa.ListInvestimentoRenFix(-1, -1, 'S');
   inherited;
   msBuscaSaldos.Filtro.Add('HISTRENFIX.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrevCtbPatro));
end;


procedure TfrmCadOrdemMovRFMT.dbDtaOperacaoEnter(Sender: TObject);
begin
   inherited;
   dDataAnt := dbDtaOperacao.DateTime;
end;

procedure TfrmCadOrdemMovRFMT.dbDtaOperacaoCloseUp(Sender: TObject);
begin
   inherited;
   if dDataAnt <> dbDtaOperacao.DateTime then
      dDataAnt := dbDtaOperacao.DateTime;
   if ds.DataSet.State in [dsInsert,dsEdit] then
      Cds.FieldByName('DATALIQUIDACAO').AsDateTime := Cds.FieldByName('DATAORDEM').AsDateTime;
end;

procedure TfrmCadOrdemMovRFMT.dbDtaOperacaoExit(Sender: TObject);
begin
   inherited;
   if dDataAnt <> dbDtaOperacao.DateTime then
      dDataAnt := dbDtaOperacao.DateTime;
   if ds.DataSet.State in [dsInsert,dsEdit] then
      Cds.FieldByName('DATALIQUIDACAO').AsDateTime := Cds.FieldByName('DATAORDEM').AsDateTime;
end;

procedure TfrmCadOrdemMovRFMT.dblkOperacaoEnter(Sender: TObject);
begin
   inherited;
   iTipoOperAnt := StrToInt(OperComum.IIF(dblkOperacao.LookupValue = '', '-1', dblkOperacao.LookupValue));
end;

procedure TfrmCadOrdemMovRFMT.dblkOperacaoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   if Trim(dblkOperacao.LookupValue) <> '' then
   begin
      if StrToInt(dblkOperacao.LookupValue) <> iTipoOperAnt then
         iTipoOperAnt := StrToInt(OperComum.IIF(dblkOperacao.LookupValue = '', '-1', dblkOperacao.LookupValue));
   end;
end;

procedure TfrmCadOrdemMovRFMT.dblkOperacaoExit(Sender: TObject);
begin
   inherited;
   if Trim(dblkOperacao.LookupValue) <> '' then
   begin
      if StrToInt(dblkOperacao.LookupValue) <> iTipoOperAnt then
         iTipoOperAnt := StrToInt(OperComum.IIF(dblkOperacao.LookupValue = '', '-1', dblkOperacao.LookupValue));
   end;
end;

procedure TfrmCadOrdemMovRFMT.dblkForCliEnter(Sender: TObject);
begin
   inherited;
   iForCliAnt := StrToInt(OperComum.IIF(dblkForCli.LookupValue = '', '0', dblkForCli.LookupValue));
end;

procedure TfrmCadOrdemMovRFMT.dblkForCliCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if Trim(dblkForCli.LookupValue) <> '' then
   begin
      if StrToInt(dblkForCli.LookupValue) <> iForCliAnt then
         iForCliAnt := StrToInt(OperComum.IIF(dblkForCli.LookupValue = '', '0', dblkForCli.LookupValue));
   end;
end;

procedure TfrmCadOrdemMovRFMT.dblkForCliExit(Sender: TObject);
begin
   inherited;
   if Trim(dblkForCli.LookupValue) <> '' then
   begin
      if StrToInt(dblkForCli.LookupValue) <> iForCliAnt then
         iForCliAnt := StrToInt(OperComum.IIF(dblkForCli.LookupValue = '', '0', dblkForCli.LookupValue));
   end;
end;

procedure TfrmCadOrdemMovRFMT.dblkInvestimentoEnter(Sender: TObject);
begin
   inherited;
   iInvestAnt := StrToInt(OperComum.IIF(dblkInvestimento.LookupValue = '', '0', dblkInvestimento.LookupValue));
end;

procedure TfrmCadOrdemMovRFMT.dblkInvestimentoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if Trim(dblkInvestimento.LookupValue) <> '' then
   begin
      if StrToInt(dblkInvestimento.LookupValue) <> iInvestAnt then
         iInvestAnt := StrToInt(OperComum.IIF(dblkInvestimento.LookupValue = '', '0', dblkInvestimento.LookupValue));
   end;
end;

procedure TfrmCadOrdemMovRFMT.dblkInvestimentoExit(Sender: TObject);
begin
   inherited;
   if Trim(dblkInvestimento.LookupValue) <> '' then
   begin
      if StrToInt(dblkInvestimento.LookupValue) <> iInvestAnt then
         iInvestAnt := StrToInt(OperComum.IIF(dblkInvestimento.LookupValue = '', '0', dblkInvestimento.LookupValue));
   end;
end;

procedure TfrmCadOrdemMovRFMT.dblkCarteiraEnter(Sender: TObject);
begin
   inherited;
   iCartAnt := StrToInt(OperComum.IIF(dblkCarteira.LookupValue = '', '0', dblkCarteira.LookupValue));
end;

procedure TfrmCadOrdemMovRFMT.dblkCarteiraCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if Trim(dblkCarteira.LookupValue) <> '' then
   begin
      if StrToInt(dblkCarteira.LookupValue) <> iCartAnt then
         iCartAnt := StrToInt(OperComum.IIF(dblkCarteira.LookupValue = '', '0', dblkCarteira.LookupValue));
   end;
end;

procedure TfrmCadOrdemMovRFMT.dblkCarteiraExit(Sender: TObject);
begin
   inherited;
   if Trim(dblkCarteira.LookupValue) <> '' then
   begin
      if StrToInt(dblkCarteira.LookupValue) <> iCartAnt then
         iCartAnt := StrToInt(OperComum.IIF(dblkCarteira.LookupValue = '', '0', dblkCarteira.LookupValue));
   end;
end;

procedure TfrmCadOrdemMovRFMT.sbtnInserirClick(Sender: TObject);
begin
   dbDtaOperacao.Enabled     := True;
   dblkPlanoPatro.Enabled    := True;
   dblkEmissor.Enabled       := True;
   dblkInvestimento.Enabled  := True;
   dblkCarteira.Enabled      := True;
   dblkForCli.Enabled        := True;
   dblkOperacao.Enabled      := True;
   //Cds.Data := CtrlRendaFixa.ListOrdemRenFix(-1);
  inherited;
   if dbDtaOperacao.CanFocus then
      dbDtaOperacao.SetFocus;
   Cds.FieldByName('DATAORDEM').AsDateTime := CtrlPinv.DataUltFechRF;
   cdsInvestimento.Data := CtrlRendaFixa.ListInvestimentoRenFix(-1, -1, 'S');
   cdsTipoOperacao.Data := CtrlRendaFixa.ListTipoOperRF(-1,True,'A');
end;

procedure TfrmCadOrdemMovRFMT.sbtnAlterarClick(Sender: TObject);
begin
   dbDtaOperacao.Enabled     := True;
   dblkPlanoPatro.Enabled    := True;
   dblkEmissor.Enabled       := True;
   dblkInvestimento.Enabled  := True;
   dblkCarteira.Enabled      := True;
   dblkForCli.Enabled        := True;
   dblkOperacao.Enabled      := True;

    if not CtrlRendaFixa.VerificaOrdemLancada(Cds.FieldByName('IDORDEMRENFIX').AsInteger) then
    begin
       MsgDlg('Esta ordem já está lancada e não pode ser alterada.','Mensagem do Sistema',mtWarning,[MbOk],0);
       sbtnAlterar.Down := False;
       Exit;
    end;

  inherited;
   if dbDtaOperacao.CanFocus then
      dbDtaOperacao.SetFocus;
   cdsTipoOperacao.Data := CtrlRendaFixa.ListTipoOperRF(-1,True,cds.FieldByName('NATUREZAOPERACAO').AsString);
end;

procedure TfrmCadOrdemMovRFMT.dblkEmissorEnter(Sender: TObject);
begin
  inherited;
   iEmissorAnt := StrToInt(OperComum.IIF(dblkEmissor.LookupValue = '', '-1', dblkEmissor.LookupValue));
end;

procedure TfrmCadOrdemMovRFMT.dblkEmissorExit(Sender: TObject);
begin
  inherited;
   if Trim(dblkEmissor.LookupValue) <> '' then
   begin
      if StrToInt(dblkEmissor.LookupValue) <> iEmissorAnt then
         iEmissorAnt := StrToInt(OperComum.IIF(dblkEmissor.LookupValue = '', '-1', dblkEmissor.LookupValue));
      cdsInvestimento.Data := CtrlRendaFixa.ListInvestimentoRenFix(-1, StrToInt(dblkEmissor.LookupValue), 'S');
   end;
end;

procedure TfrmCadOrdemMovRFMT.dblkEmissorCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   if Trim(dblkEmissor.LookupValue) <> '' then
   begin
      if StrToInt(dblkEmissor.LookupValue) <> iEmissorAnt then
         iEmissorAnt := StrToInt(OperComum.IIF(dblkEmissor.LookupValue = '', '-1', dblkEmissor.LookupValue));
      cdsInvestimento.Data := CtrlRendaFixa.ListInvestimentoRenFix(-1, StrToInt(dblkEmissor.LookupValue), 'S');
   end;
end;

procedure TfrmCadOrdemMovRFMT.dblkPlanoPatroExit(Sender: TObject);
begin
  inherited;
   if Trim(dblkPlanoPatro.LookupValue) <> '' then
   begin
      if StrToInt(dblkPlanoPatro.LookupValue) <> iPlanoPatroAnt then
         iEmissorAnt := StrToInt(OperComum.IIF(dblkPlanoPatro.LookupValue = '', '-1', dblkPlanoPatro.LookupValue));
   end;
end;

procedure TfrmCadOrdemMovRFMT.dblkPlanoPatroCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   if Trim(dblkPlanoPatro.LookupValue) <> '' then
   begin
      if StrToInt(dblkPlanoPatro.LookupValue) <> iPlanoPatroAnt then
         iEmissorAnt := StrToInt(OperComum.IIF(dblkPlanoPatro.LookupValue = '', '-1', dblkPlanoPatro.LookupValue));
   end;
end;

procedure TfrmCadOrdemMovRFMT.dblkPlanoPatroEnter(Sender: TObject);
begin
  inherited;
   iPlanoPatroAnt := StrToInt(OperComum.IIF(dblkPlanoPatro.LookupValue = '', '-1', dblkPlanoPatro.LookupValue));
end;

procedure TfrmCadOrdemMovRFMT.CalculaValores(Sender: TObject);
begin
   if (Cds.FieldByName('VALOR').AsFloat = 0) and (Cds.FieldByName('QUANTIDADE').AsFloat <> 0) and (Cds.FieldByName('PUOPERACAO').AsFloat <> 0) then
      Cds.FieldByName('VALOR').AsFloat := OperComum.Round(dbrQtdeOperacao.Value * dbePuOperacao.Value,2);

   if (Cds.FieldByName('VALOR').AsFloat <> 0) and (Cds.FieldByName('QUANTIDADE').AsFloat <> 0) and (Cds.FieldByName('PUOPERACAO').AsFloat <> 0) then
   begin
      if not (Cds.FieldByName('VALOR').AsFloat = OperComum.Round(Cds.FieldByName('QUANTIDADE').AsFloat * Cds.FieldByName('PUOPERACAO').AsFloat,2)) then
      begin
         if MsgDlg('O Valor da Operação apresenta Divergência. Deseja ajustar ?','Mensagem do Sistema ', mtWarning ,[MbYes, MbNo],0) = MrYes Then
         begin

            case TDBRealEdit(Sender).Tag of
            -1: begin       // Alterado o Valor
                   if (dbrVlrOperacao.Value > 0) and (dbePuOperacao.Value > 0) then
                      Cds.FieldByName('QUANTIDADE').AsFloat :=  OperComum.Round(dbrVlrOperacao.Value / dbePuOperacao.Value, dbrQtdeOperacao.DecDigits);
                end;
            -2,-4: begin    // Alterado a Qtd ou PU
                   if (dbrQtdeOperacao.Value > 0) and (dbePuOperacao.Value > 0) then
                      Cds.FieldByName('VALOR').AsFloat := OperComum.Round(dbrQtdeOperacao.Value * dbePuOperacao.Value,2);
                   end;
            end;
         end;
      end;
   end;
end;

procedure TfrmCadOrdemMovRFMT.bbtnConfirmarClick(Sender: TObject);
begin
   CmeCadastro.RepetirInsert := False; //Cancelar o RepetirInserir
  inherited;
   sbtnInserir.Down := False;
//   bbtnCancelarClick(Sender);
end;

procedure TfrmCadOrdemMovRFMT.dbePuOperacaoExit(Sender: TObject);
begin
  inherited;
   CalculaValores(Sender);
end;

procedure TfrmCadOrdemMovRFMT.dbrQtdeOperacaoExit(Sender: TObject);
begin
  inherited;
   CalculaValores(Sender);
end;

procedure TfrmCadOrdemMovRFMT.dbrVlrOperacaoExit(Sender: TObject);
begin
  inherited;
   CalculaValores(Sender);
end;

procedure TfrmCadOrdemMovRFMT.sbtnApagarClick(Sender: TObject);
begin
    if not CtrlRendaFixa.VerificaOrdemLancada(Cds.FieldByName('IDORDEMRENFIX').AsInteger) then
    begin
       MsgDlg('Esta ordem já está lancada e não pode ser excluída.','Mensagem do Sistema',mtWarning,[MbOk],0);
       Exit;
    end;
  inherited;

end;

procedure TfrmCadOrdemMovRFMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
//     inherited;
   Accept := False;

   if Trim(dbDtaOperacao.Text) = '' then
   begin
      MsgDlg('Data da Operação não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbDtaOperacao.CanFocus then
         dbDtaOperacao.SetFocus;
      Exit;
   end;

   if Trim(dblkOperacao.Text) = '' then
   begin
      MsgDlg('Tipo de Operação não Selecionado.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dblkOperacao.CanFocus then
         dblkOperacao.SetFocus;
      Exit;
   end;

   if Trim(dblkPlanoPatro.Text) = '' then
   begin
      MsgDlg('Plano / Patrocinadora não Selecionada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dblkPlanoPatro.CanFocus then
         dblkPlanoPatro.SetFocus;
      Exit;
   end;

   if Trim(dblkEmissor.Text) = '' then
   begin
      MsgDlg('Emissor não Selecionada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dblkEmissor.CanFocus then
         dblkEmissor.SetFocus;
      Exit;
   end;

   if Trim(dblkInvestimento.Text) = '' then
   begin
      MsgDlg('Investimento não Selecionado.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dblkInvestimento.CanFocus then
         dblkInvestimento.SetFocus;
      Exit;
   end;

   if Trim(dblkCarteira.Text) = '' then
   begin
      MsgDlg('Carteira não Selecionada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dblkCarteira.CanFocus then
         dblkCarteira.SetFocus;
      Exit;
   end;

   if Trim(dblkForCli.Text) = '' then
   begin
      MsgDlg('Contra Parte não Selecionada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dblkForCli.CanFocus then
         dblkForCli.SetFocus;
      Exit;
   end;

   if Trim(dbDtaVencto.Text) = '' then
   begin
      MsgDlg('Data de Vencimento não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbDtaVencto.CanFocus then
         dbDtaVencto.SetFocus;
      Exit;
   end;

   if Trim(dbDtaLiquidacao.Text) = '' then
   begin
      MsgDlg('Data de Liquidação não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbDtaLiquidacao.CanFocus then
         dbDtaLiquidacao.SetFocus;
      Exit;
   end;

   if dbDtaLiquidacao.Date < dbDtaOperacao.Date then
   begin
      MsgDlg('A data de Liquidação não pode ser menor que '+#13+
             'data da Operação não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbDtaLiquidacao.CanFocus then
         dbDtaLiquidacao.SetFocus;
      Exit;
   end;

   if dbDtaVencto.Date < dbDtaOperacao.Date then
   begin
      MsgDlg('A data de Vencimento não pode ser menor que '+#13+
             'data da Operação não informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbDtaVencto.CanFocus then
         dbDtaVencto.SetFocus;
      Exit;
   end;

   if dbrQtdeOperacao.Value = 0 then
   begin
      MsgDlg('Quantidade da Operação não Informada.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbrQtdeOperacao.CanFocus then
         dbrQtdeOperacao.SetFocus;
      Exit;
   end;

   if dbrVlrOperacao.Value = 0 then
   begin
      MsgDlg('Valor da Operação não Informado.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbrVlrOperacao.CanFocus then
         dbrVlrOperacao.SetFocus;
      Exit;
   end;

   if dbePuOperacao.Value = 0 then
   begin
      MsgDlg('Preço Unitário da Operação não Informado.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dbePuOperacao.CanFocus then
         dbePuOperacao.SetFocus;
      Exit;
   end;

    if cdsTipoOperacao.FieldByName('NATUREZAOPERACAO').AsString = 'D' then
    begin
        if OperComum.ComparaValores(dbrVlrOperacao.Value,StrToFloat(msBuscaSaldos.ValoresChave[7]),'>') then
        begin
           MsgDlg('O Valor da Operação não pode ser maior que o Saldo do Investimento.','Mensagem do Sistema',mtWarning,[MbOk],0);
           if dbrVlrOperacao.CanFocus then
              dbrVlrOperacao.SetFocus;
           Exit;
        end;
        if OperComum.ComparaValores(dbrQtdeOperacao.Value,StrToFloat(msBuscaSaldos.ValoresChave[8]),'>') then
        begin
           MsgDlg('A Quantidade da Operação não pode ser maior que o Saldo do Investimento.','Mensagem do Sistema',mtWarning,[MbOk],0);
           if dbrQtdeOperacao.CanFocus then
              dbrQtdeOperacao.SetFocus;
           Exit;
        end;
    end;
   Accept := True;

end;

procedure TfrmCadOrdemMovRFMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
   begin
      Cds.Data := CtrlRendaFixa.ListOrdemRenFix(StrToInt(MontaSelect.ValoresChave[0]));
   end;
end;

procedure TfrmCadOrdemMovRFMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
   if ds.DataSet.State in [dsInsert] then
   begin
       if cdsTipoOperacao.FieldByName('NATUREZAOPERACAO').AsString = 'D' then
          Cds.FieldByName('IDOPERRENFIXAPLIC').AsInteger := StrToInt(msBuscaSaldos.ValoresChave[11]);
   end;
    Accept := CtrlRendaFixa.AplicaAtualOrdemRenFix;
  inherited;

end;

procedure TfrmCadOrdemMovRFMT.sbtnBuscaSaldosClick(Sender: TObject);
begin
  //inherited;
   msBuscaSaldos.Executar;
   if msBuscaSaldos.RetornouValor then
   begin
      sbtnInserirClick(Self);
      CmeCadastro.AtualizaBotoes(Self);
      sbtnInserir.Down := True;

      Cds.FieldByName('IDOPERRENFIXAPLIC').AsInteger := StrToInt(msBuscaSaldos.ValoresChave[11]);
      Cds.FieldByName('DATAVENCIMENTO').AsDateTime     := StrToDate(msBuscaSaldos.ValoresChave[6]);
      Cds.FieldByName('QUANTIDADE').AsFloat          := StrToFloat(msBuscaSaldos.ValoresChave[8]);
      Cds.FieldByName('VALOR').AsFloat               := StrToFloat(msBuscaSaldos.ValoresChave[7]);
      Cds.FieldByName('DATAORDEM').AsDateTime        := StrToDate(msBuscaSaldos.ValoresChave[5]);
      Cds.FieldByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(msBuscaSaldos.ValoresChave[20]);
      Cds.FieldByName('IDEMISSOR').AsInteger         := StrToInt(msBuscaSaldos.ValoresChave[0]);

      Cds.FieldByName('IDFORCLI').AsInteger          := StrToInt(msBuscaSaldos.ValoresChave[3]);
      Cds.FieldByName('IDCARTEIRAINVEST').AsInteger  := StrToInt(msBuscaSaldos.ValoresChave[2]);

      Cds.FieldByName('PUOPERACAO').AsFloat          := OperComum.Round((OperComum.DivValorZero(Cds.FieldByName('VALOR').AsFloat,Cds.FieldByName('QUANTIDADE').AsFloat)),9);
      Cds.FieldByName('DATALIQUIDACAO').AsDateTime   := StrToDate(msBuscaSaldos.ValoresChave[5]);

      cdsTipoOperacao.Data := CtrlRendaFixa.ListTipoOperRF(-1,True,'D');
      cdsInvestimento.Data := CtrlRendaFixa.ListInvestimentoRenFix(StrToInt(msBuscaSaldos.ValoresChave[1]), StrToInt(msBuscaSaldos.ValoresChave[0]), 'S');
      Cds.FieldByName('IDINVESTIMENTO').AsInteger    := StrToInt(msBuscaSaldos.ValoresChave[1]);

      dbDtaOperacao.Enabled     := False;
      dblkPlanoPatro.Enabled    := False;
      dblkEmissor.Enabled       := False;
      dblkInvestimento.Enabled  := False;
      dblkCarteira.Enabled := False;
      dblkForCli.Enabled   := False;

      if dblkOperacao.CanFocus then
         dblkOperacao.SetFocus;

   end;
end;

procedure TfrmCadOrdemMovRFMT.pnlControlesEnter(Sender: TObject);
begin
  inherited;
   if dbDtaVencto.CanFocus then
      dbDtaVencto.SetFocus;
end;

end.
