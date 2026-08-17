unit fExecCalculoDivergencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, mContrato, Db, DBClient,
  uCMClientDataSet, mImovelouMestre, uCtrlInadimplencia, uCtrlContratoImovel,
  uCtrlEventoImovel, Grids, Wwdbigrd, Wwdbgrid, JclSysUtils, fProgresso;

type
  TfrmExecCalculoDivergencia = class(TfrmWizardMT)
    molContrato: TmolContrato;
    GroupBox1: TGroupBox;
    edtDataIni: TCMDateTimePicker;
    edtDataFim: TCMDateTimePicker;
    Label1: TLabel;
    molImovelouMestre: TmolImovelouMestre;
    cdsContratos: TCMClientDataSet;
    cdsContratosCONNUMERO: TStringField;
    cdsContratosCONNOME: TStringField;
    cdsContratosLOCATARIO: TStringField;
    cdsContratosCONDATAINICIO: TDateTimeField;
    cdsContratosCONDATAFIM: TDateTimeField;
    cdsContratosDSCTIPOCONTRATO: TStringField;
    cdsContratosIDCONTRATOIMOVEL: TFloatField;
    cdsContratosIDLOCATARIO: TFloatField;
    cdsContratosFLGTIPOCONTRATO: TStringField;
    cdsContratosCONVLRMULTA: TFloatField;
    cdsContratosCONPERCENTMULTA: TFloatField;
    cdsContratosCONMOEDAMULTA: TFloatField;
    cdsContratosCONVLRMORA: TFloatField;
    cdsContratosCONPERCENTMORA: TFloatField;
    cdsContratosCONMOEDAMORA: TFloatField;
    cdsContratosCONDIASTOLERANCIA: TFloatField;
    cdsContratosCONDIASREPASSE: TFloatField;
    cdsContratosIDINDCORRECAO: TFloatField;
    cdsContratosFLGMORAPROPORC: TFloatField;
    cdsContratosIDCIDADES: TFloatField;
    cdsContratosIDPAIS: TFloatField;
    cdsContratosCONPERMORA: TStringField;
    cdsContratosCODESTADO: TStringField;
    cdsContratosCONMESREFREAJUSTE: TStringField;
    cdsContratosFLGTIPODIATOLERA: TStringField;
    dtsContratos: TDataSource;
    cdsDocumentos: TCMClientDataSet;
    cdsDocumentosNODOCUMENTO: TFloatField;
    cdsDocumentosDESCCUSTORECIMO: TStringField;
    cdsDocumentosCOMPETENCIA: TStringField;
    cdsDocumentosDATAVENCTO: TDateTimeField;
    cdsDocumentosDATALIMITE: TDateTimeField;
    cdsDocumentosVALOR_ORIGINAL: TFloatField;
    cdsDocumentosDIAS_ATRASO: TFloatField;
    cdsDocumentosCORRECMONET: TFloatField;
    cdsDocumentosMULTA: TFloatField;
    cdsDocumentosJUROS: TFloatField;
    cdsDocumentosVALORATUAL: TFloatField;
    cdsDocumentosDATAPAGTO: TDateTimeField;
    cdsDocumentosVALOR_RECEBIDO: TFloatField;
    cdsDocumentosPROPORCAO: TFloatField;
    cdsDocumentosVALORDIVERG: TFloatField;
    cdsDocumentosCORRECMONETDIF: TFloatField;
    cdsDocumentosJUROSDIF: TFloatField;
    cdsDocumentosMULTADIF: TFloatField;
    cdsDocumentosVALORDIVERGATUAL: TFloatField;
    cdsDocumentosDATACALCULO: TDateTimeField;
    cdsDocumentosCODDOCUMENTO: TFloatField;
    cdsDocumentosIDPARCFINANCIMOV: TFloatField;
    cdsDocumentosIDCONTRATOIMOVEL: TFloatField;
    cdsDocumentosFLGTIPOLANC: TFloatField;
    dtsDocumentos: TDataSource;
    edtDataCalculo: TCMDateTimePicker;
    Label2: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Splitter1: TSplitter;
    Panel4: TPanel;
    dbgrdContrato: TwwDBGrid;
    dbgrdDocumento: TwwDBGrid;
    cdsAltGerado: TCMClientDataSet;
    cdsAlteradores: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnContinuarClick(Sender: TObject);
    procedure dbgrdContratoCalcTitleImage(Sender: TObject; Field: TField; var TitleImageAttributes: TwwTitleImageAttributes);
    procedure dbgrdContratoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgrdContratoRowChanged(Sender: TObject);
    procedure dbgrdContratoTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlInadimplencia  : TCtrlInadimplencia;
    CtrlContratoImovel : TCtrlContratoImovel;
    CtrlEventoImovel   : TCtrlEventoImovel;

    sTipoContrato      : String;
    iOrdem             : integer;

    procedure PreencheDocumentos( cdsDoc             : TCMClientDataSet;
                                  iIDCONTRATOIMOVEL  : integer;
                                  sFLGTIPOCONTRATO   : string;
                                  sCONMESREFREAJUSTE : string;
                                  iIDINDCORRECAO     : integer;
                                  fCONVLRMULTA       : extended;
                                  fCONPERCENTMULTA   : extended;
                                  iCONMOEDAMULTA     : integer;
                                  fCONVLRMORA        : extended;
                                  fCONPERCENTMORA    : extended;
                                  iCONMOEDAMORA      : integer;
                                  iFLGMORAPROPORC    : integer;
                                  iIDCIDADES         : integer;
                                  iIDPAIS            : integer;
                                  iCONDIASTOLERANCIA : integer;
                                  iCONDIASREPASSE    : integer;
                                  sCONPERMORA        : string;
                                  sCODESTADO         : string;
                                  sFLGTIPODIATOLERA  : string;
                                  dData              : TDateTime;
                                  bApenasAbertos     : boolean;
                                  bCFinan            : boolean );

  public
    { Public declarations }
    procedure MsgErro( sMsg : string );
  end;

