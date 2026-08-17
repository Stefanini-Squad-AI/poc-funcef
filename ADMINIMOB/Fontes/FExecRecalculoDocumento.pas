{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------

        	   Recálculo de Documentos em Atraso

        	Autor           : Alex Pereira
        	Data de Início  : 15/05/2001
        	Data de Término :

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
//***************************************************************************************
//N.Atender..........: 32554
//Data da Alteração..: 09/04/2026
//Responsável........: Paulo Nobre
//Descrição..........: Ajustes no código da qry qryAlteradoresLanc para corrigir um bug
//                     oriundo da migração, tipo '4 ' onde deve ser '4'.
//***************************************************************************************
//N.Atender..........: 13491
//Data da Alteração..: 07/11/2024
//Responsável........: Arnaldo V. Scarin
//Descrição..........: Inclusão de condição para validar os valores de contabilizacao dos
//                     Alteradores, evitando que haja erro na contabilização da baixa.
//***************************************************************************************
//N. SIG.............: 116142
//Data da Alteração..: 13/07/2021
//Responsável........: Ewerton Beltramini
//Descrição..........: Inclusão do campo IDENVIODOCUMENTO.
//***************************************************************************************
--------------------------------------------------------------------------------
Pendência   : 201128_18374  / 71763
Responsável : Darivaldo Alencar
Data        : 13/03/2017
Descrição   : Melhoria de performance e exclusão de campos da tela.
--------------------------------------------------------------------------------
Pendência   : SIG79081
Responsável : Fabio Sampaio
Data        : 10/12/2018
Descrição   : Correção para utilização do indice parametrização feita no campo
              "Utilizar indice de XXX mes(es) anterior(es)" e da nova
              parametricação bFatorMesAntDiasMesAtual para utilizar os indices
              anteriores com a quantidade de dias do mês corrente.
--------------------------------------------------------------------------------
Pendência   : 1293191
PPM         : 230549
Responsável : Peterson Victor
Data        : 08/03/2016
Descrição   : Atualizar a DATALIMITE na tabela LANCAMENTOSIMOVEL
--------------------------------------------------------------------------------
Pendência   : 1271205
PPM         : 259993
Responsável : Peterson Victor
Data        : 08/03/2016
Descrição   : Ajuste no sql dentro da objeto qry
--------------------------------------------------------------------------------
Pendência   : 245203
PPM         : 618483
Responsável : Marcio Sanches Spinosa
Data        : 22/12/2014
Descrição   : Ajuste no sql dentro da objeto qry, ajustando a qry ld para efetuar
o sum dentro para que o resultado final seja somado.
--------------------------------------------------------------------------------
Pendência   : 201128/16002
Kintana     : 360869
Responsável : Marcio Sanches Spinosa SOL 201256 Kintana 1945186
Data        : 29/08/2013
Descrição   : Melhoria de performance na busca de documentos
--------------------------------------------------------------------------------
Pendência   : 201256
Kintana     : 1945186
Responsável : Marcio Sanches Spinosa SOL 201256 Kintana 1945186
Data        : 22/02/2013
Descrição   : Ajuste no filtro do cds, pois quando o contratoimovel não era preenchido,
o mesmo apresentava erro.
--------------------------------------------------------------------------------
Pendência   : 174748
Kintana     : 1584347
Responsável : Helen V Bianchi
Data        : 23/02/2012
Descrição   : Durante o recálculo de docs, o sistema está exibindo a mensagem
              durante a exclusão dos alteradores: "Uma transação de usuário
              já está em progresso" - btnconfirmar
--------------------------------------------------------------------------------
Pendência   : 174320
Kintana     : 1573531
Responsável : Eraldo Luis da Silva
Data        : 13/02/2012
Descrição   : Durante o recálculo de docs, o sistema está exibindo a mensagem
              durante a exclusão dos alteradores: "Uma transação de usuário
              já está em progresso"
--------------------------------------------------------------------------------
Pendência   : 27724
Responsável : Ricardo de Freitas
Data        : 06/12/2011
Descrição   : Ajuste nas rotinas de perfomance
--------------------------------------------------------------------------------
Pendência   : 27724
Responsável : Marchetti
Data        : 09/04/2008
Descrição   : Ajuste na passagem de parâmetro que informa a periodicidade dos juros
--------------------------------------------------------------------------------
Pendência   : 27443
Responsável : Marchetti
Data        : 20/02/2008
Descrição   : Ajuste no processo de cálculo da diferença entre a data de pagamento
              e a data do recálculo, para geração correta dos alteradores do
              documento
--------------------------------------------------------------------------------
Pendência   : 26104
Responsável : Daniel Simões
Data        : 14/08/2007
Descrição   : Métodos relacionados a Parametrização de Multas e Juros passa a
              trazer da CtrlParamMulta no lugar da CtrlContratoImovel...
--------------------------------------------------------------------------------
Pendência   : 22687
Responsável : Daniel Simões
Data        : 23/03/2007
Descrição   : Passa a buscar parametrização de Juros e Multa por Contrato dentro
              do período de vigência informado.
--------------------------------------------------------------------------------
Pendência   : 24688
Responsável : Daniel Simões
Data        : 09/03/2007
Descrição   : Passa a considerar os alteradores no documento.
--------------------------------------------------------------------------------
Pendência   : 17957
Responsável : Vinícius Meyer Lana
Data        : 07/12/2004
Descrição   : Registro de Evento de recálculo do documento
--------------------------------------------------------------------------------              d
-------------------------------------------------------------------------------}

unit FExecRecalculoDocumento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, fcButton, fcImgBtn,
  fcShapeBtn, Wwdbspin, wwdbedit, Wwdotdot, Wwdbcomb, Mask, wwdblook, ExtCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, Spin, TREdit, Db, Wwdatsrc, DBTables, Wwquery,
  MontaSelect, fcLabel, ComCtrls, wwdbdatetimepicker, CMDateTimePicker, jclSysUtils,
  FOkCancelarImob, FSairAjudaImob, TEdNum, Menus, TB97Ctls, DBCtrls, uModuloImobiliario,
  uCmSqlParams, Provider, DBClient, uCMClientDataSet, CMDBLookupCombo,
  {uCtrlDocumento} uCtrlImobDocumento, uCtrlParamIntegra, uCtrlEventoImovel, uCtrlInadimplencia, uCtrlOperImob,
  dMS, //Marcio Pendência 201128/16002 - PPM 360869
  uCtrlParamMulta; // Daniel - 26104

