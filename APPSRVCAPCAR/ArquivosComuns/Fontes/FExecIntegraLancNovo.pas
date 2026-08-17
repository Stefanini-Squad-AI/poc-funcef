unit FExecIntegraLancNovo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjudaImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, fcButton, fcImgBtn,
  fcShapeBtn, ComCtrls, fcLabel, TREdit, Mask, wwdbedit, Wwdbspin,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, mResponsavel, mUsuario,
  mContrato, Db, Wwdatsrc, DBTables, Wwquery, wwriched, Wwdotdot, Wwdbcomb, uCtrlLancamentosImovel,
  mOrigemLanc, uFuncoesImob, Menus, uCtrlLancamento, uCtrlPadrLancImovel, uCtrlParamIntegra;

type
   TMensErro = Record
     iCodErro  : integer;
     sMensErro : string;
   end;

   TContabPD = Record
     Parametros    : TParamContabeisMT;
     dLancto       : TDateTime;
     NoDocumento   : Extended;
     IdUsuario     : Integer;
     IdPatroImovel : Integer;
     IdPlanoImovel : Integer;
     VlrTotal      : Extended;
   end;

  TfrmExecIntegraLancNovo = class(TfrmSairAjudaImob)
    lblTitulo: TfcLabel;
    qryDocumento: TwwQuery;
    qryDocumentoIDDOCUMENTO: TFloatField;
    qryDocumentoNODOCUMENTO: TFloatField;
    qryDocumentoTOTAL_LANC: TFloatField;
    qryDocumentoTOTAL_OM_LANC: TFloatField;
    qryCAPCAR_MORREU: TwwQuery;
    ds: TwwDataSource;
    qryRegistraErro: TwwQuery;
    dsDocumento: TwwDataSource;
    qryLancamentos: TwwQuery;
    dsLancamentos: TwwDataSource;
    qryDocumentoFLGORIGEMLANC: TStringField;
    qryDocumento_ORIGEMLANC: TStringField;
    qryDocumentoMESCOMPETENCIA: TFloatField;
    qryDocumentoANOCOMPETENCIA: TFloatField;
    qryDocumentoDATAVENCIMENTO: TDateTimeField;
    qryDocumentoDESCCUSTORECIMO: TStringField;
    qryLancamentosIMOVEL_EXTENSO: TStringField;
    qryLancamentosCONTRATO_EXTENSO: TStringField;
    qryLancamentosVALOR_LANC: TFloatField;
    qryDocumentoFLGERRO: TFloatField;
    qryDocumento_DESCERRO: TStringField;
    qryLancamentosMSGERROINTEGRA: TStringField;
    qryAlterador: TwwQuery;
    qryAlteradorIDDOCUMENTO: TFloatField;
    qryAlteradorCODALTERADOR: TFloatField;
    qryAlteradorVLRALTERADOR: TFloatField;
    qryAlteradorTRGDTINCLUSAO: TDateTimeField;
    qryAlteradorTRGUSERINCLUSAO: TStringField;
    qryAlteradorDESCRICAO: TStringField;
    qryAlteradorRECPAG: TStringField;
    qryAlteradorACRESDECRES: TStringField;
    qryCAPCAR_MORREUIDDOCUMENTO: TFloatField;
    qryCAPCAR_MORREUNODOCUMENTO: TFloatField;
    qryCAPCAR_MORREUIDFORCLI: TFloatField;
    qryCAPCAR_MORREUCODTIPDOC: TFloatField;
    qryCAPCAR_MORREUCOD_MOEDA: TFloatField;
    qryCAPCAR_MORREUCODPORTFORMA: TFloatField;
    qryCAPCAR_MORREURECPAG: TStringField;
    qryCAPCAR_MORREUCODFORMA: TFloatField;
    qryResponsabilidade: TwwQuery;
    PopupMenu1: TPopupMenu;
    LiberaLanamento1: TMenuItem;
    VoltaIncio1: TMenuItem;
    qryDocumento_RECPAG: TStringField;
    qryDocumentoRECPAG: TStringField;
    qryContratoAtivo: TwwQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    qryResponsabilidadeIDTIPOCUSTORECIMO: TFloatField;
    qryContratoAtivoIDCONTRATOIMOVEL: TFloatField;
    qryBuscaCtaCli: TwwQuery;
    qryBuscaCtaFor: TwwQuery;
    qryBuscaCtaCliIDFORCLI: TFloatField;
    qryBuscaCtaCliCONTACCLIENTE: TStringField;
    qryBuscaCtaCliCODCENTROCUSTO: TStringField;
    qryBuscaCtaCliCODSUBCONTA: TFloatField;
    qryBuscaCtaForIDFORCLI: TFloatField;
    qryBuscaCtaForCONTACFORN: TStringField;
    qryBuscaCtaForCODCENTROCUSTO: TStringField;
    qryBuscaCtaForCODSUBCONTA: TFloatField;
    qryBuscaSubContaMestre: TwwQuery;
    qryBuscaSubContaMestreCODSUBCONTA: TFloatField;
    qryBuscaSubContaMestreIDIMOVEL: TFloatField;
    qryDocumentoMSGERROINTEGRA: TStringField;
    btnContinuar: TfcShapeBtn;
    btnVoltar: TfcShapeBtn;
    ntbPrincipal: TNotebook;
    Label2: TLabel;
    btnAtualizar: TfcShapeBtn;
    DBcboTipoRecDes: TwwDBLookupCombo;
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
    chkExibeDetalhes: TCheckBox;
    grdDetalhes: TwwDBGrid;
    Panel5: TPanel;
    panDetalhes: TPanel;
    grdLancamentos: TwwDBGrid;
    Panel2: TPanel;
    panDetalhesNao: TPanel;
    wwDBRichEdit1: TwwDBRichEdit;
    wwDBRichEdit2: TwwDBRichEdit;
    grdLancamentosNao: TwwDBGrid;
    grdDetalhesNao: TwwDBGrid;
    sepConfirmar: TToolbarSep97;
    sepVoltar: TToolbarSep97;
    btnConfirmar: TfcShapeBtn;
    sepContinuar: TToolbarSep97;
    qryDocumentoDATALANCAMENTO: TDateTimeField;
    qryDadosCliente: TwwQuery;
    qryDadosClienteIDPAIS: TFloatField;
    qryDadosClienteIDCIDADES: TFloatField;
    qryDadosClienteCODESTADO: TStringField;
    qryFormaPagto: TwwQuery;
    qryFormaPagtoCODFORMA: TFloatField;

    procedure FormShow(Sender: TObject);
    procedure qryDocumentoCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBcboTipoRecDesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ntbPrincipalPageChanged(Sender: TObject);
    procedure LiberaLanamento1Click(Sender: TObject);
    procedure chkExibeDetalhesClick(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);


  private { Private declarations }

    CtrlLancamento : TCtrlLancamento;
    CtrlPadrLancImovel  : TCtrlPadrLancImovel;
    CtrlLancamentosImovel : TCtrlLancamentosImovel;

    function BuscaParametrizacao(var vParamContabeis: array of TParamContabeisMT; const bSegOper:Boolean=False): integer;
    function BuscaDescSegOper(const iIdTipoRecDes: Integer) : String;
    function SetMensagem(const iDocumento: integer): TMensErro;
    procedure AbrirQryDocumento;
    procedure AbrirQryLancImovel;
    procedure IntegraLancamentos;
    function ResponsavelDespesa: integer;
    function ObrigaLiberacao: integer;
    function IntegraOrcamento: TMensErro;
    function DefineHistorico(const bSegOper:Boolean = False): TParamContabeisMT;
    function IntegraContabilidade  (var vParamContabeis, vParamOperContab: array of TParamContabeisMT): TMensErro;
    function IntegraContabilidadePD(var vParamContabeis, vParamOperContab: array of TParamContabeisMT): TMensErro;
    function VerificaCondicoes(const rParamContabeis: TParamContabeisMT): integer;
    function DefineParamContabeis(var rParamContabeis: TParamContabeisMT; const bSegOper:Boolean=False): Integer;
    function FazerLancamentoContab(var rParamContabeis: TParamContabeisMT; const sTipoLanc: char; const dLancto:TDateTime; const NumDoc,VlrLancto:Extended;
                                   const idUsuario, iIdPatroImovel, iIdPlanoImovel:Integer):TMensErro;
    function IntegraCaPCaR(var vParamContabeis: array of TParamContabeisMT): TMensErro;
    function FazerLancamentoCApCArDocum(var rParamContabeis: TParamContabeisMT): TMensErro;
    function FazerLancamentoCApCArRateio(var rParamContabeis: TParamContabeisMT): TMensErro;
    function IntegraAlterador: TMensErro;
    function ConfereParamContabeis(var rParamContabeis: TParamContabeisMT): integer;

    procedure RegistraErro(const iDocumento: integer; const CodErro: TMensErro);
    procedure ZeraParamContabeis(var vParamContabeis: array of TParamContabeisMT);
    procedure AtribuiContaAtivoPassivo(var rParamContabeis: TParamContabeisMT);

  public { Public declarations }

  end;



var
  frmExecIntegraLancNovo: TfrmExecIntegraLancNovo;



implementation
{$R *.DFM}

uses
   uDiasInUteis, uSistema, uMolduras, dLookImobiliario, dImobiliario, uDocumento,
   uDatabase, uMensErro, uOrcamento, uLancContab, uFuncaoGeral, uIntegraBack,
   uModulo, dBaseDados, dLancImovel, uCalcDocumento, fProgresso, uModuloImobiliario;


// monta um vetor com as parametrizações do documento, imoveis.

function TfrmExecIntegraLancNovo.BuscaParametrizacao(var vParamContabeis: array of TParamContabeisMT; const bSegOper:Boolean): integer;
var
   vRegistro: integer;
begin
   Result    := 0;
   vRegistro := 0;
//   vParamContabeis[0] := DefineHistorico(bSegOper);
   dtmLancImovel.qryLancImovel.First;
   while (not dtmLancImovel.qryLancImovel.Eof) and (result = 0) do begin
      Result                     := DefineParamContabeis(vParamContabeis[vRegistro], bSegOper);
      vParamContabeis[vRegistro] := DefineHistorico(bSegOper);

      if (Result = 0) and (not bSegOper) then Result := ConfereParamContabeis(vParamContabeis[vRegistro]);

      if result = 0 then begin
         // replicar as informaçoes de histórico em todas as linhas do vetor
//         vParamContabeis[vRegistro].sHistoricoCapCar := vParamContabeis[0].sHistoricoCapCar;
//         vParamContabeis[vRegistro].sHistoricoCtb    := vParamContabeis[0].sHistoricoCtb;

         // checar se a parametrização é igual em todas as linhas
         // obrigatoriedade do CAPCAR
         if (vRegistro > 0) and (not bSegOper) then begin
            if vParamContabeis[vRegistro].sCodCentroRespon    <> vParamContabeis[0].sCodCentroRespon    then Result := -30;
            if vParamContabeis[vRegistro].sCodTipRecDes       <> vParamContabeis[0].sCodTipRecDes       then Result := -30;
            if vParamContabeis[vRegistro].sContaDebCred       <> vParamContabeis[0].sContaDebCred       then Result := -30;
            if vParamContabeis[vRegistro].sCentroCustoDebCred <> vParamContabeis[0].sCentroCustoDebCred then Result := -30;
            if vParamContabeis[vRegistro].iUnidNegoc          <> vParamContabeis[0].iUnidNegoc          then Result := -30;
            if vParamContabeis[vRegistro].sSubContaDebCred    <> vParamContabeis[0].sSubContaDebCred    then Result := -30;
            if vParamContabeis[vRegistro].bFlgIntegraContab   <> vParamContabeis[0].bFlgIntegraContab   then Result := -30;
            if vParamContabeis[vRegistro].bFlgIntegraCapCar   <> vParamContabeis[0].bFlgIntegraCapCar   then Result := -30;
            if Result = -30 then exit;
         end;
      end;

      dtmLancImovel.qryLancImovel.Next;
      inc(vRegistro);
   end;
end;





//==================================================================================================
//    seta mensgagens documento
//==================================================================================================

function TfrmExecIntegraLancNovo.SetMensagem(const iDocumento: integer): TMensErro;
var
   vMsgCnab  : array[0..8] of string;
begin
   Result.iCodErro := 0;

   try

      // Mensagem do Boleto
      FuncoesImob.SelectMsgLanc(iDocumento);

      // atribui as mensagens para o vetor
      vMsgCnab[0] := dtmLancImovel.qrySelectMsgLancTEXTO_LINHA_1.AsString;
      vMsgCnab[1] := dtmLancImovel.qrySelectMsgLancTEXTO_LINHA_2.AsString;
      vMsgCnab[2] := dtmLancImovel.qrySelectMsgLancTEXTO_LINHA_3.AsString;
      vMsgCnab[3] := dtmLancImovel.qrySelectMsgLancTEXTO_LINHA_4.AsString;
      vMsgCnab[4] := dtmLancImovel.qrySelectMsgLancTEXTO_LINHA_5.AsString;
      vMsgCnab[5] := dtmLancImovel.qrySelectMsgLancTEXTO_LINHA_6.AsString;
      vMsgCnab[6] := dtmLancImovel.qrySelectMsgLancTEXTO_LINHA_7.AsString;
      vMsgCnab[7] := dtmLancImovel.qrySelectMsgLancTEXTO_LINHA_8.AsString;
      vMsgCnab[8] := dtmLancImovel.qrySelectMsgLancTEXTO_LINHA_9.AsString;

      // fecha a query
      dtmLancImovel.qrySelectMsgLanc.Close;

      if not(Documento.IntBanco.SetaMensagensCNAB(iDocumento, -1, vMsgCNAB)) then begin
         Result.iCodErro := -37;
         Exit;
      end;

      // COLOCAR EMISBLOQ = N E CONTROLEREMESSA = NULL
      LimpaParametros(dtmLancImovel.qryUpdateDocumento);
      dtmLancImovel.qryUpdateDocumento.ParamByName('PCODDOCUMENTO').AsInteger := iDocumento;
      dtmLancImovel.qryUpdateDocumento.ExecSQL;


   except
      on e:Exception do begin
         Result.iCodErro  := -38;
         Result.sMensErro := e.Message;
      end;
   end;

