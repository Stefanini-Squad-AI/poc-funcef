unit FCadImovel;

//	------------------------------------------------------------------------------------------------
//
//	   Cadastro de Imóveis
//
//	Autor          :  André Pontes
//	Data de Início	:  19/01/1999
//	Data de Término:  25/01/1999
//
//	Modificações	:  29/01/1999  - Mudança dos "Prepare" para o formShow
//                               - Filtragem por idPessoa (EmpresaProp) no MontaSelect
//      22/02/1999 e 23/02/1999  - btnBuscaImovelMestre
//                               - Ajustes gerais
//                   03/03/1999  - Marca / Franquia
//                   08/03/1999  - Gravação de NULL quando combos estiverem em branco
//                   30/03/1999  - Imovel como sub-tipo de Investimento
//                               - Alteração na ordem de exibição no MontaSelect
//                   05/04/1999  - Alteração das dimensões do form (não estava cabendo na tela)
//                   21/05/1999  - Inclusão de Sub-Conta
//                   28/02/2000  - Correção do cadastro de indicadores quando estes não forem monetários
//      28/02/2000 a 03/03/2000  - Valor de aquisição, junto com data e moeda
//                               - Matrícula e Cartório (esse apenas previsão)
//                   08/03/2000  - Novo campo: Data do Habite-se
//                   27/03/2000  - Exibição do histórico de Eventos
//                               - Fim da procedure PreparaQueries
//                   07/05/2000  - Retirada dos cadastros de Outros Proprietários e Indicadores
//                               - Exibição dos Indicadores e Dados Compelementares
//                   12/05/2000  - Novo campo: código do Imóvel
//
//                      ...
//
//                   29/08/2000  - Novos campos: Área Gerencial e Valores (Reavaliação e Mercado)
//                   31/08/2000  - Procedure FechaQueries no novo padrão
//                               - Fim da qryLookImovel (alimentava ImovelMestre)
//                   15/09/2000  - Conserto do MontaSelect de Imóvel Mestre
//                               - Atualização da ocupação dos Imóveis no FormClose
//                   23/02/2001  - Novos campos: IMOVAGAS e IMOAREACOMUM
//
// -------------------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TB97, TabControlDetalhe, ExtCtrls, Mask, wwdbedit, DBCtrls,
  TREdit, Wwdbgrd2, DBCtrls2, wwdblook, wwriched,
  Menus, IvDictio, IvMulti, IvEMulti, Wwdotdot, Wwdbcomb, fcButton,
  fcImgBtn, fcShapeBtn, FCadastroMestreDetImob, wwdbdatetimepicker,
  CMDateTimePicker, CmEventosCadastro, ImgList, FCadMestreDetCS
  {$IFNDEF VERSAO0505}, uCMTypes {$ENDIF};