type
  TfrmExecRecalculoDocumento = class(TfrmSairAjudaImob)
    lblTitulo: TfcLabel;
    ntbPrincipal: TNotebook;
    Bevel3: TBevel;
    btnVoltaAlterador: TfcShapeBtn;
    Bevel2: TBevel;
    btnContinuaIndice: TfcShapeBtn;
    Panel3: TPanel;
    Label22: TLabel;
    Bevel1: TBevel;
    Label5: TLabel;
    Label15: TLabel;
    lblDataVencimento: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label2: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label1: TLabel;
    Bevel5: TBevel;
    Label16: TLabel;
    DBedtTipoRecDes: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBedtNomeUsuario: TDBEdit;
    DBedtNomeExtenso: TDBEdit;
    DBedtOrigem: TDBEdit;
    DBedtPortadorForma: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    ds: TwwDataSource;
    qry: TwwQuery;
    qry_ORIGEMLANC: TStringField;
    qry_MESCOMPETENCIA: TStringField;
    qryDESCCUSTORECIMO: TStringField;
    qryFORCLI_DOC: TFloatField;
    qrySTATUS_DOC: TStringField;
    qryPLNPLANIL: TFloatField;
    qryPLNCODIGO: TFloatField;
    qryCODDOCUMENTO: TFloatField;
    qryPORTADOR_FORMA: TStringField;
    qryMOEDA_LANC: TStringField;
    qryCOD_MOEDA: TFloatField;
    qryIDFORCLI: TFloatField;
    qryNF_FORCLI: TStringField;
    qryRS_FORCLI: TStringField;
    qryDATALANCAMENTO: TDateTimeField;
    qryDATAVENCIMENTO: TDateTimeField;
    qryDATA_BAIXA: TDateTimeField;
    qryMESCOMPETENCIA: TFloatField;
    qryANOCOMPETENCIA: TFloatField;
    qryFLGORIGEMLANC: TStringField;
    qryFLGESTORNADO: TFloatField;
    qryFLGINTEGRADO: TFloatField;
    qryRECPAG: TStringField;
    qryVALOR_OM_TOTAL: TFloatField;
    qryVALOR_TOTAL: TFloatField;
    qryIDDOCUMENTO: TFloatField;
    qryNODOCUMENTO: TFloatField;
    qryDOC_CAPCAR: TFloatField;
    qryNUMAPGR: TFloatField;
    qryNOSSONUMERO: TStringField;
    dsLancamentos: TwwDataSource;
    btnContinuaSelecao: TfcShapeBtn;
    btnVoltaIndice: TfcShapeBtn;
    btnProcurar: TfcShapeBtn;
    MS_Lancamento: TMontaSelect;
    grpMulta: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    DBcboMoedaMulta: TwwDBLookupCombo;
    grpMora: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    DBedtMoedaMora: TwwDBLookupCombo;
    grpPeriodicidadeMora: TGroupBox;
    Label19: TLabel;
    qryContratoImovel: TwwQuery;
    dsContratoImovel: TwwDataSource;
    qryLookMoedaMulta: TwwQuery;
    qryLookMoedaMultaMOESIGLA: TStringField;
    qryLookMoedaMultaMOECODIGO: TFloatField;
    qryLookMoedaMultaMOEDESC: TStringField;
    dsLookMoedaMulta: TwwDataSource;
    qryLookMoedaCM: TwwQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    StringField2: TStringField;
    dsLookMoedaCM: TwwDataSource;
    qryContratoImovelCONMESREFREAJUSTE: TStringField;
    qryContratoImovelCONVLRMULTA: TFloatField;
    qryContratoImovelCONMOEDAMULTA: TFloatField;
    qryContratoImovelCONPERCENTMULTA: TFloatField;
    qryContratoImovelCONVLRMORA: TFloatField;
    qryContratoImovelCONMOEDAMORA: TFloatField;
    qryContratoImovelCONPERCENTMORA: TFloatField;
    qryContratoImovelFLGMORAPROPORC: TFloatField;
    qryContratoImovelCONPERMORA: TStringField;
    updContratoImovel: TUpdateSQL;
    qry_JUROS: TFloatField;
    qry_MULTA: TFloatField;
    qry_CORRECAOMONET: TFloatField;
    Label21: TLabel;
    edtDataVencimento: TCMDateTimePicker;
    DBgrdAlteradoresLanc: TwwDBGrid;
    Label23: TLabel;
    btnExcluiAlterador: TBitBtn;
    qryAlteradoresLanc: TwwQuery;
    qryAlteradoresLancDESCRICAO: TStringField;
    qryAlteradoresLancHISTORICOCOMPL: TStringField;
    qryAlteradoresLancVALOR: TFloatField;
    qryAlteradoresLancDATALANCTO: TDateTimeField;
    qryAlteradoresLancCODDOCUMENTO: TFloatField;
    qryAlteradoresLancNUMLANCTO: TFloatField;
    qryAlteradoresLancCODALTERADOR: TFloatField;
    qryAlteradoresLancPLNCODIGO: TFloatField;
    qryAlteradoresLancVALOROUTRAMOEDA: TFloatField;
    qryAlteradoresLancDEBCRE: TStringField;
    qryAlteradoresLancOPERACAO: TStringField;
    dsAlteradoresLanc: TwwDataSource;
    Bevel4: TBevel;
    btnVoltaCalculo: TfcShapeBtn;
    GroupBox2: TGroupBox;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    edtln1: TEdit;
    edtln2: TEdit;
    edtln4: TEdit;
    edtln5: TEdit;
    edtln6: TEdit;
    edtln7: TEdit;
    edtln3: TEdit;
    edtln8: TEdit;
    edtln9: TEdit;
    Label41: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label43: TLabel;
    Label42: TLabel;
    Bevel6: TBevel;
    btnVoltaMensagem: TfcShapeBtn;
    btnContinuaMensagem: TfcShapeBtn;
    edtVO: TRealEdit;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label14: TLabel;
    Label47: TLabel;
    qryLookMoedaCMMOEPERIODICIDADE: TStringField;
    qryLookMoedaCMMOEINATIVO: TStringField;
    qryLookMoedaCMFLGPERCVALOR: TStringField;
    qryLookMoedaCMDATAINICIO: TDateTimeField;
    qryLookMoedaCMDATAFIM: TDateTimeField;
    qryCotacao: TwwQuery;
    qryCotacaoMOECODIGO: TFloatField;
    qryCotacaoCOTVALOR: TFloatField;
    qryCotacaoMOEDESC: TStringField;
    qryCotacaoMOESIGLA: TStringField;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    wwDBEdit3: TwwDBEdit;
    Label48: TLabel;
    Bevel7: TBevel;
    Bevel8: TBevel;
    btnContinuaCalculo: TfcShapeBtn;
    btnConfirmaOperacao: TfcShapeBtn;
    Label49: TLabel;
    qryUpdateMensagensCnab: TwwQuery;
    qryCODGRUPOCNAB: TFloatField;
    qryContratoImovelIDINDCORRECAO: TFloatField;
    dsLookAlteradores: TwwDataSource;
    qryIDTIPOCUSTORECIMO: TFloatField;
    GroupBox1: TGroupBox;
    DBcboPortadorForma: TwwDBLookupCombo;
    chkBoleto: TCheckBox;
    qryCODPORTFORMA_LANC: TFloatField;
    Label50: TLabel;
    GroupBox3: TGroupBox;
    Panel1: TPanel;
    memEvento: TMemo;
    GroupBox4: TGroupBox;
    spnDiasAviso: TwwDBSpinEdit;
    Label80: TLabel;
    cbAviso: TCheckBox;
    qryVALOR_RECEBIDO: TFloatField;
    qryDATALIMITE: TDateTimeField;
    qryContratoImovelIDPAIS: TFloatField;
    qryContratoImovelCODESTADO: TStringField;
    qryContratoImovelIDCIDADES: TFloatField;
    qryContratoImovelCONDIASTOLERANCIA: TFloatField;
    qryContratoImovelCONDIASREPASSE: TFloatField;
    qryContratoImovelFLGTIPODIATOLERA: TStringField;
    Label51: TLabel;
    edtVencto: TCMDateTimePicker;
    Label52: TLabel;
    edtDias: TRealEdit;
    Label53: TLabel;
    edtVlrPago: TRealEdit;
    Label54: TLabel;
    edtDataPagto: TCMDateTimePicker;
    GroupBox5: TGroupBox;
    edtCM: TRealEdit;
    edtMulta: TRealEdit;
    edtJuros: TRealEdit;
    GroupBox6: TGroupBox;
    edtCMDif: TRealEdit;
    edtMultaDif: TRealEdit;
    edtJurosDif: TRealEdit;
    qryUltBaixa: TwwQuery;
    cbDataProgramada: TCheckBox;
    Label56: TLabel;
    edtInad: TRealEdit;
    qryTotInad: TwwQuery;
    qryTotInadIDCONTRATOIMOVEL: TFloatField;
    qryTotInadQTDE: TFloatField;
    cdsEncargos: TCMClientDataSet;
    dspEncargos: TDataSetProvider;
    qryEncargos: TCMSqlParams;
    qryTOT_ALTERADOR: TFloatField;
    pcLancamento: TPageControl;
    tbsLancamentos: TTabSheet;
    tbsAlteradores: TTabSheet;
    DBgrdReajuste: TwwDBGrid;
    wwDBGrid1: TwwDBGrid;
    qryAlteradores: TwwQuery;
    dsAlteradores: TwwDataSource;
    qryAlteradoresCODDOCUMENTO: TFloatField;
    qryAlteradoresVALOR: TFloatField;
    qryAlteradoresNUMLANCTO: TFloatField;
    qryAlteradoresDESCRICAO: TStringField;
    qryVALOR_LIQUIDO: TFloatField;
    qryAlteradoresDEBCRE: TStringField;
    lblProporcao: TLabel;
    redtProporcao: TRealEdit;
    Label57: TLabel;
    edtSaldoDoc: TRealEdit;
    edtTotal: TRealEdit;
    edtVlrMulta: TRealEdit;
    edtVlrMora: TRealEdit;
    GroupBox17: TGroupBox;
    Label13: TLabel;
    Label46: TLabel;
    Label55: TLabel;
    cboIndiceReajuste: TCMDBLookupCombo;
    SpinMesesAnteriores: TSpinEdit;
    edtPercentMulta: TRealEdit;
    edtPercentMora: TRealEdit;
    dbCboPeriodicidade: TwwDBComboBox;
    chkMoraProporc: TCheckBox;
    MS: TMontaSelect;
    CdsAlterador: TCMClientDataSet;
    CdsAlteradorVALOR: TCurrencyField;
    CdsAlteradorCODALTERADOR: TIntegerField;
    CdsAlteradorPLNCODIGO: TIntegerField;
    qryLancImovel: TwwQuery;


    procedure btnContinuaIndiceClick(Sender: TObject);
    procedure btnVoltaAlteradorClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ntbPrincipalPageChanged(Sender: TObject);
    procedure btnVoltaIndiceClick(Sender: TObject);
    procedure btnContinuaSelecaoClick(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
    procedure qryCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure btnExcluiAlteradorClick(Sender: TObject);
    procedure btnConfirmaOperacaoClick(Sender: TObject);
    procedure btnVoltaCalculoClick(Sender: TObject);
    procedure btnContinuaMensagemClick(Sender: TObject);
    procedure btnVoltaMensagemClick(Sender: TObject);
    procedure btnContinuaCalculoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBcboPortadorFormaChange(Sender: TObject);
    procedure edtCMExit(Sender: TObject);
    procedure MS_LancamentoBeforeOpenCds(var sqlText: String;
      strListParams: TStringList);
    procedure MSBeforeOpenCds(var sqlText: String;
      strListParams: TStringList);


  private { Private declarations }

    //CtrlDocumento      : TCtrlDocumento;
    CtrlDocumento      : TCtrlImobDocumento;
    CtrlEventoImovel   : TCtrlEventoImovel;
    //Ricardo Cristiano - SOL : 167204 Kintana : 1465768 - Alteração para melhorar performance na entrada da tela
    CtrlInadimplencia  : TCtrlInadimplencia;
    CtrlOperImob       : TCtrlOperImob;

    dDataFechamento    : TDateTime;

    // Daniel - 26104 (22687)
    CtrlParamMulta     : TCtrlParamMulta;

    // Daniel - 22687
    rParamMulta : TParamMulta;
    //Cássio Rovaroto - SIG nº 71763 - Início
    fIdContratoImovel: Integer;
    fIdTipoCustorecImo: Integer;
    fDataVencimento: TDate;
    fCodTipImovel : string;
    //Cássio Rovaroto - SIG nº 71763 - Fim

    procedure AbreTabelas;
    procedure FechaTabelas;

    procedure GravaCalculo;
    procedure GravaMensagens;
    procedure GravaPortadorForma;
    function  VerificaPreenchimento: boolean;
    function  VerificaAlteradores : Boolean;
    //Cássio Rovaroto - SIG nº 71763
    function ListaLancImovel(pCodDocumento: Double): string;

  public { Public declarations }
        fIDENVIODOCUMENTO : Double;   //Ewerton Beltramini - SIG 116142
  end;



var
  frmExecRecalculoDocumento: TfrmExecRecalculoDocumento;



implementation
{$R *.DFM}
uses
   USistema, UMensErro, UDatabase, UComunsImobiliario, uVerificaPreenchimento, UModuloAdminImob, UDiasInUteis,
   dImobiliario, dLookImobiliario, uFuncoesImob, uLancContab, uIntegraBack, dBaseDados,
   dLancImovel, uCalcDocumento;



procedure TfrmExecRecalculoDocumento.GravaCalculo;                
var iErro, iDocumento: integer;
    bContabiliza : Boolean;
    dDtLancto : TDateTime;

    //Darivaldo Alencar SOL201128_18374 -inicio
    rVlrDifContab: Double;
    iPlnCodigo : Integer;
    Function CalcDifContab(rVlrAlterador: Double; iCodAlterador: Integer; var bTemAlterador : boolean; var iPlnCodgo : integer): double;
    begin
      if (CdsAlterador.Locate('CODALTERADOR',iCodAlterador,[])) then
      begin
         result := ComunsImobiliario.Arredonda(rVlrAlterador - CdsAlterador.fieldbyname('VALOR').ascurrency,2);
         bTemAlterador := result <> 0;
         iPlnCodigo := Iff(bTemAlterador, 0, CdsAlterador.fieldbyname('PLNCODIGO').asInteger);
      end
      else
      begin
        result := 0;
        iPlnCodigo := 0;
        bTemAlterador := true;
      end;
    end;
    //Darivaldo Alencar SOL201128_18374 -fim

begin
   Repaint;
   try
      inherited;
      iDocumento  := qry.FieldByName('CODDOCUMENTO').asInteger;

      if edtDataPagto.Text <> '' then
           dDtLancto := edtDataPagto.Date
      else dDtLancto := edtDataVencimento.DateTime;

//---------- INÍCIO - Marcio Motta - 09/03/2004 - Pendência: 16195 ---------------------------------

      // MULTA DO PRINCIPAL ------------------------------------------------------------------------
      if edtMulta.Value <> 0 then begin
        //Darivaldo Alencar SOL201128_18374 -inicio
        // if ModuloImobiliario.AdminImob.iTipoOperAtualMulta > 0 then
        //      bContabiliza := False
        // else

         rVlrDifContab := CalcDifContab(edtMulta.Value,dtmLookImobiliario.qryLookTipoImovelCODALTMULTA.AsInteger, bContabiliza, iPlnCodigo);
         //Darivaldo Alencar SOL201128_18374 -fim
         // Prepara a função para lançar o alterador MULTA
         //CtrlDocumento.Prepare( OpLanctoDocum, odlAlterador );
         CtrlDocumento.Prepare(OpLanctoDocumImob, odlAlteradorImob);
         CtrlDocumento.OpenTransaction := False;
         CtrlDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
         CtrlDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
         CtrlDocumento.IdUsuario       := Sistema.IdUsuario;
         CtrlDocumento.IdEspAcesso     := Sistema.idEspAcesso;
         CtrlDocumento.IdModulo        := Sistema.idModulo;

         CtrlDocumento.Lanctodocum.SetValues( dDtLancto,
                                              iDocumento,
                                              0,
                                              edtMulta.Value,
                                              0,
                                              edtMulta.Value,
                                              0,
                                              iPlnCodigo,
                                              0,                           //edilaine - SOL201128_18374
                                              Sistema.idUsuario,
                                              Sistema.idEmpresa,
                                              0, 0, 0, 0,
                                              dtmLookImobiliario.qryLookTipoImovelCODALTMULTA.AsInteger,
                                              '4',
                                              '', '', '',
                                              'Multa',
                                              '', '', '',
                                              'D',
                                              Sistema.idModulo,
                                              ParamIntegra.Plano,
                                              Sistema.UsaPlanoPatro,
                                              bContabiliza
                                              ,0, 0, '', 0, rVlrDifContab //Darivaldo Alencar SOL201128_18374
                                              ,-1,-1,0,1
                                              );
         if not CtrlDocumento.Insert then
            raise exception.Create( CtrlDocumento.MessageInfo );
      end;

      // MULTA DA DIFERENÇA ------------------------------------------------------------------------
      if edtMultaDif.Value <> 0 then begin
         //Darivaldo Alencar SOL201128_18374 -inicio
         // if ModuloImobiliario.AdminImob.iTipoOperAtualMulta > 0 then
         //      bContabiliza := False
         // else

         // WO13491 - Administração Imobiliária - Recálculo de documentos em atraso
         // Alterado por Arnaldo V. Scarin em 07/11/2024
         // Descricao: Quando o Campo EdtMulta.Value contem valor, é feita a contabilização do valor restante, mas
         // internamente, quando é feita a Inserção da Linha do Alterador na LanctoDocum, a planilha de Contabilização
         // e excluida e lançada somente a diferença, fazendo com que a contabilização da baixa do documento fique
         // errada. Por conta disso, quando houver situação em que o campo edtMulta estiver zerado, será considerado
         // o Valor total, evitando assim o problema de contabilização.
         rVlrDifContab := CalcDifContab(edtMultaDif.Value,dtmLookImobiliario.qryLookTipoImovelCODALTMULTA.AsInteger, bContabiliza, iPlnCodigo);
         If edtMulta.Value = 0 then
           rVlrDifContab := edtMultaDif.Value;

         //Darivaldo Alencar SOL201128_18374 -fim

         // Prepara a função para lançar o alterador MULTA
         //CtrlDocumento.Prepare( OpLanctoDocum, odlAlterador );
         CtrlDocumento.Prepare(OpLanctoDocumImob, odlAlteradorImob);
         CtrlDocumento.OpenTransaction := False;
         CtrlDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
         CtrlDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
         CtrlDocumento.IdUsuario       := Sistema.IdUsuario;
         CtrlDocumento.IdEspAcesso     := Sistema.idEspAcesso;
         CtrlDocumento.IdModulo        := Sistema.idModulo;

         CtrlDocumento.Lanctodocum.SetValues( edtDataVencimento.DateTime,
                                              iDocumento,
                                              0,
                                              edtMultaDif.Value,
                                              0,
                                              edtMultaDif.Value,
                                              0,
                                              iPlnCodigo, 0,       //edilaine - SOL201128_18374
                                              Sistema.idUsuario,
                                              Sistema.idEmpresa,
                                              0, 0, 0, 0,
                                              dtmLookImobiliario.qryLookTipoImovelCODALTMULTA.AsInteger,
                                              '4',
                                              '', '', '',
                                              'Multa sobre a diferença',
                                              '', '', '',
                                              'D',
                                              Sistema.idModulo,
                                              ParamIntegra.Plano,
                                              Sistema.UsaPlanoPatro,
                                              bContabiliza
                                              ,0, 0, '', 0, rVlrDifContab //Darivaldo Alencar SOL201128_18374
                                              ,-1,-1,0,1
                                              );
         if not CtrlDocumento.Insert then
            raise exception.Create( CtrlDocumento.MessageInfo );
      end;

      // JUROS (MORA) DO PRINCIPAL ------------------------------------------------------------------------
      if edtJuros.Value <> 0 then begin
        //Darivaldo Alencar SOL201128_18374 -inicio
        // if ModuloImobiliario.AdminImob.iTipoOperAtualJuros > 0 then
        //      bContabiliza := False
        // else

         rVlrDifContab := CalcDifContab(edtJuros.Value,dtmLookImobiliario.qryLookTipoImovelCODALTJUROS.AsInteger, bContabiliza, iPlnCodigo);
        //Darivaldo Alencar SOL201128_18374 -fim

         // Prepara a função para lançar o alterador de JUROS
         //CtrlDocumento.Prepare( OpLanctoDocum, odlAlterador );
         CtrlDocumento.Prepare(OpLanctoDocumImob,odlAlteradorImob);
         CtrlDocumento.OpenTransaction := False;
         CtrlDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
         CtrlDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
         CtrlDocumento.IdUsuario       := Sistema.IdUsuario;
         CtrlDocumento.IdEspAcesso     := Sistema.idEspAcesso;
         CtrlDocumento.IdModulo        := Sistema.idModulo;

         CtrlDocumento.Lanctodocum.SetValues( dDtLancto,
                                              iDocumento,
                                              0,
                                              edtJuros.Value,
                                              0,
                                              edtJuros.Value,
                                              0,
                                              iPlnCodigo, 0,       //edilaine - SOL201128_18374
                                              Sistema.idUsuario,
                                              Sistema.idEmpresa,
                                              0, 0, 0, 0,
                                              dtmLookImobiliario.qryLookTipoImovelCODALTJUROS.AsInteger,
                                              '4',
                                              '', '', '',
                                              'Juros',
                                              '', '', '',
                                              'D',
                                              Sistema.idModulo,
                                              ParamIntegra.Plano,
                                              Sistema.UsaPlanoPatro,
                                              bContabiliza
                                              ,0, 0, '', 0, rVlrDifContab //Darivaldo Alencar SOL201128_18374
                                              ,-1,-1,0,1
                                              );
         if not CtrlDocumento.Insert then
            raise exception.Create( CtrlDocumento.MessageInfo );
      end;

      // JUROS (MORA) DA DIFERENÇA -------------------------------------------------------------------
      if edtJurosDif.Value <> 0 then begin
         //Darivaldo Alencar SOL201128_18374 -inicio
         // if ModuloImobiliario.AdminImob.iTipoOperAtualJuros > 0 then
         //      bContabiliza := False
         // else

         // WO13491 - Administração Imobiliária - Recálculo de documentos em atraso
         // Alterado por Arnaldo V. Scarin em 07/11/2024
         // Descricao: Quando o Campo EdtMulta.Value contem valor, é feita a contabilização do valor restante, mas
         // internamente, quando é feita a Inserção da Linha do Alterador na LanctoDocum, a planilha de Contabilização
         // e excluida e lançada somente a diferença, fazendo com que a contabilização da baixa do documento fique
         // errada. Por conta disso, quando houver situação em que o campo edtMulta estiver zerado, será considerado
         // o Valor total, evitando assim o problema de contabilização.
         rVlrDifContab := CalcDifContab(edtJurosDif.Value,dtmLookImobiliario.qryLookTipoImovelCODALTJUROS.AsInteger, bContabiliza, iPlnCodigo);
         If edtJuros.Value = 0 then
           rVlrDifContab := edtJurosDif.Value;

         //Darivaldo Alencar SOL201128_18374 -inicio

         // Prepara a função para lançar o alterador de JUROS
         //CtrlDocumento.Prepare( OpLanctoDocum, odlAlterador );
         CtrlDocumento.Prepare(OpLanctoDocumImob,odlAlteradorImob);
         CtrlDocumento.OpenTransaction := False;
         CtrlDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
         CtrlDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
         CtrlDocumento.IdUsuario       := Sistema.IdUsuario;
         CtrlDocumento.IdEspAcesso     := Sistema.idEspAcesso;
         CtrlDocumento.IdModulo        := Sistema.idModulo;

         CtrlDocumento.Lanctodocum.SetValues( edtDataVencimento.DateTime,
                                              iDocumento,
                                              0,
                                              edtJurosDif.Value,
                                              0,
                                              edtJurosDif.Value,
                                              0,
                                              iPlnCodigo, 0,       //edilaine - SOL201128_18374
                                              Sistema.idUsuario,
                                              Sistema.idEmpresa,
                                              0, 0, 0, 0,
                                              dtmLookImobiliario.qryLookTipoImovelCODALTJUROS.AsInteger,
                                              '4',
                                              '', '', '',
                                              'Juros sobre a diferença',
                                              '', '', '',
                                              'D',
                                              Sistema.idModulo,
                                              ParamIntegra.Plano,
                                              Sistema.UsaPlanoPatro,
                                              bContabiliza
                                              ,0, 0, '', 0, rVlrDifContab //Darivaldo Alencar SOL201128_18374
                                              ,-1,-1,0,1
                                              );
         if not CtrlDocumento.Insert then
            raise exception.Create( CtrlDocumento.MessageInfo );
      end;

      // CORREÇÃO MONETÁRIA DO PRINICPAL ------------------------------------------------------------------
      if edtCM.Value <> 0 then begin
        //Darivaldo Alencar SOL201128_18374 -inicio
        // if ModuloImobiliario.AdminImob.iTipoOperAtualCM > 0 then
        //      bContabiliza := False
        // else

         rVlrDifContab := CalcDifContab(edtCM.Value,dtmLookImobiliario.qryLookTipoImovelCODALTCORRMON.AsInteger, bContabiliza, iPlnCodigo);
         //Darivaldo Alencar SOL201128_18374 -fim

         // Prepara a função para lançar o alterador de CM
         //CtrlDocumento.Prepare( OpLanctoDocum, odlAlterador );
         CtrlDocumento.Prepare(OpLanctoDocumImob,odlAlteradorImob);
         CtrlDocumento.OpenTransaction := False;
         CtrlDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
         CtrlDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
         CtrlDocumento.IdUsuario       := Sistema.IdUsuario;
         CtrlDocumento.IdEspAcesso     := Sistema.idEspAcesso;
         CtrlDocumento.IdModulo        := Sistema.idModulo;

         CtrlDocumento.Lanctodocum.SetValues( dDtLancto,
                                              iDocumento,
                                              0,
                                              edtCM.Value,
                                              0,
                                              edtCM.Value,
                                              0,
                                              iPlnCodigo, 0,       //edilaine - SOL201128_18374
                                              Sistema.idUsuario,
                                              Sistema.idEmpresa,
                                              0, 0, 0, 0,
                                              dtmLookImobiliario.qryLookTipoImovelCODALTCORRMON.AsInteger,
                                              '4',
                                              '', '', '',
                                              'Correção Monetária',
                                              '', '', '',
                                              'D',
                                              Sistema.idModulo,
                                              ParamIntegra.Plano,
                                              Sistema.UsaPlanoPatro,
                                              bContabiliza
                                              ,0, 0, '', 0, rVlrDifContab //Darivaldo Alencar SOL201128_18374
                                              ,-1,-1,0,1
                                              );
         if not CtrlDocumento.Insert then
            raise exception.Create( CtrlDocumento.MessageInfo );
      end;

      // CORREÇÃO MONETÁRIA DA DIFERENÇA ------------------------------------------------------------------
      if edtCMDif.Value <> 0 then begin
         //Darivaldo Alencar SOL201128_18374 -inicio
         //if ModuloImobiliario.AdminImob.iTipoOperAtualCM > 0 then
         //     bContabiliza := False
         //else

         // WO13491 - Administração Imobiliária - Recálculo de documentos em atraso
         // Alterado por Arnaldo V. Scarin em 07/11/2024
         // Descricao: Quando o Campo EdtMulta.Value contem valor, é feita a contabilização do valor restante, mas
         // internamente, quando é feita a Inserção da Linha do Alterador na LanctoDocum, a planilha de Contabilização
         // e excluida e lançada somente a diferença, fazendo com que a contabilização da baixa do documento fique
         // errada. Por conta disso, quando houver situação em que o campo edtMulta estiver zerado, será considerado
         // o Valor total, evitando assim o problema de contabilização.
         rVlrDifContab := CalcDifContab(edtCMDif.Value,dtmLookImobiliario.qryLookTipoImovelCODALTCORRMON.AsInteger, bContabiliza, iPlnCodigo);
         If edtCM.Value = 0 then
           rVlrDifContab := edtCMDif.Value;

         //Darivaldo Alencar SOL201128_18374 -fim

         // Prepara a função para lançar o alterador de CM
         //CtrlDocumento.Prepare( OpLanctoDocum, odlAlterador );
         CtrlDocumento.Prepare(OpLanctoDocumImob,odlAlteradorImob);
         CtrlDocumento.OpenTransaction := False;
         CtrlDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
         CtrlDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
         CtrlDocumento.IdUsuario       := Sistema.IdUsuario;
         CtrlDocumento.IdEspAcesso     := Sistema.idEspAcesso;
         CtrlDocumento.IdModulo        := Sistema.idModulo;

         CtrlDocumento.Lanctodocum.SetValues( edtDataVencimento.DateTime,
                                              iDocumento,
                                              0,
                                              edtCMDif.Value,
                                              0,
                                              edtCMDif.Value,
                                              0,
                                              iPlnCodigo, 0,       //edilaine - SOL201128_18374
                                              Sistema.idUsuario,
                                              Sistema.idEmpresa,
                                              0, 0, 0, 0,
                                              dtmLookImobiliario.qryLookTipoImovelCODALTCORRMON.AsInteger,
                                              '4',
                                              '', '', '',
                                              'Correção Monetária sobre a diferença',
                                              '', '', '',
                                              'D',
                                              Sistema.idModulo,
                                              ParamIntegra.Plano,
                                              Sistema.UsaPlanoPatro,
                                              bContabiliza
                                              ,0, 0, '', 0, rVlrDifContab //Darivaldo Alencar SOL201128_18374
                                              ,-1,-1,0,1
                                              );
         if not CtrlDocumento.Insert then
            raise exception.Create( CtrlDocumento.MessageInfo );
      end;


//------- Fim Implementação/Alteração - Marcio Motta - 09/03/2004 - Pendência: 16195----------------

      // Vinicius - 07/12/2004 - Pendência 17957
      CtrlEventoImovel.RegistraEvento(-1,-1,-1, iDocumento, Sistema.IdUsuario, 'RD',
                                      'Recálculo de Cobrança', memEvento.Text,
                                      edtDataVencimento.Date, -1, -1, 0, 0, 0, False,
                                      iff(cbAviso.Checked, 'S', 'N'),
                                      iff(cbAviso.Checked, StrToInt(spnDiasAviso.Text), 0) );

      MsgDlg('Os valores foram lançados no Contas a Receber.', 'Informação', mtInformation, [mbOk], 0);
      Repaint;

   except
      MsgDlg('Houve erro durante a tentativa de integração com o Contas a Receber.'+#13+
             'CAR - '+CtrlDocumento.MessageInfo, 'Erro', mtError, [mbOk], 0);
      Repaint;
   end;
end;

procedure TfrmExecRecalculoDocumento.GravaPortadorForma;
var sSql : String;
begin
   try
      // Altera o Portador Forma
      if qryCODPORTFORMA_LANC.AsInteger <> StrToInt(DBcboPortadorForma.LookupValue) then begin
         sSql := 'UPDATE LANCAMENTOSIMOVEL SET CODPORTFORMA = ' + DBcboPortadorForma.LookupValue +
                 ' WHERE CODDOCUMENTO = ' + qryCODDOCUMENTO.AsString;
         ExecutaQuery(dtmBaseDados.qry, sSql);

         sSql := 'UPDATE DOCUMENTO           '+#13+
                 '   SET NOSSONUMERO = NULL, '+#13+
                 '       CODPORTFORMA = ' + DBcboPortadorForma.LookupValue +
                 ' WHERE CODDOCUMENTO = ' + qryCODDOCUMENTO.AsString;
         ExecutaQuery(dtmBaseDados.qry, sSql);
      end;

      // Altera a Data Programada
      if cbDataProgramada.Checked then begin
         sSql := 'UPDATE DOCUMENTO           '+#13+
                 '   SET DATAPROGRAMADA = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',edtDataVencimento.Date)) + ',''DD/MM/YYYY'') ' +#13+
                 ' WHERE CODDOCUMENTO = ' + qryCODDOCUMENTO.AsString;
         ExecutaQuery(dtmBaseDados.qry, sSql);

         // Peterson Victor SOL 230549 inicio
         sSql := 'UPDATE LANCAMENTOSIMOVEL SET DATALIMITE = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',edtDataVencimento.Date)) + ',''DD/MM/YYYY'') ' +#13 +
                 ' WHERE CODDOCUMENTO = ' + qryCODDOCUMENTO.AsString;
         ExecutaQuery(dtmBaseDados.qry, sSql);
         // Peterson Victor SOL 230549 Fim


      end;

   except
      MsgDlg('Não foi possível alterar a Forma de Recebimento','Erro',mtError,[mbOk],0);
   end;