end;

//--------------------------------------------------------------------------------------------------




procedure TfrmExecIntegraLancNovo.AbrirQryDocumento;
begin
   LimpaParametros(qryDocumento);

   qryDocumento.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qryDocumento.ParamByName('PIDMODULO').AsInteger := Sistema.IdModulo;


   if MolUsuario1.iUsuario > 0 then
      qryDocumento.ParamByName('PIDUSUARIOSISTEMA').AsInteger := MolUsuario1.iUsuario;

   if molContrato1.iContrato > 0 then
      qryDocumento.ParamByName('PIDCONTRATOIMOVEL').AsInteger := molContrato1.iContrato;

   if DBcboTipoRecDes.Text <> '' then
      qryDocumento.ParamByName('PIDTIPOCUSTORECIMO').AsInteger := StrToInt(DBcboTipoRecDes.LookupValue);

   if (edtDataIni.Text <> '') and (edtDataFim.Text <> '') then begin
      if rdgTipoData.ItemIndex = 0 then begin
         qryDocumento.ParamByName('PTRGDTINCLUSAO1').AsDateTime := edtDataIni.DateTime;
         qryDocumento.ParamByName('PTRGDTINCLUSAO2').AsDateTime := edtDataFim.DateTime;
      end else if rdgTipoData.ItemIndex = 1 then begin
         qryDocumento.ParamByName('PDATALANCAMENTO1').AsDateTime := edtDataIni.DateTime;
         qryDocumento.ParamByName('PDATALANCAMENTO2').AsDateTime := edtDataFim.DateTime;
      end else if rdgTipoData.ItemIndex = 2 then begin
         qryDocumento.ParamByName('PDATAVENCIMENTO1').AsDateTime := edtDataIni.DateTime;
         qryDocumento.ParamByName('PDATAVENCIMENTO2').AsDateTime := edtDataFim.DateTime;
      end;
   end;

   if not chkCompetencia.Checked then begin
      qryDocumento.ParamByName('PMESCOMPETENCIA').AsInteger := cboMesCompetencia.ItemIndex+1;
      qryDocumento.ParamByName('PANOCOMPETENCIA').AsInteger := Word(trunc(DBspnAnoCompetencia.Value));
   end;

   qryDocumento.ParamByName('PFLGORIGEMLANC').AsString := molOrigemLanc1.cboOrigemLanc.Value;

   qryDocumento.Open;

   // se selecionar detalhes abrir a query
   if chkExibeDetalhes.Checked then qryLancamentos.Open;

end;



procedure TfrmExecIntegraLancNovo.AbrirQryLancImovel;
begin
   { ***************************************************************************
     abrir query com o filtro do form principal para os lançamentos de despesa
     que geram reembolso
   *************************************************************************** }
   LimpaParametros(dtmLancImovel.qryLancImovel);

   dtmLancImovel.qryLancImovel.ParamByName('PIDPESSOA').AsInteger     := Sistema.IdEmpresa;
   dtmLancImovel.qryLancImovel.ParamByName('PIDMODULO').AsInteger     := Sistema.IdModulo;
   dtmLancImovel.qryLancImovel.ParamByName('PFLGINTEGRADO').AsInteger := 0;

   if MolUsuario1.iUsuario > 0 then
      dtmLancImovel.qryLancImovel.ParamByName('PIDUSUARIOSISTEMA').AsInteger := MolUsuario1.iUsuario;

   if molContrato1.iContrato > 0 then
      dtmLancImovel.qryLancImovel.ParamByName('PIDCONTRATOIMOVEL').AsInteger := molContrato1.iContrato;

   if DBcboTipoRecDes.Text <> '' then
      dtmLancImovel.qryLancImovel.ParamByName('PIDTIPOCUSTORECIMO').AsInteger := StrToInt(DBcboTipoRecDes.LookupValue);

   if (edtDataIni.Text <> '') and (edtDataFim.Text <> '') then begin
      if rdgTipoData.ItemIndex = 0 then begin
         dtmLancImovel.qryLancImovel.ParamByName('PTRGDTINCLUSAO1').AsDateTime := edtDataIni.DateTime;
         dtmLancImovel.qryLancImovel.ParamByName('PTRGDTINCLUSAO2').AsDateTime := edtDataFim.DateTime;
      end else if rdgTipoData.ItemIndex = 1 then begin
         dtmLancImovel.qryLancImovel.ParamByName('PDATALANCAMENTO1').AsDateTime := edtDataIni.DateTime;
         dtmLancImovel.qryLancImovel.ParamByName('PDATALANCAMENTO2').AsDateTime := edtDataFim.DateTime;
      end else if rdgTipoData.ItemIndex = 3 then begin
         dtmLancImovel.qryLancImovel.ParamByName('PDATAVENCIMENTO1').AsDateTime := edtDataIni.DateTime;
         dtmLancImovel.qryLancImovel.ParamByName('PDATAVENCIMENTO2').AsDateTime := edtDataFim.DateTime;
      end;
   end;

   if not chkCompetencia.Checked then begin
      dtmLancImovel.qryLancImovel.ParamByName('PMESCOMPETENCIA').AsInteger := cboMesCompetencia.ItemIndex+1;
      dtmLancImovel.qryLancImovel.ParamByName('PANOCOMPETENCIA').AsInteger := Word(trunc(DBspnAnoCompetencia.Value));
   end;

   dtmLancImovel.qryLancImovel.ParamByName('PFLGORIGEMLANC').AsString := molOrigemLanc1.cboOrigemLanc.Value;

   dtmLancImovel.qryLancImovel.Open;
   { ***************************************************************************
     FIM
     abrir query com o filtro do form principal para os lançamentos de despesa
     que geram reembolso
   *************************************************************************** }
end;




function TfrmExecIntegraLancNovo.ResponsavelDespesa: integer;
begin
   Result := 0;
   dtmLancImovel.qryLancImovel.First;

   if dtmLancImovel.qryLancImovelRECPAG.AsString = 'R' then exit;   // lançamentos a receber

   // despesa autorizada anteriormente
   if dtmLancImovel.qryLancImovelFLGERRO.AsInteger = 56 then exit;

   // despesa autorizada anteriormente para imóveis inativos
   if dtmLancImovel.qryLancImovelFLGERRO.AsInteger = 91 then exit;

   // abrir os parametros do sistema
   ParametrosSistema;

   if dtmImobiliario.qryParamImobFLGREEMBOLSOAUT.IsNull then begin
      Result := -57;   // parametro de responsabilidade nulo
      exit;
   end;
   case dtmImobiliario.qryParamImobFLGREEMBOLSOAUT.AsInteger of
      0: exit;  // não faz nada permite o lançamento
      1: ;      // neste caso a despesa é de responsabilidade do locatário checar imovel a imovel
   end;

   dtmLancImovel.qryLancImovel.First;
   while (not dtmLancImovel.qryLancImovel.EOF) and (Result = 0) do begin
      LimpaParametros(qryContratoAtivo);
      qryContratoAtivo.ParamByName('PIDIMOVEL').AsInteger := dtmLancImovel.qryLancImovelIDIMOVEL.AsInteger;
      qryContratoAtivo.Open;

      if not(qryContratoAtivo.IsEmpty) then begin   // aqui voce possui contratos ativos para o imóvel procurar responsabilidade

         LimpaParametros(qryResponsabilidade);
         qryResponsabilidade.ParamByName('PIDCONTRATOIMOVEL').AsInteger := qryContratoAtivoIDCONTRATOIMOVEL.AsInteger;
         qryResponsabilidade.ParamByName('PIDTIPOCUSTORECIMO').AsInteger := dtmLancImovel.qryLancImovelIDTIPOCUSTORECIMO.AsInteger;
         qryResponsabilidade.Open;

         // responsabilidade do FUNDAÇÃO - tabela <> empty
         if qryResponsabilidade.IsEmpty then begin
            result := -56;
            exit;
         end;
      end;
      dtmLancImovel.qryLancImovel.Next;
   end;
end;


function TfrmExecIntegraLancNovo.ObrigaLiberacao: integer;
var
  iAnoLancContab, iMesLancContab, iDiaLancContab : Word;
  iAnoComp, iMesComp : Integer;

begin
   Result := 0;
   dtmLancImovel.qryLancImovel.First;

   // Receita autorizada anteriormente
   if dtmLancImovel.qryLancImovelFLGERRO.AsInteger in[90,91,92] then exit;

   // Verifica cada lançamento do documento
   while (not dtmLancImovel.qryLancImovel.EOF) and (Result = 0) do begin

      // Erro -90: Receita de imovel nunca locado
      if (dtmLancImovel.qryLancImovelRECPAG.AsString = 'R') and
         (dtmLancImovel.qryLancImovelIDCONTRATOIMOVEL.isNull) then begin
         LimpaParametros(dtmImobiliario.qryContratoXImovel);
         dtmImobiliario.qryContratoXImovel.ParamByName('PIDIMOVEL').AsInteger := dtmLancImovel.qryLancImovelIDIMOVEL.AsInteger;
         dtmImobiliario.qryContratoXImovel.Open;
         if dtmImobiliario.qryContratoXImovel.IsEmpty then
            Result := -90
      end;

      // Erro -91: Despesa em imovel inativo
      if (dtmLancImovel.qryLancImovelRECPAG.AsString = 'P') and
         (dtmLancImovel.qryLancImovelFLGATIVO.AsInteger = 0) then begin
         Result := -91;
      end;

      dtmLancImovel.qryLancImovel.Next;

   end;

//---------- INÍCIO - Marcio Motta - 10/03/2004 - Pendência: 16112 ---------------------------------
      dtmLancImovel.qryLancImovel.First;
      // Erro -92: Registro contábil fora da competência gerencial

      // Decodifica a data de Lançamento contábil
      DecodeDate(dtmLancImovel.qryLancImovelDATALANCAMENTO.AsDateTime,
                 iAnoLancContab,iMesLancContab,iDiaLancContab);

      // Pega o ANO e o MÊS de competência
      iAnoComp := dtmLancImovel.qryLancImovelANOCOMPETENCIA.AsInteger;
      iMesComp := dtmLancImovel.qryLancImovelMESCOMPETENCIA.AsInteger;

      // Se data de lançamento for menor que a data de competência solicita liberação
      if (iAnoLancContab <> iAnoComp) or (iMesLancContab <> iMesComp) then
         Result := -92;
//------- FIM Implementação/Alteração - Marcio Motta -----------------------------------------------

end;


function TfrmExecIntegraLancNovo.IntegraOrcamento: TMensErro;
var
   sDataLancto: string;
   iNumReserva, iNumCompromisso, iRetorno: integer;
   Orcamento: TOrcamentoBack;
