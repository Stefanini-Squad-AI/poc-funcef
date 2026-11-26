unit FIdentificaINSS;

// Alterações:
{
--------------------------------------------------------------------------------------------------
Pendência   : SOL 133777 KINTANA 782368
Responsável : BRUNO AZEVEDO
Data        : 13/04/2010
Descrição   : Alteração nos tipos dos parâmetros: CODSINONIMO,DTINICIOCRED,DTFIMCRED.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 131786 KINTANA 753272
Responsável : BRUNO AZEVEDO
Data        : 03/03/2010
Descrição   : Somente salvar o campo DIB (Nas tabelas TEMPCONCINSS e DETCONCINSS)
              NULL ou com data válida.
---------------------------------------------------------------------------------------------------
Autor     : Renato Visoni
Data      : 26/02/2010
Pendência : SOL 123118 Kintana 612606
Descrição : Ajuste na rotina para inserir o campo CODSINONIMO,DTINICIOCRED,DTFIMCRED na
            DetConcInss e TempConcInss.
---------------------------------------------------------------------------------------------------
Rotina    : QRYPESSOA
Data      : 29/10/2008
Autor     : Renato Visoni
Pendência : SOL 99715 \ KINTANA 439029
Descrição : Alteração da query QRYPESSOA
query Antiga:
    SELECT
      NVL(DEP.MATRICULA, ELP.MATRICULA) AS MATRICULA,
      PES.IDPESSOA,
      DEP.IDTITULAR,
      PES.NOME,
      PFI.DATANASC,
      PES.NUMDOCUMENTO,
      SIT.DESCRICAO,
      PTR.NOME AS PATRO,
      PPP.IDPLANOPREV

    FROM
      PESSOA       PES,
      PESSOA       PTR,
            PESSOAFISICA PFI,
            ELEGPATRO    ELP,
            DEPENTIT     DEP,
      PARTPREVPLAN PPP,
      SITPART      SIT

    WHERE
          PES.NOME            LIKE :NOME
      AND PES.IDPESSOA        = PFI.IDPESSOA
      AND PES.IDPESSOA        = DEP.IDPESSOA(+)

      AND DEP.IDTITULAR       = PPP.IDPESSOA(+)
      AND DEP.IDTITULAR       = PPP.IDPESSOA(+)

      AND PPP.IDSITPART       = SIT.IDSITPART(+)
      AND ELP.IDPESSJUR       = PTR.IDPESSOA(+)
      AND PPP.FLGDESATIVADO   = 0

    ORDER BY
      PES.NOME
----------------------------------------------------------------------------------------------------
Rotina    : IdentificarClick(...), DBgrdPessoaRowChanged(...)
Data      : 10/12/2007
Autor     : André Pontes
Pendência : 26976
Descrição : Buscas por IDPESSOA + IDTITULAR em substituição a somente IDPESSOA
----------------------------------------------------------------------------------------------------
Rotina    : qryPlanPrevXContabil
Data      : 26/05/2007
Autor     : Augusto
Pendência : 25697
Descrição : Alterar a logica de pesquisa da query.
----------------------------------------------------------------------------------------------------
Rotina    : VerificaPreenchimento
Data      : 22/05/2007
Autor     : André Pontes
Pendência : 22324
Descrição : Restrição à associação de Plano Prev com Plano Prev Contabil, utilizando a tabela
            PlanPrevContabil
----------------------------------------------------------------------------------------------------
Rotina    :
Data      : 15/01/2007
Autor     : André Pontes
Pendência : 22786
Descrição : Gravação dos campos CODCONCESSORINSS, CODMANTENEDORINSS, e RUBRICAINSS, necessários ao
            processo de desfazer
----------------------------------------------------------------------------------------------------
Rotina    : cboMesExit, IdentificarClick
Data      : 27/09/2006
Autor     : André Pontes
Pendência : 23331
Descrição : Implementação de rateio por plano contábil na gravação da DetConc, acompanhando o
            percentual de rateio definido pela HistRubSal do mês selecionado
----------------------------------------------------------------------------------------------------
Rotina    :
Data      : 25/10/2005
Autor     : Augusto
Pendência :
Descrição : Permitir plano vazio
----------------------------------------------------------------------------------------------------
Rotina    :
Data      : 12/05/2005
Autor     : Augusto
Pendência : 19171
Descrição : Incluir Plano Previdenciario
----------------------------------------------------------------------------------------------------
Rotina    : qryPlanPrevContab
Data      : 20/10/2004
Autor     : Camille
Pendência : 17578
Descrição : Filtrar planos ativos
---------------------------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, ExtCtrls, Spin, Grids, Wwdbigrd, Wwdbgrid, Db, DBTables,
   Wwquery, Wwdatsrc, TREdit, FPreview,  Pptypes, ComCtrls, Menus, ppEndUsr,
   ppCtrls, ppDB, ppBands, ppVar, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, ppComm, ppRelatv, ppDBPipe, ppDBBDE, Mask, wwdbedit, wwdblook,
   wwdbdatetimepicker, CMDateTimePicker, Wwdbspin, DBCtrls, Provider,
  DBClient, uCMClientDataSet;

type
   TRubricaINSS  = Record
      CodRubrica  : String[4];
      Valor       : Double;
   end;

   TDetalhe = Record
      TipoDetalhe       : String[1];   // 1 - Credito Concessão  2 - Credito Manutencao  3 - PAB  4 - GLOSA
      Rubrica           : array of TRubricaINSS;
      NumeroBeneficio   : String[10];
      FlgTemRubrica     : String[1];
   end;


   TfrmIdentificaINSS = class(TfrmSairAjuda)
      ToolbarSep971: TToolbarSep97;
      pnlTopo: TPanel;
      Identificar: TBitBtn;
      OpenDialog1: TOpenDialog;
      UpdateSQL1: TUpdateSQL;
      ppLeituraArq: TppBDEPipeline;
      prLeituaArq: TppReport;
      ppHeaderBand15: TppHeaderBand;
      ppDBImage14: TppDBImage;
      ppDBText212: TppDBText;
      ppDBText213: TppDBText;
      ppDBText214: TppDBText;
      ppDBText215: TppDBText;
      ppDBText216: TppDBText;
      ppDBText217: TppDBText;
      ppDBText218: TppDBText;
      ppLabel206: TppLabel;
      ppDBText219: TppDBText;
      ppLabel210: TppLabel;
      ppLine62: TppLine;
      ppLabel212: TppLabel;
      ppLabel214: TppLabel;
      ppLine64: TppLine;
      ppDetailBand16: TppDetailBand;
      ppDBText220: TppDBText;
      ppDBText221: TppDBText;
      ppFooterBand15: TppFooterBand;
      ppLine63: TppLine;
      ppLabel213: TppLabel;
      ppSystemVariable27: TppSystemVariable;
      ppSummaryBand13: TppSummaryBand;
      ppLabel1: TppLabel;
      ppDBText1: TppDBText;
      ppDBCalc1: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      ppLabel2: TppLabel;
      ppdsnLeituraArq: TppDesigner;
      qryFundacao: TwwQuery;
      dsFundacao: TwwDataSource;
      ppFundacao: TppBDEPipeline;
      shp1: TppShape;
      ppLabel3: TppLabel;
      ppDBText2: TppDBText;
      ppLabel4: TppLabel;
      ppDBText3: TppDBText;
      ppDBCalc3: TppDBCalc;
      qryAux: TwwQuery;
      dsPessoa: TwwDataSource;
      qryPessoa: TwwQuery;
      Panel1: TPanel;
      qryBeneficiario: TwwQuery;
      Panel11: TPanel;
      DBgrdReembolso: TwwDBGrid;
      dsMantenedora: TwwDataSource;
      qryMantenedora: TwwQuery;
      dsBeneficiario: TwwDataSource;
      Label4: TLabel;
      Label5: TLabel;
      Label2: TLabel;
      DBgrdPessoa: TwwDBGrid;
      Label1: TLabel;
      DBgrdDetConc: TwwDBGrid;
      btnProcurar: TButton;
      cboMes: TComboBox;
      DBcboMantenedora: TwwDBLookupCombo;
      DBcboPlanPrevContab: TwwDBLookupCombo;
      grpTipo: TRadioGroup;
      edPossui: TEdit;
      Panel2: TPanel;
      qryReembolso: TwwQuery;
      dsReembolso: TwwDataSource;
      qryPlanPrevContab: TwwQuery;
      dsPlanPrevContab: TwwDataSource;
      qryFolhaFuncef: TwwQuery;
      dsFolhaFuncef: TwwDataSource;
      edtDIB: TCMDateTimePicker;
      Label15: TLabel;
      qryDeleteTempConc: TwwQuery;
      qryInsertDetConc: TwwQuery;
      qryTempConcINSS: TwwQuery;
      qrySequencial: TwwQuery;
      qrySequencialSEQUENCIAL: TFloatField;
      qryBeneficiarioNUMPROCINSS: TStringField;
      qryBeneficiarioNOME: TStringField;
      qryBeneficiarioNOMEMANTENEDORA: TStringField;
      qryBeneficiarioPLANOCONTABIL: TStringField;
      qryBeneficiarioDIB: TDateTimeField;
      DBspnAno: TwwDBSpinEdit;
      qryPessoaMATRICULA: TStringField;
      qryPessoaIDPESSOA: TFloatField;
      qryPessoaNOME: TStringField;
      qryPessoaDATANASC: TDateTimeField;
      qryPessoaNUMDOCUMENTO: TStringField;
      edMatricula: TDBEdit;
      qryTempConcINSSIDPESSOA: TFloatField;
      qryTempConcINSSNOME: TStringField;
      qryTempConcINSSCODRUBRICA1: TFloatField;
      qryTempConcINSSCODRUBRICA2: TFloatField;
      qryTempConcINSSCODRUBRICA3: TFloatField;
      qryTempConcINSSCODRUBRICA4: TFloatField;
      qryTempConcINSSVLRRUBRICA1: TFloatField;
      qryTempConcINSSVLRRUBRICA2: TFloatField;
      qryTempConcINSSVLRRUBRICA3: TFloatField;
      qryTempConcINSSVLRRUBRICA4: TFloatField;
      qryTempConcINSSDATALEITURA: TDateTimeField;
      qryTempConcINSSOBS: TStringField;
      qryTempConcINSSMOTIVO: TStringField;
      qryTempConcINSSMESPROCESSAMENTO: TStringField;
      qryTempConcINSSMESREFERENCIA: TStringField;
      qryTempConcINSSNUMPROCINSS: TStringField;
      qryTempConcINSSESPECIE: TStringField;
      qryTempConcINSSCODCONCESSORINSS: TStringField;
      qryTempConcINSSCODMANTENEDORINSS: TStringField;
      qryTempConcINSSMATRICULA: TStringField;
      qryTempConcINSSRMREAJ: TFloatField;
      qryTempConcINSSAPREAJ: TFloatField;
      qryTempConcINSSFLGMANUAL: TFloatField;
      qryTempConcINSSDIB: TDateTimeField;
      qryRubricaXINSS: TwwQuery;
      qryRubricaXINSSIDRUBRICA: TFloatField;
      qryRubricaXINSSRUBRICAINSS: TFloatField;
      qryRubricaXINSSFLGRUBCENTRAL: TFloatField;
      qryRubricaXINSSCODPROVDESC: TStringField;
      qryRubricaXINSSDESCRPROVDESC: TStringField;
      qryRubricaXINSSDESCRICAO: TStringField;
      qryFolhaFuncefIDPLANOPREV: TFloatField;
      qryFolhaFuncefNUMPROCINSS: TStringField;
      qryFolhaFuncefDIB: TDateTimeField;
      qryBeneficiarioESPECIE: TStringField;
      qryPessoaDESCRICAO: TStringField;
      qryPessoaPATRO: TStringField;
      qryPessoaIDPLANOPREV: TFloatField;
      qryPlanPrevContabIDPLANOPREV: TFloatField;
      qryPlanPrevContabNOME: TStringField;
      qryBeneficiarioCODCONCESSORINSS: TStringField;
      qryBeneficiarioCODMANTENEDORINSS: TStringField;
      qryLookPLANO: TwwQuery;
      StringField1: TStringField;
      FloatField1: TFloatField;
      DBcboPlanoPrevidenciario: TwwDBLookupCombo;
      Label6: TLabel;
      qryFolhaFuncefIDPLANPREVCONTAB: TFloatField;
      cdsHRS: TCMClientDataSet;
      cdsHRSIDPESSOA: TFloatField;
      cdsHRSIDTITULAR: TFloatField;
      cdsHRSIDRUBRICA: TFloatField;
      cdsHRSQUANT: TFloatField;
      dspHRS: TDataSetProvider;
      qryHRS: TwwQuery;
      qryHRSIDPESSOA: TFloatField;
      qryHRSIDTITULAR: TFloatField;
      qryHRSIDRUBRICA: TFloatField;
      qryHRSQUANT: TFloatField;
      qryHRSPessoa: TwwQuery;
      qryHRSPessoaIDPLANOCONTABIL: TFloatField;
      qryHRSPessoaIDPESSOA: TFloatField;
      qryHRSPessoaIDTITULAR: TFloatField;
      qryHRSPessoaVALOR: TFloatField;
      qryRubricaXINSSFLGRATEIOPLANO: TFloatField;
    qryPlanPrevXContabil: TwwQuery;
    qryPlanPrevXContabilIDPLANOPREV: TFloatField;
    qryPlanPrevXContabilIDPLANOPREVPREV: TFloatField;
    qryPlanPrevXContabilNOME: TStringField;
    qryPessoaIDTITULAR: TFloatField;
    qryBeneficiarioCODSINONIMO: TFloatField;
    qryTempConcINSSCODSINONIMO: TFloatField;
    qryTempConcINSSDTINICIOCRED: TDateTimeField;
    qryTempConcINSSDTFIMCRED: TDateTimeField;

      procedure IdentificarClick(Sender: TObject);
      procedure cboMesExit(Sender: TObject);
      procedure btnProcurarClick(Sender: TObject);
      procedure DBgrdPessoaRowChanged(Sender: TObject);
      procedure DBgrdDetConcRowChanged(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure DBcboMantenedoraChange(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBcboPlanPrevContabCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DBcboPlanPrevContabExit(Sender: TObject);


   private  // Private declarations

      IDRubrica         : Extended;
      MesProcessamento  : String;
      aRubricaINSS      : array of TRubricaINSS;
      aRubGrupoTipo4    : array of TRubricaINSS;

      function  VerificaPreenchimento: Boolean;


    // Relatórios


   public   // Public declarations

      LDetalhe       :TDetalhe;


   end;



var
  frmIdentificaINSS: TfrmIdentificaINSS;


implementation
{$R *.DFM}
uses
   uSistema, uDataBase, uMensErro, UAdmPrev, DRelatBeneficios, fAguarde, fParamRelEspecieRI,
   fParamRelRubricaRI, fConciliacao, uVerificaPreenchimento, uFuncoesUteis;




procedure TfrmIdentificaINSS.IdentificarClick(Sender: TObject);
var
   i, j           : Integer;
   iQuantRateio   : Integer;
   iSeqIni        : Integer;
   sNumProc       : String;
   fTotalRateio   : Currency;
   fVlrRestante   : Currency;
   fVlrLanc       : Currency;
   fFatorRateio   : Currency;
   bRateioHist    : Boolean;
   bRateioRubrica : Boolean;
   bSemRateio     : Boolean;
begin
   inherited;

   if not(VerificaPreenchimento) then Exit;

   if MsgDlg('Confirma a identificação do registro selecionado?', 'Administração Previdenciária',
             mtConfirmation, [mbYes, mbNo], 0) = mrNo then
   begin
      Repaint;
      Exit;
   end;
   Repaint;

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   sNumProc := qryBeneficiarioNUMPROCINSS.AsString;

   try
      with qryTempConcInss do
      begin
         LimpaParametros(qryTempConcInss);
         ParamByName('PNUMPROCINSS').AsString      := sNumProc;
         ParamByName('PMESPROCESSAMENTO').AsString := MesProcessamento;
         Open;

         if isEmpty then
         begin
            MsgDlg('Ocorreu um ERRO ao tentar identificar o registro selecionado!',
                   'Administração Previdenciária', mtError, [mbOK], 0);
            Repaint;
            Exit;
         end;

         First;

         with qrySequencial do
         begin
            LimpaParametros(qrySequencial);
            ParamByName('PIDPESSOA').AsFloat       := qryPessoaIDPESSOA.AsFloat;
            ParamByName('PMESCOBRANCA').AsString   := MesProcessamento;
            Open;

            iSeqIni := qrySequencialSEQUENCIAL.AsInteger;
         end;
      end;
      // -------------------------------------------------------------------------------------------

      //--------------------------------------------------------------------------------------------
      // André Pontes - pendência 23331 - 27/09/2006

      bRateioHist := False;
      if qryPessoaIDPESSOA.AsInteger > 0 then
      begin
         // André Pontes - pendência 26976 - 10/12/2007
         // Busca por IDPESSOA + IDTITULAR em substituição a somente IDPESSOA
         // bRateioHist := cdsHRS.Locate('IDPESSOA;IDTITULAR', VarArrayOf([qryPessoaIDPESSOA.AsInteger, qryPessoaIDPESSOA.AsInteger]), []);
         bRateioHist := cdsHRS.Locate('IDPESSOA;IDTITULAR', VarArrayOf([qryPessoaIDPESSOA.AsInteger, qryPessoaIDTITULAR.AsInteger]), []);
      end;

      // FIM André Pontes - pendência 23331 - 27/09/2006
      //--------------------------------------------------------------------------------------------


      // -------------------------------------------------------------------------------------------
      StartTransacao;

      try
         // ----------------------------------------------------------------------------------------
         // 1º inserção na DetConc
         // ----------------------------------------------------------------------------------------
         while not(qryTempConcInss.EOF) do
         begin
            inc(iSeqIni);

            // Procura o IDRubrica referente à rubrica do INSS na tabela
            with qryRubricaXINSS do
            begin
               LimpaParametros(qryRubricaXINSS);
               ParamByName('PRUBRICAINSS').AsFloat := qryTempConcINSSCODRUBRICA1.AsFloat;
               Open;

               bRateioRubrica := False;

               if not(isEmpty) then
               begin
                  IDRubrica      := qryRubricaXINSSIDRUBRICA.AsFloat;
                  bRateioRubrica := qryRubricaXINSSFLGRATEIOPLANO.AsInteger = 1;
               end
               else
               begin
                  RollBackTransacao;
                  MsgDlg('Ocorreu um ERRO ao tentar identificar a rubrica ('+
                          FormatFloat('#0', qryTempConcINSSCODRUBRICA1.AsFloat) + ') ',
                         'Administração Previdenciária', mtError, [mbOK], 0);
                  Repaint;
                  Exit;
               end;

               Close;
            end;

            //--------------------------------------------------------------------------------------
            // André Pontes - pendência 23331 - 26/09/2006
            //--------------------------------------------------------------------------------------

            bSemRateio := False;

            if not(bRateioRubrica) or not(bRateioHist) then
            begin
               bSemRateio := True;
            end
            else  // if not(bRateioRubrica) or not(bRateioHist)
            begin
               // Aqui é preciso efetivamente calcular o percentual de rateio por plano

               // 1º - Abre a query
               with qryHRSPessoa do
               begin
                  LimpaParametros(qryHRSPessoa);
                  ParamByName('PMESCOBRANCA').AsString   := MesProcessamento;
                  ParamByName('PIDPESSOA').AsInteger     := qryPessoaIDPESSOA.AsInteger;
                  // André Pontes - pendência 26976 - 10/12/2007
                  // Busca por IDPESSOA + IDTITULAR em substituição a somente IDPESSOA
                  // ParamByName('PIDTITULAR').AsInteger    := qryPessoaIDPESSOA.AsInteger;
                  ParamByName('PIDTITULAR').AsInteger    := qryPessoaIDTITULAR.AsInteger;
                  Open;
               end;

               if not(qryHRSPessoa.IsEmpty) then
               begin
                  iQuantRateio := qryHRSPessoa.RecordCount;
                  inc(iSeqIni);

                  // -------------------------------------------------------------------------------
                  // 2º - Verifica o total para poder posteriormente comparar com os registros
                  fTotalRateio := 0;

                  qryHRSPessoa.First;
                  while not(qryHRSPessoa.EOF) do
                  begin
                     fTotalRateio := fTotalRateio + qryHRSPessoaVALOR.AsCurrency;
                     qryHRSPessoa.Next;
                  end;

                  // -------------------------------------------------------------------------------
                  // 3º - Calcula e insere os valores rateados por plano
                  fVlrRestante := qryTempConcINSSVLRRUBRICA1.AsFloat;
                  j            := 0;

                  qryHRSPessoa.First;
                  while not(qryHRSPessoa.EOF) do
                  begin
                     inc(j);

                     // ----------------------------------------------------------------------------
                     // Cálculo do rateio aqui
                     // ----------------------------------------------------------------------------
                     if j = qryHRSPessoa.RecordCount then
                     begin
                        fVlrLanc       := fVlrRestante;
                     end
                     else
                     begin
                        fFatorRateio   := qryHRSPessoaVALOR.AsCurrency / fTotalRateio;
                        fVlrLanc       := ArredondaValor((qryTempConcINSSVLRRUBRICA1.AsFloat * fFatorRateio), 2);
                     end;
                     // ----------------------------------------------------------------------------



                     // ----------------------------------------------------------------------------
                     // insert detconcinss
                     // ----------------------------------------------------------------------------
                     with qryInsertDetConc do
                     begin
                        LimpaParametros(qryInsertDetConc);

                        ParamByName('PNUMPROCINSS').AsString      := sNumProc;
                        ParamByName('PIDPESSOA').AsFloat          := qryPessoaIDPESSOA.AsFloat;
                        ParamByName('PSEQUENCIAL').AsInteger      := iSeqIni;
                        ParamByName('PFLGTRATADO').AsInteger      := 2;
                        ParamByName('PRUBRICAINSS').AsString      := qryTempConcINSSCODRUBRICA1.AsString;
                        ParamByName('PCODMANTENEDORA').AsString   := DBcboMantenedora.LookupValue;
                        ParamByName('PMATRICULA').AsString        := qryPessoaMATRICULA.AsString;
                        ParamByName('PFLGMANUAL').AsString        := qryTempConcINSSFLGMANUAL.AsString;
                        ParamByName('PRMREAJ').AsFloat            := qryTempConcINSSRMREAJ.AsFloat;
                        ParamByName('PAPREAJ').AsFloat            := qryTempConcINSSAPREAJ.AsFloat;
                        ParamByName('PESPECIE').AsString          := qryTempConcINSSESPECIE.AsString;

                        //BRUNO AZEVEDO SOL 131786 KINTANA 753272
                        if (qryTempConcINSSDIB.AsDateTime > 0) then begin
                          ParamByName('PDIB').AsDate                := qryTempConcINSSDIB.AsDateTime;
                        end else begin
                          ParamByName('PDIB').Clear;
                        end;
                        //BRUNO AZEVEDO SOL 131786 KINTANA 753272

                        ParamByName('PIDRUBRICA').AsFloat         := IDRubrica;
                        ParamByName('PMESREFERENCIA').AsString    := qryTempConcINSSMESREFERENCIA.AsString;
                        ParamByName('PMESCOBRANCA').AsString      := qryTempConcINSSMESPROCESSAMENTO.AsString;

                        ParamByName('PNOME').AsString             := qryPessoaNOME.AsString;
                        ParamByName('PIDPLANOPREV').AsFloat       := qryHRSPessoaIDPLANOCONTABIL.AsInteger;
                        ParamByName('PIDPLANOPREVPREV').AsString  := DBcboPlanoPrevidenciario.LookupValue;  // Augusto 25/10/2005
                        ParamByName('PVALORINSS').AsFloat         := fVlrLanc;

                        ParamByName('PCODCONCESSORINSS').AsString  := qryTempConcINSSCODCONCESSORINSS.AsString;
                        ParamByName('PCODMANTENEDORINSS').AsString := qryTempConcINSSCODMANTENEDORINSS.AsString;


                        //Renato Visoni SOL 123118 Kintana 612606
                        ParamByName('PCODSINONIMO').AsString        := qryTempConcINSSCODSINONIMO.AsString;

                        if qryTempConcINSSDTINICIOCRED.AsDateTime = 0 then begin
                          ParamByName('PDTINICIOCRED').Clear;
                        end else begin
                          ParamByName('PDTINICIOCRED').AsDateTime     := qryTempConcINSSDTINICIOCRED.AsDateTime;
                        end;

                        if qryTempConcINSSDTFIMCRED.AsDateTime = 0 then begin
                          ParamByName('PDTFIMCRED').Clear;
                        end else begin
                          ParamByName('PDTFIMCRED').AsDateTime        := qryTempConcINSSDTFIMCRED.AsDateTime;
                        end;
                        //Renato Visoni SOL 123118 Kintana 612606




                        ExecSQL;
                     end;
                     // ----------------------------------------------------------------------------
                     // ----------------------------------------------------------------------------

                     fVlrRestante := fVlrRestante - fVlrLanc;

                     qryHRSPessoa.Next;
                  end;  // while not(qryHRSPessoa.EOF)

                  // -------------------------------------------------------------------------------
               end
               else  // if not(qryHRSPessoa.IsEmpty)
               begin
                  // Vai gravar exatamente como se não houvesse rateio
                  bSemRateio := True;
               end;  // if not(qryHRSPessoa.IsEmpty)

               //-----------------------------------------------------------------------------------
            end;  // if not(bRateioRubrica) or not(bRateioHist)

            // -------------------------------------------------------------------------------------
            // insert detconcinss
            // -------------------------------------------------------------------------------------
            if bSemRateio then
            begin
               with qryInsertDetConc do
               begin
                  LimpaParametros(qryInsertDetConc);

                  ParamByName('PNUMPROCINSS').AsString      := sNumProc;
                  ParamByName('PIDPESSOA').AsFloat          := qryPessoaIDPESSOA.AsFloat;
                  ParamByName('PSEQUENCIAL').AsInteger      := iSeqIni;
                  ParamByName('PFLGTRATADO').AsInteger      := 2;
                  ParamByName('PRUBRICAINSS').AsString      := qryTempConcINSSCODRUBRICA1.AsString;
                  ParamByName('PCODMANTENEDORA').AsString   := DBcboMantenedora.LookupValue;
                  ParamByName('PMATRICULA').AsString        := qryPessoaMATRICULA.AsString;
                  ParamByName('PFLGMANUAL').AsString        := qryTempConcINSSFLGMANUAL.AsString;
                  ParamByName('PRMREAJ').AsFloat            := qryTempConcINSSRMREAJ.AsFloat;
                  ParamByName('PAPREAJ').AsFloat            := qryTempConcINSSAPREAJ.AsFloat;
                  ParamByName('PESPECIE').AsString          := qryTempConcINSSESPECIE.AsString;

                  //BRUNO AZEVEDO SOL 131786 KINTANA 753272
                  if (qryTempConcINSSDIB.AsDateTime > 0) then begin
                    ParamByName('PDIB').AsDate                := qryTempConcINSSDIB.AsDateTime;
                  end else begin
                    ParamByName('PDIB').Clear;
                  end;
                  //BRUNO AZEVEDO SOL 131786 KINTANA 753272

                  ParamByName('PIDRUBRICA').AsFloat         := IDRubrica;
                  ParamByName('PMESREFERENCIA').AsString    := qryTempConcINSSMESREFERENCIA.AsString;
                  ParamByName('PMESCOBRANCA').AsString      := qryTempConcINSSMESPROCESSAMENTO.AsString;

                  ParamByName('PNOME').AsString             := qryPessoaNOME.AsString;
                  ParamByName('PIDPLANOPREV').AsFloat       := StrToFloat(DBcboPlanPrevContab.LookupValue);
                  ParamByName('PIDPLANOPREVPREV').AsString  := DBcboPlanoPrevidenciario.LookupValue;  
                  ParamByName('PVALORINSS').AsFloat         := qryTempConcINSSVLRRUBRICA1.AsFloat;

                  ParamByName('PCODCONCESSORINSS').AsString := qryTempConcINSSCODCONCESSORINSS.AsString;
                  ParamByName('PCODMANTENEDORINSS').AsString:= qryTempConcINSSCODMANTENEDORINSS.AsString;

                  //Renato Visoni SOL 123118 Kintana 612606
                  ParamByName('PCODSINONIMO').AsString        := qryTempConcINSSCODSINONIMO.AsString;

                  if qryTempConcINSSDTINICIOCRED.AsDateTime = 0 then begin
                    ParamByName('PDTINICIOCRED').Clear;
                  end else begin
                    ParamByName('PDTINICIOCRED').AsDateTime     := qryTempConcINSSDTINICIOCRED.AsDateTime;
                  end;

                  if qryTempConcINSSDTFIMCRED.AsDateTime = 0 then begin
                    ParamByName('PDTFIMCRED').Clear;
                  end else begin
                    ParamByName('PDTFIMCRED').AsDateTime        := qryTempConcINSSDTFIMCRED.AsDateTime;
                  end;
                  //Renato Visoni SOL 123118 Kintana 612606


                  ExecSQL;
               end;
            end;  // if bSemRateio

            //--------------------------------------------------------------------------------------
            // FIM André Pontes - pendência 23331 - 26/09/2006
            //--------------------------------------------------------------------------------------

            qryTempConcInss.Next;
         end;
         // ----------------------------------------------------------------------------------------

         // ----------------------------------------------------------------------------------------
         // 2º Delete da TempConc
         // ----------------------------------------------------------------------------------------
         with qryDeleteTempConc do
         begin
            LimpaParametros(qryDeleteTempConc);
            ParamByName('PNUMPROCINSS').AsString      := sNumProc;
            ParamByName('PMESPROCESSAMENTO').AsString := MesProcessamento;
            ExecSQL;
         end;
         // ----------------------------------------------------------------------------------------

         CommitTransacao;

         // Abre e fecha a query para refletir as alterações
         qryBeneficiario.Close;
         qryBeneficiario.Open;

      except
         RollBackTransacao;
         MsgDlg('Ocorreu um ERRO ao tentar identificar o registro selecionado!',
                'Administração Previdenciária', mtError, [mbOK], 0);
         Repaint;
         Raise;
         Repaint;
      end;

   finally
      qryPessoa.Close;
      qryTempConcINSS.Close;
      qryDeleteTempConc.Close;
      qryInsertDetConc.Close;
      qrySequencial.Close;
   end;
   // ----------------------------------------------------------------------------------------------
end;



procedure TfrmIdentificaINSS.cboMesExit(Sender: TObject);
var
   sMes, sAno : String;
begin
   inherited;

   if cboMes.ItemIndex = -1 then
   begin
      if cboMes.CanFocus then cboMes.SetFocus;
      Exit;
   end;

   sAno              := FormatFloat('0000', DBspnAno.Value);
   sMes              := FormatFloat('00', (cboMes.ItemIndex + 1));

   MesProcessamento  := sAno + '/' + sMes;

   qryBeneficiario.Close;
   qryBeneficiario.ParamByName('MESPROCESSAMENTO').AsString  := MesProcessamento;
   qryBeneficiario.Open;

   //-----------------------------------------------------------------------------------------------
   // André Pontes - pendência 23331 - 27/09/2006

   // Procura na HistRubSal os casos que precisam ter rateio por plano
   // Posteriormente, a cada pessoa que for gerar insert na DetConcINSS, vefificar-se-á o total
   // por plano das rubricas que estiverem parametrizadas para ratear por plano e o percentual
   // por plano será aplicado nas rubricas a gravar na DetConcINSS

   with qryHRS do
   begin
      LimpaParametros(qryHRS);
      ParamByName('PMESCOBRANCA').AsString := MesProcessamento;
      Open;
   end;
   cdsHRS.Active := True;

   // FIM André Pontes - pendência 23331 - 27/09/2006
   //-----------------------------------------------------------------------------------------------

   DBgrdDetConcRowChanged(Self);
end;



procedure TfrmIdentificaINSS.btnProcurarClick(Sender: TObject);
var
   i, j  : Integer;
   Nome1 : String;
   Nome2 : String;
begin
   inherited;

   if grpTipo.ItemIndex < 0 then Exit;

   if grpTipo.ItemIndex = 2 then
   begin
      if edPossui.Text = '' then
      begin
         edPossui.SetFocus;
         Exit;
      end;

      qryPessoa.Close;
      qryPessoa.Prepare;
      qryPessoa.ParamByName('NOME').AsString := '%' + Trim(edPossui.Text) + '%';
      qryPessoa.Open;

      Exit;
   end;

   i := Pos(' ', qryBeneficiario.FieldByName('NOME').AsString);
   Nome1 := Trim(Copy(qryBeneficiario.FieldByName('NOME').AsString, 1, (i - 1)));

   if grpTipo.ItemIndex = 1 then
   begin
      j := Pos(' ', Copy(qryBeneficiario.FieldByName('NOME').AsString, i + 1, length(qryBeneficiario.FieldByName('NOME').AsString)));
      Nome2 := Trim(Copy(qryBeneficiario.FieldByName('NOME').AsString,i + 1 ,j ));
      Nome1 := Nome1 + ' ' + Nome2;
   end;

   if Trim(Nome1) <> '' then
   begin
      qryPessoa.Close;
      qryPessoa.Prepare;
      qryPessoa.ParamByName('NOME').AsString := Nome1 + '%';
      qryPessoa.Open;
   end;

   DBgrdPessoaRowChanged(Self);
end;



procedure TfrmIdentificaINSS.DBgrdPessoaRowChanged(Sender: TObject);
begin
   inherited;

   edMatricula.text := qryPessoaMATRICULA.AsString;

   qryFolhaFuncef.Close;
  qryFolhaFuncef.ParamByName('PIDPESSOA').AsInteger   := qryPessoaIDPESSOA.AsInteger;
  // André Pontes - pendência 26976 - 10/12/2007
  // Busca por IDPESSOA + IDTITULAR em substituição a somente IDPESSOA
  qryFolhaFuncef.ParamByName('PIDTITULAR').AsInteger  := qryPessoaIDTITULAR.AsInteger;
   qryFolhaFuncef.Open;

   DBcboPlanPrevContab.LookupValue     := '';
   DBcboPlanPrevContab.Text            := '';
   DBcboPlanPrevContab.LookupValue     := qryFolhaFuncef.FieldByName('IDPLANPREVCONTAB').AsString;

   DBcboPlanoPrevidenciario.LookupValue  := '';
   DBcboPlanoPrevidenciario.Text         := '';
   DBcboPlanoPrevidenciario.LookupValue  := qryFolhaFuncef.FieldByName('IDPLANOPREV').AsString;
end;



procedure TfrmIdentificaINSS.DBgrdDetConcRowChanged(Sender: TObject);
begin
   inherited;

   qryReembolso.Close;
   qryReembolso.ParamByName('NUMPROC').AsString := qryBeneficiario.FieldByName('NUMPROCINSS').AsString;
   qryReembolso.ParamByName('mesprocessamento').AsString := MesProcessamento;
   qryReembolso.Open;

   qryPessoa.Close;

   DBcboPlanPrevContab.LookupValue  := '';
   DBcboPlanPrevContab.Text         := '';

   DBcboMantenedora.LookupValue     := '';
   DBcboMantenedora.Text            := '';
end;



procedure TfrmIdentificaINSS.FormCreate(Sender: TObject);
begin
   inherited;

   qryMantenedora.Close;
   qryMantenedora.Open;
   qryPlanPrevContab.Close;
   qryPlanPrevContab.Open;

   qryLookPlano.Open;
end;



procedure TfrmIdentificaINSS.FormShow(Sender: TObject);
begin
   inherited;
   DBspnAno.Value := DiasUteis.ExtraiAno(Date);
   DBspnAno.Value := DiasUteis.ExtraiAno(Date);
end;



procedure TfrmIdentificaINSS.DBcboMantenedoraChange(Sender: TObject);
begin
   inherited;
   if qryMantenedora.FieldByname('NOME').AsString <> 'FUNCEF' then
   begin
      qryPlanPrevContab.locate('NOME', 'REG/REPLAN', [loCaseInsensitive, loPartialKey]);
      if not(qryPlanPrevContab.EOF) then
      begin
         DBcboPlanPrevContab.LookupValue := qryPlanPrevContab.FieldByName('IDPLANOPREV').AsString;
      end;
   end;
end;



procedure TfrmIdentificaINSS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qryLookPlano.Close;
   inherited;
end;



function TfrmIdentificaINSS.VerificaPreenchimento: Boolean;
var
  sMsg : string;
begin
   Result := False;

   try
      // -------------------------------------------------------------------------------------------

      if qryPessoa.IsEmpty then
         raise EValidacao.CreateVal('É necessário indicar uma Pessoa!', DBgrdPessoa);

      if DBcboMantenedora.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar a Mantenedora!', DBcboMantenedora);

      if DBcboPlanPrevContab.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar a Entidade Contábil!', DBcboPlanPrevContab);

      // -------------------------------------------------------------------------------------------

      if DBcboPlanoPrevidenciario.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar o Plano Previdenciário!', DBcboPlanoPrevidenciario);

      sMsg := 'Não é possível associar o Plano Previdenciário "' + DBcboPlanoPrevidenciario.Text +
              '" à Entidade Contábil "' + DBcboPlanPrevContab.Text + '"!';

      with qryPlanPrevXContabil do
      begin
        LimpaParametros(qryPlanPrevXContabil);
        ParamByName('PIDPLANOPREV').AsInteger     := StrToInt(DBcboPlanPrevContab.LookupValue);
        ParamByName('PIDPLANOPREVPREV').AsInteger := StrToInt(DBcboPlanoPrevidenciario.LookupValue);
        Open;

        if qryPlanPrevXContabil.IsEmpty then
          raise EValidacao.CreateVal('Favor verificar o cadastro de associação entre Planos Previdenciários e Entidades Contábeis!', DBcboPlanoPrevidenciario);

        if qryPlanPrevXContabilIDPLANOPREV.AsInteger <> StrToInt(DBcboPlanPrevContab.LookupValue) then
          raise EValidacao.CreateVal(sMsg, DBcboPlanoPrevidenciario);

        Close;
      end;

      // -------------------------------------------------------------------------------------------

   except
      on ev : EValidacao do
      begin
         qryPlanPrevXContabil.Close;

         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, Sistema.NomeModulo, mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;

   Result := True;
end;



procedure TfrmIdentificaINSS.DBcboPlanPrevContabCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  if DBcboPlanPrevContab.LookupValue <> '' then
  begin
    LimpaParametros(qryLookPLANO);
    qryLookPLANO.ParamByName('PIDPLANOPREV').AsInteger := StrToInt(DBcboPlanPrevContab.LookupValue);
    qryLookPLANO.Open;
  end;

  DBcboPlanoPrevidenciario.Enabled := (DBcboPlanPrevContab.LookupValue <> '') and (DBcboPlanPrevContab.Text <> '');
end;



procedure TfrmIdentificaINSS.DBcboPlanPrevContabExit(Sender: TObject);
begin
  inherited;

  if DBcboPlanPrevContab.LookupValue <> '' then
  begin
    LimpaParametros(qryLookPLANO);
    qryLookPLANO.ParamByName('PIDPLANOPREV').AsInteger := StrToInt(DBcboPlanPrevContab.LookupValue);
    qryLookPLANO.Open;
  end;

  DBcboPlanoPrevidenciario.Enabled := (DBcboPlanPrevContab.LookupValue <> '') and (DBcboPlanPrevContab.Text <> '');
end;



end.