end;

procedure TfrmExecRecalculoDocumento.GravaMensagens;
var
  i:integer;
  vMsg: array[0..8] of string;
  sData, sVo, sCm, sJuros, sMulta: string;
begin
   inherited;
   for i:= 0 to 8 do
      vMsg[i] := TEdit(FindComponent('edtln'+inttostr(i+1))).Text;

   sData  := FormatDateTime('dd/mm/yyyy', edtDataVencimento.Date);
   sVo    := Modulo.sMoedaCorrente + ' ' + FormatFloat('#,##0.00', edtVO.Value);
   sCm    := Modulo.sMoedaCorrente + ' ' + FormatFloat('#,##0.00', edtCm.Value + edtCMDif.Value);
   sJuros := Modulo.sMoedaCorrente + ' ' + FormatFloat('#,##0.00', edtJuros.Value + edtJurosDif.Value);
   sMulta := Modulo.sMoedaCorrente + ' ' + FormatFloat('#,##0.00', edtMulta.Value + edtMultaDif.Value);

   FuncoesImob.SubstituiCuringa(vMsg, ['<dataval>','<vo>','<cm>','<juros>','<multa>'], [sData, sVo, sCm, sJuros, sMulta]);

   LimpaParametros(qryUpdateMensagensCnab);
   for i:= 0 to 8 do begin
      qryUpdateMensagensCnab.ParamByName('PMENSAGEM'+IntToStr(i+1)).AsString := vMsg[i];
   end;
   // procurar a mensagem primeiro em grupocnab, após em documento
   if not qryCODGRUPOCNAB.IsNull then
      qryUpdateMensagensCnab.ParamByName('PCODGRUPOCNAB').AsInteger := qryCODGRUPOCNAB.AsInteger
   else
      qryUpdateMensagensCnab.ParamByName('PCODDOCUMENTO').AsInteger := qryCODDOCUMENTO.AsInteger;
   qryUpdateMensagensCnab.ExecSQL;

   // COLOCAR EMISBLOQ = N E CONTROLEREMESSA = NULL
   LimpaParametros(dtmLancImovel.qryUpdateDocumento);
   dtmLancImovel.qryUpdateDocumento.ParamByName('PCODDOCUMENTO').AsInteger := qryCODDOCUMENTO.AsInteger;
   dtmLancImovel.qryUpdateDocumento.ExecSQL;

   // atualizar as mensagens dos lançamentos
   FuncoesImob.UpdateMsgLanc(qryCODDOCUMENTO.AsInteger,vMsg);