begin
   iRetorno        := 0;
   Result.iCodErro := 0;
   Orcamento       := TOrcamentoBack.Create;
   dtmLancImovel.qryLancImovel.First;
   try
      while (not dtmLancImovel.qryLancImovel.EOF) and (Result.iCodErro = 0)  do begin
         if not dtmLancImovel.qryLancImovelIDRESERVAORCAMEN.IsNull then begin
            if dtmLancImovel.qryLancImovelRECPAG.AsString = 'P' then begin   // contas a pagar
               try
                  sDataLancto := FormatDateTime('dd/mm/yyyy',dtmLancImovel.qryLancImovelDATALANCAMENTO.AsDateTime);

                  iNumReserva := Orcamento.BuscaIdNumReserva(dtmLancImovel.qryLancImovelIDRESERVAORCAMEN.AsInteger,0,true);
                  iNumCompromisso := iNumReserva;

                  // Cria um compromisso com base na reserva  -- NÃO ESTÁ SENDO UTILIZADO, JÁ É INFORMADO O DIRETO O NR. DO COMPROMISSO
{                  iNumCompromisso := Orcamento.CriaCompromisso(sDataLancto,
                                             dtmLancImovel.qryLancImovelVALOR_LANC.AsFloat,
                                             '', Sistema.IdModulo,
                                             [iNumReserva],
                                             false,true);
                  case iNumCompromisso of
                     -5..-1 : result.iCodErro := -59 + iNumCompromisso;  //-60 .. -64
                     -99..-6: result.iCodErro := -65;  // novo erro da função CriaCompromisso
                  else
                     Result.iCodErro := 0;   // processamento ok
                  end;
}

                  if iNumCompromisso > 0 then begin  // processou a primeira função
                     iRetorno := Orcamento.EfetivaCompromisso(iNumCompromisso,
                                             dtmLancImovel.qryLancImovelVALOR_LANC.AsFloat,false);
                     case iRetorno of
                        0: begin  // tudo ocorreu em situação normal
                           // gravar no lançamento o id da compromisso criado  -  ATUALMENTE JÁ ESTA SENDO BUSCADO NA TELA APENAS O NR. DO COMPROMISSO E NÃO A RESERVA
{                           dtmLancImovel.qryLancImovel.Edit;
                           dtmLancImovel.qryLancImovelIDRESERVAORCAMEN.AsInteger := Orcamento.BuscaIdNumReserva(0,iNumCompromisso,true);
                           dtmLancImovel.qryLancImovel.Post;
                           result.iCodErro := 0;   }
                        end;
                        1..6: result.iCodErro := (-65)+(iRetorno*-1);   //-66 .. -71
                     else
                        Result.iCodErro := -72; // novo erro na função EfetivaCompromisso
                     end;
                  end;
               except
                  on e:Exception do begin
                     Result.sMensErro := e.Message;
                     result.iCodErro := -75;
                  end;
               end;
      {   end else begin   // contas a receber - devolução do compromisso.
            with dtmImobiliario.qryAux do begin
               Close;
               SQL.Clear;
               SQL.Add('UPDATE RESERVAORCAMEN SET                                  ');
               SQL.Add('       VLRDEVOLVIDO   = VLRDEVOLVIDO + :SALDOCOMP,         ');
               SQL.Add('       VL RCOMPROMISSO = VLRCOMPROMISSO - :SALDOCOMP        ');
               SQL.Add('WHERE                                                      ');
               SQL.Add('IDPESSOA =:IDPESSOA AND IDRESERVAORCAMEN =:IDRESERVAORCAMEN');
               ParamByName('IDPESSOA').asInteger         := Sistema.idEmpresa;
               ParamByName('IDRESERVAORCAMEN').asInteger := dtmLancImovel.qryLancImovelIDRESERVAORCAMEN.AsInteger;
               ParamByName('SALDOCOMP').asFloat          := dtmLancImovel.qryLancImovelVALOR_LANC.AsFloat;
               ExecSQL;
            end;
            //Estorna o Valor no Saldo Orçamentário
            with dtmImobiliario.qryAux do begin
               Close;
               SQL.Clear;
               SQL.Add('UPDATE SALDOORCADO SET ' + sFieldResOuComp + ' = ');
               SQL.Add('(' + sFieldResOuComp + ' - :VALOR) WHERE ' );
               SQL.Add('IDPESSOA       =:IDPESSOA AND ');
               SQL.Add('DATAREFERENCIA = TO_DATE(:DATAREFERENCIA,''DD/MM/YYYY'') AND ');
               SQL.Add('IDPLANOORCAMEN =:IDPLANOORCAMEN AND ');
               SQL.Add('IDCONTAORCAMEN =:IDCONTAORCAMEN ');
               ParamByName('VALOR').asFloat            := rValorDev;
               ParamByName('IDPESSOA').asInteger       := Sistema.idEmpresa;
               ParamByName('DATAREFERENCIA').asString  := qryReservas.FieldByName('DATAREFERENCIA').asString;
               ParamByName('IDPLANOORCAMEN').asInteger := qryReservas.FieldByName('IDPLANOORCAMEN').asInteger;
               ParamByName('IDCONTAORCAMEN').asString  := qryReservas.FieldByName('IDCONTAORCAMEN').asString;
               ExecSQL;
            end;  }
            end;
         end;

         dtmLancImovel.qryLancImovel.Next;
      end;
   finally
      Orcamento.Free;
   end;
end;



function TfrmExecIntegraLancNovo.DefineHistorico(const bSegOper:Boolean): TParamContabeisMT;
var
   sObs, sTextoPagRec   : string;
   rParamContabeis      : TParamContabeisMT;
begin
   sObs := '';
   sObs := FuncoesImob.SelectObsLanc(dtmLancImovel.qryLancImovelIDDOCUMENTO.AsInteger);

   // historico contabil = obs ap
   if dtmImobiliario.qryParamImobFLGHISTCONTDIFAP.AsInteger <> 1 then
      // histórico: se houver obs no lançamento, essa será o histórico
      rParamContabeis.sHistoricoCtb := sObs;

   if (length(trim(sObs)) = 0) or (dtmImobiliario.qryParamImobFLGHISTCONTDIFAP.AsInteger = 1) then begin

      if dtmLancImovel.qryLancImovelRECPAG.AsString = 'P' then begin
         sTextoPagRec := ', a pagar, ' // 'Pagamento de ';
      end else begin
         sTextoPagRec := ', a receber, '; // 'Recebimento de ';
      end;

      // DOC: 001, a receber,
      rParamContabeis.sHistoricoCtb :=  'DOC: ' + inttostr(dtmLancImovel.qryLancImovelNODOCUMENTO.AsInteger) + sTextoPagRec;

      // DOC: 001, a receber, ref: Aluguel
      if not bSegOper then begin
         rParamContabeis.sHistoricoCtb :=  rParamContabeis.sHistoricoCtb + trim(dtmLancImovel.qryLancImovelDESCCUSTORECIMO.AsString);
      end else begin
         rParamContabeis.sHistoricoCtb :=  rParamContabeis.sHistoricoCtb + BuscaDescSegOper(dtmLancImovel.qryLancImovelIDTIPOCUSTORECIMO.AsInteger);
      end;

      // DOC: 001, a receber, ref: Aluguel - comp: Janeiro/2002
      rParamContabeis.sHistoricoCtb :=  rParamContabeis.sHistoricoCtb + ' - comp: ' + dtmLancImovel.qryLancImovel_MESCOMPETENCIA.asString + '/' + dtmLancImovel.qryLancImovelANOCOMPETENCIA.AsString;

      // DOC: 001, a receber, ref: Aluguel - comp: Janeiro/2002 - venc: 05/02/2002
      rParamContabeis.sHistoricoCtb := rParamContabeis.sHistoricoCtb + ' - venc: ' + DateToStr(dtmLancImovel.qryLancImovelDATAVENCIMENTO.AsDateTime);

      // DOC: 001, a receber, ref: Aluguel - comp: Janeiro/2002 - venc: 05/02/2002 - Contr: 999 - Nome Contrato
      rParamContabeis.sHistoricoCtb := rParamContabeis.sHistoricoCtb + ' - Contr: ' + Trim(dtmLancImovel.qryLancImovelCONTRATO_EXTENSO.AsString);

      // DOC: 001, a receber, ref: Aluguel - comp: Janeiro/2002 - vencimento 05/02/2002 - forma: Folha de Aluguéis
      rParamContabeis.sHistoricoCtb := rParamContabeis.sHistoricoCtb + ' - forma: ' + OrigemLancamento(dtmLancImovel.qryLancImovelFLGORIGEMLANC.AsString[1]);
   end;

   // Divide o histórico em sub-históricos se exceder a quantidade de caracteres
   // FuncaoGeral.ArrumaHistorico(rParamContabeis.sHistorico, rParamContabeis.sHist1, rParamContabeis.sHist2, rParamContabeis.sHist3, rParamContabeis.sHist4, rParamContabeis.sHist5);

   rParamContabeis.sHistoricoCapCar := sObs;  // somente será utilizado pelo objeto documento

   Result := rParamContabeis;
end;

function TfrmExecIntegraLancNovo.BuscaDescSegOper(const iIdTipoRecDes: Integer): String;
var sSql : String;
begin
   Result := '';
   sSql   := 'SELECT T2.DESCCUSTORECIMO ' +
             '  FROM TIPOCUSTORECIMOV T1, TIPOCUSTORECIMOV T2 ' +
             ' WHERE T1.IDOPERCONTAB = T2.IDTIPOCUSTORECIMO ' +
             '   AND T1.IDTIPOCUSTORECIMO = 1';
   FazQuery(dtmImobiliario.qryAux, sSql);
   if not dtmImobiliario.qryAux.IsEmpty then begin
      Result := Trim(dtmImobiliario.qryAux.FieldByName('DESCCUSTORECIMO').AsString);
   end;
end;


// Integração Contábil sem Partida Dobrada
function TfrmExecIntegraLancNovo.IntegraContabilidade(var vParamContabeis, vParamOperContab: array of TParamContabeisMT): TMensErro;
var iRegistro: integer;
begin
   Result.iCodErro  := 0;
   Result.sMensErro := '';

//   if vParamContabeis[0].iFlgIntegraContab = 0 then Exit;
   if not vParamContabeis[0].bFlgIntegraContab then Exit;

   if dtmLancImovel.qryLancImovelFLGORIGEMLANC.AsString = 'V' then Exit;  // lançamento de previsão

   vParamContabeis[0].iPlanilha := 0;
   try
      dtmLancImovel.qryLancImovel.First;
      iRegistro := 0;
      while (not dtmLancImovel.qryLancImovel.EOF) and (Result.iCodErro = 0)  do begin

         // salvar o numero da planilha em todas as linhas do vetor, pois na função e passado um record
         if iRegistro > 0 then begin
            vParamContabeis[iRegistro].iPlanilha := vParamContabeis[0].iPlanilha;
         end;

         // Define paramentros de integracao
         if Result.iCodErro = 0 then begin
            // definir os parâmetros contábeis
            Result.iCodErro := VerificaCondicoes(vParamContabeis[iRegistro]);
         end;

         if Result.iCodErro = 0 then begin
            // fazer o lançamento à Débito
            Result := FazerLancamentoContab(vParamContabeis[iRegistro], '0', {0=Débito}
                                            dtmLancImovel.qryLancImovelDATALANCAMENTO.AsDateTime,
                                            dtmLancImovel.qryLancImovelNODOCUMENTO.AsFloat,
                                            dtmLancImovel.qryLancImovelVALOR_LANC.AsFloat,
                                            dtmLancImovel.qryLancImovelIDUSUARIOSISTEMA.AsInteger,
                                            dtmLancImovel.qryLancImovelIDPATRO.AsInteger,
                                            dtmLancImovel.qryLancImovelIDPLANOPREV.AsInteger);
         end;

         if Result.iCodErro = 0 then begin
         // fazer o lançamento à crédito
            Result := FazerLancamentoContab(vParamContabeis[iRegistro], '1',{1=Crédito}
                                            dtmLancImovel.qryLancImovelDATALANCAMENTO.AsDateTime,
                                            dtmLancImovel.qryLancImovelNODOCUMENTO.AsFloat,
                                            dtmLancImovel.qryLancImovelVALOR_LANC.AsFloat,
                                            dtmLancImovel.qryLancImovelIDUSUARIOSISTEMA.AsInteger,
                                            dtmLancImovel.qryLancImovelIDPATRO.AsInteger,
                                            dtmLancImovel.qryLancImovelIDPLANOPREV.AsInteger);
         end;

         // Efetuar o segundo registro contábil
         if (not dtmLancImovel.qryLancImovelIDOPERCONTAB.IsNull) then begin
            // Grava o mesmo numero de planilha
            vParamOperContab[iRegistro].iPlanilha := vParamContabeis[0].iPlanilha;

            if Result.iCodErro = 0 then begin
               // fazer o lançamento à Débito
               Result := FazerLancamentoContab(vParamOperContab[iRegistro], '0', {0=Débito}
                                               dtmLancImovel.qryLancImovelDATALANCAMENTO.AsDateTime,
                                               dtmLancImovel.qryLancImovelNODOCUMENTO.AsFloat,
                                               dtmLancImovel.qryLancImovelVALOR_LANC.AsFloat,
                                               dtmLancImovel.qryLancImovelIDUSUARIOSISTEMA.AsInteger,
                                               dtmLancImovel.qryLancImovelIDPATRO.AsInteger,
                                               dtmLancImovel.qryLancImovelIDPLANOPREV.AsInteger);
            end;

            if Result.iCodErro = 0 then begin
            // fazer o lançamento à crédito
               Result := FazerLancamentoContab(vParamOperContab[iRegistro], '1',{1=Crédito}
                                               dtmLancImovel.qryLancImovelDATALANCAMENTO.AsDateTime,
                                               dtmLancImovel.qryLancImovelNODOCUMENTO.AsFloat,
                                               dtmLancImovel.qryLancImovelVALOR_LANC.AsFloat,
                                               dtmLancImovel.qryLancImovelIDUSUARIOSISTEMA.AsInteger,
                                               dtmLancImovel.qryLancImovelIDPATRO.AsInteger,
                                               dtmLancImovel.qryLancImovelIDPLANOPREV.AsInteger);
            end;
         end;

         dtmLancImovel.qryLancImovel.Next;
         inc(iRegistro);
      end;

   except
      on e:exception do begin
         if Result.sMensErro = '' then Result.sMensErro := e.Message
         else Result.sMensErro := Result.sMensErro + #13 + e.Message;

         // definir código de retorno
         Result.iCodErro := -27;
      end;
   end;
end;


// Integração Contábil para Partida Dobrada
function TfrmExecIntegraLancNovo.IntegraContabilidadePD(var vParamContabeis, vParamOperContab: array of TParamContabeisMT): TMensErro;
var iRegistro, i: integer;
    vLancaPD, vSegOperPD : Array of TContabPD;
    bNovoLancto, bSegOper : Boolean;
begin
   Result.iCodErro  := 0;
   Result.sMensErro := '';
   vLancaPD         := nil;
   vSegOperPD       := nil;

