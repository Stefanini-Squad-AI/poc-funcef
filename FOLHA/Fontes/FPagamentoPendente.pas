// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Paulo Ramos
// Data        : 18/09/2007
// Rotina      : NO DFM
// Pendência   : 26347
// Descricao   : Alterar query qryNovoPagto para evitar duplicidade com Elegpatro.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 16/04/2007
// Rotina      : NO DFM
// Pendência   : 23461
// Descricao   : Alterar quer do novo recebedor para exibir recebedores de
//   rubrica individual.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 18/11/2006 a 22/11/2006, 05/12/2006
// Rotina      : InsereNovoPagto, qryPagtoPendenteAfterScroll,
//               MontaQueryPagtoPend, bbtnExcluiPagtoClick, fcsbbtnPreviaClick
// Pendência   : 23461
// Descricao   : Permitir indicar um novo recebedor para o pagamento liberado.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 25/09/2006
// Rotina      : Confirmar
// Pendência   : 23387
// Descricao   : Permitir gravar o plano contábil original da Histrubsal.
//------------------------------------------------------------------------------
// Autor(a)  : Paulo Ramos
// Rotina    : BuscaBeneficio
// Data      : 29/08/2006
// Pendencia : 23189
// Alteração : Obter corretamente o campo Idbeneficio para permitir a busca do
//   PlacontaC e PlacontaD para gravação na tabela Prévia, no processo de efetivação do pagamento.
//------------------------------------------------------------------------------
// Autor      : Paulo Ramos
// Rotina     : fcsbbtnPreviaClick
// Pendência  : 21841
// Data       : 10/05/2006
// Descricao  : Não gravou o idfavorecido da versão original, causando diferença
//   no fechamento do convênio.
//------------------------------------------------------------------------------
unit fpagamentopendente;

interface

uses Windows, Classes, Graphics, Forms, Sysutils, Controls, StdCtrls, ComCtrls,
     FOkCancelar, MAHlpBtn, Buttons, TB97, ExtCtrls, Spin, Db, DBTables,
     TB97Tlbr, Grids, DBGrids, Wwdbgrid, Wwquery, IvDictio, IvMulti, IvEMulti,
     MontaSelect, CMDateTimePicker, wwdbdatetimepicker, fcButton, fcImgBtn,
     fcShapeBtn, Wwdatsrc, Wwdbigrd, fFrameProgresso, Dialogs, uSistema,
     UDatabase, DBaseDados, UMensErro, uAdmPrevFB, UPrevia, dContabil,
     uFuncoesfolha, wwdblook, uObjFolha, uString, uCtrlPadroes, uCtrlBancoPortForma;