end;

procedure TfrmExecRecalculoDocumento.AbreTabelas;
begin
   // Parametros do Sistema
   dtmImobiliario.qryParamImob.Close;
   ParametrosSistema;

   LimpaParametros(qryLookMoedaCM);
   qryLookMoedaCM.Open;

   LimpaParametros(qryLookMoedaMulta);
   qryLookMoedaMulta.Open;

   LimpaParametros(dtmLookImobiliario.qryLookMoeda);
   dtmLookImobiliario.qryLookMoeda.Open;

   LimpaParametros(dtmLookImobiliario.qryLookPortadorForma);
   dtmLookImobiliario.qryLookPortadorForma.ParamByName('PIDPESSOA').AsInteger := Sistema.idEmpresa;
   dtmLookImobiliario.qryLookPortadorForma.Open;
end;

procedure TfrmExecRecalculoDocumento.FechaTabelas;
begin
   qry.Close;
   qryLookMoedaCM.Close;
   qryLookMoedaMulta.Close;
   qryContratoImovel.Close;
   qryAlteradoresLanc.Close;
   dtmLancImovel.qryLancImovel.Close;
   dtmLookImobiliario.qryLookMoeda.Close;
   dtmLookImobiliario.qryLookTipoImovel.Close;
   dtmLookImobiliario.qryLookPortadorForma.Close;

   // Daniel - 24688
   qryAlteradores.Close;

   qryLancImovel.Close; //Cássio Rovaroto - SIG nº 71763 
end;

function TfrmExecRecalculoDocumento.VerificaPreenchimento: boolean;
begin
  // Verifica os percentuais de Juros, Multa e Mora...
  Result := False;

  try  
    if (cboIndiceReajuste.Text<>'') and (SpinMesesAnteriores.Value<0) then                     //DBrdgMesReferencia
       raise EValidacao.CreateVal('É necessário indicar a periodicidade da Correção Monetária!', SpinMesesAnteriores);

      //DBedtVlrMulta
    if (edtVlrMulta.Value<>0) and (DBcboMoedaMulta.Text='') then
       raise EValidacao.CreateVal('É necessário indicar a moeda da multa!', DBcboMoedaMulta);

      //DBedtVlrMulta              DBedtPercentMulta
    if (edtVlrMulta.Value<>0) and (edtPercentMulta.Value<>0) then                      //DBedtVlrMulta
       raise EValidacao.CreateVal('A multa deve ser escolhida por valor ou percentual!', edtVlrMulta);

      //DBedtVlrMora              DBedtMoedaMora
    if (edtVlrMora.Value<>0) and (DBedtMoedaMora.Text='') then
       raise EValidacao.CreateVal('É necessário indicar a moeda do juros de mora!', DBedtMoedaMora);

      //DBedtVlrMora              DBedtPercentMora
    if (edtVlrMora.Value<>0) and (edtPercentMora.Value<>0) then
       raise EValidacao.CreateVal('O juros de mora deve ser escolhido por valor ou percentual!', edtVlrMora);

       //DBedtVlrMora             DBedtPercentMora
    if ((edtVlrMora.Value<>0) or (edtPercentMora.Value<>0)) and (dbCboPeriodicidade.Text='') then
       raise EValidacao.CreateVal('É necessário indicar a periodicidade do juros de mora!', dbCboPeriodicidade);

    if (ModuloImobiliario.AdminImob.iTipoOperAtualMulta > 0) or
       (ModuloImobiliario.AdminImob.iTipoOperAtualJuros > 0) or
       (ModuloImobiliario.AdminImob.iTipoOperAtualCM    > 0) then
    begin
       if edtDataVencimento.Date <= dDataFechamento then
          raise EValidacao.CreateVal('Data de recálculo deve ser superior ao último fechamento realizado em ' + FormatDateTime('dd/mm/yyyy',dDataFechamento) +'!', edtDataVencimento);
    end;


  except
    on ev : EValidacao do begin
      if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;

  end;

  Result := True;