var
  frmExecCalculoDivergencia: TfrmExecCalculoDivergencia;

implementation

{$R *.DFM}

uses uSistema, dBaseDados, uMensErro, uModuloImobiliario;


procedure TfrmExecCalculoDivergencia.FormCreate(Sender: TObject);
var
   sSQL : String;
begin
   inherited;
   CtrlInadimplencia := TCtrlInadimplencia.Create(Sistema.IDEmpresa,Sistema.IDModulo,Sistema.IDUsuario,Sistema.IDEspAcesso,Sistema.UsaPlanoPatro);
   CtrlInadimplencia.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );

   CtrlContratoImovel := TCtrlContratoImovel.Create( Sistema.IdEmpresa, Sistema.IdModulo,
                                                     Sistema.IdUsuario, Sistema.IdEspAcesso,
                                                     Sistema.UsaPlanoPatro );
   CtrlContratoImovel.InitializeAs( CtrlInadimplencia );

   CtrlEventoImovel := TCtrlEventoImovel.Create;
   CtrlEventoImovel.InitializeAs( CtrlInadimplencia );

   if Sistema.IdModulo = 64 then sTipoContrato := 'L'
   else                          sTipoContrato := 'A';

   iOrdem := 0;

   edtDataCalculo.Date := Date;

   // Monta um cds vazio para fazer a geracao dos alteradores
   sSQL :=
   'SELECT 0 AS IDCONTRATOIMOVEL, '        + #13 +
   '       0 AS CODDOCUMENTO, '            + #13 +
   '       SYSDATE AS DATAVENCTO, '        + #13 +
   '       0 AS IDCIDADES, '               + #13 +
   '       0 AS IDPAIS, '                  + #13 +
   '       ''  '' AS CODESTADO,  '         + #13 +
   '       '' ''  AS FLGTIPODIATOLERA,  '  + #13 +
   '       0 AS CONDIASTOLERANCIA, '       + #13 +
   '       0 AS CONDIASREPASSE, '          + #13 +
   '       0 AS VLRMULTA, '                + #13 +
   '       0 AS VLRJUROS, '                + #13 +
   '       0 AS VLRCORRECAO, '             + #13 +
   '       0 AS CODALTMULTA, '             + #13 +
   '       0 AS CODALTJUROS, '             + #13 +
   '       0 AS CODALTCORRMON '            + #13 +
   'FROM   DUAL '                          + #13 +
   'WHERE  1 = 2 '                         + #13;

   cdsAltGerado.Data := CtrlInadimplencia.GetDataPacket(sSQL);
