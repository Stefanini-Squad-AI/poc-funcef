{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 172902
Nº KINTANA..: 1577381
Data........: 14/03/2012
Responsável.: Helen V. Bianchi
Descrição...: Não deixar fazer lançamentos com Período contabil Bloqueado
--------------------------------------------------------------------------------
Rotina......: IntegraLancamentos
Nº SOL......: 156117
Nº KINTANA..: 1225296
Data........: 08/04/2011
Responsável.: Helen V. Bianchi
Descrição...: Add Verificação válida apenas para Aquisição Parcelada ,
              na qryDocumento Add o Field IDTIPOCUSTORECIMO
--------------------------------------------------------------------------------
Rotina......: Add no Menu
Nº SOL......: 127213
Nº KINTANA..: 672023
Data........: 03/01/2011
Responsável.: Helen V. Bianchi
Descrição...: Add o Item Aquisição Parcelada(B), no comp. cboOrigemLanc
--------------------------------------------------------------------------------
Pendência   : 24872
Responsável : Daniel Simões
Data        : 16/08/2007
Descrição   : Mudança na Origem do Lançamento de 'Lançamento Individual' para
              'Lançamentos em Lote' ...
-------------------------------------------------------------------------------}

unit FExecIntegraLancNovo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjudaImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, fcButton, fcImgBtn,
  fcShapeBtn, ComCtrls, fcLabel, TREdit, Mask, wwdbedit, Wwdbspin,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, mResponsavel, mUsuario,
  mContrato, Db, Wwdatsrc, DBTables, Wwquery, wwriched, Wwdotdot, Wwdbcomb, uCtrlLancamentosImovel,
  mOrigemLanc, uFuncoesImob, Menus, uCtrlLancamento, uCtrlPadrLancImovel, uCtrlParamIntegra,
  // Helen - SOL: 172902 KTN: 1577381
  uCtrlContab;

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
    qryDocumentoIDTIPOCUSTORECIMO: TFloatField;

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
    //Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
    procedure molContrato1btnBuscaContratoClick(Sender: TObject);


  private { Private declarations }

    CtrlLancamento : TCtrlLancamento;
    CtrlPadrLancImovel  : TCtrlPadrLancImovel;
    CtrlLancamentosImovel : TCtrlLancamentosImovel;
    CtrlContab  : TCtrlContab; // Helen - SOL: 172902 KTN: 1577381

    procedure AbrirQryDocumento;
    procedure IntegraLancamentos;

    procedure RegistraErro(const iDocumento: integer; const CodErro: TMensErro);

  public { Public declarations }

  end;


var
  frmExecIntegraLancNovo: TfrmExecIntegraLancNovo;

implementation
{$R *.DFM}

uses
   uDiasInUteis, uSistema, uMolduras, dLookImobiliario, dImobiliario, uDocumento,
   uDatabase, uMensErro, uOrcamento, uLancContab, uFuncaoGeral, uIntegraBack,
   uModuloAdminImob, uModuloInvestImob, dBaseDados, dLancImovel, uCalcDocumento, fProgresso, uModuloImobiliario;


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
   if chkExibeDetalhes.Checked then
     qryLancamentos.Open;

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
   // Helen - SOL: 127213 KTN: 672023
   dDataVenc : TDateTime;dDataPriVenc :String;
begin
      if qryDocumento.IsEmpty then begin
         MsgDlg('Não há lançamentos a integrar.', 'Aviso', mtWarning, [mbok], 0);
         Exit;
      end else qryDocumento.First;
      // Helen - SOL: 172902 KTN: 1577381 - Inicio
      while not(qryDocumento.EOF) do
      begin
           if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,qryDocumentoDATAVENCIMENTO.Text) then
           begin
              MsgDlg ('Período bloqueado pela Contabilidade - Data Vencimento','Aviso',mtWarning,[mbok],0);
              CodErro.iCodErro := -22;
              CodErro.sMensErro := 'Existem Lançamentos com o Período bloqueado pela Contabilidade - Data Vencimento.';
              RegistraErro(qryDocumentoIDDOCUMENTO.AsInteger, CodErro);
              exit;
           end;
           if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,qryDocumentoDATALANCAMENTO.Text) then
           begin
              MsgDlg ('Período bloqueado pela Contabilidade - Data Lançamento','Aviso',mtWarning,[mbok],0);
              CodErro.iCodErro := -22;
              CodErro.sMensErro := 'Existem Lançamentos com o Período bloqueado pela Contabilidade - Data Lançamento.';
              RegistraErro(qryDocumentoIDDOCUMENTO.AsInteger, CodErro);
              exit;
           end;
           qryDocumento.next;
      end;
      qryDocumento.First;
      // Helen - SOL: 172902 KTN: 1577381 - Fim


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

         //zerar a variável de código de erro
         CodErro.iCodErro  := 0;
         CodErro.sMensErro := '';
         // Helen - SOL: 156117 KTN: 1225296
         if qryDocumentoIDTIPOCUSTORECIMO.asInteger = 235 then
         begin
             // Helen - SOL: 127213 KTN: 672023
             dDataVenc := DiasUteis.UltDiaMes( StrToInt(copy(DateToStr(now),7,4)),
                                             StrToInt(copy(DateToStr(now ),4,2))
                                            );
             dDataPriVenc := ('01' + '/' +
                                       (copy(DateToStr(now),4,2)) + '/' +
                                       (copy(DateToStr(now ),7,4)) );

             if (qryDocumentoDATAVENCIMENTO.value > dDataVenc) or
                (qryDocumentoDATAVENCIMENTO.value < StrToDate(dDataPriVenc)) then
             begin
                 CodErro.iCodErro  := -51;
                 CodErro.sMensErro := CtrlLancamentosImovel.MessageInfo;
                 RegistraErro(qryDocumentoIDDOCUMENTO.AsInteger, CodErro);
             end;
         end;

         // Helen - SOL: 156117 KTN: 1225296 - FIM 
         if not (CodErro.iCodErro = -51) then
         begin
         // Helen - SOL: 127213 KTN: 672023 - FIM
             if not CtrlLancamentosImovel.Integrar(qryDocumentoIDDOCUMENTO.AsInteger) then
             begin
                CodErro.iCodErro  := CtrlLancamentosImovel.CodigoErroLiberacao;
                CodErro.sMensErro := CtrlLancamentosImovel.MessageInfo;
                RegistraErro(qryDocumentoIDDOCUMENTO.AsInteger, CodErro);
             end;
         end;

         iAtual := iAtual + 1;
         qryDocumento.Next;
      end;

      qryDocumento.EnableControls;
      qryLancamentos.EnableControls;
      frmProgresso.EscondeFormProgresso;

      MsgDlg('Processamento concluído.', 'Informação', mtInformation, [mbok], 0);
      dtmLancImovel.qryLancImovel.Close;
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
  // Helen - SOL: 172902 KTN: 1577381
  CtrlContab     := TCtrlContab.Create;
  CtrlContab.InitializeAs(CtrlLancamento);
end;



procedure TfrmExecIntegraLancNovo.FormDestroy(Sender: TObject);
begin
  FreeAndNil( CtrlLancamento );
  FreeAndNil( CtrlPadrLancImovel );
  FreeAndNil( CtrlLancamentosImovel );
  FreeAndNil(CtrlContab);// Helen - SOL: 172902 KTN: 1577381
  inherited;
end;


//Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
procedure TfrmExecIntegraLancNovo.molContrato1btnBuscaContratoClick(
  Sender: TObject);
begin
  inherited;
  molContrato1.btnBuscaContratoClick(Sender);

end;

end.