end;

procedure TfrmExecRecalculoDocumento.btnContinuaIndiceClick(Sender: TObject);
begin
   inherited;

   // Abre a query de rateio imovel
   if VerificaPreenchimento then begin
      LimpaParametros(qryAlteradoresLanc);
      qryAlteradoresLanc.ParamByName('PCODDOCUMENTO').AsInteger := qryCODDOCUMENTO.AsInteger;
      qryAlteradoresLanc.Open;
      DBgrdAlteradoresLanc.SelectAll;

      ntbPrincipal.PageIndex := ntbPrincipal.PageIndex + 1;
      Repaint;

   end;
end;

procedure TfrmExecRecalculoDocumento.btnVoltaAlteradorClick(Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex := ntbPrincipal.PageIndex - 1;
end;

procedure TfrmExecRecalculoDocumento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FechaTabelas;

   if qryContratoImovel.UpdatesPending then qryContratoImovel.CancelUpdates;

   if (dtmBaseDados.dbBaseDados.InTransaction) then RollBackTransacao;

   inherited;
end;

procedure TfrmExecRecalculoDocumento.FormShow(Sender: TObject);
begin
   inherited;

   // Daniel - 24688
   pcLancamento.ActivePage := tbsLancamentos;

   ntbPrincipal.PageIndex := 0;
   Repaint;
   AbreTabelas;
end;

procedure TfrmExecRecalculoDocumento.ntbPrincipalPageChanged(Sender: TObject);
begin
   inherited;

   case ntbPrincipal.PageIndex of
      0: lblTitulo.Caption := 'Documento para Recálculo [Seleção]';
      1: lblTitulo.Caption := 'Documento para Recálculo [Índices]';
      2: lblTitulo.Caption := 'Documento para Recálculo [Mensagens]';
      3: lblTitulo.Caption := 'Documento para Recálculo [Alteradores]';
   else
      lblTitulo.Caption := 'Documento para Recálculo [Cálculo]';
   end;
end;

procedure TfrmExecRecalculoDocumento.btnVoltaIndiceClick(Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex := ntbPrincipal.PageIndex - 1;
   qryContratoImovel.CancelUpdates;
end;

procedure TfrmExecRecalculoDocumento.btnContinuaSelecaoClick(Sender: TObject);
begin
  inherited;

  try
    if (DBedtTipoRecDes.Text='') then begin
      MsgDlg('Deve ser selecionado um documento para reajuste.','Aviso',mtwarning,[mbok],0);

      if btnProcurar.CanFocus then
        btnProcurar.SetFocus;
    end else begin
      //Ricardo Cristiano - SOL : 167204 Kintana : 1465768 - Alteração para melhorar performance na entrada da tela - Inicio
      if CtrlOperImob = nil then
      begin
         CtrlOperImob := TCtrlOperImob.Create(Sistema.IDEmpresa,Sistema.IDModulo,Sistema.IDUsuario,Sistema.IDEspAcesso,ParamIntegra.PlanoPrevGlobal,ParamIntegra.PatroGlobal,Sistema.UsaPlanoPatro);

         CtrlOperImob.cdsEncargos := cdsEncargos;
         CtrlOperImob.InitializeAs(CtrlDocumento);
      end;

      if edtDataVencimento.Text = '' then
      begin
         dDataFechamento        := Date;
         if (ModuloImobiliario.AdminImob.iTipoOperAtualMulta > 0) or
            (ModuloImobiliario.AdminImob.iTipoOperAtualJuros > 0) or
            (ModuloImobiliario.AdminImob.iTipoOperAtualCM    > 0) then
            dDataFechamento := CtrlOperImob.UltimoFechamento;

         //Darivaldo Alencar SOL201128_18374
         //edtDataVencimento.Date := dDataFechamento;
         edtDataVencimento.Date := Now;
      end;
      //Ricardo Cristiano - SOL : 167204 Kintana : 1465768 - Alteração para melhorar performance na entrada da tela - Fim

      ntbPrincipal.PageIndex := ntbPrincipal.PageIndex + 1;
      LimpaParametros(qryContratoImovel);
      //Cássio Rovaroto - SIG nº 71763 - Início
      //qryContratoImovel.ParamByName('PIDCONTRATOIMOVEL').AsInteger := dtmLancImovel.qryLancImovelIDCONTRATOIMOVEL.AsInteger;
      qryContratoImovel.ParamByName('PIDCONTRATOIMOVEL').AsInteger := fIdContratoImovel;
      //Cássio Rovaroto - SIG nº 71763 - Fim
      qryContratoImovel.Open;

// Daniel - 22687 - Início -----------------------------------------------------
      //Cássio Rovaroto - SIG nº 71763 - Início
      // Daniel - 26104
      {if not CtrlParamMulta.BuscaParamMulta(rParamMulta,
                                            dtmLancImovel.qryLancImovelIDCONTRATOIMOVEL.AsInteger,
                                            dtmLancImovel.qryLancImovelIDTIPOCUSTORECIMO.AsInteger,
                                            dtmLancImovel.qryLancImovelDATAVENCIMENTO.AsDateTime) then
        raise EValidacao.CreateVal(CtrlParamMulta.MessageInfo,cboIndiceReajuste);}
      // Fim.
      if not CtrlParamMulta.BuscaParamMulta(rParamMulta,
                                            fIdContratoImovel,
                                            fIdTipoCustorecImo,
                                            fDataVencimento) then
        raise EValidacao.CreateVal(CtrlParamMulta.MessageInfo,cboIndiceReajuste);
      //Cássio Rovaroto - SIG nº 71763 - Fim


      with rParamMulta do begin

        cboIndiceReajuste.LookupValue := IntToStr(iIndiceCorrecao);
        SpinMesesAnteriores.Value     := iMesRefCorrecao;
        edtVlrMulta.Text              := FloatToStr(fVlrMulta);
        DBcboMoedaMulta.LookupValue   := IntToStr(iMoeMulta);
        edtPercentMulta.Text          := FloatToStr(fPercMulta);
        edtVlrMora.Text               := FloatToStr(fVlrJuros);
        DBedtMoedaMora.LookupValue    := IntToStr(iMoeJuros);
        edtPercentMora.Text           := FloatToStr(fPercJuros);
        dbCboPeriodicidade.Text       := sPeriodoJuros;

        if (sFlgJurosProporc='S') then
          chkMoraProporc.State := cbChecked;
      end;
// Daniel - 22687 - Fim --------------------------------------------------------

      if qryContratoImovel.IsEmpty then
        qryContratoImovel.Insert;
    end;
  except
    on ev:EValidacao do begin
      if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;
end;

procedure TfrmExecRecalculoDocumento.btnProcurarClick(Sender: TObject);
var
  sSQL: String; //Darivaldo Alencar SOL201128_18374
begin
  inherited;

   btnContinuaSelecao.Enabled := True;
   //Darivaldo Alencar SOL201128_18374 -inicio
   //MS_Lancamento.Executar;
   ms.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query principal com apenas o registro buscado
   //if MS_Lancamento.RetornouValor then begin
   if ms.RetornouValor then begin
   //Darivaldo Alencar SOL201128_18374 -fim

      Screen.Cursor := crHourGlass;

      LimpaParametros(qry);
      qry.ParamByName('PIDEMPRESAPROP').AsInteger  := Sistema.idEmpresa;
      //Darivaldo Alencar SOL201128_18374
      //qry.ParamByName('PIDDOCUMENTO').AsFloat      := StrToFloat(MS_Lancamento.ValoresChave[6]);
      qry.ParamByName('PIDDOCUMENTO').AsFloat      := StrToFloat(ms.ValoresChave[0]);
      qry.Open;

      //Cássio Rovaroto - SIG nº 71763 - Início
      {//Darivaldo Alencar SOL201128_18374 -inicio
      sSQL := dtmLancImovel.qryLancImovel.SQL.GetText;
      sSQL := StringReplace(sSQL, 'VWLANCAMENTO L', '( ' + dtmMS.GetView + ') L ', []);
      dtmLancImovel.qryLancImovel.SQL.Text := sSQL;
      LimpaParametros(dtmLancImovel.qryLancImovel);
      //dtmLancImovel.qryLancImovel.ParamByName('PIDDOCUMENTO').AsFloat := StrToFloat(MS_Lancamento.ValoresChave[6]);
      dtmLancImovel.qryLancImovel.ParamByName('PIDDOCUMENTO').AsFloat := StrToFloat(ms.ValoresChave[0]);
      //Darivaldo Alencar SOL201128_18374 -fim

      dtmLancImovel.qryLancImovel.ParamByName('PIDPESSOA').AsInteger  := Sistema.idEmpresa;
      dtmLancImovel.qryLancImovel.Open;
                                               }

      qryLancImovel.SQL.Text := ListaLancImovel(StrToFloat(ms.ValoresChave[0]));
      dsLancamentos.DataSet := qryLancImovel;
      qryLancImovel.Open;

      if not qryLancImovel.IsEmpty then
      begin
        fIdContratoImovel := qryLancImovel.FieldByName('IDCONTRATOIMOVEL').asInteger;
        fIdTipoCustorecImo := qryLancImovel.FieldByName('IDTIPOCUSTORECIMO').asInteger;
        fDataVencimento := qryLancImovel.FieldByName('DATAVENCIMENTO').asDateTime;
        fCodTipImovel := qryLancImovel.FieldByName('CODTIPIMOVEL').asString;
      end;

      //Cássio Rovaroto - SIG nº 71763 - Fim


      // Daniel - 24688
      LimpaParametros(qryAlteradores);
      //Darivaldo Alencar SOL201128_18374 
      //qryAlteradores.ParamByName('PDOCUMENTO').AsFloat := StrToFloat(MS_Lancamento.ValoresChave[6]);
      qryAlteradores.ParamByName('PDOCUMENTO').AsFloat := StrToFloat(ms.ValoresChave[0]);
      qryAlteradores.Open;
      // Fim.

      LimpaParametros(dtmLookImobiliario.qryLookTipoImovel);
      //Cássio Rovaroto - SIG nº 71763 - Início
      //dtmLookImobiliario.qryLookTipoImovel.ParamByName('PCODTIPIMOVEL').AsString := dtmLancImovel.qryLancImovelCODTIPIMOVEL.AsString;
      dtmLookImobiliario.qryLookTipoImovel.ParamByName('PCODTIPIMOVEL').AsString := fCodTipImovel;
      //Cássio Rovaroto - SIG nº 71763 - Início
      dtmLookImobiliario.qryLookTipoImovel.Open;

      // Posiciona a Forma de Cobrança
      DBcboPortadorForma.LookupValue := qryCODPORTFORMA_LANC.AsString;

      Screen.Cursor := crDefault;

       //Darivaldo Alencar SOL201128_18374
      //if MS_Lancamento.ValoresChave[8] = '2' then
      if ms.ValoresChave[1] = '2' then
      begin
         btnContinuaSelecao.Enabled := (MsgDlg('Documento já está liquidado. Deseja prosseguir?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes);
      end;
   end;

end;

procedure TfrmExecRecalculoDocumento.qryCalcFields(DataSet: TDataSet);
begin
  {** Darivaldo Alencar SOL201128_18374 -Incluído nos DECODES da Query
   Case qryMESCOMPETENCIA.asInteger of
         1: qry_MESCOMPETENCIA.asString := 'Janeiro';
         2: qry_MESCOMPETENCIA.asString := 'Fevereiro';
         3: qry_MESCOMPETENCIA.asString := 'Março';
         4: qry_MESCOMPETENCIA.asString := 'Abril';
         5: qry_MESCOMPETENCIA.asString := 'Maio';
         6: qry_MESCOMPETENCIA.asString := 'Junho';
         7: qry_MESCOMPETENCIA.asString := 'Julho';
         8: qry_MESCOMPETENCIA.asString := 'Agosto';
         9: qry_MESCOMPETENCIA.asString := 'Setembro';
        10: qry_MESCOMPETENCIA.asString := 'Outubro';
        11: qry_MESCOMPETENCIA.asString := 'Novembro';
        12: qry_MESCOMPETENCIA.asString := 'Dezembro';
     end;

     // prenche a origem do lançamento (nome extenso)
     qry_ORIGEMLANC.AsString := OrigemLancamento(qryFLGORIGEMLANC.asString[1]);
     **}
   inherited;
end;

procedure TfrmExecRecalculoDocumento.FormCreate(Sender: TObject);            
begin
   inherited;

   // Marcio Motta - 09/03/2004 - Pendência: 16195
   //CtrlDocumento := TCtrlDocumento.Create;
   CtrlDocumento := TCtrlImobDocumento.Create;
   CtrlDocumento.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

   // Vinicius - 07/12/2004 - Pendência: 17957
   CtrlEventoImovel := TCtrlEventoImovel.Create;
   CtrlEventoImovel.InitializeAs(CtrlDocumento);

  //Ricardo Cristiano - SOL : 167204 Kintana : 1465768 - Alteração para melhorar performance na entrada da tela   

// Daniel - 26104 (22687) - Início ---------------------------------------------
   CtrlParamMulta := TCtrlParamMulta.Create(Sistema.IDEmpresa,
                                            Sistema.IDModulo,
                                            Sistema.IDUsuario,
                                            Sistema.IDEspAcesso,
                                            Sistema.UsaPlanoPatro);
   CtrlParamMulta.InitializeAs(CtrlDocumento);
// Daniel - 26104 (22687) - Fim ------------------------------------------------


   If Sistema.TipoCliente = 20041 then
        cbDataProgramada.Checked := True
   else cbDataProgramada.Checked := False;

  //Ricardo Cristiano - SOL : 167204 Kintana : 1465768 - Alteração para melhorar performance na entrada da tela

  //Darivaldo Alencar SOL201128_18374 -inicio
  Label23.visible              := False;
  DBgrdAlteradoresLanc.visible := False;
  btnExcluiAlterador.Visible   := False;
  cbDataProgramada.Visible     := False;
  GroupBox1.Top                :=  40;
  GroupBox3.Top                := 163;
  GroupBox4.Top                := 163;
  CdsAlterador.CreateDataSet;
  //Darivaldo Alencar SOL201128_18374 -fim

  //Cássio Rovaroto - SIG nº 71763 - Início
  fIdContratoImovel:= -1;
  fIdTipoCustorecImo:= -1;
  fDataVencimento:= Now;
  fCodTipImovel:= EmptyStr;
  //Cássio Rovaroto - SIG nº 71763 - Fim
end;



procedure TfrmExecRecalculoDocumento.btnExcluiAlteradorClick(Sender: TObject);
var i : integer;
begin
   inherited;
   // //Darivaldo Alencar SOL201128_18374 -inicio
   //if MsgDlg('Deseja realmente EXCLUIR esse(es) alterador(es)?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo then   exit;
   CdsAlterador.EmptyDataSet;
   //Darivaldo Alencar SOL201128_18374 -fim

   Screen.Cursor := crHourGlass;
   // ELS SOL 174320 Kintana 1573531 Inicio
   if not dtmBaseDados.dbBaseDados.InTransaction then
   dtmBaseDados.dbBaseDados.StartTransaction;
   //StartTransacao;
   // ELS SOL 174320 Kintana 1573531 Fim
   try
      with DBgrdAlteradoresLanc, DBgrdAlteradoresLanc.datasource.dataset do begin
         DisableControls;
         for i:= 0 to SelectedList.Count-1 do begin
            GotoBookmark(SelectedList.items[i]);
            Freebookmark(SelectedList.items[i]);

            // Some com o LancToDocum e desfaz a contabilização se houver
            //CtrlDocumento.Prepare(OpLanctoDocum, odlAlterador);
            CtrlDocumento.Prepare(OpLanctoDocumImob, odlAlteradorImob);

            CtrlDocumento.UsaPlanoPatro         := Sistema.UsaPlanoPatro;

            CtrlDocumento.IdUsuario             := Sistema.IdUsuario;   // Daniel Simões - P: 22481 - 30/05/2006
            CtrlDocumento.IdEspAcesso           := Sistema.IdEspAcesso; // Daniel Simões - P: 22481 - 30/05/2006

            CtrlDocumento.CodDocumento          := qryAlteradoresLancCODDOCUMENTO.asInteger;
            CtrlDocumento.Lanctodocum.NumLancto := qryAlteradoresLancNUMLANCTO.asInteger;

            //Darivaldo Alencar SOL201128_18374 -inicio
            if not(CdsAlterador.Locate('CODALTERADOR',qryAlteradoresLanc.fieldbyname('CODALTERADOR').AsInteger,[])) then
               CdsAlterador.Insert
            else
            CdsAlterador.Edit;

            CdsAlterador.FieldByName('CODALTERADOR').AsInteger:= qryAlteradoresLanc.fieldbyname('CODALTERADOR').AsInteger;
            CdsAlterador.FieldByName('VALOR').AsCurrency      := qryAlteradoresLanc.fieldbyname('VALOR').AsCurrency;
            CdsAlterador.FieldByName('PLNCODIGO').AsInteger   := qryAlteradoresLanc.fieldbyname('PLNCODIGO').AsInteger;
            CdsAlterador.Post;

            CtrlDocumento.MantemLancContabil := true;
            //Darivaldo Alencar SOL201128_18374 -fim

            if not CtrlDocumento.Delete then
               raise exception.create(CtrlDocumento.MessageInfo);
         end;
         SelectedList.clear;

         EnableControls;
      end;

      {Darivaldo Alencar SOL201128_18374
      CommitTransacao; }         

      qryAlteradoresLanc.Close;
      qryAlteradoresLanc.Open;
                                                                                                
      {Darivaldo Alencar SOL201128_18374
      MsgDlg('Alterador(es) excluído(s) com sucesso.', 'Informação', mtInformation, [mbOk], 0)};
      Repaint;

      Screen.Cursor := crDefault;
   except
      MsgDlg('Problemas ao se excluir o(s) Alterador(es).' +#13+
             CtrlDocumento.MessageInfo, 'Informação', mtInformation, [mbOk], 0);

      {Darivaldo Alencar SOL201128_18374
      RollBackTransacao;}
//    Raise;  - Marcio Motta - 20/04/2004
      Repaint;
      Screen.Cursor := crDefault;
   end;
end;

procedure TfrmExecRecalculoDocumento.btnConfirmaOperacaoClick(Sender: TObject);
begin
   inherited;
   {Darivaldo Alencar SOL201128_18374 -inicio
    {exclui todos os alteradores automaticamente}
     cbDataProgramada.Checked := True;
     btnExcluiAlteradorClick(self);                         
   {Darivaldo Alencar SOL201128_18374 -fim}

   if not qryAlteradoresLanc.IsEmpty then begin
      MsgDlg('Para recalcular a cobrança é necessário que todos os alteradores sejam excluídos.','Aviso',mtwarning,[mbok],0);
      if btnExcluiAlterador.CanFocus then btnExcluiAlterador.SetFocus;
      exit;
   end;

   if DBcboPortadorForma.LookupValue = '' then begin
      MsgDlg('É necessário informar a Forma de Recebimento.','Aviso',mtwarning,[mbok],0);
      if DBcboPortadorForma.CanFocus then DBcboPortadorForma.SetFocus;
      exit;
   end;

   if memEvento.Text = '' then begin
      MsgDlg('Informe a descrição para o evento do documento.','Aviso',mtwarning,[mbok],0);
      if memEvento.CanFocus then memEvento.SetFocus;
      exit;
   end;

   // Marchetti - Pendencia 25986
   if not VerificaAlteradores then Exit;

   if MsgDlg('Deseja realmente lançar os valores no Contas a Receber?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    //Helen SOL: 174748 - KTN : 1584347 - Inicio
    if not dtmBaseDados.dbBaseDados.InTransaction then
      StartTransacao;
      //StartTransacao;
    //Helen SOL: 174748 - KTN : 1584347 - Fim
      try
         GravaMensagens;
         GravaCalculo;
         GravaPortadorForma;
         qryContratoImovel.CancelUpdates;
         CommitTransacao;
         qry.Close;
         qryContratoImovel.Close;
         qryAlteradoresLanc.Close;
         dtmLancImovel.qryLancImovel.Close;
         qryLancImovel.Close;

         // Daniel - 24688
         qryAlteradores.Close;

         ntbPrincipal.PageIndex := 0;
      except
         RollBackTransacao;
         Raise;
         Repaint;
      end;
   end;

end;

procedure TfrmExecRecalculoDocumento.btnVoltaCalculoClick(
  Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex := ntbPrincipal.PageIndex - 1;

end;

procedure TfrmExecRecalculoDocumento.btnContinuaMensagemClick(Sender: TObject);
var
   fValorCorrecao, fTotBaixa, fTotAlterador: Extended;
   dUltLancBaixa: TDateTime;
   iMoraProp, iMoedaMora, iMoedaMulta: integer;
   iUsaMesAnterior : integer;

   iIndReajuste : Integer;
   
   // Método 3 camadas
   fValorAtual, fMulta, fJuros, fCorrecaoMonet, fMultaDif, fJurosDif,
   fCorrecaoMonetDif, fProporcao, fValorDiverg, fValorDivergAtual: Extended;
   dDataCalculo : TDateTime;
begin
  inherited;

// Daniel - 24688 - Início -----------------------------------------------------
  // Exibe "%" para apenas se for Proporção...
  if (ModuloImobiliario.AdminImob.sFlgCalcInadimp='P') then begin
    lblProporcao.Visible  := True;
    redtProporcao.Visible := True;
  end else begin
    lblProporcao.Visible  := False;
    redtProporcao.Visible := False;
  end;
// Daniel - 24688 - Fim --------------------------------------------------------

  // Verifia Juros de Mora proporcional
  if (chkMoraProporc.Checked) then
    iMoraProp := 1
  else
    iMoraProp := 0;

  // Verifica a moeda do juros de mora
  iMoedaMora := 0;

  if (DBedtMoedaMora.LookupValue<>'') then begin
    try
      iMoedaMora := StrToInt(DBedtMoedaMora.LookupValue);
    except
      iMoedaMora := 0;
    end;
  end;

  // Verifica o indice de correção
  iIndReajuste := 0;

  if (cboIndiceReajuste.LookupValue<>'') then
    iIndReajuste := StrToInt(cboIndiceReajuste.LookupValue);

  // Verifica a moeda de multa
  iMoedaMulta := 0;

  if (DBcboMoedaMulta.LookupValue<>'') then begin
    try
      iMoedaMulta := StrToInt(DBcboMoedaMulta.LookupValue);
    except
      iMoedaMulta := 0;
    end;
  end;

  if (ModuloImobiliario.AdminImob.iTipoOperAtualMulta <= 0) or
     (ModuloImobiliario.AdminImob.iTipoOperAtualJuros <= 0) or
     (ModuloImobiliario.AdminImob.iTipoOperAtualCM    <= 0) then
  begin
    //Ricardo Cristiano - SOL : 167204 Kintana : 1465768 - Alteração para melhorar performance na entrada da tela
    if CtrlInadimplencia = Nil then
    begin
       CtrlInadimplencia := TCtrlInadimplencia.Create(Sistema.IDEmpresa,Sistema.IDModulo,Sistema.IDUsuario,Sistema.IDEspAcesso,Sistema.UsaPlanoPatro);
       CtrlInadimplencia.InitializeAs(CtrlDocumento);
    end;

    // Efetua Calculo
    CtrlInadimplencia.DadosDocsVencidos(qryCODDOCUMENTO.AsInteger, -1,
                                        edtDataVencimento.DateTime,
                                        SpinMesesAnteriores.Value, //22687
                                        iIndReajuste,
                                        edtVlrMulta.Value,     //22687
                                        edtPercentMulta.Value, //22687
                                        iMoedaMulta,
                                        edtVlrMora.Value,      //22687
                                        edtPercentMora.Value,  //22687
                                        iMoedaMora,
                                        iMoraProp,
                                        qryContratoImovelIDCIDADES.AsInteger,
                                        qryContratoImovelIDPAIS.AsInteger,
                                        rParamMulta.iDiasTolerancia, //22687
                                        rParamMulta.iDiasRepasse, //22687
                                        (qryVALOR_RECEBIDO.AsFloat>0),
                                        qryVALOR_LIQUIDO.AsFloat, // Daniel - 24688
                                        qryVALOR_RECEBIDO.AsFloat,
                                        qryDATAVENCIMENTO.AsDateTime,
                                        qryDATALIMITE.AsDateTime,
                                        dbCboPeriodicidade.Text, //22687
                                        qryContratoImovelCODESTADO.AsString,
                                        rParamMulta.sFlgTipoDiasTolera, // 22687
                                        rParamMulta.sFlgTipoDiasRepasse, // 22687
                                        'L',
                                        ModuloImobiliario.AdminImob.sFlgCalcInadimp,
                                        True,
                                        fValorAtual,
                                        fMulta,
                                        fJuros,
                                        fCorrecaoMonet,
                                        fMultaDif,
                                        fJurosDif,
                                        fCorrecaoMonetDif,
                                        fProporcao,
                                        fValorDiverg,
                                        fValorDivergAtual,
                                        dDataCalculo);
    // Busca data da última baixa
    LimpaParametros( qryUltBaixa );
    qryUltBaixa.ParamByName('CODDOCUMENTO').AsInteger := qryCODDOCUMENTO.AsInteger;
    qryUltBaixa.Open;

    if not (qryUltBaixa.IsEmpty) then
      edtDataPagto.Date := qryUltBaixa.FieldByName('DATABAIXA').AsDateTime;

    LimpaParametros(qryTotInad);
    //Cássio Rovaroto - SIG nº 71763 - Início
    //qryTotInad.ParamByName('PIDCONTRATOIMOVEL').AsInteger := dtmLancImovel.qryLancImovelIDCONTRATOIMOVEL.AsInteger;
    qryTotInad.ParamByName('PIDCONTRATOIMOVEL').AsInteger := fIdContratoImovel;
    //Cássio Rovaroto - SIG nº 71763 - Fim
    qryTotInad.ParamByName('PDATAINI').AsDateTime         := DiasUteis.SomaMeses(dDataCalculo,-24);
    qryTotInad.ParamByName('PDATAFIM').AsDateTime         := dDataCalculo;
    qryTotInad.ParamByName('PCODDOCUMENTO').AsInteger     := qryCODDOCUMENTO.AsInteger;
    qryTotInad.Open;

    edtInad.Value    := qryTotInadQTDE.AsInteger;

    // Carrega Variáveis
    edtVencto.Date    := qryDATAVENCIMENTO.AsDateTime;
    edtDias.Value     := DiasUteis.IntervaloDias(qryDATAVENCIMENTO.AsDateTime, edtDataVencimento.Date);
    edtVO.Value       := qryVALOR_LIQUIDO.AsFloat; // Daniel - 24688
    edtVlrPago.Value  := qryVALOR_RECEBIDO.AsFloat;
    edtSaldoDoc.Value := fValordiverg;
    edtCM.Value       := fCorrecaoMonet;
    edtJuros.Value    := fJuros;
    edtMulta.Value    := fMulta;
    edtCMDif.Value    := fCorrecaoMonetDif;
    edtJurosDif.Value := fJurosDif;
    edtMultaDif.Value := fMultaDif;
    edtTotal.Value    := fValorDivergAtual;

    // Daniel - 24688
    redtProporcao.Value := fProporcao;

  end
  else
  begin

    CtrlOperImob.iCodDocumentoAjuste := 0;
    CtrlOperImob.MoedaCM             := 0;
    CtrlOperImob.ValorMulta          := 0;
    CtrlOperImob.MoedaMulta          := 0;
    CtrlOperImob.PercentualMulta     := 0;
    CtrlOperImob.ValorJuros          := 0;
    CtrlOperImob.MoedaJuros          := 0;
    CtrlOperImob.PercentualJuros     := 0;
    CtrlOperImob.PeriodoJuros        := '';
    CtrlOperImob.JurosProporc        := '';

    cdsEncargos.EmptyDataSet;

    CtrlOperImob.iCodDocumentoAjuste := qryCODDOCUMENTO.AsInteger;
    CtrlOperImob.MoedaCM             := iIndReajuste; //22687

    CtrlOperImob.bFatorMesAntDiasMesAtual := True;  // Alterado por FHBS - SIG79081
    CtrlOperImob.UsaMesAnterior := SpinMesesAnteriores.Value; // Alterado por FHBS - SIG79081

    if ( StrToFloat(edtVlrMulta.Text)>0 ) then
      CtrlOperImob.ValorMulta := StrToFloat(edtVlrMulta.Text); //22687

    if ( DBcboMoedaMulta.LookupValue<>'' ) then
      CtrlOperImob.MoedaMulta := StrToInt(DBcboMoedaMulta.LookupValue); //22687

    if ( StrToFloat(edtPercentMulta.Text)>0 ) then
      CtrlOperImob.PercentualMulta := StrToFloat(edtPercentMulta.Text); //22687

    if ( StrToFloat(edtVlrMora.Text)>0 ) then
      CtrlOperImob.ValorJuros := StrToFloat(edtVlrMora.Text); //22687

    if ( DBedtMoedaMora.LookupValue<>'' ) then
      CtrlOperImob.MoedaJuros := StrToInt(DBedtMoedaMora.LookupValue); //22687

    if ( StrToFloat(edtPercentMora.Text)>0 ) then
      CtrlOperImob.PercentualJuros := StrToFloat(edtPercentMora.Text); //22687

    if (dbCboPeriodicidade.Text<>'') then
    // Marchetti - Pendencia 27724
//      CtrlOperImob.PeriodoJuros := dbCboPeriodicidade.Value; //22687
      CtrlOperImob.PeriodoJuros := dbCboPeriodicidade.Text;
    // Fim Marchetti - Pendencia 27724

    { Ver com o Vinícius - 22687 }
    if (chkMoraProporc.Checked) then
      CtrlOperImob.JurosProporc := 'S'
    else
      CtrlOperImob.JurosProporc := 'N'; //22687

    CtrlOperImob.BuscaParamMultaContrato := False;
    CtrlOperImob.AtualizaDocsVencidos('',
                                      ModuloImobiliario.AdminImob.iTipoOperAtualMulta,
                                      ModuloImobiliario.AdminImob.iTipoOperAtualJuros,
                                      ModuloImobiliario.AdminImob.iTipoOperAtualCM,
                                      edtDataVencimento.DateTime,
                                      //Cássio Rovaroto - SIG nº 71763 - Início
                                      //dtmLancImovel.qryLancImovelIDCONTRATOIMOVEL.AsInteger,
                                      fIdContratoImovel,
                                      //Cássio Rovaroto - SIG nº 71763 - Fim
//                                      False {True});    //edilaine SOL201128_18374
                                      True);      

    // Busca data da última baixa
    LimpaParametros(qryUltBaixa);
    qryUltBaixa.ParamByName('CODDOCUMENTO').AsInteger := qryCODDOCUMENTO.AsInteger;
    qryUltBaixa.Open;

    if not (qryUltBaixa.IsEmpty) then
      edtDataPagto.Date := qryUltBaixa.FieldByName('DATABAIXA').AsDateTime;

    LimpaParametros(qryTotInad);
    //Cássio Rovaroto - SIG nº 71763 - Início
    //qryTotInad.ParamByName('PIDCONTRATOIMOVEL').AsInteger := dtmLancImovel.qryLancImovelIDCONTRATOIMOVEL.AsInteger;
    qryTotInad.ParamByName('PIDCONTRATOIMOVEL').AsInteger := fIdContratoImovel;
    //Cássio Rovaroto - SIG nº 71763 - Fim
    qryTotInad.ParamByName('PDATAINI').AsDateTime         := DiasUteis.SomaMeses(dDataCalculo,-24);
    qryTotInad.ParamByName('PDATAFIM').AsDateTime         := dDataCalculo;
    qryTotInad.ParamByName('PCODDOCUMENTO').AsInteger     := qryCODDOCUMENTO.AsInteger;
    qryTotInad.Open;

    edtInad.Value := qryTotInadQTDE.AsInteger;

    // Carrega Variáveis
    edtVencto.Date    := qryDATAVENCIMENTO.AsDateTime;
    edtDias.Value     := DiasUteis.IntervaloDias(qryDATAVENCIMENTO.AsDateTime,edtDataVencimento.Date);
    edtVO.Value       := qryVALOR_LIQUIDO.AsFloat; // Daniel - 24688
    edtVlrPago.Value  := qryVALOR_RECEBIDO.AsFloat;

    edtCMDif.Value    := 0;
    edtJurosDif.Value := 0;
    edtMultaDif.Value := 0;
    edtCM.Value       := 0;
    edtJuros.Value    := 0;
    edtMulta.Value    := 0;

    CtrlDocumento.Saldo.CalculaSaldo(qryCODDOCUMENTO.AsInteger,edtDataVencimento.Date);

    edtSaldoDoc.Value  := CtrlDocumento.Saldo.Valor;

    // Pendencia 27443 - Marchetti
    qryAlteradoresLanc.First;
    while not qryAlteradoresLanc.eof do
    begin
       if (qryAlteradoresLancCODALTERADOR.AsInteger = dtmLookImobiliario.qryLookTipoImovelCODALTMULTA.AsInteger) or
          (qryAlteradoresLancCODALTERADOR.AsInteger = dtmLookImobiliario.qryLookTipoImovelCODALTJUROS.AsInteger) or
          (qryAlteradoresLancCODALTERADOR.AsInteger = dtmLookImobiliario.qryLookTipoImovelCODALTCORRMON.AsInteger) then
       begin
          if qryAlteradoresLancDEBCRE.AsString = 'D' then
             edtSaldoDoc.Value := edtSaldoDoc.Value - qryAlteradoresLancVALOR.AsFloat
          else
             edtSaldoDoc.Value := edtSaldoDoc.Value + qryAlteradoresLancVALOR.AsFloat;
       end;
       qryAlteradoresLanc.Next;
    end;
    qryAlteradoresLanc.First;
    // Fim Pendencia 27443 - Marchetti

    //Cássio Rovaroto - SIG nº 71763 - Início
    //Marcio Sanches Spinosa SOL 201256 Kintana 1945186 - Inicio
    {if not (Trim(dtmLancImovel.qryLancImovelIDCONTRATOIMOVEL.AsString) = EmptyStr) then
      cdsEncargos.Filter := 'IDCONTRATOIMOVEL   = '+dtmLancImovel.qryLancImovelIDCONTRATOIMOVEL.AsString+
                            '  AND CODDOCUMENTO = '+qryCODDOCUMENTO.AsString}
    if not (Trim(IntToStr(fIdContratoImovel)) = EmptyStr) then
      cdsEncargos.Filter := 'IDCONTRATOIMOVEL   = '+IntToStr(fIdContratoImovel)+
                            '  AND CODDOCUMENTO = '+qryCODDOCUMENTO.AsString
    //Cássio Rovaroto - SIG nº 71763 - Fim
    else
      cdsEncargos.Filter := 'CODDOCUMENTO = '+qryCODDOCUMENTO.AsString;
    //Marcio Sanches Spinosa SOL 201256 Kintana 1945186 - Fim
    cdsEncargos.Filtered := True;
    cdsEncargos.First;

    while not cdsEncargos.eof do
    begin

       if ((cdsEncargos.FieldByName('DATABAIXA').IsNull) or
           // Pendencia 27443 - Marchetti
           (FormatDateTime('yyyy',cdsEncargos.FieldByName('DATABAIXA').AsDateTime) = '1899')
           // Fim Pendencia 27443 - Marchetti
          ) then
       begin

        if (cdsEncargos.FieldByName('IDOPERACAO').AsInteger=ModuloImobiliario.AdminImob.iTipoOperAtualMulta) then
          edtMultaDif.Value := edtMultaDif.Value+cdsEncargos.FieldByName('VLRACUM').AsFloat;

        if (cdsEncargos.FieldByName('IDOPERACAO').AsInteger=ModuloImobiliario.AdminImob.iTipoOperAtualJuros) then
          edtJurosDif.Value := edtJurosDif.Value+cdsEncargos.FieldByName('VLRACUM').AsFloat;

        if (cdsEncargos.FieldByName('IDOPERACAO').AsInteger=ModuloImobiliario.AdminImob.iTipoOperAtualCM) then
          edtCMDif.Value := edtCMDif.Value+cdsEncargos.FieldByName('VLRACUM').AsFloat;

       end
       else
       begin

        if (cdsEncargos.FieldByName('IDOPERACAO').AsInteger=ModuloImobiliario.AdminImob.iTipoOperAtualMulta) then
          edtMulta.Value := edtMulta.Value + cdsEncargos.FieldByName('VLRACUM').AsFloat;

        if (cdsEncargos.FieldByName('IDOPERACAO').AsInteger=ModuloImobiliario.AdminImob.iTipoOperAtualJuros) then
          edtJuros.Value := edtJuros.Value+cdsEncargos.FieldByName('VLRACUM').AsFloat;

        if (cdsEncargos.FieldByName('IDOPERACAO').AsInteger=ModuloImobiliario.AdminImob.iTipoOperAtualCM) then
          edtCM.Value := edtCM.Value+cdsEncargos.FieldByName('VLRACUM').AsFloat;

      end;

      cdsEncargos.Next;
    end;

    edtTotal.Value       := edtSaldoDoc.Value+edtMultaDif.Value+edtJurosDif.Value+edtCMDif.Value+
                            edtMulta.Value+edtJuros.Value+edtCM.Value;
    cdsEncargos.Filter   := '';
    cdsEncargos.Filtered := False;

  end;

  ntbPrincipal.PageIndex := ntbPrincipal.PageIndex+1;
end;

procedure TfrmExecRecalculoDocumento.btnVoltaMensagemClick(Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex := ntbPrincipal.PageIndex - 1;
end;

procedure TfrmExecRecalculoDocumento.btnContinuaCalculoClick(
  Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex := ntbPrincipal.PageIndex + 1;

end;

procedure TfrmExecRecalculoDocumento.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlDocumento);
  FreeAndNil(CtrlEventoImovel);

  //Ricardo Cristiano - SOL : 167204 Kintana : 1465768 - Alteração para melhorar performance na entrada da tela

  // Daniel - 26104 (22687)
  FreeAndNil(CtrlParamMulta);

  //Ricardo Cristiano - SOL : 167204 Kintana : 1465768 - Alteração para melhorar performance na entrada da tela
  FreeAndNil(CtrlOperImob);

  FreeAndNil(CtrlInadimplencia);

  inherited;
end;

procedure TfrmExecRecalculoDocumento.DBcboPortadorFormaChange(Sender: TObject);
begin
  inherited;
  chkBoleto.Checked := not(dtmLookImobiliario.qryLookPortadorFormaIDCONFIGBARRAS.IsNull);
end;


procedure TfrmExecRecalculoDocumento.edtCMExit(Sender: TObject);
begin
  inherited;

  edtSaldoDoc.Value := edtVO.Value-edtVlrPago.Value+edtCM.Value+edtJuros.Value+edtMulta.Value;
  edtTotal.Value    := edtSaldoDoc.Value+edtCMDif.Value+edtJurosDif.Value+edtMultaDif.Value;
end;



function TfrmExecRecalculoDocumento.VerificaAlteradores: Boolean;
var
   sTipoImovel : String;
begin
   Result := True;

   //Cássio Rovaroto - SIG nº 71763 - Início
   //sTipoImovel := dtmLancImovel.qryLancImovelCODTIPIMOVEL.AsString;
   sTipoImovel := fCodTipImovel;
   //Cássio Rovaroto - SIG nº 71763 - Fim

   if (edtMulta.Value <> 0) or (edtMultaDif.Value <> 0) then
   begin
      if dtmLookImobiliario.qryLookTipoImovelCODALTMULTA.IsNull then
      begin
         MsgDlg('Alterador de Multa para o tipo de imovel ' + sTipoImovel + ' não foi informado.', 'Informação', mtInformation, [mbOk], 0);
         Result := False;
         Exit;
      end;
   end;

   if (edtJuros.Value <> 0) or (edtJurosDif.Value <> 0) then
   begin
      if dtmLookImobiliario.qryLookTipoImovelCODALTJUROS.IsNull then
      begin
         MsgDlg('Alterador de Juros para o tipo de imovel ' + sTipoImovel + ' não foi informado.', 'Informação', mtInformation, [mbOk], 0);
         Result := False;
         Exit;
      end;
   end;

   if (edtCM.Value <> 0) or (edtCMDif.Value <> 0) then
   begin
      if dtmLookImobiliario.qryLookTipoImovelCODALTCORRMON.IsNull then
      begin
         MsgDlg('Alterador de Correção Monetária para o tipo de imovel ' + sTipoImovel + ' não foi informado.', 'Informação', mtInformation, [mbOk], 0);
         Result := False;
         Exit;
      end;
   end;
end;



procedure TfrmExecRecalculoDocumento.MS_LancamentoBeforeOpenCds(
  var sqlText: String; strListParams: TStringList);
var
  sSQL : string;
begin
  //Marcio Pendência 201128/16002 - PPM 360869
  sSQL := dtmMS.GetSubConsulta();
  sSQL := StringReplace(sSQL, '&idmodulo', IntToStr(Sistema.Idmodulo), [rfReplaceAll]);
  sqlText := StringReplace(sqlText, 'VWLANCAMENTO VW', '( ' + sSQL + ') VW ', []);

end;

//Darivaldo Alencar SOL201128_18374 -inicio
procedure TfrmExecRecalculoDocumento.MSBeforeOpenCds(var sqlText: String;
  strListParams: TStringList);
begin
  inherited;
  sqlText:= StringReplace(sqlText, 'LANCTODOCUML2','(SELECT * FROM LANCTODOCUM WHERE OPERACAO = 5) L2',[rfReplaceAll]);
  sqlText:= StringReplace(sqlText, '&IDMODULO', IntToStr(Sistema.Idmodulo), [rfReplaceAll]);
end;
//Darivaldo Alencar SOL201128_18374 -fim

function TfrmExecRecalculoDocumento.ListaLancImovel(pCodDocumento: Double): string;
begin
  Result := 'SELECT I.IMONOME AS IMOVEL_EXTENSO,                                     ' +#13#10+
            '       I.IMOCODIGO AS IMOCODIGO,                                        ' +#13#10+
            '       C.IDCONTRATOIMOVEL AS IDCONTRATOIMOVEL,                          ' +#13#10+
            '       C.CONNOME AS CONTRATO_EXTENSO,                                   ' +#13#10+
            '       NVL(L.VLRLANCPAGAR, L.VLRLANCRECEB) AS VALOR_LANC,               ' +#13#10+
            '       L.TRGDTINCLUSAO AS TRGDTINCLUSAO,                                ' +#13#10+
            '       U.NOMEUSUARIO AS LOGIN_USUARIO,                                  ' +#13#10+
            '       P.NOME AS NF_USUARIO,                                            ' +#13#10+
            '       L.IDTIPOCUSTORECIMO AS IDTIPOCUSTORECIMO,                        ' +#13#10+
            '       L.DATAVENCIMENTO AS DATAVENCIMENTO,                              ' +#13#10+
            '       L.CODTIPIMOVEL AS CODTIPIMOVEL                                   ' +#13#10+
            '  FROM LANCAMENTOSIMOVEL L                                              ' +#13#10+
            '  LEFT JOIN CONTRATOIMOVEL C ON C.IDCONTRATOIMOVEL = L.IDCONTRATOIMOVEL ' +#13#10+
            '  JOIN IMOVEL I ON I.IDIMOVEL = L.IDIMOVEL                              ' +#13#10+
            '  JOIN USUARIOSISTEMA U ON U.IDUSUARIO = L.IDUSUARIOSISTEMA             ' +#13#10+
            '  JOIN PESSOA P ON P.IDPESSOA = U.IDUSUARIO                             ' +#13#10+
            ' WHERE L.CODDOCUMENTO = ' + FloatToStr(pCodDocumento);
end;

end.
