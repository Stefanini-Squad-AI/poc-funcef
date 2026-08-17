unit FExecOperImovel;

//	-------------------------------------------------------------------------------------------------
//
//	Operações com Imóveis (nova versão de Operações com Cotas)
//
//	Autor          :  André Pontes
//	Data de Início	:  24/08/1999
//	Data de Término:  24/08/1999
//                   14/10/1999 (incorporando Parcelamento e Ativo Fixo)
//
//	Modificações	:  18/10/1999  1) Clear na combo Carteira qdo o Imóvel não a possui ainda
//                               2) Correção do VerificaPreenchimentoDetalhe: verificação de acordo
//                                  com a qryAtual
//
// -------------------------------------------------------------------------------------------------



interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, Mask, wwdblook, StdCtrls, TREdit, Db,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Wwdatsrc, Wwquery,
  TB97Ctls, MAHlpBtn, TB97Tlbr, Buttons, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, ExtCtrls, wwdbedit, Wwdotdot, Wwdbcomb,
  wwriched, DBCtrls, wwdbdatetimepicker, CMDateTimePicker,
  CmEventosCadastro, ImgList;

type
  TTipoOperacao = (toCompra, toVenda, toTransferencia);

  TfrmExecOperImovel = class(TfrmCadMestreDetalheCS)
    sbtnNovoBem: TToolbarButton97;
    MontaSelectImovel: TMontaSelect;
    MontaSelectCarteira: TMontaSelect;
    MontaSelectBem: TMontaSelect;
    qryLookForCli: TwwQuery;
    qryLookMoeda: TwwQuery;
    qryLookMoedaMOESIGLA: TStringField;
    qryLookMoedaMOECODIGO: TFloatField;
    qryLookMoedaMOEDESC: TStringField;
    qryLookCarteira: TwwQuery;
    qryLookCarteiraDESCCARTINVEST: TStringField;
    qryLookCarteiraIDCARTEIRAINVEST: TFloatField;
    qryLookCarteiraIDGESTORCARTEIRA: TFloatField;
    qryLookTipoOper: TwwQuery;
    qryLookTipoOperDESCTIPOOPERACAO: TStringField;
    qryLookTipoOperIDTIPOOPERACAO: TFloatField;
    qryLookTipoOperNATUREZAOPERACAO: TStringField;
    qryLookImovel: TwwQuery;
    qryLookImovelIMONOME: TStringField;
    qryLookImovelNOMEMESTRE: TStringField;
    qryLookImovelIDIMOVEL: TFloatField;
    qryLookImovelIDCARTEIRAINVEST: TFloatField;
    qryLookImovelCODTIPIMOVEL: TStringField;
    qryLookImovelIDIMOVELMESTRE: TFloatField;
    qryDespesasXTipoOper: TwwQuery;
    updImovelxBem: TUpdateSQL;
    qryImovelxBem: TwwQuery;
    Label49: TLabel;
    btnBuscaBem: TBitBtn;
    DBedtDescricaoBem: TDBEdit;
    Label36: TLabel;
    Label48: TLabel;
    DBcboGrupo: TwwDBComboBox;
    tbsRubrica: TTabSheet;
    qryIDOPERACAOINVEST: TFloatField;
    qryIDINVESTIMENTO: TFloatField;
    qryEMPRESAPROP: TFloatField;
    qryIDCARTEIRAINVEST: TFloatField;
    qryIDTIPOINVEST: TFloatField;
    qryIDTIPOOPERACAO: TFloatField;
    qryDATAOPERACAO: TDateTimeField;
    qryNUMDOCUMENTO: TStringField;
    qryQTDEOPERACAO: TFloatField;
    qryPRECOUNITOPERACAO: TFloatField;
    qryVLROPERACAO: TFloatField;
    qryIDCUSTODIANTE: TFloatField;
    qryIDINSTFIN: TFloatField;
    qryDATAVENCOPER: TDateTimeField;
    qryIDFORCLI: TFloatField;
    qryVLROPERACAOOM: TFloatField;
    qryMOECODIGO: TFloatField;
    qryPreencheBem: TwwQuery;
    qryPreencheBemIDBEM: TFloatField;
    qryPreencheBemIDPESSOA: TFloatField;
    qryPreencheBemPLACA: TFloatField;
    qryPreencheBemDESBEM: TStringField;
    qryLookTipoImovel: TwwQuery;
    qryAtualizaImovel: TwwQuery;
    qryLookTipoImovelCODTIPIMOVEL: TStringField;
    qryLookTipoImovelDESCTIPOIMOVEL: TStringField;
    DBgrdRubrica: TwwDBGrid;
    Panel1: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    DBcboMoedaRubrica: TwwDBLookupCombo;
    DBedtRubrica: TDBEdit;
    Label7: TLabel;
    qryLookTipoOperFLGGERACAF: TFloatField;
    DBedtDataDesp: TCMDateTimePicker;
    Label8: TLabel;
    dsDespXTipoOper: TwwDataSource;
    updDespXTipoOper: TUpdateSQL;
    DBcboForCliDesp: TwwDBLookupCombo;
    Label10: TLabel;
    qryImovelxBemIDBEM: TFloatField;
    qryImovelxBemIDIMOVEL: TFloatField;
    qryImovelxBemIDPESSOA: TFloatField;
    qryImovelxBemIXBGRUPO: TStringField;
    qryLookTipoOperFLGGERACAPCAR: TFloatField;
    qryInsertRubrica: TwwQuery;
    tbsParcelas: TTabSheet;
    Panel2: TPanel;
    Label11: TLabel;
    Label17: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    DBcboMoedaParcela: TwwDBLookupCombo;
    DBedtDataParcela: TCMDateTimePicker;
    DBedtObservacao: TDBEdit;
    DBgrdParcela: TwwDBGrid;
    DBcboTipoOperParcela: TwwDBLookupCombo;
    Label21: TLabel;
    qryInsertOperParcela: TwwQuery;
    updParcelas: TUpdateSQL;
    dsParcelas: TwwDataSource;
    qryParcelas: TwwQuery;
    tbsOperacao: TTabSheet;
    Label5: TLabel;
    lblData: TLabel;
    Label3: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    btnBuscaImovel: TBitBtn;
    DBcboMoeda: TwwDBLookupCombo;
    DBcboImovel: TwwDBLookupCombo;
    DBcboTipoOper: TwwDBLookupCombo;
    DBedtDataVenc: TCMDateTimePicker;
    DBedtDataOper: TCMDateTimePicker;
    DBcboForCliOper: TwwDBLookupCombo;
    DBcboImovelMestre: TwwDBLookupCombo;
    Label12: TLabel;
    Label1: TLabel;
    DBcboCarteira: TwwDBLookupCombo;
    btnBuscaCarteira: TBitBtn;
    DBcboTipoImovel: TwwDBLookupCombo;
    Label9: TLabel;
    Label22: TLabel;
    Label45: TLabel;
    DBedtParcela: TDBEdit;
    qryParcelasIDPARCELA: TFloatField;
    qryParcelasPARPARCELA: TStringField;
    qryParcelasIDOPERACAOINVEST: TFloatField;
    qryParcelasIDOPERPARCELA: TFloatField;
    qryParcelasIDIMOVEL: TFloatField;
    qryParcelasMOECODIGO: TFloatField;
    qryParcelasPARVLROM: TFloatField;
    qryParcelasPARVLR: TFloatField;
    qryParcelasPARDATAVENC: TDateTimeField;
    qryParcelasPAROBSERVACAO: TStringField;
    qryParcelasNATUREZA: TStringField;
    DBedtObsOper: TDBEdit;
    Label23: TLabel;
    qryOBSERVACAO: TStringField;
    qryImovelxBemIXBPERCENT: TFloatField;
    Label24: TLabel;
    qryParcelasPARNUMERO: TFloatField;
    DBcboLucroPreju: TwwDBLookupCombo;
    lblLucroPreju: TLabel;
    qryLookTipoDespesa: TwwQuery;
    qryLookTipoDespesaDESCTIPODESPINV: TStringField;
    qryLookTipoDespesaIDTIPODESPINVEST: TFloatField;
    qryParcelasMOESIGLA: TStringField;
    qryDespesasXTipoOperIDTIPODESPINVEST: TFloatField;
    qryDespesasXTipoOperCODTIPDOC: TFloatField;
    qryDespesasXTipoOperFLGGERACONTAB: TFloatField;
    qryDespesasXTipoOperFLGGERACAPCAR: TFloatField;
    qryDespesasXTipoOperFLGGERACAF: TFloatField;
    qryDespesasXTipoOperRECPAG: TStringField;
    qryDespesasXTipoOperDESCTIPODESPINV: TStringField;
    qryDespesasXTipoOperNATUREZAOPERACAO: TStringField;
    qryDespesasXTipoOperVLROM: TFloatField;
    qryDespesasXTipoOperMOEDA: TFloatField;
    qryDespesasXTipoOperVLR: TFloatField;
    qryDespesasXTipoOperFORCLI: TFloatField;
    qryLookImovelCODSUBCONTA: TFloatField;
    qryForCliXTipoOper: TwwQuery;
    qryForCliXTipoOperIDTIPOINVEST: TFloatField;
    qryForCliXTipoOperIDTIPOOPERACAO: TFloatField;
    qryForCliXTipoOperEMPRESAPROP: TFloatField;
    qryForCliXTipoOperIDFORCLI: TFloatField;
    qryForCliXTipoOperIDTIPOCLIENTE: TFloatField;
    qryDespesasXTipoOperDATAVENC: TDateTimeField;
    qryParcelasIDCONTRATOIMOVEL: TFloatField;
    DBedtPlaca: TDBEdit;
    qryParcelasTIPOOPER: TFloatField;
    qryLookTipoDespesaIDTIPOOPERACAO: TFloatField;
    DBedtNoParcela: TDBEdit;
    qryLookTipoOperParcela: TwwQuery;
    qryLookTipoDespesaNATUREZAOPERACAO: TStringField;
    qryParcelasPARQTDE: TFloatField;
    qryLookTipoOperRECPAG: TStringField;
    qryParcelasRECPAG: TStringField;
    qryLookTipoDespesaRECPAG: TStringField;
    DBedtVlrOM: TDBEdit;
    DBedtVlrOper: TDBEdit;
    DBedtRateioBem: TDBEdit;
    DBedtVlrOMRubrica: TDBEdit;
    DBedtVlrRubrica: TDBEdit;
    DBedtVlrOMParcela: TDBEdit;
    DBedtVlrParcela: TDBEdit;
    qryLookTipoOperParcelaIDTIPOOPERACAO: TFloatField;
    qryLookTipoOperParcelaDESCTIPOOPERACAO: TStringField;
    qryLookTipoOperParcelaNATUREZAOPERACAO: TStringField;
    qryLookTipoOperParcelaFLGGERACAF: TFloatField;
    qryLookTipoOperParcelaFLGGERACAPCAR: TFloatField;
    qryLookTipoOperParcelaRECPAG: TStringField;
    qryImovelxBemPLACA: TFloatField;
    qryImovelxBemDESC: TStringField;
    qryImovelxBemGRUPO: TStringField;

    // procediementos definidos
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);

    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroCancel(Sender: TObject);

    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);

    procedure PreencheImovel;
    procedure BuscaBem;

    procedure AtualizaImovel;

    function Efetiva: boolean;

    function BuscaForCli: integer;
    procedure DefineParametros;

    function GeraOperacao: boolean;
    function GeraDespesas: boolean;
    function GeraParcelas: boolean;

    function RegistraDespesa(fLucroPreju: currency; bLucroPreju: boolean): integer;
    function IntegraCAF(fVlrCAF: currency): boolean;
    function AgregaValor(fVlrAgregar: currency; sObs: string): boolean;

    procedure ConverteValorOperacao;

    procedure ConverteValorRubrica;
    procedure ConverteValorParcela;

    function VerificaPreenchimento: boolean;
    function VerificaPreenchimentoDetalhe: boolean;

    procedure AbreQueries;
    procedure AbreDetalhes(i: integer);
    procedure FechaDetalhes;
    procedure FechaQueries;

    // outros procedimentos
    procedure btnBuscaBemClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnBuscaImovelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure btnBuscaCarteiraClick(Sender: TObject);
    procedure sbtnNovoBemClick(Sender: TObject);
    procedure DBedtVlrOMExit(Sender: TObject);
    procedure DBcboMoedaExit(Sender: TObject);
    procedure DBcboMoedaEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbcDetalheChange(Sender: TObject);
    procedure tbcDetalheChanging(Sender: TObject; var AllowChange: Boolean);
    procedure qryImovelxBemCalcFields(DataSet: TDataSet);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure DBcboTipoOperCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure DBcboTipoOperParcelaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure DBcboMoedaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure DBedtRateioBemExit(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure DBcboMoedaRubricaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure DBcboMoedaRubricaEnter(Sender: TObject);
    procedure DBcboMoedaRubricaExit(Sender: TObject);
    procedure DBedtVlrOMRubricaExit(Sender: TObject);
    procedure DBedtVlrOMParcelaExit(Sender: TObject);



  private { Private declarations }
	grdDetAtual : TwwDBGrid;
   qryDetAtual : TwwQuery;

   iImovel, iOperacao, iCarteira       : integer;
   iForCliOper, iTipoOper              : integer;
   iFaturaOper, iSubConta              : integer;
   iMoedaOper, iMoedaRubrica           : integer;
   fNoDoc                              : extended;
   fTotParcelas, fTotParcelasOM        : currency;
   dDataOper                           : TDateTime;
   sNaturezaOper, sNaturezaParcela     : string;
   sMoedaIni, sMoedaFim                : string;
   sMoedaIniRubrica, sMoedaFimRubrica  : string;
   sTipoImovel                         : string;

  public { Public declarations }
   tOperacao : TTipoOperacao;
   bParcelado : boolean;

  end;




var
  frmExecOperImovel: TfrmExecOperImovel;



implementation
{$R *.DFM}
Uses
  uSistema, uMensErro, uDatabase, dBaseDados, uModulo, uComunsImobiliario, uVerificaPreenchimento,
  uDocumento, uIntegraBack, uOperComum, FCadastroCS, uAtivoFixo, uFuncoesImob,
  FCadBem;



procedure TfrmExecOperImovel.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;

   sbtnAlterar.Enabled  := False;
   sbtnApagar.Enabled   := False;
   sbtnProcurar.Enabled := False;
end;



procedure TfrmExecOperImovel.CmeCadastroFind(Sender: TObject);
var
   sMestre: string;
begin
   inherited;

	// redesenha o form na volta do MontaSelect
	Repaint;

	// se houve busca, abre a query principal com apenas o registro buscado
	if MontaSelect.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      FechaDetalhes;

      iOperacao := StrToInt(MontaSelect.ValoresChave[0]);
		with qry do begin
         LimpaParametros(qry);
         Params[0].asInteger := iOperacao;
         Open;
      end;

      with qryLookImovel do begin
         LimpaParametros(qryLookImovel);
         Params[0].asInteger := qryIDINVESTIMENTO.asInteger;
         Open;
      end;

      sMestre  := qryLookImovelNOMEMESTRE.asString;
      if sMestre <> '' then DBcboImovelMestre.LookupValue := sMestre;

      PreencheImovel;

      AbreDetalhes(iOperacao);

      Screen.Cursor := crDefault;
   end;
end;



procedure TfrmExecOperImovel.CmeCadastroInsert(Sender: TObject);
begin
   FechaDetalhes;

   // define logo o id do registro que se está inserindo, para poder gravar nos detalhes
   iOperacao := LeUltRegistro(nil, 'OPERACAOINVEST');

	with qry do begin
      Close;
      Params[0].asInteger := iOperacao;
      Open;
   end;

   Case tOperacao of

      toCompra:
      begin
         with qryLookForCli do begin
            Close;
            SQL.Text :=
            'SELECT ' +
            '  E.IDFORCLI, E.IDPESSOA, ' +
            '  P.NOME ' +
            'FROM ' +
            '  EMPRESAFORN E, PESSOA P ' +
            'WHERE ' +
            '  ( E.IDPESSOA = ' + IntToStr(Sistema.idEmpresa) + ' ) ' +
            '  AND ' +
            '  ( E.IDFORCLI = P.IDPESSOA ) ' +
            'ORDER BY ' +
            '  P.NOME ';
            Open;
         end;
      end;

      toVenda:
      begin
         with qryLookForCli do begin
            Close;
            SQL.Text :=
            'SELECT ' +
            '  E.IDFORCLI, E.IDPESSOA, ' +
            '  P.NOME ' +
            'FROM ' +
            '  EMPRESACLIENTE E, PESSOA P ' +
            'WHERE ' +
            '  ( E.IDPESSOA = ' + IntToStr(Sistema.idEmpresa) + ' ) ' +
            '  AND ' +
            '  ( E.IDFORCLI = P.IDPESSOA ) ' +
            'ORDER BY ' +
            '  P.NOME ';
            Open;
         end;
      end;

   end;

   inherited;
   AbreQueries;
   AbreDetalhes(iOperacao);

   tbcDetalheChange(tbcDetalhe);

   if DBcboTipoOper.CanFocus then DBcboTipoOper.SetFocus;
end;



procedure TfrmExecOperImovel.CmeCadastroEdit(Sender: TObject);
begin
   inherited;

   tbcDetalheChange(tbcDetalhe);

   if DBcboTipoOper.CanFocus then DBcboTipoOper.SetFocus;
end;



procedure TfrmExecOperImovel.AtualizaImovel;
begin
   with qryAtualizaImovel do begin
      LimpaParametros(qryAtualizaImovel);

      ParamByName('IMOVEL').asInteger        := iImovel;

      Case tOperacao of

         toCompra:
         begin
            if iCarteira > -1 then begin
               ParamByName('CARTEIRA').asInteger   := iCarteira;
            end else begin
               ParamByName('CARTEIRA').Clear;
            end;

            ParamByName('TIPO').asString           := DBcboTipoImovel.LookupValue;
         end;

         toVenda:
         begin
            ParamByName('CARTEIRA').Clear;
            ParamByName('TIPO').Clear;
         end;

      end;

      ExecSQL;
   end;
end;



procedure TfrmExecOperImovel.CmeCadastroConfirma(Sender: TObject);
begin
	if CmeCadastro.Operacao = opInserir then begin

      StartTransacao;

      try

         qryIDOPERACAOINVEST.asInteger   := iOperacao;
         qryEMPRESAPROP.asInteger        := Sistema.idEmpresa;
         qryIDTIPOINVEST.asInteger       := 3;

         if Modulo.bIntegraGestao then qryIDCARTEIRAINVEST.asInteger := iCarteira;

         qry.ApplyUpdates;

         if Efetiva then begin

            // grava no imovel a Carteira e o Tipo
            AtualizaImovel;

            if Modulo.bIntegraAtivo then qryImovelxBem.ApplyUpdates;
            qryParcelas.ApplyUpdates;

            qryDespesasXTipoOper.CancelUpdates;

            CommitTransacao;

            Screen.Cursor := crDefault;
            MsgDlg('A Operação foi registrada com sucesso.', 'Informação', mtInformation, [mbOk], 0);
            Repaint;

         end else begin

            // se houve problema, faz Cancel
            RollBackTransacao;

            qryImovelxBem.CancelUpdates;
            qryParcelas.CancelUpdates;
            qry.CancelUpdates;

            qryDespesasXTipoOper.CancelUpdates;

            Screen.Cursor := crDefault;
            MsgDlg('O Operação não foi registrada.', 'Erro', mtError, [mbOk], 0);
            Repaint;

         end;

      except
         // se houve problema, faz Cancel
         RollBackTransacao;

         qryDespesasXTipoOper.CancelUpdates;
         qryImovelxBem.CancelUpdates;
         qryParcelas.CancelUpdates;
         qry.CancelUpdates;

         Screen.Cursor := crDefault;
         MsgDlg('Falha de gravação. A Operação não foi registrada.', 'Erro', mtError, [mbOk], 0);
         Repaint;
         Raise;
         Repaint;
      end;

   end;
end;



procedure TfrmExecOperImovel.CmeCadastroCancel(Sender: TObject);
begin
   Screen.Cursor := crHourGlass;

   inherited;

	// fecha e abre as queries principal contendo zero registros
	with qryImovelxBem do begin
      Close;
      Params[0].asInteger := Sistema.idEmpresa;
      Params[1].asInteger := 0;
      Open;
   end;

	with qry do begin
      Close;
      Params[0].asInteger := 0;
      Open;
   end;

   DBcboImovelMestre.Clear;
   DBcboTipoImovel.Clear;

   Screen.Cursor := crDefault;
end;



procedure TfrmExecOperImovel.CmeDetalheInsert(Sender: TObject);
begin
   inherited;

   if qryDetAtual = qryImovelxBem then begin
      if DBcboGrupo.CanFocus then DBcboGrupo.SetFocus;
   end;

   if qryDetAtual = qryDespesasXTipoOper then begin
      if DBedtVlrOMRubrica.CanFocus then DBedtVlrOMRubrica.SetFocus;
   end;

   if qryDetAtual = qryParcelas then begin
      qryParcelasMOECODIGO.asInteger  := qryMOECODIGO.asInteger;
      qryParcelasTIPOOPER.asInteger   := qryIDTIPOOPERACAO.asInteger;
      if DBedtNoParcela.CanFocus then DBedtNoParcela.SetFocus;
   end;
end;



procedure TfrmExecOperImovel.CmeDetalheEdit(Sender: TObject);
begin
   inherited;

   if qryDetAtual = qryImovelxBem then begin
      if DBcboGrupo.CanFocus then DBcboGrupo.SetFocus;
   end;

   if qryDetAtual = qryDespesasXTipoOper then begin
      if DBedtVlrOMRubrica.CanFocus then DBedtVlrOMRubrica.SetFocus;
   end;

   if qryDetAtual = qryParcelas then begin
      qryParcelasMOECODIGO.asInteger := qryMOECODIGO.asInteger;
      if DBedtNoParcela.CanFocus then DBedtNoParcela.SetFocus;
   end;
end;



procedure TfrmExecOperImovel.CmeDetalheConfirma(Sender: TObject);
begin
	if ( (qryDetAtual <> nil) and (qryDetAtual.State in [dsInsert, dsEdit]) ) then begin

      if ( (qryDetAtual = qryImovelxBem) and (Modulo.bIntegraAtivo) ) then begin
         qryImovelxBemIDIMOVEL.asInteger := iImovel;
         qryImovelxBemIDPESSOA.asInteger := Sistema.idEmpresa;
      end;

      if qryDetAtual = qryParcelas then begin
         qryParcelasIDPARCELA.asInteger     := LeUltRegistro(nil, 'PARCELASIMOB');
         qryParcelasIDCONTRATOIMOVEL.Value  := NULL;
         qryParcelasNATUREZA.asString       := qryLookTipoOperParcelaNATUREZAOPERACAO.asString;
         qryParcelasRECPAG.asString         := qryLookTipoOperParcelaRECPAG.asString;
      end;

      inherited;

      // totaliza as parcelas a cada gravação
      if qryDetAtual = qryParcelas then begin
         with qryParcelas do begin
            First;

            fTotParcelas   := 0;
            fTotParcelasOM := 0;

            while not(EOF) do begin
               fTotParcelasOM := fTotParcelasOM + FieldByName('PARVLROM').asFloat;
               fTotParcelas   := fTotParcelas   + FieldByName('PARVLR').asFloat;

               Next;
            end;

         end;

         if qry.State in [dsInsert, dsEdit] then begin
            qryVLROPERACAOOM.asFloat  := fTotParcelasOM;
            qryVLROPERACAO.asFloat    := fTotParcelas;
         end;

      end;
   end;
end;



function TfrmExecOperImovel.Efetiva: boolean;
begin
   Result := False;

   Screen.Cursor := crHourGlass;

   try
      try

         // atribui parâmetros comuns a todas as funções
         DefineParametros;

         // Operação
         if not(GeraOperacao) then Exit;

         // Rubrica(s) da Operação
         if not(GeraDespesas) then Exit;

         // Parcelas
         if bParcelado then begin
            // grava e lança as Parcelas
            if not(GeraParcelas) then Exit;
         end;

         // se tudo der certo...
         Result := True;

      except
         Result := False;
         Screen.Cursor := crDefault;
         Raise;
         Exit;
      end;

   finally
      Screen.Cursor := crDefault;
   end;
end;



function TfrmExecOperImovel.BuscaForCli: integer;
begin
   with qryForCliXTipoOper do begin
      LimpaParametros(qryForCliXTipoOper);

      ParamByName('EMPRESAPROP').asInteger   := Sistema.idEmpresa;
      ParamByName('TIPOOPER').asInteger      := iTipoOper;

      Open;

      Result := -1;
      if not(isEmpty) then Result := FieldByName('IDFORCLI').asInteger;

      Close;
   end;
end;



procedure TfrmExecOperImovel.DefineParametros;
begin
   iCarteira      := -1;
   if DBcboCarteira.LookupValue <> '' then iCarteira := StrToInt(DBcboCarteira.LookupValue);

   iForCliOper    := -1;
   if DBcboForCliOper.LookupValue <> '' then iForCliOper := StrToInt(DBcboForCliOper.LookupValue);

   iMoedaOper     := -1;
   if DBcboMoeda.LookupValue <> '' then iMoedaOper := StrToInt(DBcboMoeda.LookupValue);

   sTipoImovel    := DBcboTipoImovel.LookupValue;
   dDataOper      := DBedtDataOper.Date;
end;



function TfrmExecOperImovel.GeraOperacao: boolean;
var
   iPlano, iPlanilhaOper         : integer;
   iDocumentoOper, iMoeda        : integer;
   iResultOper                   : shortint;
   fVlrOperOM, fVlrOper, fQuant  : currency;
   sHistOper, sErro, sRecPag     : string;
   dDataVencOper                 : TDateTime;
begin
   Result := False;

   fVlrOperOM     := qryVLROPERACAOOM.asCurrency;
   fVlrOper       := qryVLROPERACAO.asCurrency;
   fQuant         := 1;
   dDataVencOper  := DBedtDataVenc.Date;

   iPlano         := IntegraBack.Plano;
   iPlanilhaOper  := -1;
   iFaturaOper    := -1;

   // para efeito de CAP/CAR, se a moeda for nula...
   iMoeda := iMoedaOper;
   if ( (iMoedaOper <= 0) or (iMoedaOper = Modulo.iMoedaCorrente) ) then iMoeda := -1;
   if iMoeda = -1 then fVlrOperOM := 0;

   // contabiliza, lança no CaP/CaR
   iResultOper := OperComum.LancaOperInvest(Sistema.idEmpresa, Sistema.idModulo, 3{TipoInvest},
   iTipoOper, iOperacao, iForCliOper, iCarteira, iMoeda, iImovel, sTipoImovel, ''{Complemento}, 'T',
   fVlrOperOM, fVlrOper, dDataOper, dDataVencOper, True, bParcelado, iPlano, iPlanilhaOper,
   iDocumentoOper, iFaturaOper, fNoDoc, sHistOper, sErro);

   if iResultOper >= -2 then begin

      // aqui, integra antes com o Ativo para o caso de venda, onde o Lucro precisa ser alimentado
      // antes da baixa
      if Modulo.bIntegraAtivo then begin
         if qryLookTipoOperFLGGERACAF.asInteger = 1 then begin
            // se a operação gerar mudança nos valores do Ativo Fixo
            if not(IntegraCAF(fVlrOper)) then Exit;
         end;
      end;

      if ( (Modulo.bIntegraGestao) and not(bParcelado) ) then begin

         sRecPag  := qryLookTipoOperRECPAG.asString;

         // movimenta Carteira e grava histórico
         if OperComum.AlimentaCarteira(Sistema.idEmpresa, Sistema.idModulo, iImovel,
         3{TipoInvest}, iOperacao, -1{LancImovel}, iTipoOper, iCarteira, -1{DespesaOper},
         -1{DespesaCarteira}, iPlanilhaOper, iDocumentoOper, IntegraBack.Plano, dDataOper, fVlrOper,
         fQuant, Modulo.fVlrPrimeiraCota, 0, 0, 0, 0, 0, 0, 0, sNaturezaOper{NaturezaMovimento},
         sNaturezaOper{NaturezaOperacao}, ''{Lote}, sHistOper{Historico}, 'OPE'{TipoMovimento},
         ''{flgCustodia}, sRecPag{RecPag}, True) <= 0 then Exit;

         OperComum.AtualizaSaldos(Modulo.fVlrPrimeiraCota, -1);
      end;

      Result := True;

   end else begin
      Case iResultOper of
         -3: MsgDlg('Houve falha na gravação da Operação!', 'Erro', mtError, [mbOk], 0);
         -4: MsgDlg('Foi encontrada ambigüidade nos padrões de lançamento da Operação!', 'Erro', mtError, [mbOk], 0);
         -5: MsgDlg('Não foi encontrado padrão de lançamento para a Operação desejada! Favor rever o cadastro.', 'Erro', mtError, [mbOk], 0);
         -6: MsgDlg('Não foi possível efetuar o lançamento contábil da Operação!', 'Erro', mtError, [mbOk], 0);
         -7: MsgDlg('Não foi possível efetuar o lançamento de Contas a Pagar/Receber da Operação!', 'Erro', mtError, [mbOk], 0);
      end;
      Repaint;
   end;
end;



function TfrmExecOperImovel.GeraDespesas: boolean;
var
   iForCliDesp, iTipoDesp, iPlano   : integer;
   iMoeda, iMoedaDesp, iDespesa     : integer;
   iPlanilhaDesp, iDocumentoDesp    : integer;
   sNaturezaDesp, sHistDesp         : string;
   sErro, sObsDesp, sRecPag         : string;
   iResultDesp                      : shortint;
   fVlrDespOM, fVlrDesp             : currency;
   dDataVencDesp                    : TDateTime;
begin
   Result := False;

   with qryDespesasXTipoOper do begin

      First;
      while not(EOF) do begin

         iTipoDesp      := qryDespesasXTipoOperIDTIPODESPINVEST.asInteger;
         iMoedaDesp     := qryDespesasXTipoOperMOEDA.asInteger;
         iForCliDesp    := qryDespesasXTipoOperFORCLI.asInteger;
         fVlrDespOM     := qryDespesasXTipoOperVLROM.asFloat;
         fVlrDesp       := qryDespesasXTipoOperVLR.asFloat;
         dDataVencDesp  := qryDespesasXTipoOperDATAVENC.asDateTime;
         sNaturezaDesp  := qryDespesasXTipoOperNATUREZAOPERACAO.asString;
         sObsDesp       := qryDespesasXTipoOperDESCTIPODESPINV.asString;
         sRecPag        := qryDespesasXTipoOperRECPAG.asString;

         if fVlrDesp <> 0 then begin

            iDespesa       := RegistraDespesa(-1, False);

            // define que cada rubrica será gravada em um planilha nova
            iPlano         := IntegraBack.Plano;
            iPlanilhaDesp  := -1;

            // para efeito de CAP/CAR, se a moeda for nula...
            iMoeda := iMoedaDesp;
            if ( (iMoedaDesp <= 0) or (iMoedaDesp = Modulo.iMoedaCorrente) ) then iMoeda := -1;
            if iMoeda = -1 then fVlrDespOM := 0;

            // contabiliza, lança no CaP/CaR
            iResultDesp := OperComum.LancaDespInvest(Sistema.idEmpresa, Sistema.idModulo,
            3{TipoInvest}, iTipoOper, iTipoDesp, iOperacao, iDespesa, iForCliDesp, iCarteira,
            iMoeda, iImovel, sTipoImovel, fVlrDespOM, fVlrDesp, dDataOper, dDataVencDesp, True,
            iPlano, iPlanilhaDesp, iDocumentoDesp, sHistDesp, sErro);

            if iResultDesp >= -2 then begin

               if Modulo.bIntegraGestao then begin
                  // movimenta Carteira e grava histórico
                  if OperComum.AlimentaCarteira(Sistema.idEmpresa, Sistema.idModulo, iImovel,
                  3{TipoInvest}, iOperacao, -1{LancImovel}, iTipoOper, iCarteira, iDespesa,
                  -1{DespesaCarteira}, iPlanilhaDesp, iDocumentoDesp, IntegraBack.Plano, dDataOper,
                  fVlrDesp, 0{QuantInvest}, Modulo.fVlrPrimeiraCota, 0, 0, 0, 0, 0, 0, 0,
                  sNaturezaDesp{NaturezaMovimento}, sNaturezaOper{NaturezaOperacao}, ''{Lote},
                  sHistDesp{Historico}, 'DOP'{TipoMovimento}, ''{flgCustodia}, sRecPag{RecPag},
                  True) <= 0 then Exit;

                  OperComum.AtualizaSaldos(Modulo.fVlrPrimeiraCota, -1);
               end;

               if Modulo.bIntegraAtivo then begin
                  if FieldByName('FLGGERACAF').asInteger = 1 then begin
                     // se a despesa gera mudança nos valores do Ativo Fixo
                     if not(AgregaValor(fVlrDesp, sObsDesp)) then Exit;
                  end;
               end;

            end else begin
               Case iResultDesp of
                  -3: MsgDlg('Houve falha na gravação da Rubrica!', 'Erro', mtError, [mbOk], 0);
                  -4: MsgDlg('Foi encontrada ambigüidade nos padrões de lançamento da Rubrica!', 'Erro', mtError, [mbOk], 0);
                  -5: MsgDlg('Não foi encontrado padrão de lançamento para a Rubrica desejada! Favor rever o cadastro.', 'Erro', mtError, [mbOk], 0);
                  -6: MsgDlg('Não foi possível efetuar o lançamento contábil da Rubrica!', 'Erro', mtError, [mbOk], 0);
                  -7: MsgDlg('Não foi possível efetuar o lançamento de Contas a Pagar/Receber da Rubrica!', 'Erro', mtError, [mbOk], 0);
               end;
               Repaint;
               Exit;
            end;

         end;
         Next;
      end;

      Result := True;
   end;
end;



function TfrmExecOperImovel.GeraParcelas: boolean;
var
   iOperParcela, iPlano, iPlanilha        : integer;
   iDocumento, iTipoOperParcela, iMoeda   : integer;
   fQuantParcela, fSaldoParcelas          : double;
   fVlrParcela, fVlrParcelaOM             : currency;
   sErro, sComplemento, sHistParcela      : string;
   sRecPag                                : string;

   dDataVencPar      : TDateTime;
   iContador         : word;
   iResultParcela    : smallint;
begin
   Result := False;

   try
      if bParcelado then begin

         with qryParcelas do begin

            // contador para identificar o último registro
            iContador      := qryParcelas.RecordCount;
            fSaldoParcelas := 1;

            First;
            while not(EOF) do begin

               iOperParcela      := LeUltRegistro(nil, 'OPERACAOINVEST');
               iTipoOperParcela  := qryParcelasTIPOOPER.asInteger;
               fVlrParcela       := FieldByName('PARVLR').asFloat;
               fVlrParcelaOM     := FieldByName('PARVLROM').asFloat;
               dDataVencPar      := qryParcelasPARDATAVENC.asFloat;
               sNaturezaParcela  := qryParcelasNATUREZA.asString;
               sComplemento      := IntToStr(qryParcelasPARNUMERO.asInteger);
               fQuantParcela     := qryParcelasPARQTDE.asFloat;
               fQuantParcela     := 1 / ( fTotParcelasOM / FieldByName('PARVLROM').asFloat);
               sRecPag           := qryParcelasRECPAG.asString;

               dec(iContador);

               if iContador = 0 then begin
                  // ajusta o último valor
                  fQuantParcela  := fSaldoParcelas;
               end else begin
                  fSaldoParcelas := fSaldoParcelas - fQuantParcela;
               end;

               // grava a Operação referente à Parcela
               with qryInsertOperParcela do begin
                  LimpaParametros(qryInsertOperParcela);

                  ParamByName('IDOPERACAO').asInteger       := iOperParcela;
                  ParamByName('CARTEIRA').asInteger         := iCarteira;
                  ParamByName('TIPOOPER').asInteger         := iTipoOperParcela;
                  ParamByName('DATAOPER').asDateTime        := dDataOper;
                  ParamByName('QTDE').asFloat               := fQuantParcela;
                  ParamByName('PRECOUNITOPERACAO').asFloat  := fTotParcelas;
                  ParamByName('VLROPERACAO').asFloat        := qryParcelasPARVLR.asFloat;
                  ParamByName('EMPRESAPROP').asInteger      := Sistema.idEmpresa;
                  ParamByName('IDINVESTIMENTO').asInteger   := iImovel;
                  ParamByName('DATAVENCOPER').asDateTime    := dDataVencPar;
                  ParamByName('IDMODULO').asInteger         := Sistema.idModulo;
                  ParamByName('MOECODIGO').asInteger        := qryParcelasMOECODIGO.asInteger;
                  ParamByName('VLROPERACAOOM').asFloat      := qryParcelasPARVLROM.asFloat;
                  ParamByName('IDFORCLI').asInteger         := iForCliOper;
                  ParamByName('OBSERVACAO').asString        := qryParcelasPAROBSERVACAO.asString;
                  ExecSQL;
               end;

               // define que cada parcela será gravada em um planilha nova
               iPlano         := IntegraBack.Plano;
               iPlanilha      := -1;

               // para efeito de CAP/CAR, se a moeda for nula...
               iMoeda := iMoedaOper;
               if ( (iMoedaOper <= 0) or (iMoedaOper = Modulo.iMoedaCorrente) ) then iMoeda := -1;
               if iMoeda = -1 then fVlrParcelaOM := 0;

               // contabiliza, lança no CaP/CaR
               iResultParcela := OperComum.LancaOperInvest(Sistema.idEmpresa, Sistema.idModulo,
               3{TipoInvest}, iTipoOperParcela, iOperParcela, iForCliOper, iCarteira, iMoeda, iImovel,
               sTipoImovel, sComplemento, 'P', fVlrParcelaOM, fVlrParcela, dDataOper, dDataVencPar,
               True, True, iPlano, iPlanilha, iDocumento, iFaturaOper, fNoDoc, sHistParcela, sErro);

               if iResultParcela >= -2 then begin

                  if Modulo.bIntegraGestao then begin
                     // movimenta Carteira e grava histórico
                     if OperComum.AlimentaCarteira(Sistema.idEmpresa, Sistema.idModulo, iImovel,
                     3{TipoInvest}, iOperacao, -1{LancImovel}, iTipoOperParcela, iCarteira,
                     -1{DespesaOper}, -1{DespesaCarteira}, iPlanilha, iDocumento, IntegraBack.Plano,
                     dDataVencPar, fVlrParcela, fQuantParcela{QuantInvest}, Modulo.fVlrPrimeiraCota,
                     0, 0, 0, 0, 0, 0, 0, sNaturezaParcela{NaturezaMovimento},
                     sNaturezaParcela{NaturezaOperacao}, ''{Lote}, sHistParcela{Historico},
                     'OPE'{TipoMovimento}, ''{flgCustodia}, sRecPag, True) <= 0 then Exit;

                     OperComum.AtualizaSaldos(Modulo.fVlrPrimeiraCota, -1);
                  end;
//--------------------------------------------------------------------------------------------------

               end else begin
                  Result := False;
                  Exit;
               end;

               Next;
            end;
         end;

      end;

      Result := True;

   except
      Result := False;
      Screen.Cursor := crDefault;
      Raise;
      Repaint;
   end;
end;



function TfrmExecOperImovel.IntegraCAF(fVlrCAF: currency): boolean;
var
   iPlanilhaLucroPreju     : integer;
   iBem, iLucroPreju       : integer;
   fLucroPreju, fVlrBem    : currency;
   fLucroPrejuAtivo        : currency;
   fTotLucroPreju          : currency;
   sNaturezaLucroPreju     : string;
begin
   Result := False;

   with qryImovelxBem do begin

      First;
      fTotLucroPreju := 0;

      while not(EOF) do begin

         iBem                 := FieldByName('IDBEM').asInteger;
         iPlanilhaLucroPreju  := -1;
         fVlrBem              := fVlrCAF * FieldByName('IXBPERCENT').asFloat / 100;

         case tOperacao of

            toCompra: // executa a entrada
               if AtivoFixo.ExecutaEntradaTotal(Sistema.idModulo, Sistema.idEmpresa, iBem, dDataOper,
               fVlrBem, iSubConta, -1, True) < 0 then Exit;

            toVenda:
            begin
               // executa a baixa
               if not(AtivoFixo.ExecutaBaixa(Sistema.idModulo, Sistema.idEmpresa, iBem, -1, dDataOper,
               100, fVlrBem, DBedtObsOper.Text, True, fLucroPrejuAtivo, fLucroPreju,
               iPlanilhaLucroPreju)) then Exit;

               fTotLucroPreju := fTotLucroPreju + fLucroPrejuAtivo;
            end;
         end;

         Next;

      end;
   end;

   // lança na Carteira o Lucro / Prejuízo
   if tOperacao = toVenda then begin
      if Modulo.bIntegraGestao then begin

         fTotLucroPreju       := abs(fTotLucroPreju);
         if fTotLucroPreju > 0 then begin
            iLucroPreju          := RegistraDespesa(fTotLucroPreju, True);
            sNaturezaLucroPreju  := qryLookTipoDespesaNATUREZAOPERACAO.asString;

            // movimenta Carteira e grava histórico
            if OperComum.AlimentaCarteira(Sistema.idEmpresa, Sistema.idModulo, iImovel, 3{TipoInvest},
            iOperacao, -1{LancImovel}, iTipoOper, iCarteira, iLucroPreju, -1{DespesaCarteira},
            iPlanilhaLucroPreju, -1{Documento}, IntegraBack.Plano, dDataOper, fTotLucroPreju,
            0 {QuantInvest}, Modulo.fVlrPrimeiraCota, 0, 0, 0, 0, 0, 0, 0, sNaturezaLucroPreju{NaturezaMovimento},
            sNaturezaOper{NaturezaOperacao}, ''{Lote}, 'Lucro / Prejuízo de Alienação de Imóveis'{Historico},
            'MVI'{TipoMovimento}, ''{flgCustodia}, ''{RecPag}, True) <= 0 then Exit;
         end;

         OperComum.AtualizaSaldos(Modulo.fVlrPrimeiraCota, -1);
      end;
   end;

   Result := True;
end;



function TfrmExecOperImovel.AgregaValor(fVlrAgregar: currency; sObs: string): boolean;
var
   iBem        : integer;
   fTaxa       : double;
   fVlrAgreg   : currency;
begin
   Result := False;

   // só agrega se for compra
   if tOperacao = toCompra then begin

      try

         with qryImovelxBem do begin
            First;

            // agrega valor a cada Bem do Imóvel
            while not(EOF) do begin

               iBem        := FieldByName('IDBEM').asInteger;
               fVlrAgreg   := fVlrAgregar * FieldByName('IXBPERCENT').asFloat / 100;

               if AtivoFixo.ExecutaAcrescimo(Sistema.idModulo, Sistema.idEmpresa, iBem, dDataOper,
               fVlrAgreg, sObs, -1, fTaxa, True) < 0 then Exit;

               Next;
            end;

         end;

      except
         Screen.Cursor := crDefault;
         Raise;
         Exit;
      end;

   end;

   Result := True;
end;



function TfrmExecOperImovel.RegistraDespesa(fLucroPreju: currency; bLucroPreju: boolean): integer;
var
   iRubrica : integer;
begin
   with qryInsertRubrica do begin
      LimpaParametros(qryInsertRubrica);

      iRubrica                               := LeUltRegistro(nil, 'DESPOPERINVEST');

      ParamByName('IDRUBRICA').asInteger     := iRubrica;

      if not(bLucroPreju) then begin
         ParamByName('MOEDA').asInteger      := qryDespesasXTipoOperMOEDA.asInteger;
         ParamByName('FORCLI').asInteger     := qryDespesasXTipoOperFORCLI.asInteger;
         ParamByName('TIPORUBRICA').asInteger:= qryDespesasXTipoOperIDTIPODESPINVEST.asInteger;
         ParamByName('VALOR').asFloat        := qryDespesasXTipoOperVLR.asFloat;
         ParamByName('VALOROM').asFloat      := qryDespesasXTipoOperVLROM.asFloat;
         ParamByName('DATAVENC').asDateTime  := qryDespesasXTipoOperDATAVENC.asDateTime;
      end else begin
         ParamByName('MOEDA').Clear;
         ParamByName('FORCLI').Clear;
         ParamByName('TIPORUBRICA').asInteger:= StrToInt(DBcboLucroPreju.LookupValue);
         ParamByName('VALOR').asFloat        := fLucroPreju;
         ParamByName('VALOROM').Clear;
         ParamByName('DATAVENC').asDateTime  := dDataOper;
      end;

      ParamByName('EMPRESAPROP').asInteger   := Sistema.idEmpresa;
      ParamByName('TIPOOPER').asInteger      := iTipoOper;
      ParamByName('IDOPERACAO').asInteger    := iOperacao;

      ParamByName('DATAOPER').asDateTime     := dDataOper;

      ExecSQL;
   end;

   Result := iRubrica;
end;



procedure TfrmExecOperImovel.PreencheImovel;
begin
   // carteira de investimentos
   if not(qryLookImovelIDCARTEIRAINVEST.isNULL) then begin

      if CmeCadastro.Operacao in [opInserir, opAlterar] then begin

         iCarteira := qryLookImovelIDCARTEIRAINVEST.asInteger;
         with qryLookCarteira do begin
            LimpaParametros(qryLookCarteira);
            Params[0].asInteger := iCarteira;
            Open;
         end;

         qryIDCARTEIRAINVEST.asInteger := iCarteira;

      end;

      btnBuscaCarteira.Enabled   := False;

   end else begin
      DBcboCarteira.LookupValue  := '';
      if tOperacao = toCompra then btnBuscaCarteira.Enabled   := True;
   end;

   if not(qryLookTipoImovel.Active) then qryLookTipoImovel.Open;

   // tipo de imóvel
   if not(qryLookImovelCODTIPIMOVEL.isNULL) then begin;
      DBcboTipoImovel.LookupValue   := qryLookImovelCODTIPIMOVEL.asString;
      DBcboTipoImovel.Enabled       := False;
   end else begin
      DBcboTipoImovel.LookupValue   := '';
      if tOperacao = toCompra then DBcboTipoImovel.Enabled := True;
   end;

   with qryImovelxBem do begin
      LimpaParametros(qryImovelxBem);
      ParamByName('EMPRESAPROP').asInteger   := Sistema.idEmpresa;
      ParamByName('IMOVEL').asInteger        := iImovel;
      Open;
   end;
end;



procedure TfrmExecOperImovel.BuscaBem;
begin
   MontaSelectBem.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if MontaSelectBem.RetornouValor then begin
      qryImovelxBemIDBEM.asInteger := StrToInt(MontaSelect.ValoresChave[0]);
   end;
end;



procedure TfrmExecOperImovel.ConverteValorOperacao;
var
   fValor, fValorOM  : currency;
   sMensagem         : string;
begin
   fValorOM    := qryVLROPERACAOOM.asCurrency;

   fValor      := FuncoesImob.ConverteMoeda(iMoedaOper, fValorOM, DBedtDataOper.Date, True);

   // verifica se houve conversão com a cotação de hoje...
   if fValor = -1 then begin
      sMensagem   := 'Não existe cotação atualizada para a Moeda selecionada!' + chr(13) +
                     'Deseja utilizar a última cotação cadastrada?';

      // não havendo, pergunta se deseja-se usar a última cotação cadastrada...
      if MsgDlg(sMensagem, 'Aviso', mtWarning, [mbYes, mbNo], 0) = mrYes then begin;
         Repaint;
         // tenta a conversão com a última cotação cadastrada...
         fValor := FuncoesImob.ConverteMoeda(iMoedaOper, fValorOM, DBedtDataOper.Date, False);

         // se mesmo assim não for possível:
         if fValor = -1 then begin
            sMensagem   := 'Não existe cotação para a Moeda selecionada!' + chr(13) +
                           'Favor verificar.';

            MsgDlg(sMensagem, 'Erro', mtError, [mbOk], 0);
            Repaint;

            DBcboMoeda.SetFocus;

         end else begin

            qryVLROPERACAO.asFloat := fValor;
            DBedtVlrOM.Modified := False;

         end;

      end else begin
         // não se desejando fazer conversão pela última cotação cadastrada:
         Repaint;
         DBcboMoeda.SetFocus;
      end;

   end else begin

      // houve conversão; preenche os valores de acordo com pagar/receber
      qryVLROPERACAO.asFloat  := fValor;
      DBedtVlrOM.Modified     := False;

   end;
end;



procedure TfrmExecOperImovel.ConverteValorRubrica;
var
   fValor, fValorOM  : currency;
   sMensagem         : string;
begin
   iMoedaRubrica  := StrToInt(DBcboMoedaRubrica.LookupValue);
   fValorOM       := qryDespesasXTipoOperVLROM.asCurrency;

   fValor         := FuncoesImob.ConverteMoeda(iMoedaRubrica, fValorOM, DBedtDataOper.Date, True);

   // verifica se houve conversão com a cotação de hoje...
   if fValor = -1 then begin
      sMensagem   := 'Não existe cotação atualizada para a Moeda selecionada!' + chr(13) +
                     'Deseja utilizar a última cotação cadastrada?';

      // não havendo, pergunta se deseja-se usar a última cotação cadastrada...
      if MsgDlg(sMensagem, 'Aviso', mtWarning, [mbYes, mbNo], 0) = mrYes then begin;
         Repaint;
         // tenta a conversão com a última cotação cadastrada...
         fValor := FuncoesImob.ConverteMoeda(iMoedaRubrica, fValorOM, DBedtDataOper.Date, False);

         // se mesmo assim não for possível:
         if fValor = -1 then begin
            sMensagem   := 'Não existe cotação para a Moeda selecionada!' + chr(13) +
                           'Favor verificar.';

            MsgDlg(sMensagem, 'Erro', mtError, [mbOk], 0);
            Repaint;

            DBcboMoeda.SetFocus;

         end else begin

            qryDespesasXTipoOperVLR.asFloat := fValor;
            DBedtVlrOMRubrica.Modified := False;

         end;

      end else begin
         // não se desejando fazer conversão pela última cotação cadastrada:
         Repaint;
         DBcboMoeda.SetFocus;
      end;

   end else begin

      // houve conversão; preenche os valores de acordo com pagar/receber
      qryDespesasXTipoOperVLR.asFloat := fValor;
      DBedtVlrOMRubrica.Modified := False;

   end;
end;



procedure TfrmExecOperImovel.ConverteValorParcela;
var
   fValor, fValorOM  : currency;
   sMensagem         : string;
begin
   fValorOM    := qryParcelasPARVLROM.asCurrency;

   fValor      := FuncoesImob.ConverteMoeda(iMoedaOper, fValorOM, DBedtDataOper.Date, True);

   // verifica se houve conversão com a cotação de hoje...
   if fValor = -1 then begin
      sMensagem   := 'Não existe cotação atualizada para a Moeda selecionada!' + chr(13) +
                     'Deseja utilizar a última cotação cadastrada?';

      // não havendo, pergunta se deseja-se usar a última cotação cadastrada...
      if MsgDlg(sMensagem, 'Aviso', mtWarning, [mbYes, mbNo], 0) = mrYes then begin;
         Repaint;
         // tenta a conversão com a última cotação cadastrada...
         fValor := FuncoesImob.ConverteMoeda(iMoedaOper, fValorOM, DBedtDataOper.Date, False);

         // se mesmo assim não for possível:
         if fValor = -1 then begin
            sMensagem   := 'Não existe cotação para a Moeda selecionada!' + chr(13) +
                           'Favor verificar.';

            MsgDlg(sMensagem, 'Erro', mtError, [mbOk], 0);
            Repaint;

            if DBcboMoedaParcela.CanFocus then DBcboMoedaParcela.SetFocus;

         end else begin

            qryParcelasPARVLR.asFloat  := fValor;
            DBedtVlrOMParcela.Modified := False;

         end;

      end else begin
         // não se desejando fazer conversão pela última cotação cadastrada:
         Repaint;
         if DBcboMoedaParcela.CanFocus then DBcboMoedaParcela.SetFocus;
      end;

   end else begin

      // houve conversão; preenche os valores de acordo com pagar/receber
      qryParcelasPARVLR.asFloat  := fValor;
      DBedtVlrOMParcela.Modified := False;

   end;
end;



function TfrmExecOperImovel.VerificaPreenchimento: boolean;
var
   fTotRateioImovel : currency;
begin
   Result := False;

	try

      if DBcboTipoOper.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Operação de Investimento!', DBcboTipoOper);

      if DBcboImovel.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar o Imóvel!', btnBuscaImovel);

      if Modulo.bIntegraGestao then
         if DBcboCarteira.LookupValue = '' then
            raise EValidacao.CreateVal('É necessário indicar a Carteira de Investimentos!', btnBuscaCarteira);

      if Modulo.bIntegraGestao then
         if DBcboTipoImovel.LookupValue = '' then
            raise EValidacao.CreateVal('É necessário indicar Tipo do Imóvel!', DBcboTipoImovel);

      if DBcboMoeda.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar a Moeda da Operação!', DBcboMoeda);

      if qryDATAOPERACAO.isNULL then
         raise EValidacao.CreateVal('É necessário indicar a Data da Operação!', DBedtDataOper);

      if qryDATAVENCOPER.isNULL then
         raise EValidacao.CreateVal('É necessário indicar a Data de Vencimento!', DBedtDataVenc);

      if qryLookTipoOperFLGGERACAPCAR.asInteger = 1 then
         if DBcboForCliOper.LookupValue = '' then
            raise EValidacao.CreateVal('É necessário indicar o Credor/Debitado da Operação!', DBcboForCliOper);

	except

    	on ev : EValidacao do begin
			if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

// Rateio dos Bens ---------------------------------------------------------------------------------

   if ( (Modulo.bIntegraAtivo) and (qryLookTipoOperFLGGERACAF.asInteger = 1) ) then begin

      with qryImovelxBem do begin
         First;

         fTotRateioImovel  := 0;
         while not(EOF) do begin
            fTotRateioImovel  := fTotRateioImovel + FieldByName('IXBPERCENT').asFloat;
            Next;
         end;
      end;

      if fTotRateioImovel <> 100 then begin
         MsgDlg('O total do rateio dos Bens não perfaz 100%!', 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         Exit;
      end;

   end;

   if not(VerificaLinhaGrid(qryImovelxBem, 1, 2, 'Bens', True)) then Exit;

   Result := True;
end;



function TfrmExecOperImovel.VerificaPreenchimentoDetalhe: boolean;
begin
   Result := False;

   // só verifica se estiver fazendo uma inclusão ou alteração
	if ( (qryDetAtual <> nil) and (qryDetAtual.State in [dsInsert, dsEdit]) ) then begin

// Bem ---------------------------------------------------------------------------------------------

      if qryDetAtual = qryImovelxBem then begin

         try

            if qryImovelxBemIXBGRUPO.isNULL then
               raise EValidacao.CreateVal('É necessário indicar o Grupo ao qual pertence o Bem!', DBcboGrupo);

            if qryImovelxBemIDBEM.isNULL then
               raise EValidacao.CreateVal('É necessário indicar o Bem!', btnBuscaBem);

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
      end;


// Rubricas ----------------------------------------------------------------------------------------

      if qryDetAtual = qryDespesasXTipoOper then begin

         try

            if qryDespesasXTipoOperVLROM.asFloat = 0 then
               raise EValidacao.CreateVal('É necessário indicar o Valor OM da Rubrica!', DBedtVlrOMRubrica);

            if qryDespesasXTipoOperMOEDA.isNULL then
               raise EValidacao.CreateVal('É necessário indicar a Moeda da Rubrica!', DBcboMoedaRubrica);

            if qryDespesasXTipoOperDATAVENC.isNULL then
               raise EValidacao.CreateVal('É necessário indicar a Data de Vencimento da Rubrica!', DBedtDataDesp);

            if qryDespesasXTipoOperFORCLI.isNULL then
               raise EValidacao.CreateVal('É necessário indicar Credor / Debitado da Rubrica!', DBcboForCliDesp);

         except

            on ev : EValidacao do begin
               if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
               Repaint;
               tbcDetalhe.TabIndex        := 2;
               pgctrlDetalhe.ActivePage   := tbsRubrica;
               if ev.Control.CanFocus then ev.Control.SetFocus;
               Exit;
            end;

         end;
      end;

// Bem ---------------------------------------------------------------------------------------------

      if qryDetAtual = qryParcelas then begin

         try

            if qryParcelasPARNUMERO.asInteger <= 0 then
               raise EValidacao.CreateVal('É necessário indicar o nº da Parcela!', DBedtNoParcela);

            if qryParcelasPARPARCELA.isNULL then
               raise EValidacao.CreateVal('É necessário indicar a Descrição da Parcela!', DBedtParcela);

            if qryParcelasTIPOOPER.isNULL then
               raise EValidacao.CreateVal('É necessário indicar o Tipo de Operação da Parcela!', DBcboTipoOperParcela);

            if qryParcelasPARVLROM.isNULL then
               raise EValidacao.CreateVal('É necessário indicar o Valor OM da Parcela!', DBedtVlrOMParcela);

            if qryParcelasPARDATAVENC.isNULL then
               raise EValidacao.CreateVal('É necessário indicar a Data de Vencimento da Parcela!', DBedtDataParcela);

         except

            on ev : EValidacao do begin
               if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
               Repaint;
               tbcDetalhe.TabIndex        := 3;
               pgctrlDetalhe.ActivePage   := tbsParcelas;
               if ev.Control.CanFocus then ev.Control.SetFocus;
               Exit;
            end;

         end;
      end;

// -------------------------------------------------------------------------------------------------

   end;

   Result := True;
end;



procedure TfrmExecOperImovel.AbreQueries;
begin
   qryLookMoeda.Open;
   qryLookTipoOper.Open;
   qryLookTipoOperParcela.Open;
   qryLookForCli.Open;
   qryLookTipoImovel.Open;
   qryLookTipoDespesa.Open;
end;



procedure TfrmExecOperImovel.AbreDetalhes(i: integer);
begin
   with qryParcelas do begin
      LimpaParametros(qryParcelas);
      ParamByName('OPERACAO').asInteger := i;
      Open;
   end;
end;



procedure TfrmExecOperImovel.FechaDetalhes;
begin
   qryParcelas.Close;
   qryImovelxBem.Close;
   qryDespesasXTipoOper.Close;
end;



procedure TfrmExecOperImovel.FechaQueries;
begin
   qry.Close;
   qry.UnPrepare;

   qryInsertOperParcela.Close;
   qryInsertOperParcela.UnPrepare;

   qryInsertRubrica.Close;
   qryInsertRubrica.UnPrepare;

   qryAtualizaImovel.Close;
   qryAtualizaImovel.UnPrepare;

   qryLookTipoImovel.Close;
   qryLookTipoImovel.UnPrepare;

   qryLookImovel.Close;
   qryLookImovel.UnPrepare;

   qryLookTipoOper.Close;
   qryLookTipoOper.UnPrepare;

   qryLookTipoOperParcela.Close;
   qryLookTipoOperParcela.UnPrepare;

   qryLookCarteira.Close;
   qryLookCarteira.UnPrepare;

   qryLookMoeda.Close;
   qryLookMoeda.UnPrepare;

   qryLookForCli.Close;
   qryLookForCli.UnPrepare;

   qryParcelas.Close;
   qryParcelas.UnPrepare;

   qryImovelxBem.Close;
   qryImovelxBem.UnPrepare;

   qryDespesasXTipoOper.Close;
   qryDespesasXTipoOper.UnPrepare;
end;



procedure TfrmExecOperImovel.btnBuscaBemClick(Sender: TObject);
begin
   inherited;

   if tOperacao = toCompra then begin
      MontaSelectBem.Executar;

      // redesenha o form na volta do MontaSelect
      Repaint;

      // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
      if MontaSelectBem.RetornouValor then qryImovelxBemIDBEM.asInteger := StrToInt(MontaSelectBem.ValoresChave[0]);
   end;
end;



procedure TfrmExecOperImovel.bbtnConfirmarClick(Sender: TObject);
begin
   if ( VerificaPreenchimento and VerificaPreenchimentoDetalhe ) then begin
      Screen.Cursor := crHourGlass;
      inherited;
      DBcboImovelMestre.Clear;
      DBcboTipoImovel.Clear;
      Screen.Cursor := crDefault;
   end;
end;



procedure TfrmExecOperImovel.btnBuscaImovelClick(Sender: TObject);
var
   sMestre: string;
begin
   MontaSelectImovel.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if MontaSelectImovel.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      iImovel  := StrToInt(MontaSelectImovel.ValoresChave[0]);
      sMestre  := MontaSelectImovel.ValoresChave[1];

      with qryLookImovel do begin
         LimpaParametros(qryLookImovel);
         Params[0].asInteger := iImovel;
         Open;
      end;

      qryIDINVESTIMENTO.asInteger           := iImovel;
      if sMestre <> '' then DBcboImovelMestre.LookupValue   := sMestre;

      iSubConta := -1;
      if not(qryLookImovelCODSUBCONTA.isNULL) then iSubConta := qryLookImovelCODSUBCONTA.asInteger;

      PreencheImovel;

      Screen.Cursor := crDefault;
   end;

   btnBuscaImovel.SetFocus;
end;



procedure TfrmExecOperImovel.FormCreate(Sender: TObject);
begin
   inherited;

   tbcDetalhe.Tabs.Clear;
   tbcDetalhe.Tabs.Add('Operação');
   tbcDetalhe.Tabs.Add('Bens');
   tbcDetalhe.Tabs.Add('Rubricas da Operação');

   // adiciona o filtro por Empresa Proprietária nos MontaSelects
   MontaSelectImovel.Filtro.Add('I.IDPESSOA = ' + IntToStr(Sistema.idEmpresa));
   MontaSelect.Filtro.Add('V.EMPRESAPROP = ' + IntToStr(Sistema.idEmpresa));
   MontaSelectBem.Filtro.Add('B.IDPESSOA = ' + IntToStr(Sistema.idEmpresa));
end;



procedure TfrmExecOperImovel.sbtnApagarClick(Sender: TObject);
begin
   if CmeCadastro.Operacao = opIdle then begin

      CmeCadastro.Operacao := opApagar;

      if MsgDlg('Deseja realmente estornar esta Operação?', 'Estorno', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
         Repaint;
      end;

      if qry.isEmpty then begin
         CmeCadastro.Operacao := opVazio;
      end else begin
         CmeCadastro.Operacao := opIdle;
      end;

      CmeCadastro.AtualizaBotoes(self);
   end;
end;



procedure TfrmExecOperImovel.btnBuscaCarteiraClick(Sender: TObject);
begin
   inherited;

   if CmeCadastro.Operacao in [opInserir, opAlterar] then begin

      MontaSelectCarteira.Executar;
      // redesenha o form na volta do MontaSelect
      Repaint;

      // se houve busca, abre a query principal com apenas o registro buscado
      if MontaSelectCarteira.RetornouValor then begin

         Screen.Cursor := crHourGlass;

         iCarteira := StrToInt(MontaSelectCarteira.ValoresChave[0]);
         with qryLookCarteira do begin
            LimpaParametros(qryLookCarteira);
            Params[0].asInteger := iCarteira;
            Open;
         end;

         qryIDCARTEIRAINVEST.asInteger := iCarteira;

         Screen.Cursor := crDefault;
      end;
   end;
end;



procedure TfrmExecOperImovel.sbtnNovoBemClick(Sender: TObject);
begin
   inherited;

   Screen.Cursor := crHourGlass;

   Application.CreateForm(TfrmCadBem, frmCadBem);
   sbtnNovoBem.Down := False;
   frmCadBem.ShowModal;

   Repaint;

   Screen.Cursor := crDefault;
end;



procedure TfrmExecOperImovel.DBedtVlrOMExit(Sender: TObject);
begin
   inherited;

   if ( ( sMoedaIni <> sMoedaFim) or (DBedtVlrOM.Modified) ) then begin
      if ( (DBcboMoeda.LookupValue <> '' ) and (qryVLROPERACAOOM.asCurrency > 0) ) then begin
         // se a Moeda e o ValorOM preenchidos, converte o valor
         ConverteValorOperacao;
      end;
   end;
end;



procedure TfrmExecOperImovel.DBcboMoedaExit(Sender: TObject);
begin
   inherited;

   sMoedaFim := DBcboMoeda.LookupValue;
   if ( ( sMoedaIni <> sMoedaFim) or (DBedtVlrOM.Modified) ) then begin
      if ( (DBcboMoeda.LookupValue <> '' ) and (qryVLROPERACAOOM.asCurrency > 0) ) then begin
         // se a Moeda e o ValorOM preenchidos, converte o valor
         ConverteValorOperacao;
      end;
   end;
   
end;



procedure TfrmExecOperImovel.DBcboMoedaEnter(Sender: TObject);
begin
   inherited;
   sMoedaIni := DBcboMoeda.LookupValue;
end;



procedure TfrmExecOperImovel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if Modulo.bIntegraGestao then begin
      // atualiza os saldos das carteiras
      OperComum.AtualizaSaldos(Modulo.fVlrPrimeiraCota, -1);
   end;

   FechaQueries;

   inherited;
end;



procedure TfrmExecOperImovel.tbcDetalheChange(Sender: TObject);
begin
   Repaint;

   // para contornar a inconveniente gravação de registros em branco
   CmeDetalhe.Cancel(Self);

   // código para replicar o controle de query detalhe atual (presente no CadMestreDetalheCS):
   // a variável do pai que tem a mesma função não está disponível para os filhos
   grdDetAtual := TwwDBGrid(TComponent(sender).Owner.FindComponent(tbcDetalhe.detdbGrids[tbcDetalhe.TabIndex]));
   if grdDetAtual <> nil then begin
	   qryDetAtual	:= TwwQuery(grdDetAtual.DataSource.DataSet);
   end else begin
      qryDetAtual	:= nil;
   end;

	inherited;

   // controle de habilitação dos botões detalhe
   case tOperacao of

      toCompra:
      begin
         sbtnInsDet.Visible      := True;
         sbtnAltDet.Visible      := True;
         sbtnExcluiDet.Visible   := True;
      end;

      toVenda:
      begin
         sbtnInsDet.Visible      := False;
         sbtnAltDet.Visible      := True;
         sbtnExcluiDet.Visible   := False;
      end;

      toTransferencia:
      begin
         sbtnInsDet.Visible      := False;
         sbtnAltDet.Visible      := False;
         sbtnExcluiDet.Visible   := False;
      end;

   end;

   // rubricas
   if tbcDetalhe.TabIndex = 2 then begin
      sbtnInsDet.Visible      := False;
      // só permite a alteração de rubricas se for operação de Compra
      if tOperacao = toCompra then begin
         sbtnAltDet.Visible   := True;
      end else begin
         sbtnAltDet.Visible   := False;
      end;
      sbtnExcluiDet.Visible   := False;
   end;

   // parcelas
   if tbcDetalhe.TabIndex = 3 then begin
      sbtnInsDet.Visible      := True;
      sbtnAltDet.Visible      := True;
      sbtnExcluiDet.Visible   := True;
   end;
end;



procedure TfrmExecOperImovel.tbcDetalheChanging(Sender: TObject; var AllowChange: Boolean);
begin
   // este evento está comentado para que a mensagem pernóstica do padrão não apareça:
   // já está sendo feito um CmeCadastro.Cancel(Self)Detalhe no on_change

   // inherited;
end;



procedure TfrmExecOperImovel.qryImovelxBemCalcFields(DataSet: TDataSet);
begin
   inherited;

   if not(qryImovelxBemIDBEM.isNULL) then begin

      with qryPreencheBem do begin
         LimpaParametros(qryPreencheBem);
         Params[0].asInteger := qryImovelxBemIDBEM.asInteger;
         Open;
      end;

      qryImovelxBemPLACA.asFloat  := qryPreencheBemPLACA.asFloat;
      qryImovelxBemDESC.asString  := qryPreencheBemDESBEM.asString;

   end;

   qryImovelxBemGRUPO.asString := FuncoesImob.GrupoExtenso(qryImovelxBemIXBGRUPO.asString);
end;



procedure TfrmExecOperImovel.bbtnOkDetClick(Sender: TObject);
begin
   if VerificaPreenchimentoDetalhe then inherited;
end;



procedure TfrmExecOperImovel.DBcboTipoOperCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   // armazena a Natureza da Operação (da Operação Principal)
   if DBcboTipoOper.LookupValue <> '' then begin
      iTipoOper      := StrToInt(DBcboTipoOper.LookupValue);
      sNaturezaOper  := qryLookTipoOperNATUREZAOPERACAO.asString;

      iForCliOper    := BuscaForCli;

   end else begin
      iTipoOper      := -1;
      sNaturezaOper  := '';
      iForCliOper    := -1;
   end;

   with qryDespesasXTipoOper do begin
      LimpaParametros(qryDespesasXTipoOper);
      ParamByName('TIPOOPER').asInteger      := iTipoOper;
      Open;

      First;
      while not(EOF) do begin
         if FieldByName('DATAVENC').asString = '01/01/1980' then begin
            Edit;
            FieldByName('DATAVENC').Value := NULL;
            FieldByName('MOEDA').Value    := NULL;
            Post;
         end;
         Next;
      end;
      First;

   end;

   with qryLookTipoDespesa do begin
      LimpaParametros(qryLookTipoDespesa);
      ParamByName('TIPOOPER').asInteger      := iTipoOper;
      Open;
   end;

   if ( (qry.State in [dsInsert, dsEdit]) and (iForCliOper > 0) ) then qryIDFORCLI.asInteger := iForCliOper;
end;



procedure TfrmExecOperImovel.DBcboTipoOperParcelaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   // armazena a Natureza da Operação (da Operação Principal)
   if DBcboTipoOperParcela.LookupValue <> '' then begin
      sNaturezaParcela  := qryLookTipoOperNATUREZAOPERACAO.asString;
   end else begin
      sNaturezaParcela  := '';
   end;
end;



procedure TfrmExecOperImovel.DBcboMoedaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   if DBcboMoeda.LookupValue <> '' then iMoedaOper := StrToInt(DBcboMoeda.LookupValue);
end;



procedure TfrmExecOperImovel.DBedtRateioBemExit(Sender: TObject);
begin
   inherited;
   if qryImovelxBemIXBPERCENT.asFloat > 100 then qryImovelxBemIXBPERCENT.asFloat := 100;
   if qryImovelxBemIXBPERCENT.asFloat <   0 then qryImovelxBemIXBPERCENT.asFloat :=   0;
end;



procedure TfrmExecOperImovel.sbtnInserirClick(Sender: TObject);
begin
   if bParcelado then begin

      tbcDetalhe.Tabs.Clear;
      tbcDetalhe.Tabs.Add('Operação');
      tbcDetalhe.Tabs.Add('Bens');
      tbcDetalhe.Tabs.Add('Rubricas da Operação');
      tbcDetalhe.Tabs.Add('Parcelas');
   end;

   lblLucroPreju.Visible   := tOperacao = toVenda;
   DBcboLucroPreju.Visible := tOperacao = toVenda;

   Repaint;

   DBedtVlrOM.Enabled   := not(bParcelado);
   inherited;
end;



procedure TfrmExecOperImovel.sbtnProcurarClick(Sender: TObject);
begin
   if bParcelado then begin
      tbcDetalhe.Tabs.Clear;
      tbcDetalhe.Tabs.Add('Operação');
      tbcDetalhe.Tabs.Add('Bens');
      tbcDetalhe.Tabs.Add('Rubricas da Operação');
      tbcDetalhe.Tabs.Add('Parcelas');
   end;

   lblLucroPreju.Visible   := tOperacao = toVenda;
   DBcboLucroPreju.Visible := tOperacao = toVenda;

   Repaint;

   DBedtVlrOM.Enabled   := not(bParcelado);
   inherited;
end;



procedure TfrmExecOperImovel.DBcboMoedaRubricaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   if DBcboMoedaRubrica.LookupValue <> '' then iMoedaRubrica := StrToInt(DBcboMoedaRubrica.LookupValue);
end;



procedure TfrmExecOperImovel.DBcboMoedaRubricaEnter(Sender: TObject);
begin
   inherited;

   sMoedaIniRubrica := DBcboMoedaRubrica.LookupValue;
end;



procedure TfrmExecOperImovel.DBcboMoedaRubricaExit(Sender: TObject);
begin
   inherited;

   sMoedaFimRubrica := DBcboMoedaRubrica.LookupValue;
   if ( ( sMoedaIniRubrica <> sMoedaFimRubrica) or (DBedtVlrOMRubrica.Modified) ) then begin
      if ( (DBcboMoedaRubrica.LookupValue <> '' ) and (qryDespesasXTipoOperVLROM.asCurrency > 0) ) then begin
         // se a Moeda e o ValorOM preenchidos, converte o valor
         ConverteValorRubrica;
      end;
   end;

end;



procedure TfrmExecOperImovel.DBedtVlrOMRubricaExit(Sender: TObject);
begin
   inherited;

   if ( ( sMoedaIniRubrica <> sMoedaFimRubrica) or (DBedtVlrOMRubrica.Modified) ) then begin
      if ( (DBcboMoedaRubrica.LookupValue <> '' ) and (qryDespesasXTipoOperVLROM.asCurrency > 0) ) then begin
         // se a Moeda e o ValorOM preenchidos, converte o valor
         ConverteValorRubrica;
      end;
   end;

end;



procedure TfrmExecOperImovel.DBedtVlrOMParcelaExit(Sender: TObject);
begin
   inherited;

   if ( ( sMoedaIni <> sMoedaFim) or (DBedtVlrOMParcela.Modified) ) then begin
      if ( (DBcboMoedaParcela.LookupValue <> '' ) and (qryParcelasPARVLROM.asCurrency > 0) ) then begin
         // se a Moeda e o ValorOM preenchidos, converte o valor
         ConverteValorParcela;
      end;
   end;

end;



end.