end;



procedure TfrmExecCalculoDivergencia.FormClose(Sender: TObject;var Action: TCloseAction);
begin
   CtrlInadimplencia.Free;
   CtrlContratoImovel.Free;
   CtrlEventoImovel.Free;

   inherited;
end;



procedure TfrmExecCalculoDivergencia.btnContinuarClick(Sender: TObject);
var
   iDocumento, iContador, iTotal : Integer;
   fMulta, fJuros, fCorrecao     : Extended;
begin
   if edtDataIni.Date > edtDataCalculo.Date then
   begin
      MsgErro('Data inicial dos documentos vencidos não pode ser superior à data do novo vencimento');
      if edtDataIni.CanFocus then edtDataIni.SetFocus;
      Exit;
   end;

   if edtDataFim.Date > edtDataCalculo.Date then
   begin
      MsgErro('Data final dos documentos vencidos não pode ser superior à data do novo vencimento');
      if edtDataFim.CanFocus then edtDataFim.SetFocus;
      Exit;
   end;

   if length(trim(edtDataIni.Text)) = 0 then
   begin
      MsgErro('Data inicial dos documentos vencidos não foi informada');
      if edtDataIni.CanFocus then edtDataIni.SetFocus;
      Exit;
   end;

   if length(trim(edtDataFim.Text)) = 0 then
   begin
      MsgErro('Data final dos documentos vencidos não foi informada');
      if edtDataFim.CanFocus then edtDataFim.SetFocus;
      Exit;
   end;

   if length(trim(edtDataCalculo.Text)) = 0 then
   begin
      MsgErro('Data do novo vencimento não foi informada');
      if edtDataCalculo.CanFocus then edtDataCalculo.SetFocus;
      Exit;
   end;

   cdsContratos.Close;
   cdsDocumentos.Close;
   cdsContratos.Data := CtrlInadimplencia.RecuperaContratos( molContrato.sNumContrato,
                                                             molContrato.sNomeContrato,
                                                             '',
                                                             molImovelouMestre.edtImovel.Text,
                                                             molImovelouMestre.sMestre,
                                                             edtDataIni.Date,
                                                             edtDataFim.Date,
                                                             0,
                                                             '',
                                                             sTipoContrato,
                                                             0,
                                                             edtDataCalculo.Date,
                                                             True,
                                                             False,
                                                             True );

   if cdsContratos.IsEmpty then
      MessageDlg('Não foi encontrado nenhum contrato que atenda a estes parâmetros.', mtWarning, [mbOK], 0)
   else
   begin
      dbgrdContrato.DataSource := nil;

      iContador := 0;
      iTotal    := cdsContratos.RecordCount;

      frmProgresso.MostraFormProgresso('Verificando inadimplência(s) do(s) contrato(s) selecionado(s)...');

      cdsContratos.IndexName := '';
      cdsContratos.IndexDefs.Clear;

      cdsContratos.First;
      iOrdem := 0;

      while not cdsContratos.eof do
      begin
         inc(iContador);
         frmProgresso.AndaFormProgresso(iContador, iTotal);

         if frmProgresso.Cancelou then Exit;

         PreencheDocumentos( cdsDocumentos,
                             cdsContratosIDCONTRATOIMOVEL.AsInteger,
                             cdsContratosFLGTIPOCONTRATO.AsString,
                             cdsContratosCONMESREFREAJUSTE.AsString,
                             cdsContratosIDINDCORRECAO.AsInteger,
                             cdsContratosCONVLRMULTA.AsFloat,
                             cdsContratosCONPERCENTMULTA.AsFloat,
                             cdsContratosCONMOEDAMULTA.AsInteger,
                             cdsContratosCONVLRMORA.AsFloat,
                             cdsContratosCONPERCENTMORA.AsFloat,
                             cdsContratosCONMOEDAMORA.AsInteger,
                             cdsContratosFLGMORAPROPORC.AsInteger,
                             cdsContratosIDCIDADES.AsInteger,
                             cdsContratosIDPAIS.AsInteger,
                             cdsContratosCONDIASTOLERANCIA.AsInteger,
                             cdsContratosCONDIASREPASSE.AsInteger,
                             cdsContratosCONPERMORA.AsString,
                             cdsContratosCODESTADO.AsString,
                             cdsContratosFLGTIPODIATOLERA.AsString,
                             edtDataCalculo.Date,
                             True,
                             False );
         if cdsDocumentos.IsEmpty then
            cdsContratos.Delete
         else
         begin
            fMulta    := 0;
            fJuros    := 0;
            fCorrecao := 0;

            // Busca os alteradores conforme o Tipo de Imovel
            cdsAlteradores.Data := CtrlInadimplencia.ListaAlteradores(cdsContratosIDCONTRATOIMOVEL.AsInteger);
            
            cdsDocumentos.First;
            while not cdsDocumentos.eof do
            begin

               // Se não existir pagamento ou se for pagamento parcial, grava o documento com a nova data de vencimento
               if cdsDocumentos.FieldByName('VALOR_RECEBIDO').AsFloat < cdsDocumentos.FieldByName('VALOR_ORIGINAL').AsFloat then
               begin
                  iDocumento := cdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger;
               end
               // Se existir pagamento total, grava -1 no documento para que seja adicionado no documento gerado pela folha
               else
               begin
                  iDocumento := -1;
               end;

               // Preenche os DataSets com os valores de cada documento
               if not cdsAltGerado.Locate('IDCONTRATOIMOVEL;CODDOCUMENTO',VarArrayOf([cdsContratosIDCONTRATOIMOVEL.AsInteger,iDocumento]),[]) then
               begin
                  cdsAltGerado.Insert;
                  cdsAltGerado.FieldByName('CODDOCUMENTO').AsInteger      := iDocumento;
                  cdsAltGerado.FieldByName('IDCONTRATOIMOVEL').AsInteger  := cdsContratosIDCONTRATOIMOVEL.AsInteger;
                  cdsAltGerado.FieldByName('IDCIDADES').AsInteger         := cdsContratos.FieldByNAme('IDCIDADES').AsInteger;
                  cdsAltGerado.FieldByName('IDPAIS').AsInteger            := cdsContratos.FieldByNAme('IDPAIS').AsInteger;
                  cdsAltGerado.FieldByName('CODESTADO').AsString          := cdsContratos.FieldByNAme('CODESTADO').AsString;
                  cdsAltGerado.FieldByName('FLGTIPODIATOLERA').AsString   := cdsContratos.FieldByName('FLGTIPODIATOLERA').AsString;
                  cdsAltGerado.FieldByName('CONDIASTOLERANCIA').AsInteger := cdsContratos.FieldByName('CONDIASTOLERANCIA').AsInteger;
                  cdsAltGerado.FieldByName('CONDIASREPASSE').AsInteger    := cdsContratos.FieldByName('CONDIASREPASSE').AsInteger;
                  cdsAltGerado.FieldByName('DATAVENCTO').AsDateTime       := edtDataCalculo.Date;

                  cdsAltGerado.FieldByName('CODALTMULTA').AsInteger       := cdsAlteradores.FieldByName('CODALTMULTA').AsInteger;
                  cdsAltGerado.FieldByName('CODALTJUROS').AsInteger       := cdsAlteradores.FieldByName('CODALTJUROS').AsInteger;
                  cdsAltGerado.FieldByName('CODALTCORRMON').AsInteger     := cdsAlteradores.FieldByName('CODALTCORRMON').AsInteger;
               end
               else
               begin
                  cdsAltGerado.Edit;
               end;

               cdsAltGerado.FieldByName('VLRMULTA').AsFloat    := cdsAltGerado.FieldByName('VLRMULTA').AsFloat +
                                                                  cdsDocumentos.FieldByName('MULTA').AsFloat +
                                                                  cdsDocumentos.FieldByName('MULTADIF').AsFloat;

               cdsAltGerado.FieldByName('VLRJUROS').AsFloat    := cdsAltGerado.FieldByName('VLRJUROS').AsFloat +
                                                                  cdsDocumentos.FieldByName('JUROS').AsFloat +
                                                                  cdsDocumentos.FieldByName('JUROSDIF').AsFloat;

               cdsAltGerado.FieldByName('VLRCORRECAO').AsFloat := cdsAltGerado.FieldByName('VLRCORRECAO').AsFloat +
                                                                  cdsDocumentos.FieldByName('CORRECMONET').AsFloat +
                                                                  cdsDocumentos.FieldByName('CORRECMONETDIF').AsFloat;

               cdsAltGerado.Post;

               cdsDocumentos.Next;
            end;

            cdsContratos.Next;
         end;
      end;

      cdsContratos.First;

      dbgrdContrato.DataSource := dtsContratos;

      frmProgresso.EscondeFormProgresso;

      inherited;

      btnConfirmar.Enabled := not cdsContratos.IsEmpty;
   end;
