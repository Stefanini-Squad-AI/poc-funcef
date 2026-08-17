unit fConcilia;

// ------------------------------------------------------------------------------------------------
//
//	   Conciliação de Lançamentos Baixados
//
//	Autor             :  Alex Pereira
//	Data de Início    :  02/07/2001
//	Data de Término   :  06/07/2001
//
//	Modificações      :
//
//
//  Obs:  Falta gerar doc complementar da apuração da diferença. Dependendo do Edmar - e-mail 4/7/2001
//
// -------------------------------------------------------------------------------------------------



interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizard, ComCtrls, wwriched, StdCtrls, Grids, Wwdbigrd, Wwdbgrid,
  mContrato, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, Mask, fPreview,
  wwdbedit, Wwdbspin, mUsuario, fcButton, fcImgBtn, fcShapeBtn, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, fcLabel, mCliente,
  Wwdotdot, Wwdbcomb, mOrigemLanc, Db, DBTables, Wwquery, Wwdatsrc, Menus,
  ppDB, ppDBPipe, ppDBBDE, ppModule, raCodMod, ppVar, ppBands, ppStrtch,
  ppMemo, ppCtrls, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, ppTypes, uModuloImobiliario, uCtrlOperImob, uCtrlPadroes, uCtrlParamIntegra,
  uCtrlInadimplencia;


