// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit FExecCargaFCRT;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelarImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
   Buttons, TB97Tlbr, TB97, ExtCtrls, DBTables, Wwtable, Db, Wwquery,
   Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, DBGrids, USistema;


type
   // ----------------------------------------------------------------------------------------------

   TRegistroBaca = Record
      IDTipoContrato    : Integer;
      IDContrato        : Int64;
      IDItem            : Integer;
      HmeTipoMov        : Integer;
      HmeOrigem         : Integer;
      HmeCentraliza     : Integer;
      HmeDestacado      : Integer;
      HmeParcela        : Integer;
      HmeNumParcelas    : Integer;
      HmeSeqCobranca    : Integer;
      HmeFormaCobranca  : String;
      HmeTipoFolha      : String;
      HmeVlrPrevisto    : Currency;
      HmeVlrEfetivo     : Currency;
      VlrJuros          : Currency;
      VlrPrincipal      : Currency;
      VlrEncargos       : Currency;
      VlrPagamento      : Currency;
      VlrDevido         : Currency;
      VlrTx             : Currency;
      HmeSaldoDev       : Currency;
      HmeData           : TDateTime;
      HmeDataPrevista   : TDateTime;
      HmeDataVencto     : TDateTime;
      HmeDataEfetiva    : TDateTime;
      HmeDataAtualiza   : TDateTime;
      HmeAnoCompetencia : Integer;
      HmeMesCompetencia : Integer;
      HmeAnoCobranca    : Integer;
      HmeMesCobranca    : Integer;
      FlgBaixado        : Integer;
      FlgEnvio          : Integer;
      HmeRecPag         : String;
   end;

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   TfrmExecCargaFCRT = class(TFrmOkCancelarImob)
    qryContrato: TwwQuery;
      tblContrato: TwwTable;
      dsContrato: TwwDataSource;
      dsParcela: TwwDataSource;
      qryParcela: TwwQuery;
      tblParcela: TwwTable;
      tblContratoMATRIC: TStringField;
      tblContratoSEQ: TStringField;
      tblContratoPROTOC: TStringField;
      tblContratoTIPO: TStringField;
      tblContratoCONVENIO: TStringField;
      tblContratoPARC_TOTAL: TStringField;
      tblContratoDIGITO: TStringField;
      tblContratoIENCARG: TStringField;
      tblContratoJUROS: TFloatField;
      tblContratoEMISSAO: TStringField;
      tblContratoAPROVACAO: TStringField;
      tblContratoCONCESSAO: TStringField;
      tblContratoPRIM_VCTO: TStringField;
      tblContratoULT_VCTO: TStringField;
      tblContratoULT_CAPIT: TStringField;
      tblContratoCANCEL: TStringField;
      tblContratoMOT_CANCEL: TStringField;
      tblContratoAUT_ESPEC: TStringField;
      tblContratoCONTAB: TStringField;
      tblContratoULT_PARC: TStringField;
      tblContratoCRED_APROV: TFloatField;
      tblContratoJUROS_APRO: TFloatField;
      tblContratoCORR_MONET: TFloatField;
      tblContratoTX_ADM: TFloatField;
      tblContratoVLR_BRUTO: TFloatField;
      tblContratoCOTA_QUIT: TFloatField;
      tblContratoSLD_FINANC: TFloatField;
      tblContratoSLD_ABERTO: TFloatField;
      tblContratoPRIM_PARC: TFloatField;
      tblContratoOUTR_PARC: TFloatField;
      tblContratoNUM_FAT: TStringField;
      tblContratoPATROC: TStringField;
      tblContratoCLS_PART: TStringField;
      tblContratoSIT_PART: TStringField;
      tblContratoBRANCO: TStringField;
      DBgrdContratos: TDBGrid;
      DBgrdParcelas: TDBGrid;
      chkConcessao: TCheckBox;
      chkParcela: TCheckBox;
      qryInsertHist: TwwQuery;
      tblParcelaMATRIC: TStringField;
      tblParcelaSEQ: TStringField;
      tblParcelaPROTOC: TStringField;
      tblParcelaTIPO: TStringField;
      tblParcelaNUM_PARCEL: TStringField;
      tblParcelaSEQ_PGTO: TStringField;
      tblParcelaDT_INCLU: TStringField;
      tblParcelaCONTABIL: TStringField;
      tblParcelaFOLHA: TStringField;
      tblParcelaDT_VCTO: TStringField;
      tblParcelaDT_CAPIT: TStringField;
      tblParcelaVLR_PRINCI: TFloatField;
      tblParcelaVLR_JUR_CO: TFloatField;
      tblParcelaVLR_CORR_M: TFloatField;
      tblParcelaVLR_TAXA: TFloatField;
      tblParcelaVLR_JUR_AT: TFloatField;
      tblParcelaCORR_MON_A: TFloatField;
      tblParcelaTX_ADM: TFloatField;
      tblParcelaJUR_INADI: TFloatField;
      tblParcelaCOR_MON_IN: TFloatField;
      tblParcelaVLR_DESC_A: TFloatField;
      tblParcelaVLR_TOT_PG: TFloatField;
      tblParcelaVLR_ULT_EN: TFloatField;
      tblParcelaSEQ_ULT_PG: TStringField;
      tblParcelaBRANCO: TStringField;
      qryParcelaMATRIC: TStringField;
      qryParcelaSEQ: TStringField;
      qryParcelaPROTOC: TStringField;
      qryParcelaTIPO: TStringField;
      qryParcelaNUM_PARCEL: TStringField;
      qryParcelaSEQ_PGTO: TStringField;
      qryParcelaDT_INCLU: TStringField;
      qryParcelaCONTABIL: TStringField;
      qryParcelaFOLHA: TStringField;
      qryParcelaDT_VCTO: TStringField;
      qryParcelaDT_CAPIT: TStringField;
      qryParcelaVLR_PRINCI: TFloatField;
      qryParcelaVLR_JUR_CO: TFloatField;
      qryParcelaVLR_CORR_M: TFloatField;
      qryParcelaVLR_TAXA: TFloatField;
      qryParcelaVLR_JUR_AT: TFloatField;
      qryParcelaCORR_MON_A: TFloatField;
      qryParcelaTX_ADM: TFloatField;
      qryParcelaJUR_INADI: TFloatField;
      qryParcelaCOR_MON_IN: TFloatField;
      qryParcelaVLR_DESC_A: TFloatField;
      qryParcelaVLR_TOT_PG: TFloatField;
      qryParcelaVLR_ULT_EN: TFloatField;
      qryParcelaSEQ_ULT_PG: TStringField;
      qryParcelaBRANCO: TStringField;
      Bevel1: TBevel;
      Bevel2: TBevel;
      Bevel3: TBevel;
      Bevel4: TBevel;
      Bevel5: TBevel;
      Bevel6: TBevel;
      Label1: TLabel;
      Label2: TLabel;
      lblConcessaoIni: TLabel;
      lblConcessaoFim: TLabel;
      lblParcelaIni: TLabel;
      lblParcelaFim: TLabel;
      qryTipoContr: TwwQuery;
      StringField1: TStringField;
      IntegerField1: TIntegerField;
      qryExisteParcelaBatimento: TwwQuery;
      edtMatricula: TEdit;
      edtProtocolo: TEdit;
      Label3: TLabel;
      Label4: TLabel;
      qrySomaEncargos: TwwQuery;
      edtQuant: TEdit;
      qryDistinct: TwwQuery;
      Label5: TLabel;
      Button1: TBitBtn;
      tblContratoFind: TwwTable;
      tblContratoFindMATRIC: TStringField;
      tblContratoFindSEQ: TStringField;
      tblContratoFindPROTOC: TStringField;
      tblContratoFindTIPO: TStringField;
      tblContratoFindCONVENIO: TStringField;
      tblContratoFindPARC_TOTAL: TStringField;
      tblContratoFindDIGITO: TStringField;
      tblContratoFindIENCARG: TStringField;
      tblContratoFindJUROS: TFloatField;
      tblContratoFindEMISSAO: TStringField;
      tblContratoFindAPROVACAO: TStringField;
      tblContratoFindCONCESSAO: TStringField;
      tblContratoFindPRIM_VCTO: TStringField;
      tblContratoFindULT_VCTO: TStringField;
      tblContratoFindULT_CAPIT: TStringField;
      tblContratoFindCANCEL: TStringField;
      tblContratoFindMOT_CANCEL: TStringField;
      tblContratoFindAUT_ESPEC: TStringField;
      tblContratoFindCONTAB: TStringField;
      tblContratoFindULT_PARC: TStringField;
      tblContratoFindCRED_APROV: TFloatField;
      tblContratoFindJUROS_APRO: TFloatField;
      tblContratoFindCORR_MONET: TFloatField;
      tblContratoFindTX_ADM: TFloatField;
      tblContratoFindVLR_BRUTO: TFloatField;
      tblContratoFindCOTA_QUIT: TFloatField;
      tblContratoFindSLD_FINANC: TFloatField;
      tblContratoFindSLD_ABERTO: TFloatField;
      tblContratoFindPRIM_PARC: TFloatField;
      tblContratoFindOUTR_PARC: TFloatField;
      tblContratoFindNUM_FAT: TStringField;
      tblContratoFindPATROC: TStringField;
      tblContratoFindCLS_PART: TStringField;
      tblContratoFindSIT_PART: TStringField;
      tblContratoFindBRANCO: TStringField;
      tblParcelaFind: TwwTable;
      tblParcelaFindMATRIC: TStringField;
      tblParcelaFindSEQ: TStringField;
      tblParcelaFindPROTOC: TStringField;
      tblParcelaFindTIPO: TStringField;
      tblParcelaFindNUM_PARCEL: TStringField;
      tblParcelaFindSEQ_PGTO: TStringField;
      tblParcelaFindDT_INCLU: TStringField;
      tblParcelaFindCONTABIL: TStringField;
      tblParcelaFindFOLHA: TStringField;
      tblParcelaFindDT_VCTO: TStringField;
      tblParcelaFindDT_CAPIT: TStringField;
      tblParcelaFindVLR_PRINCI: TFloatField;
      tblParcelaFindVLR_JUR_CO: TFloatField;
      tblParcelaFindVLR_CORR_M: TFloatField;
      tblParcelaFindVLR_TAXA: TFloatField;
      tblParcelaFindVLR_JUR_AT: TFloatField;
      tblParcelaFindCORR_MON_A: TFloatField;
      tblParcelaFindTX_ADM: TFloatField;
      tblParcelaFindJUR_INADI: TFloatField;
      tblParcelaFindCOR_MON_IN: TFloatField;
      tblParcelaFindVLR_DESC_A: TFloatField;
      tblParcelaFindVLR_TOT_PG: TFloatField;
      tblParcelaFindVLR_ULT_EN: TFloatField;
      tblParcelaFindSEQ_ULT_PG: TStringField;
      tblParcelaFindBRANCO: TStringField;
      dsContratoFind: TwwDataSource;
      qryContratoMATRIC: TStringField;
      qryContratoSEQ: TStringField;
      qryContratoPROTOC: TStringField;
      qryContratoTIPO: TStringField;
      qryContratoCONVENIO: TStringField;
      qryContratoPARC_TOTAL: TStringField;
      qryContratoDIGITO: TStringField;
      qryContratoIENCARG: TStringField;
      qryContratoJUROS: TFloatField;
      qryContratoEMISSAO: TStringField;
      qryContratoAPROVACAO: TStringField;
      qryContratoCONCESSAO: TStringField;
      qryContratoPRIM_VCTO: TStringField;
      qryContratoULT_VCTO: TStringField;
      qryContratoULT_CAPIT: TStringField;
      qryContratoCANCEL: TStringField;
      qryContratoMOT_CANCEL: TStringField;
      qryContratoAUT_ESPEC: TStringField;
      qryContratoCONTAB: TStringField;
      qryContratoULT_PARC: TStringField;
      qryContratoCRED_APROV: TFloatField;
      qryContratoJUROS_APRO: TFloatField;
      qryContratoCORR_MONET: TFloatField;
      qryContratoTX_ADM: TFloatField;
      qryContratoVLR_BRUTO: TFloatField;
      qryContratoCOTA_QUIT: TFloatField;
      qryContratoSLD_FINANC: TFloatField;
      qryContratoSLD_ABERTO: TFloatField;
      qryContratoPRIM_PARC: TFloatField;
      qryContratoOUTR_PARC: TFloatField;
      qryContratoNUM_FAT: TStringField;
      qryContratoPATROC: TStringField;
      qryContratoCLS_PART: TStringField;
      qryContratoSIT_PART: TStringField;
      qryContratoBRANCO: TStringField;
      qryExiste02: TwwQuery;
      BitBtn1: TBitBtn;
      qryInsertParcelas: TwwQuery;
      qryExisteParcelaBatimentoPROTOC: TStringField;
      qryContaCorrente: TwwQuery;
      tblContaCorrente: TwwTable;
      qryContaCorrenteIDCONTRATOEMPTMO: TFloatField;
      qryContaCorrenteIDPESSOA: TFloatField;
      qryContaCorrenteIDTIPOCONTREMPTMO: TFloatField;
      qryContaCorrenteMATRICTIT: TStringField;
      qryContaCorrenteMATRICULA: TStringField;
      qryContaCorrenteIDSITPLANOPREV: TFloatField;
      qryContaCorrenteDESCRICAO: TStringField;
      qryContaCorrenteTCEDESCRICAO: TStringField;
      qryContaCorrenteNOME: TStringField;
      qryContaCorrenteNOMETIT: TStringField;
      qryContaCorrenteDATAASSINATURA: TDateTimeField;
      qryContaCorrenteDATACREDITO: TDateTimeField;
      qryContaCorrenteNUMPARCELAS: TFloatField;
      qryContaCorrenteHMEPARCELA: TFloatField;
      qryContaCorrenteHMEVLRPREVISTO: TFloatField;
      qryContaCorrenteHMEVLREFETIVO: TFloatField;
      qryContaCorrenteHMEDATAPREVISTA: TDateTimeField;
      qryContaCorrenteHMEDATAVENCTO: TDateTimeField;
      qryContaCorrenteHMEDATAEFETIVA: TDateTimeField;
      qryContaCorrenteVLR_ANT: TFloatField;
      qryContaCorrenteSLD_DEV_ANT: TFloatField;
      qryContaCorrenteVLR_DEV_ANT: TFloatField;
      qryContaCorrenteSLD_DEV_ATU: TFloatField;
      qryContaCorrenteVLR_DEV_ATU: TFloatField;
      qryContaCorrenteVLR_ATU: TFloatField;
      qryContaCorrenteVLR_PAGO: TFloatField;
      qryExisteContrato: TwwQuery;
      qryExisteConcessao: TwwQuery;
      qryExisteParcela: TwwQuery;
      Label6: TLabel;
      tblContaCorrenteMATRIC: TStringField;
      tblContaCorrenteCHAVE: TStringField;
      tblContaCorrentePREST: TStringField;
      tblContaCorrenteDEBITO: TStringField;
      tblContaCorrenteANTERIOR: TStringField;
      tblContaCorrenteCREDMES: TStringField;
      tblContaCorrenteFIL1: TStringField;
      tblContaCorrentePARC: TStringField;
      tblContaCorrenteFIL3: TStringField;
      tblContaCorrenteDT_VCT: TStringField;
      tblContaCorrenteFIL2: TStringField;
      tblContaCorrenteDT_PGT: TStringField;
      tblContaCorrenteSALDO: TStringField;
      tblContaCorrenteCAMPO7: TStringField;
      tblContaCorrentePROTOC: TStringField;
    Button2: TBitBtn;
    Button3: TBitBtn;
    Button4: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    qryUpdateMoeda: TwwQuery;

      procedure bbtnConfirmarClick(Sender: TObject);
      procedure Button1Click(Sender: TObject);
      procedure BitBtn1Click(Sender: TObject);
      procedure Button2Click(Sender: TObject);
      procedure Button3Click(Sender: TObject);
      procedure qryContaCorrenteBeforeOpen(DataSet: TDataSet);
      procedure Button4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);


   private { Private declarations }

      rBaca                : TRegistroBaca;
      rBaca00              : TRegistroBaca;
      rBacaInsert          : TRegistroBaca;

      iRegistro            : Integer;
      txtArqContrato       : TextFile;
      txtArqParcela        : TextFile;

      fSaldoDevAnt         : Currency;
      fVlrPrevistoAnt      : Currency;

      dDataPrevistaAnt     : TDateTime;
      iAnoCompetenciaAnt   : Integer;
      iMesCompetenciaAnt   : Integer;

      sTipoContr           : String;

      procedure LimpaRegistro(var rRegistro: TRegistroBaca);

      procedure DesabilitaBotoes;
      procedure HabilitaBotoes;

      procedure GravaRegistro(var rRegistro: TRegistroBaca; var txtArq: TextFile);

      procedure CarregaConcessao;

      procedure InsereVlrSolic;
      procedure InsereVlrJuros;
      procedure InsereTxAdm;
      procedure InsereQQM;
      procedure InsereVlrCredito;

      procedure CarregaParcela;

      procedure PreencheRegistro(var rRegistro: TRegistroBaca);

      procedure InsereJuros;
      procedure InserePrincipal;
      procedure InsereEncargosEspecial;

      procedure InsereParcela(const rRegistro: TRegistroBaca);
      procedure InsereDevido;

      procedure InsereEncargos(const rRegistro: TRegistroBaca);

      function  NaoExiste01: Boolean;
      function  NaoExiste02: Boolean;

      function  SomaEncargos(iParcela: Integer): Currency;

      function  ConverteData(const sData: String): TDateTime;

      function  ExisteContrato(const sProtoc: String): Boolean;
      function  ExisteConcessao(const sProtoc: String): Boolean;
      function  ExisteParcela(const sProtoc: String): Boolean;

   public { Public declarations }

   end;