type
  TfrmCadImovel = class(TfrmCadMestreDetalheCS)
    tbsDescricao: TTabSheet;
    tbsEndereco: TTabSheet;
    DBedtLogradouro: TDBEdit2;
    Label7: TLabel;
    DBedtComplemento: TDBEdit2;
    DBedtNumero: TDBEdit2;
    Label8: TLabel;
    Label9: TLabel;
    DBedtBairro: TDBEdit2;
    Label10: TLabel;
    Label11: TLabel;
    DBedtCidade: TDBEdit2;
    DBedtCEP: TDBEdit2;
    Label12: TLabel;
    DBedtNomeEndereco: TDBEdit2;
    Label13: TLabel;
    DBmemDescricaoImovel: TwwDBRichEdit;
    qryDetCaracteristicas: TwwQuery;
    updDetCaracteristicas: TUpdateSQL;
    qryDetContratos: TwwQuery;
    dsContratos: TwwDataSource;
    qryDetCaracteristicasIDIMOVEL: TFloatField;
    qryDetCaracteristicasIDCATEGORIAIMOVEL: TFloatField;
    qryLookCaracteristicas: TwwQuery;
    qryDetCaracteristicasDESCRICAO: TStringField;
    qryLookCaracteristicasIDCATEGORIAIMOVEL: TFloatField;
    qryLookCaracteristicasCTIDESCRICAO: TStringField;
    qryDetContratosIDIMOVEL: TFloatField;
    qryDetContratosIDCONTRATOIMOVEL: TFloatField;
    qryDetContratosMOECODIGO: TFloatField;
    qryDetContratosCIMVLRALUGUEL: TFloatField;
    qryDetContratosCONNOME: TStringField;
    qryDetContratosCONDATAINICIO: TDateTimeField;
    qryDetContratosCONDATAFIM: TDateTimeField;
    qryDetContratosIDLOCATARIO: TFloatField;
    qryDetContratosMOESIGLA: TStringField;
    qryDetContratosNOME: TStringField;
    qryLookEstado: TwwQuery;
    Label17: TLabel;
    Label18: TLabel;
    qryLookEstadoCODESTADO: TStringField;
    qryLookEstadoIDPAIS: TFloatField;
    qryLookPais: TwwQuery;
    qryLookPaisIDPAIS: TFloatField;
    qryLookPaisNOMEPAIS: TStringField;
    qryLookEstadoPAIS: TStringField;
    Label19: TLabel;
    DBlkcboEstado: TwwDBLookupCombo;
    DBlkcboCaracteristica: TwwDBLookupCombo;
    DBedtPais: TDBEdit2;
    dsPais: TwwDataSource;
    qryIDIMOVEL: TFloatField;
    qryIDPESSOA: TFloatField;
    qryCODESTADO: TStringField;
    qryIDPAIS: TFloatField;
    qryIDADMINIMOVEL: TFloatField;
    qryFLGTIPOIMOVEL: TFloatField;
    qryIDIMOVELMESTRE: TFloatField;
    qryIMODATACONSTRUCAO: TDateTimeField;
    qryIMOAREA: TFloatField;
    qryIMOFRACAOIDEAL: TFloatField;
    qryFLGSTATUSOCUPACAO: TStringField;
    qryQTDETOTALCOTAS: TFloatField;
    qryIMONOME: TStringField;
    qryIMONUMERO: TStringField;
    qryIMOCOMPLEMENTO: TStringField;
    qryIMOBAIRRO: TStringField;
    qryIMOCEP: TStringField;
    qryIMOCIDADE: TStringField;
    MontaEndereco: TMontaSelect;
    qryAuxEnd: TwwQuery;
    qryAuxEndIDIMOVEL: TFloatField;
    qryAuxEndIMONUMERO: TStringField;
    qryAuxEndIMOCOMPLEMENTO: TStringField;
    qryAuxEndIMOBAIRRO: TStringField;
    qryAuxEndIMOCIDADE: TStringField;
    qryAuxEndIMOCEP: TStringField;
    qryAuxEndCODESTADO: TStringField;
    qryAuxEndIDPAIS: TFloatField;
    dsIndicador: TwwDataSource;
    qryLookMoeda: TwwQuery;
    qryLookMoedaMOESIGLA: TStringField;
    qryLookMoedaMOECODIGO: TFloatField;
    qryLookMoedaMOEDESC: TStringField;
    btnBuscaEndereco: TBitBtn;
    qryIDMARCA: TFloatField;
    qryLookMarca: TwwQuery;
    qryLookMarcaIDMARCA: TFloatField;
    qryLookMarcaMRCNOME: TStringField;
    qryInvestimento: TwwQuery;
    updInvestimento: TUpdateSQL;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    qryInvestimentoIDTIPOINVEST: TFloatField;
    qryInvestimentoIDMOEDACONTAB: TFloatField;
    qryInvestimentoIDEMISSOR: TFloatField;
    Label14: TLabel;
    qryLookSubConta: TwwQuery;
    qryCODSUBCONTA: TFloatField;
    qryDetContratosCONNUMERO: TStringField;
    tbsGeral: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label16: TLabel;
    Label6: TLabel;
    Label20: TLabel;
    DBrdgImovelMestre: TDBRadioGroup;
    DBedtNomeImovel: TDBEdit2;
    DBrdgImovelOcupado: TDBRadioGroup;
    btnBuscaImovelMestre: TBitBtn;
    DBcboMarca: TwwDBLookupCombo;
    DBcboSubConta: TwwDBLookupCombo;
    DBedtMatricula: TDBEdit2;
    Label3: TLabel;
    Label29: TLabel;
    Bevel1: TBevel;
    qryIMODATACOMPRA: TDateTimeField;
    qryIMOMOEDACOMPRA: TFloatField;
    qryIMOVLRCOMPRA: TFloatField;
    qryIMOMATRICULA: TStringField;
    wwDBGrid21: TwwDBGrid2;
    qryCODTIPIMOVEL: TStringField;
    DBcboStatus: TwwDBComboBox;
    Label34: TLabel;
    qryDESCCARTINVEST: TStringField;
    qryDESCTIPOIMOVEL: TStringField;
    qryIMODATAHABITESE: TDateTimeField;
    qryIMOPERCENTRATEIO: TFloatField;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    tbsEventos: TTabSheet;
    DBgrdEvento: TwwDBGrid2;
    qryEvento: TwwQuery;
    qryEVIDATA: TDateTimeField;
    qryEVICABECALHO: TStringField;
    FloatField1: TFloatField;
    qryIDEVENTOIMOVEL: TFloatField;
    dsEvento: TwwDataSource;
    DBmemDescricao: TwwDBRichEdit;
    Label38: TLabel;
    Bevel2: TBevel;
    DBedtFracaoIdeal: TDBEdit;
    tbsObs: TTabSheet;
    DBmemObservacao: TwwDBRichEdit;
    qryIMODESCRICAO: TMemoField;
    qryIMOOBSERVACAO: TMemoField;
    qryEventoEVIDESCRICAO: TMemoField;
    btnLimpaObs: TfcShapeBtn;
    TabSheet1: TTabSheet;
    DBgrdOutroDadoXImovel: TwwDBGrid2;
    tbsIndicadores: TTabSheet;
    qryFLGSTATUS: TStringField;
    qryFLGATIVO: TFloatField;
    DBgrdIndicador: TwwDBGrid2;
    btnPorData: TfcShapeBtn;
    btnPorTipo: TfcShapeBtn;
    qryOutroDadoXImovel: TwwQuery;
    qryODODESCRICAO: TStringField;
    qryODIVALOR: TStringField;
    FloatField2: TFloatField;
    qryIDOUTRODADO: TFloatField;
    dsOutroDadoXImovel: TwwDataSource;
    qryIDCARTORIO: TFloatField;
    DBedtCodigo: TDBEdit2;
    Label21: TLabel;
    qryIMOCODIGO: TStringField;
    Label22: TLabel;
    DBedtAreaUtil: TDBEdit;
    DBedtAreaGerencial: TDBEdit;
    qryIMOAREAGERENCIAL: TFloatField;
    tbsValor: TTabSheet;
    GroupBox1: TGroupBox;
    DBedtDataCompra: TCMDateTimePicker;
    Label30: TLabel;
    Label32: TLabel;
    DBcboMoedaCompra: TwwDBLookupCombo;
    Label31: TLabel;
    GroupBox2: TGroupBox;
    DBedtDataReaval: TCMDateTimePicker;
    DBcboMoedaReaval: TwwDBLookupCombo;
    GroupBox3: TGroupBox;
    DBedtDataMercado: TCMDateTimePicker;
    DBcboMoedaMercado: TwwDBLookupCombo;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    DBedtCarteiraInvest: TDBEdit;
    DBedtTipoImovel: TDBEdit;
    Label37: TLabel;
    Label39: TLabel;
    DBedtVlrCompra: TDBEdit;
    DBedtVlrReaval: TDBEdit;
    DBedtVlrMercado: TDBEdit;
    qryIMOVLRREAVAL: TFloatField;
    qryIMOMOEDAREAVAL: TFloatField;
    qryIMODATAREAVAL: TDateTimeField;
    qryIMOVLRMERCADO: TFloatField;
    qryIMOMOEDAMERCADO: TFloatField;
    qryIMODATAMERCADO: TDateTimeField;
    DBedtNomeMestre: TDBEdit2;
    qryNOME_MESTRE: TStringField;
    btnBuscaCartorio: TBitBtn;
    DBedtCartorio: TDBEdit2;
    DBedtAdmin: TDBEdit2;
    btnBuscaAdmin: TBitBtn;
    qryNF_ADMIN: TStringField;
    qryRS_ADMIN: TStringField;
    qryNF_CARTORIO: TStringField;
    qryRS_CARTORIO: TStringField;
    btnLimpaCartorio: TBitBtn;
    btnLimpaAdmin: TBitBtn;
    DBlblAtivoInativo: TDBText;
    qry_ATIVO_INATIVO: TStringField;
    qryIMOLOGRADOURO: TStringField;
    qryIMONOMEENDERECO: TStringField;
    qryAuxEndIMOLOGRADOURO: TStringField;
    qryAuxEndIMONOMEENDERECO: TStringField;
    DBedtVagas: TDBEdit;
    Label40: TLabel;
    DBedtAreaComum: TDBEdit;
    Label41: TLabel;
    qryIMOAREACOMUM: TFloatField;
    qryIMOVAGAS: TFloatField;
    DBedtAreaTotal: TDBEdit;
    Label42: TLabel;
    DBedtDataConstrucao: TCMDateTimePicker;
    Label15: TLabel;
    DBedtDataHabitese: TCMDateTimePicker;
    Label35: TLabel;
    Panel3: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    qryIMOAREATOTAL: TFloatField;
    qryDetContratosSTATUS_CONTRATO: TStringField;
    Bevel3: TBevel;
    Bevel4: TBevel;
    btnBuscaMestre: TToolbarButton97;
    btnRefresh: TToolbarButton97;
    btnTrazer: TToolbarButton97;
    ToolbarSep973: TToolbarSep97;
    ToolbarSep974: TToolbarSep97;
    ToolbarSep975: TToolbarSep97;
    qryEventoIDUSUARIO: TFloatField;
    qryEventoNOMEUSUARIO: TStringField;
    qryEventoNOME: TStringField;
    DBEdit1: TDBEdit;
    Label33: TLabel;
    TabSheet2: TTabSheet;
    dsDesmembramentos: TwwDataSource;
    wwDBGrid1: TwwDBGrid;

    procedure DBrdgImovelMestreClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure DBlkcboEstadoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryIndicadorPorDataCalcFields(DataSet: TDataSet);
    procedure btnBuscaImovelMestreClick(Sender: TObject);
    procedure btnBuscaEnderecoClick(Sender: TObject);
    procedure DBgrdEventoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure DBgrdEventoTopRowChanged(Sender: TObject);
    procedure btnLimpaObsClick(Sender: TObject);
    procedure btnPorDataClick(Sender: TObject);
    procedure btnPorTipoClick(Sender: TObject);
    procedure DBgrdOutroDadoXImovelCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure DBgrdIndicadorCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure DBgrdIndicadorTopRowChanged(Sender: TObject);
    procedure DBgrdOutroDadoXImovelTopRowChanged(Sender: TObject);
    procedure btnBuscaCartorioClick(Sender: TObject);
    procedure btnLimpaCartorioClick(Sender: TObject);
    procedure btnBuscaAdminClick(Sender: TObject);
    procedure btnLimpaAdminClick(Sender: TObject);
    procedure qryCalcFields(DataSet: TDataSet);
    procedure qryFLGSTATUSChange(Sender: TField);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure btnBuscaMestreClick(Sender: TObject);


    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeDetalheBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure pgctrlDetalheChanging(Sender: TObject; var AllowChange: Boolean);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnTrazerClick(Sender: TObject);
    procedure tbcDetalheChanging(Sender: TObject;
      var AllowChange: Boolean);

  private { Private declarations }
    iIndice, iPais   : integer;
    bHouveAlteracao  : boolean;   // indica se houve alterações/inclusões na tela

    procedure FazerProcurarMestre;

    procedure FazerRefresh;

    procedure PreencheCampos;

    procedure AbreTabelas;
    procedure AbreDetalhes(i: integer);
    procedure FechaDetalhes;
    procedure FechaQueries; 

    function VerificaPreenchimento: boolean;
    function VerificaPreenchimentoDetalhe: boolean;
    function VerificaDetCaracteristica: boolean;

  public { Public declarations }

  end;



