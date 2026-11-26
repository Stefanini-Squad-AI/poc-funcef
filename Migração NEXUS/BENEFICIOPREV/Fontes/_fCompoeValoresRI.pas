unit fCompoeValoresRI;

// Alterações:
{
--------------------------------------------------------------------------------------------------
Pendência   : SOL 131786 KINTANA 753272
Responsável : BRUNO AZEVEDO
Data        : 03/03/2010
Descrição   : Somente salvar o campo DIB (Nas tabelas TEMPCONCINSS e DETCONCINSS)
              NULL ou com data válida.
--------------------------------------------------------------------------------------------------
Autor     : Renato Visoni
Data      : 26/02/2010
Pendência : SOL 123118 Kintana 612606
Descrição : Ajuste na rotina para inserir o campo CODSINONIMO,DTINICIOCRED,DTFIMCRED na
            DetConcInss e TempConcInss.
---------------------------------------------------------------------------------------------------

Autor     : André Pontes
Data      : 04/04/2007
Rotina    : BitBtn3Click(...), btnOkAlteracaoClick(...), BitBtn1Click(...)
Pendencia : 22253
Descrição : Não permitir alteração em algum mês fechado, ie, cuja ConcINSS tenha os campos de
            documento CaP ou documento CaR preenchidos
----------------------------------------------------------------------------------------------------
Autor     : André Pontes
Rotina    : - (qryRubParticipante e qryRubParticipanteAcertadas)
Data      : 26/09/2006
Pendencia : 23330
Alteração : Exibição do plano contábil nas grids
----------------------------------------------------------------------------------------------------
Autor     : André Pontes
Rotina    : SpeedButton2Click(...)
Data      : 06/07/2006
Pendencia : 22487
Alteração : Filtro por FLGMANUAL = ...
----------------------------------------------------------------------------------------------------
Autor     : Augusto
Rotina    : Pesquias das rubricas
Data      : 29/07/2005
Pendencia : 19851
Descrição : Novos campos com Plano Previdenciário
----------------------------------------------------------------------------------------------------
Autor     : Augusto
Rotina    : Pesquias das rubricas
Data      : 04/05/2005
Pendencia : 18684
Descrição : Pesquisar por MESREFERENCIA tbm, para retornar os valores que já
            foram acertados
----------------------------------------------------------------------------------------------------
Autor     : Camille
Rotina    : qryLookEntidadeContabil
Data      : 20.10.2004
Pendencia : 17578
Descrição : Filtrar planos ativos
---------------------------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, ExtCtrls, ComCtrls, wwriched, Wwdotdot, Wwdbcomb, Mask,
   wwdbedit, Grids, Wwdbigrd, Wwdbgrid, Spin, Db, Wwdatsrc, DBTables,
   Wwquery, TREdit, wwdblook, CMDBLookupCombo, MontaSelect, Wwdbspin;

type
   TfrmCompoeValoresRI = class(TfrmOkCancelar)
      grpDadosParticipantes: TGroupBox;
      btnProcurar: TBitBtn;
      edtMatricula: TEdit;
      lblParticipante: TStaticText;
      Label6: TLabel;
      edtNumBenef: TEdit;
      Label7: TLabel;
      qryValor: TwwQuery;
      dsValor: TwwDataSource;
      qryValorPLANO: TStringField;
      qryValorLIQUIDO: TFloatField;
      GroupBox1: TGroupBox;
      wwDBGrid2: TwwDBGrid;
      wwDBGrid3: TwwDBGrid;
      dsRubParticipante: TwwDataSource;
      SpeedButton1: TSpeedButton;
      SpeedButton2: TSpeedButton;
      lblTExto: TLabel;
      updRubParticipante: TUpdateSQL;
      GroupBox2: TGroupBox;
      wwDBGrid1: TwwDBGrid;
      Label3: TLabel;
      edtVlrLiqRubricasAcertados: TDBRealEdit;
      Bevel1: TBevel;
      Bevel2: TBevel;
      Label4: TLabel;
      pnlCompoeValor: TPanel;
      Dock973: TDock97;
      Toolbar973: TToolbar97;
      ToolbarSep974: TToolbarSep97;
      btnOkAlteracao: TBitBtn;
      BitBtn8: TBitBtn;
      Panel2: TPanel;
      Label12: TLabel;
      lblRubrica: TLabel;
      Label14: TLabel;
      lblPlano: TLabel;
      Label9: TLabel;
      lblValorRubrica: TLabel;
      GroupBox4: TGroupBox;
      edtBeneficio: TEdit;
      Label16: TLabel;
      edtEspecie: TEdit;
      Label17: TLabel;
      MS: TMontaSelect;
      qryHeader: TwwQuery;
      qryAux: TwwQuery;
      qryRubParticipante: TwwQuery;
      pnlRubricas: TPanel;
      Dock974: TDock97;
      Toolbar972: TToolbar97;
      ToolbarSep973: TToolbarSep97;
      BitBtn3: TBitBtn;
      BitBtn4: TBitBtn;
      GroupBox8: TGroupBox;
      GroupBox9: TGroupBox;
      cboxEntidadeContabil: TwwDBLookupCombo;
      GroupBox10: TGroupBox;
      dbGridRubricasHistrubsal: TwwDBGrid;
      Label11: TLabel;
      Label18: TLabel;
      Label20: TLabel;
      edtValorLiquido: TEdit;
      Label22: TLabel;
      Bevel3: TBevel;
      cboxRubricasAcerto: TCMDBLookupCombo;
      qryRubricaAcerto: TwwQuery;
      qryRubParticipanteAcertadas: TwwQuery;
      dsRubParticipanteAcertadas: TwwDataSource;
      wwDBEdit1: TwwDBEdit;
      mmObs3: TRichEdit;
      mmObs: TRichEdit;
      GroupBox7: TGroupBox;
      Label5: TLabel;
      Label8: TLabel;
      Label24: TLabel;
      DBcboEntidadeContabil2: TwwDBLookupCombo;
      DBcboRubricaAcerto2: TCMDBLookupCombo;
      edtValorRepasse: TwwDBEdit;
      CheckBox1: TCheckBox;
      qryDeleteDetConc: TwwQuery;
      qryInsertDetConc: TwwQuery;
      qryRubricaAcertoIDPROVENTO: TFloatField;
      qryRubricaAcertoDESCRICAO: TStringField;
      qryHeaderNUMEROPROCESSO: TFloatField;
      qryHeaderIDPLANOPREV: TFloatField;
      qryHeaderIDTITULAR: TFloatField;
      qryHeaderIDPESSJUR: TFloatField;
      qryHeaderIDBENEFICIO: TFloatField;
      qryHeaderIDPESSOA: TFloatField;
      qryHeaderPLANO: TFloatField;
      qryHeaderSEQPROPOSTA: TFloatField;
      qryHeaderTIPCODIGO: TStringField;
      qryHeaderCODCENTRORESPON: TStringField;
      qryHeaderIDEMPRESAPROP: TFloatField;
      qryHeaderIDDEPENDENCIA: TStringField;
      qryHeaderIDSITBENEFICIO: TFloatField;
      qryHeaderCODSUBCONTA: TFloatField;
      qryHeaderPLACONTAD: TStringField;
      qryHeaderPLACONTAC: TStringField;
      qryHeaderIDTPPAGTOBENEFIC: TFloatField;
      qryHeaderDATAFINAL: TDateTimeField;
      qryHeaderCODCENTROCUSTOD: TStringField;
      qryHeaderCODCENTROCUSTOC: TStringField;
      qryHeaderVALORATUAL: TFloatField;
      qryHeaderPERCPARTICIPACAO: TFloatField;
      qryHeaderIDEMPRESA: TFloatField;
      qryHeaderUNIDNEGOC: TFloatField;
      qryHeaderIDADEINGRESSO: TFloatField;
      qryHeaderCODPORTFORMA: TFloatField;
      qryHeaderDATAREQUERIMENTO: TDateTimeField;
      qryHeaderDATAINICIO: TDateTimeField;
      qryHeaderTMPPAGTOBENEFICIO: TFloatField;
      qryHeaderFLGFORMAPAGTO: TStringField;
      qryHeaderVALORCALCULADO: TFloatField;
      qryHeaderDATAULTREAJUSTE: TDateTimeField;
      qryHeaderMOTIVOCANCELAMEN: TMemoField;
      qryHeaderULTMESPREPARO: TStringField;
      qryHeaderVLRCALCINSS: TFloatField;
      qryHeaderVLRINFINSS: TFloatField;
      qryHeaderDATAINICIOINSS: TDateTimeField;
      qryHeaderNUMPROCINSS: TStringField;
      qryHeaderDATAINICIOFUND: TDateTimeField;
      qryHeaderFLGBENEFMIN: TFloatField;
      qryHeaderVALORCOTAS: TFloatField;
      qryHeaderVALORTOTAL: TFloatField;
      qryHeaderDATACONCESSAO: TDateTimeField;
      qryHeaderDATAENCERRAMENTO: TDateTimeField;
      qryHeaderFLGPROVISORIO: TFloatField;
      qryHeaderPERCPROVISORIO: TFloatField;
      qryHeaderPRAZOPROVISORIO: TFloatField;
      qryHeaderNUMCARTARECAD: TStringField;
      qryHeaderDATAEMISSAORECAD: TDateTimeField;
      qryHeaderDATALIMITERECAD: TDateTimeField;
      qryHeaderDATARECEBRECAD: TDateTimeField;
      qryHeaderFLGSTATUS: TStringField;
      qryHeaderBANCOINSS: TStringField;
      qryHeaderMESRECIBOINSS: TFloatField;
      qryHeaderANORECIBOINSS: TFloatField;
      qryHeaderFONTEPAGADORA: TFloatField;
      qryHeaderTRGDTINCLUSAO: TDateTimeField;
      qryHeaderTRGUSERINCLUSAO: TStringField;
      qryHeaderIDAGENCIARESGATE: TFloatField;
      qryHeaderULTMESREAJUSTE: TStringField;
      qryHeaderULTVALORATUALREAJ: TFloatField;
      qryHeaderULTVALORBRUTO: TFloatField;
      qryHeaderVALORABONO13: TFloatField;
      qryHeaderDIBBENEFANT: TDateTimeField;
      qryHeaderFLGDATAPREVISTA: TFloatField;
      qryHeaderDATAFINALPREVISTA: TDateTimeField;
      qryHeaderDFLOATPAGTO: TFloatField;
      qryHeaderFLGTIPOINSS: TFloatField;
      qryHeaderIDPLANPREVCONTAB: TFloatField;
      qryHeaderVALORBENEFANT: TFloatField;
      qryHeaderVALORBINSS1: TFloatField;
      qryHeaderVALORBINSS2: TFloatField;
      qryHeaderVALORBINSS3: TFloatField;
      qryHeaderVALORBINSSANT1: TFloatField;
      qryHeaderVALORBINSSANT2: TFloatField;
      qryHeaderVALORBINSSANT3: TFloatField;
      qryHeaderFLGENCERRAPORFALE: TFloatField;
      qryHeaderDATAULTREVISAO: TDateTimeField;
      qryHeaderFLGDESCIRMES: TFloatField;
      qryHeaderPERCENTUAL: TFloatField;
      qryHeaderVALORNADIB: TFloatField;
      qryHeaderFLGPOSSUIACOMPINSS: TFloatField;
      qryHeaderVALORSRB: TFloatField;
      qryHeaderIDBENEFREFEREN: TFloatField;
      qryHeaderDATALIBERACAO: TDateTimeField;
      qryHeaderMESPAGLIBERACAO: TStringField;
      qryHeaderIDPLANOORIGEM: TFloatField;
      qryHeaderIDTITBENEF: TFloatField;
      qryHeaderFLGACERTOCBP: TFloatField;
      qryHeaderVALORBASE1: TFloatField;
      qryHeaderVALORBASE2: TFloatField;
      qryHeaderVALORBASE3: TFloatField;
      qryHeaderRECPAG: TStringField;
      qryHeaderCODRECEBCAPABN: TStringField;
      qryHeaderCODTIPRECEBDEVOL: TStringField;
      qryHeaderPLACONTACABN: TStringField;
      qryHeaderIDEMPRESADESEMB: TFloatField;
      qryHeaderCODSUBCONTAABN: TFloatField;
      qryHeaderRECPAGDESEMB: TStringField;
      qryHeaderIDEMPRESAPROPABN: TFloatField;
      qryHeaderCODTIPRECDESADT: TStringField;
      qryHeaderCODTIPDESEMBPROV: TStringField;
      qryHeaderCODTIPRECEBCAP13: TStringField;
      qryHeaderCODTIPRECEBCAP: TStringField;
      qryHeaderCODTIPRECDESABN: TStringField;
      qryHeaderCODTIPRECDES: TStringField;
      qryHeaderCODCENTRORESPONA: TStringField;
      qryHeaderCODPORTFORMAABN: TFloatField;
      qryHeaderUNIDNEGOCABN: TFloatField;
      qryHeaderPLACONTACPROVADT: TStringField;
      qryHeaderPLACONTADPROVADT: TStringField;
      qryHeaderPLACONTACPROVIS: TStringField;
      qryHeaderPLACONTADPROVIS: TStringField;
      qryHeaderPLACTAACJUD13: TStringField;
      qryHeaderPLACTAACJUD: TStringField;
      qryHeaderPLACONTADABN: TStringField;
      qryHeaderFLGMOVEURESERVA: TFloatField;
      qryHeaderNOME_BENEF: TStringField;
      qryHeaderPARTICIPANTE: TStringField;
      qryHeaderCODBENEFICIO: TStringField;
      qryHeaderPLANO_1: TStringField;
      qryHeaderMATRICULA: TStringField;
      Label2: TLabel;
      qryMantenedora: TwwQuery;
      qryMantenedoraNOME: TStringField;
      qryMantenedoraCODMANTENEDORA: TStringField;
      qryMantenedoraFLGFUNDACAO: TFloatField;
      qryMantenedoraIDPLANOPREV: TFloatField;
      qryLookEntidadeContabil: TwwQuery;
      qryLookEntidadeContabilNOME: TStringField;
      qryLookEntidadeContabilIDPLANOPREV: TFloatField;
      qryLookEntidadeContabilCODORCAMENTO: TStringField;
      qryLookEntidadeContabilSIGLAORCAMENTO: TStringField;
      qryLookEntidadeContabilCODSPC: TStringField;
      DBcboMantenedor: TCMDBLookupCombo;
      SpeedButton3: TSpeedButton;
    qryUpdateDetConc: TwwQuery;
    pnlIdentifica: TPanel;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    ToolbarSep972: TToolbarSep97;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel5: TPanel;
    Label15: TLabel;
    lblRubrica2: TLabel;
    Label19: TLabel;
    lblPlano2: TLabel;
    Label21: TLabel;
    lblValor2: TLabel;
    GroupBox5: TGroupBox;
    mmObs2: TwwDBRichEdit;
    GroupBox6: TGroupBox;
    DBcboEntidadeContabil3: TwwDBLookupCombo;
    qryUpdateDetConcAcerto: TwwQuery;
    qryRubricaAcertoRUBRICAINSS: TFloatField;
    Panel1: TPanel;
    DBspnAno: TwwDBSpinEdit;
    cboMes: TComboBox;
    lblMes: TLabel;
    Label10: TLabel;
    cbMesDestino: TComboBox;
    dbspanodestino: TwwDBSpinEdit;
    Label1: TLabel;
    edtVlrLiqRubricas: TDBRealEdit;
    CMDBLookupCombo1: TCMDBLookupCombo;
    Label13: TLabel;
    qryRubricaAcertoOrigem: TwwQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    FloatField2: TFloatField;
    Label23: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    lblMantOrigem: TLabel;
    chkcontrapartida: TCheckBox;
    DbLkcECOrigem: TwwDBLookupCombo;
    Label27: TLabel;
    DbLkcPlanoOrigem: TwwDBLookupCombo;
    Label28: TLabel;
    DbLkcPlanoDestino: TwwDBLookupCombo;
    qryHeaderPLACONTADADT13: TStringField;
    qryHeaderPLANOPREVORIGEM: TStringField;
    qryHeaderIDPLANOPREVORIGEM: TFloatField;
    qryHeaderIDPLANPREVCONTABORIGEM: TFloatField;

      procedure FormShow(Sender: TObject);
      procedure SpeedButton1Click(Sender: TObject);
      procedure btnProcurarClick(Sender: TObject);
      procedure cboMesChange(Sender: TObject);
      procedure qryRubParticipanteAfterOpen(DataSet: TDataSet);
      procedure btnOkAlteracaoClick(Sender: TObject);
      procedure BitBtn8Click(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure bbtnCancelarClick(Sender: TObject);
      procedure SpeedButton2Click(Sender: TObject);
      procedure qryRubParticipanteAfterScroll(DataSet: TDataSet);
      procedure qryRubParticipanteBeforeScroll(DataSet: TDataSet);
      procedure qryRubParticipanteAcertadasAfterOpen(DataSet: TDataSet);
      procedure BitBtn3Click(Sender: TObject);
      procedure SpeedButton3Click(Sender: TObject);
      procedure BitBtn1Click(Sender: TObject);
      procedure BitBtn2Click(Sender: TObject);
      procedure CMDBLookupCombo1Change(Sender: TObject);
      procedure wwDBGrid2CalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure bbtnSairClick(Sender: TObject);
      procedure pnlCompoeValorMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);


   private  // Private declarations

      sAnoMesCobranca  : String;
      sIdPessoa        : String;

      procedure LimpaParametros(const qry: TwwQuery);

      {Posiciona o Panel(Qualquer um!) no centro da tela. }
      procedure AlinhaPainel(Painel: TPanel; Mostra: Boolean);

      {Executa limpeza dos edits, contagem do líquido, entre outros, para a tela A}
      procedure PreparaPainel_A;

      {Executa limpeza dos edits, contagem do líquido, entre outros, para a tela B}
      procedure PreparaPainel_B;

      {}
      Function RetornaValorLiquido: String;

      {}
      procedure BuscaDadosDETCONCINSS(    qry          : TwwQuery;
                                      var pIdBeneficio : String;
                                      var pNumProcInss : String
                                     );


   public   // Public declarations

      TelaChamadora: Integer; {0: 1: }


    { ___________________________________________________________________

      Esta tela atenderá dois grupos distintos de benefícios pagos sem contra-partida:
        - Os que foram pagos à CEF;
        - Os que foram pagos à outro posto pagador (Previ, por exemplo.)

      A função AbreProcessoParticipante irá preparar a estrutura para cada um
      do grupos.
      ___________________________________________________________________}

      procedure AbreProcessoParticipante(pIdpessoa      : String;
                                         pIdBeneficio   : String;
                                         pMesReferencia : String;
                                         pNumProcINSS   : String
                                        );

      procedure MontaQryRubricas(pTipo          : Integer;
                                 pIdPessoa      : String;
                                 pMesReferencia : String;
                                 pNumProcINSS   : String
                                );


   end;



var
  frmCompoeValoresRI: TfrmCompoeValoresRI;



implementation
{$R *.DFM}
uses
  uDataBase, uMensErro, UAdmPrev, fCompoeValoresRI_TelaA, dBaseDados, uSistema,
  dReembolsoINSS;



procedure TfrmCompoeValoresRI.LimpaParametros(const qry: TwwQuery);
var
   i: integer;
begin
   // fecha a query p/ evitar problemas
   qry.Close;

   // prepara a query se já não estiver preparada
   if not(qry.Prepared) then qry.Prepare;

   // zera os parâmetros
   for i := 0 to (qry.ParamCount - 1) do
   begin
      qry.Params[i].Bound := False;
      qry.Params[i].Clear;
      qry.Params[i].Bound := True;
   end;
end;



procedure TfrmCompoeValoresRI.FormShow(Sender: TObject);
begin
   inherited;
   WindowState := wsMaximized;

   // abre queries
   qryLookEntidadeContabil.Open;
   qryMantenedora.Open;
   

   // limpa veriáveis.
   sAnoMesCobranca         := '';
   lblParticipante.Caption := '';

   edtMatricula.Clear;
   edtNumBenef.Clear;
   edtBeneficio.Clear;
   edtEspecie.Clear;
end;



procedure TfrmCompoeValoresRI.SpeedButton1Click(Sender: TObject);
begin
   inherited;

   { Usar conceito de transação. Como não haverá uma query específica para cada
     tipo de insert, não podemos usar cached updates. }
   if not(dtmBasedados.dbBaseDados.InTransaction) then dtmBasedados.dbBaseDados.StartTransaction;

   // tela do tratamento EFETIVO.
   // A definição ocorrerá de acordo com a variável: TelaChamadora.

   case TelaChamadora of

      0: // Tela A - HISTRUBSAL ---> DETCONCINSS
      begin
         PreparaPainel_A;
         lblTexto.Caption := 'Rubricas do Participante pagas pela Folha de Benefício';
         AlinhaPainel(pnlRubricas, True);
         MsgDlg('Selecione as rubricas a serem processadas', 'Administração Previdenciária', mtInformation, [mbOk], 0);
         Repaint;
      end;

      1: // Tela B - DETCONCINSS ---> DETCONCINSS
      begin
         PreparaPainel_B;
         lblTexto.Caption := 'Rubricas do Participante no INSS';
         AlinhaPainel(pnlCompoeValor, True);
      end;

   end;

   // alimenta a janela de composição com os valores da rubrica selecionada.
   lblRubrica.Caption      := qryRubParticipante.FieldByName('RUBRICA').AsString;
   lblMantOrigem.Caption   := qryRubParticipante.FieldByName('NOMEMANT').AsString;
   lblValorRubrica.Caption := qryRubParticipante.FieldByName('VALOR').AsString;
   edtValorRepasse.Text    := qryRubParticipante.FieldByName('VALOR').AsString;
   mmObs.Lines.Clear;

   lblRubrica2.Caption  := qryRubParticipante.FieldByname('RUBRICA').AsString;
   lblValor2.Caption    := qryRubParticipante.FieldByName('VALOR').AsString;

   if not qryHeader.IsEmpty
   then begin
      lblPlano2.Caption    := qryHeader.FieldByName('PLANO_1').AsString;
      lblPlano.Caption     := qryHeader.FieldByName('PLANO_1').AsString;

      DbLkcECOrigem.LookupValue := qryHeader.FieldByName('IDPLANPREVCONTABORIGEM').AsString;
      DbLkcECOrigem.PerformSearch;

      DbLkcPlanoOrigem.LookupValue := qryHeader.FieldByName('IDPLANOPREVORIGEM').AsString;
      DbLkcPlanoOrigem.PerformSearch;
   end
   else begin
      qryAux.Close;
      qryAux.SQL.Text := ' SELECT D.IDPLANOPREV, PL.NOME, D.IDPLANOPREV, D.IDPLANOPREVPREV '+
                         ' FROM   DETCONCINSS D, PLANPREVCONTABIL PL '+
                         ' WHERE  D.NUMPROCINSS = ' + QuotedStr(qryRubParticipante.FieldByName('NUMPROCINSS').AsString) +
                         ' AND    D.IDRUBRICA   = '+OraNumero(qryRubParticipante.FieldByName('IDRUBRICA').AsString)+
                         ' AND    D.FLGMANUAL = 0 '+
                         ' AND    D.IDPLANOPREV = PL.IDPLANOPREV ';
      qryAux.Open;
      if not qryAux.EOF
      then begin
         lblPlano2.Caption := qryAux.FieldByName('NOME').AsString;
         lblPlano.Caption  := qryAux.FieldByName('NOME').AsString;

         DbLkcECOrigem.LookupValue := qryAux.FieldByName('IDPLANOPREV').AsString;
         DbLkcECOrigem.PerformSearch;

         DbLkcPlanoOrigem.LookupValue := qryAux.FieldByName('IDPLANOPREVPREV').AsString;
         DbLkcPlanoOrigem.PerformSearch;

      end else begin
         lblPlano2.Caption := 'Não Identificado';
         lblPlano.Caption  := 'Não Identificado';
      end;
   end;

   mmObs2.Lines.Clear;
end;



procedure TfrmCompoeValoresRI.btnProcurarClick(Sender: TObject);
begin
   inherited;

   // verifica se o AnoMês foi preenchido, se não aborta procura.
   if sAnoMesCobranca = '' then
   begin
      MsgDlg('Selecione o período de cobrança primeiro.', 'Administração Previdenciária', mtWarning, [mbOk], 0);
      Repaint;
      Exit;
   end;

   with MS do
   begin
      // Adiciona Filtro
      Filtro.Clear;
      Filtro.Add('D.IDPESSOA    = P.IDPESSOA ' );
      Filtro.Add('D.IDPESSOA    = E.IDPESSOA(+) ' );
      Filtro.Add('D.MESCOBRANCA = ' + QuotedStr(sAnoMesCobranca) );

      // Abre MS
      Executar;
      if RetornouValor then
      begin
         Repaint;

         sIdPessoa       := ValoresChave[0];
         TelaChamadora   := 1;

         AbreProcessoParticipante(sIdPessoa, ValoresChave[2], sAnoMesCobranca,ValoresChave[1]  );

      end;
      Repaint;
   end;
end;



procedure TfrmCompoeValoresRI.cboMesChange(Sender: TObject);
begin
   inherited;
   sAnoMesCobranca := FormatFloat('0000', dbspnano.Value) + '/' +
                      FormatFloat('00', (cboMes.ItemIndex + 1));
   cbMesDestino.ItemIndex := cboMes.ItemIndex;
end;



procedure TfrmCompoeValoresRI.qryRubParticipanteAfterOpen(DataSet: TDataSet);
var
   dValor : Double;
begin
   inherited;

   dValor := 0;

   with TwwQuery(DataSet) do
   begin
      First;
      while not(EOF) do
      begin
         if Copy(Trim(FieldByName('RUBRICAINSS').AsString),1,1) <> '4' Then
            dValor := dValor + FieldByName('VALOR').AsFloat;
         Next;
      end;
   end;

   edtVlrLiqRubricas.Lines.Clear;
   edtVlrLiqRubricas.Lines.Add(FloatToStr(dValor));
end;



procedure TfrmCompoeValoresRI.AlinhaPainel(Painel: TPanel; Mostra: Boolean);
begin
   Painel.Left     := (Width div 2) - (Painel.Width div 2);
   Painel.Top      := ((Height div 2) - (Painel.Height div 2)) - 25;
   Painel.Visible  := Mostra;
end;



procedure TfrmCompoeValoresRI.btnOkAlteracaoClick(Sender: TObject);
var
   iContRubrica, iMaxRubrica   : Integer;
   sNumProcInss   : String;
   sIdBeneficio   : String;
   sObs           : String;
   sMsg           : string;
   sAnoMes        : string;
   sAnoMesCobrancaDestino : String;
begin
   inherited;

   // Críticas -------------------------------------------------------------------------------------

   // Preenchimento da Entidade Contábil
   if DBcboEntidadeContabil2.LookupValue = '' then
   begin
      MsgDlg('Selecione uma Entidade Contábil', 'Administração Previdenciária', mtWarning, [mbOk], 0);
      Repaint;
      if DBcboEntidadeContabil2.CanFocus then DBcboEntidadeContabil2.SetFocus;
      Exit;
   end;

   // Preenchimento da Mantenedora
   if DBcboMantenedor.LookupValue = '' then
   begin
      MsgDlg('Selecione uma Mantenedora', 'Administração Previdenciária', mtWarning, [mbOk], 0);
      Repaint;
      if DBcboMantenedor.CanFocus then DBcboMantenedor.SetFocus;
      Exit;
   end;

   // Preenchimento da Rubrica de Acerto.
   if DBcboRubricaAcerto2.LookupValue = '' then
   begin
      MsgDlg('Selecione uma Rubrica de Acerto', 'Administração Previdenciária', mtWarning,[mbOk], 0);
      Repaint;
      if DBcboRubricaAcerto2.CanFocus then DBcboRubricaAcerto2.SetFocus;
      Exit;
   end;

   // ----------------------------------------------------------------------------------------------

   sAnoMesCobrancaDestino := FormatFloat('0000', dbspanodestino.Value) + '/' +
                             FormatFloat('00', (cbMesDestino.ItemIndex + 1));


   sMsg     := 'Não é possível incluir/alterar/excluir registros de meses fechados!';

   if not(dtmReembolsoINSS.VerificaConcINSS(sAnoMesCobrancaDestino)) then
   begin
      MsgDlg(sMsg, Sistema.NomeModulo, mtWarning, [mbOk], 0);
      Repaint;
      Exit;
   end;

   sAnoMes  := FormatFloat('0000', DBspnAno.Value) + '/' + FormatFloat('00', cboMes.ItemIndex + 1);

   if not(dtmReembolsoINSS.VerificaConcINSS(sAnoMes)) then
   begin
      MsgDlg(sMsg, Sistema.NomeModulo, mtWarning, [mbOk], 0);
      Repaint;
      Exit;
   end;
   // ----------------------------------------------------------------------------------------------

   if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;

   // Fazer o INSERT na DETCONCINSS (DESTINO) com a diferença do valor e com o
   // o FLGTRATADO = 1  || FLGMANUAL = 2

   sObs := mmObs.Text;
   if Trim(sObs) = '' then sObs := '-';

   iMaxRubrica := 1;
   qryAux.Close;
   qryAux.SQL.Text := 'SELECT MAX(SEQUENCIAL) AS SEQMAX FROM DETCONCINSS WHERE MESCOBRANCA = ' +
                       QuotedStr(sAnoMesCobrancaDestino) + ' AND IDPESSOA = ' +
                       FloattoStr(qryRubParticipante.FieldByName('IDPESSOA').AsFloat);
   qryAux.Open;
   if not qryAux.EOF Then
      iMaxRubrica := qryAux.FieldByName('SEQMAX').AsInteger + 1;

   // Controla a inserção dos registros (SEQRUBRICA)
   for iContRubrica := iMaxRubrica to iMaxRubrica+20 do    
   begin
      with qryInsertDetConc do
      begin
         LimpaParametros(qryInsertDetConc);
         ParamByName('PIDPESSOA').AsFloat         := qryRubParticipante.FieldByName('IDPESSOA').AsFloat;
         ParamByName('PIDBENEFICIO').AsFloat      := qryRubParticipante.FieldByName('IDBENEFICIO').AsFloat;
         ParamByName('PNUMPROCINSS').AsString     := qryRubParticipante.FieldByName('NUMPROCINSS').AsString;
         ParamByName('PIDPLANOPREV').AsString     := DBcboEntidadeContabil2.LookupValue; 
         ParamByName('PIDPLANOPREVPREV').AsString := DbLkcPlanoDestino.LookupValue; 
         ParamByName('PCODMANTENEDORA').AsInteger := qryMantenedoraCODMANTENEDORA.AsInteger;
         ParamByName('PMESCOBRANCA').AsString     := sAnoMesCobrancaDestino; 
         ParamByName('PMESREFERENCIA').AsString   := qryRubParticipante.FieldByName('MES').AsString;
         ParamByName('PSEQUENCIAL').AsInteger     := iContRubrica;
         ParamByName('PFLGTRATADO').AsInteger     := 1;
         ParamByName('PFLGMANUAL').AsInteger      := 4;
         ParamByName('POBSERVACAO').AsString      := sObs;
         ParamByName('PVALORINSS').AsCurrency     := StrtoFloat(edtValorRepasse.Text);   
         ParamByName('PIDRUBRICA').AsFloat        := qryRubricaAcertoIDPROVENTO.AsFloat;
         ParamByName('PRUBRICAINSS').AsFloat      := qryRubricaAcertoRUBRICAINSS.AsFloat;
         ParamByName('PMATRICULA').AsString       := qryRubParticipante.FieldByName('MATRICULA').AsString;
         ParamByName('PRMREAJ').AsFloat           := qryRubParticipante.FieldByName('RMREAJ').AsFloat;
         ParamByName('PAPREAJ').AsFloat           := qryRubParticipante.FieldByName('APREAJ').AsFloat;
         ParamByName('PESPECIE').AsString         := qryRubParticipante.FieldByName('ESPECIE').AsString;

         //BRUNO AZEVEDO SOL 131786 KINTANA 753272
         if (qryRubParticipante.FieldByName('DIB').AsDateTime > 0) then begin
           ParamByName('PDIB').AsDateTime           := qryRubParticipante.FieldByName('DIB').AsDateTime;
         end else begin
           ParamByName('PDIB').Clear;
         end;
         //BRUNO AZEVEDO SOL 131786 KINTANA 753272

         ParamByName('PNOME').AsString            := qryRubParticipante.FieldByName('NOME').AsString;
         ParamByName('PESPECIE').AsString         := qryRubParticipante.FieldByName('ESPECIE').AsString;
         ParamByName('PSINONIMO').AsString        := qryRubParticipante.FieldByName('SINONIMO').AsString;
         ParamByName('PVALORMANT').AsCurrency     := 0;
         ParamByName('PCODCONCESSORINSS').AsString  := qryRubParticipante.FieldByName('CODCONCESSORINSS').AsString;
         ParamByName('PCODMANTENEDORINSS').AsString := qryRubParticipante.FieldByName('CODMANTENEDORINSS').AsString;
         ParamByName('PFLGATIVO').AsInteger         := qryRubParticipante.FieldByName('FLGATIVO').AsInteger;
         ParamByName('PFLGNAOAPRESENTA').AsInteger  := 0;

         //Renato Visoni SOL 123118 Kintana 612606
         ParamByName('PCODSINONIMO').AsString        := qryRubParticipante.FieldByName('CODSINONIMO').AsString;

         if qryRubParticipante.FieldByname('DTINICIOCRED').asDateTime = 0 then begin
           ParamByName('PDTINICIOCRED').Clear;
         end else begin
           ParamByName('PDTINICIOCRED').AsDateTime     := qryRubParticipante.FieldByname('DTINICIOCRED').asDateTime
         end;

         if qryRubParticipante.FieldByname('DTFIMCRED').asDateTime = 0 then begin
           ParamByName('PDTFIMCRED').Clear;
         end else begin
           ParamByName('PDTFIMCRED').AsDateTime        := qryRubParticipante.FieldByname('DTFIMCRED').asDateTime
         end;
        //Renato Visoni SOL 123118 Kintana 612606


         try
            ExecSQL;
            // fazer insert com a contra-partida no registro de origem
            with qryInsertDetConc do
            begin
               LimpaParametros(qryInsertDetConc);
               ParamByName('PIDPESSOA').AsFloat         := qryRubParticipante.FieldByName('IDPESSOA').AsFloat;
               ParamByName('PIDBENEFICIO').AsFloat      := qryRubParticipante.FieldByName('IDBENEFICIO').AsFloat;
               ParamByName('PNUMPROCINSS').AsString     := qryRubParticipante.FieldByName('NUMPROCINSS').AsString;
               ParamByName('PIDPLANOPREV').AsString     := DbLkcECOrigem.LookupValue;
               ParamByName('PIDPLANOPREVPREV').AsString := DbLkcPlanoOrigem.LookupValue;
               if qryRubParticipante.FieldByName('CODMANTENEDORA').Isnull Then
                  ParamByName('PCODMANTENEDORA').Clear
               else
                  ParamByName('PCODMANTENEDORA').AsInteger := qryRubParticipante.FieldByName('CODMANTENEDORA').AsInteger;

               ParamByName('PMESCOBRANCA').AsString     := sAnoMesCobrancaDestino;
               ParamByName('PMESREFERENCIA').AsString   := qryRubParticipante.FieldByName('MES').AsString;
               ParamByName('PSEQUENCIAL').AsInteger     := iContRubrica+1;
               ParamByName('PFLGTRATADO').AsInteger     := 1;
               ParamByName('PFLGMANUAL').AsInteger      := 3;
               ParamByName('POBSERVACAO').AsString      := sObs;
               ParamByName('PVALORINSS').AsCurrency     := StrtoFloat(edtValorRepasse.Text);
               ParamByName('PIDRUBRICA').AsFloat        := qryRubricaAcertoOrigem.FieldByName('IDPROVENTO').AsFloat;
               ParamByName('PRUBRICAINSS').AsFloat      := qryRubricaAcertoOrigem.FieldByName('RUBRICAINSS').AsFloat;
               ParamByName('PMATRICULA').AsString       := qryRubParticipante.FieldByName('MATRICULA').AsString;
               ParamByName('PRMREAJ').AsFloat           := qryRubParticipante.FieldByName('RMREAJ').AsFloat;
               ParamByName('PAPREAJ').AsFloat           := qryRubParticipante.FieldByName('APREAJ').AsFloat;
               ParamByName('PESPECIE').AsString         := qryRubParticipante.FieldByName('ESPECIE').AsString;

               //BRUNO AZEVEDO SOL 131786 KINTANA 753272
               if (qryRubParticipante.FieldByName('DIB').AsDateTime > 0) then begin
                 ParamByName('PDIB').AsDateTime           := qryRubParticipante.FieldByName('DIB').AsDateTime;
               end else begin
                 ParamByName('PDIB').Clear;
               end;
               //BRUNO AZEVEDO SOL 131786 KINTANA 753272
               
               ParamByName('PNOME').AsString            := qryRubParticipante.FieldByName('NOME').AsString;
               ParamByName('PESPECIE').AsString         := qryRubParticipante.FieldByName('ESPECIE').AsString;
               ParamByName('PSINONIMO').AsString        := qryRubParticipante.FieldByName('SINONIMO').AsString;
               ParamByName('PVALORMANT').AsCurrency     := 0;
               ParamByName('PCODCONCESSORINSS').AsString  := qryRubParticipante.FieldByName('CODCONCESSORINSS').AsString;
               ParamByName('PCODMANTENEDORINSS').AsString := qryRubParticipante.FieldByName('CODMANTENEDORINSS').AsString;
               ParamByName('PFLGATIVO').AsInteger         := qryRubParticipante.FieldByName('FLGATIVO').AsInteger;
               if chkcontrapartida.Checked Then
                  ParamByName('PFLGNAOAPRESENTA').AsInteger  := 1
               else
                  ParamByName('PFLGNAOAPRESENTA').AsInteger  := 0;

               //Renato Visoni SOL 123118 Kintana 612606
               ParamByName('PCODSINONIMO').AsString        := qryRubParticipante.FieldByName('CODSINONIMO').AsString;

               if qryRubParticipante.FieldByname('DTINICIOCRED').asDateTime = 0 then begin
                 ParamByName('PDTINICIOCRED').Clear;
               end else begin
                 ParamByName('PDTINICIOCRED').AsDateTime     := qryRubParticipante.FieldByname('DTINICIOCRED').asDateTime
               end;

               if qryRubParticipante.FieldByname('DTFIMCRED').asDateTime = 0 then begin
                 ParamByName('PDTFIMCRED').Clear;
               end else begin
                 ParamByName('PDTFIMCRED').AsDateTime        := qryRubParticipante.FieldByname('DTFIMCRED').asDateTime
               end;
              //Renato Visoni SOL 123118 Kintana 612606

               try
                  ExecSQL;
               Except
                  Raise;
               end;
            end;
            Break;
         except
            Raise;
            Continue;
         end;
      end;
      if iContRubrica >= 20 Then Begin
         MsgDlg('Excesso de rubricas no mesmo mês (20)', ' - Verifique!', mtWarning,[mbOk], 0);
         dtmBaseDados.dbBaseDados.Rollback;
         exit;
      end;
   end;

   // Fazer o UPDATE na DETCONCINSS (ORIGEM) com o valor (VALORMANT) e com o
   // o FLGTRATADO = 1

   with qryUpdateDetConcAcerto do
   begin
      LimpaParametros(qryUpdateDetConcAcerto);

      ParamByName('PFLGTRATADO').AsInteger     := 1;
      ParamByName('POBSERVACAO').AsString      := sObs;
      ParamByName('PVALORMANT').AsCurrency     := StrtoFloat(edtValorRepasse.Text);

      ParamByName('PIDRUBRICA').AsFloat        := qryRubParticipante.FieldByName('IDRUBRICA').AsFloat;
      ParamByName('PNUMPROCINSS').AsString     := qryRubParticipante.FieldByName('NUMPROCINSS').AsString;
      ParamByName('PMESCOBRANCA').AsString     := qryRubParticipante.FieldByName('MESCOBRANCA').AsString;
      ParamByName('PMESREFERENCIA').AsString   := qryRubParticipante.FieldByName('MES').AsString;
      ParamByName('PSEQUENCIAL').AsInteger     := qryRubParticipante.FieldByName('SEQUENCIAL').AsInteger;


      try
         ExecSQL;
      except
         MsgDlg('Erro na atualização da rubrica original', ' - Verifique!', mtWarning,[mbOk], 0);
         dtmBaseDados.dbBaseDados.Rollback;
         exit;
      end;
   end;


   // Abre a query com as rubricas acertadas
   MontaQryRubricas(TelaChamadora,
                    qryRubParticipante.FieldByName('IDPESSOA').AsString,
                    qryRubParticipante.FieldByName('MESCOBRANCA').AsString,
                    qryRubParticipante.FieldByName('NUMPROCINSS').AsString
                   );

   // Libera o campo editado para incluir o novo valor alterado.
   qryRubParticipante.Cancel;

   AlinhaPainel(PnlCompoeValor, False);
end;



procedure TfrmCompoeValoresRI.BitBtn8Click(Sender: TObject);
begin
   inherited;
   AlinhaPainel(PnlCompoeValor,False);
end;



procedure TfrmCompoeValoresRI.AbreProcessoParticipante(pIdpessoa      : String;
                                                       pIdBeneficio   : String;
                                                       pMesReferencia : String;
                                                       pNumProcINSS   : String
                                                      );
begin
   { Função atende interna e externamente.
     Dispara o processo de abertura das queries com o idpesspoa e o mesreferencia
     passados como parâmetro.
     A variável piTelaChamadora identifica qual tela chamou a função, podendo assim,
     disparar as funções de cada uma.
   }

   MontaQryRubricas(TelaChamadora, pIdpessoa, pMesReferencia, pNumProcINSS);

   case TelaChamadora of
      0: lblTexto.Caption := 'Rubricas do Participante pagas pela Folha de Benefício';
      1: lblTexto.Caption := 'Rubricas do Participante no INSS';
   end;


   // Abre qry de cabeçalho do benefício do participante.
   qryHeader.Close;
   qryHeader.ParamByName('IDPESSOA').AsString    := pIdPessoa;
   qryHeader.ParamByName('IDBENEFICIO').AsString := pIdBeneficio;
   qryHeader.Open;

   // Alimenta os campos do participante.
   if not qryHeader.EOF Then Begin
      edtMatricula.Text       := qryHeaderMATRICULA.AsString;
      edtNumBenef.Text        := qryHeaderNUMPROCINSS.AsString;
      edtEspecie.Text         := qryHeaderCODBENEFICIO.AsString;;
      edtBeneficio.Text       := qryHeaderNOME_BENEF.AsString;
      lblParticipante.Caption := qryHeaderPARTICIPANTE.AsString;
   end
   else Begin
      qryAux.SQL.Text := 'SELECT D.MATRICULA, NVL(D.NOME,P.NOME) AS NOMEPART, D.ESPECIE, D.RUBRICAINSS, '+
                         '       D.NUMPROCINSS, B.NOME AS NOMEBENEF '+
                         'FROM DETCONCINSS D, PESSOA P, BENEFICIO B ' +
                         'WHERE D.NUMPROCINSS = ' + QuotedStr(pNumProcINSS) +
                         ' AND  D.IDPESSOA    = P.IDPESSOA(+)' +
                         ' AND  D.IDBENEFICIO = B.IDBENEFICIO(+) '+
                         ' AND  D.FLGMANUAL = 0 ' ;

      qryAux.Open;
      if NOT qryAux.EOF Then Begin
         edtMatricula.Text       := qryAux.FieldByName('MATRICULA').AsString;
         edtNumBenef.Text        := qryAux.FieldByName('NUMPROCINSS').AsString;
         edtEspecie.Text         := qryAux.FieldByName('ESPECIE').AsString;
         edtBeneficio.Text       := qryAux.FieldByName('NOMEBENEF').AsString;
         lblParticipante.Caption := qryAux.FieldByName('NOMEPART').AsString;
      end;

   end;

   // Preenche a combo Mês, caso venha de outra tela.
   cboMes.ItemIndex        := StrToInt(Copy(pMesReferencia, 6, 2)) - 1;

   // Inibe alguns controles no caso da tela ser chamada de outra.
   cboMes.Enabled                := TelaChamadora = 1;
   DBspnAno.Enabled              := TelaChamadora = 1;

   grpDadosParticipantes.Enabled := TelaChamadora = 1;
end;


procedure TfrmCompoeValoresRI.MontaQryRubricas(pTipo          : Integer;
                                               pIdPessoa      : String;
                                               pMesReferencia : String;
                                               pNumProcINSS   : String
                                              );
begin
{
   Rotina responsável por criar a query de Rubricas, de acordo com a tela chamadora,
   que pode ser da tela A ou diretamente do menu, neste caso é a própria tela B
   pTipo =
      0: Registros SEM contra-partida (HISTRUBSAL)
      1: Registros COM DIVERGÊNCIA (DETCONCINSS)
}
   case pTipo of

      0:
      begin
         with qryRubParticipante do
         begin
            SQL.Clear;
            SQL.Text :=
            'SELECT '                                                                        + #13 +
            '   SUBSTR(DESCRICAO, 1, 30) AS RUBRICA, '                                       + #13 +
            '   DECODE(PD.FLGDESCONTO, 0, VALORPROVENTO, VALORPROVENTO * (-1)) AS VALOR, '   + #13 +
            '   PPC.NOME AS PLANOCONTABIL, '                                                 + #13 +  
            '   RXI.RUBRICAINSS, '                                                           + #13 +
            '   D.*, '                                                                       + #13 +
            '   0 AS FLGPROCESSA '                                                           + #13 +
            '   ,NULL as CODSINONIMO, 0 AS DTINICIOCRED, 0 AS DTFIMCRED '                     + #13 + // Renato Visoni SOL 123118 Kintana 612606

            'FROM '                                                                          + #13 +
            '   HISTRUBSAL       D,   '                                                      + #13 +
            '   PROVDESC         PD,  '                                                      + #13 +
            '   RUBRICAXINSS     RXI, '                                                      + #13 +
            '   PLANPREVCONTABIL PPC  '                                                      + #13 +

            'WHERE '                                                                         + #13 +
            '       D.MESCOBRANCA     = ' + QuotedStr(pMesReferencia)                        + #13 +
            '   AND D.IDPESSOA        = ' + pIdPessoa                                        + #13 +
            '   AND PD.IDPROVENTO     = D.IDRUBRICA '                                        + #13 +
            '   AND RXI.IDRUBRICA     = D.IDRUBRICA '                                        + #13 +
            '   AND D.IDPLANOCONTABIL = PPC.IDPLANOPREV(+) '                                 + #13 +

            'ORDER BY '                                                                      + #13 +
            '   D.MES DESC, PD.FLGDESCONTO ASC, VALORPROVENTO DESC ';

            Open;
         end;
      end;

      1:
      begin
         with qryRubParticipante do
         begin
            SQL.Clear;
            SQL.Text :=
            'SELECT '                                                               + #13 +
            '   SUBSTR(DESCRICAO, 1, 30) AS RUBRICA, '                              + #13 +
            '   DECODE(PD.FLGDESCONTO, 0, VALORINSS , VALORINSS * -1 ) AS VALOR, '  + #13 +
            '   PPC.NOME AS PLANOCONTABIL, '                                        + #13 +
            '   D.MESREFERENCIA AS MES, '                                           + #13 +
            '   D.*, D.RUBRICAINSS,'                                                + #13 +
            '   0 AS FLGPROCESSA, M.NOME AS NOMEMANT'                               + #13 +
            '   ,D.CODSINONIMO, D.DTINICIOCRED, D.DTFIMCRED '                       + #13 + // Renato Visoni SOL 123118 Kintana 612606


            'FROM '                                                                 + #13 +
            '   DETCONCINSS      D,   '                                             + #13 +
            '   PROVDESC         PD,  '                                             + #13 +
            '   RUBRICAXINSS     RXI, '                                             + #13 +
            '   PLANPREVCONTABIL PPC, '                                             + #13 +
            '   MANTENEDORA      M    '                                             + #13 +

            'WHERE '                                                                + #13 +
            '       D.NUMPROCINSS     = ' + QuotedStr(pNumProcINSS)                 + #13 +   
            '   AND (D.MESCOBRANCA    = ' + QuotedStr(pMesReferencia)               + #13 +
            '        OR (D.MESREFERENCIA = ' + QuotedStr(pMesReferencia) + ' AND FLGMANUAL = 3))' + #13 +
            '   AND PD.IDPROVENTO     = D.IDRUBRICA '                               + #13 +
            '   AND RXI.IDRUBRICA     = D.IDRUBRICA '                               + #13 +
            '   AND ((D.FLGMANUAL     = 0) OR (D.FLGMANUAL       = 3))'             + #13 +
            '   AND D.CODMANTENEDORA  = M.CODMANTENEDORA(+) '                       + #13 +
            '   AND D.IDPLANOPREV     = PPC.IDPLANOPREV(+) '                        + #13 +  

            ' ORDER BY '                                                            + #13 +
            '   D.MESREFERENCIA DESC, PD.FLGDESCONTO ASC, VALORINSS DESC ';
            Open;
         end;
      end;
  end; //  cases

  qryRubParticipanteAcertadas.Close;
  qryRubParticipanteAcertadas.ParamByName('NUMPROCINSS').AsString := pNumProcINSS;
  qryRubParticipanteAcertadas.ParamByName('MESCOBRANCA').AsString := qryRubParticipante.FieldByName('MESCOBRANCA').AsString;
  qryRubParticipanteAcertadas.Open;

  edtVlrLiqRubricas.Text := RetornaValorLiquido;
end;



procedure TfrmCompoeValoresRI.PreparaPainel_A;
begin
   // retorna o valor líquido em questão
   edtValorLiquido.Text :=  RetornaValorLiquido;

   // Abre a query de rubricas para acerto.
   qryRubricaAcerto.Close;
   qryRubricaAcerto.ParamByName('IDGRUPORUBRICA').AsInteger :=  prmIdGrupoRubAcerto;
   qryRubricaAcerto.Open;

   qryRubricaAcertoOrigem.Close;
   qryRubricaAcertoOrigem.ParamByName('IDGRUPORUBRICA').AsInteger :=  prmIdGrupoRubAcerto;
   qryRubricaAcertoOrigem.Open;

   //
   updRubParticipante.ModifySQL.Clear;
   updRubParticipante.ModifySQL.Text :=
   'UPDATE DETCONCINSS SET '                       + #13 +
   '  IDRUBRICA         =:IDRUBRICA, '             + #13 +
   '  MESREFERENCIA     =:MESREFERENCIA, '         + #13 +
   '  NUMPROCINSS       =:NUMPROCINSS, '           + #13 +
   '  IDPESSOA          =:IDPESSOA, '              + #13 +
   '  SEQUENCIAL        =:SEQUENCIAL, '            + #13 +
   '  IDBENEFICIO       =:IDBENEFICIO, '           + #13 +
   '  NOME              =:NOME, '                  + #13 +
   '  MESCOBRANCA       =:MESCOBRANCA, '           + #13 +
   '  SINONIMO          =:SINONIMO, '              + #13 +
   '  IDPLANOPREV       =:IDPLANOPREV, '           + #13 +
   '  VALORINSS         =:VALORINSS, '             + #13 +
   '  VALORMANT         =:VALORMANT, '             + #13 +
   '  TRGDTINCLUSAO     =:TRGDTINCLUSAO, '         + #13 +
   '  TRGUSERINCLUSAO   =:TRGUSERINCLUSAO, '       + #13 +
   '  CODCONCESSORINSS  =:CODCONCESSORINSS, '      + #13 +
   '  CODMANTENEDORINSS =:CODMANTENEDORINSS, '     + #13 +
   '  FLGATIVO          =:FLGATIVO, '              + #13 +
   '  FLGGLOSA          =:FLGGLOSA, '              + #13 +
   '  FLGTRATADO        =:FLGTRATADO '             + #13 +
   'WHERE '                                        + #13 +
   '      IDRUBRICA     =:OLD_IDRUBRICA '          + #13 +
   '  AND MESREFERENCIA =:OLD_MESREFERENCIA '      + #13 +
   '  AND NUMPROCINSS   =:OLD_NUMPROCINSS '        + #13 +
   '  AND IDPESSOA      =:OLD_IDPESSOA '           + #13 +
   '  AND SEQUENCIAL    =:OLD_SEQUENCIAL '         + #13 +
   '  AND IDBENEFICIO   =:OLD_IDBENEFICIO ';

   qryRubParticipante.Edit;
end;



function TfrmCompoeValoresRI.RetornaValorLiquido: String;
var
   dValorLiquido: Currency;
begin
   dValorLiquido:= 0;
   qryRubParticipante.First;

   while not(qryRubParticipante.EOF) do
   begin
      if (Copy(Trim(FloattoStr(qryRubParticipante.FieldByName('RUBRICAINSS').AsFloat)),1,1) <> '4') AND
         (Copy(Trim(FloattoStr(qryRubParticipante.FieldByName('RUBRICAINSS').AsFloat)),2,1) <> '9') AND
         (Copy(Trim(FloattoStr(qryRubParticipante.FieldByName('RUBRICAINSS').AsFloat)),2,1) <> '3') Then
         dValorLiquido := dValorLiquido + qryRubParticipante.FieldByName('VALOR').AsFloat;
      qryRubParticipante.Next;
   end;

   Result := FormatFloat('#,#0.00', dValorLiquido);
end;



procedure TfrmCompoeValoresRI.BuscaDadosDETCONCINSS(    qry          : TwwQuery;
                                                    var pIdBeneficio : String;
                                                    var pNumProcInss : String
                                                   );
begin
   //
   qryAux.SQL.Clear;
   qryAux.SQL.Text :=
   'SELECT '                                                                 + #13 +
   '   BF.IDBENEFICIO, BF.NUMPROCINSS '                                      + #13 +
   'FROM '                                                                   + #13 +
   '   BENEFBFCIARIO BF, '                                                   + #13 +
   '   BENEFPLANPREV BPP '                                                   + #13 +
   'WHERE '                                                                  + #13 +
   '       BPP.FLGREFERENCIA  = 1 '                                          + #13 +
   '   AND BF.IDBENEFICIO     = BPP.IDBENEFICIO  '                           + #13 +
   '   AND BF.IDPLANOPREV     = BPP.IDPLANOPREV  '                           + #13 +
   '   AND BF.IDPESSOA        = ' + qry.FieldByName('IDPESSOA').AsString     + #13 +
   '   AND BF.IDPESSJUR       = ' + qry.FieldByName('IDPATRO').AsString      + #13 +
   '   AND BF.IDPLANOPREV     = ' + qry.FieldByName('IDPLANOPREV').AsString;

   qryAux.open;

   if qryAux.IsEmpty then
   begin
      pIdBeneficio := '-1';
      pNumProcInss := '-1';
   end
   else
   begin
      pIdBeneficio := qryAux.FieldByName('IDBENEFICIO').AsString;
      pNumProcInss := qryAux.FieldByName('NUMPROCINSS').AsString;
   end;
end;



procedure TfrmCompoeValoresRI.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   if dtmBasedados.dbBaseDados.InTransaction then dtmBasedados.dbBaseDados.Commit;
end;



procedure TfrmCompoeValoresRI.bbtnCancelarClick(Sender: TObject);
begin
   inherited;

   if dtmBasedados.dbBaseDados.InTransaction then dtmBasedados.dbBaseDados.Rollback;

   qryRubParticipante.Close;
   qryRubParticipanteAcertadas.Close;

   // verifica qual painel está visível e faz o tratamento de necessário.
   if pnlCompoeValor.Visible then
   begin
      // tela B
      AlinhaPainel(pnlCompoeValor, False);
   end
   else if pnlRubricas.Visible then
   begin
      // tela A
      AlinhaPainel(pnlRubricas, False);
   end;
end;



procedure TfrmCompoeValoresRI.SpeedButton2Click(Sender: TObject);
Var
   sRubrica, sRubricaexc : String;
begin
   inherited;

   if not(dtmBasedados.dbBaseDados.InTransaction) then dtmBasedados.dbBaseDados.StartTransaction;

   // Exclui as linha inseridas pelo tratamento.

   with qryDeleteDetConc do
   begin
      LimpaParametros(qryDeleteDetConc);
      sRubrica := qryRubParticipanteAcertadas.FieldByName('RUBRICAINSS').AsString;
      ParamByName('PIDRUBRICA').AsFloat      := qryRubParticipanteAcertadas.FieldByName('IDRUBRICA').AsFloat;
      ParamByName('PSEQUENCIAL').AsFloat     := qryRubParticipanteAcertadas.FieldByName('SEQUENCIAL').AsFloat;
      ParamByName('PNUMPROCINSS').AsString   := qryRubParticipanteAcertadas.FieldByName('NUMPROCINSS').AsString;
      ParamByName('PIDPLANOPREV').AsInteger  := qryRubParticipanteAcertadas.FieldByName('IDPLANOPREV').AsInteger;
      ParamByName('PMESCOBRANCA').AsString   := qryRubParticipanteAcertadas.FieldByName('MESCOBRANCA').AsString;
      ParamByName('PMESREFERENCIA').AsString := qryRubParticipanteAcertadas.FieldByName('MESREFERENCIA').AsString;

      ParamByName('PFLGMANUAL').AsInteger    := 4;

      try
        ExecSQL;
      Except
        Raise
      end;
   end;
   try
      with qryUpdateDetConcAcerto do
      begin
         LimpaParametros(qryUpdateDetConcAcerto);

         ParamByName('PFLGTRATADO').AsInteger     := 1;
         ParamByName('PVALORMANT').AsCurrency     := qryRubParticipante.FieldByName('VALORMANT').AsFloat -
                                                     ABS(qryRubParticipanteAcertadas.FieldByName('VALOR').AsFloat);
         ParamByName('PIDRUBRICA').AsFloat        := qryRubParticipante.FieldByName('IDRUBRICA').AsFloat;
         ParamByName('PNUMPROCINSS').AsString     := qryRubParticipante.FieldByName('NUMPROCINSS').AsString;
         ParamByName('PMESCOBRANCA').AsString     := qryRubParticipante.FieldByName('MESCOBRANCA').AsString;
         ParamByName('PMESREFERENCIA').AsString   := qryRubParticipante.FieldByName('MES').AsString;
         ParamByName('PSEQUENCIAL').AsInteger     := qryRubParticipante.FieldByName('SEQUENCIAL').AsInteger;

         try
            ExecSQL;
         except
            MsgDlg('Erro na atualização da rubrica original', ' - Verifique!', mtWarning,[mbOk], 0);
            dtmBaseDados.dbBaseDados.Rollback;
            exit;
         end;
      end;

   except
         Raise;
   end;

   // apagar contra-partida

   LimpaParametros(qryDeleteDetConc);

   if copy(sRubrica,1,1) = '1' Then
     sRubricaexc := '3' + copy(sRubrica,2,3)
   else if copy(sRubrica,1,1) = '3' Then
     sRubricaexc := '1' + copy(sRubrica,2,3);


   qryAux.SQL.Text := 'SELECT IDRUBRICA FROM RUBRICAXINSS WHERE RUBRICAINSS = '+ sRubricaexc;
   qryAux.Open;
   if not qryAux.EOF then Begin

      qryAux.SQL.Text := 'DELETE FROM DETCONCINSS WHERE NUMPROCINSS = ' + QuotedStr(qryRubParticipanteAcertadas.FieldByName('NUMPROCINSS').AsString) +
                         ' AND MESCOBRANCA = ' + QuotedStr(qryRubParticipanteAcertadas.FieldByName('MESCOBRANCA').AsString) +
                         ' AND IDRUBRICA   = ' + qryAux.FieldByName('IDRUBRICA').AsString +
                         ' AND RUBRICAINSS = ' + sRubricaexc +
                         ' AND VALORINSS   = ' + OraNumero(FloattoStr(qryRubParticipanteAcertadas.FieldByName('VALORINSS').AsFloat)) +
                         ' AND FLGMANUAL   = 3';
      qryAux.close;
      try
        qryAux.ExecSQL;
      Except
        Raise
      end;
   end;


   // Atualiza a grid
   MontaQryRubricas(TelaChamadora, qryRubParticipante.FieldByName('IDPESSOA').AsString,
                    qryRubParticipante.FieldByName('MESCOBRANCA').AsString,
                    qryRubParticipanteAcertadas.FieldByName('NUMPROCINSS').AsString);
end;



procedure TfrmCompoeValoresRI.qryRubParticipanteAfterScroll(DataSet: TDataSet);
begin
   inherited;
   if DataSet.State <> dsEdit then DataSet.Edit;
end;



procedure TfrmCompoeValoresRI.qryRubParticipanteBeforeScroll(DataSet: TDataSet);
begin
   inherited;
   if DataSet.State = dsEdit then DataSet.Post;
end;



procedure TfrmCompoeValoresRI.qryRubParticipanteAcertadasAfterOpen(DataSet: TDataSet);
var
   dValor : Currency;
begin
   inherited;

   dValor := 0;

   with TwwQuery(DataSet) do
   begin
      First;
      while not(EOF) do
      begin
         dValor := dValor + FieldByName('VALOR').AsFloat;
         Next;
      end;
   end;

   edtVlrLiqRubricasAcertados.Lines.Clear;
   edtVlrLiqRubricasAcertados.Lines.Add(FloatToStr(dValor));
end;



procedure TfrmCompoeValoresRI.BitBtn3Click(Sender: TObject);
var
   sIdBeneficio   : String;
   sNumProcInss   : String;
   sObs           : String;
   iContRubrica   : Integer;
   bOk            : Boolean;
   sMsg           : string;
   sAnoMes        : string;
begin
   inherited;

   // Críticas -------------------------------------------------------------------------------------

   // Preenchimento da Entidade Contábil
   if cboxEntidadeContabil.Text = '' then
   begin
      MsgDlg('Selecione uma Entidade Contábil', 'Administração Previdenciária', mtWarning, [mbOk], 0);
      Repaint;
      if cboxEntidadeContabil.CanFocus then cboxEntidadeContabil.SetFocus;
      Exit;
   end;

   // Preenchimento da Rubrica de Acerto.
   if cboxRubricasAcerto.Text = '' then
   begin
      MsgDlg('Selecione uma Rubrica de Acerto', 'Administração Previdenciária', mtWarning, [mbOk], 0);
      Repaint;
      if cboxRubricasAcerto.CanFocus then cboxRubricasAcerto.SetFocus;
      Exit;
   end;

   // ----------------------------------------------------------------------------------------------


   // Fazer o INSERT na DETCONCINSS (DESTINO) com a diferença do valor e com o
   // o FLGTRATADO = 1.

   qryRubParticipante.Post;
   qryRubParticipante.First;

   sObs := mmObs3.Text;
   if Trim(sObs) = '' then sObs := '-';

   // busca dados para alimentar a DETCONCINSS
   // Passar só uma vez
   BuscaDadosDETCONCINSS(qryRubParticipante, sIdBeneficio, sNumProcInss);

   // ----------------------------------------------------------------------------------------------

   sMsg     := 'Não é possível incluir/alterar/excluir registros de meses fechados!';
   sAnoMes  := FormatFloat('0000', DBspnAno.Value) + '/' + FormatFloat('00', cboMes.ItemIndex + 1);

   if not(dtmReembolsoINSS.VerificaConcINSS(sAnoMes)) then
   begin
      MsgDlg(sMsg, Sistema.NomeModulo, mtWarning, [mbOk], 0);
      Repaint;
      Exit;
   end;

   sAnoMes  := qryRubParticipante.FieldByName('MESCOBRANCA').AsString;

   if not(dtmReembolsoINSS.VerificaConcINSS(sAnoMes)) then
   begin
      MsgDlg(sMsg, Sistema.NomeModulo, mtWarning, [mbOk], 0);
      Repaint;
      Exit;
   end;
   // ----------------------------------------------------------------------------------------------

   while not(qryRubParticipante.EOF) do
   begin
      // se estiver marcado com 1 deve incluir o registro na DETCONCINSS
      if qryRubParticipante.FieldByname('FLGPROCESSA').AsInteger = 0 then
      begin
         qryRubParticipante.Next;
         Continue;
      end;

      // Controla a inserção dos registros (SEQRUBRICA)
      for iContRubrica := 1 to qryRubParticipante.RecordCount do
      begin
         with qryInsertDetConc do
         begin
            LimpaParametros(qryInsertDetConc);
            ParamByName('PIDPESSOA').AsFloat       := qryRubParticipante.FieldByName('IDPESSOA').AsFloat;
            ParamByName('PIDBENEFICIO').AsFloat    := StrToInt(sIdBeneficio);
            ParamByName('PIDRUBRICA').AsFloat      := qryRubricaAcerto.FieldByName('IDPROVENTO').AsFloat;
            ParamByName('PNUMPROCINSS').AsString   := sNumProcInss;
            ParamByName('PIDPLANOPREV').AsInteger  := qryLookEntidadeContabilIDPLANOPREV.AsInteger;
            ParamByName('PMESCOBRANCA').AsString   := qryRubParticipante.FieldByName('MESCOBRANCA').AsString;
            ParamByName('PMESREFERENCIA').AsString := qryRubParticipante.FieldByName('MES').AsString;
            ParamByName('PSEQUENCIAL').AsInteger   := iContRubrica;
            ParamByName('PFLGTRATADO').AsInteger   := 1;
            ParamByName('PFLGMANUAL').AsInteger    := 4;
            ParamByName('POBSERVACAO').AsString    := sObs;
            ParamByName('PVALORINSS').AsCurrency   := qryRubParticipante.FieldByName('VALOR').AsCurrency;

            //Renato Visoni SOL 123118 Kintana 612606
            ParamByName('PCODSINONIMO').AsString        := qryRubParticipante.FieldByName('CODSINONIMO').AsString;

            if qryRubParticipante.FieldByname('DTINICIOCRED').asDateTime = 0 then begin
              ParamByName('PDTINICIOCRED').Clear;
            end else begin
              ParamByName('PDTINICIOCRED').AsDateTime     := qryRubParticipante.FieldByname('DTINICIOCRED').asDateTime
            end;

            if qryRubParticipante.FieldByname('DTFIMCRED').asDateTime = 0 then begin
              ParamByName('PDTFIMCRED').Clear;
            end else begin
              ParamByName('PDTFIMCRED').AsDateTime        := qryRubParticipante.FieldByname('DTFIMCRED').asDateTime
            end;
            //Renato Visoni SOL 123118 Kintana 612606


            try
               ExecSQL;
               Break;
            except
               Continue;
            end;
         end;

      end;

      qryRubParticipante.Next;
   end;

   // Abre a query com as rubricas acertadas
   qryRubParticipanteAcertadas.Close;
   qryRubParticipanteAcertadas.ParamByName('NUMPROCINSS').AsString := sNumProcInss;
   qryRubParticipanteAcertadas.ParamByName('MESCOBRANCA').AsString := qryRubParticipante.FieldByName('MESCOBRANCA').AsString;
   qryRubParticipanteAcertadas.Open;

   AlinhaPainel(PnlRubricas,False);
end;



procedure TfrmCompoeValoresRI.PreparaPainel_B;
begin
   // Abre a query de rubricas para acerto.
   qryRubricaAcerto.Close;
   qryRubricaAcerto.ParamByName('IDGRUPORUBRICA').AsInteger :=  prmIdGrupoRubAcerto;
   qryRubricaAcerto.Open;

   qryRubricaAcertoOrigem.Close;
   qryRubricaAcertoOrigem.ParamByName('IDGRUPORUBRICA').AsInteger :=  prmIdGrupoRubAcerto;
   qryRubricaAcertoOrigem.Open;
end;



procedure TfrmCompoeValoresRI.SpeedButton3Click(Sender: TObject);
begin
   inherited;
   AlinhaPainel(pnlIdentifica, True);
end;



procedure TfrmCompoeValoresRI.BitBtn1Click(Sender: TObject);
var
  sMsg    : string;
  sAnoMes : string;
begin
   inherited;
   // Críticas -------------------------------------------------------------------------------------

   // Preenchimento da Entidade Contábil
   if DBcboEntidadeContabil3.LookupValue = '' then
   begin
      MsgDlg('Selecione uma Entidade Contábil', 'Administração Previdenciária', mtWarning, [mbOk], 0);
      Repaint;
      if DBcboEntidadeContabil2.CanFocus then DBcboEntidadeContabil2.SetFocus;
      Exit;
   end;
   // ----------------------------------------------------------------------------------------------

   // ----------------------------------------------------------------------------------------------

   sMsg     := 'Não é possível incluir/alterar/excluir registros de meses fechados!';
   sAnoMes  := qryRubParticipante.FieldByName('MESCOBRANCA').AsString;

   if not(dtmReembolsoINSS.VerificaConcINSS(sAnoMes)) then
   begin
      MsgDlg(sMsg, Sistema.NomeModulo, mtWarning, [mbOk], 0);
      Repaint;
      Exit;
   end;

   sAnoMes  := FormatFloat('0000', DBspnAno.Value) + '/' + FormatFloat('00', cboMes.ItemIndex + 1);

   if not(dtmReembolsoINSS.VerificaConcINSS(sAnoMes)) then
   begin
      MsgDlg(sMsg, Sistema.NomeModulo, mtWarning, [mbOk], 0);
      Repaint;
      Exit;
   end;
   // ----------------------------------------------------------------------------------------------

   with qryUpdateDetConc do
   begin
      LimpaParametros(qryUpdateDetConc);

      ParamByName('PIDPLANOPREV').AsInteger     := StrToInt(DBcboEntidadeContabil3.LookupValue);
      ParamByName('PNUMPROCINSS').AsString      := qryRubParticipante.FieldByName('NUMPROCINSS').AsString;
      ParamByName('IDRUBRICA').AsInteger        := qryRubParticipante.FieldByName('IDRUBRICA').AsInteger;
      ParamByName('SEQUENCIAL').AsInteger       := qryRubParticipante.FieldByName('SEQUENCIAL').AsInteger;
      ParamByName('PIDPESSOA').AsFloat          := qryRubParticipante.FieldByName('IDPESSOA').AsFloat;
      ParamByName('PMESCOBRANCA').AsString      := qryRubParticipante.FieldByName('MESCOBRANCA').AsString;
      ParamByName('PMESREFERENCIA').AsString    := qryRubParticipante.FieldByName('MES').AsString;

      ExecSQL;
   end;

   AlinhaPainel(pnlIdentifica, False);
end;



procedure TfrmCompoeValoresRI.BitBtn2Click(Sender: TObject);
begin
   inherited;
   AlinhaPainel(pnlIdentifica, False);
end;



procedure TfrmCompoeValoresRI.CMDBLookupCombo1Change(Sender: TObject);
Var
  srubrica : String;
begin
  inherited;

  if copy(qryRubricaAcertoOrigem.FieldByName('RUBRICAINSS').AsString,1,1) = '1' Then
    sRubrica := '3' + copy(qryRubricaAcertoOrigem.FieldByName('RUBRICAINSS').AsString,2,3)
  else if copy(qryRubricaAcertoOrigem.FieldByName('RUBRICAINSS').AsString,1,1) = '3' Then
    sRubrica := '1' + copy(qryRubricaAcertoOrigem.FieldByName('RUBRICAINSS').AsString,2,3);

  chkcontrapartida.Visible := False;
  if (copy(qryRubricaAcertoOrigem.FieldByName('RUBRICAINSS').AsString,1,4) = '1092') or
     (copy(qryRubricaAcertoOrigem.FieldByName('RUBRICAINSS').AsString,1,4) = '3092') Then
     chkcontrapartida.Visible := True;


  qryRubricaAcerto.Locate('RUBRICAINSS',StrtoFloat(sRubrica),[loCaseInsensitive]);
  DBcboRubricaAcerto2.Refresh;
end;

procedure TfrmCompoeValoresRI.wwDBGrid2CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  if qryRubParticipante.FieldByName('FLGMANUAL').AsInteger <> 0 Then
     Highlight := true;
end;

procedure TfrmCompoeValoresRI.bbtnSairClick(Sender: TObject);
begin
  if dtmBasedados.dbBaseDados.InTransaction then
     if MsgDlg('Existe uma operação não confirmada. Confirma Abandono?', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes then
        dtmBasedados.dbBaseDados.Rollback
     else
        exit;

  inherited;

end;

procedure TfrmCompoeValoresRI.pnlCompoeValorMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  If ssLeft In Shift Then Begin
    ReleaseCapture;
    SendMessage(pnlCompoeValor.Handle ,WM_SYSCOMMAND, $F012,0);
  End;
end;



end.