end;



procedure TfrmExecCalculoDivergencia.PreencheDocumentos( cdsDoc: TCMClientDataSet;
                                                         iIDCONTRATOIMOVEL: integer; sFLGTIPOCONTRATO,
                                                         sCONMESREFREAJUSTE: string;
                                                         iIDINDCORRECAO: integer;
                                                         fCONVLRMULTA, fCONPERCENTMULTA: extended;
                                                         iCONMOEDAMULTA: integer;
                                                         fCONVLRMORA, fCONPERCENTMORA: extended;
                                                         iCONMOEDAMORA, iFLGMORAPROPORC, iIDCIDADES,
                                                         iIDPAIS, iCONDIASTOLERANCIA, iCONDIASREPASSE: integer;
                                                         sCONPERMORA, sCODESTADO, sFLGTIPODIATOLERA: string;
                                                         dData: TDateTime;
                                                         bApenasAbertos, bCFinan: boolean);
var
   iMESESANTERIORES  : integer;
   fVALORORIGINAL,
   fVALORRECEBIDO    : extended;
   bTEMBAIXAPARCIAL  : boolean;
   dDATAVENCIMENTO   ,
   dDATALIMITE       : TDateTime;
   sFLGTIPODIAREPASS : string;
   iIdParcFinancImov : Integer;
   fValorAtual,
   fMulta, fJuros, fCorrecaoMonet,
   fMultaDif, fJurosDif, fCorrecaoMonetDif,
   fProporcao, fValorDiverg, fValorDivergAtual : extended;

   cdsDadosParaAlienacao : TCMClientDataset;
   dDataCalculo : TDateTime;