var
  frmCadImovel: TfrmCadImovel;



implementation
{$R *.DFM}
uses
  uSistema, uMensErro, uDatabase, dBaseDados, uModulo, FCadastroCS, uComunsImobiliario,
  uFuncoesImob, FEspera, dLookImobiliario, DMS, dCAF, uCAF;



procedure TfrmCadImovel.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;

   // habilita o painel de fundo (que contém o PageControl - orelhas)
   pnlFundo.Enabled := True;

   Case CmeCadastro.Operacao of

      opVazio:
      begin
         tbsGeral.Enabled        := False;
         pnlControlesDet.Enabled := False;
         tbsEndereco.Enabled     := False;
         tbsDescricao.Enabled    := False;
         tbsValor.Enabled        := False;
         tbsObs.Enabled          := False;

         btnBuscaMestre.Down     := False;
      end;

      opIdle:
      begin
         tbsGeral.Enabled        := False;
         pnlControlesDet.Enabled := False;
         tbsEndereco.Enabled     := False;
         tbsDescricao.Enabled    := False;
         tbsValor.Enabled        := False;
         tbsObs.Enabled          := False;

         btnBuscaMestre.Down     := False;
      end;

      opInserir:
      begin
         tbsGeral.Enabled        := True;
         pnlControlesDet.Enabled := True;
         tbsEndereco.Enabled     := True;
         tbsDescricao.Enabled    := True;
         tbsValor.Enabled        := True;
         tbsObs.Enabled          := True;
      end;

      opAlterar:
      begin
         tbsGeral.Enabled        := True;
         pnlControlesDet.Enabled := True;
         tbsEndereco.Enabled     := True;
         tbsDescricao.Enabled    := True;
         tbsValor.Enabled        := True;
         tbsObs.Enabled          := True;
      end;

      opProcurar:
      begin
         tbsGeral.Enabled        := False;
         pnlControlesDet.Enabled := False;
         tbsEndereco.Enabled     := False;
         tbsDescricao.Enabled    := False;
         tbsValor.Enabled        := False;
         tbsObs.Enabled          := False;
      end;

      opApagar:
      begin
         tbsGeral.Enabled        := False;
         pnlControlesDet.Enabled := False;
         tbsEndereco.Enabled     := False;
         tbsDescricao.Enabled    := False;
         tbsValor.Enabled        := False;
         tbsObs.Enabled          := False;
      end;

   end;

   tbsEventos.Enabled      := True;
   tbsIndicadores.Enabled  := True;