//   if vParamContabeis[0].iFlgIntegraContab = 0 then Exit;
   if not vParamContabeis[0].bFlgIntegraContab then Exit;

   if dtmLancImovel.qryLancImovelFLGORIGEMLANC.AsString = 'V' then Exit;  // lançamento de previsão

   vParamContabeis[0].iPlanilha := 0;
   try
      dtmLancImovel.qryLancImovel.First;
      iRegistro := 0;
      bSegOper  := (not dtmLancImovel.qryLancImovelIDOPERCONTAB.IsNull);

      while (not dtmLancImovel.qryLancImovel.EOF) and (Result.iCodErro = 0)  do begin

         // Define paramentros de integracao
         if Result.iCodErro = 0 then begin
            // definir os parâmetros contábeis
            Result.iCodErro := VerificaCondicoes(vParamContabeis[iRegistro]);
         end;

         // Agrupa lancamentos que possuem a mesma parametrização ( = BJUNTA )
         bNovoLancto := True;
         for i := 0 to Length(vLancaPD)-1 do begin

           if (vParamContabeis[iRegistro].sContaContabilDebito  = vLancaPD[i].Parametros.sContaContabilDebito)  and
              (vParamContabeis[iRegistro].sSubContaDebito       = vLancaPD[i].Parametros.sSubContaDebito)       and
              (vParamContabeis[iRegistro].sCentroCustoDebito    = vLancaPD[i].Parametros.sCentroCustoDebito)    and
              (vParamContabeis[iRegistro].sContaContabilCredito = vLancaPD[i].Parametros.sContaContabilCredito) and
              (vParamContabeis[iRegistro].sSubContaCredito      = vLancaPD[i].Parametros.sSubContaCredito)      and
              (vParamContabeis[iRegistro].sCentroCustoCredito   = vLancaPD[i].Parametros.sCentroCustoCredito)   and
              (vParamContabeis[iRegistro].sHistoricoCapCar      = vLancaPD[i].Parametros.sHistoricoCapCar)      and
              (vParamContabeis[iRegistro].sHistoricoCtb         = vLancaPD[i].Parametros.sHistoricoCtb)         and
              (vParamContabeis[iRegistro].iExercicio            = vLancaPD[i].Parametros.iExercicio)            and
              (vParamContabeis[iRegistro].iPeriodo              = vLancaPD[i].Parametros.iPeriodo)              and
              (vParamContabeis[iRegistro].iIdRateioDocum        = vLancaPD[i].Parametros.iIdRateioDocum)        and
              (vParamContabeis[iRegistro].iCodDocumento         = vLancaPD[i].Parametros.iCodDocumento)         and
              (vParamContabeis[iRegistro].sContaDebCred         = vLancaPD[i].Parametros.sContaDebCred)         and
              (vParamContabeis[iRegistro].sContaResult          = vLancaPD[i].Parametros.sContaResult)          and
              (vParamContabeis[iRegistro].sCentroCustoDebCred   = vLancaPD[i].Parametros.sCentroCustoDebCred)   and
              (vParamContabeis[iRegistro].sCentroCustoResult    = vLancaPD[i].Parametros.sCentroCustoResult)    and
              (vParamContabeis[iRegistro].iUnidNegoc            = vLancaPD[i].Parametros.iUnidNegoc)            and
              (vParamContabeis[iRegistro].sSubContaDebCred      = vLancaPD[i].Parametros.sSubContaDebCred)      and
              (vParamContabeis[iRegistro].sSubContaResult       = vLancaPD[i].Parametros.sSubContaResult)       and
              (vParamContabeis[iRegistro].sCodTipRecDes         = vLancaPD[i].Parametros.sCodTipRecDes)         and
              (vParamContabeis[iRegistro].sCodCentroRespon      = vLancaPD[i].Parametros.sCodCentroRespon)      and
              (vParamContabeis[iRegistro].sTipCodigo            = vLancaPD[i].Parametros.sTipCodigo)            then begin

              bNovoLancto := False;
              vLancaPD[i].VlrTotal := vLancaPD[i].VlrTotal + dtmLancImovel.qryLancImovelVALOR_LANC.AsFloat;
           end;
         end;

         if bNovoLancto then begin
            SetLength(vLancaPD,(Length(vLancaPD)+1) );
            i := High(vLancaPD);
            vLancaPD[i].Parametros    := vParamContabeis[iRegistro];
            vLancaPD[i].IdUsuario     := dtmLancImovel.qryLancImovelIDUSUARIOSISTEMA.AsInteger;
            vLancaPD[i].IdPatroImovel := dtmLancImovel.qryLancImovelIDPATRO.AsInteger;
            vLancaPD[i].IdPlanoImovel := dtmLancImovel.qryLancImovelIDPLANOPREV.AsInteger;
            vLancaPD[i].NoDocumento   := dtmLancImovel.qryLancImovelNODOCUMENTO.AsFloat;
            vLancaPD[i].dLancto       := dtmLancImovel.qryLancImovelDATALANCAMENTO.AsDateTime;
            vLancaPD[i].VlrTotal      := dtmLancImovel.qryLancImovelVALOR_LANC.AsFloat;
         end;

         // SEGUNDA CONTABILIZAÇÃO DO LANÇAMENTO
         // Agrupa lancamentos que possuem a mesma parametrização ( = BJUNTA )
         if bSegOper then begin
            bNovoLancto := True;
            for i := 0 to Length(vSegOperPD)-1 do begin

              if (vParamOperContab[iRegistro].sContaContabilDebito  = vSegOperPD[i].Parametros.sContaContabilDebito)  and
                 (vParamOperContab[iRegistro].sSubContaDebito       = vSegOperPD[i].Parametros.sSubContaDebito)       and
                 (vParamOperContab[iRegistro].sCentroCustoDebito    = vSegOperPD[i].Parametros.sCentroCustoDebito)    and
                 (vParamOperContab[iRegistro].sContaContabilCredito = vSegOperPD[i].Parametros.sContaContabilCredito) and
                 (vParamOperContab[iRegistro].sSubContaCredito      = vSegOperPD[i].Parametros.sSubContaCredito)      and
                 (vParamOperContab[iRegistro].sCentroCustoCredito   = vSegOperPD[i].Parametros.sCentroCustoCredito)   and
                 (vParamOperContab[iRegistro].sHistoricoCapCar      = vSegOperPD[i].Parametros.sHistoricoCapCar)      and
                 (vParamOperContab[iRegistro].sHistoricoCtb         = vSegOperPD[i].Parametros.sHistoricoCtb)         and
                 (vParamOperContab[iRegistro].iExercicio            = vSegOperPD[i].Parametros.iExercicio)            and
                 (vParamOperContab[iRegistro].iPeriodo              = vSegOperPD[i].Parametros.iPeriodo)              and
                 (vParamOperContab[iRegistro].iIdRateioDocum        = vSegOperPD[i].Parametros.iIdRateioDocum)        and
                 (vParamOperContab[iRegistro].iCodDocumento         = vSegOperPD[i].Parametros.iCodDocumento)         and
                 (vParamOperContab[iRegistro].sContaDebCred         = vSegOperPD[i].Parametros.sContaDebCred)         and
                 (vParamOperContab[iRegistro].sContaResult          = vSegOperPD[i].Parametros.sContaResult)          and
                 (vParamOperContab[iRegistro].sCentroCustoDebCred   = vSegOperPD[i].Parametros.sCentroCustoDebCred)   and
                 (vParamOperContab[iRegistro].sCentroCustoResult    = vSegOperPD[i].Parametros.sCentroCustoResult)    and
                 (vParamOperContab[iRegistro].iUnidNegoc            = vSegOperPD[i].Parametros.iUnidNegoc)            and
                 (vParamOperContab[iRegistro].sSubContaDebCred      = vSegOperPD[i].Parametros.sSubContaDebCred)      and
                 (vParamOperContab[iRegistro].sSubContaResult       = vSegOperPD[i].Parametros.sSubContaResult)       and
                 (vParamOperContab[iRegistro].sCodTipRecDes         = vSegOperPD[i].Parametros.sCodTipRecDes)         and
                 (vParamOperContab[iRegistro].sCodCentroRespon      = vSegOperPD[i].Parametros.sCodCentroRespon)      and
                 (vParamOperContab[iRegistro].sTipCodigo            = vSegOperPD[i].Parametros.sTipCodigo)            then begin

                 bNovoLancto := False;
                 vSegOperPD[i].VlrTotal := vSegOperPD[i].VlrTotal + dtmLancImovel.qryLancImovelVALOR_LANC.AsFloat;
              end;
            end;

            if bNovoLancto then begin
               SetLength(vSegOperPD,(Length(vSegOperPD)+1) );
               i := High(vSegOperPD);
               vSegOperPD[i].Parametros    := vParamOperContab[iRegistro];
               vSegOperPD[i].IdUsuario     := dtmLancImovel.qryLancImovelIDUSUARIOSISTEMA.AsInteger;
               vSegOperPD[i].IdPatroImovel := dtmLancImovel.qryLancImovelIDPATRO.AsInteger;
               vSegOperPD[i].IdPlanoImovel := dtmLancImovel.qryLancImovelIDPLANOPREV.AsInteger;
               vSegOperPD[i].NoDocumento   := dtmLancImovel.qryLancImovelNODOCUMENTO.AsFloat;
               vSegOperPD[i].dLancto       := dtmLancImovel.qryLancImovelDATALANCAMENTO.AsDateTime;
               vSegOperPD[i].VlrTotal      := dtmLancImovel.qryLancImovelVALOR_LANC.AsFloat;
            end;

         end;

         dtmLancImovel.qryLancImovel.Next;
         inc(iRegistro);
      end;

      // Efetua o lançamento em partida dobrada
      for i := 0 to Length(vLancaPD) -1 do begin

         // salvar o numero da planilha em todas as linhas do vetor, pois na função e passado um record
         if i > 0 then begin
            vLancaPD[i].Parametros.iPlanilha := vLancaPD[0].Parametros.iPlanilha;
         end;

        // fazer o lançamento em Partida Dobrada
        if Result.iCodErro = 0 then
           Result := FazerLancamentoContab(vLancaPD[i].Parametros, '2',{2=Partida Dobrada}
                                           vLancaPD[i].dLancto,
                                           vLancaPD[i].NoDocumento,
                                           vLancaPD[i].VlrTotal,
                                           vLancaPD[i].IdUsuario,
                                           vLancaPD[i].IdPatroImovel,
                                           vLancaPD[i].IdPlanoImovel);
      end;

      // Efetua o lançamento da segunda operação contábil
      if bSegOper then begin
         // Efetua o lançamento em partida dobrada
         for i := 0 to Length(vSegOperPD) -1 do begin

            // utilizar a mesma planilha do primeiro registro para todos os lançamentos
            vSegOperPD[i].Parametros.iPlanilha := vLancaPD[0].Parametros.iPlanilha;

           // fazer o lançamento em Partida Dobrada
           if Result.iCodErro = 0 then
              Result := FazerLancamentoContab(vSegOperPD[i].Parametros, '2',{2=Partida Dobrada}
                                              vSegOperPD[i].dLancto,
                                              vSegOperPD[i].NoDocumento,
                                              vSegOperPD[i].VlrTotal,
                                              vSegOperPD[i].IdUsuario,
                                              vSegOperPD[i].IdPatroImovel,
                                              vSegOperPD[i].IdPlanoImovel);
         end;
      end;

      // Atualiza o Nr. da Planilha nos Lançamentos por imóvel
      if Result.iCodErro = 0 then begin
        for i := 0 to Length(vParamContabeis) -1 do begin
           vParamContabeis[i].iPlanilha := vLancaPD[0].Parametros.iPlanilha;
        end;

        if bSegOper then begin
           for i := 0 to Length(vParamOperContab) -1 do begin
              vParamOperContab[i].iPlanilha := vLancaPD[0].Parametros.iPlanilha;
           end;
        end;
      end;

   except
      on e:exception do begin
         if Result.sMensErro = '' then Result.sMensErro := e.Message
         else Result.sMensErro := Result.sMensErro + #13 + e.Message;

         // definir código de retorno
         Result.iCodErro := -27;
      end;
   end;
end;



{ Função VerificaCondições

  Códigos de erro
     -11  Lançamento de despesa cujo responsável não é a fundação
     -12  Código de tipo de desembolso não informado
     -13  Código de tipo de recebimento não informado
     -14  Unidade de negócio não informado
     -15  Código de centro de responsabilidade não informado
     -16  Número de documento inválido
     -17  Código de documento inválido
     -18  Tipo código não informado

Descrição da funcão
  If despesa
    responsavel = fundacao >>> flgresppagto = 'F' (-11)
    if flgintegracapcar
       >>> codtipdesemb not null  (-12)

  If receita
     >>>> não faz nada
     if flgintegracapcar
        >>> codtipreceb not null  (-13)

  if ambos
     >>>> unidnegoc not null  (-14)
     if flgintegracapcar
        >>> codcentrorespon not null   (-15)
        >>> numdocumentos              (-16)
     if flgintegracontab
        >>> tipcodigo not null         (-17)
}
function TfrmExecIntegraLancNovo.VerificaCondicoes(const rParamContabeis: TParamContabeisMT): integer;
begin
   Result := 0;

   if dtmLancImovel.qryLancImovelRECPAG.AsString = 'P' then      // DESPESA
   begin
      { Existe agora um procedimento para verificar Responsabilidade do Pagamento
        VerificaResponsavel
      if dtmLancImovel.qryLancImovelFLGRESPPAGAMENTO.AsString <> 'F' then begin
         Result := -11;
         Exit;
      end;  }

//      if (rParamContabeis.iFlgIntegraCapCar = 1) and (rParamContabeis.sCodTipRecDes = '') then begin
      if (rParamContabeis.bFlgIntegraCapCar) and (rParamContabeis.sCodTipRecDes = '') then begin
         Result := -12;
         Exit;
      end;
   end else begin    // RECEITA

      if rParamContabeis.sCodTipRecDes = '' then begin
         Result := -13;
         Exit;
      end;
   end;

   if rParamContabeis.iUnidNegoc = 0 then begin
      Result := -14;
      Exit;
   end;

//   if (rParamContabeis.iFlgIntegraCapCar = 1) then begin
   if (rParamContabeis.bFlgIntegraCapCar) then begin

      if (rParamContabeis.sCodCentroRespon = '') then begin
         Result := -15;
         Exit;
      end;

      if (dtmLancImovel.qryLancImovelNODOCUMENTO.IsNull) then begin
         Result := -16;
         Exit;
      end;
   end;

//  if (rParamContabeis.iFlgIntegraContab = 1) and (rParamContabeis.sTipCodigo = '') then begin
  if (rParamContabeis.bFlgIntegraContab) and (rParamContabeis.sTipCodigo = '') then begin
      Result := -18;
   end;