begin
   cdsDoc.Close;

   if not CtrlInadimplencia.AtualizaDataLimite( sFLGTIPOCONTRATO, iIDCONTRATOIMOVEL, False ) then
   begin
      MsgDlg( 'Não é possível atualizar a data limite dos documentos.', 'Erro', mtError, [mbOk], 0 );
      Exit;
   end;

   if sFLGTIPOCONTRATO = 'L' then
      cdsDoc.Data := CtrlInadimplencia.RecuperaDocumentosImob( iIDCONTRATOIMOVEL, dData, bApenasAbertos, bCFinan )
   else
      cdsDoc.Data := CtrlInadimplencia.RecuperaDocumentosAliena( iIDCONTRATOIMOVEL, dData, bApenasAbertos );

   cdsDoc.DisableControls;
   try
      while not cdsDoc.Eof do
      begin
         iIDINDCORRECAO     := cdsContratosIDINDCORRECAO.AsInteger;
         fCONVLRMULTA       := cdsContratosCONVLRMULTA.AsFloat;
         fCONPERCENTMULTA   := cdsContratosCONPERCENTMULTA.AsFloat;
         iCONMOEDAMULTA     := cdsContratosCONMOEDAMULTA.AsInteger;
         fCONVLRMORA        := cdsContratosCONVLRMORA.AsFloat;
         fCONPERCENTMORA    := cdsContratosCONPERCENTMORA.AsFloat;
         iCONMOEDAMORA      := cdsContratosCONMOEDAMORA.AsInteger;
         iFLGMORAPROPORC    := cdsContratosFLGMORAPROPORC.AsInteger;
         iIDCIDADES         := cdsContratosIDCIDADES.AsInteger;
         iIDPAIS            := cdsContratosIDPAIS.AsInteger;
         iCONDIASTOLERANCIA := cdsContratosCONDIASTOLERANCIA.AsInteger;
         iCONDIASREPASSE    := cdsContratosCONDIASREPASSE.AsInteger;
         sCONPERMORA        := cdsContratosCONPERMORA.AsString;
         sCODESTADO         := cdsContratosCODESTADO.AsString;
         sFLGTIPODIATOLERA  := cdsContratosFLGTIPODIATOLERA.AsString;

         iIdParcFinancImov  := -1;
         iMESESANTERIORES   := Iff( sCONMESREFREAJUSTE = 'A', 1, 0 );
         fVALORORIGINAL     := cdsDoc.FieldByName('VALOR_ORIGINAL').AsFloat;
         fVALORRECEBIDO     := cdsDoc.FieldByName('VALOR_RECEBIDO').AsFloat;
         bTEMBAIXAPARCIAL   := ( fVALORRECEBIDO <> 0 );
         dDATAVENCIMENTO    := cdsDoc.FieldByName('DATAVENCTO').AsDateTime;
         dDATALIMITE        := cdsDoc.FieldByName('DATALIMITE').AsDateTime;
         sFLGTIPODIAREPASS  := sFLGTIPODIATOLERA;

         if sFLGTIPOCONTRATO = 'C' then
         begin
            cdsDadosParaAlienacao := TCMClientDataset.Create( nil );
            try
               cdsDadosParaAlienacao.Data := CtrlContratoImovel.BuscaParamCMJurosMulta( iIDCONTRATOIMOVEL, dData );

               iMESESANTERIORES   := cdsDadosParaAlienacao.FieldByName('MESREFCORRECAO').AsInteger;
               iIDINDCORRECAO     := cdsDadosParaAlienacao.FieldByName('IDINDCORRECAO').AsInteger;
               fCONVLRMULTA       := cdsDadosParaAlienacao.FieldByName('VLRMULTA').AsFloat;
               fCONPERCENTMULTA   := cdsDadosParaAlienacao.FieldByName('PERCMULTA').AsFloat;
               iCONMOEDAMULTA     := cdsDadosParaAlienacao.FieldByName('MOEDAMULTA').AsInteger;
               fCONVLRMORA        := cdsDadosParaAlienacao.FieldByName('VLRJUROS').AsFloat;
               fCONPERCENTMORA    := cdsDadosParaAlienacao.FieldByName('PERCJUROS').AsFloat;
               iCONMOEDAMORA      := cdsDadosParaAlienacao.FieldByName('MOEDAJUROS').AsInteger;
               iFLGMORAPROPORC    := Iff( cdsDadosParaAlienacao.FieldByName('FLGJUROSPROPORC').AsString = 'S', 1, 0 );
               sCONPERMORA        := cdsDadosParaAlienacao.FieldByName('PERIODOJUROS').AsString;
               iCONDIASTOLERANCIA := cdsDadosParaAlienacao.FieldByName('DIASTOLERANCIA').AsInteger;
               iCONDIASREPASSE    := cdsDadosParaAlienacao.FieldByName('DIASREPASSE').AsInteger;
               sFLGTIPODIATOLERA  := cdsDadosParaAlienacao.FieldByName('FLGTIPODIATOLERA').AsString;
               sFLGTIPODIAREPASS  := cdsDadosParaAlienacao.FieldByName('FLGTIPODIAREPASS').AsString;

               // Busca o Id da Parcela
               iIdParcFinancImov  := cdsDoc.FieldByName('IDPARCFINANCIMOV').AsInteger;
            finally
               cdsDadosParaAlienacao.Free;
            end;
         end;

         fMulta         := 0;
         fJuros         := 0;
         fCorrecaoMonet := 0;

         CtrlInadimplencia.DadosDocsVencidos( cdsDoc.FieldByName('CODDOCUMENTO').AsInteger,
                                              iIdParcFinancImov,
                                              dData,
                                              iMESESANTERIORES,
                                              iIDINDCORRECAO,
                                              fCONVLRMULTA,
                                              fCONPERCENTMULTA,
                                              iCONMOEDAMULTA,
                                              fCONVLRMORA,
                                              fCONPERCENTMORA,
                                              iCONMOEDAMORA,
                                              iFLGMORAPROPORC,
                                              iIDCIDADES,
                                              iIDPAIS,
                                              iCONDIASTOLERANCIA,
                                              iCONDIASREPASSE,
                                              bTEMBAIXAPARCIAL,
                                              fVALORORIGINAL,
                                              fVALORRECEBIDO,
                                              dDATAVENCIMENTO,
                                              dDATALIMITE,
                                              sCONPERMORA,
                                              sCODESTADO,
                                              sFLGTIPODIATOLERA,
                                              sFLGTIPODIAREPASS,
                                              sFLGTIPOCONTRATO,
                                              ModuloImobiliario.AdminImob.sFlgCalcInadimp,
                                              False,
                                              fValorAtual,
                                              fMulta, fJuros, fCorrecaoMonet,
                                              fMultaDif, fJurosDif, fCorrecaoMonetDif, fProporcao,
                                              fValorDiverg, fValorDivergAtual,
                                              dDataCalculo );

         if (fValorDiverg > 0) then begin
            cdsDoc.Edit;

            if sFLGTIPOCONTRATO = 'C' then
               cdsDoc.FieldByName('DESCCUSTORECIMO').AsString := CtrlInadimplencia.TipoParcela( cdsDoc.FieldByName('FLGTIPOLANC').AsInteger );
               
            cdsDoc.FieldByName('MULTA').AsFloat            := fMulta;
            cdsDoc.FieldByName('JUROS').AsFloat            := fJuros;
            cdsDoc.FieldByName('CORRECMONET').AsFloat      := fCorrecaoMonet;
            cdsDoc.FieldByName('MULTADIF').AsFloat         := fMultaDif;
            cdsDoc.FieldByName('JUROSDIF').AsFloat         := fJurosDif;
            cdsDoc.FieldByName('CORRECMONETDIF').AsFloat   := fCorrecaoMonetDif;
            cdsDoc.FieldByName('PROPORCAO').AsFloat        := fProporcao;
            cdsDoc.FieldByName('VALORATUAL').AsFloat       := fValorAtual;
            cdsDoc.FieldByName('VALORDIVERG').AsFloat      := fValorDiverg;
            cdsDoc.FieldByName('VALORDIVERGATUAL').AsFloat := fValorDivergAtual;
            cdsDoc.FieldByName('DATACALCULO').AsDateTime   := dDataCalculo;
            cdsDoc.Post;
            
            cdsDoc.Next;
         end else begin
            cdsDoc.Delete;
         end;
      end;
   finally
      cdsDoc.EnableControls;
      cdsDoc.First;
   end;