var
  frmExecCargaFCRT: TfrmExecCargaFCRT;



implementation
{$R *.DFM}
uses
   uSistema, uMensErro, uDatabase, dBaseDados,
   uFuncoesEmptmo, uDiasUteis,
   FProgresso;




procedure TfrmExecCargaFCRT.LimpaRegistro(var rRegistro: TRegistroBaca);
begin
   rRegistro.IDTipoContrato    := -1;
   rRegistro.IDContrato        := -1;
   rRegistro.IDItem            := -1;
   rRegistro.HmeTipoMov        := -1;
   rRegistro.HmeOrigem         := -1;
   rRegistro.HmeCentraliza     := -1;
   rRegistro.HmeDestacado      := -1;
   rRegistro.HmeParcela        := -1;
   rRegistro.HmeNumParcelas    := -1;
   rRegistro.HmeSeqCobranca    := -1;
   rRegistro.HmeFormaCobranca  := '';
   rRegistro.HmeTipoFolha      := '';
   rRegistro.HmeVlrPrevisto    := 0;
   rRegistro.HmeVlrEfetivo     := 0;
   rRegistro.HmeSaldoDev       := 0;
   rRegistro.VlrJuros          := 0;
   rRegistro.VlrPrincipal      := 0;
   rRegistro.VlrEncargos       := 0;
   rRegistro.VlrPagamento      := 0;
   rRegistro.VlrDevido         := 0;
   rRegistro.HmeData           := 0;
   rRegistro.HmeDataPrevista   := 0;
   rRegistro.HmeDataVencto     := 0;
   rRegistro.HmeDataEfetiva    := 0;
   rRegistro.HmeDataAtualiza   := 0;
   rRegistro.HmeAnoCompetencia := -1;
   rRegistro.HmeMesCompetencia := -1;
   rRegistro.HmeAnoCobranca    := -1;
   rRegistro.HmeMesCobranca    := -1;
   rRegistro.FlgBaixado        := -1;
   rRegistro.FlgEnvio          := -1;
   rRegistro.HmeRecPag         := '';
end;



procedure TfrmExecCargaFCRT.DesabilitaBotoes;
begin
   tblContrato.DisableControls;
   tblContratoFind.DisableControls;
   tblParcela.DisableControls;
   tblParcelaFind.DisableControls;

   chkConcessao.Enabled    := False;
   chkParcela.Enabled      := False;

   bbtnConfirmar.Enabled   := False;
   bbtnSair.Enabled        := False;
end;



procedure TfrmExecCargaFCRT.HabilitaBotoes;
begin
   chkConcessao.Enabled    := True;
   chkParcela.Enabled      := True;

   bbtnConfirmar.Enabled   := True;
   bbtnSair.Enabled        := True;

   tblContrato.EnableControls;
   tblParcela.EnableControls;
end;



procedure TfrmExecCargaFCRT.CarregaConcessao;
var
   iRegistros        : Integer;
   dData             : TDateTime;
   sData             : String;
   sAno, sMes, sDia  : String;