end;







function TfrmExecIntegraLancNovo.DefineParamContabeis(var rParamContabeis: TParamContabeisMT; const bSegOper:Boolean): integer;
var
   iCodErro: integer;
   sRecPag : String;
   iRecDes : Integer;
begin
{ Função que retorna como parâmetros os seguintes lançamentos.

  Record ParamContabeis
     sContaContabilDebito
     sSubContaDebito
     sCentroCustoDebito
     sContaContabilCredito
     sSubContaCredito
     sCentroCustoCredito

  Códigos de erros possíveis - retornáveis
     DefineParamContabeis
     -1  Conta contábil débito não informada
     -2  Sub conta contábil débito obrigatório mas não informada
     -3  Centro de Custos conta débito obrigatório mas não informado
     -4  Conta contábil crédito não informada
     -5  Sub conta contábil crédito obrigatório mas não informada
     -6  Centro de Custos conta crédito obrigatório mas não informado
}


   if not bSegOper then begin
      sRecPag := dtmLancImovel.qryLancImovelRECPAG.AsString;
      iRecDes := dtmLancImovel.qryLancImovelIDTIPOCUSTORECIMO.AsInteger;
   end else begin
      sRecPag := 'O';
      iRecDes := dtmLancImovel.qryLancImovelIDOPERCONTAB.AsInteger;
   end;

{
   // obter as contas contábeis
   iCodErro := FuncoesImob.BuscaPadrLanc(sRecPag,
                             dtmLancImovel.qryLancImovelCODTIPIMOVEL.AsString,
                             Sistema.IdEmpresa,
                             Sistema.IdModulo,
                             iRecDes,
                             dtmLancImovel.qryLancImovelIDIMOVEL.AsInteger,
                             dtmLancImovel.qryLancImovelIDCONTRATOIMOVEL.AsInteger,
                             rParamContabeis);

}

      // zera parametros contabeis
      CtrlPadrLancImovel.ZeraPadrLancContabil( rParamContabeis );

      // definir parâmetros contábeis
      if not CtrlPadrLancImovel.BuscaPadrLancContabil(rParamContabeis, iCodErro, sRecPag, False,
                                                      Sistema.idEmpresa, Sistema.idModulo,
                                                      iRecDes, dtmLancImovel.qryLancImovelCODTIPIMOVEL.AsString,
                                                      dtmLancImovel.qryLancImovelIDIMOVEL.AsInteger,
                                                      dtmLancImovel.qryLancImovelIDCONTRATOIMOVEL.AsInteger) then
      begin
         // integração com contabilidade falhou; exibe a mensagem de erro correspondente
         iCodErro  := -25;
      end;


   if not bSegOper then begin
      if iCodErro = -4 then Result := -7
      else if iCodErro = -5 then Result := -8
      else if iCodErro = -6 then Result := -9
      else if iCodErro = -7 then Result := -19
      else Result := 0;
   end else begin
      if iCodErro = -4 then Result := -10
      else if iCodErro = -5 then Result := -11
      else if iCodErro = -6 then Result := -9
      else if iCodErro = -7 then Result := -19
      else Result := 0;
   end;
end;


function TfrmExecIntegraLancNovo.ConfereParamContabeis(var rParamContabeis: TParamContabeisMT): integer;
var
   bObrigaCentroCustoDebCred, bObrigaSubContaDebCred : boolean;
   bObrigaCentroCustoResult, bObrigaSubContaResult : boolean;
   bAbreQuery, bAbreQueryImovel: Boolean;
begin
{ Função que retorna como parâmetros os seguintes lançamentos.

  se a conta do cliente/fornecedor estiver em branco a função busca

  a função busca também as subcontas necessárias


  Record ParamContabeis
     sContaContabilDebito
     sSubContaDebito
     sCentroCustoDebito
     sContaContabilCredito
     sSubContaCredito
     sCentroCustoCredito

  Códigos de erros possíveis - retornáveis
     DefineParamContabeis
     -1  Conta contábil débito não informada
     -2  Sub conta contábil débito obrigatório mas não informada
     -3  Centro de Custos conta débito obrigatório mas não informado
     -4  Conta contábil crédito não informada
     -5  Sub conta contábil crédito obrigatório mas não informada
     -6  Centro de Custos conta crédito obrigatório mas não informado
}


   AtribuiContaAtivoPassivo(rParamContabeis);  // pega as contas de ativo e passivo em branco

   // CHECA OBRIGATORIEDADE DE SUBCONTAS E CENTRO DE CUSTO
   // -------------------------------------------------------------------------------------------
   // Conta Contábil de Passivo
   // -------------------------------------------------------------------------------------------

   with dtmImobiliario.qryVerificaConta do begin
      LimpaParametros(dtmImobiliario.qryVerificaConta);
      ParamByName('PLANO').AsInteger := IntegraBack.Plano;
      ParamByName('CONTA').AsString  := rParamContabeis.sContaDebCred;
      Open;

      bObrigaSubContaDebCred    := FieldByName('PLASUBCONTA').asString = 'S';
      bObrigaCentroCustoDebCred := FieldByName('PLACCUST').asString = 'S';
   end;

   // pegar a sub-conta do cliente / fornecedor
   if bObrigaSubContaDebCred then begin

      if dtmLancImovel.qryLancImovelRECPAG.AsString = 'R' then begin
         bAbreQuery := false;  // utilizado para otimização, somente abrir se precisar
         if qryBuscaCtaCli.Active then bAbreQuery := true
         else if qryBuscaCtaCliIDFORCLI.AsInteger <> dtmLancImovel.qryLancImovelIDFORCLI.AsInteger then bAbreQuery := true;
         if bAbreQuery then begin
            LimpaParametros(qryBuscaCtaCli);
            qryBuscaCtaCli.ParamByName('PIDFORCLI').AsInteger := dtmLancImovel.qryLancImovelIDFORCLI.AsInteger;
            qryBuscaCtaCli.Open;
         end;
         rParamContabeis.sSubContaDebCred := qryBuscaCtaCliCODSUBCONTA.AsString;
         rParamContabeis.sSubContaDebito  := qryBuscaCtaCliCODSUBCONTA.AsString;
      end else begin      // contas a pagar
         bAbreQuery := false;  // utilizado para otimização, somente abrir se precisar
         if qryBuscaCtaFor.Active then bAbreQuery := true
         else if qryBuscaCtaForIDFORCLI.AsInteger <> dtmLancImovel.qryLancImovelIDFORCLI.AsInteger then bAbreQuery := true;
         if bAbreQuery then begin
            LimpaParametros(qryBuscaCtaFor);
            qryBuscaCtaFor.ParamByName('PIDFORCLI').AsInteger := dtmLancImovel.qryLancImovelIDFORCLI.AsInteger;
            qryBuscaCtaFor.Open;
         end;
         rParamContabeis.sSubContaDebCred := qryBuscaCtaForCODSUBCONTA.AsString;
         rParamContabeis.sSubContaCredito := qryBuscaCtaForCODSUBCONTA.AsString;
      end;
   end;


   // verifica se obriga Centro de Custo
   if not bObrigaCentroCustoDebCred then begin
      rParamContabeis.sCentroCustoDebCred := '';

      if dtmLancImovel.qryLancImovelRECPAG.AsString = 'P' then
         rParamContabeis.sCentroCustoCredito := ''
      else
         rParamContabeis.sCentroCustoDebito := '';

   end;



   // CHECA OBRIGATORIEDADE DE SUBCONTAS E CENTRO DE CUSTO
   // -------------------------------------------------------------------------------------------
   // Conta Contábil de Resultado
   // -------------------------------------------------------------------------------------------

   with dtmImobiliario.qryVerificaConta do begin
      LimpaParametros(dtmImobiliario.qryVerificaConta);
      ParamByName('PLANO').AsInteger := IntegraBack.Plano;
      ParamByName('CONTA').AsString  := rParamContabeis.sContaResult;
      Open;

      bObrigaSubContaResult    := FieldByName('PLASUBCONTA').asString = 'S';
      bObrigaCentroCustoResult := FieldByName('PLACCUST').asString = 'S';
   end;

   // primeiro verifica se a Sub-Conta pode ser usada
   if bObrigaSubContaResult then begin
      if not dtmLancImovel.qryLancImovelCODSUBCONTA.IsNull then begin // encontrada a sub-conta no imóvel

         rParamContabeis.sSubContaResult := dtmLancImovel.qryLancImovelCODSUBCONTA.AsString;
         if dtmLancImovel.qryLancImovelRECPAG.AsString = 'R' then
            rParamContabeis.sSubContaCredito := dtmLancImovel.qryLancImovelCODSUBCONTA.AsString
         else
            rParamContabeis.sSubContaDebito  := dtmLancImovel.qryLancImovelCODSUBCONTA.AsString;
      end else begin    // não encontrada sub conta no imovel procurar no mestre

         bAbreQueryImovel := false;
         if not qryBuscaSubContaMestre.Active then bAbreQueryImovel := true
         else if qryBuscaSubContaMestreIDIMOVEL.AsInteger = dtmLancImovel.qryLancImovelIDIMOVELMESTRE.AsInteger THEN bAbreQueryImovel := true;

         if bAbreQuery then begin;
            LimpaParametros (qryBuscaSubContaMestre);
            qryBuscaSubContaMestre.ParamByName('PIDIMOVEL').AsInteger := dtmLancImovel.qryLancImovelIDIMOVELMESTRE.AsInteger;
            qryBuscaSubContaMestre.Open;
         end;

         rParamContabeis.sSubContaResult := qryBuscaSubContaMestreCODSUBCONTA.AsString;
         if dtmLancImovel.qryLancImovelRECPAG.AsString = 'R' then
            rParamContabeis.sSubContaCredito := qryBuscaSubContaMestreCODSUBCONTA.AsString
         else
            rParamContabeis.sSubContaDebito  := qryBuscaSubContaMestreCODSUBCONTA.AsString;;
      end;
   end;

   // verifica se obriga Centro de Custo
   if not bObrigaCentroCustoResult then begin
      rParamContabeis.sCentroCustoResult := '';

      if dtmLancImovel.qryLancImovelRECPAG.AsString = 'P' then
         rParamContabeis.sCentroCustoDebito := ''
      else
         rParamContabeis.sCentroCustoCredito := '';

   end;


   Result := 0;  // sem problemas

   // ----------------------------------------------------------------------------------------------
   //    Finalmentes
   // ----------------------------------------------------------------------------------------------
//   if  rParamContabeis.iFlgIntegraContab = 1 then begin  // se for integração contábil são necessárias as duas contas
   if  rParamContabeis.bFlgIntegraContab then begin  // se for integração contábil são necessárias as duas contas
      if ( rParamContabeis.sContaContabilDebito = '' ) then begin
         Result := -1;
         exit;
      end;
      if ( rParamContabeis.sContaContabilCredito = '' ) then begin
         Result := -4;
         exit;
      end;
   end else begin // se não tiver integração contábil obrigar apenas a conta de ativo ou passivo

      if dtmLancImovel.qryLancImovelRECPAG.AsString = 'P' then begin
         if ( rParamContabeis.sContaContabilCredito = '' ) then begin
            Result := -4;
            exit;
         end;
      end else begin
         if ( rParamContabeis.sContaContabilDebito = '' ) then begin
            Result := -1;
            exit;
         end;
      end;

   end;

   if dtmLancImovel.qryLancImovelRECPAG.AsString = 'P' then begin
      if ( bObrigaSubContaResult ) and ( rParamContabeis.sSubContaDebito = '' ) then begin
         Result := -2  // obriga sub conta deb
      end else if ( bObrigaCentroCustoResult ) and ( rParamContabeis.sCentroCustoDebito = '' ) then begin
         Result := -3  // obriga centro custo deb
      end else if ( bObrigaSubContaDebCred ) and ( rParamContabeis.sSubContaCredito = '' ) then begin
         Result := -5  // obriga sub conta cre
      end else if ( bObrigaCentroCustoDebCred ) and ( rParamContabeis.sCentroCustoCredito = '' ) then begin
         Result := -6  // obriga centro custo cre
      end;
   end else if dtmLancImovel.qryLancImovelRECPAG.AsString = 'R' then begin
      if ( bObrigaSubContaDebCred ) and ( rParamContabeis.sSubContaDebito = '' ) then begin
         Result := -2  // obriga sub conta deb
      end else if ( bObrigaCentroCustoDebCred ) and ( rParamContabeis.sCentroCustoDebito = '' ) then begin
         Result := -3  // obriga centro custo deb
      end else if ( bObrigaSubContaResult ) and ( rParamContabeis.sSubContaCredito = '' ) then begin
         Result := -5  // obriga sub conta cre
      end else if ( bObrigaCentroCustoResult ) and ( rParamContabeis.sCentroCustoCredito = '' ) then begin
         Result := -6  // obriga centro custo cre
      end;
   end;


end;






// Funcão FazerLancamentoContab
//
//  sTipoLanc = 0 Debito  /  1 Crédito   /   2 Partida Dobrada
//
//  erros retornados pela funcao
//    FazerLancamentoContab
//    FazerLancamentoContab
//    -20 Data não pertence a nehum período
//    -21 Data pertence a mais de um período
//    -22 período bloqueado na contabilidade
//    -23 período já integrado. Lançamentos bloqueados
//    -24 Erro genérico funcao Testa Periodo
//    -25 Erro genérico funcao Lança Contabilidade
//    -26 Erro genérico função Fazer Lançamento Contabilidade
function TfrmExecIntegraLancNovo.FazerLancamentoContab(var rParamContabeis: TParamContabeisMT;
                                                       const sTipoLanc: char; const dLancto:TDateTime;
                                                       const NumDoc,VlrLancto:Extended;
                                                       const idUsuario, iIdPatroImovel, iIdPlanoImovel:Integer): TMensErro;