end;



procedure TfrmCadImovel.CmeCadastroFind(Sender: TObject);
begin
	inherited;

	// redesenha o form na volta do MontaSelect
	Repaint;

	// se houve busca, abre a query principal com apenas o registro buscado
	if dtmMS.MS_Imovel.RetornouValor then begin

      Screen.Cursor := crHourGlass;

    	FechaDetalhes;

      // iIndice = IDIMOVEL
		iIndice := StrToInt(dtmMS.MS_Imovel.ValoresChave[1]);

		with qry do begin
         LimpaParametros(qry);
         Params[0].asInteger := iIndice;
         Open;
      end;

      AbreTabelas;
      AbreDetalhes(iIndice);

      if Modulo.bIntegraContab then begin
         DBcboSubConta.Enabled := True;
      end else begin
         DBcboSubConta.Enabled := False;
      end;

      PreencheCampos;

      if not(qryIMOOBSERVACAO.IsNull) then begin
			tbcDetalhe.TabIndex        := 7;
			pgctrlDetalhe.ActivePage   := tbsObs;
      end;

      Screen.Cursor := crDefault;
   end;
end;



procedure TfrmCadImovel.FazerProcurarMestre;
begin
	inherited;

	// redesenha o form na volta do MontaSelect
	Repaint;

	// se houve busca, abre a query principal com apenas o registro buscado
	if dtmMS.MS_ImovelMestre.RetornouValor then begin

      Screen.Cursor := crHourGlass;

    	FechaDetalhes;

      // iIndice = IDIMOVEL
		iIndice := StrToInt(dtmMS.MS_ImovelMestre.ValoresChave[0]);

		with qry do begin
         LimpaParametros(qry);
         Params[0].asInteger := iIndice;
         Open;
      end;

      AbreTabelas;
      AbreDetalhes(iIndice);

      if Modulo.bIntegraContab then begin
         DBcboSubConta.Enabled := True;
      end else begin
         DBcboSubConta.Enabled := False;
      end;

      PreencheCampos;

      if not(qryIMOOBSERVACAO.IsNull) then begin
			tbcDetalhe.TabIndex        := 7;
			pgctrlDetalhe.ActivePage   := tbsObs;
      end;

      Screen.Cursor := crDefault;
   end;
end;



procedure TfrmCadImovel.CmeCadastroInsert(Sender: TObject);
begin
	FechaDetalhes;

   // define logo o id do registro que se está inserindo, para poder gravar nos detalhes
   iIndice := LeUltRegistro(nil, 'INVESTIMENTO');

	// abre a query principal contendo zero registros (o iIndice é novo...)
	with qry do begin
      LimpaParametros(qry);
      Params[0].asInteger := iIndice;
      Open;
   end;

	inherited; { = CmeCadastro.Cancel(Self);
                  ds.DataSet.Insert; }

   // hesabilita o Radio de Imóvel Mestre
   DBrdgImovelMestre.Enabled := True;

   // atribui o id do Imóvel
   qryIDIMOVEL.asInteger := iIndice;

   qryInvestimento.Open;
   qryInvestimento.Insert;

	// abre as queries detalhe com zero registros (o novo registro não tem filhos, afinal...)
   AbreTabelas;
	AbreDetalhes(iIndice);

   if Modulo.bIntegraContab then begin
      DBcboSubConta.Enabled := True;
   end else begin
      DBcboSubConta.Enabled := False;
   end;

	// seta os valores default
	DBrdgImovelMestre.ItemIndex	:= 1;
	DBrdgImovelOcupado.ItemIndex	:= 0;

   tbcDetalheChange(tbcDetalhe);

   tbcDetalhe.TabIndex        := 0;
   pgctrlDetalhe.ActivePage   := tbsGeral;

   if DBrdgImovelMestre.CanFocus then DBrdgImovelMestre.SetFocus;
end;



procedure TfrmCadImovel.CmeCadastroEdit(Sender: TObject);
begin
   inherited;

   // desabilita FlgTipoImovel
   DBrdgImovelMestre.Enabled := False;

   tbcDetalheChange(tbcDetalhe);

   if DBrdgImovelMestre.CanFocus then DBrdgImovelMestre.SetFocus;
end;



procedure TfrmCadImovel.CmeCadastroConfirma(Sender: TObject);
begin
   try

      if CmeCadastro.Operacao in [opInserir, opAlterar] then begin

         bHouveAlteracao := True;

         with qryInvestimento do begin
            if qryInvestimento.State = dsInsert then begin
               qryInvestimentoIDINVESTIMENTO.asInteger   := iIndice;
               qryInvestimentoDESCINVESTIMENTO.asString  := qryIMONOME.AsString;
//               FieldByName('IDEMISSOR').Value            := NULL;
               qryInvestimentoIDTIPOINVEST.asInteger     := 3;
//               FieldByName('IDMOEDACONTAB').Value        := NULL;
               qryInvestimento.ApplyUpdates;
            end;
            Close;
         end;

         // grava a Empresa Proprietária
         qry.FieldByName('IDPESSOA').asInteger := Sistema.IdEmpresa;

      end;

      inherited;

      AplicaAlteracoes([qryDetCaracteristicas{, qryPropriet, qryIndicador}]);

      // desabilita FlgTipoImovel
      DBrdgImovelMestre.Enabled := False;

   except
      Screen.Cursor := crDefault;
      Raise;
      Repaint;
   end;