end;




procedure TfrmExecCalculoDivergencia.dbgrdContratoCalcTitleImage(Sender: TObject; Field: TField; var TitleImageAttributes: TwwTitleImageAttributes);
begin
   inherited;
   TitleImageAttributes.Alignment  := taRightJustify;
   TitleImageAttributes.ImageIndex := -1;

   if cdsContratos.IndexDefs.Count > 0 then
     if cdsContratos.IndexDefs[0].DescFields  = Field.FieldName then TitleImageAttributes.ImageIndex := 1
     else if cdsContratos.IndexDefs[0].Fields = Field.FieldName then TitleImageAttributes.ImageIndex := 0;
end;



procedure TfrmExecCalculoDivergencia.dbgrdContratoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   inherited;
   if ssCtrl in Shift then Abort;
end;



procedure TfrmExecCalculoDivergencia.dbgrdContratoRowChanged(Sender: TObject);
begin
   inherited;
   PreencheDocumentos( cdsDocumentos,
                       cdsContratosIDCONTRATOIMOVEL.AsInteger,
                       cdsContratosFLGTIPOCONTRATO.AsString,
                       cdsContratosCONMESREFREAJUSTE.AsString,
                       cdsContratosIDINDCORRECAO.AsInteger,
                       cdsContratosCONVLRMULTA.AsFloat,
                       cdsContratosCONPERCENTMULTA.AsFloat,
                       cdsContratosCONMOEDAMULTA.AsInteger,
                       cdsContratosCONVLRMORA.AsFloat,
                       cdsContratosCONPERCENTMORA.AsFloat,
                       cdsContratosCONMOEDAMORA.AsInteger,
                       cdsContratosFLGMORAPROPORC.AsInteger,
                       cdsContratosIDCIDADES.AsInteger,
                       cdsContratosIDPAIS.AsInteger,
                       cdsContratosCONDIASTOLERANCIA.AsInteger,
                       cdsContratosCONDIASREPASSE.AsInteger,
                       cdsContratosCONPERMORA.AsString,
                       cdsContratosCODESTADO.AsString,
                       cdsContratosFLGTIPODIATOLERA.AsString,
                       edtDataCalculo.Date,
                       True,
                       False );

