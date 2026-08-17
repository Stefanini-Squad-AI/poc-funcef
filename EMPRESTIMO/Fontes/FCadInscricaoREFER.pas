unit FCadInscricaoREFER;

interface

uses
   {$IFNDEF VERSAO0505} uCMTypes, {$ENDIF}
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Db, DBTables, Wwtable, cmseldlg, wwidlg, Wwdatsrc, DBCtrls,
   MAHlpBtn, StdCtrls, Buttons, ComCtrls, ToolWin, ExtCtrls,
   Wwquery, Mask, wwdblook, wwdbedit, DBCtrls2, FTelaAut, UDataBase,
   Wwdbdlg, TREdit, Wwdbspin, TB97, Menus, MontaSelect,
   TB97Ctls, TB97Tlbr, wwrcdvw, IvDictio, IvMulti,
   IvEMulti, wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro,
   wwDialog, ImgList, fcButton, fcImgBtn, fcShapeBtn, Grids, DBGrids,
   FCadastroCSImob, Wwdbigrd, Wwdbgrid,

   uTypesEmptmo, uFiario, fcLabel, BfDialogs, BrowseFolder, uProcuraDir;


type
   TfrmCadInscricaoREFER = class(TfrmCadastroCSImob)

      sbtnCancelar: TToolbarButton97;
      Label23: TLabel;
      Label26: TLabel;
      bbtnContrato: TBitBtn;
      bbtnSimula: TBitBtn;
      sbtnImprimir: TToolbarButton97;
      pnlDetalhe: TPanel;
      pgcValores: TPageControl;
      tbsGeral: TTabSheet;
      Label40: TLabel;
      Label2: TLabel;
      Label9: TLabel;
      Label5: TLabel;
      Label6: TLabel;
      Label8: TLabel;
      Label14: TLabel;
      Label13: TLabel;
      Label19: TLabel;
      Label12: TLabel;
      DBspeParcelas: TwwDBSpinEdit;
      DBedtDataInsc: TCMDateTimePicker;
      edtDataCredito: TCMDateTimePicker;
      edtDataAssinatura: TCMDateTimePicker;
      edtDataPrimParcela: TCMDateTimePicker;
      edtCarencia: TEdit;
      edtPercentJuros: TRealEdit;
      edtValMargem: TRealEdit;
      edtValReserva: TRealEdit;
      edtValorParcela: TRealEdit;
      DBedtValorSolic: TDBEdit;
      Label20: TLabel;
      pnlDados: TPanel;
      pnlCancela: TPanel;
      dsBanco: TDataSource;
      qryDESCSITINSCRICAO: TStringField;
      qryINSCRICAONUMERO: TFloatField;
      qryIDSITPART: TFloatField;
      qrySITUACAO: TStringField;
      qryFLGINTERNO: TStringField;
      qryPLANO: TStringField;
      qryPATRO: TStringField;
      qryMATRICULA: TStringField;
      qryTITULAR: TStringField;
      qryBENEFICIARIO: TStringField;
      qryDESCTIPOEMPTMO: TStringField;
      qryIDPESSOA: TFloatField;
      qryIDPLANOPREV: TFloatField;
      qryIDPATRO: TFloatField;
      qryIDBENEF: TFloatField;
      qryIDCBANCARIA: TFloatField;
      qryFLGFORMAPAG: TStringField;
      qryPORTFORMAPAG: TFloatField;
      qryCODFORMAPAG: TFloatField;
      qryNUMPARCELAS: TFloatField;
      qryFLGFORMAREC: TStringField;
      qryPORTFORMAREC: TFloatField;
      qryFLGPENDENTE: TStringField;
      qryFLGSITUACAO: TStringField;
      qryVLRSOLIC: TFloatField;
      qryDATAINSC: TDateTimeField;
      qryDATACANCINSC: TDateTimeField;
      qryTCEDESCRICAO: TStringField;
      qryIDINSCRICAOEMPTMO: TFloatField;
      qryIDTIPOCONTREMPTMO: TFloatField;
      qryContratosAnteriores: TwwQuery;
      qryContratosAnterioresVLRCONTRATO: TFloatField;
      qryContratosAnterioresDATACREDITO: TDateTimeField;
      qryContratosAnterioresNUMPARCPAGAS: TFloatField;
      qryContratosAnterioresVLRATUAL: TFloatField;
      qryContratosAnterioresIDCONTRATOEMPTMO: TFloatField;
      qryContratosAnterioresHMESALDODEV: TFloatField;
      dtsContratoAnteriores: TDataSource;

      qryTipoContrato: TwwQuery;
      qryTipoContratoIDTIPOCONTREMPTMO: TFloatField;
      qryTipoContratoTCEDESCRICAO: TStringField;
      qryTipoContratoIDTIPOEMPTMO: TFloatField;
      qryTipoContratoIDREGRAJURCONC: TFloatField;
      qryTipoContratoIDREGRAELEG: TFloatField;
      qryTipoContratoIDREGRALIMITES: TFloatField;
      qryTipoContratoIDREGRAPRAZOSCONC: TFloatField;
      qryTipoContratoIDREGRAMARGEM: TFloatField;
      qryTipoContratoIDREGRARESERVA: TFloatField;
      qryTipoContratoDESCTIPOEMPTMO: TStringField;
      qryContratosAnterioresFLGFORMAREC: TStringField;
      updContratosAnteriores: TUpdateSQL;
      qryContratosAnterioresIDINSCRICAOEMPTMO: TFloatField;
      qryContratosAnterioresNUMPARCELAS: TFloatField;
      qryTipoContratoTEPMAXCONTRATO: TFloatField;
      tbsItens: TTabSheet;
      Label24: TLabel;
      dtsItensConcessao: TDataSource;
      qryItensConcessao: TwwQuery;
      qryItensConcessaoITEM: TStringField;
      qryItensConcessaoVALOR: TFloatField;
      DBgrdItensConcessao: TwwDBGrid;
      qryCPF: TStringField;
      Label32: TLabel;
      Label34: TLabel;
      MainMenu1: TMainMenu;
      updAvalista: TUpdateSQL;
      qryAvalista: TwwQuery;
      dsAvalista: TDataSource;
      qryAvalistaIDINSCRICAOEMPTMO: TFloatField;
      qryAvalistaIDAVALISTA: TFloatField;
      qryAvalistaNOME: TStringField;
      qryIDTIPOEMPTMO: TFloatField;
      qryAvalistaRENDACOMP: TFloatField;
      qryAvalistaMARGEMCONSIG: TFloatField;
      qryBenefSeguro: TwwQuery;
      dsBenefSeguro: TDataSource;
      updBenefSeguro: TUpdateSQL;
      qryBenefSeguroIDINSCRICAOEMPTMO: TFloatField;
      qryBenefSeguroIDBENEFSEGURO: TFloatField;
      qryBenefSeguroPERCINDENIZACAO: TFloatField;
      qryBenefSeguroNOME: TStringField;
      chkTRAVARDATAS: TCheckBox;
      qryFLGSUSPENSAOAUTO: TFloatField;
      qryContratoQuitacao: TwwQuery;
      qryTipoContratoFLGOBRIGBENEF: TFloatField;
      qryItensEmAberto: TwwQuery;
      qryTipoContratoIDREGRASALBAS: TFloatField;
      qryVLRSALBASE: TFloatField;
      qryVLRMARGEM: TFloatField;
      qryVLRMAXPERMIT: TFloatField;
      Label37: TLabel;
      RealEdit1: TRealEdit;
      DBEdtVlrMaxPermit: TDBEdit;
      Label38: TLabel;
      DBEdtMargem: TDBEdit;
      DBEdtSalarioBase: TDBEdit;
      qryMOECODIGO: TFloatField;
      dbcboMoeda: TwwDBLookupCombo;
      Label39: TLabel;
      qryTipoContratoMOECODIGO: TFloatField;
      qryTipoContratoFLGCONCESSAOZERO: TFloatField;
      qryTipoContratoTCEMINRENOVA: TFloatField;
      qryTipoContratoIDREGRADATACRED: TFloatField;
      qryContratosAnterioresMOECODIGO: TFloatField;
      qryContratosAnterioresMOESIGLA: TStringField;
      qryContratosAnterioresTCEDESCRICAO: TStringField;
      qryContratosAnterioresIDTIPOCONTREMPTMO: TFloatField;
      qryContratosAnterioresFLGESCOLHA: TFloatField;
      qryContratosAnterioresVLRPARCELA: TFloatField;
      qryItensEmAbertoIDHISTMOVEMPTMO: TFloatField;
      qryItensEmAbertoHMEVLRPREVISTO: TFloatField;
      qryContratosAnterioresVLREMABERTO: TFloatField;
      qryVLRPARCELAMES: TFloatField;
      qryVLRPARCATRASO: TFloatField;
      qryFLGALTSALARIO: TFloatField;
      qryFLGALTMARGEM: TFloatField;
      qryFLGALTVALMAX: TFloatField;
      qryItensConcessaoIDITEMEMPTMO: TFloatField;
      qryContratosAnterioresIDPATRO: TFloatField;
      qryContratosAnterioresIDPESSOA: TFloatField;
      qryContratosAnterioresIDPLANOPREV: TFloatField;
      qryContratosAnterioresIDSITPART: TFloatField;
      qryUpdateContratoAnt: TwwQuery;
      qryMATRICULA_TIT: TStringField;
      qryINSCRICAO_TIT: TFloatField;
      qryCPF_TIT: TStringField;
      qryContratosAnterioresIDTIPOSUSPEMPTMO: TFloatField;
      qryContratosAnterioresDATAINICIOSUSP: TDateTimeField;
      qryContratosAnterioresDATAFIMSUSP: TDateTimeField;
      qryContratosAnterioresFLGSUSPENSAOAUTO: TFloatField;
      qryContratosAnterioresDATALIBSUSP: TDateTimeField;
      qryContratosAnterioresULT_PARC: TFloatField;
      qryContratosAnterioresIDBENEF: TFloatField;
      qryContratosAnterioresDATAASSINATURA: TDateTimeField;
      qryContratosAnterioresDATAPRIMPARC: TDateTimeField;
      qryContratosAnterioresIDTIPOEMPTMO: TFloatField;
    lblTitulo: TfcLabel;
    ntbPrincipal: TNotebook;
    btnContinuar: TfcShapeBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Bevel1: TBevel;
    Total: TLabel;
    Label15: TLabel;
    btnVoltar: TfcShapeBtn;
    memResult: TMemo;
    Panel3: TPanel;
    memErro: TMemo;
    Panel2: TPanel;
    edtNumResult: TRealEdit;
    edtNumErro: TRealEdit;
    qryArquivoLido: TwwQuery;
    qryArquivoLidoIDINSCRICAOEMPTMO: TFloatField;
    qryArquivoLidoOPCAO: TFloatField;
    wwDBGrid1: TwwDBGrid;
    dsArquivoLido: TDataSource;
    OpenDialog: TOpenDialog;
    qryInscricaoLote: TwwQuery;
    qryInscricaoLoteIDINSCRICAOEMPTMO: TFloatField;
    qryInscricaoLoteVALORLIQUIDO1: TFloatField;
    qryInscricaoLoteVALORLIQUIDO2: TFloatField;
    qryInscricaoLoteVALORLIQUIDO3: TFloatField;
    qryInscricaoLotePRESTACAO1: TFloatField;
    qryInscricaoLotePRESTACAO2: TFloatField;
    qryInscricaoLotePRESTACAO3: TFloatField;
    qryInscricaoLoteCQM1: TFloatField;
    qryInscricaoLoteCQM2: TFloatField;
    qryInscricaoLoteCQM3: TFloatField;
    qryInscricaoLoteIOF1: TFloatField;
    qryInscricaoLoteIOF2: TFloatField;
    qryInscricaoLoteIOF3: TFloatField;
    qryInscricaoLoteCPMF1: TFloatField;
    qryInscricaoLoteCPMF2: TFloatField;
    qryInscricaoLoteCPMF3: TFloatField;
    qryInscricaoLoteTXADM1: TFloatField;
    qryInscricaoLoteTXADM2: TFloatField;
    qryInscricaoLoteTXADM3: TFloatField;
    qryInscricaoLoteVALORBRUTO1: TFloatField;
    qryInscricaoLoteVALORBRUTO2: TFloatField;
    qryInscricaoLoteVALORBRUTO3: TFloatField;
    qryInscricaoLoteOPCAO: TFloatField;
    qryInscricaoLoteTRGDTINCLUSAO: TDateTimeField;
    qryInscricaoLoteTRGUSERINCLUSAO: TStringField;
    qryTipoContratoTCEDIASTOLERAINSC: TFloatField;
    qryDATAVALIDADE: TDateTimeField;
    qryInscricaoLoteNOME: TStringField;
    qryArquivoLidoNOME: TStringField;
    UpdateSQL: TUpdateSQL;

      procedure CmeCadastroFind(Sender: TObject);
      procedure FormActivate(Sender: TObject);
      procedure sbtnCancelarClick(Sender: TObject);
      procedure CmeCadastroConfirma(Sender: TObject);
      procedure CmeCadastroAtualizaBotoes(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure DBedtValorSolicExit(Sender: TObject);
      procedure bbtnContratoClick(Sender: TObject);
      procedure bbtnCancelarClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure DBspeParcelasEnter(Sender: TObject);
      procedure DBgrdDivEmpCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure DBgrdDivEmpTopRowChanged(Sender: TObject);
      procedure CmeCadastroDelete(Sender: TObject);
      procedure DBgrdItensConcessaoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure DBgrdItensConcessaoTopRowChanged(Sender: TObject);
      procedure DBedtValorSolicEnter(Sender: TObject);
      procedure dsStateChange(Sender: TObject);
      procedure DBEdtSalarioBaseEnter(Sender: TObject);
      procedure FormShow(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);


   private { Private declarations }

      (* objeto Fiário *)
      iIdInscricaoEmptmo   : Int64;
      iOpcao               : Integer;
      Fiario               : TFiario;
      iTotalGrav, iTotalNGrav : Integer;


      FNumParcelas         : Int64;
      FVlrSolic            : Currency;

      bLimites             : Boolean;
      bContratoValido      : Boolean;

      dDataCredito         : TDateTime;
      dDataInscricao       : TDateTime;
      dDataAssinatura      : TDateTime;
      dDataUltAtualiza     : TDateTime;
      dDataFinalBeneficio  : TDateTime;

      fParcelaAnt          : Double;
      rNovoContrato        : TDadosContrato;
      rContratoAnterior    : TDadosContrato;


      vLista               : TListaItem;

      fSalParticipacao     : Currency;
      fSalMantido          : Currency;
      fSalAuxDoenca        : Currency;
      fSalBenef            : Currency;
      iIdAvalista          : Int64;

      fVlrSalarioAnt       : Currency;
      fVlrMargemAnt        : Currency;

      fVlrSalBase          : Currency;
      fVlrMargem           : Currency;
      fVlrMaxPermit        : Currency;

      fSalario             : Currency;
      fMargem              : Currency;
      fValMax              : Currency;

      fVlrAnterior         : Currency;
      bRegraErro           : Boolean;

      iPais                : Integer;
      sEstado              : String;
      iCidade              : Integer;

      iPrograma            : Integer;
      iMoedaCorrente       : Integer;
      sCCusto              : String;

      sDiaSldDev           : String;

      bTransacaoAnterior   : Boolean;

      procedure AbreQueries;
      procedure AbreQueriesCredito;
      procedure AbreQueriesDebito;
      procedure AbreQueriesBanco;
      procedure AbreQueriesTipoContrato;
      procedure AbreParametrosSistema;
      procedure AcertaEdits;
      procedure Sel(i: int64);
      procedure SetNumParcelas;
      procedure SetTxJuros;
      procedure SetParcelas(Num: Int64);
      procedure CalculaParcela;
      procedure AcertaDatas;
      procedure BuscaValorLiquidoEP;
      procedure PreencheDadosContrato(iNumParcela : Integer);
      procedure AtivaContrato;
      procedure AcertaDataPrimParcela;
      procedure AtualizaPaineisCredito;
      procedure SetValorSolic(const Valor: Currency);

      function EnviaContratoCAPCAR(var iPlanilha: Integer;
                                   const sNomePatro: String;
                                   var sResult,sErro: TStringList): Integer;


   public { Public declarations }

      property IdAvalista        : int64    read iIdAvalista        write iIdAvalista;
      property NumParcelas       : Int64    read FNumParcelas       write SetParcelas;
      property VlrSolic          : Currency read FVlrSolic          write SetValorSolic;
      property IdInscricaoEmptmo : Int64    read iIDInscricaoEmptmo write iIDInscricaoEmptmo;
      property Opcao             : Integer  read iOpcao             write iOpcao;

   end;



var
   frmCadInscricaoREFER: TfrmCadInscricaoREFER;



implementation

{$R *.DFM}

uses
   DLookEmptmo,
   UFuncoesEmptmo,            (* LimpaParametros, AtualizaConjunto, CritDataEmptmo, ConverteVirg *)
   UMensErro,                 (* MsgDlg *)
   URegra,                    (* TRegra *)
   USistema,                  (* Sistema *)
   dEmptmo,                   (* qryParamEmptmo *)
   ppTypes,                   (* stFile, ftBinary *)
   uDiasUteis,                (* SomaMeses *)
   FProgresso,                (* FrmProgresso *)
   uVerificaPreenchimento,    (* EValidacao *)
   UIntegraEmptmo,            (* IntegraEmptmo *)
   RSimula,
   dRelatorios,
   UCalcEmptmo,
   DBaseDados, FPessoaFiador, dMS, fPessoaBenefSeguro, dRelInscricao,
   fImpressaoContrato, FMostraSuspensaoConcessao;




procedure TfrmCadInscricaoREFER.FormCreate(Sender: TObject);
begin
   inherited;

   Fiario                  := TFiario.Create;
   pgcValores.ActivePage   := tbsGeral;

   DBspeParcelas.Clear;

   (* Procedimento da unit UFuncoesEmptmo que recebe como parâmetro um componente
      Container (Panel, GroupBox, etc.) e habilita/desabilita o próprio componente
      e os componentes dentro dele, trocando inclusive a cor de Edits e Combobox *)

   AtualizaConjunto(False, pnlCancela);
end;



procedure TfrmCadInscricaoREFER.FormActivate(Sender: TObject);
begin
   inherited;

   DBedtDataInsc.ButtonWidth         := 21;
   edtDataCredito.ButtonWidth        := 21;
   edtDataAssinatura.ButtonWidth     := 21;
   edtDataPrimParcela.ButtonWidth    := 21;
   WindowState := wsMaximized;
end;



procedure TfrmCadInscricaoREFER.AbreQueries;
begin
   dtmLookEmptmo.qryLookMoeda.Open;
end;



procedure TfrmCadInscricaoREFER.AbreQueriesTipoContrato;
begin
   (* Procedure que abre a query para a escolha do Tipo de Contrato/Empréstimo *)
   with qryTipoContrato do begin
     LimpaParametros(qryTipoContrato);
     ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IdEmpresa;
     Open;
   end;(* with qry *)

   (* Procedure que acerta os Edits das Datas que não são ligados a Banco de Dados *)
   AcertaEdits;
end;



procedure TfrmCadInscricaoREFER.AbreQueriesBanco;
begin
(* Procedure que abre as queries utilizadas para buscar a Conta Bancária *)

   with dtmLookEmptmo do begin

      with qryLookDadosBancarios do begin
        LimpaParametros(qryLookDadosBancarios);
        ParamByName('PIDPESSOA').AsInteger := qryIDBENEF.AsInteger;
        Open;
      end;(* with qry *)

   end;(* with dtmLookEmptmo *)
end;


(* Procedure que abre as queries utilizadas quando o Crédito do Empréstimo será pelo CAP *)
procedure TfrmCadInscricaoREFER.AbreQueriesCredito;
begin
   with dtmLookEmptmo do begin

      with qryLookPortadorFormaP do begin
        LimpaParametros(qryLookPortadorFormaP);
        ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
        Open;
      end;(* with qry *)

      with qryLookFormaRecPag do begin
        LimpaParametros(qryLookFormaRecPag);
        ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
        ParamByName('PRECPAG').AsString    := 'P';
        Open;
      end;(* with qry *)

   end;(* with dtmLookEmptmo *)
end;



(* Procedure que abre as queries utilizadas quando o Débito do Empréstimo será pelo CAR *)
procedure TfrmCadInscricaoREFER.AbreQueriesDebito;
begin
   with dtmLookEmptmo.qryLookPortadorFormaR do begin
      LimpaParametros(dtmLookEmptmo.qryLookPortadorFormaR);
      ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      Open;
   end;(* with dtmLookEmptmo *)
end;


procedure TfrmCadInscricaoREFER.AcertaEdits;
begin
(* Procedure que acerta os Edits das Datas que não são ligados a Banco de Dados *)

   edtValMargem.Value       := 0;
   edtValReserva.Value      := 0;

   edtPercentJuros.Value    := 0;
   edtValorParcela.Value    := 0;
   fVlrSalBase              := 0;
   fVlrMargem               := 0;
   fVlrMaxPermit            := 0;

   vLista                   := nil;

   if qryDATAINSC.AsString <> '' then begin
      (* Procedimento que acerta as Datas de Crédito, Data da Primeira Parcela e
         Calcula a Carência utilizando a função BuscaData da unit UCalcEmptmo *)
      AcertaDatas;
   end else begin
      edtCarencia.Clear;
      edtDataCredito.Clear;
      edtDataAssinatura.Clear;
      edtDataPrimParcela.Clear;
   end;

   qryContratosAnteriores.Close;
   qryItensConcessao.Close;
   dtmLookEmptmo.qryLookTipoSusp.Close;
   dtmLookEmptmo.qryLookDadosBancarios.Close;
end;



procedure TfrmCadInscricaoREFER.Sel(i: int64);
begin
   (* abre a query principal com os parâmetros passados *)
   with qry do begin
      LimpaParametros(qry);
      ParamByName('PIDINSCRICAOEMPTMO').AsInteger  := i;
      ParamByName('PIDEMPRESAPROP').AsInteger      := Sistema.IdEmpresa;
      Open;
   end;
end;



procedure TfrmCadInscricaoREFER.AbreParametrosSistema;
begin
(* Procedimento que usa a Função ParametrosSistema e torna visíveis os painéis de Crédito e Débito *)

   (* Chama a função ParametrosSistema da unit UFuncoesEmptmo que abre a tabela
      PARAMEMPTMO. Esta função retorna False se a tabela estiver vazia *)
   if ParametrosSistema then begin
      (* Serão utilizados os Parâmetros definidos no Sistema *)

      if qry.State = dsInsert then begin
         (* Na inserção usaremos os parâmetro defaults *)

         qryCODFORMAPAG.AsInteger  := dtmEmptmo.qryParamEmptmoCODFORMAPAGTO.AsInteger;
         qryPORTFORMAPAG.AsInteger := dtmEmptmo.qryParamEmptmoPORTFORMAPAGTO.AsInteger;
         qryFLGFORMAPAG.AsString   := dtmEmptmo.qryParamEmptmoFLGFORMAPAG.AsString;
         qryFLGFORMAREC.AsString   := dtmEmptmo.qryParamEmptmoFLGFORMAREC.AsString;

      end;(* if insert *)



   end else begin
      (* A tabela Parâmetros do Sistema está vazia *)

      MsgDlg('Favor preencher os Parâmetros do Sistema.', 'Empréstimo', mtWarning, [mbOk], 0);
      Repaint;

      if qry.State = dsInsert then begin
         (* Na inserção usaremos os parâmetros default *)

         qryFLGFORMAPAG.AsString := 'C';
         qryFLGFORMAREC.AsString := 'C';

      end;(* if insert *)

   end;(*if ParametrosSistema *)

   AtualizaPaineisCredito;


   if qry.State in dsEditModes then begin
      qryPORTFORMAREC.AsInteger := dtmEmptmo.qryParamEmptmoPORTFORMARECTO.AsInteger;
   end;

   (* Verifico se pode imprimir a Inscrição *)
   if dtmEmptmo.qryParamEmptmoFLGIMPRIMEINSC.AsInteger = 0 then begin
      (* NÃO pode imprimir a Inscrição, só o contrato *)
      sbtnImprimir.Enabled := False;
   end else begin
      (* PODE imprimir a Inscrição *)
      sbtnImprimir.Enabled := True;
   end;
end;



procedure TfrmCadInscricaoREFER.AtualizaPaineisCredito;
begin
(* Verifico se a Forma do Crédito do Empréstimo é Contas a Pagar.  Caso positivo
   verifico se foi indicado o PortadorForma ou a Forma de Pagamento para fazer
   visível o painel respectivo. Se a Forma do Credito é Folha desabilita todos
   os painéis *)

   if qryFLGFORMAPAG.AsString = 'C' then begin
      (* É Contas a Pagar *)

      if (qryPORTFORMAPAG.AsString  <> '') or (qryCODFORMAPAG.AsString <> '') then begin

         if qry.State in dsEditModes then begin
            qryPORTFORMAPAG.AsInteger := dtmEmptmo.qryParamEmptmoPORTFORMAPAGTO.AsInteger;
         end;


         if qry.State in dsEditModes then begin
            qryCODFORMAPAG.AsInteger := dtmEmptmo.qryParamEmptmoCODFORMAPAGTO.AsInteger;
         end;

      end; (* if qryPORTFORMAPAG or ... *)

   end; (* if FLGFORMAPAG = 'P' *)
end;



procedure TfrmCadInscricaoREFER.CmeCadastroFind(Sender: TObject);
var
   sDtCredito : String;
begin
   inherited;

   (* abre a query principal com o participante escolhido *)
   Sel(iIDInscricaoEmptmo);

   (* Impedindo que o usuário altere a Data de inscrição para data posterior *)
   DBedtDataInsc.MaxDate      := Trunc(SysDate);

   (* Data de inscrição como data do Sistema e impedindo que o usuário
      altere para data posterior *)
   edtDataAssinatura.Date     := Trunc(SysDate);
   edtDataAssinatura.MaxDate  := Trunc(SysDate);

   (* Impedindo que o usuário altere a Data do Crédito para data anterior à Data do Sistema *)
   if chkTRAVARDATAS.Checked then begin
      edtDataCredito.MinDate  := Trunc(SysDate);
   end;

   (* Procedimento que usa a Função ParametrosSistema e torna visíveis os painéis
      de Crédito e Débito *)
   AbreParametrosSistema;

   (* Procedimento que abre as queries de lookup *)
   AbreQueries;

   (* Procedure que abre a query para a escolha do Tipo de Contrato/Empréstimo *)
   AbreQueriesTipoContrato;

   dbcboMoeda.LookupValue := qryTipoContratoMOECODIGO.AsString;

   (* Procedure que abre as queries utilizadas para buscar a Conta Bancária *)
   AbreQueriesBanco;

   (* Procedure que abre as queries utilizadas quando o Crédito do Empréstimo
      será pelo CAP *)
   AbreQueriesCredito;

   (* Procedure que abre as queries utilizadas quando o Débito do Empréstimo
      será pelo CAR *)
   AbreQueriesDebito;

   (* As inscrições já realizadas já passaram pela regra de Limites *)
   bLimites := True;

   (* variável a ser passada por referência para a função SaldoDevEmp  *)
   sDtCredito    := edtDataCredito.Text;

   (* Procedimento que armazena os dados da Inscrição num registro *)
   PreencheDadosContrato(qryNUMPARCELAS.AsInteger);

   (* inicializa as variáveis *)
   fSalParticipacao  := 0;
   fSalMantido       := 0;
   fSalAuxDoenca     := 0;
   fSalBenef         := 0;
   fVlrSalBase       := 0;
   fVlrMargem        := 0;
   fVlrMaxPermit     := 0;

   if not(qryVLRMARGEM.IsNull) then    fVlrMargem     := qryVLRMARGEM.AsCurrency;
   if not(qryVLRMAXPERMIT.IsNull) then fVlrMaxPermit  := qryVLRMAXPERMIT.AsCurrency;

   (* só calcula o salário-base se não houver salário-base já preenchido -
      para o caso de se ter alterado "na mão" o salário-base na inscrição *)
   if qryVLRSALBASE.IsNull then begin

      (* Busca Salário Base do Participante *)
      if not(qryTipoContratoIDREGRASALBAS.IsNull) then begin

         fVlrSalBase := CalcEmptmo.BuscaSalarioBase(qryTipoContratoIDREGRASALBAS.AsInteger,
                                                    qryIDPESSOA.AsInteger,
                                                    fSalParticipacao,
                                                    fSalMantido,
                                                    fSalAuxDoenca,
                                                    fSalBenef,
                                                    True);
         if fVlrSalBase = -1 then begin
            Screen.Cursor := crDefault;
            EscondeEspera;
            fVlrSalBase := 0;
         end;
      end;

   end else begin
      fVlrSalBase := qryVLRSALBASE.AsCurrency;
   end;

   (* função da unit UCalcEmptmo que busca a Margem Consignável do participante *)
   edtValMargem.Value := CalcEmptmo.BuscaMargem(qryIDPESSOA.AsInteger, qryIDBENEF.AsInteger,
                                                qryTipoContratoIDREGRAMARGEM.AsInteger, fVlrSalBase,
                                                0, 0,
                                                fSalParticipacao, fSalMantido, fSalAuxDoenca,
                                                fSalBenef, True);

   if fVlrMargem = 0 then fVlrMargem := edtValMargem.Value;

   if fVlrMargem = -1 then begin
      Screen.Cursor := crDefault;
      EscondeEspera;
      fVlrMargem := 0;
   end;

   (* função da unit UCalcEmptmo que busca a Reserva de Poupança do participante
      ou do beneficiário, no caso do pensionista  *)
   edtValReserva.Value := CalcEmptmo.BuscaReserva(qryIDBENEF.AsInteger, qryIDPATRO.AsInteger,
                                                  qryIDPLANOPREV.AsInteger,
                                                  qryTipoContratoIDREGRARESERVA.AsInteger,
                                                  qryDATAINSC.AsDateTime, True);


   if edtValReserva.Value = -1 then begin
      Screen.Cursor := crDefault;
      EscondeEspera;
      edtValReserva.Value := 0;
   end;

   (* Procedure que decide qual a Taxa de Juros que vai ser utilizada, busca o
      Valor Máximo Possivel para o Empréstimo e Calcula Parcela
      Pré-requisitos:  Reserva de Poupança igual a Zero ou Maior *)

   SetTxJuros;

   if qry.State in dsEditModes then begin
      qryVLRSALBASE.AsCurrency   := fVlrSalBase;
      qryVLRMARGEM.AsCurrency    := fVlrMargem;
      qryVLRMAXPERMIT.AsCurrency := fVlrMaxPermit;
   end;

   (* Procedure que Calcula o Valor da parcela, verificando também se é atendida
      a Regra de Limites e calculando o valor Líquido do Empréstimo *)
   CalculaParcela;

end;



procedure TfrmCadInscricaoREFER.sbtnCancelarClick(Sender: TObject);
begin
   (* Procedure de Cancelamento de uma Inscrição.  Tem o mesmo efeito da procedure
      da Alteração da inscrição com a finalidade do usuário entrar com a data de
      Cancelamento e Motivo *)

   inherited;
   sbtnAlterarClick(Sender);

   (* Procedimento da unit UFuncoesEmptmo que recebe como parâmetro um componente
      Container (Panel, GroupBox, etc.) e habilita/desabilita o próprio componente
      e os componentes dentro dele, trocando inclusive a cor de Edits e Combobox *)
   AtualizaConjunto(True, pnlCancela);
end;



procedure TfrmCadInscricaoREFER.CmeCadastroConfirma(Sender: TObject);
begin
   try
      if qry.State in dsEditModes then begin

         (* É cancelamento de inscrição *)
         if qryDATACANCINSC.AsString <> '' then qryFLGSITUACAO.AsString := 'C';

      end;

      (* se for inserção, incluir o Fiário *)
      if qry.State = dsInsert then begin

         if ( ParametrosSistema ) and ( dtmEmptmo.qryParamEmptmoFLGUSAFIARIO.AsInteger = 1 ) then begin
            Fiario.IDPessoa      := qryIDBENEF.AsInteger;
            Fiario.IDTitular     := qryIDPESSOA.AsInteger;
            Fiario.IDUsuario     := Sistema.IdUsuario;
            Fiario.IDRubs        := 0;
            Fiario.IDGrupo       := 1;

            Fiario.Descricao     := 'Inscrição em Empréstimo';
            Fiario.DataInclusao  := SysDate;

            if not(Fiario.Inserir) then begin

               (* Fazer Confirma *)
               inherited;

            end else begin

               // Só faz Rollback se o controle de transacao for do Empréstimo
               if ( (dtmBaseDados.dbBaseDados.InTransaction) and not(bTransacaoAnterior) ) then begin
                  RollBackTransacao;
               end;

               Exit;

            end;

            
         end else begin

            (* Fazer Confirma *)
            inherited;

         end;

      end else begin

         (* Fazer Confirma *)
         inherited;

      end;

   except

   end;

end;



procedure TfrmCadInscricaoREFER.SetTxJuros;
begin
   (* Procedure que decide qual a Taxa de Juros que vai ser utilizada, busca o
      Valor Máximo Possivel para o Empréstimo e Calcula Parcela
      Pré-requisitos: Reserva de Poupança igual a Zero ou Maior *)

   (* Procedimento que armazena os dados da Inscrição num registro *)
   PreencheDadosContrato(qryNUMPARCELAS.AsInteger);

   (* função da unit UCalcEmptmo que busca a Taxa de Juros. Será utilizada
      a regra cadastrada na tabela TIPOCONTREMPTMO para buscar a Taxa de Juros *)

   edtPercentJuros.Value := CalcEmptmo.BuscaTxJuros(rNovoContrato,
                                                    qryTipoContratoIDREGRAJURCONC.AsInteger,
                                                    0,                          (* É parcela 0 na Concessão *)
                                                    rNovoContrato.DataCredito,
                                                    0,                          (* Taxa de Juros Anterior é 0 na concessão *)
                                                    rNovoContrato.VlrContrato,  (* SaldoDev Anterior = Vlr Solic na concessão*)
                                                    False (* Mostra *),
                                                    rNovoContrato.Indexador);

   if edtPercentJuros.Value = -1 then begin
      Screen.Cursor := crDefault;
      EscondeEspera;
      edtPercentJuros.Value := 0;
   end;


   (* função da unit UCalcEmptmo que busca o Valor Máximo Possivel para o Empréstimo
      o valor é armazenado no atributo interno FVlrSolic *)
   FVlrSolic := qryVLRSOLIC.AsCurrency;
   
   if fVlrMaxPermit = 0 then fVlrMaxPermit := FVlrSolic;
end;



procedure TfrmCadInscricaoREFER.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;
   (* habilita o painel de fundo (que contém o PageControl - orelhas) *)
   pnlFundo.Enabled := True;

   Case CmeCadastro.Operacao of

      opInserir, opAlterar:
      begin
         tbsGeral.Enabled      := False;
         pnlDados.Enabled      := False;
      end;

      opVazio:
      begin
         tbsGeral.Enabled      := False;
         pnlDados.Enabled      := False;

         edtCarencia.Clear;
         edtDataCredito.Clear;
         edtDataAssinatura.Clear;
         edtDataPrimParcela.Clear;

         LimpaParametros(qryContratosAnteriores);
         LimpaParametros(dtmLookEmptmo.qryLookDadosBancarios);

      end;

      else begin
         tbsGeral.Enabled      := False;
         pnlDados.Enabled      := False;
      end;

   end;(* case *)
end;



procedure TfrmCadInscricaoREFER.bbtnCancelarClick(Sender: TObject);
begin
   edtDataAssinatura.Date := SysDate;

   (* na herança - CmeCadastroCancel *)
   inherited;
end;



procedure TfrmCadInscricaoREFER.bbtnConfirmarClick(Sender: TObject);
begin
   try
      CmeCadastro.RepetirInsert := False;

      inherited;

   except

      on ev : EValidacao do begin
         Exit;
      end;

   end;
end;



procedure TfrmCadInscricaoREFER.SetParcelas(Num: Int64);
begin
   (* Procedure que ocorre no momento da escrita (WRITE) da propriedade pública
      NumParcelas que faz interface com o frmSimulacao retornando a quantidade
      de parcelas que o participante escolheu *)
   qryNUMPARCELAS.AsInteger := Num;
end;



procedure TfrmCadInscricaoREFER.SetNumParcelas;
var
   sSql     : String;
   qryAux   : TwwQuery;
begin
   (* Procedure que atualiza no SpinEdit do Número de Parcelas o Mínimo e Máximo
      de parcelas permitidas levando em consideração o Tipo de Contrato/Empréstimo *)

   (* Cria a Query Auxiliar *)
   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   try
      sSql :=
      'SELECT '                     + #13 +
      '  TCEMINPARC, TCEMAXPARC '   + #13 +
      'FROM '                       + #13 +
      '  TIPOCONTREMPTMO '          + #13 +
      'WHERE'                       + #13 +
      '  IDTIPOCONTREMPTMO = ' + qryIDTipoContrEmptmo.AsString + #13 +
      '  AND IDTIPOEMPTMO  = ' + qryTipoContratoIDTIPOEMPTMO.AsString;

      qryAux.SQL.Clear;
      qryAux.SQL.Add(sSql);
      qryAux.Open;

      if not qryAux.IsEmpty then begin

         DBspeParcelas.MinValue := qryAux.FieldByName('TCEMINPARC').AsInteger;
         DBspeParcelas.MaxValue := qryAux.FieldByName('TCEMAXPARC').AsInteger;
         if (DBspeParcelas.Text = '') or (DBspeParcelas.Text = '0') then begin
            qryNUMPARCELAS.AsFloat := DBspeParcelas.MaxValue;

            (* Procedimento que armazena os dados da Inscrição num registro *)
            PreencheDadosContrato(qryNUMPARCELAS.AsInteger);
         end;

      end else begin
         DBspeParcelas.MinValue := 1;
         DBspeParcelas.MaxValue := 999;
      end;

   finally
     qryAux.Free;
   end;
end;



procedure TfrmCadInscricaoREFER.CalculaParcela;
begin
   (* Procedure que Calcula o Valor da parcela, verificando também se é atendida
      a Regra de Limites e calculando o valor Líquido do Empréstimo *)

   (* Se o usuário ainda não preencheu o Valor solicitado, o procedimento é
      abortado*)
   if ((DBedtValorSolic.Text = '' ) or (DBedtValorSolic.Text = '0')) then Exit;

   (* Procedure que atualiza o valor da parcela e o valor Liquido EP diminuindo ou
      acrescentando ao valor solicitado os valores dos itens de concessão *)
   BuscaValorLiquidoEP;

   (* função da unit UCalcEmptmo que verifica se o participante atende Limites
      de concessão e limites de Quantidade e Prazos do Contrato/Empréstimo.
      O Atributo Flimites(PRIVATE) armazena o resultado da Regra de Limites *)
   bLimites := CalcEmptmo.BuscaLimites(rNovoContrato, 0, (* origem = Concessão *)
                                       qryIDSITPART.AsInteger,
                                       qryTipoContratoIDREGRALIMITES.AsInteger,
                                       dDataFinalBeneficio, edtValMargem.Value,
                                       edtValReserva.Value, 0,
                                       0, 0,
                                       True(* Mostra *));
end;



procedure TfrmCadInscricaoREFER.BuscaValorLiquidoEP;
var
   i, iMenorSeq   : Integer;
   sSQLItens      : String;
   sAnoMesCompet  : String;
begin
   bRegraErro     := False;
   qryItensConcessao.Close;

   (* Procedure que atualiza o valor da parcela e o valor Liquido EP diminuindo ou
      acrescentando ao valor solicitado os valores dos itens de concessão *)

   (* Procedimento que armazena os dados da Inscrição num registro *)
   PreencheDadosContrato(Trunc(DBspeParcelas.Value));

   sAnoMesCompet  := FormatDateTime('YYYYMM', rNovoContrato.DataAssinatura);

   (* Utiliza a função CalculaItens da unit UCalcEmptmo para pegar a parcela e
         os itens de concessão com seus respectivos valores, em relação ao número de
         parcelas escolhida pelo participante *)
   try
      CalcEmptmo.CalculaItens(rNovoContrato,
                              0, (* Tipo do item - É parcela 0 na Concessão *)
                              0, (* Origem - 0 na Inscrição *)
                              iPais, sEstado, iCidade,
                              0, (* Parcela ZERO = Concesão *)
                              qryIDSITPART.AsInteger,
                              (* Débito - Folha ou Contas a Receber *)
                              rNovoContrato.FlgFormaPag,
                              rNovoContrato.Txjuros,
                              0, (* Na concessão o Saldo Devedor inicia com Zero e depois de
                                 calculado será o Valor Solicitado *)
                              qryVLRSOLIC.AsCurrency (* Valor Solicitado *),
                              0, (* Saldo de Empréstimo Anteriores *)
                              edtValMargem.Value, edtValReserva.Value,
                              fSalParticipacao, fSalMantido, fSalAuxDoenca, fSalBenef, fVlrSalBase,
                              qryVLRMAXPERMIT.AsCurrency,
                              rNovoContrato.DataAssinatura, rNovoContrato.DataAssinatura,
                              sAnoMesCompet, False, True, False, vLista);
   except
      bRegraErro     := True;
      Exit;
   end;

   sSQLItens := '';


   iMenorSeq := 1000;
   (* determina o SEQCOBRANÇA + baixo da lista --> é o valor solicitado *)
   for i := 0 to High(vLista) do if vLista[i].SeqCalculo < iMenorSeq then iMenorSeq := vLista[i].SeqCalculo;


   (* Laço verificando se o item é parcela ou se é o Líquido concedido *)
   for i := 0 to High(vLista) do begin

      (* valor solicitado *)
      if ( (vLista[i].iEvento = 0) and (vLista[i].FlgCentraliza = 0) and (vLista[i].SeqCalculo = iMenorSeq) ) then begin

         if vLista[i].Valor > 0 then begin
            if qry.State in dsEditModes then qryVLRSOLIC.AsCurrency  := vLista[i].Valor;
         end else begin
            if qry.State in dsEditModes then qryVLRSOLIC.AsCurrency  := 0;
         end;

      end;

      (* é a Parcela *)
      if ( (vLista[i].iEvento = 1) and (vLista[i].FlgCentraliza = 1) ) then begin

         if vLista[i].Valor > 0 then begin
            edtValorParcela.Value := vLista[i].Valor;
         end else begin
            edtValorParcela.Value := 0;
         end;

      end;

      (* é um item de concessão, mas não o líquido *)
      if ( (vLista[i].iEvento = 0) and (vLista[i].FlgCentraliza = 0) ) then begin

         if length(sSQLItens) > 0 then sSQLItens := sSQLItens + 'UNION ' + #13;

         sSQLItens := sSQLItens +
         'SELECT '                                                      + #13 +
         '  ' + IntToStr(vLista[i].CodigoItem) + ' AS IDITEMEMPTMO, '   + #13 +
         '  ' + QuotedStr(vLista[i].Nome) + ' AS ITEM, '                + #13 +
         '  ' + OraNumero(FloatToStr(vLista[i].Valor)) + ' AS VALOR '   + #13 +
         'FROM DUAL '                                                   + #13;

      end;

   end; (* for *)

   (* abre - ou não - a query de itens *)
   try
      qryItensConcessao.SQL.Text := sSQLItens;
      qryItensConcessao.Open;
   except
      qryItensConcessao.Close;
      (* nada aqui, no caso de o sSQLItens ser Invalido *)
   end;
end;



procedure TfrmCadInscricaoREFER.DBedtValorSolicExit(Sender: TObject);
begin
   inherited;
   CalculaParcela;
end;



procedure TfrmCadInscricaoREFER.bbtnContratoClick(Sender: TObject);
begin
   (* Verifico se o usuário está inserindo ou alterando uma inscrição *)
   if qry.State in dsEditModes then begin

      (* Post *)
      bbtnConfirmarClick(Sender);

      (* Verifico se conseguiu dar o Post ou se ainda está inserindo ou alterando *)
      if qry.State in dsEditModes then Exit;

   end; (* if qry.State *)

   AtivaContrato;

   AcertaEdits;
end;



procedure TfrmCadInscricaoREFER.PreencheDadosContrato(iNumParcela : Integer);
var
   iContador   : Integer;
   qryAux      : TwwQuery;
   sSQL        : String;
begin
   (* Procedimento que armazena os dados da Inscrição num registro *)

   LimpaRegistroContrato(rNovoContrato);

   (* É nulo na Concessão *)
   rNovoContrato.IDContrQuitacao := -1;

   rNovoContrato.IdPessoa          := qryIDPESSOA.AsInteger;
   rNovoContrato.IDTipoContrEmptmo := qryIDTIPOCONTREMPTMO.AsInteger;
   rNovoContrato.IDTipoEmptmo      := qryTipoContratoIDTIPOEMPTMO.AsInteger;
   rNovoContrato.IdPlanoPrev       := qryIDPLANOPREV.AsInteger;
   rNovoContrato.IdPatro           := qryIDPATRO.AsInteger;
   rNovoContrato.Indexador         := qryMOECODIGO.AsInteger;

   try
      qryAux               := TwwQuery.Create(Application);
      qryAux.DatabaseName  := 'BASEDADOS';

      sSQL := 'SELECT MOESIGLA FROM MOEDA WHERE MOECODIGO = ' + IntToStr(rNovoContrato.Indexador);

      qryAux.Sql.Text := sSQL;
      qryAux.Open;

      rNovoContrato.SiglaIndexador := qryAux.FieldByName('MOESIGLA').AsString;
   finally
      qryAux.Close;
      qryAux.Free;
   end;

   (* Número da Inscrição *)
   rNovoContrato.IDInscricaoEmptmo := qryIDInscricaoEmptmo.AsInteger;

   (* É nulo *)
   rNovoContrato.IDVerba := -1;

   (* Beneficiário do Contrato
      IDBENEF = IDPESSOA -> do Titular no caso de estar vivo
      e do Beneficiário no caso de Pensionista *)
   rNovoContrato.IdBenef          := qryIDBENEF.AsInteger;

   rNovoContrato.FlgSuspensaoAuto := qryFLGSUSPENSAOAUTO.AsInteger;

//   if qryFLGFORMAPAG.AsString = 'C' then begin
   if not(qryIDCBANCARIA.IsNull) then begin
      rNovoContrato.IDCBancaria := dsBanco.DataSet.FieldByName('IDCBANCARIA').AsInteger;
   end else begin
      (* É nulo *)
      rNovoContrato.IDCBancaria := -1;
   end;

   (* É nulo *)
   if qryCODFORMAPAG.AsString <> '' then begin
      rNovoContrato.CodFormaPag  := qryCODFORMAPAG.AsInteger;
   end else begin
      rNovoContrato.CodFormaPag  := -1;
   end;

   if qryPORTFORMAPAG.AsString <> '' then begin
      rNovoContrato.PortFormaPag := qryPORTFORMAPAG.AsInteger;
   end else begin
      rNovoContrato.PortFormaPag := -1;
   end;

   if qryPORTFORMAREC.AsString <> '' then begin
      rNovoContrato.PortFormaRec := qryPORTFORMAREC.AsInteger;
   end else begin
      rNovoContrato.PortFormaRec := -1;
   end;

   rNovoContrato.VlrReserva      := edtValReserva.Value;

   rNovoContrato.NumParcelas     := iNumParcela;               (* Número de Parcelas *)
   rNovoContrato.DataCredito     := edtDataCredito.Date;       (* Data em que o empréstimo será creditado *)
   rNovoContrato.DataSituacao    := trunc(SysDate);            (* Data da Situação do Contrato como data do Sistema *)
   rNovoContrato.DataAssinatura  := edtDataAssinatura.Date;    (* Data de Assinatura do Contrato como data do Sistema *)
   rNovoContrato.DataPrimParc    := edtDataPrimParcela.Date;   (* Data do pagamento da Primeira Parcela do Contrato *)
   rNovoContrato.DataInscricao   := DBedtDataInsc.Date;        (* Data da Solicitação - Inscrição *)
   rNovoContrato.DataCanc        := -1;                        (* Data nula *)
   rNovoContrato.VlrContrato     := qryVLRSOLIC.AsFloat;       (* Valor do Contrato *)
   rNovoContrato.VlrParcela      := edtValorParcela.Value;     (* Valor da Parcela *)
   rNovoContrato.Txjuros         := edtPercentJuros.Value;     (* Taxa de Juros do Contrato *)

   rNovoContrato.VlrSalBase      := qryVLRSALBASE.AsCurrency;
   rNovoContrato.VlrMargem       := qryVLRMARGEM.AsCurrency;
   rNovoContrato.VlrMaxPermit    := qryVLRMAXPERMIT.AsCurrency;


   (****************************************************************************
    * FLGSITUACAO = 'A' -> 'Ativo'             -> Em curso normal              *
    *               'C' -> 'Cancelado'         -> por opção do usuário         *
    *               'E' -> 'Encerrado'         -> por quitacao no prazo normal *
    *               'K' -> 'Pend. de Quitação' -> Envio p/ cobrança            *
    *               'Q' -> 'Quitado'           -> por quitacao solicitada      *
    *               'S' -> 'Suspenso'          -> Inadimplencia                *
    ****************************************************************************)
   rNovoContrato.FlgSituacao := 'A';

   (* FLGFORMAREC = C -> indicando que o Débito é pelo Contas a Receber
                    F -> indicando que o Débito é pela Folha *)
   rNovoContrato.flgFormaRec := qryFLGFORMAREC.AsString;


   (* FLGFORMAPAG = C -> indicando que o Crédito é pelo Contas a Pagar
                    F -> indicando que o Crédito é pela Folha *)
   rNovoContrato.flgFormaPag := qryFLGFORMAPAG.AsString;

   (* Guarda os beneficiários do seguro *)
   iContador := 0;

end;



procedure TfrmCadInscricaoREFER.AtivaContrato;
var
   bErro             : Boolean;
   sMensErro         : String;
   iResult           : Integer;
   iPlanilhaResult   : Integer;
   sResult, sErro    : TStringList;
   iContador         : Integer;
   iIdHistMovEmptmo  : Int64;
   i                 : Integer;
   dDataInicioSusp   : TDateTime;
   dDataFimSusp      : TDateTime;
begin
   (* Procedimento que usa a função GravaContrato da unit UCalcEmptmo que insere os dados
      na tabela Contrato e se obtiver sucesso Contabiliza o Contrato *)

   bErro       := False;
   sMensErro   := '';
   sResult     := TStringList.Create;
   sErro       := TStringList.Create;

   (* planilha nova a cada Contrato *)
   iPlanilhaResult := 0;


   if ParametrosSistema then begin

      case dtmEmptmo.qryParamEmptmoFLGDATAATUSLD.AsInteger of
        0: dDataUltAtualiza := edtDataCredito.Date;
        1: dDataUltAtualiza := edtDataPrimParcela.Date;
        (* Função da unit UDiasUteis. Volta 1 mês em relação a data da Primeira Parcela *)
        2: dDataUltAtualiza := DiasUteis.SomaMeses(rNovoContrato.DataPrimParc, - 1);
      end;

   end;


   (* Procedimento que armazena os dados da Inscrição num registro *)
   PreencheDadosContrato(qryNUMPARCELAS.AsInteger);

   (* Preenche o registro com os dados da suspensão *)
   // Inicia uma transação - só se não ouver transação iniciada
   if not(dtmBaseDados.dbBaseDados.InTransaction) then begin
      StartTransacao;
      bTransacaoAnterior := False;
   end;

   try

      try

         if not(CalcEmptmo.GravaContrato(rNovoContrato)) then begin
            (* Gravação do Contrato com Erro *)
            bErro       := True;
            sMensErro   := '[ Gravação do Contrato ]';
         end; (* if GravaContrato *)

        (*******************************************************************************
         |                   HISTÓRICO  DO  EMPRÉSTIMO  ATUAL                          |
         |                                                                             |
         | função que varre a lista de itens de um contrato e se for o caso,           |
         |  chama a função que grava o Histórico do Movimento na tabela HISTMOVEMPTMO. |
         |  A saída será True se a operação foi bem sucedida e False caso negativo     |
         *******************************************************************************)

         // Baixa itens Hist

         if not bErro then begin
            if not(CalcEmptmo.GravaMovEmptmo(rNovoContrato, vLista,
                                          0, (* Evento 0 - Concessão *)
                                          0, (* Será Parcela de número 0 - Zero *)
                                          DiasUteis.ExtraiAno(rNovoContrato.DataCredito), (* Ano Competência - Ano da Data de Crédito do Novo Contrato *)
                                          DiasUteis.ExtraiMes(rNovoContrato.DataCredito), (* Mês Competência - Mês da Data de Crédito do Novo Contrato *)
                                          DiasUteis.ExtraiAno(rNovoContrato.DataCredito), (* Ano Cobrança - Ano da Data de Crédito do Novo Contrato *)
                                          DiasUteis.ExtraiMes(rNovoContrato.DataCredito), (* Mês Cobranca - Mês da Data de Crédito do Novo Contrato *)
                                          rNovoContrato.NumParcelas, (* Parcelas Remanescentes *)
                                          rNovoContrato.DataCredito, (* DataPrevista -> Data do Crédito*)
                                          dDataUltAtualiza,
                                          '',
                                          True,
                                          iIdHistMovEMptmo)) then
            begin

               (* Gravação do Histórido dos Itens de Contrato com Erro *)
               bErro       := True;
               sMensErro   := '[ Gravação do Histórido dos Itens de Contrato ]';
            end; (* if GravaMovEmptmo *)
         end;


        (**************************************************************
         |                    ENVIO CAP ou FOLHA                      |
         **************************************************************)

         if not bErro then begin
            if ( rNovoContrato.flgFormaPag = 'C' ) then begin

               (* FLGFORMAPAG = 'C' -> indicando que o Crédito é pelo Contas a Pagar *)
               iResult := EnviaContratoCAPCAR(iPlanilhaResult, '', sResult, sErro);

               if iResult <> 0 then begin

                  (* Envio CAP com Erro *)
                  bErro := True;

                  case iResult of
                  (* Códigos de retorno (controle de erro):
                      0 : Envio(s) realizados com sucesso *)
                     -1 : sMensErro := '[ ERRO ao tentar selecionar os itens a enviar ao CAP/CAR ]';
                     -2 : sMensErro := '[ Query não retornou itens a Enviar ao CAP/CAR ]';
                     -3 : sMensErro := '[ ERRO ao inserir Documento no CAP/CAR ]';
                     -4 : sMensErro := '[ ERRO no Rateio do Documento no CAP/CAR ]';
                     -5 : sMensErro := '[ ERRO ao Lançar Documento no CAP/CAR ]';
                     -6 : sMensErro := '[ ERRO ao inserir Mensagens no Documento ]';
                     -7 : sMensErro := '[ ERRO ao Atualizar Histórico com o Documento no CAP/CAR ]';
                     -8 : sMensErro := '[ Processo interrompido pelo usuário sem envio ao CAP/CAR ]';
                  end;(* case *)

                  if sErro.Count > 0 then begin
                     sMensErro := sMensErro + #13 + sErro.Strings[sErro.Count -1];
                  end;

               end; (* if Result CAP *)

            (***************************************************************************)
            (* FLGFORMAPAG = 'F' -> indicando que o Crédito é pela Folha
               NADA é feito na Concessão.  O Contrato será enviado para TMPDESC
               pela rotina do ENVIO *)
            (***************************************************************************)

            end; (* if FlgFormaPag *)
         end;


         (* Atualiza a Situação da Inscrição
            (FLGSITUACAO) = 'E' -> 'Contrato Associado' -> Já utilizada em contrato *)
         if not bErro then begin
            if not(CalcEmptmo.AtualizaFlgSituacao(rNovoContrato.IDInscricaoEmptmo, 'INSCRICAOEMPTMO',
                                                  'E', sMensErro)) then
            begin
               (* Atualização da Situação da Inscrição com Erro *)
               bErro := True;
               sMensErro := '[ Atualização da Situação da Inscrição ]' + #13 + sMensErro;
            end; (* if Atualiza Flag Situação da Inscrição *)
         end;
      except

         // Houve erro - Desfaz a transação (só se não houver transacao anterior)
         if ( (dtmBaseDados.dbBaseDados.InTransaction) and not(bTransacaoAnterior) ) then begin
            RollBackTransacao;
         end;

      end;

   finally

      if bErro then begin

         // Houve erro - Desfaz a transação (só se não houver transacao anterior)
         if ( (dtmBaseDados.dbBaseDados.InTransaction) and not(bTransacaoAnterior) ) then begin
            RollBackTransacao;
         end;

         memErro.Lines.Add(qryIDINSCRICAOEMPTMO.AsString + ' ' + sMensErro);
         Inc(iTotalNGrav);
      end else begin

         (* Não Houve erro - Finaliza a transação *)

         // Só "commita" se não houver transacao anterior
         if ( (dtmBaseDados.dbBaseDados.InTransaction) and not(bTransacaoAnterior) ) then begin
            CommitTransacao;
         end;

         Inc(iTotalGrav);

         memResult.Lines.Add(IntToStr(rNovoContrato.IDContratoEmptmo) + ' [ Contrato gerado ]' );


         qryItensConcessao.Close;
         qryAvalista.Close;
         qryBenefSeguro.Close;
         qryContratosAnteriores.Close;
         qry.Close;

      end;(* if bErro *)

      sResult.Free;
      sErro.Free;

   end; (* try..finally *)
end;



function TfrmCadInscricaoREFER.ContabilizaContrato(const iContrato: Int64; sMensagem, sTipoMov: String;
                                              var iPlanilhaResult: Integer;
                                              var sResult, sErro : TStringList): Integer;
var
   sSql: String;
begin
   sSql :=
   'SELECT '                                                                                 + #13 +
   '  HME.IDHISTMOVEMPTMO  , HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO, '                       + #13 +
   '  HME.HMEFORMACOBRANCA , HME.HMEVLRPREVISTO  , '                                         + #13 +
   '  CNT.IDTIPOCONTREMPTMO, CNT.IDPLANOPREV     , CNT.IDPATRO, '                            + #13 +
   '  ITC.TIPCODIGO '                                                                        + #13 +

   'FROM '                                                                                   + #13 +
   '  HISTMOVEMPTMO   HME, '                                                                 + #13 +
   '  CONTRATOEMPTMO  CNT, '                                                                 + #13 +
   '  ITEMXTIPOCONTR  ITC, '                                                                 + #13 +
   '  TIPOCONTREMPTMO TIP, '                                                                 + #13 +
   '  TIPOEMPTMO      TEM '                                                                  + #13 +

   'WHERE '                                                                                  + #13 +
   '      ( HME.IDCONTRATOEMPTMO  = ' + IntToStr(iContrato) + ' ) '                          + #13 +
   '  AND ( TEM.IDEMPRESAPROP     = 1 ) '                                                    + #13 +
   '  AND ( (HME.HMECENTRALIZA    = 0) OR (HME.HMECENTRALIZA IS NULL) )'                     + #13 +
   '  AND ( HME.HMETIPOMOV        = ' + sTipoMov + ' ) '                                     + #13 +
   '  AND ( HME.IDCONTRATOEMPTMO  = CNT.IDCONTRATOEMPTMO  ) '                                + #13 +
   '  AND ( CNT.IDTIPOCONTREMPTMO = TIP.IDTIPOCONTREMPTMO ) '                                + #13 +
   '  AND ( TIP.IDTIPOEMPTMO      = TEM.IDTIPOEMPTMO ) '                                     + #13 +
   '  AND ( CNT.IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO ) '                                + #13 +
   '  AND ( HME.IDITEMEMPTMO      = ITC.IDITEMEMPTMO ) '                                     + #13 +
   '  AND ( ITC.IDTIPOCONTREMPTMO = TIP.IDTIPOCONTREMPTMO )';

   sMensagem := sMensagem + ' - ' + 'Contrato nº ' + IntToStr(iContrato);

   Result := IntegraEmptmo.ContabilizaItens('C', 'N', sSql, sMensagem,	   (* Histórico *)
                                            rNovoContrato.DataCredito,	   (* Data do Lançamento *)
                                            sResult (* Acertos *), sErro   (* Erros *),
                                            iPlanilhaResult); 				   (* Planilha *)
end;




function TfrmCadInscricaoREFER.EnviaContratoCAPCAR(var   iPlanilha  : Integer;
                                              const sNomePatro : String;
                                              var   sResult    : TStringList;
                                              var   sErro      : TStringList
                                              ): Integer;
var
   sSql: String;
begin
   sSql :=
   'SELECT '                                                                                 + #13 +
   '  HME.IDHISTMOVEMPTMO  , HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO  , '                     + #13 +
   '  HME.HMEFORMACOBRANCA , HME.IDITEMCENTRALIZA, HME.HMEVLRPREVISTO, '                     + #13 +
   '  HME.HMEDATAPREVISTA  , HME.HMEDATAVENCTO, HME.HMESALDODEV, '                           + #13 +

   '  (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00''))))'                                + #13 +
   '  || ''/'' ||'                                                                           + #13 +
   '  (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000'')))) AS ANOMESCOMPETENCIA, '       + #13 +

   '  HME.HMERECPAG        , ITC.CONTABAIXA      , ITC.TIPCODIGO     , '                     + #13 +
   '  CNT.IDPLANOPREV      , CNT.IDPATRO         , CNT.IDBENEF, CNT.IDPESSOA, '              + #13 +
   '  CNT.CODFORMAPAG      , CNT.PORTFORMAPAG    , CNT.PORTFORMAREC  , '                     + #13 +
   '  CNT.IDTIPOSUSPEMPTMO , ITC.ITCTRATASALDODEV, '                                         + #13 +
   '  TIP.IDTIPOCONTREMPTMO, IRC.ITEDESCRICAO, '                                             + #13 +
   '  INS.IDCBANCARIA '                                                                      + #13 +

   'FROM '                                                                                   + #13 +
   '  HISTMOVEMPTMO   HME, '                                                                 + #13 +
   '  CONTRATOEMPTMO  CNT, '                                                                 + #13 +
   '  ITEMXTIPOCONTR  ITC, '                                                                 + #13 +
   '  TIPOCONTREMPTMO TIP, '                                                                 + #13 +
   '  TIPOEMPTMO      TEM, '                                                                 + #13 +
   '  ITEMEMPTMO      IRC,'                                                                  + #13 +
   '  INSCRICAOEMPTMO INS '                                                                  + #13 +

   'WHERE '                                                                                  + #13 +
   '  ( HME.IDCONTRATOEMPTMO = '+ IntToStr(rNovoContrato.IDContratoEmptmo) + ' ) '           + #13 +
   '  AND ( TEM.IDEMPRESAPROP    = 1 ) '                                                     + #13 +
   '  AND ( HME.HMECENTRALIZA    = 1 ) '                                                     + #13 +
   '  AND ( HME.IDCONTRATOEMPTMO  = CNT.IDCONTRATOEMPTMO  ) '                                + #13 +
   '  AND ( CNT.IDTIPOCONTREMPTMO = TIP.IDTIPOCONTREMPTMO ) '                                + #13 +
   '  AND ( TIP.IDTIPOEMPTMO      = TEM.IDTIPOEMPTMO ) '                                     + #13 +
   '  AND ( CNT.IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO ) '                                + #13 +
   '  AND ( ITC.IDITEMEMPTMO      = IRC.IDITEMEMPTMO ) '                                     + #13 +
   '  AND ( ITC.IDITEMEMPTMO      = HME.IDITEMEMPTMO )'                                      + #13 +
   '  AND ( CNT.IDINSCRICAOEMPTMO = INS.IDINSCRICAOEMPTMO )';

   Result := IntegraEmptmo.EnviaCAPCAR(sSql,
                                       'Concessão de Empréstimo - ', // IntToStr(rNovoContrato.IDContratoEmptmo),
                                       sNomePatro, // Patrocinadora
                                       rNovoContrato.DataCredito,
                                       -1,
                                       iMoedaCorrente,
                                       sCCusto,
                                       iPrograma,
                                       iPlanilha,
                                       sResult,
                                       sErro
                                       );
end;



procedure TfrmCadInscricaoREFER.AcertaDatas;
begin
   (* Procedimento que acerta as Datas de Crédito, Data da Primeira Parcela e
      Calcula a Carência utilizando a função BuscaData da unit UCalcEmptmo *)

   (* Verifico se a query está em navegação (Browse), edição ou inserção,
      caso negativo o procedimento será abortado *)
   if qryDATAINSC.AsString = '' then Exit;

   try

      edtDataCredito.ReadOnly := False;

      if not(qryTipoContratoIDREGRADATACRED.IsNull) then begin
         (* função da unit UCalcEmptmo que utiliza a regra para data de crédito *)
         edtDataCredito.Date     := CalcEmptmo.BuscaDataCredito(qryTipoContratoIDREGRADATACRED.AsInteger,
                                                                DBedtDataInsc.Date,
                                                                edtDataAssinatura.Date,
                                                                qryTipoContratoIDTIPOEMPTMO.AsInteger,
                                                                qryTipoContratoIDTIPOCONTREMPTMO.AsInteger,
                                                                False);
      end else
         (* função da unit UCalcEmptmo que utiliza a função CritDataEmptmo da unit
            UFuncoesEmptmo que busca a data em que o empréstimo será creditado em
            relação a data de solicitação.   É levado em consideração a
            Patrocinadora e data de crédito *)
         edtDataCredito.Date := CalcEmptmo.BuscaData('C', (* Crédito *) qryFLGFORMAPAG.AsString,
                                                     qryFLGINTERNO.AsString, qryIDPATRO.AsInteger,
                                                     qryIDPLANOPREV.AsInteger, 0, (* Parcela *)
                                                     edtDataAssinatura.Date);

      (* atributo interno (PRIVATE) que guarda a Data de Crédito Parametrizada
         pelo Sistema *)
      dDataCredito := edtDataCredito.Date;

   except  (* a exceção ocorre quando se tenta alterar a data do crédito para menos que a propriedade MinDate do edtDataCredito *)

      edtDataAssinatura.Date := dDataAssinatura;
      Exit;

   end;(* try *)

   (* Procedimento que acerta a Data da Primeira Parcela e Calcula a Carência
      utilizando a função BuscaData da unit UCalcEmptmo *)
   AcertaDataPrimParcela;
end;



procedure TfrmCadInscricaoREFER.AcertaDataPrimParcela;
begin
   (* Procedimento que acerta a Data da Primeira Parcela e Calcula a Carência
      utilizando a função BuscaData da unit UCalcEmptmo *)

   (* função da unit UCalcEmptmo que utiliza a função CritDataEmptmo que busca
      a data em que será paga a 1º parcela do empréstimo em relação a data de
      Crédito. É levado em consideração a Patrocinadora e data de inscrição *)
   edtDataPrimParcela.Date := CalcEmptmo.BuscaData('N', (* Normal *) qryFLGFORMAREC.AsString,
                                                   qryFLGINTERNO.AsString, qryIDPATRO.AsInteger,
                                                   qryIDPLANOPREV.AsInteger,
                                                   0, (* parcela 0 = concessão *)
                                                   edtDataCredito.Date);

   (* Calcula a Carência, isto é, quantos dias vão faltar para o dia do pagamento
      da Primeira Parcela do Empréstimo *)
   edtCarencia.Text := IntToStr(Trunc(edtDataPrimParcela.Date - edtDataCredito.Date));
end;



procedure TfrmCadInscricaoREFER.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qryTipoContrato.Close;
   qryContratosAnteriores.Close;

   with dtmLookEmptmo do begin
      LimpaParametros(qryLookFormaRecPag);
      LimpaParametros(qryLookDadosBancarios);
      LimpaParametros(qryLookPortadorFormaP);
      LimpaParametros(qryLookPortadorFormaR);
   end;

   Fiario.Free;

   inherited;
end;



procedure TfrmCadInscricaoREFER.SetValorSolic(const Valor: Currency);
begin
   if qry.State in dsEditModes then begin
      qryVLRSOLIC.AsFloat := Valor;

      (* Procedure que Calcula o Valor da parcela, verificando também se é atendida
         a Regra de Limites e calculando o valor Líquido do Empréstimo *)
      CalculaParcela;
   end;
end;



procedure TfrmCadInscricaoREFER.DBspeParcelasEnter(Sender: TObject);
begin
   inherited;
   fParcelaAnt := DBspeParcelas.Value;
end;



procedure TfrmCadInscricaoREFER.DBgrdDivEmpCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;

   (* faz com que as linhas do grid tenham cores alternadas *)
   if State <> [gdSelected] then begin
      if not Highlight then begin
         (* linhas ímpares = amarelo, linhas pares = branco *)
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; (* amarelo bebê *)
         end else begin
            ABrush.Color := clWhite;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmCadInscricaoREFER.DBgrdDivEmpTopRowChanged(Sender: TObject);
begin
   inherited;

   (* acerta as cores quando muda a linha da grid *)
   (Sender as TwwDBGrid).Invalidate;
end;







procedure TfrmCadInscricaoREFER.CmeCadastroDelete(Sender: TObject);
begin
   try
      (* Delete na query *)
      inherited;
   finally
      (* Procedure que acerta os Edits das Datas que não são ligados a Banco de Dados *)
      AcertaEdits;
   end;
end;



procedure TfrmCadInscricaoREFER.DBgrdItensConcessaoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;

   (* faz com que as linhas do grid tenham cores alternadas *)
   if State <> [gdSelected] then begin
      if not Highlight then begin
         (* linhas ímpares = amarelo, linhas pares = branco *)
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; (* amarelo bebê *)
         end else begin
            ABrush.Color := clWhite;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmCadInscricaoREFER.DBgrdItensConcessaoTopRowChanged(Sender: TObject);
begin
   inherited;
   (* acerta as cores quando muda a linha da grid *)
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmCadInscricaoREFER.DBedtValorSolicEnter(Sender: TObject);
begin
   inherited;
   fVlrAnterior := qryVLRSOLIC.AsCurrency;
end;



procedure TfrmCadInscricaoREFER.dsStateChange(Sender: TObject);
begin
   inherited;

   if qry.State in dsEditModes then begin
      qryVLRSALBASE.AsCurrency   := fVlrSalBase;
      qryVLRMARGEM.AsCurrency    := fVlrMargem;
      qryVLRMAXPERMIT.AsCurrency := fVlrMaxPermit;
   end;
end;


procedure TfrmCadInscricaoREFER.DBEdtSalarioBaseEnter(Sender: TObject);
begin
   inherited;
   fVlrSalarioAnt := qryVLRSALBASE.AsCurrency;
end;



procedure TfrmCadInscricaoREFER.FormShow(Sender: TObject);
begin
   inherited;

   // A princípio, supõe-se que já existe transacao - anterior - em progresso
   bTransacaoAnterior := True;

   ParametrosSistema;

   chkTRAVARDATAS.Checked  := (dtmEmptmo.qryParamEmptmoFLGTRAVARDATA.AsInteger <> 1);

   iPais       := dtmEmptmo.qryParamEmptmoIDPAIS.AsInteger;
   sEstado     := dtmEmptmo.qryParamEmptmoCODESTADO.AsString;
   iCidade     := dtmEmptmo.qryParamEmptmoIDCIDADES.AsInteger;
   iPrograma   := dtmEmptmo.qryParamEmptmoIDPROGRAMA.AsInteger;
   sCCusto     := dtmEmptmo.qryParamEmptmoCODCENTROCUSTO.AsString;

   if not(dtmEmptmo.qryParamEmptmoFLGSALDODEVANT.isNULL) then begin
      case dtmEmptmo.qryParamEmptmoFLGSALDODEVANT.AsInteger of
         0: sDiaSldDev := 'C';
         1: sDiaSldDev := 'A';
      end;
   end;

   with dtmEmptmo.qryParamGlobal do begin
      LimpaParametros(dtmEmptmo.qryParamGlobal);
      ParamByName('PIDPESSOA').asInteger := Sistema.idEmpresa;
      Open;

      if not(dtmEmptmo.qryParamGlobal.isEmpty) then iMoedaCorrente := dtmEmptmo.qryParamGlobalMOEDACORRENTE.asInteger;
   end;
end;


procedure TfrmCadInscricaoREFER.btnContinuarClick(Sender: TObject);
var sArquivo: TextFile;
    sLinha  : String;
    i       : Integer;
begin
  inherited;

  if OpenDialog.Execute then begin
     AssignFile(sArquivo,OpenDialog.FileName);
     Reset(sArquivo);
     qryArquivoLido.Open;

     while not eof(sArquivo) do begin
        ReadLn(sArquivo,sLinha);

        LimpaParametros(qryInscricaoLote);
        qryInscricaoLote.ParamByName('PIDINSCRICAOEMPTMO').AsInteger := StrToInt(Copy(sLinha,1,6));
        qryInscricaoLote.Open;

        qryArquivoLido.Insert;
        qryArquivoLido.FieldByName('IDINSCRICAOEMPTMO').AsString := Copy(sLinha,1,6);
        qryArquivoLido.FieldByName('OPCAO').AsString             := Copy(sLinha,7,1);
        qryArquivoLido.FieldByName('NOME').AsString              := qryInscricaoLoteNOME.AsString;
        qryArquivoLido.Post;
     end;

     qryArquivoLido.First;
     MostraFormProgresso('Geração de Contratos',0,qryArquivoLido.RecordCount,True,False);
     iTotalGrav  := 0;
     iTotalNGrav := 0;

     while not qryArquivoLido.eof do begin
        Inc(i);
        AndaFormProgresso(i);
        iIdInscricaoEmptmo := qryArquivoLido.FieldByName('IDINSCRICAOEMPTMO').AsInteger;
        iOpcao             := qryArquivoLido.FieldByName('OPCAO').AsInteger;

        LimpaParametros(qryInscricaoLote);
        qryInscricaoLote.ParamByName('PIDINSCRICAOEMPTMO').AsInteger := iIdInscricaoEmptmo;
        qryInscricaoLote.Open;

        CmeCadastroFind(Self);

        if qryFLGSITUACAO.AsString = 'A' then begin

           if SysDate <= (qryDATAVALIDADE.AsDateTime + qryTipoContratoTCEDIASTOLERAINSC.AsInteger) then begin

              edtDataAssinatura.Date := SysDate;

              sbtnAlterar.Click;

              case iOpcao of
                 1 : qryVLRSOLIC.AsCurrency := qryInscricaoLoteVALORBRUTO1.AsCurrency;
                 2 : qryVLRSOLIC.AsCurrency := qryInscricaoLoteVALORBRUTO2.AsCurrency;
                 3 : qryVLRSOLIC.AsCurrency := qryInscricaoLoteVALORBRUTO3.AsCurrency;
              end;

              bbtnContratoClick(Self);
           end;
        end;

        qryArquivoLido.Next;
     end;

     EscondeFormProgresso;
     ntbPrincipal.PageIndex := 1;
     CloseFile(sArquivo);
  end;
end;



end.