end;



procedure TfrmCadImovel.CmeCadastroCancel(Sender: TObject);
begin
   inherited;

   // desabilita FlgTipoImovel
   DBrdgImovelMestre.Enabled := False;
end;



procedure TfrmCadImovel.FazerRefresh;
begin
   inherited;
   AbreDetalhes(iIndice);
end;



procedure TfrmCadImovel.CmeDetalheInsert(Sender: TObject);
begin
   inherited;

   Case tbcDetalhe.TabIndex of
      1: DBlkcboCaracteristica.SetFocus;
//      4: DBlkcboProprietario.SetFocus;
//      5: DBcboIndicador.SetFocus;
   end;
end;



procedure TfrmCadImovel.CmeDetalheEdit(Sender: TObject);
begin
   inherited;

   Case tbcDetalhe.TabIndex of
      1: DBlkcboCaracteristica.SetFocus;
//      4: DBlkcboProprietario.SetFocus;
//      5: DBcboIndicador.SetFocus;
   end;
end;



procedure TfrmCadImovel.CmeDetalheConfirma(Sender: TObject);
begin
	if ( (qryAtual <> nil) and (qryAtual.State in dsEditModes) ) then begin

      // grava o identificador do imóvel qq que seja a query Detalhe
      qryAtual.FieldByName('IDIMOVEL').asInteger := iIndice;

      // grava a FlgUtilizado no indicador
//      if qryAtual = qryIndicador then qryIndicador.FieldByName('FLGUTILIZADO').asInteger := 0;

      inherited;
   end;
end;



procedure TfrmCadImovel.PreencheCampos;
begin
   // verifica se o imóvel é mestre ou não e habilita/desabilita a combo de acordo
   if DBrdgImovelMestre.ItemIndex = 0 then begin
      btnBuscaImovelMestre.Enabled	:= False;
   end else begin
      btnBuscaImovelMestre.Enabled	:= True;
   end;
end;



procedure TfrmCadImovel.AbreTabelas;
begin
   if not(qryLookCaracteristicas.Active) then qryLookCaracteristicas.Open;
   if not(qryLookEstado.Active) then qryLookEstado.Open;
   if not(qryLookMoeda.Active) then qryLookMoeda.Open;
   if not(qryLookMarca.Active) then qryLookMarca.Open;

   if Modulo.bIntegraContab then begin
      with qryLookSubConta do begin
         LimpaParametros(qryLookSubConta);
         Params[0].asInteger := Sistema.idEmpresa;
         Open;
      end;
   end;
end;



procedure TfrmCadImovel.AbreDetalhes(i: integer);
begin
   iPais := qryLookEstado.FieldByName('IDPAIS').asInteger;
   with qryLookPais do begin
      LimpaParametros(qryLookPais);
      Params[0].asInteger := iPais;
      Open;
   end;

   with qryDetCaracteristicas do begin
      LimpaParametros(qryDetCaracteristicas);
      Params[0].asInteger := i;
      Open;
   end;

	with qryDetContratos do begin
      LimpaParametros(qryDetContratos);
      Params[0].asInteger := i;
      Open;
   end;

	with dtmLookImobiliario.qryLookIndicadorPorTipo do begin
      LimpaParametros(dtmLookImobiliario.qryLookIndicadorPorTipo);
      ParamByName('PIDIMOVEL').AsInteger := i;
      Open;
   end;

	with dtmLookImobiliario.qryLookIndicadorPorData do begin
      LimpaParametros(dtmLookImobiliario.qryLookIndicadorPorData);
      ParamByName('PIDIMOVEL').AsInteger := i;
      Open;
   end;

	with qryOutroDadoXImovel do begin
      LimpaParametros(qryOutroDadoXImovel);
      Params[0].asInteger := i;
      Open;
   end;

	with qryEvento do begin
      LimpaParametros(qryEvento);
      Params[0].asInteger := i;
      Open;
   end;

   // Mostra desmembramentos do imóvel
   CAF.MontaHistDesmembramento(i);
end;



procedure TfrmCadImovel.FechaDetalhes;
begin
	qryDetCaracteristicas.Close;
	qryDetContratos.Close;
end;



procedure TfrmCadImovel.FechaQueries;
var
   i : integer;
begin
   for i := 0 to (ComponentCount - 1) do begin
      if ( (TObject(Components[i]).ClassType = TwwQuery) and (TwwQuery(Components[i]).Active) ) then begin
         TwwQuery(Components[i]).Close;
      end;
   end;

   dtmLookImobiliario.qryLookIndicadorPorData.Close;
   dtmLookImobiliario.qryLookIndicadorPorTipo.Close;
end;