end;



procedure TfrmExecCalculoDivergencia.dbgrdContratoTitleButtonClick(Sender: TObject; AFieldName: String);
var
   IndexDef : TIndexDef;
begin
   inherited;

   if ( iOrdem = 0 ) or ( iOrdem = 2 ) then
      iOrdem := 1
   else
      iOrdem := 2;

   cdsContratos.IndexName := '';
   cdsContratos.IndexDefs.Clear;
   IndexDef := cdsContratos.IndexDefs.AddIndexDef;
   IndexDef.Name := 'i' + IntToStr( GetTickCount );

   if iOrdem = 1 then
   begin
      IndexDef.Fields := AFieldName;
      IndexDef.DescFields := '';
      IndexDef.Options := [];
   end
   else
   begin
      IndexDef.Fields := AFieldName;
      IndexDef.DescFields := AFieldName;
      IndexDef.Options := [ixDescending];
   end;

   cdsContratos.IndexName := cdsContratos.IndexDefs[0].Name;
   cdsContratos.First;
end;



procedure TfrmExecCalculoDivergencia.MsgErro(sMsg: string);
begin
   MsgDlg(sMsg,Sistema.NomeModulo,mtError,[mbOK],0);
end;



procedure TfrmExecCalculoDivergencia.btnConfirmarClick(Sender: TObject);
begin
   inherited;
   // Efetua a gravação das inadimplências
   cdsAltGerado.IndexFieldNames := 'IDCONTRATOIMOVEL;CODDOCUMENTO';
end;



end.