type
  TfrmPagamentoPendente = class(TfrmOkCancelar)
    qryPagtoPendente: TwwQuery;
    dsPagtoPendente: TwwDataSource;
    qryNovoPagto: TwwQuery;
    dsNovoPagto: TwwDataSource;
    qryAux: TwwQuery;
    Panel1: TPanel;
    grpMesRef: TGroupBox;
    cmbMes: TComboBox;
    spnedAno: TSpinEdit;
    dsRubricasRecebedor: TwwDataSource;
    PageControlPag: TPageControl;
    tbsOpcoes: TTabSheet;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    Label3: TLabel;
    dbgrnovospagamentos: TwwDBGrid;
    Panel4: TPanel;
    Label4: TLabel;
    dbgrpagamentospendentes: TwwDBGrid;
    pnlControle: TPanel;
    bbtnExcluiPagto: TfcShapeBtn;
    bbtnIncluiNovoPagto: TfcShapeBtn;
    tbsResultado: TTabSheet;
    FrameProgresso: TfrmFrameProgresso;
    Panel5: TPanel;
    lblCAPParticip: TLabel;
    lblValorLiquido: TLabel;
    qryRubricaPagar: TwwQuery;
    qryRecebedores: TwwQuery;
    qryBeneficio: TwwQuery;
    qryRubricasRecebedor: TwwQuery;
    qryRubricasRecebedorMES: TStringField;
    qryRubricasRecebedorRUBRICA: TStringField;
    qryRubricasRecebedorESTADO: TStringField;
    qryRubricasRecebedorVALOR: TFloatField;
    qryRubricasRecebedorRECPAG: TStringField;
    qryRubricasRecebedorCODTIPRECDES: TStringField;
    qryRubricasRecebedorPLACONTA: TStringField;
    qryRubricasRecebedorCODSUBCONTA: TFloatField;
    qryRubricasRecebedorUNIDNEGOC: TFloatField;
    qryRubricasRecebedorCODCENTROCUSTO: TStringField;
    qryRubricasRecebedorCODCENTRORESPON: TStringField;
    qryRubricasRecebedorVALORPROVENTO: TFloatField;
    dbgrCAPParticip: TwwDBGrid;
    StaticText1: TStaticText;
    GroupBox5: TGroupBox;
    dblkLote: TwwDBLookupCombo;
    GroupBox3: TGroupBox;
    lbDescricao: TLabel;
    GroupBox2: TGroupBox;
    lbDataFolha: TLabel;
    fcsbbtnPrevia: TfcShapeBtn;
    qryLotes: TwwQuery;
    qryRubricasRecebedorCODIGO: TStringField;
    qryRubricaGravar: TwwQuery;
    qryVersao: TwwQuery;
    qryVersaoHISTORICO: TStringField;
    grbTipodeBusca: TGroupBox;
    rdbBuscaTodos: TRadioButton;
    rdbIndividual: TRadioButton;
    btnProcurar: TBitBtn;
    lbMatricula: TLabel;
    MontaSelect: TMontaSelect;
    qryPortadorForma: TwwQuery;
    updNovoPagto: TUpdateSQL;
    Splitter2: TSplitter;
    lblNovoContasCaixa: TLabel;
    dblkPortadorForma: TwwDBLookupCombo;
    qryPagtoPendenteCODPORTFORMA: TFloatField;
    qryPagtoPendenteMATRICULA: TStringField;
    qryPagtoPendenteMESCOBRANCA: TStringField;
    qryPagtoPendenteIDTITULAR: TFloatField;
    qryPagtoPendenteIDPESSOA: TFloatField;
    qryPagtoPendenteIDREFERENCIA: TFloatField;
    qryPagtoPendenteNOME: TStringField;
    qryNovoPagtoMATRICULA: TStringField;
    qryNovoPagtoNOME: TStringField;
    qryNovoPagtoHISTORICO: TStringField;
    qryNovoPagtoIDTITULAR: TFloatField;
    qryNovoPagtoIDPESSOA: TFloatField;
    qryNovoPagtoIDREFERENCIA: TFloatField;
    qryNovoPagtoCODPORTFORMA: TFloatField;
    qryNovoPagtoDESCRICAO: TStringField;
    qryBuscaPortador: TwwQuery;
    qryNovoRecebedor: TwwQuery;
    cmbRecebedor: TwwDBLookupCombo;
    Label13: TLabel;
    qryNovoPagtoIDNOVORECEBEDOR: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnIncluiNovoPagtoClick(Sender: TObject);
    procedure bbtnExcluiPagtoClick(Sender: TObject);
    procedure qryRubricasRecebedorAfterOpen(DataSet: TDataSet);
    procedure fcsbbtnPreviaClick(Sender: TObject);
    procedure dbgrpagamentospendentesEnter(Sender: TObject);
    procedure dbgrnovospagamentosEnter(Sender: TObject);
    procedure cmbMesChange(Sender: TObject);
    procedure spnedAnoChange(Sender: TObject);
    procedure dblkLoteCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure rdbBuscaTodosClick(Sender: TObject);
    procedure rdbIndividualClick(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrnovospagamentosColExit(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure qryPagtoPendenteAfterScroll(DataSet: TDataSet);
  private
     { Private declarations }
    scod, sHist,
    sIdLote: String;
    sMesPagamento: string;
    ctrlBCP: tCtrlBancoPortForma; 
    Function ValidaAnoMes(sSt:String;bNum:Byte): Boolean;
    Function LoteValido: Boolean;
    procedure SelecionaLotes;
    Procedure PegaAnoMesCobranca;
    procedure Consulta;
    procedure MontaQueryPagtoPend;
    procedure InsereNovoPagto;
    procedure BuscaBeneficio(Var pIdBeneficio: Integer; pIdPessjur, pIdPlanoPrev, pIdHstFolhaBenef, pIdTitular, pIdRubrica : Integer);
  public
    { Public declarations }
  end;

var
  frmPagamentoPendente: TfrmPagamentoPendente;

implementation

{$R *.DFM}

procedure TfrmPagamentoPendente.FormCreate(Sender: TObject);
begin
  inherited;
  sMesPagamento := '';
  sIdLote       := '';
  WindowState   := wsMaximized;
  qryPortadorForma.Open; 
  
  ctrlBCP:=tCtrlBancoPortForma.create;
  ctrlBCP.InitializeAs(Padroes);
  ctrlBCP.Inicializa(iidfundacao);
end;

procedure TfrmPagamentoPendente.FormShow(Sender: TObject);
var AYear, AMonth, ADay: Word;
    sAnoAux, sMesAux : string;
begin
  inherited;
  lbMatricula.Caption := '';
  WindowState := wsMaximized;
  DecodeDate(date, AYear, AMonth, ADay);
  If StrToInt(spnedAno.Text)>AYear then spnedAno.Value:=AYear;
  If (AMonth >= 1) and (AMonth <= 12) then
  begin
    cmbMes.ItemIndex := AMonth - 1;
    cmbMes.Text := cmbMes.Items[cmbMes.ItemIndex];
    spnedAno.Text := IntToStr(AYear);
  end;
  PageControlPag.Visible:=False;
end;

Function TfrmPagamentoPendente.ValidaAnoMes(sSt:String;bNum:Byte): Boolean;
begin
  Result:=False;
  If StrToIntDef(Copy(sSt,1,4),0)>0 then
   If StrToIntDef(Copy(sSt,6,2),0) In [1..12+bNum] then
     Result:=True;
end;

Function TfrmPagamentoPendente.LoteValido: Boolean;
begin
  With qryLotes do
   Result:=(Not IsEmpty)And
           (FieldByName('IDLOTE').AsString<>'') And
           (FieldByName('MESREFERENCIA').AsString<>'') And
           (FieldByName('DESCRICAO').AsString<>'') And
           (FieldByName('DATAPAGAMENTO').AsString<>'') And
           (sIdlote<>'') And
           (dbLkLote.Text<>'') And
           (dbLkLote.LookupValue<>'') And
           (StrToIntDef(dbLkLote.Text,0)=StrToIntDef(dbLkLote.LookupValue,0))And
           (StrToIntDef(dbLkLote.Text,0)>0)And
           (StrToIntDef(dbLkLote.LookupValue,0)>0)And
           (ValidaAnoMes(sMesPagamento,0)) And
           (lbDescricao.Caption<>'') And
           (lbDataFolha.Caption<>'');
end;

procedure TfrmPagamentoPendente.SelecionaLotes;
Var sSql: String;
begin
  inherited;
  lbDescricao.Caption:='';
  lbDataFolha.Caption:='';
  dblkLote.Font.Color:=clBlack;
  dblkLote.Text:='';
  sIdLote:='';
  PageControlPag.Visible:=False;
  With qryLotes do
  begin
    Close;
    Sql.Clear;
    sSql:='SELECT IDLOTE, MESREFERENCIA, DESCRICAO, DATAPAGAMENTO,'+
           ' '' - '' AS HIFEN'+
           ' FROM CTRLINTERFACE '+
           ' WHERE ';
    If sMesPagamento<>'' then
      sSql:=sSql+' (MESREFERENCIA = '+QuotedStr(sMesPagamento)+') AND';
    sSql:=sSql+' (TIPO = ''B'') AND '+
               ' (FLGIDATMP = 1) AND '+
               ' (FLGVOLTATMP = 0) AND '+
               ' (FLGTIPOFOLHA = 1) '+
               ' ORDER BY MESREFERENCIA, IDLOTE';
    Sql.Add(sSql);
    Open;
    If Not IsEmpty then
      sMesPagamento:=FieldByName('MESREFERENCIA').AsString
    else
      begin
        sMesPagamento:='';
        dblkLote.Font.Color:=clRed;
        dblkLote.Text:='Inexistente';
      end;
  end; {With}
end;

Procedure TfrmPagamentoPendente.PegaAnoMesCobranca;
Var sAnoAux,sMesAux: String;
begin
  sMesPagamento:='';
  sMesAux:='';
  sAnoAux := spnedAno.Text;
  If cmbMes.Text='' then cmbMes.Text:=cmbMes.Items[cmbMes.ItemIndex];
  if cmbMes.ItemIndex <= 8 then
     sMesAux := '0'+IntToStr(cmbMes.ItemIndex+1)
  else begin
    if cmbMes.ItemIndex <> 12 then
      sMesAux := IntToStr(cmbMes.ItemIndex+1)
    else
      sMesAux := '12';
  end;
  If (sAnoAux<>'') And (sMesAux<>'') then
    sMesPagamento := sAnoAux + '/' + sMesAux;
  If Not ValidaAnoMes(sMesPagamento,0) then sMesPagamento:='';
  SelecionaLotes;
end;

procedure TfrmPagamentoPendente.qryRubricasRecebedorAfterOpen(DataSet: TDataSet);
 var dValor : double;
begin
  inherited;
  dValor:=0;
  while not qryRubricasRecebedor.eof do
  begin
    if qryRubricasRecebedor.fieldbyname('ESTADO').asstring = 'P' then
      dValor:=dValor+qryRubricasRecebedor.fieldbyname('VALOR').asfloat
    else
      if qryRubricasRecebedor.fieldbyname('ESTADO').asstring = 'D' then
        dValor:=dValor-qryRubricasRecebedor.fieldbyname('VALOR').asfloat;
    qryRubricasRecebedor.next;
  end;
  qryVersao.close;
  qryVersao.parambyname('IDVERSAO').asInteger := qryRubricasRecebedor.datasource.dataset.fieldbyname('IDREFERENCIA').asinteger;
  qryVersao.open;
  lblValorLiquido.caption:='Versão:  '+
  inttostr(qryRubricasRecebedor.datasource.dataset.fieldbyname('IDREFERENCIA').asinteger)+
  qryVersao.fieldbyname('HISTORICO').asstring+
  '           Valor Líquido: R$ '+formatfloat('#0.00', dValor)+'  ';
  lblCAPParticip.caption:='  Rubricas do Pagamento selecionado ==> '+
    ' Matrícula:  '+qryRubricasRecebedor.datasource.dataset.fieldbyname('MATRICULA').asstring+
    '; Recebedor:  '+qryRubricasRecebedor.datasource.dataset.fieldbyname('NOME').asstring;
end;

procedure TfrmPagamentoPendente.Consulta;
begin
  if qryPagtoPendente.Active Then
    qryPagtoPendente.Close;
  MontaQueryPagtoPend;
  if qryNovoPagto.Active Then
    qryNovoPagto.Close;
  qryNovoPagto.Open;
  fcsbbtnPrevia.enabled:=(not qryNovoPagto.isempty)And(LoteValido);
  qryRubricasRecebedor.close;
  qryRubricasRecebedor.open;
end;

procedure TfrmPagamentoPendente.bbtnIncluiNovoPagtoClick(Sender: TObject);
begin
  inherited;
  If Trim(dblkPortadorForma.Text) = '' Then
  Begin
    MsgDlg('Escolha o novo contas/caixa x Forma de Pagamento', 'Informação', mtInformation, [mbOk], 0);
    Exit;
  End;

  If rdbIndividual.Checked Then
  Begin
    If qryPagtoPendente.RecordCount > 1 Then
    Begin
      If MsgDlg('Deseja pagar todos os pagamentos pendentes deste recebedor agora?', 'Comfirmação',
                mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
        qryPagtoPendente.First;
        While Not qryPagtoPendente.Eof Do
        Begin
          InsereNovoPagto;
          qryPagtoPendente.Next;
        End;
      End
      Else
        InsereNovoPagto;
    End
    Else
      InsereNovoPagto;
  End
  Else
    InsereNovoPagto;

  Consulta;  
end;

procedure TfrmPagamentoPendente.bbtnExcluiPagtoClick(Sender: TObject);
begin
  if ExecutarQuery(qryAux, 'DELETE FROM LISTAFOLHABENEFDET '+
      'WHERE IDREFERENCIA = '+
        inttostr(qryNovoPagto.fieldbyname('IDREFERENCIA').asinteger)+' '+
      'AND IDTITULAR = '+
        inttostr(qryNovoPagto.fieldbyname('IDTITULAR').asinteger)+' '+
      'AND IDPESSOA = '+
        inttostr(qryNovoPagtoIDNOVORECEBEDOR.asinteger)) then
    Consulta
  else
    MsgDlg('Erro ao EXCLUIR novo pagamento de recebedor.', 'Aviso', mtWarning,
           [mbOk, mbHelp],0);
end;

procedure TfrmPagamentoPendente.fcsbbtnPreviaClick(Sender: TObject);
 var iCodSubConta: integer;
     sPlaConta,
     sCODCENTROCUSTO: String;
     bsemerro: boolean;
     dtPreparo: string;
     dDataFolha: TDate;
     llnumeroprocesso, llidbeneficio, lldfloatpgto : longint;
     objRecebedor : TObjRecebedorSimples;
     lRefCF: TRegContFinan;
     iNumLotes: Integer;
     bincluirub: boolean; 
     
     numbco, numage, nomeag, numcta, tpconta, sidcbanc: string;
     lbpagtoelet, bDuplContaPref: boolean;
     ifavcredito: integer;
     rLiquidoTotal: real;
     objPortResp: tObjPortadorForma;
begin
  inherited;

  bsemerro:=false;

  If sIdLote='' then Exit;

  Try
    dDataFolha:=StrToDate(lbDataFolha.Caption);
  Except
    Exit;
  end;

  (* CTRLINTERFACE *)
  (* O registro da CTRLINTERFACE é criado no form fAbertFechaLote *);

  iNumlotes:=QuantidadeLotes(sMesPagamento,StrToIntDef(sIdLote,0));

  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Processamento da Prévia de Pagamento Pendente.') then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  qryRecebedores.open;
  if not qryRecebedores.isempty then
  begin
    try
      if not dtmbasedados.dbBaseDados.InTransaction then
        dtmbasedados.dbBaseDados.StartTransaction;

      PageControlPag.activepage:=tbsResultado;
      frameProgresso.Iniciar('Prévia de Pagamentos Pendentes. Lote de Pagamento: '+
        sIdLote, true);

      dtPreparo:=DateTimeToStr(Date);

      frameProgresso.ResetaFrame(1, qryRecebedores.recordcount);
      frameProgresso.MarcaInicioFase('Gerando Prévia para os recebedores selecionados.');
      qryRubricaPagar.Close;
      qryBeneficio.Close;   
      qryRubricaPagar.prepare;
      qryBeneficio.prepare;

      try
        qryRecebedores.First; 
        while not qryRecebedores.eof do
        begin
          qryRubricaPagar.close;
          qryRubricaPagar.parambyname('IDTITULAR').asinteger:=
            qryRecebedores.fieldbyname('IDTITULAR').asinteger;
          qryRubricaPagar.parambyname('IDPESSOA').asinteger:=
            qryRecebedores.fieldbyname('IDPESSOA').asinteger;
          qryRubricaPagar.open;

          qryBeneficio.close;
          qryBeneficio.parambyname('IDHSTFOLHABENEF').asfloat:=
            qryRubricaPagar.fieldbyname('IDHSTFOLHABENEF').asfloat;
          qryBeneficio.parambyname('IDPESSJUR').asfloat:=
            qryRubricaPagar.fieldbyname('IDPATRO').asfloat;
          qryBeneficio.parambyname('IDPLANOPREV').asfloat:=
            qryRubricaPagar.fieldbyname('IDPLANOPREV').asfloat;
          qryBeneficio.parambyname('IDTITULAR').asfloat:=
            qryRubricaPagar.fieldbyname('IDTITULAR').asfloat;
          qryBeneficio.open;

          llnumeroprocesso:=0;
          llidbeneficio:=0;
          lldfloatpgto:=0;
          if not qryBeneficio.isempty then
          begin
            llnumeroprocesso:=qryBeneficio.fieldbyname('NUMEROPROCESSO').asinteger;
            llidbeneficio:=qryBeneficio.fieldbyname('IDBENEFICIO').asinteger;
            lldfloatpgto:=qryBeneficio.fieldbyname('DFLOATPAGTO').asinteger;
          end;
          qryNovoPagto.Locate('IDREFERENCIA;IDTITULAR;IDPESSOA',
                              vararrayof([qryRubricaPagar.fieldbyname('IDHSTFOLHABENEF').asinteger,
                              qryRubricaPagar.fieldbyname('IDTITULAR').asinteger,
                              qryRubricaPagar.fieldbyname('IDPESSOA').asinteger]), []);

          if CriaRecebedor(llnumeroprocesso,
               iidFundacao,
               qryRubricaPagar.fieldbyname('IDPATRO').asinteger,
               qryRubricaPagar.fieldbyname('IDPLANOPREV').asinteger,
               qryRubricaPagar.fieldbyname('IDTITULAR').asinteger,
               qryRecebedores.fieldbyname('IDPESSOA').asinteger,
               StrToInt(sIdLote), qryRubricaPagar.fieldbyname('NUMDEPIRRF').asinteger,
               qryRubricaPagar.fieldbyname('FLGISENTOIRRF').asinteger,
               1, 0, qryNovoPagto.fieldbyname('CODPORTFORMA').asinteger,
               lldfloatpgto,
               qryRubricaPagar.fieldbyname('IDPLANOPREV').asinteger, //IDPLANOORIGEM 
               qryRubricaPagar.fieldbyname('IDPLANOPREV').asinteger, //IDPLANOCONTABIL 
               qryRubricaPagar.fieldbyname('DATANASC').asdatetime,
               objRecebedor) then
          begin
            ifavcredito:=objRecebedor.iidresponsavel;

            objRecebedor.icodportforma:=ctrlBCP.DefinePortadorForma(
              objRecebedor.iidtitular,
              ifavcredito,
              objRecebedor.iidpatro,
              0,
              0,
              0,
              objRecebedor.icodportforma,
              0,
              numbco, numage, nomeag, numcta, tpconta, sidcbanc,
              lbpagtoelet,
              bDuplContaPref,
              objRecebedor.ifavdoc,
              rLiquidoTotal,
              objRecebedor.iseqdocumento,
              objPortResp);

	    if Assigned(objrecebedor) then
            begin
              while not qryRubricaPagar.eof do
              begin
                bincluirub:=SistemaFolha.FlgNaoRecalcIRPagPendente or
                  not IsRubricaIRRF(qryRubricaPagar.fieldbyname('IDRUBRICA').asinteger);

                if bincluirub then
                begin
                  if dtmContabil.PegaParamCF(
                        qryRubricaPagar.fieldbyname('IDPATRO').asinteger,
                        qryRubricaPagar.fieldbyname('IDPLANOPREV').asinteger,
                        qryRubricaPagar.fieldbyname('IDRUBRICA').asinteger,
                        qryRubricaPagar.fieldbyname('IDTITULAR').asinteger,
                        objRecebedor.iidresponsavel,
                        sMesPagamento, lRefCF) then
                  begin
                    if qryRubricaPagar.fieldbyname('FLGDESCONTO').asinteger = 0 then
                    begin
                      sPLACONTA:=lRefCF.PlaContaD;
                      iCODSUBCONTA:=lRefCF.SubConta;
                      sCODCENTROCUSTO:=lRefCF.CentroCustoD;
                    end
                    else
                    begin
                      sPLACONTA:=lRefCF.PlaContaC;
                      iCODSUBCONTA:=lRefCF.SubConta;
                      sCODCENTROCUSTO:=lRefCF.CentroCustoC;
                    end;
                  end;

                  If qryRubricaPagar.FieldByName('FLGTIPODESC').AsString = 'B' Then
                  Begin
                    BuscaBeneficio(llidbeneficio,
                                   qryRubricaPagar.fieldbyname('IDPATRO').asinteger,
                                   qryRubricaPagar.fieldbyname('IDPLANOPREV').asinteger,
                                   qryRubricaPagar.fieldbyname('IDHSTFOLHABENEF').asinteger,
                                   qryRubricaPagar.fieldbyname('IDTITULAR').asinteger,
                                   qryRubricaPagar.fieldbyname('IDRUBRICA').asinteger);
                  End
                  Else
                    llidBeneficio := 0;

		  if not objRecebedor.IdentificaInsereRubrica(
                           qryRubricaPagar.fieldbyname('IDPESSOA').asinteger,
                           qryRubricaPagar.fieldbyname('IDFAVORECIDO').asinteger, //INDICA O FAVORECIDO ORIGINAL PA
                           llidbeneficio,
                           qryRubricaPagar.fieldbyname('IDRUBRICA').asinteger,
                           qryRubricaPagar.fieldbyname('IDMOTIVO').asinteger,
                           0, 0, 0,
                           qryRubricaPagar.fieldbyname('FONTEPAGADORA').asinteger,
                           1, 0, 0, iidFundacao,
                           qryRubricaPagar.fieldbyname('FLGTIPODESC').asstring,
                           qryRubricaPagar.fieldbyname('VALORINFO').asfloat,
                           qryRubricaPagar.fieldbyname('VALORPROVENTO').asfloat,
                           0, Copy(qryRubricaPagar.ParamByName('IDTITULAR').AsString+
                                    ZD(IntToStr(iNumLotes),3),1,10),
                           qryRubricaPagar.fieldbyname('MES').asstring,
                           qryRubricaPagar.fieldbyname('CODIRRFDARF').asstring,
                           'P', lRefCF.CodTipRecDes, sCODCENTROCUSTO,
                           lRefCF.CentroRespon, inttostr(lRefCF.UnidNegoc),
                           sPlaConta,
                           '', '', 0, 0,
                           qryRubricaPagar.fieldbyname('LOTEORIGINAL').asinteger,
                           qryRubricaPagar.fieldbyname('IDHSTFOLHABENEF').asinteger,
                           qryRubricaPagar.fieldbyname('IDPLANOCONTABIL').asinteger 
                           ) then
                    frameProgresso.ExibeMensagem('Erro ao incluir rubrica.');
                end;
                qryRubricaPagar.next;
              end;
              objrecebedor.DeterminaBasesIRRF;
              
              if not SistemaFolha.FlgNaoRecalcIRPagPendente then
                objrecebedor.CalculoIRRF(smespagamento, dDataFolha,
                  qryRubricaPagar.fieldbyname('IDHSTFOLHABENEF').asinteger,0,'');
              objrecebedor.VerificaMargemDesconto;
              objrecebedor.EfetivaRubricas(qryRubricaGravar,
                smespagamento, dDataFolha);
            end;
          end;

          qryRecebedores.next;
          frameProgresso.Passo;
        end;
        bsemerro:=true;
      except
        on E:exception do
        begin
          bsemerro:=false;
          ShowMessage('Mensagem de erro : '+E.message);
        end;
      end;

      try
        frameProgresso.MarcaFinalFase('Geração da Prévia para os recebedores selecionados.');

        frameProgresso.ResetaFrame(1, qryNovoPagto.recordcount);
        frameProgresso.MarcaInicioFase('Acertando histórico de pagamentos estornados.');
        qryNovoPagto.disablecontrols;
        qryNovoPagto.first;
        while not qryNovoPagto.Eof do
        begin
          if not ExecutarQuery(qryAux, 'UPDATE HISTRUBSAL SET FLGESTORNO = 2' +
               ' WHERE IDHSTFOLHABENEF = '+inttostr(qryNovoPagto.fieldbyname('IDREFERENCIA').asinteger)+
               ' AND IDTITULAR = '+inttostr(qryNovoPagto.fieldbyname('IDTITULAR').asinteger)+
               ' AND IDRESPONSAVEL = '+inttostr(qryNovoPagto.fieldbyname('IDPESSOA').asinteger)) then
          begin
            frameProgresso.ExibeMensagem('Erro ao colocar pagamentos estornados como processados pela Prévia.');
            Exit;
          end;
          if not ExecutarQuery(qryAux, 'DELETE FROM LISTAFOLHABENEFDET'+
               ' WHERE IDLISTA = 0'+
               ' AND IDREFERENCIA = '+inttostr(qryNovoPagto.fieldbyname('IDREFERENCIA').asinteger)+
               ' AND IDTITULAR = '+inttostr(qryNovoPagto.fieldbyname('IDTITULAR').asinteger)+
               ' AND IDREFERENCIA3 = '+inttostr(qryNovoPagto.fieldbyname('IDPESSOA').asinteger)) then
          begin
            frameProgresso.ExibeMensagem('Erro ao eliminar pagamentos estornados da lista de processamento da Prévia.');
            Exit;
          end;
          qryNovoPagto.next;
          frameProgresso.Passo;
        end;
        qryNovoPagto.enablecontrols;
        frameProgresso.MarcaInicioFase('Acerto no histórico de pagamentos estornados.');

        frameProgresso.ResetaFrame(1, 2);
        frameProgresso.MarcaInicioFase('Atualização da Prévia.');
        frameProgresso.Passo;
        frameProgresso.MarcaFinalFase('Atualização da Prévia.');
        bsemerro:=true;
      except
        on E:exception do
        begin
          bsemerro:=false;
          ShowMessage('Mensagem de erro : '+E.message);
        end;
      end;
    finally
      if not bsemerro then
      begin
        frameProgresso.Terminar('Prévia de Pagamento Pendente interropida com erro.', true);
        dtmbasedados.dbBaseDados.Rollback;
      end
      else
      begin
        frameProgresso.Terminar('Término Prévia de Pagamento Pendente com sucesso.', true);
        dtmbasedados.dbBaseDados.Commit;
      end;
      Consulta;
    end;
  end
  else
    MsgDlg('Nenhum pagamento para ser processado.','Aviso',mtWarning,[mbOk,mbHelp],0);
end;

procedure TfrmPagamentoPendente.dbgrpagamentospendentesEnter(Sender: TObject);
begin
  inherited;
  qryRubricasRecebedor.datasource:=dsPagtoPendente;
end;

procedure TfrmPagamentoPendente.dbgrnovospagamentosEnter(Sender: TObject);
begin
  inherited;
  qryRubricasRecebedor.datasource:=dsNovoPagto;
end;

procedure TfrmPagamentoPendente.cmbMesChange(Sender: TObject);
begin
  inherited;
  PegaAnoMesCobranca;
end;

procedure TfrmPagamentoPendente.spnedAnoChange(Sender: TObject);
begin
  inherited;
  PegaAnoMesCobranca;
end;

procedure TfrmPagamentoPendente.dblkLoteCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
var lsmsg: string;  
begin
  inherited;
  if not SistemaFolha.FlgNaoRecalcIRPagPendente then
    if not VerificaRubricasIR(qryAux, lsmsg) then
    begin
      MsgDlg(
        'Foram identificados problemas de cadastro em algumas rubricas de IR.'+#13#10+
        'Favor verificar o LOG abaixo e efetuar o acerto no Cadastro de Rubricas.'+#13#10+
        '---------------------------------------------------------------'+#13#10+
        'ANÁLISE DO CADASTRO DE RUBRICAS PARA IR.'+#13#10+
        '---------------------------------------------------------------'+#13#10+
        lsmsg+#13#10+
        '---------------------------------------------------------------'+#13#10,
        'Erro', mtError, [mbOk, mbHelp], 0);
      exit;
    end;

  If Trim(dblklote.Text) <> '' Then
  Begin
    sIdLote             := '';
    lbDescricao.Caption := '';
    lbDataFolha.Caption := '';
    With qryLotes do
    Begin
      If Not IsEmpty then
      begin
        sIdLote             := FieldByName('IDLOTE').AsString;
        lbDescricao.Caption := FieldByName('DESCRICAO').AsString;
        lbDataFolha.Caption := FieldByName('DATAPAGAMENTO').AsString;
      end; {With}
    End;
    If (rdbBuscaTodos.Checked) or (rdbIndividual.Checked) Then
    Begin
      Consulta;  
      (* Se Informações do Lote corretas então mostra PageControlPag *)
      PageControlPag.Visible:=LoteValido;
    End;
  End;
end;

procedure TfrmPagamentoPendente.rdbBuscaTodosClick(Sender: TObject);
begin
  inherited;
  lbMatricula.Caption    := '';
  rdbIndividual.Checked  := False;
  btnProcurar.Enabled    := False;
  lbMatricula.Enabled    := False;
  PageControlPag.Visible := LoteValido;
  Consulta;
end;

procedure TfrmPagamentoPendente.rdbIndividualClick(Sender: TObject);
begin
  inherited;
  rdbBuscaTodos.Checked  := False;
  btnProcurar.Enabled    := True;
  lbMatricula.Enabled    := True;
  PageControlPag.Visible := False;
end;

procedure TfrmPagamentoPendente.btnProcurarClick(Sender: TObject);
begin
  inherited;
  If (Not qryNovoPagto.IsEmpty) And (fcsbbtnPrevia.Enabled) Then
  Begin
    if MsgDlg('Atenção! As informações não foram processadas para o recebedor '+
            #13+qryNovoPagto.FieldByName('NOME').AsString+'.  Deseja Continuar? ','Confirmacão!',
                mtConfirmation,[mbYes,mbNo],0) = mrNo then
      Exit;

    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.SQL.Add('DELETE LISTAFOLHABENEFDET WHERE IDLISTA = 0');
    qryAux.ExecSQL;
    Consulta;
  End;

  lbMatricula.Caption := '';
  MontaSelect.Executar;
  If MontaSelect.RetornouValor Then
  Begin
    lbMatricula.Caption    := MontaSelect.ValoresChave[0]+' - '+MontaSelect.ValoresChave[5];
    PageControlPag.Visible := LoteValido;
    Consulta;
  End;
end;

procedure TfrmPagamentoPendente.MontaQueryPagtoPend;
var ssql: string;
begin
  ssql:=
    'SELECT DISTINCT '+#13#10+
    '  H.CODPORTFORMA, '+#13#10+
    '  E.MATRICULA, '+#13#10+
    '  H.MESCOBRANCA, '+#13#10+
    '  H.IDTITULAR, '+#13#10+
    '  H.IDRESPONSAVEL AS IDPESSOA, '+#13#10+
    '  H.IDHSTFOLHABENEF AS IDREFERENCIA, '+#13#10+
    '  P.NOME '+#13#10+
    'FROM '+#13#10+
    '  HISTRUBSAL H, '+#13#10+
    '  ELEGPATRO E, '+#13#10+
    '  PESSOA P '+#13#10+
    'WHERE '+#13#10+
    '      H.FLGESTORNO = 1 '+#13#10+
    '  AND H.IDMODULO = 18 '+#13#10+
    '  AND H.IDHSTFOLHABENEF IS NOT NULL '+#13#10+
    '  AND NOT EXISTS (SELECT 1 '+#13#10+
    '                  FROM LISTAFOLHABENEFDET L '+#13#10+
    '                  WHERE L.IDLISTA = 0 '+#13#10+
    '                  AND L.IDREFERENCIA = H.IDHSTFOLHABENEF '+#13#10+
    '                  AND L.IDTITULAR = H.IDTITULAR '+#13#10+
    '                  AND L.IDREFERENCIA3 = H.IDRESPONSAVEL) '+#13#10+
    '  AND E.IDPESSJUR = H.IDPATRO '+#13#10+
    '  AND E.IDPESSOA = H.IDTITULAR '+#13#10+
    '  AND P.IDPESSOA = H.IDRESPONSAVEL '+#13#10;

  If (rdbIndividual.Checked) And (Trim(lbMatricula.Caption) <> '') Then
    ssql:=ssql+
      '  AND E.MATRICULA = '+QuotedStr(MontaSelect.ValoresChave[0])+#13#10;

  ssql:=ssql+
    'ORDER BY E.MATRICULA, P.NOME, H.IDHSTFOLHABENEF ';

  qryPagtoPendente.Close;
  qryPagtoPendente.Sql.Clear;
  qryPagtoPendente.SQL.Add(ssql);
  qryPagtoPendente.Open;
end;

procedure TfrmPagamentoPendente.InsereNovoPagto;
begin
  if Not ExecutarQuery(qryAux, 'INSERT INTO LISTAFOLHABENEFDET '+
      '(IDLISTA, IDTITULAR, IDPESSOA, IDREFERENCIA, IDREFERENCIA2, '+
       'IDREFERENCIA3'+
       ') VALUES (0, '+
      inttostr(qryPagtoPendente.fieldbyname('idtitular').asinteger)+','+
      inttostr(qryNovoRecebedor.fieldbyname('idpessoa').asinteger)+','+
      inttostr(qryPagtoPendente.fieldbyname('idreferencia').asinteger)+','+
      inttostr(qryPortadorForma.fieldbyname('codportforma').asinteger)+','+
      inttostr(qryPagtoPendente.fieldbyname('idpessoa').asinteger)+ 
      ')') then
    MsgDlg('Erro ao INCLUIR novo pagamento de recebedor.', 'Aviso', mtWarning,
           [mbOk, mbHelp], 0);
end;

procedure TfrmPagamentoPendente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryPortadorForma.Close; 
  ctrlBCP.free; 
end;

procedure TfrmPagamentoPendente.dbgrnovospagamentosColExit(
  Sender: TObject);
begin
  inherited;
  If Trim(dblkPortadorForma.Text) <> '' Then
  Begin
    qryNovoPagto.Edit; 
    qryNovoPagtoCODPORTFORMA.AsInteger := qryPortadorForma.FieldByName('CODPORTFORMA').AsInteger;
    qryNovoPagtoDESCRICAO.AsString     := qryPortadorForma.FieldByName('DESCRICAO').AsString;
    qryNovoPagto.Post; 
  End;
end;

procedure TfrmPagamentoPendente.bbtnSairClick(Sender: TObject);
begin
  If (Not qryNovoPagto.IsEmpty) And (fcsbbtnPrevia.Enabled) Then
  Begin
    if MsgDlg('Atenção! As informações não foram processadas para o recebedor '+
            #13+qryNovoPagto.FieldByName('NOME').AsString+'.  Deseja Continuar? ','Confirmacão!',
                mtConfirmation,[mbYes,mbNo],0) = mrNo then
      Exit;

    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.SQL.Add('DELETE LISTAFOLHABENEFDET WHERE IDLISTA = 0');
    qryAux.ExecSQL;
  End;
  inherited;
end;

procedure TfrmPagamentoPendente.qryPagtoPendenteAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  qryBuscaPortador.Close;
  qryBuscaPortador.ParamByName('MATRICULA').AsString := qryPagtoPendente.FieldByName('MATRICULA').AsString;
  qryBuscaPortador.Open;
  if qryPortadorForma.Locate('CODPORTFORMA', qryBuscaPortador.FieldByName('CODPORTFORMA').AsInteger, []) then
    dblkPortadorForma.Text := qryPortadorForma.FieldByName('DESCRICAO').AsString
  else
    dblkPortadorForma.Text := '';
 
  qryNovoRecebedor.Close;
  qryNovoRecebedor.ParamByName('PIDTITULAR').asinteger :=
    qryPagtoPendente.FieldByName('IDTITULAR').asinteger;
  qryNovoRecebedor.Open;
  qryNovoRecebedor.locate('IDPESSOA',
    qryPagtoPendente.FieldByName('IDPESSOA').asinteger, []);
  cmbRecebedor.text:=
    qryNovoRecebedor.FieldByName('NOME').asstring;
end;

procedure TfrmPagamentoPendente.BuscaBeneficio(Var pIdBeneficio: Integer;
          pIdPessjur, pIdPlanoPrev, pIdHstFolhaBenef, pIdTitular, pIdRubrica : Integer);
Var
  qryAux : TwwQuery;

begin
  qryAux := TwwQuery.Create(Application);
  qryAux.DatabaseName := 'BaseDados';
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT DISTINCT H.NUMEROPROCESSO, BP.IDBENEFICIO, '+
                 ' H.CODPORTFORMA, B.DFLOATPAGTO '+
                 ' FROM HSTBENEFBFCIARIO H, BENEFBFCIARIO B, BENEFPLANPREV BP '+
                 ' WHERE H.IDHSTFOLHABENEF IS NOT NULL '+
                 '   AND H.IDPESSJUR            = '+IntToStr(pIdPessJur)+
                 '   AND H.IDPLANOPREV          = '+IntToStr(pIdPlanoPrev)+
                 '   AND H.IDTITULAR            = '+IntToStr(pIdTitular)+
                 '   AND B.NUMEROPROCESSO       = H.NUMEROPROCESSO '+
                 '   AND B.IDPESSJUR            = H.IDPESSJUR '+
                 '   AND B.IDPLANOPREV          = H.IDPLANOPREV '+
                 '   AND B.IDTITULAR            = H.IDTITULAR '+
                 '   AND B.IDPESSOA             = H.IDPESSOA '+
                 '   AND H.IDPLANOPREV          = BP.IDPLANOPREV '+
                 '   AND H.IDBENEFICIO          = BP.IDBENEFICIO '+ 
                 '   AND (BP.IDRUBRICA          = '+IntToStr(pIdRubrica)+' OR '+
                 '        BP.IDRUBRICAATRASO    = '+IntToStr(pIdRubrica)+' OR '+
                 '        BP.IDRUBABONO         = '+IntToStr(pIdRubrica)+' OR '+
                 '        BP.IDRUBABONOFIM      = '+IntToStr(pIdRubrica)+' OR '+
                 '        BP.IDRUBDEVOLUCAO     = '+IntToStr(pIdRubrica)+' OR '+
                 '        BP.IDRUBRICADIF       = '+IntToStr(pIdRubrica)+' OR '+
                 '        BP.IDRUBRICACORRECAO  = '+IntToStr(pIdRubrica)+' OR '+
                 '        BP.IDRUBRICAREVISAO   = '+IntToStr(pIdRubrica)+' OR '+
                 '        BP.IDRUBANTECABONO    = '+IntToStr(pIdRubrica)+' OR '+
                 '        BP.IDRUBDEVOLABONO    = '+IntToStr(pIdRubrica)+' OR '+
                 '        BP.IDRUBDEVOLADIANT   = '+IntToStr(pIdRubrica)+' OR '+
                 '        BP.IDRUBADIANT        = '+IntToStr(pIdRubrica)+' OR '+
                 '        BP.IDRUBADIANT13      = '+IntToStr(pIdRubrica)+' OR '+
                 '        BP.IDRUBDEVADIANT13   = '+IntToStr(pIdRubrica)+' OR '+
                 '        BP.IDRUBATRACJUD      = '+IntToStr(pIdRubrica)+' OR '+
                 '        BP.IDRUBDEVACJUD      = '+IntToStr(pIdRubrica)+' OR '+
                 '        BP.IDRUBREVACJUD      = '+IntToStr(pIdRubrica)+' OR '+
                 '        BP.IDRUBADTACJUD      = '+IntToStr(pIdRubrica)+' OR '+
                 '        BP.IDRUBACJUD         = '+IntToStr(pIdRubrica)+' OR '+
                 '        BP.IDRUBDADACJUD      = '+IntToStr(pIdRubrica)+' OR '+
                 '        BP.IDRUB13ACJUD       = '+IntToStr(pIdRubrica)+' OR '+
                 '        BP.IDRUB13DESACJUD    = '+IntToStr(pIdRubrica)+' OR '+
                 '        BP.IDRUB13PGAN1ACJUD  = '+IntToStr(pIdRubrica)+' OR '+
                 '        BP.IDRUB13DVANACJUD   = '+IntToStr(pIdRubrica)+' OR '+
                 '        BP.IDRUB13ADTACJUD    = '+IntToStr(pIdRubrica)+' OR '+
                 '        BP.IDRUB13DADACJUD    = '+IntToStr(pIdRubrica)+' OR '+
                 '        BP.IDRUBDESCANTECAB   = '+IntToStr(pIdRubrica)+')');
  qryAux.Open;
  If Not qryAux.IsEmpty Then
    pIdBeneficio := qryAux.FieldByName('IDBENEFICIO').AsInteger
  Else
    pIdBeneficio := 0;
  qryAux.Close;  
  qryAux.Free;  
end;

end.
{------------------------------------------------------------------------------|
| UNIT: FPAGAMENTOPENDENTE                                                     |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   PROCESSA A PREVIA DE PAGAMENTOS QUE FORAM ESTORNADOS COMO PENDENTES.       |
| FUNCIONALIDADES:                                                             |
| - GRAVAR PREVIA A PARTIR DA HISTRUBSAL DO PAGAMENTO PENDENTE.                |
| - GERA RUBRICA DE IRRF.                                                      |
| - COLOCA A SITUAÇÃO DO PAGAMENTO PENDENTE COM EM PREVIA.                     |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE 12/04/2002 A 12/04/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12i                                              |
| CLIENTE: CBS E REFER                                                         |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ACERTO PARA IDENTIFICAR O PROCESSO DE BENEFÍCIO ORIGINAL DA VERSÃO QUE     |
| FICOU PENDENTE DE PAGAMENTO. QUERY QRYBENEFICIO ALTERADA PARA IDENTIFICAR    |
| CORRETAMENTE O PROCESSO.                                                     |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: SIDNEI B. MARINS.                                             |
| PERÍODO DE IMPLEMENTAÇÃO: DE 25/06/2002 A 25/06/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: ()                                                                  |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Modificação na tela, Modificaçao do uso da       |
|                              CtrlInterface.                                  |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei B Marins.                                              |
| PERÍODO DE IMPLEMENTAÇÃO: DE 18/07/2002 A 18/07/2002.                        |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: FUNCEF  - Pendencia 7664.                                           |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Modificação para exibir código/descrição externa |
|  conforme a parametrização na tabela PARAMAPREV.                             |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 22/10/2002 A 22/10/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (REFER)                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - Foi colocado a procedure consulta no envento CloseUp do componente      |
|    dblkLote.                                                                 |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei de Brito Marins.                                       |
| PERÍODO DE IMPLEMENTAÇÃO: DE 02/01/2003 A 02/01/2003.                        |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (CBS) - Pendência 11157.                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Gravar o campo "Referencia" na tabela prévia do  |
|   modo em que é gravado na rotina de prévia normal.                          |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 11/02/2003 A 11/02/2003                         |
| VERSÃO PARA LIBERAÇÃO: 3.03.03c                                              |
| CLIENTE: REFER                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - PENDENCIA 11369 - NÃO MOSTRAVA OS OUTROS RECEBEDORES NO GRID DA DIREITA    |
| APÓS A SELEÇÃO DE UM DESTES PARA O GRID DA ESQUERDA                          |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 12/08/2003 A 12/08/2003                         |
| PENDÊNCIA: 13995                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.01b                                              |
| CLIENTE: REFER                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ADAPTAR PARA USAR OBJETO DE IRRF CUSTOMIZADO PARA TABELA DE IR HISTÓRICA.  |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 03/05/2004 A 03/05/2004                         |
| PENDÊNCIA: 16730                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.11D                                              |
| CLIENTE: REFER                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| ALTERAÇÃO NO CONTROLE DE ERRO NA GERAÇÃO DA PREVIA.                          |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 05/05/2004 A 05/05/2004                         |
| PENDÊNCIA: 16163                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.11D                                              |
| CLIENTE: CBS                                                                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| NÃO RECALCULAR IR NA PREVIA DE PAGTO PENDENTE SE PARAMETRIZADO. USA O IR ORI-|
| GINAL.                                                                       |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 28/08/2004 A 28/08/2004                         |
| PENDÊNCIA: 17803                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| Não utilizar mais CMINTBANCO em 2 camadas e substituir a unit uString pela   |
| uBiblioteca.                                                                 |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 31/01/2005 A 31/01/2005                         |
| PENDÊNCIA: verificada no teste da pendencia 18579                            |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: REFER                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - CLAUSULA RETIRADA DO MONTASELECT, PORQUE PESSOAS SELECIONADAS PARA EXECUTAR|
| PREVIA, SEM TER SIDO PROCESSADA, JÁ ESTÃO NA LISTA ZERO, MAS A PREVIA NÃO FOI|
| GERADA.                                                                      |
| "NOT EXISTS (SELECT 1 FROM LISTAFOLHABENEFDET L                              |
|              WHERE L.IDLISTA = 0 AND L.IDREFERENCIA = H.IDHSTFOLHABENEF      |
|              AND L.IDTITULAR = H.IDTITULAR AND L.IDPESSOA = H.IDRESPONSAVEL)"|
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| PENDÊNCIA:                                                                   |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------}