function TfrmCadImovel.VerificaPreenchimento: boolean;
begin
	Result := False;
	try

      // Empreendimento Mestre
		if DBrdgImovelMestre.ItemIndex = 1 then
         if length(trim(DBedtNomeMestre.Text)) = 0 then
	         raise EValidacao.CreateVal('É necessário indicar o Empreendimento Mestre!', btnBuscaImovelMestre);

		// Nome do Imóvel
      if length(trim(DBedtNomeImovel.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar o Nome do Imóvel!', DBedtNomeImovel);

      // Imóvel Mestre <> Imóvel
      if qryIDIMOVEL.asInteger = qryIDIMOVELMESTRE.asInteger then
         raise EValidacao.CreateVal('O Imóvel não pode ser Mestre dele mesmo!', btnBuscaImovelMestre);

	    	// Área Útil
      if (length(trim(DBedtAreaUtil.Text)) = 0) and (qryFLGTIPOIMOVEL.AsInteger = 1) then
         raise EValidacao.CreateVal('É necessário indicar a Área Útil do Imóvel!', DBedtAreaUtil);

	except

      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
			Repaint;
			tbcDetalhe.TabIndex        := 0;
			pgctrlDetalhe.ActivePage   := tbsGeral;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;
   Result := True;
end;



function TfrmCadImovel.VerificaPreenchimentoDetalhe : boolean;
var
   bPreenchido : boolean;
begin
   bPreenchido := False;

   // só verifica se estiver fazendo uma inclusão ou alteração
	if ( (qryAtual <> nil) and (qryAtual.State in dsEditModes) ) then begin
		// verifica o preenchimento de acordo com a query em questão
      if VerificaDetCaracteristica then bPreenchido   := True;
   end else begin
      bPreenchido := True;
   end;

   Result := bPreenchido;
end;


{
function TfrmCadImovel.VerificaPreenchimentoEndereco : boolean;
begin
	Result := False;
	try

      if length(trim(DBedtNomeEndereco.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar o Nome do Endereço!', DBedtNomeEndereco);

		if length(trim(DBedtLogradouro.Text)) = 0 then
			raise EValidacao.CreateVal('É necessário indicar o Logradouro!', DBedtLogradouro);

		if length(trim(DBedtNumero.Text)) = 0 then
			raise EValidacao.CreateVal('É necessário indicar o Número!', DBedtNumero);

		if length(trim(DBedtBairro.Text)) = 0 then
			raise EValidacao.CreateVal('É necessário indicar o Bairro!', DBedtBairro);

		if length(trim(DBedtCidade.Text)) = 0 then
			raise EValidacao.CreateVal('É necessário indicar a Cidade!', DBedtCidade);

		if length(trim(DBedtCEP.Text)) = 0 then
			raise EValidacao.CreateVal('É necessário indicar o CEP!', DBedtCEP);

		if length(trim(DBlkcboEstado.Text)) = 0 then
			raise EValidacao.CreateVal('É necessário indicar o Estado!', DBlkcboEstado);

	except

    	on ev : EValidacao do begin
			if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
			Repaint;
			pgctrlDetalhe.ActivePage := tbsEndereco;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

    end;
    Result := True;
end;
}


function TfrmCadImovel.VerificaDetCaracteristica: boolean;
begin
	Result := False;
	try

      // Característica
		if length(trim(DBlkcboCaracteristica.Text)) = 0 then
			raise EValidacao.CreateVal('É necessário indicar a Característica do Imóvel!', DBlkcboCaracteristica);

	except

    	on ev : EValidacao do begin
			if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
			Repaint;
			tbcDetalhe.TabIndex        := 1;
			pgctrlDetalhe.ActivePage   := tbsDet;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

    end;
    Result := True;
end;



procedure TfrmCadImovel.DBrdgImovelMestreClick(Sender: TObject);
begin
	inherited;

   if ( qry.State = dsInsert ) then begin

      if DBrdgImovelMestre.ItemIndex = 0 then begin
         qryNOME_MESTRE.Clear;
         qryIDIMOVELMESTRE.Clear;
      end;

      btnBuscaImovelMestre.Enabled := (DBrdgImovelMestre.ItemIndex = 1);
   end;
end;



procedure TfrmCadImovel.bbtnConfirmarClick(Sender: TObject);
begin
	Screen.Cursor := crHourGlass;
   if ( CmeCadastro.Operacao in [opInserir, opAlterar] ) then begin

      if VerificaPreenchimentoDetalhe then begin
         CmeDetalhe.Confirma(Self);
         CmeDetalhe.Cancel(Self);

         if VerificaPreenchimento then begin
            inherited;
         end;
      end;

   end;
	Screen.Cursor := crDefault;
end;



procedure TfrmCadImovel.DBlkcboEstadoChange(Sender: TObject);
begin
   inherited;

   iPais := qryLookEstado.FieldByName('IDPAIS').asInteger;

   with qryLookPais do begin
      LimpaParametros(qryLookPais);
      Params[0].asInteger := iPais;
      Open;
   end;
end;



procedure TfrmCadImovel.FormCreate(Sender: TObject);
begin
	inherited;
   bHouveAlteracao := False;

	// adiciona o filtro por Empresa Proprietária nos MontaSelect
   MontaEndereco.Filtro.Add('IMOVEL.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
end;



procedure TfrmCadImovel.FormShow(Sender: TObject);
begin
   inherited;

   // deixa o detalhe na 1a. orelha por default
   tbcDetalhe.TabIndex        := 0;
   pgctrlDetalhe.ActivePage   := tbsGeral;

   Repaint;
end;



procedure TfrmCadImovel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   bbtnSair.Enabled := False;

	FechaQueries;

   if bHouveAlteracao then begin  // Incluiu ou Alterou algum registro

      frmEspera.Config('Aguarde', 'Atualizando ocupação dos Imóveis...', False);
      frmEspera.Show;
      Application.ProcessMessages;

      // marca TODOS os Imóveis como Ocupados/Desocupados
      try
         FuncoesImob.AtualizaOcupacao(-1, -1, 'O', True);
         FuncoesImob.AtualizaOcupacao(-1, -1, 'D', True);
      finally
         frmEspera.Hide;
         frmEspera.Config('', '', False);
      end;
   end;

   inherited;
end;



procedure TfrmCadImovel.qryIndicadorPorDataCalcFields(DataSet: TDataSet);
begin
  inherited;
{
   // preenchimento manual da flag para contornar preenchimento incorreto
   with qryIndicador do begin
       if FieldByName('FLGTIPOVALOR').asString = 'M' then begin
          FieldByName('TIPOVALOR').asString := 'Monetário';
       end else begin
          if FieldByName('FLGTIPOVALOR').asString = 'P' then begin
             FieldByName('TIPOVALOR').asString := 'Percentual';
          end else begin
             FieldByName('TIPOVALOR').asString := 'Quantitativo';
          end;
       end;
   end;
   }
end;


{
procedure TfrmCadImovel.DBedtValorExit(Sender: TObject);
begin
   if DBedtValor.Modified then begin
      DBedtValorOM.Value := 0;
      DBcboMoeda.Clear;
      if qryIndicador.State in dsEditModes then qryIndicador.FieldByName('MOECODIGO').Value := NULL;
   end;
end;
}


procedure TfrmCadImovel.btnBuscaImovelMestreClick(Sender: TObject);
begin
   if qry.State in dsEditModes then begin

      dtmMS.MS_ImovelMestre.Executar;

      // redesenha o form na volta do MontaSelect
      Repaint;

      // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
      if dtmMS.MS_ImovelMestre.RetornouValor then begin

         Screen.Cursor := crHourGlass;

         qryIDIMOVELMESTRE.asInteger   := StrToInt(dtmMS.MS_ImovelMestre.ValoresChave[0]);
         qryNOME_MESTRE.asString       := dtmMS.MS_ImovelMestre.ValoresChave[1];

         Screen.Cursor := crDefault;
      end;

      btnBuscaImovelMestre.SetFocus;
   end;
end;



procedure TfrmCadImovel.btnBuscaEnderecoClick(Sender: TObject);
begin
	inherited;

   if CmeCadastro.Operacao in [opInserir, opAlterar] then begin
      // busca um endereço já usado anteriormente (para o caso de um mesmo imóvel mestre, etc.)
      MontaEndereco.Executar;
      if MontaEndereco.RetornouValor then begin

         Screen.Cursor := crHourGlass;

         with qryAuxEnd do begin
            LimpaParametros(qryAuxEnd);
            Params[0].asInteger := StrToInt(MontaEndereco.ValoresChave[0]);
            Open;

            // atribui aos campos os valores encontrados na tabela auxiliar
            qryIMONOMEENDERECO.asString   := qryAuxEndIMONOMEENDERECO.asString;
            qryIMOLOGRADOURO.asString	   := qryAuxEndIMOLOGRADOURO.asString;
            qryIMONUMERO.asString		   := qryAuxEndIMONUMERO.asString;
            qryIMOCOMPLEMENTO.asString 	:= qryAuxEndIMOCOMPLEMENTO.asString;
            qryIMOBAIRRO.asString   		:= qryAuxEndIMOBAIRRO.asString;
            qryIMOCIDADE.asString   		:= qryAuxEndIMOCIDADE.asString;
            qryIMOCEP.asString   			:= qryAuxEndIMOCEP.asString;

            DBlkcboEstado.Text := qryAuxEndCODESTADO.asString;
            DBlkcboEstado.PerformSearch;

         end;

         Screen.Cursor := crDefault;
      end;
   end;
   btnBuscaEndereco.SetFocus;
end;


{
procedure TfrmCadImovel.DBedtValorOMExit(Sender: TObject);
begin
   if ( ( sTextoIniMoeda <> sTextoFimMoeda) or (DBedtValorOM.Modified) ) then begin
      if length(trim(DBcboMoeda.Text)) = 0 then begin
         // se a combo não estiver preenchida, limpa a campo MOECODIGO
         if qryIndicador.State in dsEditModes then qryIndicador.FieldByName('MOECODIGO').Value := NULL;
      end else begin
         if ( (length(trim(DBcboMoeda.Text)) > 0) and (DBedtValorOM.Value > 0) ) then begin
            // se a Moeda e o ValorOM preenchidos, converte o valor
            ConverteValorOM;
         end;
      end;
   end;
end;



procedure TfrmCadImovel.DBcboMoedaEnter(Sender: TObject);
begin
   sTextoIniMoeda := DBcboMoeda.Text;
end;



procedure TfrmCadImovel.DBcboMoedaExit(Sender: TObject);
begin
   sTextoFimMoeda := DBcboMoeda.Text;
   if ( ( sTextoIniMoeda <> sTextoFimMoeda) or (DBedtValorOM.Modified) ) then begin
      if length(trim(DBcboMoeda.Text)) = 0 then begin
         // se a combo não estiver preenchida, limpa a campo MOECODIGO
         if qryIndicador.State in dsEditModes then qryIndicador.FieldByName('MOECODIGO').Value := NULL;
      end else begin
         if ( (length(trim(DBcboMoeda.Text)) > 0) and (DBedtValorOM.Value > 0) ) then begin
            // se a Moeda e o ValorOM preenchidos, converte o valor
            ConverteValorOM;
         end;
      end;
   end;
end;
}


{
procedure TfrmCadImovel.dBcboIndicadorCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
var
   sTipoValor: string;
begin
   inherited;

   sTipoValor := qryLookIndicadorFLGTIPOVALOR.asString;

   case sTipoValor[1] of

      'M':
      begin
         DBedtValorOM.Enabled    := True;
         DBcboMoeda.Enabled      := True;
         DBedtValor.Enabled      := False;
      end;

      'P', 'Q':
      begin
         // limpa ValorOM e Moeda
         qryIndicadorIXIVALOROM.asFloat := 0;
         DBcboMoeda.Clear;
         DBcboMoeda.LookupValue  := '';

         DBedtValorOM.Enabled    := False;
         DBcboMoeda.Enabled      := False;
         DBedtValor.Enabled      := True;
      end;

   end;
end;
}


procedure TfrmCadImovel.DBgrdEventoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState;
Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWhite;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmCadImovel.DBgrdEventoTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   DBgrdEvento.Invalidate;
end;



procedure TfrmCadImovel.btnLimpaObsClick(Sender: TObject);
begin
   inherited;

   if qry.State in dsEditModes then begin
      qry.FieldByName('IMOOBSERVACAO').Value := NULL;
      MsgDlg('Observações apagadas.', 'Informação', mtInformation, [mbOk], 0);
      Repaint;
   end;
end;



procedure TfrmCadImovel.btnPorDataClick(Sender: TObject);
begin
   inherited;
   dsIndicador.DataSet := dtmLookImobiliario.qryLookIndicadorPorData;
end;



procedure TfrmCadImovel.btnPorTipoClick(Sender: TObject);
begin
   inherited;
   dsIndicador.DataSet := dtmLookImobiliario.qryLookIndicadorPorTipo;
end;



procedure TfrmCadImovel.DBgrdOutroDadoXImovelCalcCellColors(Sender: TObject; Field: TField;
State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWhite;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmCadImovel.DBgrdIndicadorCalcCellColors(Sender: TObject; Field: TField;
State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWhite;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmCadImovel.DBgrdIndicadorTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   DBgrdIndicador.Invalidate;
end;



procedure TfrmCadImovel.DBgrdOutroDadoXImovelTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   DBgrdOutroDadoXImovel.Invalidate;
end;



procedure TfrmCadImovel.btnBuscaCartorioClick(Sender: TObject);
begin
   inherited;
   if qry.State in dsEditModes then begin

      dtmMS.MS_Cartorio.Executar;

      // redesenha o form na volta do MontaSelect
      Repaint;

      // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
      if dtmMS.MS_Cartorio.RetornouValor then begin

         Screen.Cursor := crHourGlass;

         qryIDCARTORIO.asInteger := StrToInt(dtmMS.MS_Cartorio.ValoresChave[0]);
         qryNF_CARTORIO.asString := dtmMS.MS_Cartorio.ValoresChave[1];
         qryRS_CARTORIO.asString := dtmMS.MS_Cartorio.ValoresChave[2];

         Screen.Cursor := crDefault;
      end;

      btnBuscaCartorio.SetFocus;
   end;
end;



procedure TfrmCadImovel.btnLimpaCartorioClick(Sender: TObject);
begin
   inherited;

   if qry.State in dsEditModes then begin
      qryNF_CARTORIO.Clear;
      qryRS_CARTORIO.Clear;
      qryIDCARTORIO.Clear;
   end;
end;



procedure TfrmCadImovel.btnBuscaAdminClick(Sender: TObject);
begin
   if qry.State in [dsInsert, dsEdit] then begin

      dtmMS.MS_AdminImovel.Executar;

      // redesenha o form na volta do MontaSelect
      Repaint;

      // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
      if dtmMS.MS_AdminImovel.RetornouValor then begin

         Screen.Cursor := crHourGlass;

         qryIDADMINIMOVEL.asInteger := StrToInt(dtmMS.MS_AdminImovel.ValoresChave[0]);
         qryNF_ADMIN.asString       := dtmMS.MS_AdminImovel.ValoresChave[1];
         qryRS_ADMIN.asString       := dtmMS.MS_AdminImovel.ValoresChave[2];

         Screen.Cursor := crDefault;
      end;

      btnBuscaAdmin.SetFocus;
   end;
end;



procedure TfrmCadImovel.btnLimpaAdminClick(Sender: TObject);
begin
   if qry.State in dsEditModes then begin
      qryNF_ADMIN.Clear;
      qryRS_ADMIN.Clear;
      qryIDADMINIMOVEL.Clear;
   end;
end;



procedure TfrmCadImovel.qryCalcFields(DataSet: TDataSet);
begin
   inherited;

   case qryFLGATIVO.AsInteger of

      0: // inativo
      begin
         qry_ATIVO_INATIVO.AsString    := 'Imóvel Inativo';
         DBlblAtivoInativo.Visible     := True;
         DBlblAtivoInativo.Font.Color  := clGray;
      end;

      1: // inativo
      begin
         qry_ATIVO_INATIVO.AsString    := 'Imóvel Ativo';
         DBlblAtivoInativo.Visible     := True;
         DBlblAtivoInativo.Font.Color  := clNavy;
      end;

      else begin
         qry_ATIVO_INATIVO.AsString    := '';
         DBlblAtivoInativo.Visible     := False;
      end;

   end;
end;



procedure TfrmCadImovel.qryFLGSTATUSChange(Sender: TField);
begin
   inherited;

   if qry.State in dsEditModes then begin
      if not(qryFLGSTATUS.AsString = '') then begin
         if qryFLGSTATUS.AsString[1] in ['A', 'N', 'Q'] then begin
            qryFLGATIVO.AsInteger := 1;
         end else begin
            qryFLGATIVO.AsInteger := 0;
         end;
      end else begin
         qryFLGATIVO.AsInteger := 0;
      end;
   end;
end;



procedure TfrmCadImovel.sbtnProcurarClick(Sender: TObject);
begin
   CmeCadastro.Operacao := opProcurar;
   dtmMS.MS_Imovel.Executar;

   CmeCadastro.Find(Self);

   if qry.IsEmpty then begin
      CmeCadastro.Operacao := opVazio
   end else begin
      CmeCadastro.Operacao := opIdle;
   end;

   CmeCadastro.AtualizaBotoes(self);
end;



procedure TfrmCadImovel.btnBuscaMestreClick(Sender: TObject);
begin
   inherited;

   CmeCadastro.Operacao := opProcurar;
   dtmMS.MS_ImovelMestre.Executar;

   FazerProcurarMestre;

   if qry.IsEmpty then begin
      CmeCadastro.Operacao := opVazio
   end else begin
      CmeCadastro.Operacao := opIdle;
   end;

   CmeCadastro.AtualizaBotoes(self);
end;



procedure TfrmCadImovel.CmeDetalheBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept :=  VerificaPreenchimentoDetalhe;
end;



procedure TfrmCadImovel.pgctrlDetalheChanging(Sender: TObject; var AllowChange: Boolean);
begin
   // para contornar a inconveniente gravação de registros em branco
   CmeDetalhe.Cancel(Self);

   inherited;
end;



procedure TfrmCadImovel.btnRefreshClick(Sender: TObject);
begin
   inherited;

   try
      FazerRefresh;
   finally

      // não deixa o botão ficar pressionado
      btnRefresh.Down := False;
   end;
end;



procedure TfrmCadImovel.btnTrazerClick(Sender: TObject);
begin
   inherited;

//   FazerTrazer;

   // não deixa o botão ficar pressionado
   btnTrazer.Down := False;
end;



procedure TfrmCadImovel.tbcDetalheChanging(Sender: TObject; var AllowChange: Boolean);
begin
   // para contornar a inconveniente gravação de registros em branco
   CmeDetalhe.Cancel(Self);

   inherited;
end;

end.