var
   sModulo, sDataLancamento: string;
   iTestaPeriodo: Integer;
   bJunta: Boolean;
   iIdPlanoPrev, iIdPatro : Integer;
   // parâmetros retornados por referência
   iEmpresa: integer;
   sCCustoD, sContaD, sCCustoC, sContaC: string;
   iSubContaD, iSubContaC : Integer;

   iCodErro : Integer;
begin
   Result.iCodErro  := 0;
   Result.sMensErro := '';

   try

      iEmpresa   := Sistema.idEmpresa;

      sModulo := IntToStr(Sistema.idModulo);
      sDataLancamento := FormatDateTime('dd/mm/yyyy', dLancto);

      { testa o período junto à Contabilidade
        apenas para o Débito pois o crédito é passado logo abaixo }

      iTestaPeriodo := TestaPeriodo(False, 'BaseDados', sDataLancamento, sModulo, rParamContabeis.iExercicio, rParamContabeis.iPeriodo, iEmpresa, Result.sMensErro);
      if iTestaPeriodo > 0 then begin  // retornou erro
         case iTestaPeriodo of
            1: Result.iCodErro := -20;
            2: Result.iCodErro := -21;
            3: Result.iCodErro := -22;
            4: Result.iCodErro := -23;
         else
            Result.iCodErro := -24;
         end;
         Exit;
      end;

      case StrtoInt(sTipoLanc) of
         0 : begin                    // Lançamento de Débito
               bJunta   := True;
               sCCustoD := rParamContabeis.sCentroCustoDebito;
               sContaD  := rParamContabeis.sContaContabilDebito;
               sCCustoC := '';
               sContaC  := '';
             end;
         1 : begin                    // Lançamento de Crédito
               bJunta   := True;
               sCCustoD := '';
               sContaD  := '';
               sCCustoC := rParamContabeis.sCentroCustoCredito;
               sContaC  := rParamContabeis.sContaContabilCredito;
             end;
         2 : begin                    // Lançamento em Partida Dobrada ( D/C )
               bJunta   := False;
               sCCustoD := rParamContabeis.sCentroCustoDebito;
               sContaD  := rParamContabeis.sContaContabilDebito;
               sCCustoC := rParamContabeis.sCentroCustoCredito;
               sContaC  := rParamContabeis.sContaContabilCredito;
             end;
      end;

      // Verifica segregação, caso imovel 100% de um plano, contabiliza no plano, senão, contabiliza em operações comuns
      if iIdPatroImovel > 0 then
           iIdPatro := iIdPatroImovel
      else iIdPatro := Modulo.iPatroGlobal;
      if iIdPlanoImovel > 0 then
           iIdPlanoPrev := iIdPlanoImovel
      else iIdPlanoPrev := Modulo.iPlanoPrevGlobal;

      // Converte Subcontas
      iSubContaD := 0;
      iSubContaC := 0;
      if rParamContabeis.sSubContaDebito <> '' then
        iSubContaD := StrToInt(rParamContabeis.sSubContaDebito);
      if rParamContabeis.sSubContaCredito <> '' then
        iSubContaC := StrToInt(rParamContabeis.sSubContaCredito);

      if not CtrlLancamento.InsereLancaContab ( sTipoLanc,
                                                Sistema.IdEmpresa,
                                                Sistema.IdModulo,
                                                IdUsuario, IntegraBack.Plano,
                                                rParamContabeis.iUnidNegoc,
                                                iSubContaD,
                                                iSubContaC,
                                                iIdPlanoPrev,
                                                iIdPatro,
                                                rParamContabeis.iPlanilha, 0,
                                                sDataLancamento,
                                                FormatFloat('#0', NumDoc),
                                                rParamContabeis.sHistoricoCtb,
                                                '',
                                                '',
                                                '',
                                                '',
                                                rParamContabeis.sTipCodigo,
                                                sCCustoD, sContaD,
                                                sCCustoC, sContaC, '',
                                                VlrLancto, bJunta, Sistema.UsaPlanoPatro,
                                                rParamContabeis.iIdSegregaCriter,
                                                -1) then begin

         // integração com contabilidade falhou; exibe a mensagem de erro correspondente
         Result.iCodErro  := -25;
         Result.sMensErro := CtrlLancamento.MessageInfo;
      end else begin
         if CtrlLancamento.RetornoPlnCodigo > 0 then
            rParamContabeis.iPlanilha := StrToInt(FloatToStr(CtrlLancamento.RetornoPlnCodigo));
      end;
   except
      on e:exception do begin
         if Result.sMensErro = '' then Result.sMensErro := e.Message
         else Result.sMensErro := Result.sMensErro + #13 + e.Message;
         Result.iCodErro := -26;
      end;
   end;
end;






function TfrmExecIntegraLancNovo.IntegraCaPCaR(var vParamContabeis: array of TParamContabeisMT): TMensErro;
var iRegistro: integer;
begin;
   Result.iCodErro := 0;

   try
      // fazer o lançamento do documento
      Result := FazerLancamentoCApCArDocum(vParamContabeis[0]);

      dtmLancImovel.qryLancImovel.First;
      iRegistro := 0;
      while (not dtmLancImovel.qryLancImovel.EOF) and (Result.iCodErro = 0) do begin

         // GRAVAR O CODIGO DO DOCUMENTO EM TODOS OS REGISTROS DO VETOR
         vParamContabeis[iRegistro].iCodDocumento := vParamContabeis[0].iCodDocumento;

         if Result.iCodErro = 0 then begin
            Result.iCodErro := FazerLancamentoCApCArRateio(vParamContabeis[iRegistro]).iCodErro;
         end;

         dtmLancImovel.qryLancImovel.Next;
         inc(iRegistro);
      end;

   except
      on e:exception do begin
         Result.iCodErro  := -34;
         Result.sMensErro := e.Message;
      end;
   end;
end;






function TfrmExecIntegraLancNovo.FazerLancamentoCApCArDocum(var rParamContabeis: TParamContabeisMT): TMensErro;
{ para cada grupo de lançamentos como o mesmo NODOCUMENTO
  criar um documento e um lanctodum }
var
   sPlano, sModulo, sDebCre, sDataLancamento, sDataVencimento, sHistComp, sOperacao: string;
   sSql             : String;
   iMoeda           : integer;
   fValorOM         : currency;
   iNumLancamento   : integer;
   iFormaPagto      : integer;
   iSubContaDebCred : integer;
   dDataEmissao     : TDateTime;
   dDataLimite      : TDateTime;
   sDataProgramada  : String;
begin
   Result.iCodErro := 0;

   try
      sPlano    := IntToStr(IntegraBack.Plano);
      sModulo   := IntToStr(Sistema.idModulo);
      sHistComp := Copy( Trim(dtmLancImovel.qryLancImovelDESCCUSTORECIMO.AsString) + ' - Comp: ' +
                              dtmLancImovel.qryLancImovelMESCOMPETENCIA.AsString + '/' +
                              dtmLancImovel.qryLancImovelANOCOMPETENCIA.AsString + ' - Contr: ' +
                              dtmLancImovel.qryLancImovelCONTRATO_EXTENSO.AsString , 1, 60);

      LimpaParametros(qryDadosCliente);
      with qryDadosCliente do
      begin
         ParamByName('IDPESSOA').AsInteger := dtmLancImovel.qryLancImovelIDFORCLI.AsInteger;
         Open;
      end;

      sDataVencimento := FormatDateTime('dd/mm/yyyy', dtmLancImovel.qryLancImovelDATAVENCIMENTO.AsDateTime);

      // Marchetti - Pendencia 20477
      // Verifica o parametro para a data programada do documento
      dDataLimite  := CalcDocumento.DataLimite(dtmLancImovel.qryLancImovelDATAVENCIMENTO.AsDateTime,
                                               qryDadosClienteIDCIDADES.AsInteger,
                                               qryDadosClienteIDPAIS.AsInteger,
                                               dtmLancImovel.qryLancImovelCONDIASTOLERANCIA.AsInteger,
                                               dtmLancImovel.qryLancImovelCONDIASREPASSE.AsInteger,
                                               qryDadosClienteCODESTADO.AsString,
                                               dtmLancImovel.qryLancImovelFLGTIPODIATOLERA.AsString,
                                               True, False, False);


      if ModuloImobiliario.AdminImob.FLGTIPODATAPROG = 'V' then
         sDataProgramada := sDataVencimento
      else
         sDataProgramada := FormatDateTime('dd/mm/yyyy', dDataLimite);

      // Vinicius - Pend 18803 - 09/03/2005 - Criada data de emissão do documento
      dDataEmissao    := dtmLancImovel.qryLancImovelDATAEMISSAO.AsDateTime;
      sDataLancamento := FormatDateTime('dd/mm/yyyy', dtmLancImovel.qryLancImovelDATALANCAMENTO.AsDateTime);

{  // Vinicius - 15/02/2005 - não utilizar data de lancto contabil no financeiro - locatário pode pagar antecipado
      if dtmLancImovel.qryLancImovelDATALANCAMENTO.AsDateTime < dtmLancImovel.qryLancImovelDATAVENCIMENTO.AsDateTime then begin
         sDataLancamento := FormatDateTime('dd/mm/yyyy', dtmLancImovel.qryLancImovelDATALANCAMENTO.AsDateTime);
         dDataEmissao    := dtmLancImovel.qryLancImovelDATALANCAMENTO.AsDateTime;
      end else begin
         sDataLancamento := FormatDateTime('dd/mm/yyyy', dtmLancImovel.qryLancImovelDATAVENCIMENTO.AsDateTime);
         dDataEmissao    := dtmLancImovel.qryLancImovelDATAVENCIMENTO.AsDateTime;
      end;
}


      if dtmLancImovel.qryLancImovelRECPAG.AsString = 'P' then sDebCre := 'C'
      else sDebCre := 'D';

      if dtmLancImovel.qryLancImovelFLGORIGEMLANC.AsString = 'V' then sOperacao := '12'  // previsão
      else sOperacao := '2';  // lançamento efetivo

      { O número do documento é gerado no lançamento original
        Documento.GetCodigo(qryAuxiliar); // gera o identificador incremental da tabela DOCUMENTO - deveria estar encapsulado, mas...
      }
      rParamContabeis.iCodDocumento := dtmLancImovel.qryLancImovelIDDOCUMENTO.AsInteger;

      // Observação do documento = Histórico contabilidade
      Documento.Obs             := rParamContabeis.sHistoricoCapCar;
      Documento.Referencia      := dtmLancImovel.qryLancImovelREFERENCIAAP.AsString;
      Documento.IdContaBancaria := dtmLancImovel.qryLancImovelIDCBANCARIA.AsInteger;

      // Recupera o Nr. da AP para os documentos alterados
      if dtmLancImovel.qryLancImovelNUMAPALT.AsInteger > 0 then
           Documento.NumApg := dtmLancImovel.qryLancImovelNUMAPALT.AsInteger
      else Documento.NumApg := 0;

      // Recupera o Nr. da Planilha gerada pelo CAF para associar ao documento (INVESTIMOB)
      if (Sistema.IdModulo = 54) and (rParamContabeis.iPlanilha <= 0) then begin
         sSql := 'SELECT PLNCODIGO FROM CAFOBRALANC WHERE IDLANCIMOVEL = ' +
                  dtmLancImovel.qryLancImovelIDLANCIMOVEL.AsString;
         FazQuery(dtmImobiliario.qryAux, sSql);
         if not dtmImobiliario.qryAux.FieldByName('PLNCODIGO').IsNull then begin
            rParamContabeis.iPlanilha := dtmImobiliario.qryAux.FieldByName('PLNCODIGO').AsInteger;
         end;
      end;

      // tratamento p/ Outra Moeda
      iMoeda   := dtmLancImovel.qryLancImovelCOD_MOEDA.AsInteger;
      fValorOM := qryDocumentoTOTAL_OM_LANC.asFloat;

      if ( (dtmLancImovel.qryLancImovelCOD_MOEDA.isNULL) or (dtmLancImovel.qryLancImovelCOD_MOEDA.AsInteger = Modulo.iMoedaCorrente) ) then begin
         iMoeda   := -1;
         fValorOM := 0;
      end;

      iFormaPagto := -1;
      if not(dtmLancImovel.qryLancImovelCODFORMA.IsNull) then iFormaPagto := dtmLancImovel.qryLancImovelCODFORMA.AsInteger;

      if iFormaPagto = -1 then
      begin
         LimpaParametros(qryFormaPagto);
         with qryFormaPagto do
         begin
            ParamByName('PCODPORTFORMA').AsInteger := dtmLancImovel.qryLancImovelCODPORTFORMA_LANC.AsInteger;
            Open;
            iFormaPagto := qryFormaPagtoCODFORMA.AsInteger;
         end;
      end;

      // tenta converter a subcontadebcred se não conseguir atribui -1
      if rParamContabeis.sSubContaDebCred = '' then
           iSubContaDebCred := -1
      else iSubContaDebCred := strtoint(rParamContabeis.sSubContaDebCred);

      Documento.Inserir(
         dtmImobiliario.qryAux,
         rParamContabeis.iCodDocumento,
         sModulo,
         sPlano,
         rParamContabeis.sContaDebCred,
         rParamContabeis.sCentroCustoDebCred,
         iMoeda {qryCAPCARCOD_MOEDA.AsInteger},
         rParamContabeis.iUnidNegoc,
         Sistema.idEmpresa,
         dtmLancImovel.qryLancImovelIDFORCLI.AsInteger,
         dtmLancImovel.qryLancImovelCODTIPDOC.AsInteger,
         dtmLancImovel.qryLancImovelCODPORTFORMA_LANC.AsInteger,
         dtmLancImovel.qryLancImovelRECPAG.AsString,
         dtmLancImovel.qryLancImovelNODOCUMENTO.AsFloat, '',
         FormatDateTime('dd/mm/yyyy', dDataEmissao) {DataEmissao},
         sDataVencimento,
         // Marchetti - Pendencia 20477
//         sDataVencimento{DataProgramada=DataVencimento}, ''{Status},
         sDataProgramada, ''{Status},
         0{NumFatura}, sOperacao, dtmLancImovel.qryLancImovelIDUSUARIOSISTEMA.AsInteger,
         iSubContaDebCred,
         iFormaPagto, '', '', False, -1, -1, -1);

      // operação '1' --> documento vai ser englobado / parcelado
      // operação '2' --> normal

      // gera o identificador incremental da tabela LANCAMENTO - deveria estar encapsulado, mas...
      iNumLancamento := Documento.GerarNumLancto(dtmImobiliario.qryAux, rParamContabeis.iCodDocumento);

      Documento.CriarLanctoDoc(
         dtmImobiliario.qryAux,
         rParamContabeis.iCodDocumento,
         iNumLancamento, -1{CodAlterador}, rParamContabeis.iPlanilha,
         sDataLancamento, qryDocumentoTOTAL_LANC.asFloat, fValorOM {qryDocumentoTOTAL_OM_LANC.asFloat},
         -1{Estorno}, sDebCre, sOperacao, sHistComp,
         dtmLancImovel.qryLancImovelIDUSUARIOSISTEMA.AsInteger, False{bContabiliza}, -1, '');

   except
      on e:exception do begin
         // -31 Não conseguiu criar o documento e o LanctoDocum
         Result.iCodErro  := -31;
         Result.sMensErro := e.Message;
         Repaint;
      end;
   end;