type
  TfrmConcilia = class(TfrmWizard)
    qryUpdConciliaNormal: TwwQuery;
    qryConciliaFeriado: TwwQuery;
    qryConciliaFeriadoCODDOCUMENTO: TFloatField;
    qryConciliaFeriadoDATAVENCIMENTO: TDateTimeField;
    qryConciliaFeriadoDATA_BAIXA: TDateTimeField;
    qryConciliaFeriadoTOT_RECEBER: TFloatField;
    qryConciliaFeriadoTOT_RECEBIDO: TFloatField;
    qryConciliaFeriadoFLGNAOCONCILIADO: TFloatField;
    qryConciliaFeriadoIDCONTRATOIMOVEL: TFloatField;
    updConciliaFeriado: TUpdateSQL;
    qryConciliaFeriadoIDCIDADES: TFloatField;
    qryConciliaFeriadoIDPAIS: TFloatField;
    qryConciliaFeriadoCODESTADO: TStringField;
    qryConciliaFeriadoCONDIASTOLERANCIA: TFloatField;
    qryConciliaFeriadoFLGTIPODIATOLERA: TStringField;
    qryConciliaFeriadoCONTRATO_EXTENSO: TStringField;
    qryConciliaFeriadoMESCOMPETENCIA: TFloatField;
    qryConciliaFeriadoANOCOMPETENCIA: TFloatField;
    dsConciliaFeriado: TwwDataSource;
    qryConciliaFeriadoDIF: TFloatField;
    qryConciliaFeriadoDATALIMITE: TDateTimeField;
    qryUpdDataLimite: TwwQuery;
    dsConciliaCalculo: TwwDataSource;
    updConciliaCalculo: TUpdateSQL;
    qryConciliaCalculo: TwwQuery;
    qryConciliaCalculoCODDOCUMENTO: TFloatField;
    qryConciliaCalculoDATAVENCIMENTO: TDateTimeField;
    qryConciliaCalculoDATA_BAIXA: TDateTimeField;
    qryConciliaCalculoTOT_RECEBER: TFloatField;
    qryConciliaCalculoTOT_RECEBIDO: TFloatField;
    qryConciliaCalculoFLGNAOCONCILIADO: TFloatField;
    qryConciliaCalculoIDCONTRATOIMOVEL: TFloatField;
    qryConciliaCalculoIDCIDADES: TFloatField;
    qryConciliaCalculoIDPAIS: TFloatField;
    qryConciliaCalculoCODESTADO: TStringField;
    qryConciliaCalculoCONDIASTOLERANCIA: TFloatField;
    qryConciliaCalculoFLGTIPODIATOLERA: TStringField;
    qryConciliaCalculoCONTRATO_EXTENSO: TStringField;
    qryConciliaCalculoMESCOMPETENCIA: TFloatField;
    qryConciliaCalculoANOCOMPETENCIA: TFloatField;
    ntbPrincipal: TNotebook;
    btnContinuaSelecao: TfcShapeBtn;
    MolUsuario1: TMolUsuario;
    grpCompetencia: TGroupBox;
    DBspnAnoCompetencia: TwwDBSpinEdit;
    cboMesCompetencia: TComboBox;
    grpDatas: TGroupBox;
    Label5: TLabel;
    edtDataIni: TCMDateTimePicker;
    edtDataFim: TCMDateTimePicker;
    rdgTipoData: TRadioGroup;
    chkCompetencia: TCheckBox;
    molContrato1: TmolContrato;
    molOrigemLanc1: TmolOrigemLanc;
    molCliente1: TmolCliente;
    lblLancamentos: TLabel;
    btnVoltar: TfcShapeBtn;
    btnContinuarLanc: TfcShapeBtn;
    dbGrdData: TwwDBGrid;
    Panel5: TPanel;
    btnAbonaData: TfcShapeBtn;
    lblCalculo: TLabel;
    Panel3: TPanel;
    fcShapeBtn4: TfcShapeBtn;
    dbGrdValor: TwwDBGrid;
    btnAbonaDif: TfcShapeBtn;
    btnCobranca: TfcShapeBtn;
    btnDiferenca: TfcShapeBtn;
    qryConciliaCalculoVLRJUROS: TFloatField;
    qryConciliaCalculoVLRMULTA: TFloatField;
    qryConciliaCalculoVLRCORRECAOMON: TFloatField;
    qryConciliaCalculoDIFERENCA: TFloatField;
    qryUpdLancamentosImovel: TwwQuery;
    qryConciliaCalculoVC: TFloatField;
    qryConciliaCalculoCONMOEDAMULTA: TFloatField;
    qryConciliaCalculoCONPERCENTMULTA: TFloatField;
    qryConciliaCalculoCONVLRMULTA: TFloatField;
    qryConciliaCalculoCONPERMORA: TStringField;
    qryConciliaCalculoFLGMORAPROPORC: TFloatField;
    qryConciliaCalculoCONPERCENTMORA: TFloatField;
    qryConciliaCalculoCONVLRMORA: TFloatField;
    qryConciliaCalculoCONMOEDAMORA: TFloatField;
    btnConsulta: TfcShapeBtn;
    btnImprime: TfcShapeBtn;
    rptConciliaCalculo: TppReport;
    ppConciliaCalculo: TppBDEPipeline;
    qryConciliaCalculoDATALIMITE: TDateTimeField;
    qryConciliaCalculoRS_FORCLI: TStringField;
    qryConciliaCalculoIDFORCLI: TFloatField;
    qryConciliaCalculoCODTIPIMOVEL: TStringField;
    qryConciliaCalculoIDINDCORRECAO: TFloatField;
    qryConciliaFeriadoCONDIASREPASSE: TFloatField;
    qryConciliaCalculoCONMESREFREAJUSTE: TStringField;
    HeaderBand1: TppHeaderBand;
    Label11: TppLabel;
    Line1: TppLine;
    LblEmpresa: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLine1: TppLine;
    ppLabel14: TppLabel;
    DetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppDBText1: TppDBText;
    FooterBand1: TppFooterBand;
    Line2: TppLine;
    LblSistema: TppLabel;
    Calc2: TppSystemVariable;
    Calc1: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    ppLabel13: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLine2: TppLine;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppLogoConcilia: TppImage;
    qryConciliaCalculoCONDIASREPASSE: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure btnContinuaSelecaoClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnAbonaDataClick(Sender: TObject);
    procedure ntbPrincipalPageChanged(Sender: TObject);
    procedure btnContinuarLancClick(Sender: TObject);
    procedure fcShapeBtn4Click(Sender: TObject);
    procedure btnAbonarCalculoClick(Sender: TObject);
    procedure btnAbonaDifClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbGrdDataCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbGrdDataTopRowChanged(Sender: TObject);
    procedure dbGrdValorCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbGrdValorTopRowChanged(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
    procedure btnImprimeClick(Sender: TObject);
    procedure rptConciliaCalculoBeforePrint(Sender: TObject);
    procedure btnCobrancaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
     { Private declarations }

     CtrlOperImob      : TCtrlOperImob;
     CtrlInadimplencia : TCtrlInadimplencia;

     procedure CalculaDocumentos;
     function MotivoAbono(var sMotivo: string): Boolean;
     procedure ParametrosQuery(QRY: TwwQuery);
     procedure MostraEspera(const sMensagem: string);
     procedure EscondeEspera;

     procedure MontaQueryConcilia;

     procedure GeraLancamentoAbono;
     procedure ConsolidaLancamentoAbono;
  public
    { Public declarations }
  end;

var
  frmConcilia: TfrmConcilia;

implementation

uses UDiasInUteis, UMolduras, UFuncoesImob, UDataBase, DImobiliario, UCalcDocumento, uMensErro,
     FEspera, uSistema, DLancImovel, RLancImovelNovo, UFormManager,
     fExecCobraDiverge;

{$R *.DFM}


procedure TfrmConcilia.CalculaDocumentos;
var
  iQuant, iAtual, iIndice, iUsaMesAnterior: integer;
  bIndCorrecao: Boolean;
  dProximoUtil : TDateTime;
  bTemBaixaParcial : Boolean;


  fValorAtual, fMulta, fJuros, fCorrecaoMonet, fMultaDif, fJurosDif, fCorrecaoMonetDif, fProporcao : Extended;
  fValorDiverg, fValorDivergAtual : Extended;
  dDataCalculo : TDateTime;

begin

   // ProgressBar
   iQuant := qryConciliaCalculo.RecordCount;
   MostraProgresso(ProgressBar, lblProgress, lblContador, iQuant, 'Calculando Documentos ...');
   iAtual := 0;
   bIndCorrecao := False;


   StartTransacao;
   try
      // calcula documentos em atraso
      while not qryConciliaCalculo.Eof do begin


         bTemBaixaParcial := (qryConciliaCalculoTOT_RECEBIDO.AsFloat < qryConciliaCalculoTOT_RECEBER.AsFloat);

         // Verifica uso do indice do mes anterior
         if qryConciliaCalculoCONMESREFREAJUSTE.AsString = 'A' then
              iUsaMesAnterior := 1
         else iUsaMesAnterior := 0;

         if qryConciliaCalculoIDINDCORRECAO.isNull then bIndCorrecao := True;

         // somente atualizar a data limite se a folha de alugueis ja não o fez.
         if qryConciliaCalculoDATALIMITE.IsNull then begin
            dProximoUtil := CalcDocumento.DataLimite(qryConciliaCalculoDATAVENCIMENTO.AsDateTime,
                              qryConciliaCalculoIDCIDADES.AsInteger,
                              qryConciliaCalculoIDPAIS.AsInteger,
                              qryConciliaCalculoCONDIASTOLERANCIA.AsInteger,
                              qryConciliaCalculoCONDIASREPASSE.AsInteger,
                              qryConciliaCalculoCODESTADO.AsString,
                              qryConciliaCalculoFLGTIPODIATOLERA.AsString, True, False, False);

            // atualizar a data limite de vencimento
            LimpaParametros(qryUpdDataLimite);
            qryUpdDataLimite.ParamByName('PDATALIMITE').AsDateTime := dProximoUtil;
            qryUpdDataLimite.ParamByName('PCODDOCUMENTO').AsInteger := qryConciliaCalculoCODDOCUMENTO.AsInteger;
            qryUpdDataLimite.ExecSQL;
         end else begin
            dProximoUtil := qryConciliaCalculoDATALIMITE.AsDateTime;
         end;

         fMulta            := 0;
         fJuros            := 0;
         fCorrecaoMonet    := 0;
         fMultaDif         := 0;
         fJurosDif         := 0;
         fCorrecaoMonetDif := 0;

         if (qryConciliaCalculoDATA_BAIXA.AsDateTime > dProximoUtil) and
            (qryConciliaCalculoTOT_RECEBIDO.AsFloat < qryConciliaCalculoTOT_RECEBER.AsFloat) then begin

            CtrlInadimplencia.DadosDocsVencidos( qryConciliaCalculoCODDOCUMENTO.AsInteger,
                                                 -1,
                                                 qryConciliaCalculoDATA_BAIXA.AsDateTime,
                                                 iUsaMesAnterior,
                                                 qryConciliaCalculoIDINDCORRECAO.AsInteger,
                                                 qryConciliaCalculoCONVLRMULTA.AsFloat,
                                                 qryConciliaCalculoCONPERCENTMULTA.AsFloat,
                                                 qryConciliaCalculoCONMOEDAMULTA.AsInteger,
                                                 qryConciliaCalculoCONVLRMORA.AsFloat,
                                                 qryConciliaCalculoCONPERCENTMORA.AsFloat,
                                                 qryConciliaCalculoCONMOEDAMORA.AsInteger,
                                                 qryConciliaCalculoFLGMORAPROPORC.AsInteger,
                                                 qryConciliaCalculoIDCIDADES.AsInteger,
                                                 qryConciliaCalculoIDPAIS.AsInteger,
                                                 qryConciliaCalculoCONDIASTOLERANCIA.AsInteger,
                                                 qryConciliaCalculoCONDIASREPASSE.AsInteger,
                                                 bTemBaixaParcial,
                                                 qryConciliaCalculoTOT_RECEBER.AsFloat,
                                                 qryConciliaCalculoTOT_RECEBIDO.AsFloat,
                                                 qryConciliaCalculoDATAVENCIMENTO.AsDateTime,
                                                 dProximoUtil,
                                                 qryConciliaCalculoCONPERMORA.AsString,
                                                 qryConciliaCalculoCODESTADO.AsString,
                                                 qryConciliaCalculoFLGTIPODIATOLERA.AsString,
                                                 qryConciliaCalculoFLGTIPODIATOLERA.AsString,
                                                 'L',
                                                 ModuloImobiliario.AdminImob.sFlgCalcInadimp,
                                                 False,
                                                 fValorAtual,
                                                 fMulta, fJuros, fCorrecaoMonet,
                                                 fMultaDif, fJurosDif, fCorrecaoMonetDif, fProporcao,
                                                 fValorDiverg, fValorDivergAtual,
                                                 dDataCalculo );
         end;

         LimpaParametros(qryUpdLancamentosImovel);
         qryUpdLancamentosImovel.ParamByName('PCODDOCUMENTO').AsInteger := qryConciliaCalculoCODDOCUMENTO.AsInteger;
         qryUpdLancamentosImovel.ParamByName('PVLRJUROS').AsFloat       := fJuros + fJurosDif;
         qryUpdLancamentosImovel.ParamByName('PVLRMULTA').AsFloat       := fMulta + fMultaDif;
         qryUpdLancamentosImovel.ParamByName('PVLRCORRECAOMON').AsFloat := fCorrecaoMonet + fCorrecaoMonetDif;
         qryUpdLancamentosImovel.ExecSQL;

         qryConciliaCalculo.Next;
         iAtual := iAtual + 1;
         AndaProgresso(ProgressBar, lblProgress, lblContador, iAtual, iQuant);
      end;
      CommitTransacao;
   except
      RollBackTransacao;
      MsgDlg('Erro ao se calcular Juros, Multa e Correção.','Erro',mtError,[mbok],0);
   end;

   if bIndCorrecao then begin
      MsgDlg('Existe(m) contrato(s) sem Indice de Correção para ' + #13#10 +
             'cálculo de atraso de pagamento cadastrado.','Aviso',mtWarning,[mbok],0);
   end;

   EscondeProgresso(ProgressBar, lblProgress, lblContador);
end;



function TfrmConcilia.MotivoAbono(var sMotivo: string): Boolean;
begin
   result := InputQuery('Motivo para abono', 'Motivo',sMotivo);
end;



procedure TfrmConcilia.MostraEspera(const sMensagem: string);
begin
   frmEspera.Config('Aguarde', sMensagem, False);
   frmEspera.Show;
   Application.ProcessMessages;
end;




procedure TfrmConcilia.EscondeEspera;
begin
   frmEspera.Hide;
   frmEspera.Config('', '', False);
end;



procedure TfrmConcilia.FormShow(Sender: TObject);
begin
   inherited;

   cboMesCompetencia.ItemIndex := DiasInUteis.ExtraiMes(date)-1;
   DBspnAnoCompetencia.Value   := DiasInUteis.ExtraiAno(date);

   AtribuiMolUsuario(MolUsuario1.iUsuario,MolUsuario1.edtUsuario);

   molContrato1.iContrato  := -1;
   molCliente1.iCliente    := -1;

   ntbPrincipal.PageIndex := 0;
end;



procedure TfrmConcilia.ParametrosQuery(QRY: TwwQuery);
begin
   with qry do begin
      if MolUsuario1.iUsuario <> -1    then ParamByName('PIDUSUARIOSISTEMA').AsInteger := MolUsuario1.iUsuario;
      if molContrato1.iContrato <> -1  then ParamByName('PIDCONTRATOIMOVEL').AsInteger := molContrato1.iContrato;
      if molCliente1.iCliente <> -1    then ParamByName('PIDFORCLI').AsInteger := molCliente1.iCliente;
      if molOrigemLanc1.cboOrigemLanc.Value <> '' then ParamByName('PFLGORIGEMLANC').AsString := molOrigemLanc1.cboOrigemLanc.Value;

      if not chkCompetencia.Checked then begin
         ParamByName('PMESCOMPETENCIA').AsInteger := cboMesCompetencia.ItemIndex + 1;
         ParamByName('PANOCOMPETENCIA').AsInteger := word(trunc(DBspnAnoCompetencia.Value));
      end;

      if (edtDataIni.Text <> '') and (edtDataFim.Text <> '') then begin
         case rdgTipoData.ItemIndex of
            0: begin
               ParamByName('PTRGDTINCLUSAOINI').AsDateTime := edtDataIni.DateTime;
               ParamByName('PTRGDTINCLUSAOFIM').AsDateTime := edtDataFim.DateTime;
            end;
            1: begin
               ParamByName('PDATALANCAMENTOINI').AsDateTime := edtDataIni.DateTime;
               ParamByName('PDATALANCAMENTOFIM').AsDateTime := edtDataFim.DateTime;
            end;
            2: begin
               ParamByName('PDATAVENCIMENTOINI').AsDateTime := edtDataIni.DateTime;
               ParamByName('PDATAVENCIMENTOFIM').AsDateTime := edtDataFim.DateTime;
            end;
         end;
      end;

   end;
end;




procedure TfrmConcilia.btnContinuaSelecaoClick(Sender: TObject);
var
  dProximoUtil: TDateTime;
  fQuant, fAtual: integer;
begin
   inherited;

   StartTransacao;
   try
      MostraEspera('Conciliando contratos pagos até o vencimento original...');

      // concilia todos os lançamentos baixados pelo valor original até a data de vencimento
      LimpaParametros(qryUpdConciliaNormal);
      ParametrosQuery(qryUpdConciliaNormal);  // passa os parametros para a query conforme o filtro da tela principal
      qryUpdConciliaNormal.ExecSQL;

      Temporiza(2);
      EscondeEspera;


      // concilia todos os lançamentos baixados pelo valor original em dia após o feriado/fim de semana ou na carência
      LimpaParametros(qryConciliaFeriado);
      ParametrosQuery(qryConciliaFeriado);
      qryConciliaFeriado.Open;

      // ProgressBar
      fQuant := qryConciliaFeriado.RecordCount;
      MostraProgresso(ProgressBar, lblProgress, lblContador, fQuant, 'Conciliando feriados, fins de semana ...');
      fAtual := 0;


      ProgressBar.Position := 1;
      while not qryConciliaFeriado.Eof do begin

         // somente atualizar a data limite se a folha de alugueis ja não o fez.
         if qryConciliaFeriadoDATALIMITE.IsNull then begin
            dProximoUtil := CalcDocumento.DataLimite(qryConciliaFeriadoDATAVENCIMENTO.AsDateTime,
                              qryConciliaFeriadoIDCIDADES.AsInteger,
                              qryConciliaFeriadoIDPAIS.AsInteger,
                              qryConciliaFeriadoCONDIASTOLERANCIA.AsInteger,
                              qryConciliaFeriadoCONDIASREPASSE.AsInteger,
                              qryConciliaFeriadoCODESTADO.AsString,
                              qryConciliaFeriadoFLGTIPODIATOLERA.AsString, True, False, False);

            // atualizar a data limite de vencimento
            LimpaParametros(qryUpdDataLimite);
            qryUpdDataLimite.ParamByName('PDATALIMITE').AsDateTime := dProximoUtil;
            qryUpdDataLimite.ParamByName('PCODDOCUMENTO').AsInteger := qryConciliaFeriadoCODDOCUMENTO.AsInteger;
            qryUpdDataLimite.ExecSQL;
         end else begin
            dProximoUtil := qryConciliaFeriadoDATALIMITE.AsDateTime;
         end;


         // o locatário pagou o aluguel em um dia útil válido sem cálculo de multa
         if dProximoUtil >= qryConciliaFeriadoDATA_BAIXA.AsDateTime then begin
            qryConciliaFeriado.Edit;
            qryConciliaFeriadoFLGNAOCONCILIADO.Clear;
            qryConciliaFeriado.Post;
         end;

         qryConciliaFeriado.Next;
         fAtual := fAtual + 1;
         AndaProgresso(ProgressBar, lblProgress, lblContador, fAtual, fQuant);
         Application.ProcessMessages;
      end;
      qryConciliaFeriado.ApplyUpdates;
      CommitTransacao;
      EscondeProgresso(ProgressBar, lblProgress, lblContador);

      qryConciliaFeriado.Close;
      qryConciliaFeriado.Open;

      lblLancamentos.Caption := 'Lançamento(s): ' + inttostr(qryConciliaFeriado.RecordCount);
      ntbPrincipal.PageIndex := ntbPrincipal.PageIndex + 1;

   except
      qryConciliaFeriado.CancelUpdates;
      RollBackTransacao;
      MsgDlg ('Ocorreu um erro na conciliação dos lançamentos pagos pelo valor original.','Aviso',mtWarning,[mbok],0);
   end;

end;

procedure TfrmConcilia.btnVoltarClick(Sender: TObject);
begin
   inherited;
   qryConciliaFeriado.CancelUpdates;
   RollBackTransacao;

   qryConciliaFeriado.Close;

   ntbPrincipal.PageIndex := ntbPrincipal.PageIndex - 1;
end;

procedure TfrmConcilia.btnAbonaDataClick(Sender: TObject);
var
   sMotivo: string;
   i: integer;
begin
   inherited;
   if MotivoAbono(sMotivo) then begin // usuário confirmou o motivo do Abono

      StartTransacao;
      with DBgrdData, DBgrdData.datasource.dataset do begin
         DisableControls;	{Disable controls to improve performance}
         try
            for i:= 0 to SelectedList.Count-1 do begin
               GotoBookmark(SelectedList.items[i]);
               Freebookmark(SelectedList.items[i]);

               // MARCAR O FLGNAOCONCILIADO COMO NULL
               qryConciliaFeriado.Edit;
               qryConciliaFeriadoFLGNAOCONCILIADO.Clear;
               qryConciliaFeriado.Post;

               { GRAVA O MOTIVO DA CONCILIAÇÃO
                 é necessário apagar o motivo da conciliação antes pois o usuário do contas a receber pode
                 ter alterado o lançamento de pagamento colocando o flgnaointegrado como 1 e o motivo do
                 abono neste caso conteria um lixo }
               CalcDocumento.ApagarMotivoConciliacao(qryConciliaFeriadoCODDOCUMENTO.AsInteger, -1, 'A');
               CalcDocumento.GravarMotivoConciliacao(qryConciliaFeriadoCODDOCUMENTO.AsInteger, -1, Sistema.IdUsuario, -1, -1, qryConciliaFeriadoDIF.AsInteger, null, sMotivo, 'A');

            end;

            qryConciliaFeriado.ApplyUpdates;

            CommitTransacao;
            qryConciliaFeriado.Close;
            qryConciliaFeriado.Open;
            lblLancamentos.Caption := 'Lançamento(s): ' + inttostr(qryConciliaFeriado.RecordCount);
         except
            qryConciliaFeriado.CancelUpdates;
            RollBackTransacao;
            MsgDlg('Ocorreu algum erro na tentativa de se registrar o abono.','erro',mtError,[mbok],0);
         end;

         SelectedList.clear;	{ Clear selected record list }
                              { since they are all deleted }
         EnableControls;		{ Re-enable controls }
      end;
   end;
end;

procedure TfrmConcilia.ntbPrincipalPageChanged(Sender: TObject);
begin
   inherited;
   case ntbPrincipal.PageIndex of
      0: lblTitulo.Caption := 'Conciliação de Lançamentos [Seleção]';
      1: lblTitulo.Caption := 'Conciliação de Lançamentos [Valor Original]';
      2: lblTitulo.Caption := 'Conciliação de Lançamentos [Documentos Corrigidos]';
   end;
end;



procedure TfrmConcilia.btnContinuarLancClick(Sender: TObject);
begin
   inherited;
   qryConciliaFeriado.DisableControls;
   qryConciliaCalculo.DisableControls;

   qryConciliaFeriado.Close;

   // concilia todos os lançamentos restantes
   LimpaParametros(qryConciliaCalculo);
   MontaQueryConcilia;
   ParametrosQuery(qryConciliaCalculo);
   qryConciliaCalculo.Open;

   // calcula os documentos em atraso
   if (ModuloImobiliario.AdminImob.iTipoOperAtualMulta <= 0) or
      (ModuloImobiliario.AdminImob.iTipoOperAtualJuros <= 0) or
      (ModuloImobiliario.AdminImob.iTipoOperAtualCM    <= 0) then
   begin
      CalculaDocumentos;
      qryConciliaCalculo.Close;
      qryConciliaCalculo.Open;
   end;

   qryConciliaFeriado.EnableControls;
   qryConciliaCalculo.EnableControls;

   lblCalculo.Caption := 'Lancamento(s): '+inttostr(qryConciliaCalculo.RecordCount);
   ntbPrincipal.PageIndex := ntbPrincipal.PageIndex + 1;
end;

procedure TfrmConcilia.fcShapeBtn4Click(Sender: TObject);
begin
   inherited;
   // é necessário abrir novamente a qryConciliaFeriado pois pode ter ocorrido alguma forma de conciliação nesta tela
   // concilia todos os lançamentos baixados pelo valor original em dia após o feriado/fim de semana ou na carência
   LimpaParametros(qryConciliaFeriado);
   ParametrosQuery(qryConciliaFeriado);
   qryConciliaFeriado.Open;

   ntbPrincipal.PageIndex := ntbPrincipal.PageIndex - 1;

end;

procedure TfrmConcilia.btnAbonarCalculoClick(Sender: TObject);
var
   sMotivo: string;
begin
   inherited;
   if not qryConciliaCalculoFLGNAOCONCILIADO.IsNull then begin
      if InputQuery('Motivo para abono', 'Motivo', sMotivo) then begin
         qryConciliaCalculo.Edit;
         qryConciliaCalculoFLGNAOCONCILIADO.Clear;
         qryConciliaCalculo.Post;
         qryConciliaCalculo.ApplyUpdates;
      end;
   end;
end;

procedure TfrmConcilia.btnAbonaDifClick(Sender: TObject);
var
   sMotivo: string;
   i: integer;
begin
   inherited;
   if MotivoAbono(sMotivo) then begin // usuário confirmou o motivo do Abono

      StartTransacao;
      with DBgrdValor, DBgrdValor.datasource.dataset do begin
         DisableControls;	{Disable controls to improve performance}
         try
            for i:= 0 to SelectedList.Count-1 do begin
               GotoBookmark(SelectedList.items[i]);
               Freebookmark(SelectedList.items[i]);

               // MARCAR O FLGNAOCONCILIADO COMO NULL
               qryConciliaCalculo.Edit;
               qryConciliaCalculoFLGNAOCONCILIADO.Clear;
               qryConciliaCalculo.Post;

               { GRAVA O MOTIVO DA CONCILIAÇÃO
                 é necessário apagar o motivo da conciliação antes pois o usuário do contas a receber pode
                 ter alterado o lançamento de pagamento colocando o flgnaointegrado como 1 e o motivo do
                 abono neste caso conteria um lixo }
               CalcDocumento.ApagarMotivoConciliacao(qryConciliaCalculoCODDOCUMENTO.AsInteger, -1, 'A');
               CalcDocumento.GravarMotivoConciliacao(qryConciliaCalculoCODDOCUMENTO.AsInteger, -1, Sistema.IdUsuario, -1, -1, null, qryConciliaCalculoDIFERENCA.AsFloat, sMotivo, 'A');

               // Marchetti - Pendencia 19914
               GeraLancamentoAbono;
               // Fim Marchetti - Pendencia 19914

            end;

            qryConciliaCalculo.ApplyUpdates;

            // Marchetti - Pendencia 19914
            ConsolidaLancamentoAbono;
            // Fim Marchetti - Pendencia 19914

            CommitTransacao;
            qryConciliaCalculo.Close;
            qryConciliaCalculo.Open;
            lblCalculo.Caption := 'Lançamento(s): ' + inttostr(qryConciliaCalculo.RecordCount);
         except
            qryConciliaCalculo.CancelUpdates;
            RollBackTransacao;
            MsgDlg('Ocorreu algum erro na tentativa de se registrar o abono.','erro',mtError,[mbok],0);
         end;

         SelectedList.clear;	{ Clear selected record list }
                              { since they are all deleted }
         EnableControls;		{ Re-enable controls }
      end;
   end;
end;

procedure TfrmConcilia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
   qryConciliaCalculo.Close;
   qryConciliaFeriado.Close;
end;

procedure TfrmConcilia.dbGrdDataCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
   inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWindow;
         end;
      end;
      // colorir a coluna do dia
      if (State <> [gdSelected]) and (Field.Name = 'qryConciliaFeriadoDIF') then begin
         ABrush.Color :=  clRed;
         AFont.Color  := clWindow;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;

procedure TfrmConcilia.dbGrdDataTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmConcilia.dbGrdValorCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;

   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWindow;
         end;
      end;

      if field.Name = 'qryConciliaCalculoDIFERENCA' then begin
         if Field.AsFloat < 0 then
            AFont.Color := clRed
         else
            AFont.Color := clBlue;
      end;

   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;

end;

procedure TfrmConcilia.dbGrdValorTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmConcilia.btnConsultaClick(Sender: TObject);
begin
   inherited;
   frmRelLancImovelNovo := TfrmRelLancImovelNovo.Create(self);
   frmRelLancImovelNovo.iDocumento := qryConciliaCalculoCODDOCUMENTO.AsInteger;
   frmRelLancImovelNovo.Seleciona;
   frmRelLancImovelNovo.MDIVisible := true;
   frmRelLancImovelNovo.Show;

end;

procedure TfrmConcilia.btnImprimeClick(Sender: TObject);
begin
  inherited;
  qryConciliaCalculo.DisableControls;

  // Carrega o Logotipo - Marcio Motta - 09/08/2004
  if ModuloImobiliario.AdminImob.bFlgLogoRelat then
     ppLogoConcilia.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
  else
     ppLogoConcilia.Picture := nil;


  TfrmPreview.CreateModalPreview(Application, rptConciliaCalculo,
                                 rptConciliaCalculo.PrinterSetup.DocumentName);
  qryConciliaCalculo.EnableControls;
end;

procedure TfrmConcilia.rptConciliaCalculoBeforePrint(Sender: TObject);
begin
   inherited;
   lblEmpresa.Caption := Sistema.NomeEmpresa;
   lblSistema.Caption := Sistema.NomeCompleto;
end;

procedure TfrmConcilia.btnCobrancaClick(Sender: TObject);
var i : Integer;
    bContrato : Boolean;
begin
   inherited;

   // Cria form de Lancamento de Divergencias
   Application.CreateForm(TfrmExecCobraDiverge, frmExecCobraDiverge);

   // Inicializa o Vetor
   i := DBgrdValor.SelectedList.Count;
   with frmExecCobraDiverge do begin
      Diverge.vCodDoc   := nil;
      Diverge.vDtPagto  := nil;
      Diverge.vVlrMulta := nil;
      Diverge.vVlrJuros := nil;
      Diverge.vVlrCorr  := nil;
      SetLength(Diverge.vCodDoc,   i);
      SetLength(Diverge.vDtPagto,  i);
      SetLength(Diverge.vVlrMulta, i);
      SetLength(Diverge.vVlrJuros, i);
      SetLength(Diverge.vVlrCorr,  i);

      // zera totalizadores
      Diverge.fTotCorrecao := 0;
      Diverge.fTotMulta    := 0;
      Diverge.fTotJuros    := 0;
      Diverge.bLancOK      := False;
   end;

   // Monta Registro com as Divergencias
   with DBgrdValor, DBgrdValor.datasource.dataset do begin
      DisableControls;
      for i := 0 to SelectedList.Count-1 do begin
         GotoBookmark(SelectedList.items[i]);
         Freebookmark(SelectedList.items[i]);
         if i = 0 then begin
            frmExecCobraDiverge.Diverge.iContrato     := qryConciliaCalculoIDCONTRATOIMOVEL.AsInteger;
            frmExecCobraDiverge.Diverge.sContrato     := qryConciliaCalculoCONTRATO_EXTENSO.AsString;
            frmExecCobraDiverge.Diverge.iCliente      := qryConciliaCalculoIDFORCLI.AsInteger;
            frmExecCobraDiverge.Diverge.sCliente      := qryConciliaCalculoRS_FORCLI.AsString;
            frmExecCobraDiverge.Diverge.sCodTipImovel := qryConciliaCalculoCODTIPIMOVEL.AsString;
            bContrato := True;
         end else begin
            if qryConciliaCalculoIDCONTRATOIMOVEL.AsInteger <> frmExecCobraDiverge.Diverge.iContrato then bContrato := False;
         end;

         frmExecCobraDiverge.Diverge.vCodDoc[i]   := qryConciliaCalculoCODDOCUMENTO.AsInteger;
         frmExecCobraDiverge.Diverge.vDtPagto[i]  := qryConciliaCalculoDATA_BAIXA.AsDateTime;
         frmExecCobraDiverge.Diverge.vVlrMulta[i] := qryConciliaCalculoVLRMULTA.AsFloat;
         frmExecCobraDiverge.Diverge.vVlrJuros[i] := qryConciliaCalculoVLRJUROS.AsFloat;
         frmExecCobraDiverge.Diverge.vVlrCorr[i]  := qryConciliaCalculoVLRCORRECAOMON.AsFloat;

         frmExecCobraDiverge.Diverge.fTotCorrecao := frmExecCobraDiverge.Diverge.fTotCorrecao +
                                                     qryConciliaCalculoVLRCORRECAOMON.AsFloat;
         frmExecCobraDiverge.Diverge.fTotMulta    := frmExecCobraDiverge.Diverge.fTotMulta    +
                                                     qryConciliaCalculoVLRMULTA.AsFloat;
         frmExecCobraDiverge.Diverge.fTotJuros    := frmExecCobraDiverge.Diverge.fTotJuros    +
                                                     qryConciliaCalculoVLRJUROS.AsFloat;

      end;
      SelectedList.clear;	{ Clear selected record list }
      EnableControls;
   end;

   if bContrato then begin
      // Abre o form para informar os dados do novo boleto
      frmExecCobraDiverge.ShowModal;

      // Atualiza a query do form Concilia
      if frmExecCobraDiverge.Diverge.bLancOK then begin
         qryConciliaCalculo.Close;
         qryConciliaCalculo.Open;
         lblCalculo.Caption := 'Lançamento(s): ' + inttostr(qryConciliaCalculo.RecordCount);
      end;

   end else begin
      MsgDlg('As Divergências selecionadas não pertencem do mesmo contrato','Aviso',mtWarning,[mbOk],0);
   end;
end;



procedure TfrmConcilia.MontaQueryConcilia;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT DISTINCT '                                                      + #13 +
   '   V.CODDOCUMENTO,        V.DATAVENCIMENTO,      V.DATA_BAIXA, '       + #13 +
   '   V.TOT_RECEBER,         V.TOT_RECEBIDO,        V.FLGNAOCONCILIADO, ' + #13 +
   '   V.IDCONTRATOIMOVEL,    V.IDCIDADES,           V.IDPAIS, '           + #13 +
   '   V.CODESTADO,           V.CONDIASTOLERANCIA,   V.FLGTIPODIATOLERA, ' + #13 +
   '   V.RS_FORCLI,           V.IDFORCLI,            V.DATALIMITE, '       + #13 +
   '   V.CONTRATO_EXTENSO,    V.MESCOMPETENCIA,      V.ANOCOMPETENCIA, '   + #13 +
   '   V.IDINDCORRECAO,       V.CONMOEDAMULTA,       V.CONPERCENTMULTA, '  + #13 +
   '   V.CONVLRMULTA,         V.CONPERMORA,          V.FLGMORAPROPORC, '   + #13 +
   '   V.CONPERCENTMORA,      V.CONVLRMORA,          V.CONMOEDAMORA, '     + #13 +
   '   V.CODTIPIMOVEL,        V.CONMESREFREAJUSTE,   V.CONDIASREPASSE, '   + #13;

   if (ModuloImobiliario.AdminImob.iTipoOperAtualMulta > 0) or
      (ModuloImobiliario.AdminImob.iTipoOperAtualJuros > 0) or
      (ModuloImobiliario.AdminImob.iTipoOperAtualCM > 0) then
   begin
      sSQL := sSQL +
      '  JR.VLRACUM AS VLRJUROS, MT.VLRACUM AS VLRMULTA, CR.VLRACUM AS VLRCORRECAOMON, '        + #13 +
      '  NVL(V.TOT_RECEBER,0)+NVL(JR.VLRACUM,0)+NVL(MT.VLRACUM,0)+NVL(CR.VLRACUM,0) AS VC,'        + #13 +
      '  NVL(V.TOT_RECEBER,0)+NVL(JR.VLRACUM,0)+NVL(MT.VLRACUM,0)+NVL(CR.VLRACUM,0) - NVL(V.TOT_RECEBIDO,0) AS DIFERENCA' + #13;
   end
   else
   begin
      sSQL := sSQL +
      '   V.VLRJUROS,            V.VLRMULTA,            V.VLRCORRECAOMON, '                     + #13 +
      '  (V.TOT_RECEBER+V.VLRJUROS+V.VLRMULTA+V.VLRCORRECAOMON) AS VC, '                        + #13 +
      '  (V.TOT_RECEBER+V.VLRJUROS+V.VLRMULTA+V.VLRCORRECAOMON - V.TOT_RECEBIDO) AS DIFERENCA ' + #13;
   end;

   sSQL := sSQL +

   'FROM '                                                                                      + #13 +
   '   VWLANCAMENTO V '                                                                         + #13;

   if (ModuloImobiliario.AdminImob.iTipoOperAtualMulta > 0) or
      (ModuloImobiliario.AdminImob.iTipoOperAtualJuros > 0) or
      (ModuloImobiliario.AdminImob.iTipoOperAtualCM    > 0) then
   begin
      sSQL := sSQL + ',' + #13 +
      '   (SELECT LO.CODDOCUMENTO,                                        ' + #13 +
      '           SUM(LO.VLRACUM) AS VLRACUM                              ' + #13 +
      '     FROM LANCOPERDIAIMOB LO, PARAMIMOVEL PI,                      ' + #13 +
      '          ( SELECT LO2.CODDOCUMENTO, MAX(LO2.DATAOPER) AS ULTDIA   ' + #13 +
      '              FROM LANCOPERDIAIMOB LO2, PARAMIMOVEL PI2            ' + #13 +
      '             WHERE LO2.IDOPERACAO = PI2.IDOPERATUALJUROS AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'')          ' + #13 +
      '             GROUP BY LO2.CODDOCUMENTO                             ' + #13 +
      '           ) UD                                                    ' + #13 +
      '    WHERE LO.IDOPERACAO   = PI.IDOPERATUALJUROS                    ' + #13 +
      '      AND LO.CODDOCUMENTO  = UD.CODDOCUMENTO (+)                   ' + #13 +
      '      AND LO.DATAOPER      = UD.ULTDIA AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'')                            ' + #13 +
      '    GROUP BY LO.CODDOCUMENTO                                       ' + #13 +
      '   ) JR,                                                           ' + #13 +
      '   (SELECT LO.CODDOCUMENTO,                                        ' + #13 +
      '           SUM(LO.VLRACUM) AS VLRACUM                              ' + #13 +
      '     FROM LANCOPERDIAIMOB LO, PARAMIMOVEL PI,                      ' + #13 +
      '          ( SELECT LO2.CODDOCUMENTO, MAX(LO2.DATAOPER) AS ULTDIA   ' + #13 +
      '              FROM LANCOPERDIAIMOB LO2, PARAMIMOVEL PI2            ' + #13 +
      '             WHERE LO2.IDOPERACAO = PI2.IDOPERATUALMULTA AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'')          ' + #13 +
      '             GROUP BY LO2.CODDOCUMENTO                             ' + #13 +
      '           ) UD                                                    ' + #13 +
      '    WHERE LO.IDOPERACAO   = PI.IDOPERATUALMULTA                    ' + #13 +
      '      AND LO.CODDOCUMENTO  = UD.CODDOCUMENTO (+)                   ' + #13 +
      '      AND LO.DATAOPER      = UD.ULTDIA AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'')                            ' + #13 +
      '    GROUP BY LO.CODDOCUMENTO                                       ' + #13 +
      '   ) MT,                                                           ' + #13 +
      '   (SELECT LO.CODDOCUMENTO,                                        ' + #13 +
      '           SUM(LO.VLRACUM) AS VLRACUM                              ' + #13 +
      '     FROM LANCOPERDIAIMOB LO, PARAMIMOVEL PI,                      ' + #13 +
      '          ( SELECT LO2.CODDOCUMENTO, MAX(LO2.DATAOPER) AS ULTDIA   ' + #13 +
      '              FROM LANCOPERDIAIMOB LO2, PARAMIMOVEL PI2            ' + #13 +
      '             WHERE LO2.IDOPERACAO = PI2.IDOPERATUALCM AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'')             ' + #13 +
      '             GROUP BY LO2.CODDOCUMENTO                             ' + #13 +
      '           ) UD                                                    ' + #13 +
      '    WHERE LO.IDOPERACAO   = PI.IDOPERATUALCM                       ' + #13 +
      '      AND LO.CODDOCUMENTO  = UD.CODDOCUMENTO (+)                   ' + #13 +
      '      AND LO.DATAOPER      = UD.ULTDIA AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'')                            ' + #13 +
      '    GROUP BY LO.CODDOCUMENTO                                       ' + #13 +
      '   ) CR                                                            ' + #13;
   end;

   sSQL := sSQL +

   'WHERE ' + #13 +
   '       ( V.IDMODULO = 64 ) '                                                                                + #13 +
   '   AND ( V.FLGNAOCONCILIADO = 1 ) '                                                                         + #13 +
   '   AND ( V.RECPAG = ''R'' ) '                                                                               + #13 +

   // Vinicius - Ajustes incluidos por analise na CBS 01/11/2006
   '   AND ( V.FLGESTORNADO IS NULL ) ' + #13 +

   '   AND ( V.IDCONTRATOIMOVEL IS NOT NULL) '                                                                  + #13 +
   '   AND ( (:PIDUSUARIOSISTEMA IS NULL) OR (V.IDUSUARIOSISTEMA = :PIDUSUARIOSISTEMA) ) '                      + #13 +
   '   AND ( (:PIDCONTRATOIMOVEL IS NULL) OR (V.IDCONTRATOIMOVEL = :PIDCONTRATOIMOVEL) ) '                      + #13 +
   '   AND ( (:PIDFORCLI IS NULL) OR (V.IDFORCLI = :PIDFORCLI) ) '                                              + #13 +
   '   AND ( (:PMESCOMPETENCIA IS NULL) OR ((MESCOMPETENCIA = :PMESCOMPETENCIA) AND (ANOCOMPETENCIA = :PANOCOMPETENCIA)) ) ' + #13 +
   '   AND ( (:PFLGORIGEMLANC IS NULL) OR (FLGORIGEMLANC = :PFLGORIGEMLANC) ) '                                 + #13 +
   '   AND ( (:PTRGDTINCLUSAOINI IS NULL) OR (TRGDTINCLUSAO BETWEEN :PTRGDTINCLUSAOINI AND :PTRGDTINCLUSAOFIM) ) ' + #13 +
   '   AND ( (:PDATALANCAMENTOINI IS NULL) OR (DATALANCAMENTO BETWEEN :PDATALANCAMENTOINI AND :PDATALANCAMENTOFIM) ) ' + #13 +
   '   AND ( (:PDATAVENCIMENTOINI IS NULL) OR (DATAVENCIMENTO BETWEEN :PDATAVENCIMENTOINI AND :PDATAVENCIMENTOFIM) ) ' + #13;

  if (ModuloImobiliario.AdminImob.iTipoOperAtualMulta > 0) or
     (ModuloImobiliario.AdminImob.iTipoOperAtualJuros > 0) or
     (ModuloImobiliario.AdminImob.iTipoOperAtualCM    > 0) then
  begin
     sSQL := sSQL + 'AND V.CODDOCUMENTO = JR.CODDOCUMENTO(+) ' + #13;
     sSQL := sSQL + 'AND V.CODDOCUMENTO = MT.CODDOCUMENTO(+) ' + #13;
     sSQL := sSQL + 'AND V.CODDOCUMENTO = CR.CODDOCUMENTO(+) ' + #13;
     sSQL := sSQL + 'AND V.TOT_RECEBIDO <> 0 ' + #13;
     sSQL := sSQL + 'AND ( NVL(V.TOT_RECEBER,0)+NVL(JR.VLRACUM,0)+NVL(MT.VLRACUM,0)+NVL(CR.VLRACUM,0) - NVL(V.TOT_RECEBIDO,0) ) <> 0 '+#13;
  end else begin
     sSQL := sSQL + 'AND ( V.STATUS_DOC = ''2'' ) '  + #13;
  end;

  sSQL := sSQL +
  'ORDER BY ' + #13 +
  '   DIFERENCA ' + #13;

   qryConciliaCalculo.Sql.Text := sSQL;
end;



procedure TfrmConcilia.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlOperImob := TCtrlOperImob.Create(Sistema.IDEmpresa, Sistema.IDModulo, Sistema.IDUsuario, Sistema.IDEspAcesso, ParamIntegra.PlanoPrevGlobal, ParamIntegra.PatroGlobal, Sistema.UsaPlanoPatro);
   CtrlOperImob.InitializeAs(Padroes);

   CtrlInadimplencia := TCtrlInadimplencia.Create(Sistema.IDEmpresa,Sistema.IDModulo,Sistema.IDUsuario,Sistema.IDEspAcesso,Sistema.UsaPlanoPatro);
   CtrlInadimplencia.InitializeAs(Padroes);
end;



procedure TfrmConcilia.FormDestroy(Sender: TObject);
begin
   FreeAndNil( CtrlOperImob );
   FreeAndNil( CtrlInadimplencia );
   inherited;
end;



procedure TfrmConcilia.ConsolidaLancamentoAbono;
begin
   if (ModuloImobiliario.AdminImob.iTipoOperAbonoMulta > 0) or
      (ModuloImobiliario.AdminImob.iTipoOperAbonoJuros > 0) or
      (ModuloImobiliario.AdminImob.iTipoOperAbonoCM > 0) then
   begin
       CtrlOperImob.GravaLancOperImob(CtrlOperImob.ProgressFileName,
                                      [ModuloImobiliario.AdminImob.iTipoOperAbonoMulta,
                                       ModuloImobiliario.AdminImob.iTipoOperAbonoJuros,
                                       ModuloImobiliario.AdminImob.iTipoOperAbonoCM], Date, 1,False);

       CtrlOperImob.IntegraProvisao(CtrlOperImob.ProgressFileName,
                                    ModuloImobiliario.AdminImob.iTipoOperAbonoMulta,
                                    ModuloImobiliario.AdminImob.iTipoOperAbonoJuros,
                                    ModuloImobiliario.AdminImob.iTipoOperAbonoCM, -1, -1,
                                    '', Date);
   end;
end;



procedure TfrmConcilia.GeraLancamentoAbono;
begin
   if (ModuloImobiliario.AdminImob.iTipoOperAbonoMulta > 0) or
      (ModuloImobiliario.AdminImob.iTipoOperAbonoJuros > 0) or
      (ModuloImobiliario.AdminImob.iTipoOperAbonoCM > 0) then
   begin
      if (qryConciliaCalculoVLRJUROS.AsFloat <> 0) and (ModuloImobiliario.AdminImob.iTipoOperAbonoJuros > 0) then
      begin
         CtrlOperImob.GravaLancOperDiaImob(Date,                                                   // dDataLancto
                                           -1,                                                     // dDataBaixa
                                           ModuloImobiliario.AdminImob.iTipoOperAbonoJuros,        // iIdOper
                                           0,                                                      // fVlrDia,
                                           qryConciliaCalculoVLRJUROS.AsFloat,                     // fVlrAcum
                                           qryConciliaCalculoVLRJUROS.AsFloat,                     // fVlrTotAcum ???
                                           qryConciliaCalculoCODTIPIMOVEL.AsString,                // sTipoImovel
                                           qryConciliaCalculoIDCONTRATOIMOVEL.AsInteger,           // iIdContrato
                                           -1,                                                     // iIdForCli
                                           qryConciliaCalculoCODDOCUMENTO.AsInteger,               // iCodDocum
                                           False,                                                  // bGravaDiaNull
                                           -1                                                      // IDParcela
                                           );
      end;

      if (qryConciliaCalculoVLRMULTA.AsFloat <> 0) and (ModuloImobiliario.AdminImob.iTipoOperAbonoMulta > 0) then
      begin
         CtrlOperImob.GravaLancOperDiaImob(Date,                                                   // dDataLancto
                                           -1,                                                     // dDataBaixa
                                           ModuloImobiliario.AdminImob.iTipoOperAbonoMulta,        // iIdOper
                                           0,                                                      // fVlrDia,
                                           qryConciliaCalculoVLRMULTA.AsFloat,                     // fVlrAcum
                                           qryConciliaCalculoVLRMULTA.AsFloat,                     // fVlrTotAcum ???
                                           qryConciliaCalculoCODTIPIMOVEL.AsString,                // sTipoImovel
                                           qryConciliaCalculoIDCONTRATOIMOVEL.AsInteger,           // iIdContrato
                                           -1,                                                     // iIdForCli
                                           qryConciliaCalculoCODDOCUMENTO.AsInteger,               // iCodDocum
                                           False,                                                  // bGravaDiaNull
                                           -1                                                      // IDParcela
                                          );
      end;


      if (qryConciliaCalculoVLRCORRECAOMON.AsFloat <> 0) and (ModuloImobiliario.AdminImob.iTipoOperAbonoCM > 0) then
      begin
         CtrlOperImob.GravaLancOperDiaImob(Date,                                                   // dDataLancto
                                           -1,                                                     // dDataBaixa
                                           ModuloImobiliario.AdminImob.iTipoOperAbonoCM,           // iIdOper
                                           0,                                                      // fVlrDia,
                                           qryConciliaCalculoVLRCORRECAOMON.AsFloat,               // fVlrAcum
                                           qryConciliaCalculoVLRCORRECAOMON.AsFloat,               // fVlrTotAcum ???
                                           qryConciliaCalculoCODTIPIMOVEL.AsString,                // sTipoImovel
                                           qryConciliaCalculoIDCONTRATOIMOVEL.AsInteger,           // iIdContrato
                                           -1,                                                     // iIdForCli
                                           qryConciliaCalculoCODDOCUMENTO.AsInteger,               // iCodDocum
                                           False,                                                  // bGravaDiaNull
                                           -1                                                      // IDParcela
                                          );
      end;
   end;
end;



end.