begin
   MostraEspera('Preparando carga de Concessões...');

   try
      (* Abre tabela de concessões *)
      tblContrato.Open;

      if not(tblContrato.EOF) then begin

         iRegistros := tblContrato.RecordCount;

         (* prepara o texto que conterá os eventuais erros *)
         //AssignFile(txtArqContrato, 'C:\PROJETOSCM5\EMPRESTIMO\CARGA_CONTRATO.TXT');
         AssignFile(txtArqContrato,  Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\PROJETOSCM5\EMPRESTIMO\CARGA_CONTRATO.TXT');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
         Rewrite(txtArqContrato);

         (* grava o horário de início *)
         WriteLN(txtArqContrato, FormatDateTime('dd/mm, hh:nn:ss', Now) + ' - Início');

         lblConcessaoIni.Caption := FormatDateTime('hh:nn:ss', Now);
         lblConcessaoIni.Visible := True;

         tblContrato.First;
         iRegistro := 0;

         EscondeEspera;
         MostraFormProgresso('Carregando Concessões...', 0, iRegistros, True, False);

         while not(tblContrato.EOF) do begin

            inc(iRegistro);
            AndaFormProgresso(iRegistro - 1);

            rBaca.IDTipoContrato    := StrToInt(tblContratoCONVENIO.AsString);
            rBaca.IDContrato        := StrToInt(tblContratoPROTOC.AsString);
            rBaca.HmeTipoMov        := 0;
            rBaca.HmeOrigem         := 9;
            rBaca.HmeCentraliza     := 0;
            rBaca.HmeDestacado      := 0;
            rBaca.HmeParcela        := 0;
            rBaca.HmeNumParcelas    := StrToInt(tblContratoPARC_TOTAL.AsString);
            rBaca.HmeSeqCobranca    := 1;
            rBaca.HmeFormaCobranca  := 'C';
            rBaca.HmeTipoFolha      := '';
            rBaca.HmeSaldoDev       := tblContratoVLR_BRUTO.AsCurrency / 100;

            // Tratamento da Data (concessão) ---------------------------------------------------------
            sData                   := tblContratoCONCESSAO.AsString;

            if copy(sData, 1, 2) > '02' then begin
               sAno := '19' + copy(sData, 1, 2);
            end else begin
               sAno := '20' + copy(sData, 1, 2);
            end;

            sMes                    := copy(sData, 3, 2);
            sDia                    := copy(sData, 5, 2);
            dData                   := StrToDate(sDia + '/' + sMes + '/' + sAno);
            // ----------------------------------------------------------------------------------------

            rBaca.HmeAnoCompetencia := StrToInt(sAno);
            rBaca.HmeMesCompetencia := StrToInt(sMes);
            rBaca.HmeAnoCobranca    := StrToInt(sAno);
            rBaca.HmeMesCobranca    := StrToInt(sMes);
{
            if ( (rBaca.HmeAnoCompetencia = 2002) and (rBaca.HmeMesCompetencia >= 6) ) then begin

               (* registro desprezado *)
               tblContrato.Next;
               Continue;
            end;
}
            rBaca.HmeData           := dData;
            rBaca.HmeDataPrevista   := dData;
            rBaca.HmeDataVencto     := dData;
            rBaca.HmeDataEfetiva    := dData;

            // Tratamento da Data (atualização) -------------------------------------------------------
            sData                   := tblContratoPRIM_VCTO.AsString;

            if copy(sData, 1, 2) > '02' then begin
               sAno := '19' + copy(sData, 1, 2);
            end else begin
               sAno := '20' + copy(sData, 1, 2);
            end;

            sMes                    := copy(sData, 3, 2);
            sDia                    := copy(sData, 5, 2);
            dData                   := StrToDate(sDia + '/' + sMes + '/' + sAno);
            dData                   := IncMonth(dData, -1);
            // ----------------------------------------------------------------------------------------

            rBaca.HmeDataAtualiza   := dData;
            rBaca.HmeRecPag         := 'P';

            // Inserção dos Registros de Concessão (atualização) --------------------------------------
            InsereVlrSolic;
            InsereVlrJuros;
            InsereTxAdm;
            InsereQQM;
            InsereVlrCredito;
            // ----------------------------------------------------------------------------------------

            tblContrato.Next;
         end;

         (* grava o horário de fim *)
         WriteLN(txtArqContrato, FormatDateTime('dd/mm, hh:nn:ss', Now) + ' - Fim');
         Closefile(txtArqContrato);

         lblConcessaoFim.Caption := FormatDateTime('hh:nn:ss', Now);
         lblConcessaoFim.Visible := True;
      end;

   finally
      tblContrato.Close;

      EscondeFormProgresso;
      EscondeEspera;
   end;
end;



procedure TfrmExecCargaFCRT.InsereVlrSolic;
begin
   if rBaca.IDTipoContrato in [015, 016, 025, 035, 045, 046, 047, 048] then begin
      rBaca.IDItem         := 14;
   end else begin
      if rBaca.IDTipoContrato = 080 then begin
         rBaca.IDItem      := 30;
      end else begin
         rBaca.IDItem      := 31;
      end;
   end;

   rBaca.HmeVlrPrevisto    := ( tblContratoVLR_BRUTO.AsCurrency / 100 ) -
                              ( tblContratoCOTA_QUIT.AsCurrency / 100 ) -
                              ( tblContratoCORR_MONET.AsCurrency / 100 ) -
                              ( tblContratoTX_ADM.AsCurrency / 100 );

   GravaRegistro(rBaca, txtArqContrato);
end;



procedure TfrmExecCargaFCRT.InsereVlrJuros;
begin
   if rBaca.IDTipoContrato in [015, 016, 025, 035, 045, 046, 047, 048] then begin
      rBaca.IDItem         := 18;
      rBaca.HmeVlrPrevisto := ( tblContratoCORR_MONET.AsCurrency / 100 );
   end else begin
      rBaca.HmeVlrPrevisto := 0
   end;

   GravaRegistro(rBaca, txtArqContrato);
end;



procedure TfrmExecCargaFCRT.InsereTxAdm;
begin
   if rBaca.IDTipoContrato in [015, 016, 025, 035, 045, 046, 047, 048] then begin
      rBaca.IDItem         := 2;
      rBaca.HmeVlrPrevisto := ( tblContratoTX_ADM.AsCurrency / 100 );
   end else begin
      rBaca.HmeVlrPrevisto := 0
   end;

   GravaRegistro(rBaca, txtArqContrato);
end;



procedure TfrmExecCargaFCRT.InsereQQM;
begin
   if rBaca.IDTipoContrato in [015, 016, 025, 035, 045, 046, 047, 048] then begin
      rBaca.IDItem         := 1;
      rBaca.HmeVlrPrevisto := ( tblContratoCOTA_QUIT.AsCurrency / 100 );
   end else begin
      rBaca.HmeVlrPrevisto := 0
   end;

   GravaRegistro(rBaca, txtArqContrato);
end;



procedure TfrmExecCargaFCRT.InsereVlrCredito;
begin
   if rBaca.IDTipoContrato in [015, 016, 025, 035, 045, 046, 047, 048] then begin
      rBaca.IDItem         := 3;
   end else begin
      rBaca.IDItem         := 29;
   end;

   rBaca.HmeVlrPrevisto    := ( tblContratoVLR_BRUTO.AsCurrency / 100 ) -
                              ( tblContratoCOTA_QUIT.AsCurrency / 100 ) -
                              ( tblContratoCORR_MONET.AsCurrency / 100 ) -
                              ( tblContratoTX_ADM.AsCurrency / 100 );

   rBaca.HmeCentraliza     := 1;
   rBaca.HmeVlrEfetivo     := rBaca.HmeVlrPrevisto;

   GravaRegistro(rBaca, txtArqContrato);
end;




// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------

//                        .-.
//                       |_:_|
//                      /(_Y_)\
// .                   ( \/M\/ )
//  '.               _.'-/'-'\-'._
//    ':           _/.--'[[[[]'--.\_
//      ':        /_'  : |::"| :  '.\
//        ':     //   ./ |oUU| \.'  :\
//          ':  _:'..' \_|___|_/ :   :|
//            ':.  .'  |_[___]_|  :.':\
//             [::\ |  :  | |  :   ; : \
//              '-'   \/'.| |.' \  .;.' |
//              |\_    \  '-'   :       |
//              |  \    \ .:    :   |   |
//              |   \    | '.   :    \  |
//              /       \   :. .;       |
//             /     |   |  :__/     :  \\
//            |  |   |    \:   | \   |   ||
//           /    \  : :  |:   /  |__|   /|
//           |     : : :_/_|  /'._\  '--|_\
//           /___.-/_|-'   \  \
//                          '-'

// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------




procedure TfrmExecCargaFCRT.CarregaParcela;
var
   iRegistros        : Integer;
   sData             : String;
   sProtocolo        : String;
   sProtocoloAnt     : String;
begin
   MostraEspera('Preparando carga de Parcelas...');

   (* Abre tabela de parcelas *)
   tblParcela.Open;
   tblParcelaFind.Open;
   tblContratoFind.Open;

   if not(tblParcela.EOF) then begin

      iRegistros := tblParcela.RecordCount;

      (* prepara o texto que conterá os eventuais erros *)
      //AssignFile(txtArqParcela, 'C:\PROJETOSCM5\EMPRESTIMO\CARGA_PARCELA.TXT');
      AssignFile(txtArqParcela,  Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\PROJETOSCM5\EMPRESTIMO\CARGA_PARCELA.TXT');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

      Rewrite(txtArqParcela);

      (* grava o horário de início *)
      WriteLN(txtArqParcela, FormatDateTime('dd/mm, hh:nn:ss', Now) + ' - Início');

      lblParcelaIni.Caption := FormatDateTime('hh:nn:ss', Now);
      lblParcelaIni.Visible := True;

      tblParcela.First;
      iRegistro := 0;

      EscondeEspera;
      MostraFormProgresso('Carregando Parcelas...', 0, iRegistros, True, False);

      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------

      while not(tblParcela.EOF) do begin

         inc(iRegistro);
         AndaFormProgresso(iRegistro - 1);

         sProtocolo := tblParcelaPROTOC.AsString;

         // Busca o Contrato na tabela de concessões -----------------------------------------------
         if sProtocolo <> sProtocoloAnt then begin
{
            LimpaParametros(qryContrato);
            qryContrato.ParamByName('PPROTOC').AsString := tblParcelaPROTOC.AsString;
            qryContrato.Open;

            if qryContrato.IsEmpty then begin

               WriteLN(txtArqParcela, FormatDateTime('dd/mm, hh:nn:ss', Now) + ' - ERRO  : linha ' +
                                      FormatFloat('000,000', iRegistro) + ': Contrato ' +
                                      tblParcelaPROTOC.AsString + ' não encontrado');

               tblParcela.Next;
               Continue;

            end else begin
               WriteLN(txtArqParcela, FormatDateTime('dd/mm, hh:nn:ss', Now) + ' - linha ' +
                       FormatFloat('000,000', iRegistro) + ' - Contrato ' + sProtocolo);

               sProtocoloAnt  := sProtocolo;

               sTipoContr     := qryContratoCONVENIO.AsString;
               fSaldoDevAnt   := qryContratoVLR_BRUTO.AsCurrency / 100;
            end;
}

            tblContratoFind.First;
            if not(tblContratoFind.FindKey([tblParcelaPROTOC.AsString])) then begin

               WriteLN(txtArqParcela, FormatDateTime('dd/mm, hh:nn:ss', Now) + ' - ERRO  : linha ' +
                                      FormatFloat('000,000', iRegistro) + ': Contrato ' +
                                      tblParcelaPROTOC.AsString + ' não encontrado');

               tblParcela.Next;
               Continue;

            end else begin
               WriteLN(txtArqParcela, FormatDateTime('dd/mm, hh:nn:ss', Now) + ' - linha ' +
                       FormatFloat('000,000', iRegistro) + ' - Contrato ' + sProtocolo);

               sProtocoloAnt  := tblContratoFindPROTOC.AsString;
               sTipoContr     := tblContratoFindCONVENIO.AsString;
               fSaldoDevAnt   := tblContratoFindVLR_BRUTO.AsCurrency / 100;
            end;

         end;
         // ----------------------------------------------------------------------------------------


         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------

         try
            (* insere os registros '00' (juros e principal, e a prestação se não houver outra *)
            if tblParcelaSEQ_PGTO.AsString = '00' then begin

               fVlrPrevistoAnt         := 0;

               PreencheRegistro(rBaca00);

               rBaca00.HmeVlrEfetivo   := 0;
               rBaca00.HmeDataEfetiva  := 0;

               if rBaca00.IDTipoContrato in [015, 016, 025, 035, 045, 046, 047, 048] then begin
                  InsereJuros;
               end;
               InserePrincipal;

                                (* ****************************** *)
                                (* PARA NOVA CARGA OBSERVAR O MÊS *)
                                (* ****************************** *)
               (* se for a última parcela, verifica se existe 01; se houver, não insere *)
               if ( NaoExiste01 ) then
               begin
                  InsereParcela(rBaca00);

                  (* se houver encargos para o mês, insere o registro, a partir do rBaca *)
   //               if rBaca00.VlrEncargos > 0 then InsereEncargos(rBaca00);
               end;

               (* tratamento para encargos não cobrados *)
               if ( (rBaca00.VlrEncargos > 0) or (rBaca00.VlrTx > 0)) then InsereEncargosEspecial;


            end else begin
               (* se houver registro de pagamento, faz a inserção ao invés do '00' *)

               PreencheRegistro(rBaca);
               InsereParcela(rBaca);

                                (* ****************************** *)
                                (* PARA NOVA CARGA OBSERVAR O MÊS *)
                                (* ****************************** *)
               if ( (rBaca.HmeAnoCobranca = 2002) and (rBaca.HmeMesCobranca in [06, 07]) and
                    (rBacaInsert.VlrDevido > 0) and (NaoExiste02) ) then
               begin
                  (* se houver resíduo (previsto - efetivo > 0) insere novo registro *)
                  InsereDevido;
               end;

               (* se houver encargos para o mês, insere o registro, a partir do rBaca *)
               if rBaca.VlrEncargos > 0 then InsereEncargos(rBaca);

            end;

         except
            WriteLN(txtArqParcela, FormatDateTime('dd/mm, hh:nn:ss', Now) + ' - ERRO  : linha ' +
                                   FormatFloat('000,000', iRegistro) + ': ' + 'Contrato ' +
                                   sProtocolo + ', Parcela ' + tblParcelaNUM_PARCEL.AsString);
         end;

         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------

         tblParcela.Next;
      end;

      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------

      (* grava o horário de fim *)
      WriteLN(txtArqParcela, FormatDateTime('dd/mm, hh:nn:ss', Now) + ' - Fim');
      Closefile(txtArqParcela);

      lblParcelaFim.Caption := FormatDateTime('hh:nn:ss', Now);
      lblParcelaFim.Visible := True;

   end else begin
      EscondeEspera;
   end;
end;



procedure TfrmExecCargaFCRT.PreencheRegistro(var rRegistro: TRegistroBaca);
begin
   try
      rRegistro.IDTipoContrato      := StrToInt(sTipoContr);
//      rRegistro.IDContrato          := StrToInt(qryContratoPROTOC.AsString);
      rRegistro.IDContrato          := StrToInt(tblContratoFindPROTOC.AsString);
      rRegistro.HmeTipoMov          := 1;
      rRegistro.HmeOrigem           := 9;
      rRegistro.HmeCentraliza       := 0;
      rRegistro.HmeDestacado        := 0;
      rRegistro.HmeParcela          := StrToInt(tblParcelaNUM_PARCEL.AsString);
//      rRegistro.HmeNumParcelas      := StrToInt(qryContratoPARC_TOTAL.AsString) - StrToInt(tblParcelaNUM_PARCEL.AsString);
      rRegistro.HmeNumParcelas      := StrToInt(tblContratoFindPARC_TOTAL.AsString) - StrToInt(tblParcelaNUM_PARCEL.AsString);

      (* acerta os SeqCobranca 00 *)
      rRegistro.HmeSeqCobranca      := StrToInt(tblParcelaSEQ_PGTO.AsString);
      if rRegistro.HmeSeqCobranca = 0 then rRegistro.HmeSeqCobranca := 1;

      rRegistro.HmeFormaCobranca    := 'F';
      rRegistro.HmeRecPag           := 'R';

      rRegistro.HmeData             := ConverteData(tblParcelaDT_INCLU.AsString);
      rRegistro.HmeDataPrevista     := ConverteData(tblParcelaDT_VCTO.AsString);
      rRegistro.HmeDataVencto       := ConverteData(tblParcelaDT_VCTO.AsString);
      rRegistro.HmeDataEfetiva      := ConverteData(tblParcelaDT_VCTO.AsString);
      rRegistro.HmeDataAtualiza     := ConverteData(tblParcelaDT_VCTO.AsString);

      rRegistro.HmeAnoCompetencia   := DiasUteis.ExtraiAno(rRegistro.HmeDataPrevista);
      rRegistro.HmeMesCompetencia   := DiasUteis.ExtraiMes(rRegistro.HmeDataPrevista);
      rRegistro.HmeAnoCobranca      := DiasUteis.ExtraiAno(rRegistro.HmeDataVencto);
      rRegistro.HmeMesCobranca      := DiasUteis.ExtraiMes(rRegistro.HmeDataVencto);

      rRegistro.VlrTx               := (tblParcelaVLR_TAXA.AsCurrency / 100);

      rRegistro.VlrJuros            := (tblParcelaVLR_CORR_M.AsCurrency / 100);
      rRegistro.VlrPrincipal        := (tblParcelaVLR_PRINCI.AsCurrency / 100);
      rRegistro.VlrEncargos         := (tblParcelaCORR_MON_A.AsCurrency / 100);
      rRegistro.VlrPagamento        := (tblParcelaVLR_TOT_PG.AsCurrency / 100);

      rRegistro.HmeVlrPrevisto      := rRegistro.VlrPrincipal + rRegistro.VlrJuros;
      rRegistro.HmeVlrEfetivo       := rRegistro.VlrPagamento - rRegistro.VlrEncargos;

      rRegistro.VlrDevido           := rRegistro.HmeVlrPrevisto - rRegistro.HmeVlrEfetivo;

   except
   end;
end;



procedure TfrmExecCargaFCRT.InsereJuros;
begin
   try
      LimpaRegistro(rBacaInsert);

      rBacaInsert.IDTipoContrato    := rBaca00.IDTipoContrato;
      rBacaInsert.IDContrato        := rBaca00.IDContrato;

      rBacaInsert.IDItem            := 20;

      (* parcela *)
      rBacaInsert.HmeTipoMov        := 1;

      rBacaInsert.HmeOrigem         := 9;
      rBacaInsert.HmeCentraliza     := 0;
      rBacaInsert.HmeDestacado      := 0;
      rBacaInsert.HmeParcela        := rBaca00.HmeParcela;
      rBacaInsert.HmeNumParcelas    := rBaca00.HmeNumParcelas;
      rBacaInsert.HmeSeqCobranca    := rBaca00.HmeSeqCobranca;
      rBacaInsert.HmeFormaCobranca  := rBaca00.HmeFormaCobranca;
      rBacaInsert.HmeTipoFolha      := rBaca00.HmeTipoFolha;

      rBacaInsert.HmeVlrPrevisto    := rBaca00.VlrJuros;

      fSaldoDevAnt                  := fSaldoDevAnt + rBaca00.VlrJuros;
      rBacaInsert.HmeSaldoDev       := fSaldoDevAnt;

      rBacaInsert.HmeData           := rBaca00.HmeData;
      rBacaInsert.HmeDataPrevista   := rBaca00.HmeDataPrevista;
      rBacaInsert.HmeDataVencto     := rBaca00.HmeDataVencto;
      rBacaInsert.HmeDataEfetiva    := rBaca00.HmeDataEfetiva;
      rBacaInsert.HmeDataAtualiza   := rBaca00.HmeDataAtualiza;
      rBacaInsert.HmeAnoCompetencia := rBaca00.HmeAnoCompetencia;
      rBacaInsert.HmeMesCompetencia := rBaca00.HmeMesCompetencia;
      rBacaInsert.HmeAnoCobranca    := rBaca00.HmeAnoCobranca;
      rBacaInsert.HmeMesCobranca    := rBaca00.HmeMesCobranca;
      rBacaInsert.HmeRecPag         := rBaca00.HmeRecPag;

   except
   end;

   GravaRegistro(rBacaInsert, txtArqParcela);
end;



procedure TfrmExecCargaFCRT.InserePrincipal;
begin
   try
      LimpaRegistro(rBacaInsert);

      rBacaInsert.IDTipoContrato    := rBaca00.IDTipoContrato;
      rBacaInsert.IDContrato        := rBaca00.IDContrato;

      if rBaca00.IDTipoContrato in [015, 016, 025, 035, 045, 046, 047, 048] then begin
         rBacaInsert.IDItem         := 40;
      end else begin
         rBacaInsert.IDItem         := 48;
      end;

      (* parcela *)
      rBacaInsert.HmeTipoMov        := 1;

      rBacaInsert.HmeOrigem         := 9;
      rBacaInsert.HmeCentraliza     := 0;
      rBacaInsert.HmeDestacado      := 0;
      rBacaInsert.HmeParcela        := rBaca00.HmeParcela;
      rBacaInsert.HmeNumParcelas    := rBaca00.HmeNumParcelas;
      rBacaInsert.HmeSeqCobranca    := rBaca00.HmeSeqCobranca;
      rBacaInsert.HmeFormaCobranca  := rBaca00.HmeFormaCobranca;
      rBacaInsert.HmeTipoFolha      := rBaca00.HmeTipoFolha;

      rBacaInsert.HmeVlrPrevisto    := rBaca00.VlrPrincipal + rBaca00.VlrJuros;
      fVlrPrevistoAnt               := rBaca00.HmeVlrPrevisto;

      fSaldoDevAnt                  := fSaldoDevAnt - rBaca00.HmeVlrPrevisto;

      (* se for convênio, o saldo é ZERO *)
      if rBacaInsert.IDTipoContrato in [080, 090] then begin
         fSaldoDevAnt               := 0;
      end;

      rBacaInsert.HmeSaldoDev       := fSaldoDevAnt;

      rBacaInsert.HmeData           := rBaca00.HmeData;
      rBacaInsert.HmeDataPrevista   := rBaca00.HmeDataPrevista;
      rBacaInsert.HmeDataVencto     := rBaca00.HmeDataVencto;
      rBacaInsert.HmeDataEfetiva    := rBaca00.HmeDataEfetiva;
      rBacaInsert.HmeDataAtualiza   := rBaca00.HmeDataAtualiza;
      rBacaInsert.HmeAnoCompetencia := rBaca00.HmeAnoCompetencia;
      rBacaInsert.HmeMesCompetencia := rBaca00.HmeMesCompetencia;
      rBacaInsert.HmeAnoCobranca    := rBaca00.HmeAnoCobranca;
      rBacaInsert.HmeMesCobranca    := rBaca00.HmeMesCobranca;
      rBacaInsert.HmeRecPag         := rBaca00.HmeRecPag;

      dDataPrevistaAnt              := rBaca00.HmeDataPrevista;
      iAnoCompetenciaAnt            := rBaca00.HmeAnoCompetencia;
      iMesCompetenciaAnt            := rBaca00.HmeMesCompetencia;

   except
   end;

   GravaRegistro(rBacaInsert, txtArqParcela);
end;



procedure TfrmExecCargaFCRT.InsereEncargosEspecial;
var
   fEncargos : Currency;
begin
   try
      if ( (rBaca00.VlrEncargos > 0) or (rBaca00.VlrTx > 0) ) then begin

         fEncargos := SomaEncargos(rBacaInsert.HmeParcela) / 100;

         if (rBaca00.VlrEncargos - fEncargos > 0) then begin

            if rBacaInsert.IDTipoContrato in [015, 016, 025, 035, 045, 046, 047, 048] then begin
               rBacaInsert.IDItem         := 26;
            end else begin
               rBacaInsert.IDItem         := 34;
            end;

            rBacaInsert.HmeTipoMov        := 4;

            rBacaInsert.HmeOrigem         := 9;
            rBacaInsert.HmeCentraliza     := 0;
            rBacaInsert.HmeDestacado      := 1;

            rBacaInsert.HmeVlrPrevisto := rBaca00.VlrEncargos - fEncargos + rBaca00.VlrTx;
            rBacaInsert.HmeVlrEfetivo  := 0;

                                      (* ****************************** *)
                                      (* PARA NOVA CARGA OBSERVAR O MÊS *)
                                      (* ****************************** *)

            rBacaInsert.HmeData        := StrToDate('11/07/2002');
            rBacaInsert.HmeDataVencto  := StrToDate('31/07/2002');

            rBacaInsert.HmeDataEfetiva := 0;

            rBacaInsert.HmeAnoCobranca := 2002;
            rBacaInsert.HmeMesCobranca := 07;

            GravaRegistro(rBacaInsert, txtArqParcela);

         end;
      end;

   except
   end;
end;



procedure TfrmExecCargaFCRT.InsereParcela(const rRegistro: TRegistroBaca);
begin
   try
      LimpaRegistro(rBacaInsert);

      rBacaInsert.IDTipoContrato    := rRegistro.IDTipoContrato;
      rBacaInsert.IDContrato        := rRegistro.IDContrato;

      if rRegistro.IDTipoContrato in [015, 016, 025, 035, 045, 046, 047, 048] then begin
         rBacaInsert.IDItem         := 5;
      end else begin
         rBacaInsert.IDItem         := 32;
      end;

      (* parcela *)
      rBacaInsert.HmeTipoMov        := 1;

      rBacaInsert.HmeOrigem         := 9;
      rBacaInsert.HmeCentraliza     := 1;
      rBacaInsert.HmeDestacado      := 0;
      rBacaInsert.HmeParcela        := rRegistro.HmeParcela;
      rBacaInsert.HmeNumParcelas    := rRegistro.HmeNumParcelas;
      rBacaInsert.HmeSeqCobranca    := rRegistro.HmeSeqCobranca;
      rBacaInsert.HmeFormaCobranca  := rRegistro.HmeFormaCobranca;
      rBacaInsert.HmeTipoFolha      := rRegistro.HmeTipoFolha;

      rBacaInsert.HmeVlrPrevisto    := fVlrPrevistoAnt;
      rBacaInsert.HmeVlrEfetivo     := rRegistro.HmeVlrEfetivo;

      fVlrPrevistoAnt               := fVlrPrevistoAnt - rBacaInsert.HmeVlrEfetivo;
      rBacaInsert.VlrDevido         := rBacaInsert.HmeVlrPrevisto - rBacaInsert.HmeVlrEfetivo;

      rBacaInsert.HmeSaldoDev       := fSaldoDevAnt;

      (* se for convênio, o saldo é ZERO *)
      if rBaca.IDTipoContrato in [080, 090] then begin
         rBacaInsert.HmeSaldoDev    := 0;
      end;

      rBacaInsert.HmeData           := rRegistro.HmeData;
      rBacaInsert.HmeDataPrevista   := dDataPrevistaAnt;
      rBacaInsert.HmeDataVencto     := rRegistro.HmeDataVencto;
      rBacaInsert.HmeDataEfetiva    := rRegistro.HmeDataEfetiva;
      rBacaInsert.HmeDataAtualiza   := rRegistro.HmeDataAtualiza;

      rBacaInsert.HmeAnoCompetencia := iAnoCompetenciaAnt;
      rBacaInsert.HmeMesCompetencia := iMesCompetenciaAnt;
      rBacaInsert.HmeAnoCobranca    := rRegistro.HmeAnoCobranca;
      rBacaInsert.HmeMesCobranca    := rRegistro.HmeMesCobranca;
      rBacaInsert.HmeRecPag         := rRegistro.HmeRecPag;

   except
   end;

   GravaRegistro(rBacaInsert, txtArqParcela);
end;



procedure TfrmExecCargaFCRT.InsereDevido;
begin
   try
      rBacaInsert.HmeSeqCobranca    := rBacaInsert.HmeSeqCobranca + 1;

      rBacaInsert.HmeVlrPrevisto    := rBacaInsert.VlrDevido;
      rBacaInsert.HmeVlrEfetivo     := 0;

                                (* ****************************** *)
                                (* PARA NOVA CARGA OBSERVAR O MÊS *)
                                (* ****************************** *)

      rBacaInsert.HmeData           := StrToDate('11/07/2002');
      rBacaInsert.HmeDataVencto     := StrToDate('31/07/2002');

      rBacaInsert.HmeDataEfetiva    := 0;

      rBacaInsert.HmeAnoCobranca    := 2002;
      rBacaInsert.HmeMesCobranca    := 07;

   except
   end;

   GravaRegistro(rBacaInsert, txtArqParcela);
end;



procedure TfrmExecCargaFCRT.InsereEncargos(const rRegistro: TRegistroBaca);
begin
   try
      LimpaRegistro(rBacaInsert);

      rBacaInsert.IDTipoContrato    := rRegistro.IDTipoContrato;
      rBacaInsert.IDContrato        := rRegistro.IDContrato;

      if rRegistro.IDTipoContrato in [015, 016, 025, 035, 045, 046, 047, 048] then begin
         rBacaInsert.IDItem         := 26;
      end else begin
         rBacaInsert.IDItem         := 34;
      end;

      (* encargos *)
      rBacaInsert.HmeTipoMov        := 4;

      rBacaInsert.HmeOrigem         := 9;
      rBacaInsert.HmeCentraliza     := 1;
      rBacaInsert.HmeDestacado      := 1;
      rBacaInsert.HmeParcela        := rRegistro.HmeParcela;
      rBacaInsert.HmeNumParcelas    := rRegistro.HmeNumParcelas;
      rBacaInsert.HmeSeqCobranca    := rRegistro.HmeSeqCobranca;
      rBacaInsert.HmeFormaCobranca  := rRegistro.HmeFormaCobranca;
      rBacaInsert.HmeTipoFolha      := rRegistro.HmeTipoFolha;

      rBacaInsert.HmeVlrPrevisto    := rRegistro.VlrEncargos;
      rBacaInsert.HmeVlrEfetivo     := rRegistro.VlrEncargos;

      rBacaInsert.HmeSaldoDev       := fSaldoDevAnt;

      rBacaInsert.HmeData           := rRegistro.HmeData;
      rBacaInsert.HmeDataPrevista   := rRegistro.HmeDataPrevista;
      rBacaInsert.HmeDataVencto     := rRegistro.HmeDataVencto;
      rBacaInsert.HmeDataEfetiva    := rRegistro.HmeDataEfetiva;
      rBacaInsert.HmeDataAtualiza   := rRegistro.HmeDataAtualiza;
      rBacaInsert.HmeAnoCompetencia := rRegistro.HmeAnoCompetencia;
      rBacaInsert.HmeMesCompetencia := rRegistro.HmeMesCompetencia;
      rBacaInsert.HmeAnoCobranca    := rRegistro.HmeAnoCobranca;
      rBacaInsert.HmeMesCobranca    := rRegistro.HmeMesCobranca;
      rBacaInsert.HmeRecPag         := rRegistro.HmeRecPag;

   except
   end;

   GravaRegistro(rBacaInsert, txtArqParcela);
end;



function TfrmExecCargaFCRT.NaoExiste01: Boolean;
var
   sProtoc, sParcela : string;
begin
   try

      try

         with qryExiste02 do begin
            LimpaParametros(qryExiste02);
            ParamByName('PSEQ').AsString        := '00';
            ParamByName('PPROTOC').AsString     := tblParcelaPROTOC.AsString;
            ParamByName('PNUM_PARCEL').AsString := FormatFloat('00', rBacaInsert.HmeParcela);
            Open;

            Result := qryExiste02.Fields[0].AsInteger = 0;
            Close;
         end;

{
         sProtoc  := tblParcelaPROTOC.AsString;
         sParcela := FormatFloat('00', rBacaInsert.HmeParcela);

         Result   := True;

         tblParcelaFind.First;
//         if tblParcelaFind.FindKey([sProtoc]) then begin
         if tblParcelaFind.Locate('PROTOC', sProtoc, []) then begin
            while ( (not(tblParcelaFind.EOF)) and (tblParcelaFindPROTOC.AsString = sProtoc)
                                              and (tblParcelaFindNUM_PARCEL.AsString = sParcela) ) do
            begin
               if tblParcelaFindSEQ_PGTO.AsString = '01' then begin
                  Result := False;
                  Break;
               end else begin
                  tblParcelaFind.Next;
               end;
            end;

         end;
}
      except
         WriteLN(txtArqParcela, FormatDateTime('dd/mm, hh:nn:ss', Now) + ' - ERRO  : linha ' +
                                FormatFloat('000,000', iRegistro) + ': Erro "Não existe 01", ' +
                                'Contrato ' + IntToStr(rBacaInsert.IDContrato) + ', Parcela ' +
                                IntToStr(rBacaInsert.HmeParcela) );

         Result := True;
      end;

   finally
      qryExiste02.Close;
   end;
end;



function TfrmExecCargaFCRT.NaoExiste02: Boolean;
var
   sProtoc, sParcela, sSeq : string;
begin
   try

      try

         with qryExiste02 do begin
            LimpaParametros(qryExiste02);
            ParamByName('PSEQ').AsString        := FormatFloat('00', rBacaInsert.HmeSeqCobranca);
            ParamByName('PPROTOC').AsString     := tblParcelaPROTOC.AsString;
            ParamByName('PNUM_PARCEL').AsString := FormatFloat('00', rBacaInsert.HmeParcela);
            Open;

            Result := qryExiste02.Fields[0].AsInteger = 0;
            Close;
         end;

{
         sProtoc  := tblParcelaPROTOC.AsString;
         sParcela := FormatFloat('00', rBacaInsert.HmeParcela);
         sSeq     := FormatFloat('00', rBacaInsert.HmeSeqCobranca);

         Result   := True;

         tblParcelaFind.First;
//         if tblParcelaFind.FindKey([sProtoc]) then begin
         if tblParcelaFind.Locate('PROTOC', sProtoc, []) then begin
            while ( (not(tblParcelaFind.EOF)) and (tblParcelaFindPROTOC.AsString = sProtoc)
                                              and (tblParcelaFindNUM_PARCEL.AsString = sParcela) ) do
            begin
               if tblParcelaFindSEQ_PGTO.AsString > sSeq then begin
                  Result := False;
                  Break;
               end else begin
                  tblParcelaFind.Next;
               end;
            end;

         end;
}

      except
         WriteLN(txtArqParcela, FormatDateTime('dd/mm, hh:nn:ss', Now) + ' - ERRO  : linha ' +
                                FormatFloat('000,000', iRegistro) + ': Erro "Não existe 02", ' +
                                'Contrato ' + IntToStr(rBacaInsert.IDContrato) + ', Parcela ' +
                                IntToStr(rBacaInsert.HmeParcela) );
         Result := True;
      end;

   finally
      qryExiste02.Close;
   end;
end;



function TfrmExecCargaFCRT.SomaEncargos(iParcela: Integer): Currency;
begin
   Result := 0;

   try

      try

         with qrySomaEncargos do begin
            LimpaParametros(qrySomaEncargos);
            ParamByName('PPROTOC').AsString     := tblParcelaPROTOC.AsString;
            ParamByName('PNUM_PARCEL').AsString := FormatFloat('00', iParcela);
            Open;

            Result := qrySomaEncargos.Fields[0].AsCurrency;

         end;

      except
         WriteLN(txtArqParcela, FormatDateTime('dd/mm, hh:nn:ss', Now) + ' - ERRO  : linha ' +
                                FormatFloat('000,000', iRegistro) + ': Erro "SomaEncargos", ' +
                                'Contrato ' + IntToStr(rBacaInsert.IDContrato) + ', Parcela ' +
                                IntToStr(rBacaInsert.HmeParcela) );
         Result := 0;
      end;

   finally
      qrySomaEncargos.Close;
   end;
end;



function TfrmExecCargaFCRT.ConverteData(const sData: String): TDateTime;
var
   sDia, sMes, sAno: String;
begin
   if copy(sData, 1, 2) > '02' then begin
      sAno := '19' + copy(sData, 1, 2);
   end else begin
      sAno := '20' + copy(sData, 1, 2);
   end;

   sMes     := copy(sData, 3, 2);
   sDia     := copy(sData, 5, 2);
   Result   := StrToDate(sDia + '/' + sMes + '/' + sAno);
end;



procedure TfrmExecCargaFCRT.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;

   if edtMatricula.Text <> '' then begin
      tblContrato.Filter      := 'MATRIC = ' + edtMatricula.Text;
      tblParcela.Filter       := 'MATRIC = ' + edtMatricula.Text;
//      tblContratoFind.Filter  := 'MATRIC = ' + edtMatricula.Text;
//      tblParcelaFind.Filter   := 'MATRIC = ' + edtMatricula.Text;
   end;

   if edtProtocolo.Text <> '' then begin
      tblContrato.Filter      := 'PROTOC = ' + edtProtocolo.Text;
      tblParcela.Filter       := 'PROTOC = ' + edtProtocolo.Text;
//      tblContratoFind.Filter  := 'PROTOC = ' + edtProtocolo.Text;
//      tblParcelaFind.Filter   := 'PROTOC = ' + edtProtocolo.Text;
   end;

   tblContrato.Filtered       := ( (edtMatricula.Text <> '') or (edtProtocolo.Text <> '') );
   tblParcela.Filtered        := ( (edtMatricula.Text <> '') or (edtProtocolo.Text <> '') );
   tblContratoFind.Filtered   := FALSE; // ( (edtMatricula.Text <> '') or (edtProtocolo.Text <> '') );
   tblParcelaFind.Filtered    := FALSE; // ( (edtMatricula.Text <> '') or (edtProtocolo.Text <> '') );

   if MsgDlg('Deseja prosseguir?', 'Carga FCRT', mtInformation, [mbYes, mbNo], 0) = mrNo then Exit;

   try
      DesabilitaBotoes;

      (* 1º - Carga de Concessão *)
      if chkConcessao.Checked then CarregaConcessao;

      (* 2º - Carga de Parcelas *)
      if chkParcela.Checked then CarregaParcela;

   finally
      EscondeEspera;
      EscondeFormProgresso;
      HabilitaBotoes;
   end;
end;



procedure TfrmExecCargaFCRT.Button1Click(Sender: TObject);
var
   i : Integer;
begin
   inherited;
   tblParcela.Open;
   for i := 1 to StrToInt(edtQuant.Text) do begin
      tblParcela.Delete
   end;
   tblParcela.Close;
end;



procedure TfrmExecCargaFCRT.GravaRegistro(var rRegistro: TRegistroBaca; var txtArq: TextFile);
begin
   (* só grava se o valor for maior que ZERO *)
   if rRegistro.HmeVlrPrevisto <> 0 then begin

      (* só grava data efetiva se for um item centralizador *)
      if ( (rRegistro.HmeCentraliza <> 1) and (rRegistro.HmeDestacado <> 1) ) then begin
         rRegistro.HmeDataEfetiva    := 0;
      end;

      (* se o IDContrato estiver errado, sai *)
      if rRegistro.IDContrato <= 0 then begin

         WriteLN(txtArq, FormatDateTime('dd/mm, hh:nn:ss', Now) + ' - ERRO  : linha ' +
                         FormatFloat('000,000', iRegistro) + ': Contrato não encontrado');

         Exit;
      end;

      (* se o IDItem estiver errado, sai *)
      if rRegistro.IDItem <= 0 then begin

         (* grava o horário de início *)
         WriteLN(txtArq, FormatDateTime('dd/mm, hh:nn:ss', Now) + ' - ERRO  : linha ' +
                         FormatFloat('000,000', iRegistro) + ': Item não encontrado');

         Exit;
      end;

      with qryInsertHist do begin
         LimpaParametros(qryInsertHist);

         ParamByName('PIDHISTMOVEMPTMO').AsInteger    := LeUltRegistro(nil, 'HISTMOVEMPTMO');

         ParamByName('PIDCONTRATOEMPTMO').AsInteger   := rRegistro.IDContrato;
         ParamByName('PIDITEMEMPTMO').AsInteger       := rRegistro.IDItem;

         ParamByName('PHMETIPOMOV').AsInteger         := rRegistro.HmeTipoMov;
         ParamByName('PHMECENTRALIZA').AsInteger      := rRegistro.HmeCentraliza;
         ParamByName('PHMEDESTACADO').AsInteger       := rRegistro.HmeDestacado;
         ParamByName('PHMEPARCELA').AsInteger         := rRegistro.HmeParcela;
         ParamByName('PHMENUMPARCELAS').AsInteger     := rRegistro.HmeNumParcelas;
         ParamByName('PHMESEQCOBRANCA').AsInteger     := rRegistro.HmeSeqCobranca;
         ParamByName('PHMEFORMACOBRANCA').AsString    := rRegistro.HmeFormaCobranca;
         ParamByName('PHMETIPOFOLHA').AsString        := rRegistro.HmeTipoFolha;
         ParamByName('PHMEVLRPREVISTO').AsCurrency    := rRegistro.HmeVlrPrevisto;
         ParamByName('PHMEVLREFETIVO').AsCurrency     := rRegistro.HmeVlrEfetivo;
         ParamByName('PHMESALDODEV').AsCurrency       := rRegistro.HmeSaldoDev;
         ParamByName('PHMEDATA').AsDateTime           := rRegistro.HmeData;
         ParamByName('PHMEDATAPREVISTA').AsDateTime   := rRegistro.HmeDataPrevista;
         ParamByName('PHMEDATAVENCTO').AsDateTime     := rRegistro.HmeDataVencto;

         (* só grava se houver data efetiva *)
         if rRegistro.HmeDataEfetiva > 0 then ParamByName('PHMEDATAEFETIVA').AsDateTime := rRegistro.HmeDataEfetiva;

         ParamByName('PHMEDATAATUALIZA').AsDateTime   := rRegistro.HmeDataAtualiza;
         ParamByName('PHMEANOCOMPETENCIA').AsInteger  := rRegistro.HmeAnoCompetencia;
         ParamByName('PHMEMESCOMPETENCIA').AsInteger  := rRegistro.HmeMesCompetencia;
         ParamByName('PHMEANOCOBRANCA').AsInteger     := rRegistro.HmeAnoCobranca;
         ParamByName('PHMEMESCOBRANCA').AsInteger     := rRegistro.HmeMesCobranca;

         ParamByName('PHMECENTRALIZA').AsInteger      := rRegistro.HmeCentraliza;
         ParamByName('PHMEDESTACADO').AsInteger       := rRegistro.HmeDestacado;

         if ( (rRegistro.HmeCentraliza = 1) and (rRegistro.HmeDestacado = 1) ) then begin
            if rRegistro.FlgBaixado = 0 then  ParamByName('PFLGBAIXADO').AsInteger   := 0;
            if rRegistro.FlgEnvio = 0 then    ParamByName('PFLGENVIO').AsInteger     := 0;
         end;

         ParamByName('PHMERECPAG').AsString           := rRegistro.HmeRecPag;

         try
            ExecSQL;
         except

            WriteLN(txtArq, FormatDateTime('dd/mm, hh:nn:ss', Now) + ' - ERRO  : linha ' +
                            FormatFloat('000,000', iRegistro) + ': Erro no Insert, Contrato ' +
                            IntToStr(rRegistro.IDContrato) + ', Item ' + IntToStr(rRegistro.IDItem));

         end;
      end;
   end;
end;



procedure TfrmExecCargaFCRT.BitBtn1Click(Sender: TObject);
begin
   inherited;

   (* o dsParcela precisa estar ligado à tblParcelaFind *)

   try
      tblParcelaFind.Open;
      tblParcelaFind.First;
      while not(tblParcelaFind.EOF) do begin
         qryInsertParcelas.ExecSQL;
         tblParcelaFind.Next;
      end;
   finally
      tblParcelaFind.Close;
   end;

end;



procedure TfrmExecCargaFCRT.Button2Click(Sender: TObject);
var
   txtArqBatimento         : TextFile;
   txtArqExistencia        : TextFile;

   iRegistros              : Integer;

   bErro, bErroExiste      : Boolean;

   sPrimDiaMes             : String;
   sUltDiaMes              : String;
   sMes, sAno              : String;
   sSQL, sChave            : String;
   sMatric, sProtoc        : String;

   sVlrPar, sVlrDeb        : String;
   sVlrAnt, sVlrCred       : String;
   sVlrSaldo               : String;

   sVlrParCM, sVlrDebCM    : String;
   sVlrAntCM, sVlrCredCM   : String;
   sVlrSaldoCM             : String;

   sResult                 : String;
begin
//   try
      try
         //AssignFile(txtArqBatimento, 'C:\PROJETOSCM5\EMPRESTIMO\BATIMENTO.TXT');
         AssignFile(txtArqBatimento,  Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\PROJETOSCM5\EMPRESTIMO\BATIMENTO.TXT');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
         Rewrite(txtArqBatimento);
         WriteLn(txtArqBatimento, '                              |         Parcela         | |         Débito          | |       Amortizações      | |        Recebido         | |          Saldo          |');
         WriteLn(txtArqBatimento, '                              |  Legado   | |    CM     | |  Legado   | |    CM     | |  Legado   | |    CM     | |  Legado   | |    CM     | |  Legado   | |    CM     |');

         //AssignFile(txtArqExistencia, 'C:\PROJETOSCM5\EMPRESTIMO\EXISTENCIA.TXT');
         AssignFile(txtArqExistencia,  Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\PROJETOSCM5\EMPRESTIMO\EXISTENCIA.TXT');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
         Rewrite(txtArqExistencia);
         WriteLn(txtArqExistencia, '                  | Contrato  | | Concessão | | Parcelas  |');


         sMes           := '07';
         sAno           := '2002';
         sPrimDiaMes    := '01/07/2002';
         sUltDiaMes     := '31/07/2002';

         if edtMatricula.Text <> '' then tblContaCorrente.Filter := 'MATRIC = ' + edtMatricula.Text;
         if edtProtocolo.Text <> '' then tblContaCorrente.Filter := 'PROTOC = ' + edtProtocolo.Text;
         tblContaCorrente.Filtered := ( (edtMatricula.Text <> '') or (edtProtocolo.Text <> '') );

         tblContaCorrente.Open;
         iRegistros     := tblContaCorrente.RecordCount;
         tblContaCorrente.First;
         iRegistro      := 0;

         MostraFormProgresso('Verificando Conta-Corrente...', 0, iRegistros, True, False);

         while not(tblContaCorrente.EOF) do begin

            inc(iRegistro);
            AndaFormProgresso(iRegistro - 1);

//            sChave      := tblContaCorrenteCHAVE.AsString;
//            sMatric     := copy(sChave, 10, 8);
//            sProtoc     := copy(sChave, 22, 7);

            sMatric     := copy(tblContaCorrenteMATRIC.AsString, 1, 6);
            sProtoc     := tblContaCorrentePROTOC.AsString;

            sVlrPar     := trim(tblContaCorrentePREST.AsString);
            sVlrDeb     := trim(tblContaCorrenteDEBITO.AsString);
            sVlrAnt     := trim(tblContaCorrenteANTERIOR.AsString);
            sVlrCred    := trim(tblContaCorrenteCREDMES.AsString);
            sVlrSaldo   := trim(tblContaCorrenteSALDO.AsString);

            sResult     := sMatric + ', ' + sProtoc + ' - ';

            try

               bErro       := False;
               bErroExiste := False;

               // ----------------------------------------------------------------------------------
               // ----------------------------------------------------------------------------------
               if not(ExisteContrato(sProtoc)) then begin
                  bErroExiste := True;
                  sResult     := sResult + '|     X     | ';
               end else begin
                  sResult     := sResult + '|           | ';
               end;

               if not(ExisteConcessao(sProtoc)) then begin
                  bErroExiste := True;
                  sResult     := sResult + '|     X     | ';
               end else begin
                  sResult     := sResult + '|           | ';
               end;

               if not(ExisteParcela(sProtoc)) then begin
                  bErroExiste := True;
                  sResult     := sResult + '|     X     | ';
               end else begin
                  sResult     := sResult + '|           | ';
               end;

               if bErroExiste then WriteLN(txtArqExistencia, sResult);

               // ----------------------------------------------------------------------------------
               // ----------------------------------------------------------------------------------


               // ----------------------------------------------------------------------------------
               // ----------------------------------------------------------------------------------

               if not(bErroExiste) then begin

                  LimpaParametros(qryContaCorrente);
                  qryContaCorrente.ParamByName('PIDCONTRATOEMPTMO').AsInteger    := StrToInt(sProtoc);
                  qryContaCorrente.ParamByName('PHMEANOCOMPETENCIA').AsInteger   := StrToInt(sAno);
                  qryContaCorrente.ParamByName('PHMEMESCOMPETENCIA').AsInteger   := StrToInt(sMes);
                  qryContaCorrente.ParamByName('PPRIMDIAMES').AsDateTime         := StrToDate(sPrimDiaMes);
                  qryContaCorrente.ParamByName('PULTDIAMES').AsDateTime          := StrToDate(sUltDiaMes);
                  qryContaCorrente.Open;

                  if not(qryContaCorrente.isEmpty) then begin

                     sResult  := sMatric + ', ' + sProtoc + ' - ';
                     sResult  := sResult + 'Diferenças: ';

                     sVlrParCM   := trim(FormatFloat('#,0.00', qryContaCorrenteHMEVLRPREVISTO.AsFloat));
                     if sVlrPar <> sVlrParCM then begin
                        bErro    := True;
                        sResult  := sResult + '| ' + CompletaInicio(sVlrPar, ' ', 9) + ' | | ' + CompletaInicio(sVlrParCM, ' ', 9) + ' | ';
                     end else begin
                        sResult  := sResult + '|           | |           | ';
                     end;

                     sVlrDebCM   := trim(FormatFloat('#,0.00', qryContaCorrenteVLR_ANT.AsFloat));
                     if sVlrDeb <> sVlrDebCM then begin
                        bErro    := True;
                        sResult  := sResult + '| ' + CompletaInicio(sVlrDeb, ' ', 9) + ' | | ' + CompletaInicio(sVlrDebCM, ' ', 9) + ' | ';
                     end else begin
                        sResult  := sResult + '|           | |           | ';
                     end;

                     sVlrAntCM   := trim(FormatFloat('#,0.00', qryContaCorrenteVLR_PAGO.AsFloat));
                     if sVlrAnt <> sVlrAntCM then begin
                        bErro    := True;
                        sResult  := sResult + '| ' + CompletaInicio(sVlrAnt, ' ', 9) + ' | | ' + CompletaInicio(sVlrAntCM, ' ', 9) + ' | ';
                     end else begin
                        sResult  := sResult + '|           | |           | ';
                     end;

                     sVlrCredCM  := trim(FormatFloat('#,0.00', qryContaCorrenteHMEVLREFETIVO.AsFloat));
                     if sVlrCred <> sVlrCredCM then begin
                        bErro    := True;
                        sResult  := sResult + '| ' + CompletaInicio(sVlrCred, ' ', 9) + ' | | ' + CompletaInicio(sVlrCredCM, ' ', 9) + ' | ';
                     end else begin
                        sResult  := sResult + '|           | |           | ';
                     end;

                     sVlrSaldoCM := trim(FormatFloat('#,0.00', qryContaCorrenteVLR_ATU.AsFloat));
                     if sVlrSaldo <> sVlrSaldoCM then begin
                        bErro    := True;
                        sResult  := sResult + '| ' + CompletaInicio(sVlrSaldo, ' ', 9) + ' | | ' + CompletaInicio(sVlrSaldoCM, ' ', 9) + ' | ';
                     end else begin
                        sResult  := sResult + '|           | |           | ';
                     end;

                  end else begin
                     bErro    := True;
                     sResult  := sResult + 'Contrato não possui parcelas carregadas.';
                  end;

                 (* grava o erro *)
                 if bErro then WriteLN(txtArqBatimento, sResult);

               end;
               // ----------------------------------------------------------------------------------
               // ----------------------------------------------------------------------------------

               tblContaCorrente.Next;

            except
               qryContaCorrente.Close;
               bErro    := True;
               sResult  := sResult + 'Erro na abertura do Conta-Corrente CM.';

               tblContaCorrente.Next;
               Continue;
            end;

         end;
{
      except

         tblContaCorrente.Close;
         Closefile(txtArqBatimento);
         EscondeFormProgresso;

      end;
}
   finally

      tblContaCorrente.Close;
      Closefile(txtArqBatimento);
      Closefile(txtArqExistencia);
      EscondeFormProgresso;

   end;
{
   tblContrato.Open;
   iRegistros  := tblContrato.RecordCount;
   tblContrato.First;
   iRegistro   := 0;

   MostraFormProgresso('Verificando Contratos...', 0, iRegistros, True, False);

   try
      while not(tblContrato.EOF) do begin

         inc(iRegistro);
         AndaFormProgresso(iRegistro - 1);

         if tblContratoPROTOC.AsString = '0052578' then begin
            LimpaParametros(qryExisteParcelaBatimento);
            qryExisteParcelaBatimento.ParamByName('PPROTOC').AsString := tblContratoPROTOC.AsString;
            qryExisteParcelaBatimento.Open;

            if qryExisteParcelaBatimento.IsEmpty then begin
               WriteLN(txtArqBatimento, 'Procololo ' + tblContratoPROTOC.AsString + ' não consta no arquivo');
            end;

         end;

         Next;
      end;

   finally
      Closefile(txtArqBatimento);
      EscondeFormProgresso;
   end;
}
end;



procedure TfrmExecCargaFCRT.Button3Click(Sender: TObject);
var
   sChave      : String;
   sMatric, sProtoc  : String;
begin
   tblContaCorrente.Open;
   tblContaCorrente.First;

   while not(tblContaCorrente.EOF) do begin
      sChave      := tblContaCorrenteCHAVE.AsString;
//      sMatric     := copy(sChave, 10, 8);
      sProtoc     := copy(sChave, 22, 7);

      tblContaCorrente.Edit;
//      tblContaCorrenteMATRIC.AsString := sMatric;
      tblContaCorrentePROTOC.AsString := sProtoc;
      tblContaCorrente.Post;

      tblContaCorrente.Next;
   end;
end;



procedure TfrmExecCargaFCRT.qryContaCorrenteBeforeOpen(DataSet: TDataSet);
begin
{
   (* Gravando o SQL de entrada para permitir verificação *)
   qryContaCorrente.SQL.SaveToFile(Sistema.TempDir + 'EP-Batimento.txt');
   Application.ProcessMessages;
}
end;




function TfrmExecCargaFCRT.ExisteContrato(const sProtoc: String): Boolean;
begin
   with qryExisteContrato do begin
      LimpaParametros(qryExisteContrato);
      ParamByName('PIDCONTRATOEMPTMO').AsInteger := StrToInt(sProtoc);
      Open;

      Result := Fields[0].AsInteger > 0;

      Close;
   end;
end;




function TfrmExecCargaFCRT.ExisteConcessao(const sProtoc: String): Boolean;
begin
   with qryExisteConcessao do begin
      LimpaParametros(qryExisteConcessao);
      ParamByName('PIDCONTRATOEMPTMO').AsInteger := StrToInt(sProtoc);
      Open;

      Result := Fields[0].AsInteger > 0;

      Close;
   end;
end;




function TfrmExecCargaFCRT.ExisteParcela(const sProtoc: String): Boolean;
begin
   with qryExisteParcela do begin
      LimpaParametros(qryExisteParcela);
      ParamByName('PIDCONTRATOEMPTMO').AsInteger := StrToInt(sProtoc);
      Open;

      Result := Fields[0].AsInteger > 0;

      Close;
   end;
end;




procedure TfrmExecCargaFCRT.Button4Click(Sender: TObject);
begin
   tblContaCorrente.Open;
   tblContaCorrente.First;

   while not(tblContaCorrente.EOF) do begin

      if trim(tblContaCorrenteSALDO.AsString) = '0,00' then begin
         tblContaCorrente.Delete;
      end else begin
         tblContaCorrente.Next;
      end;
   end;
end;



procedure TfrmExecCargaFCRT.BitBtn2Click(Sender: TObject);
var
   qryBase   : TwwQuery;
   qryBusca  : TwwQuery;
   qryUpdate : TwwQuery;
   sSQLBase  : String;
   sSQLBusca : String;
   sSQLEdit  : String;
begin
   inherited;

   qryBase                 := TwwQuery.Create(Application);
   qryBase.DatabaseName    := 'BASEDADOS';
   qryBusca                := TwwQuery.Create(Application);
   qryBusca.DatabaseName   := 'BASEDADOS';
   qryUpdate               := TwwQuery.Create(Application);
   qryUpdate.DatabaseName  := 'BASEDADOS';

   try

      sSQLBase :=
      'SELECT * '                                                       + #13 +
      'FROM   HISTMOVEMPTMO '                                           + #13 +
      'WHERE  IDCONTRATOEMPTMO IN (21056, 21324, 26355, 23767, 27303) ' + #13 +
      '   AND IDITEMEMPTMO     = 5 '                                    + #13 +
      '   AND HMESEQCOBRANCA   = 1 '                                    + #13 +
      'ORDER BY '                                                       + #13 +
      '   IDCONTRATOEMPTMO, HMEPARCELA ';

      qryBase.Close;
      qryBase.SQL.Text := sSQLBase;
      qryBase.Open;
      qryBase.First;

      while not(qryBase.EOF) do begin

         try
{
            sSQLBusca :=
            'SELECT HMEVLRPREVISTO, HMESALDODEV '                                                        + #13 +
            'FROM   HISTMOVEMPTMO '                                                                      + #13 +
            'WHERE  IDCONTRATOEMPTMO = ' + IntToStr(qryBase.FieldByName('IDCONTRATOEMPTMO').AsInteger)   + #13 +
            '   AND HMEPARCELA       = ' + IntToStr(qryBase.FieldByName('HMEPARCELA').AsInteger)         + #13 +
            '   AND IDITEMEMPTMO     = 5 '                                                               + #13 +
            '   AND HMESEQCOBRANCA   = 1 ';

            qryBusca.Close;
            qryBusca.SQL.Text := sSQLBusca;
            qryBusca.Open;
}
            sSQLEdit :=
            'UPDATE HISTMOVEMPTMO H '                                                                       + #13 +
            'SET    H.HMEVLRPREVISTO   = ' + NumeroIngles(qryBase.FieldByName('HMEVLRPREVISTO').AsCurrency) + ',' + #13 +
            '       H.HMESALDODEV      = ' + NumeroIngles(qryBase.FieldByName('HMESALDODEV').AsCurrency)    + #13 +
            'WHERE  H.IDCONTRATOEMPTMO = ' + IntToStr(qryBase.FieldByName('IDCONTRATOEMPTMO').AsInteger)    + #13 +
            '   AND H.HMEPARCELA       = ' + IntToStr(qryBase.FieldByName('HMEPARCELA').AsInteger)          + #13 +
            '   AND IDITEMEMPTMO       = 40 ';

            qryUpdate.Close;
            qryUpdate.SQL.Text := sSQLEdit;
            qryUpdate.ExecSQL;

            sSQLEdit :=
            'UPDATE HISTMOVEMPTMO H '                                                                    + #13 +
            'SET    H.HMESALDODEV      = ' + NumeroIngles(qryBase.FieldByName('HMESALDODEV').AsCurrency) + #13 +
            'WHERE  H.IDCONTRATOEMPTMO = ' + IntToStr(qryBase.FieldByName('IDCONTRATOEMPTMO').AsInteger) + #13 +
            '   AND H.HMEPARCELA       = ' + IntToStr(qryBase.FieldByName('HMEPARCELA').AsInteger)          + #13 +
            '   AND IDITEMEMPTMO       = 20 ';

            qryUpdate.Close;
            qryUpdate.SQL.Text := sSQLEdit;
            qryUpdate.ExecSQL;

         finally
            qryBusca.Close;
         end;

         qryBase.Next;

      end; (* while *)

   finally
      qryBase.Close;
      qryUpdate.Close;
      qryBusca.Close;
      qryBase.Free;
      qryUpdate.Free;
      qryBusca.Free;
   end;
end;



procedure TfrmExecCargaFCRT.BitBtn3Click(Sender: TObject);
begin
   inherited;

   tblContrato.Close;
   tblContrato.Filter   := 'CONVENIO = 045';
   tblContrato.Filtered := True;
   tblContrato.Open;

   tblContrato.First;
   while not(tblContrato.EOF) do begin
      LimpaParametros(qryUpdateMoeda);
      qryUpdateMoeda.ParamByName('PIDCONTRATOEMPTMO').AsInteger   := StrToInt(tblContratoPROTOC.AsString);
      qryUpdateMoeda.ParamByName('PMOECODIGO').AsInteger          := 104;
      qryUpdateMoeda.ExecSQL;
      tblContrato.Next;
   end;

   tblContrato.Close;
   tblContrato.Filter   := 'CONVENIO = 046';
   tblContrato.Filtered := True;
   tblContrato.Open;

   tblContrato.First;
   while not(tblContrato.EOF) do begin
      LimpaParametros(qryUpdateMoeda);
      qryUpdateMoeda.ParamByName('PIDCONTRATOEMPTMO').AsInteger   := StrToInt(tblContratoPROTOC.AsString);
      qryUpdateMoeda.ParamByName('PMOECODIGO').AsInteger          := 106;
      qryUpdateMoeda.ExecSQL;
      tblContrato.Next;
   end;

   LimpaParametros(qryUpdateMoeda);
   tblContrato.Close;
end;



end.




//                                                 4UHNNUUUUA_  4 4AA_.`
//                                                HNMMM#Q#UUUUQ#Q#QUQQU_/4U)
//                                              HMMMMMMNH#UADDU##########U/U)
//                                             NNMMMMMMMNH#QAAU###H#HHHH##Q##
//                                            NMMMMMMMMMMHH#UAQ###H##HHHH###M.
//                                            HNMMMMMMMMMH#QQQQQHHHHHHHH####HM)
//                                           JNMMMMMMMMNQUUUA_A#HNHHHH###QQQNM)
//                                           #NMMMNNMMMMMMMMNNHHHHH#Q __UUL 4HA
//                                          (NNMNHMMMMMMMMMMMMMMMMNNMNMMMMMMN#.
//                                          (NNHNMMMMMMMMMMMMMMMNNQMMMMMMMMMMMML
//                                          JH#NMMMMMMMMMMMMMMMNH##MMMMMMMMMMMMMN
//                                          QQMMMMMMMMMMMMMNNNNMMMMNMMM)NMMMMMMMMM
//                                         J#NMMMMMMMMMN#QQUHMNMMNMMMHHH#MMMMMMMMMN
//                                        (#NMMMMMMMMMMMMMMMMMMMNNHNHQF"#MMMMMMMMMM)
//                                       (#NMMMMMMMMMMMMMMMMMMMMHH#MM#)  JQQ#MMMMMMM.
//                                       JNMMMMMMMMMMMMMMMMMMMMMMMMMMN#L(UQQMMMMMMMMH
//                                      UHMMMMMMMMMMMMMMMMMMMNMMHMMMMMM#NUQNMMMMMMMMM.
//                                     (#MMMMMMMMMMMMMMMHNMNMHNMHM#MMMMMHN#HMMMMMMMMML
//                                    (#MMMMMMMMMMMMMMMMMNMMMNMNMMNNHHNNMHQHMMMMMMMMMM)
//                                   .HMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNLJMMMMMMMMMML
//                                  .MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM)
//                                 (MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM)
//                                 (MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM)
//                                 `4HMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNHMMMMMMMMMMMMMMF
//                                        #MMMMMMMMMMMMMMMMMMMMMMMMNHHHHMMMMMMMMMMNF"
//                                       JNMMMMMMMMMMMMMMMMMMMMMMNHU4QHMMMMMMMMMMMMH#_.
//                                     #MMMMMMMMMMMMMMMMMMMMMMMNMNMHMUNMMMMMMMMMMMMMMMMMNL_
//                              QNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNNNMMMMMMMMMMMMMMMMMMMMMMMMN#.
//                          #NMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNMNN#HNMMMMMMMMMMMMMMMMMMMMMMMMMH_
//                     DU#MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNHNNH#HHNNNNMMMMMMMMMMMMMMMMMMMMMMH.
//                  JQMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN#HNMNMMMMN##NH##HHHHHHH#MMMMMMMMMMMMMMMMMMMMMN_
//                #NMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNHHN#HHHHHHHNHQHH##HHH#####NMMMMMMMMMMMMMMMMMMMMMMNL
//              UMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMUUUQ#N##HHHHHHNQ#HH##H####H#HMMMMMMMMMMMMMMMMMMMMMMMMN.
//            JMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM#AUUQ#H#H####HHNQHH##HHHHHH#HNMMMMMMMMMMMMMMMMMMMMMMMMM#.
//          .HMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNUUUUQQH######HN##HH#HHHHHHHHNMMMMMMMMMMMMMMMMNHMMMMMMMMN.
//         JMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMHUUUUUQ#######HHUM#H#HHHHHHHHNMMMMMMMMMMMMMMMHQNMHMMMMMMM)
//       .HMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMUUUUUQH######HHQHNH#HHHHHHHHNMMMMMMMMMMMMMMMNUHMM#MMMMMMN.
//      JMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMQUUUUQ#H#####HNNUNH####HHHHHNMMMMMMMMMMMMMMMMQHMMM#MMMMMMH
//     QMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNUUQQQQHH###HNNMQHH##HHHHHNHHMMMMMMMMMMMMMMMMMMMMMNHMMMMMM.
//    HMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM#UQQQQHHHHHHNNMQ#H###HHHHNNHNMMMMMMMMMMMMMMMMMMMMMMMMMMMMU
//  JMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNQ#QQ#HNHNNNNNM#QHH##HHNNHHHHNMMMMMMMMMMMMMMMMMMMMMMMMMMMN.
// HMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMHHMNNNHNHNNQ#N###HNHNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM)
// MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNMNNMMMMMMNMMMMMMMMMMMMMMMMMMMMMMMMMMMM#



{

select count(*) from histmovemptmo
select count(*) from histmovemptmo where hmeparcela > 0

/* delete from histmovemptmo where hmeparcela > 0 */
/* delete from histmovemptmo where idcontratoemptmo = 51620 and hmeparcela > 0 */

select max(idhistmovemptmo) from histmovemptmo

/* drop sequence seqhistmovemptmo */
create sequence seqhistmovemptmo nocache start with 20000

select * from histmovemptmo where hmeparcela > 0

/* commit */

/*


update 
   histmovemptmo
set 
   hmedataefetiva = null,
   flgbaixado     = 0
where
   ((hmevlrefetivo is null) OR (hmevlrefetivo = 0));

update 
   histmovemptmo
set
   hmevlrefetivo = null
where
   hmevlrefetivo = 0;


update 
   histmovemptmo 
set 
   hmedatavencto = hmedataprevista;


update histmovemptmo set hmecentraliza = 1 where iditememptmo in (29,32,33,3,5,23);
update histmovemptmo set hmecentraliza = 0 where iditememptmo in (26,34,31,48,39,37,14,4,1,2,18,20,40,12,38,36,25);
update histmovemptmo set hmedestacado = 1 where iditememptmo in (34,26);
update histmovemptmo set hmedestacado = 0 where iditememptmo in (29,32,33,3,5,23,31,48,39,37,14,4,1,2,18,20,40,12,38,36,25);

update
   histmovemptmo
set
   flgbaixado     = null,
   flgenvio       = null,
   hmevlrefetivo  = null
where
     hmecentraliza = 0 and hmedestacado = 0;
     

update itemxtipocontr set itcrecpag = 'R' where itcevento > 0;
update itemxtipocontr set itcrecpag = 'P' where itcevento = 0;

update histmovemptmo set hmerecpag = 'R' where hmetipomov > 0;
update histmovemptmo set hmerecpag = 'P' where hmetipomov = 0;



UPDATE CONTRATOEMPTMO SET MOECODIGO = 105 WHERE IDTIPOCONTREMPTMO IN (1, 2);
UPDATE CONTRATOEMPTMO SET MOECODIGO = 104 WHERE IDTIPOCONTREMPTMO = 5;
UPDATE CONTRATOEMPTMO SET MOECODIGO = 106 WHERE IDTIPOCONTREMPTMO = 6;



update histmovemptmo set hmesaldodev = 0 where iditememptmo in (32, 48, 34);



update itemxtipocontr set itctratasaldodev = 0 where flgcentraliza = 1;
  


*/

DROP table AEMCPRPG CASCADE CONSTRAINTS

create table AEMCPRPG
(
MATRIC         VARCHAR2(6) NULL,
SEQ            VARCHAR2(2) NULL,
PROTOC         VARCHAR2(7) NULL,
TIPO           VARCHAR2(1) NULL,
NUM_PARCEL     VARCHAR2(1) NULL,
SEQ_PGTO       VARCHAR2(2) NULL,
DT_INCLU       VARCHAR2(6) NULL,
DT_VCTO        VARCHAR2(6) NULL,
VLR_PRINCI     NUMBER(11)  NULL,
VLR_JUR_CO     NUMBER(11)  NULL,
VLR_CORR_M     NUMBER(11)  NULL,
VLR_TAXA       NUMBER(11)  NULL,
VLR_JUR_AT     NUMBER(11)  NULL,
CORR_MON_A     NUMBER(11)  NULL
)

desc AEMCPRPG

SELECT * FROM AEMCPRPG

/*  DELETE FROM AEMCPRPG */

CREATE PUBLIC SYNONYM AEMCPRPG FOR  CM.AEMCPRPG

CREATE INDEX andrebaca ON AEMCPRPG
(
       PROTOC               ASC,
       NUM_PARCEL                    ASC,
       SEQ_PGTO              ASC
)
       TABLESPACE INDICES
;

VALIDATE INDEX ANDREBACA


}