end;







function TfrmExecIntegraLancNovo.FazerLancamentoCApCArRateio(var rParamContabeis: TParamContabeisMT):TMensErro;
{ para cada documento e lanctodocum gerar criar o rateio }
const AP = '''';
var
   sUpdRateio, sDataLancamento, sCentroCusto: string;
   fValorOM : currency;
   iIdPatro, iIdPlanoPrev: Integer;
   iRateio : double;
begin
   Result.iCodErro := 0;

   try

      // Verifica segregação, caso imovel 100% de um plano, contabiliza no plano, senão, contabiliza em operações comuns
      if dtmLancImovel.qryLancImovelIDPATRO.AsInteger > 0 then
           iIdPatro := dtmLancImovel.qryLancImovelIDPATRO.AsInteger
      else iIdPatro := Modulo.iPatroGlobal;
      if dtmLancImovel.qryLancImovelIDPLANOPREV.AsInteger > 0 then
           iIdPlanoPrev := dtmLancImovel.qryLancImovelIDPLANOPREV.AsInteger
      else iIdPlanoPrev := Modulo.iPlanoPrevGlobal;

      fValorOM := dtmLancImovel.qryLancImovelVALOR_OM_LANC.AsFloat;
      if ( (dtmLancImovel.qryLancImovelVALOR_OM_LANC.isNULL) or (dtmLancImovel.qryLancImovelCOD_MOEDA.asInteger = Modulo.iMoedaCorrente) ) then begin
         fValorOM := 0;
      end;

      sCentroCusto := dtmLancImovel.qryLancImovelCODCENTROCUSTO.asString;
      if length(trim(sCentroCusto)) = 0 then sCentroCusto := Modulo.sCentroCusto;

      iRateio := Documento.Rateio.Inserir(rParamContabeis.iCodDocumento,
                                                                 rParamContabeis.sCodTipRecDes,
                                                                 dtmLancImovel.qryLancImovelRECPAG.AsString,
                                                                 rParamContabeis.sCodCentroRespon,
                                                                 Sistema.IdEmpresa,
                                                                 dtmLancImovel.qryLancImovelVALOR_LANC.AsFloat,
                                                                 fValorOM {dtmLancImovel.qryLancImovelVALOR_OM_LANC.AsFloat},
                                                                 dtmLancImovel.qryLancImovelIDUSUARIOSISTEMA.AsInteger,
                                                                 rParamContabeis.iUnidNegoc,
                                                                 dtmLancImovel.qryLancImovelIDRESERVAORCAMEN.AsInteger {16/02/2001 Orçamento },
                                                                 sCentroCusto,
                                                                 StrToFloat(IntToStr(iIdPatro)),
                                                                 StrToFloat(IntToStr(Modulo.iPrograma)),
                                                                 StrToFloat(IntToStr(iIdPlanoPrev)) );

      rParamContabeis.iIdRateioDocum := StrToInt(FloatToStr(iRateio));

      // mudanças feitas por Alex em 16/02/2001
      Documento.GravaValorCompromisso(trunc(rParamContabeis.iIdRateioDocum), dtmLancImovel.qryLancImovelVALOR_LANC.AsFloat);

      //informar o número do imóvel no lancamento
      if (not dtmLancImovel.qryLancImovelIMOCODIGO.IsNull) then begin
         sUpdRateio := 'UPDATE RATEIODOCUM SET ';
         sUpdRateio := sUpdRateio + ' NUMIMOVEL = ''' + dtmLancImovel.qryLancImovelIMOCODIGO.AsString + ''' ';
         sUpdRateio := sUpdRateio + ' WHERE IDRATEIODOCUM = ' + FloatToStr(rParamContabeis.iIdRateioDocum);
         if not ExecutarQuery(dtmImobiliario.qryAux, sUpdRateio) then Result.iCodErro := -33;
      end;
   except
      on e:exception do begin
         // -32 Não conseguiu criar o rateio docum
         Result.iCodErro  := -32;
         Result.sMensErro := e.Message;
      end;
   end;
end;





procedure TfrmExecIntegraLancNovo.RegistraErro(const iDocumento: integer; const CodErro: TMensErro);
begin

   // Grava erro em TODOS os lançamentos com o idDocumento (André)
   StartTransacao;
   try
      with qryRegistraErro do begin
         LimpaParametros(qryRegistraErro);
         ParamByName('PIDDOCUMENTO').asInteger   := iDocumento;
         ParamByName('PFLGERRO').asInteger       := CodErro.iCodErro;
         ParamByName('PMSGERROINTEGRA').AsString := CodErro.sMensErro;
         ExecSQL;
      end;
      CommitTransacao;
   except
      try
         with qryRegistraErro do begin
            LimpaParametros(qryRegistraErro);
            ParamByName('PIDDOCUMENTO').asInteger := iDocumento;
            ParamByName('PFLGERRO').asInteger     := CodErro.iCodErro;
            ExecSQL;
         end;
         CommitTransacao;
         MsgDlg('Não foi possível gravar a mensagem do erro ocorrido: ' +#13+
                CodErro.sMensErro, 'Erro', mtError, [mbOk], 0);
      except
         RollBackTransacao;
      end;
   end;
end;



function TfrmExecIntegraLancNovo.IntegraAlterador: TMensErro;
var
   iDocumento, iNumLancto, iPlanilha: integer;
   sDataLancamento: string;
begin
      Result.iCodErro := 0;

      sDataLancamento := DateToStr(dtmLancImovel.qryLancImovelDATALANCAMENTO.AsDateTime);

      iDocumento  := dtmLancImovel.qryLancImovelIDDOCUMENTO.AsInteger;

      LimpaParametros(qryAlterador);
      qryAlterador.ParamByName('PIDDOCUMENTO').AsInteger := iDocumento;
      qryAlterador.Open;
      while (not qryAlterador.Eof) and (Result.iCodErro = 0) do begin
         try
            iNumLancto  := Documento.GerarNumLancto(dtmImobiliario.qryAux, iDocumento);
            iPlanilha   := 0;


            Documento.CriarLanctoDoc(dtmImobiliario.qryAux, iDocumento, iNumLancto,
                           qryAlteradorCODALTERADOR.AsInteger,
                           iPlanilha,
                           sDataLancamento,
                           qryAlteradorVLRALTERADOR.AsFloat,
                           0{valor OM}, -1{estorno},
                           qryAlteradorACRESDECRES.AsString,
                           '4'{alterador},
                           qryAlteradorDESCRICAO.AsString,
                           dtmLancImovel.qryLancImovelIDUSUARIOSISTEMA.AsInteger,
                           True{contabiliza}, -1{portador-forma}, ''{nº cheque/borderô});

            qryAlterador.Next;
         except
            on e:exception do begin
               Result.iCodErro  := -85;
               Result.sMensErro := e.Message;
            end;
         end;
      end;

end;






procedure TfrmExecIntegraLancNovo.FormShow(Sender: TObject);
begin
   inherited;

   cboMesCompetencia.ItemIndex := DiasInUteis.ExtraiMes(date)-1;
   DBspnAnoCompetencia.Value   := DiasInUteis.ExtraiAno(date);

   AtribuiMolUsuario(MolUsuario1.iUsuario,MolUsuario1.edtUsuario);
   molContrato1.iContrato := -1;

   LimpaParametros(dtmLookImobiliario.qryLookTipoRecDes);
   dtmLookImobiliario.qryLookTipoRecDes.ParamByName('PIDMODULO').AsInteger := Sistema.idModulo;
   dtmLookImobiliario.qryLookTipoRecDes.Open;
   ntbPrincipal.PageIndex := 0;

   chkExibeDetalhes.OnClick(self);

end;



procedure TfrmExecIntegraLancNovo.qryDocumentoCalcFields(DataSet: TDataSet);
begin
   inherited;
   qryDocumento_ORIGEMLANC.AsString := OrigemLancamento(qryDocumentoFLGORIGEMLANC.asString[1]);
   qryDocumento_DESCERRO.AsString   := DescricaoErro(qryDocumentoFLGERRO.AsInteger);

   if qryDocumentoRECPAG.AsString = 'R' then qryDocumento_RECPAG.AsString := 'Receita'
   else qryDocumento_RECPAG.AsString := 'Despesa'

end;



procedure TfrmExecIntegraLancNovo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
   qryDocumento.Close;
   qryLancamentos.Close;
   qryAlterador.Close;
   dtmLookImobiliario.qryLookTipoRecDes.Close;
   dtmLancImovel.qryLancImovel.Close;
end;

procedure TfrmExecIntegraLancNovo.DBcboTipoRecDesKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   inherited;
   if key = vk_delete then DBcboTipoRecDes.Clear;
end;

procedure TfrmExecIntegraLancNovo.IntegraLancamentos;
var
   iAtual, iQuant, i : integer;
   vParamContabeis   : array of TParamContabeisMT;    // Primeira Contabilização
   vParamOperContab  : array of TParamContabeisMT;    // Segunda Operação Contábil
   CodErro           : TMensErro;
   bSegundaOperacao  : Boolean;
begin

//   DesabilitaBotoes;

//   try

      // 21/03/02 revisão QryDocumento ja aberta anteriormente
      // AbrirQryDocumento;

      if qryDocumento.IsEmpty then begin
         MsgDlg('Não há lançamentos a integrar.', 'Aviso', mtWarning, [mbok], 0);
         Exit;
      end else qryDocumento.First;

      iQuant := qryDocumento.RecordCount;
      frmProgresso.MostraFormProgresso('Integrando Lançamentos...', True, True);
      Application.ProcessMessages;

      // desabilita os controles para o usuário ver sempre a grid preenchida
      qryDocumento.DisableControls;
      qryLancamentos.DisableControls;

      // Fecha a query e limpa os parametros
      iAtual := 1;

      while not(qryDocumento.EOF) do begin

         frmProgresso.AndaFormProgresso(iAtual, iQuant);
         Application.ProcessMessages;
         if frmProgresso.Cancelou then break;  // sai do processamento

         // Marchetti - 06/01/2006
         // Colocado o IF abaixo para utilizar a rotina de Integração em 3 camadas
         // o restante está comentado porque todo o processo esta na CtrlLancamentosImovel

         // Falta alterar na rotina o processo de segunda operação

         //zerar a variável de código de erro
         CodErro.iCodErro  := 0;
         CodErro.sMensErro := '';

         if not CtrlLancamentosImovel.Integrar(qryDocumentoIDDOCUMENTO.AsInteger) then
         begin
            CodErro.iCodErro  := CtrlLancamentosImovel.CodigoErroLiberacao;
            CodErro.sMensErro := CtrlLancamentosImovel.MessageInfo;
            RegistraErro(qryDocumentoIDDOCUMENTO.AsInteger, CodErro);
         end;

(*

         // para cada documento setar o conjunto de lançamentos para ele
         with dtmLancImovel.qryLancImovel do begin
            LimpaParametros(dtmLancImovel.qryLancImovel);
            ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
            ParamByName('PFLGINTEGRADO').AsInteger := 0;

            if qryDocumentoNODOCUMENTO.IsNull then begin
               { indica que o documento é nulo para a query pegá-lo
                 Situação de erro. A query somente é aberta para gravar o erro }
               ParamByName('PNODOCNULL').AsInteger := 1
            end else begin
               ParamByName('PIDDOCUMENTO').AsFloat := qryDocumentoIDDOCUMENTO.AsFloat;
            end;

            Open;
         end;

         // Determina a existência de uma segunda operação contabil
         bSegundaOperacao := (not dtmLancImovel.qryLancImovel.FieldByName('IDOPERCONTAB').IsNull);

         // determinar o tamanho do vetor de parâmetros
         SetLength(vParamContabeis,  dtmLancImovel.qryLancImovel.RecordCount);
         SetLength(vParamOperContab, dtmLancImovel.qryLancImovel.RecordCount);
         //zerar a variável de código de erro
         CodErro.iCodErro  := 0;
         CodErro.sMensErro := '';

         StartTransacao;
         try

            ZeraParamContabeis (vParamContabeis);  // zerar record de parametrização
            if bSegundaOperacao then begin
               ZeraParamContabeis (vParamOperContab); // zerar record de parametrização para segunda operação contábil
            end;

            { o INVESTIMOB não possui funcoes de contabilização as mesmas são feitas pelo CAF }
            //if Sistema.IdModulo = 64 then
            CodErro.iCodErro := BuscaParametrizacao(vParamContabeis, False);

            if bSegundaOperacao then begin
//               if (CodErro.iCodErro = 0) and (vParamContabeis[0].iFlgIntegraContab = 1) then begin
               if (CodErro.iCodErro = 0) and (vParamContabeis[0].bFlgIntegraContab) then begin
                  CodErro.iCodErro := BuscaParametrizacao(vParamOperContab, True);
               end;
            end;

            { pode perguntar pelo primeiro registro pois a funcao
              BuscaParametrizacao checa se todos os registros são iguais }

            // Verificações APENAS para o ADMINIMOB
            if Sistema.IdModulo = 64 then begin

               // é necessário que o lançamento seja contabilizado ou integrado ao financeiro
//               if (CodErro.iCodErro = 0) and ((vParamContabeis[0].iFlgIntegraCapCar = 0) and (vParamContabeis[0].iFlgIntegraContab = 0)) then begin
               if (CodErro.iCodErro = 0) and ((not vParamContabeis[0].bFlgIntegraCapCar) and (not vParamContabeis[0].bFlgIntegraContab)) then begin
                  CodErro.iCodErro := -50;
               end;

               // verificar se o responsável pela despesa é o locatário
               if CodErro.iCodErro = 0 then begin
                  CodErro.iCodErro := ResponsavelDespesa;
               end;

               // verificar se o lançamento obriga a liberação
               if CodErro.iCodErro = 0 then begin
                  CodErro.iCodErro := ObrigaLiberacao;
               end;

               // integrar com o orçamento
               if CodErro.iCodErro = 0 then begin
                  if ModuloImobiliario.AdminImob.bFlgIntegraOrcamen then begin
                     CodErro := IntegraOrcamento;
                  end;
               end;
            end;

            // prepara os históricos para contabilização
            if CodErro.iCodErro = 0 then begin
               if ParamIntegra.PartidaDobrada then
                    CodErro := IntegraContabilidadePD(vParamContabeis,vParamOperContab)
               else CodErro := IntegraContabilidade  (vParamContabeis,vParamOperContab);
            end;

//            if vParamContabeis[0].iFlgIntegraCapCar = 1 then begin
            if vParamContabeis[0].bFlgIntegraCapCar then begin

               if (CodErro.iCodErro = 0) then CodErro := IntegraCaPCaR(vParamContabeis);

               if (CodErro.iCodErro = 0) then CodErro := SetMensagem(vParamContabeis[0].iCodDocumento);

            end;

            if (CodErro.iCodErro = 0) then begin
               CodErro := IntegraAlterador;
            end;

         except
            on e:exception do begin
               CodErro.iCodErro := -40;
               if CodErro.sMensErro = '' then CodErro.sMensErro := e.Message
               else CodErro.sMensErro := CodErro.sMensErro + #13 + e.Message;
            end;
         end;

         if (CodErro.iCodErro = 0) then begin

            // gravar informações de documentos integrados
            dtmLancImovel.qryLancImovel.First;
            while not dtmLancImovel.qryLancImovel.Eof do begin
               dtmLancImovel.qryLancImovel.Edit;
               if vParamContabeis[0].iPlanilha > 0 then
                  dtmLancImovel.qryLancImovelPLNCODIGO.AsInteger    := vParamContabeis[0].iPlanilha;
               if vParamContabeis[0].iCodDocumento > 0 then
                  dtmLancImovel.qryLancImovelCODDOCUMENTO.AsInteger := vParamContabeis[0].iCodDocumento;
               dtmLancImovel.qryLancImovelFLGINTEGRADO.Clear;
               dtmLancImovel.qryLancImovelNUMAPALT.Clear;

               // O lançamento anteriormente pode ter dado erro.
               dtmLancImovel.qryLancImovelFLGERRO.Clear;
               dtmLancImovel.qryLancImovelMSGERROINTEGRA.Clear;
               dtmLancImovel.qryLancImovel.Post;

               dtmLancImovel.qryLancImovel.Next;
            end;

            dtmLancImovel.qryLancImovel.ApplyUpdates;
            CommitTransacao;
         end else begin
            dtmLancImovel.qryLancImovel.CancelUpdates;
            RollBackTransacao;
            RegistraErro(qryDocumentoIDDOCUMENTO.AsInteger, CodErro);
         end;
*)
         iAtual := iAtual + 1;
         qryDocumento.Next;
      end;

//   finally
      qryDocumento.EnableControls;
      qryLancamentos.EnableControls;
      frmProgresso.EscondeFormProgresso;

      MsgDlg('Processamento concluído.', 'Informação', mtInformation, [mbok], 0);
      dtmLancImovel.qryLancImovel.Close;
//   end;
end;



procedure TfrmExecIntegraLancNovo.ntbPrincipalPageChanged(Sender: TObject);
begin
   inherited;

   case ntbPrincipal.PageIndex of
      0: lblTitulo.Caption := 'Integração de Lançamentos [Seleção]';
      1: lblTitulo.Caption := 'Integração de Lançamentos [Lancamentos]';
   else
      lblTitulo.Caption := 'Integração de Lançamentos [não Integrados]';
   end;
end;

procedure TfrmExecIntegraLancNovo.LiberaLanamento1Click(Sender: TObject);
begin
   inherited;
   if CalcDocumento.LiberaLanc(qryDocumentoFLGERRO.AsInteger,
                               qryDocumentoIDDOCUMENTO.AsInteger,
                               Sistema.IdUsuario) then begin
      qryDocumento.Close;
      qryDocumento.Open;
   end;
end;

procedure TfrmExecIntegraLancNovo.ZeraParamContabeis(var vParamContabeis: array of TParamContabeisMT);
var i: integer;
begin
   // zerar todos os dados do parâmetro contábil / capcar para cada lançamento
   for i := 0 to Length(vParamContabeis)-1 do begin
      with vParamContabeis[i] do begin
         sContaContabilDebito  := '';
         sSubContaDebito       := '';
         sCentroCustoDebito    := '';
         sContaContabilCredito := '';
         sSubContaCredito      := '';
         sCentroCustoCredito   := '';
         sHistoricoCtb         := '';
         sHistoricoCapCar      := '';
         iPlanilha             := 0;
         iExercicio            := 0;
         iPeriodo              := 0;
         iIdRateioDocum        := 0;
         iCodDocumento         := 0;
         iIdSegregaCriter      := -1;
      end;
   end;
end;

procedure TfrmExecIntegraLancNovo.AtribuiContaAtivoPassivo(var rParamContabeis: TParamContabeisMT);
var
   i: integer;
   bNovaQuery: Boolean;
begin
   // SE A CONTA DE ATIVO / PASSIVO ESTIVER EM BRANCO BUSCAR DO CLIENTE / FORNECEDOR

   if rParamContabeis.sContaDebCred <> '' then exit;

   if dtmLancImovel.qryLancImovelRECPAG.AsString = 'R' then begin   // clientes
      bNovaQuery := false;

      if not qryBuscaCtaCli.Active then bNovaQuery := true   // se a query esta fechada abri-la
      // se a query esta aberta, mas o idforcli é diferente da mesma - abri-la
      else if qryBuscaCtaCliIDFORCLI.AsInteger <> dtmLancImovel.qryLancImovelIDFORCLI.AsInteger then bNovaQuery := true;

      if bNovaQuery then begin    // para otimização, somente abrir a query uma vez por fornecedor
         LimpaParametros(qryBuscaCtaCli);
         qryBuscaCtaCli.ParamByName('PIDFORCLI').AsInteger := dtmLancImovel.qryLancImovelIDFORCLI.AsInteger;
         qryBuscaCtaCli.Open;
      end;

      rParamContabeis.sContaDebCred        := qryBuscaCtaCliCONTACCLIENTE.AsString;
      rParamContabeis.sContaContabilDebito := qryBuscaCtaCliCONTACCLIENTE.AsString;
      rParamContabeis.sSubContaDebCred     := qryBuscaCtaCliCODSUBCONTA.AsString;
      rParamContabeis.sSubContaDebito      := qryBuscaCtaCliCODSUBCONTA.AsString;
      rParamContabeis.sCentroCustoDebCred  := qryBuscaCtaCliCODCENTROCUSTO.AsString;
      rParamContabeis.sCentroCustoDebito   := qryBuscaCtaCliCODCENTROCUSTO.AsString;

   end else begin                                                    // fornecedores
      bNovaQuery := false;

      if not qryBuscaCtaFor.Active then bNovaQuery := true   // se a query esta fechada abri-la
      // se a query esta aberta, mas o idforcli é diferente da mesma - abri-la
      else if qryBuscaCtaForIDFORCLI.AsInteger <> dtmLancImovel.qryLancImovelIDFORCLI.AsInteger then bNovaQuery := true;

      if bNovaQuery then begin    // para otimização, somente abrir a query uma vez por fornecedor
         LimpaParametros(qryBuscaCtaFor);
         qryBuscaCtaFor.ParamByName('PIDFORCLI').AsInteger := dtmLancImovel.qryLancImovelIDFORCLI.AsInteger;
         qryBuscaCtaFor.Open;
      end;

      rParamContabeis.sContaDebCred         := qryBuscaCtaForCONTACFORN.AsString;
      rParamContabeis.sContaContabilCredito := qryBuscaCtaForCONTACFORN.AsString;
      rParamContabeis.sSubContaDebCred      := qryBuscaCtaForCODSUBCONTA.AsString;
      rParamContabeis.sSubContaCredito      := qryBuscaCtaForCODSUBCONTA.AsString;
      rParamContabeis.sCentroCustoDebCred   := qryBuscaCtaForCODCENTROCUSTO.AsString;
      rParamContabeis.sCentroCustoCredito   := qryBuscaCtaForCODCENTROCUSTO.AsString;

   end;
end;

procedure TfrmExecIntegraLancNovo.chkExibeDetalhesClick(Sender: TObject);
begin
   inherited;
   panDetalhes.Visible := chkExibeDetalhes.Checked;
   grdDetalhes.Visible := chkExibeDetalhes.Checked;
   panDetalhesNao.Visible := chkExibeDetalhes.Checked;
   grdDetalhesNao.Visible := chkExibeDetalhes.Checked;

   if chkExibeDetalhes.Checked then begin
      grdLancamentos.Height := 96;
      grdLancamentosNao.Height := 92;
      qryLancamentos.DataSource := dsDocumento;
   end else begin
      grdLancamentos.Height := 312;
      grdLancamentosNao.Height := 239;
      qryLancamentos.DataSource := nil;
   end;
   Refresh;
end;

procedure TfrmExecIntegraLancNovo.btnContinuarClick(Sender: TObject);
begin
   inherited;
   if ntbPrincipal.PageIndex = 0 then begin   // seleção
      AbrirQryDocumento;
      ntbPrincipal.PageIndex := 1;

      btnVoltar.Enabled := true;
      btnContinuar.Enabled := false;
      if qryDocumento.IsEmpty then begin
         btnConfirmar.Enabled := False;
      end else begin
         btnConfirmar.Enabled := true;
      end;
   end;

end;

procedure TfrmExecIntegraLancNovo.btnVoltarClick(Sender: TObject);
begin
   inherited;
   qryDocumento.Close;
   qryLancamentos.Close;
   qryAlterador.Close;
   dtmLancImovel.qryLancImovel.Close;
   
   ntbPrincipal.PageIndex := 0;
   btnContinuar.Enabled   := true;
   btnVoltar.Enabled      := false;
   btnConfirmar.Enabled   := false;
end;

procedure TfrmExecIntegraLancNovo.btnConfirmarClick(Sender: TObject);
begin
  inherited;
   if ntbPrincipal.PageIndex = 1 then begin
      // abrir os parametros do sistema
      ParametrosSistema;
      try
         IntegraLancamentos;
      finally
         Refresh;
         AbrirQryDocumento;
         ntbPrincipal.PageIndex := ntbPrincipal.PageIndex + 1;

         btnVoltar.Enabled := true;
         btnContinuar.Enabled := false;
         btnConfirmar.Enabled := false;
      end;
   end;
end;




procedure TfrmExecIntegraLancNovo.FormCreate(Sender: TObject);
begin
  inherited;
  // Inicializa CtrlObjects
  CtrlLancamento := TCtrlLancamento.Create;
  CtrlLancamento.Initialize( dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                              Sistema.ConnectionSide, Sistema.AppRemoteServer, true );

  CtrlPadrLancImovel  := TCtrlPadrLancIMovel.Create(Sistema.IdEmpresa, Sistema.IdModulo);
  CtrlPadrLancImovel.InitializeAs(CtrlLancamento);

  CtrlLancamentosImovel := TCtrlLancamentosImovel.Create(Sistema.IDEmpresa,Sistema.IDModulo, Sistema.IdUsuario,SisTema.IDEspAcesso,Sistema.UsaPlanoPatro);
  CtrlLancamentosImovel.InitializeAs(CtrlLancamento);

end;



procedure TfrmExecIntegraLancNovo.FormDestroy(Sender: TObject);
begin
  FreeAndNil( CtrlLancamento );
  FreeAndNil( CtrlPadrLancImovel );
  FreeAndNil( CtrlLancamentosImovel );
  inherited;
end;



end.
