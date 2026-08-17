(*******************************************************************************
 - Atualizado em 10/10/2000
   Correção na retenção de Impostos\Agregados. Passou a ser calculada somente na efetivação
   do lote. Não é mais exibido o valor do cálculo do imposto por ser inconsistente
   para impostos do tipo "acumula mês" uma vez que o valor base para referência do
   "acumula mês" não pode ser calculado;
   Exclusão da consulta de parâmetros do CapCar. Os valores acessados estão na
   integra back;
   Otimização do Código;
*******************************************************************************)

unit FGeraLotePgto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOKCancelar, StdCtrls, wwdblook, ComCtrls, ExtCtrls, MAHlpBtn, Buttons,
  ToolWin, Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery,
  Wwdatsrc, DBCtrls,Usistema,Udocumento,UAutorizacao, DBaseDados, TB97, FSairAjuda, TB97Tlbr, MontaSelect, IvDictio,
  IvMulti, IvEMulti, uIntegraBack, CMProcuraSubTipo, FProcuraCliForDlg,
  TREdit, uCtrlImpostoRetido, CMDBLookupCombo, wwdbdatetimepicker,
  CMDateTimePicker, uMensErro;

CONST
   DESCNUMLOTE = 'Nº do Lote Gerado: ';
   DESCVALLOTE = 'Valor total do Lote: ';
   DESCDATLOTE = 'Data de Emissão do Lote: ';

type
  TfrmGeraLotePgto = class(TFrmProcuraCliForDlg)
    dsDocPendentes: TwwDataSource;
    qryDocPendentes: TwwQuery;
    Panel2: TPanel;
    Panel3: TPanel;
    dbgrdLotePagto: TwwDBGrid;
    qryDocPendentesCODDOCUMENTO: TFloatField;
    qryDocPendentesIDPESSOA: TFloatField;
    qryDocPendentesNODOCUMENTO: TFloatField;
    qryDocPendentesCOMPLDOCUMENTO: TStringField;
    qryDocPendentesDATAPROGRAMADA: TDateTimeField;
    qryDocPendentesDATAVENCTO: TDateTimeField;
    qryDocPendentesNOME: TStringField;
    qryDocPendentesDOCUMENTO: TStringField;
    qryDocPendentesRECPAG: TStringField;
    dsLoteXDocum: TwwDataSource;
    qryLoteXDocumento: TwwQuery;
    qryLoteXDocumentoCODDOCUMENTO: TFloatField;
    qryLoteXDocumentoVALOR: TFloatField;
    qryLoteXDocumentoNOME: TStringField;
    qryLoteXDocumentoDATAPROGRAMADA: TDateTimeField;
    qryLoteXDocumentoDATAVENCTO: TDateTimeField;
    qryLoteXDocumentoNODOCUMENTO: TFloatField;
    qryLoteXDocumentoCOMPLDOCUMENTO: TStringField;
    qryLoteXDocumentoDOCUMENTO: TStringField;
    updsqlLoteXDocumento: TUpdateSQL;
    qryDescPortadorForma: TwwQuery;
    qryDocPendentesSTATUS: TStringField;
    dsLotePagto: TwwDataSource;
    qryLotePagto: TwwQuery;
    qryLotePagtoNUMLOTE: TFloatField;
    qryLotePagtoCODPORTFORMA: TFloatField;
    qryLotePagtoDATAEMISSAO: TDateTimeField;
    qryLotePagtoNUMCHQBORDERO: TStringField;
    qryLotePagtoFAVORECIDO: TStringField;
    qryLotePagtoFLAGEMISSAO: TStringField;
    qryLotePagtoFLAGCANCEL: TStringField;
    qryLotePagtoOBSERVACAO: TStringField;
    updsqlLotePagto: TUpdateSQL;
    qryLoteXDocumentoNUMLOTE: TFloatField;
    updsqlDocPendentes: TUpdateSQL;
    qryDocPendentesSALDO: TFloatField;
    qryDocPendentesIDFORCLI: TFloatField;
    qryDescPortadorFormaCODPORTFORMA: TFloatField;
    Memo1: TMemo;
    qryLotePagtoIDPESSOA: TFloatField;
    qryLotePagtoIDUSUARIOINCLUSAO: TFloatField;
    qryDocPendentesOPERACAO: TStringField;
    qryAux: TwwQuery;
    qryDescPortadorFormaIDTEMPLCHEQUE: TFloatField;
    qryDescPortadorFormaDESCRICAO: TStringField;
    qryDescPortadorFormaRAZAOSOCIAL: TStringField;
    Pnldocpago: TPanel;
    Panel10: TPanel;
    bbtnDesfazPgto: TBitBtn;
    bbtnCriaLote: TBitBtn;
    bbtnFavorecido: TBitBtn;
    bbtnObs: TBitBtn;
    SbLote: TStatusBar;
    qryDescPortadorFormaCODFORMA: TFloatField;
    qryDocPendentesNUMLEITCODBARRAS: TStringField;
    qryDocPendentesNUMDIGCODBARRAS: TStringField;
    qryLoteXDocumentoCODBARRA: TStringField;
    qryLoteXDocumentoCODBARRAVALOR: TStringField;
    PgLote: TPageControl;
    TbsParametros: TTabSheet;
    TbsDocumentos: TTabSheet;
    Panel1: TPanel;
    Panel5: TPanel;
    dbgrdDocPendentes: TwwDBGrid;
    Panel9: TPanel;
    bbtnPgto: TBitBtn;
    bbtnPgtoParcial: TBitBtn;
    PnlDocPendentes: TPanel;
    bbtnSelecionaDoc: TBitBtn;
    GpFormaPag: TGroupBox;
    dblkcmbDescricao: TwwDBLookupCombo;
    GpDataProg: TGroupBox;
    DtIni: TCMDateTimePicker;
    DtFim: TCMDateTimePicker;
    GpDocumento: TGroupBox;
    EdtNumDoc: TRealEdit;
    EdtCompl: TEdit;
    Label1: TLabel;
    GpFiltro: TGroupBox;
    CkbSelDoc: TCheckBox;
    CkbPortForma: TCheckBox;
    qryLoteXDocumentoOPERACAO: TStringField;
    qryLoteXDocumentoIDFORCLI: TFloatField;
    qryLotePagtoIDPROCESSO: TFloatField;
    qryDescPortadorFormaFLGCHEQUEDIFERIDO: TStringField;
    qryLotePagtoDATADIFERIDO: TDateTimeField;
    QryNumlancto: TwwQuery;
    QryNumlanctoNUMLANCTO: TFloatField;
    QryNumlanctoDEBCRE: TStringField;
    Splitter1: TSplitter;
    QryFormadePagto: TwwQuery;
    QryFormaPagDESCRICAO: TStringField;
    QryFormaPagCODFORMA: TFloatField;
    QryFormaPagRECPAG: TStringField;
    qryseladiantpendent: TwwQuery;
    qryLoteXDocumentoIDPESSOA: TFloatField;
    qryLoteXDocumentoVLRLIQUIDO: TFloatField;
    qryDocPendentesVLRLIQUIDO: TFloatField;
    LblFormaTipo: TLabel;
    DblCodForma: TwwDBLookupCombo;
    QryModulos: TwwQuery;
    QryModulosNOMEMODULO: TStringField;
    QryModulosIDMODULO: TFloatField;
    CkbAutorPag: TCheckBox;
    Label2: TLabel;
    CmbSisOrigem: TCMDBLookupCombo;
    Label3: TLabel;
    CmbTipoDocRecPag: TCMDBLookupCombo;
    QryTipoDocRecPag: TwwQuery;
    QryTipoDocRecPagCODTIPDOC: TFloatField;
    QryTipoDocRecPagDESCRICAO: TStringField;
    SbStatusSelecao: TStatusBar;
    qryDescPortadorFormaFLGOBRIGAFAV: TStringField;
    QrySaldoLoteNaoEmitido: TwwQuery;
    QrySaldoLoteNaoEmitidoVALORLOTE: TFloatField;
    CkbCPMF: TCheckBox;
    qryRateio: TwwQuery;
    procedure qryDocPendentesCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure qryLoteXDocumentoCalcFields(DataSet: TDataSet);
    procedure bbtnPgtoClick(Sender: TObject);
    procedure dbgrdDocPendentesMultiSelectRecord(Grid: TwwDBGrid;
      Selecting: Boolean; var Accept: Boolean);
    procedure bbtnPgtoParcialClick(Sender: TObject);
    procedure bbtnDesfazPgtoClick(Sender: TObject);
    procedure bbtnCriaLoteClick(Sender: TObject);
    procedure bbtnSelecionaDocClick(Sender: TObject);
    procedure dbgrdDocPendentesCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    procedure bbtnFavorecidoClick(Sender: TObject);
    procedure bbtnObsClick(Sender: TObject);
    procedure dblkcmbDescricaoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure PgLoteChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     bMontaQuery: Boolean;
     Sadiantapag, Sadiantarec: string;
     ImpostoRetidoLote: TCtrlImpostoRetido;
     rSumValor: Double;
     lista: tstringlist;
     iNumSeqLote: real;
     rTotalLote: real ;
     bLoteSendoGerado: boolean;
     iSeqDisperdicado: real;
     sSql, sfavorecido, sobservacao: string;

     function verifica_adianto(idocumento:integer):boolean;
     Function TestaLotexDocum(iCodDoc:Integer):Boolean;
     Procedure MontaQryVazia(bLimpaDocPendentes:Boolean);
     Procedure GetNumLancto(iCodDocumento :Integer; Var iNumLancto :Integer; Var sDebCre :String);
     function  SequenciaTabela(TabelaDeSequencia:string;var iSeqDisperdicado:real):real;
     procedure CalculaSaldos;
     procedure DesabilitaLote;
     procedure AbreLote;
     procedure InsereDoc(sTipoPgto:string;rValorPago:real);
     procedure VerificaFornecedor(destroi : boolean);
  public

  end;

var
  frmGeraLotePgto: TfrmGeraLotePgto;

implementation

Uses UDataBase, UFuncaoGeral, UModulo, uRAD, DRad, uCMDialogs, uCtrlPadroes, uCtrlParamIntegra;

{$R *.DFM}

function  TfrmGeraLotePgto.SequenciaTabela(TabelaDeSequencia:string;
                                          var iSeqDisperdicado:real):real;
var
  iNumSeq      : real;
begin
   if iSeqDisperdicado=0 then
   begin
     iNumSeq := LeUltRegistro(nil,'LOTEPAGTO');
     iSeqDisperdicado:=iNumSeq;
   end
   else
       iNumSeq:=iSeqDisperdicado;

   SequenciaTabela:=iNumSeq;
end;

procedure TfrmGeraLotePgto.CalculaSaldos;
var
   icodigo :integer;
   rsaldo,rSemuso :Real;
   fTotalPend :Double;
   iContreg :Integer;
begin
  iContreg := 0;
  fTotalPend := 0;

  qryDocPendentes.first;
  while not(qryDocPendentes.EOF) do
    begin
     rSaldo:=0;
     icodigo:=qryDocPendentesCODDOCUMENTO.Asinteger;
     Documento.Saldo.GetSaldoDoc(icodigo,'',IntegraBack.RecPag,rSaldo,rSemUso);

     //verifica se o documento pendente está selecionado atribuindo ao saldo a diferença do valor
     //do documento e do valor selecionado
     if qryLoteXDocumento.Locate('CODDOCUMENTO',qryDocPendentesCODDOCUMENTO.Asinteger,[]) then
        rSaldo:=rSaldo-qryLoteXDocumentoVALOR.AsFloat;

     //20/10/2000 INICIO - PERMITIR CRIAR VÁRIOS PAGAMENTOS PARCIAIS DO MESMO DOCUMENTO
     //verifica se o documento está contido em outro lote nao emitido e diminui do saldo do mesmo
     With QrySaldoLoteNaoEmitido Do
     Begin
        If Active Then Close;
        If Not Prepared Then Prepare;
        Params[0].AsFloat := qryDocPendentesCODDOCUMENTO.Asinteger;
        Open;
        If Not IsEmpty Then
           rSaldo := rSaldo - Fields[0].AsFloat;
        Close;
     End;
     //20/10/2000 FIM - PERMITIR CRIAR VÁRIOS PAGAMENTOS PARCIAIS DO MESMO DOCUMENTO

     //Se houver saldo o documento recebe o valor calcula
     If Format('%17.2f',[rSaldo]) <> Format('%17.2f',[Modulo.ValorZero]) Then
       begin
        qryDocPendentes.edit;
        qryDocPendentesSALDO.AsFloat:=rSaldo;
        qryDocPendentes.post;
        Inc(iContreg);
        fTotalPend := fTotalPend + rSaldo;
        qryDocPendentes.Next;
       end
     else
        qryDocPendentes.Delete;
  end;
  qryDocPendentes.first;

  SbStatusSelecao.Panels[0].Text := 'Documetos pendentes: ' + IntToStr(iContreg);
  SbStatusSelecao.Panels[1].Text := 'Valor total da seleção: ' + FloatToStrF(fTotalPend,ffCurrency,17,2);
end;

procedure TfrmGeraLotePgto.DesabilitaLote;
begin
  sbLote.Panels[0].Text := DESCNUMLOTE;
  sbLote.Panels[1].Text := DESCVALLOTE;
  sbLote.Panels[2].Text := DESCDATLOTE;

  bbtnObs.Enabled:=False;
  sObservacao:='';
  sFavorecido:='';
  bbtnFavorecido.Enabled:=False;
  bbtnObs.Enabled:=False;
  bLoteSendoGerado := False;
end;

procedure TfrmGeraLotePgto.AbreLote;
begin
  If qryDocPendentes.IsEmpty Then Exit;

  rTotalLote:=0;
  bbtnDesfazPgto.Enabled:=True;

  qryLotePagto.Insert;
  qryLotePagtoDATAEMISSAO.AsDateTime:=Date;

  iNumSeqLote:= SequenciaTabela('SEQLOTEPAGTO',iSeqDisperdicado);

  qryLotePagtoNUMLOTE.Value:=iNumSeqLote;
  qryLotePagtoOBSERVACAO.asstring:=sObservacao;
  qryLotePagtoFAVORECIDO.asstring:=sFavorecido;
  qryLotePagtoIDUSUARIOINCLUSAO.Asinteger := Sistema.idUsuario;
  qryLotePagtoIDPESSOA.Asinteger:= Sistema.IDEmpresa;

  qryLotePagtoFLAGCANCEL.Asstring:= '';


  SbLote.Panels[0].Text := DESCNUMLOTE + FloatToStr(iNumSeqLote) ;
  SbLote.Panels[2].Text := DESCDATLOTE + DatetoStr(Date);

  bLoteSendoGerado:=true;
  bbtnObs.Enabled:=true;
  bbtnFavorecido.Enabled:=true;
end;


procedure TfrmGeraLotePgto.InsereDoc(sTipoPgto:string;rValorPago:real);
var
   i :integer;
   rValorCorrente :real;
   bFazPostLote :boolean;
   bignora      :boolean;
begin
   if ((sTipoPgto='PgtoParcial') or (sTipoPgto='PgtoTotal')) then
   begin
      Try
         qryDocPendentes.DisableControls;
         qryLoteXDocumento.DisableControls;

         for i:=0 to (dbgrdDocPendentes.SelectedList.count-1) do
         begin
           dbgrdDocPendentes.datasource.dataset.GotoBookmark(dbgrdDocPendentes.SelectedList.items[i]);
           dbgrdDocPendentes.datasource.dataset.FreeBookmark(dbgrdDocPendentes.SelectedList.items[i]);
           if not(qryLoteXDocumento.locate('CODDOCUMENTO',
                                qryDocPendentesCODDOCUMENTO.Asinteger,[])) AND
                   ((qrydocpendentesOPERACAO.AsString = '14') and
                    (IntegraBack.Contabilidade = 'S')  and
                    (verifica_adianto(qrydocpendentesCODDOCUMENTO.AsInteger))) or
                   ((qrydocpendentesOPERACAO.AsString <> '14') or
                   (IntegraBack.Contabilidade <> 'S'))

           then
           begin // documento nao existe no lote
               bignora := false;
               qryLoteXDocumento.insert; // insere na Consulta detalhe LoteXDocum
               qryLoteXDocumentoCODDOCUMENTO.Asinteger    := qryDocPendentesCODDOCUMENTO.Asinteger;
               qryLoteXDocumentoNUMLOTE.Value             := iNumSeqLote;
               qryLoteXDocumentoNOME.Asstring             := qryDocPendentesNOME.Asstring;
               qryLoteXDocumentoNODOCUMENTO.Asstring      := qryDocPendentesNODOCUMENTO.Asstring;
               qryLoteXDocumentoCOMPLDOCUMENTO.Asstring   := qryDocPendentesCOMPLDOCUMENTO.Asstring;
               qryLoteXDocumentoDATAPROGRAMADA.Asdatetime := qryDocPendentesDATAPROGRAMADA.Asdatetime;
               qryLoteXDocumentoDATAVENCTO.Asdatetime     := qryDocPendentesDATAVENCTO.Asdatetime;
               qryLoteXDocumentoCODBARRAVALOR.AsString    := qryDocPendentesNUMDIGCODBARRAS.AsString;
               qryLoteXDocumentoCODBARRA.AsString         := qryDocPendentesNUMLEITCODBARRAS.AsString;
               qryLoteXDocumentoOPERACAO.AsString         := qryDocPendentesOPERACAO.AsString;
               qryLoteXDocumentoIDFORCLI.AsInteger        := qryDocPendentesIDFORCLI.AsInteger;
               qryLoteXDocumentoVLRLIQUIDO.AsFloat        := qryDocPendentesVLRLIQUIDO.AsFloat;
               rValorCorrente:=0;
               bFazPostLote:=False;
           end
           else
           begin  // documento ja existe no lote
              bignora := true;
              qryLoteXDocumento.edit;
              rValorcorrente:=qryLoteXDocumentoVALOR.asfloat;
              bFazPostLote:=true;
           end;

           if not bignora then  // ignora
           begin
              if sTipoPgto='PgtoParcial' then
              begin
                qryLoteXDocumentoVALOR.Asfloat:=rValorPago+rValorCorrente;
                if rValorPago=qryDocPendentesSALDO.Asfloat then
                  qryDocPendentes.delete // valor digitado pagou todo o lote
                else
                begin
                   qryDocPendentes.edit;
                   qryDocPendentesSALDO.Asfloat:=qryDocPendentesSALDO.Asfloat-rValorPago;
                   qryDocPendentes.POST;
                end;
              end
              else // PgtoTotal
              begin
                qryLoteXDocumentoVALOR.Asfloat:=qryDocPendentesSALDO.Asfloat+rValorCorrente;
                qryDocPendentes.delete;
              end;


              // Acresce Total do Lote
              rTotalLote:=rTotalLote+qryLoteXDocumentoVALOR.Asfloat-rValorCorrente;

              if bFazPostLote then qryLoteXDocumento.post;
           end; // ignora
         end; {for }
      Finally
        dbgrdDocPendentes.SelectedList.clear;
        qryDocPendentes.EnableControls;
        qryLoteXDocumento.EnableControls;
      End;
   end;
end;

procedure TfrmGeraLotePgto.VerificaFornecedor(destroi : boolean);
begin
   With qryseladiantpendent Do
   Begin
      If Active Then close;

      if lista = nil then lista:=tstringlist.create;

      Params[0].asinteger:=qryDocPendentesIDFORCLI.asinteger;

      if lista.IndexOf(qryDocPendentesIDFORCLI.asstring) = -1 then
      begin
         open;
         if Not IsEmpty then
         begin
            if integraback.RecPag='R' then
              Msgdlg('Existem Adiantamentos Pendentes de Regularização Para o Cliente '+qryDocPendentesNOME.asstring,'Atenção!',mtInformation,[mbOk],0)
            else
              Msgdlg('Existem Adiantamentos Pendentes de Regularização Para o Fornecedor '+qryDocPendentesNOME.asstring,'Atenção!',mtInformation,[mbOk],0) ;
           lista.add(qryDocPendentesIDFORCLI.asstring);
          end;
          Close;
      end;

      if destroi then
      Begin
          lista.free;
          lista:=nil;
      End;
   End;
end;

procedure TfrmGeraLotePgto.qryDocPendentesCalcFields(DataSet: TDataSet);

begin
  inherited;
  Dataset.FieldByName('DOCUMENTO').AsString:=Dataset.FieldByName('NoDOCUMENTO').AsString+'-'+
                             Dataset.FieldByName('COMPLDOCUMENTO').AsString;
end;

procedure TfrmGeraLotePgto.FormCreate(Sender: TObject);
begin
  inherited;
  QryModulos.Active  := True;
  Rad                := Trad.Create;
  ImpostoRetidoLote  := TCtrlImpostoRetido.Create;
  ImpostoRetidoLote.InitializeAs(Padroes);

  If QryTipoDocRecPag.Active Then QryTipoDocRecPag.Close;
  QryTipoDocRecPag.Params[0].AsString := IntegraBack.RecPag;
  QryTipoDocRecPag.Params[1].Asinteger := sistema.idusuario;
  QryTipoDocRecPag.Open;

  If IntegraBack.RecPag = 'R' Then
  Begin
     GpFormaPag.Caption := 'Contas/Caixas x Forma Cobrança';
     LblFormaTipo.Caption     := 'Tipo de Cobrança';
  End
  Else
  Begin
     GpFormaPag.Caption := 'Contas/Caixas x Forma Pagamento';
     LblFormaTipo.Caption     := 'Forma de Pagamento';
  End;

  QryFormadePagto.Close;
  QryFormadePagto.ParamByName('RECPAG').AsString    := IntegraBack.RecPag;
  QryFormadePagto.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  QryFormadePagto.Open;

  iSeqDisperdicado:=0;
  bLoteSendoGerado:=False;

  MontaQryVazia(True);

  bMontaQuery := True;

  bbtnPgtoParcial.enabled := false;
  bbtnPgto.enabled := false;


  FazQuery(qryDescPortadorForma, ' SELECT B.RAZAOSOCIAL, PF.DESCRICAO, PF.CODPORTFORMA, PF.IDTEMPLCHEQUE, PF.CODFORMA, PF.FLGCHEQUEDIFERIDO, PF.FLGOBRIGAFAV ' +
                                 ' FROM PORTADORFORMA PF, PORTADORCONTA PC, PESSOA B  '+
                                 ' WHERE PF.IDPESSOA = '+ InttoStr(Sistema.idEmpresa)+
                                 ' AND PF.RECPAG = '''+ IntegraBack.RecPag +'''' +
                                 ' AND PF.CODPORTADOR = PC.CODPORTADOR(+) ' +
                                 ' AND PC.IDBANCO = B.IDPESSOA(+) ORDER BY PF.DESCRICAO');

  visible:=false;
  windowstate:=wsMaximized;
  visible:=true;

  PgLote.ActivePage := TbsParametros;
end;

procedure TfrmGeraLotePgto.qryLoteXDocumentoCalcFields(DataSet: TDataSet);
begin
  inherited;
  Dataset.FieldByName('DOCUMENTO').AsString := Dataset.FieldByName('NoDOCUMENTO').AsString+'-'+
                                               Dataset.FieldByName('COMPLDOCUMENTO').AsString;
end;

procedure TfrmGeraLotePgto.bbtnPgtoClick(Sender: TObject);
  var
  X : integer;
  sTotalLote : string;
begin
  inherited;
  If ((Not qryLoteXDocumento.IsEmpty) And (qryDocPendentesOPERACAO.AsString = '10')) Or
     (qryLoteXDocumentoOPERACAO.AsString = '10') Then
     Msgdlg('Lança e baixa simultânea tem que estar num lote individual','Atenção!',mtInformation,[mbOk],0)
  Else
  Begin

    if (dbgrdDocPendentes.SelectedList.count) > 0 then
     begin
       //Verifica se o documento já consta no lote selecionado
       For X := 0 To dbgrdDocPendentes.SelectedList.count - 1 Do
       Begin
         qryDocPendentes.GotoBookmark(dbgrdDocPendentes.SelectedList[x]);
         If Not TestaLotexDocum(qryDocPendentesCODDOCUMENTO.AsInteger) Then
                dbgrdDocPendentes.UnselectRecord
         else
           VerificaFornecedor(x=(dbgrdDocPendentes.SelectedList.count - 1));
       End;
       // -----------------------------------------------------------------------

       if not(bLoteSendoGerado) then AbreLote;

       InsereDoc('PgtoTotal',0);

       qryLoteXDocumento.First;
       if not qryLoteXDocumento.eof   then
          begin
               Str(rTotalLote:5:2,sTotalLote);
               SbLote.Panels[1].Text := DESCVALLOTE + sTotalLote;
               bbtnCriaLote.Enabled := True;
               bbtnDesfazPgto.Enabled := True;
          end;
     end;
  End;

end;

procedure TfrmGeraLotePgto.dbgrdDocPendentesMultiSelectRecord(
  Grid: TwwDBGrid; Selecting: Boolean; var Accept: Boolean);
begin
  inherited;
  bbtnPgtoParcial.Enabled := (verifica_adianto(qrydocpendentesCODDOCUMENTO.AsInteger));
  bbtnPgto.Enabled := bbtnPgtoParcial.Enabled;
end;

procedure TfrmGeraLotePgto.bbtnPgtoParcialClick(Sender: TObject);
var
  sValorPago,sTotalLote : string;
  rValorPago : Double;
  x   : integer;
begin
  inherited;
  For X := 0 To dbgrdDocPendentes.SelectedList.count - 1 Do
      VerificaFornecedor(x=(dbgrdDocPendentes.SelectedList.count - 1));

  If qryDocPendentesOPERACAO.AsString <> '10' Then
  Begin
    If TestaLotexDocum(qryDocPendentesCODDOCUMENTO.AsInteger) Then
    Begin
      sValorPago := InputBox('Valor Pago','Entre com o valor a ser pago :',sValorPago);
      while Pos('.', sValorPago) > 0 do
        sValorPago[Pos('.', sValorPago)] := ',';
      try
        rValorPago := StrToFloat(sValorPago);
      except
        rValorPago := 0;
      end;

      if ((dbgrdDocPendentes.SelectedList.count)>0) and (rValorPago<>0) then
      begin
         if ABS(rValorPago) <= ABS(qryDocPendentesSALDO.Asfloat) then
         begin
           if not(bLoteSendoGerado) then AbreLote;
           InsereDoc('PgtoParcial',rValorPago);
           Str(rTotalLote:5:2,sTotalLote);
           SbLote.Panels[1].Text := DESCVALLOTE + sTotalLote; // atualiza Total do Lote na Tela
         end
         else
           Msgdlg('O Valor do Pagamento é maior que o saldo do documento','Atenção!',mtInformation,[mbOk],0);
      end;
    End;
    bbtnCriaLote.Enabled:=True;
  end
  Else
    Msgdlg('Proibido fazer pagamento parcial de Lança e baixa simultânea','Atenção!',mtInformation,[mbOk],0);
end;

procedure TfrmGeraLotePgto.bbtnDesfazPgtoClick(Sender: TObject);
var
  i, iFator :integer;
  sTotalLote : string;
begin
  inherited;
  if (dbgrdLotePagto.SelectedList.count) > 0 then
  begin
       for i:=0 to (dbgrdLotePagto.SelectedList.count-1) do
       begin
           dbgrdLotePagto.datasource.dataset.GotoBookmark(dbgrdLotePagto.SelectedList.items[i]);
           dbgrdLotePagto.datasource.dataset.FreeBookmark(dbgrdLotePagto.SelectedList.items[i]);

           if qryDocPendentes.locate('CODDOCUMENTO',qryLoteXDocumentoCODDOCUMENTO.Asinteger,[]) then
           begin
              qryDocPendentes.Edit;
              qryDocPendentesSALDO.Asfloat:=qryDocPendentesSALDO.Asfloat +
                                            qryLoteXDocumentoVALOR.Asfloat;
              qryDocPendentes.post;
           end
           else
           begin
               qryDocPendentes.insert;
               qryDocPendentesSALDO.Asfloat             := qryLoteXDocumentoVALOR.Asfloat;
               qryDocPendentesVLRLIQUIDO.Asfloat        := qryLoteXDocumentoVLRLIQUIDO.Asfloat;
               qryDocPendentesCODDOCUMENTO.Asinteger    := qryLoteXDocumentoCODDOCUMENTO.Asinteger;
               qryDocPendentesNOME.Asstring             := qryLoteXDocumentoNOME.Asstring;
               qryDocPendentesNODOCUMENTO.Asstring      := qryLoteXDocumentoNODOCUMENTO.Asstring;
               qryDocPendentesCOMPLDOCUMENTO.Asstring   := qryLoteXDocumentoCOMPLDOCUMENTO.Asstring;
               qryDocPendentesDATAPROGRAMADA.Asdatetime := qryLoteXDocumentoDATAPROGRAMADA.Asdatetime;
               qryDocPendentesDATAVENCTO.Asdatetime     := qryLoteXDocumentoDATAVENCTO.Asdatetime;
               qryDocPendentesNUMDIGCODBARRAS.AsString  := qryLoteXDocumentoCODBARRAVALOR.AsString;
               qryDocPendentesNUMLEITCODBARRAS.AsString := qryLoteXDocumentoCODBARRA.AsString;
               qryDocPendentesOPERACAO.AsString         := qryLoteXDocumentoOPERACAO.AsString;
               qryDocPendentesIDFORCLI.AsInteger        := qryLoteXDocumentoIDFORCLI.AsInteger;
           end;
           rTotalLote := rTotalLote-qryLoteXDocumentoVALOR.Asfloat; // Acresce Total do Lote

           If qryLoteXDocumentoVALOR.AsFloat > 0 Then
              iFator := 1
           Else
              iFator := -1;

           rSumValor := rSumValor - (qryLoteXDocumentoVLRLIQUIDO.AsFloat * iFator);

           qryLoteXDocumento.Delete;
       end;
       Str(rTotalLote:5:2,sTotalLote);
       SbLote.Panels[1].Text := DESCVALLOTE + sTotalLote; // atualiza Total do Lote na Tela
       dbgrdLotePagto.SelectedList.clear; // Limpa selecao no grid

       if qryLoteXDocumento.RecordCount = 0 then
       begin
           qryLotePagto.delete;
           bLoteSendoGerado:=False;
           bbtnDesfazPgto.Enabled:=False;
           DesabilitaLote;
           bbtnPgtoParcial.enabled := false;
           bbtnPgto.enabled := false;
       end;

       bbtnSelecionaDoc.Click;
  end;
end;

procedure TfrmGeraLotePgto.bbtnCriaLoteClick(Sender: TObject);
Var
  sAuxData, sAuxDataDiferido :String;
  iNumLancto :Integer;
  sDebCre :String;
begin
  inherited;

  If Not qryDescPortadorFormaIDTEMPLCHEQUE.IsNull Then  bbtnFavorecido.Click;

  If (sFavorecido = '') And
     (Trim(qryLotePagtoFAVORECIDO.asstring) = '') And
     (qryDescPortadorFormaFLGOBRIGAFAV.AsString = 'S') Then
  Begin
    Msgdlg('Para esta forma de pagamentos, Favor Indicar o favorecido','Atenção!',mtInformation,[mbOk],0);
    bbtnFavorecido.Click;
  End;

  sAuxDataDiferido := '';

  If (Not qryDescPortadorFormaIDTEMPLCHEQUE.IsNull) And (qryDescPortadorFormaFLGCHEQUEDIFERIDO.AsString = 'S') Then
  Begin

     If Not InputDate('Cheque Diferido','Indique a data de compensação do cheque', vDataModulo) Then
     Begin
        Msgdlg('A Criação do Lote foi cancelada','Atenção!',mtInformation,[mbOk],0);
        Exit;
     End
     Else
       sAuxDataDiferido := DateToStr( vDataModulo );
  End;

  If Not InputDate('Lote Para Pagto','Indique a Data Para Emissão dos Lotes:', vDataModulo) Then
     Msgdlg('A Criação do Lote foi cancelada','Atenção!',mtInformation,[mbOk],0)
  Else
  Begin
     sAuxData := DateToStr( vDataModulo );

     SbLote.Panels[2].Text := DESCDATLOTE + sAuxData;
     If SbLote.Panels[2].Text = DESCDATLOTE Then
        SbLote.Panels[2].Text := DESCDATLOTE + sAuxData;

     try
       StartTransacao;

       qryLotePagto.first;

       qryLotePagto.Edit;
       qryLotePagtoNUMLOTE.Value:=iNumSeqLote;
       If (Modulo.IdTipoProcRad > 0) Then
       Begin
         qryLoteXDocumento.First;
         While Not qryLoteXDocumento.Eof Do
         Begin
            rad.Valor := rad.Valor + qryLoteXDocumentoValor.AsFloat;
            qryLoteXDocumento.Next;
         End;
         rad.TipoProcesso                 := Modulo.IdTipoProcRad;
         rad.OBS                          := 'Lote Nº: ' + qryLotePagtoNUMLOTE.AsString;
         qryLotePagtoIDPROCESSO.AsInteger := rad.IniciarProcesso;
       End;

       qryLotePagtoDATAEMISSAO.AsDateTime := StrToDate(Copy(SbLote.Panels[2].Text,26,10));
       qryLotePagtoCODPORTFORMA.AsInteger := StrToInt(dblkcmbDescricao.LookupValue);
       qryLotePagtoIDPESSOA.asinteger:=sistema.IdEmpresa;
       If sAuxDataDiferido <> '' Then
          qryLotePagtoDATADIFERIDO.AsDateTime := StrToDate(sAuxDataDiferido);

       qryLotePagtoflagcancel.Asstring:='';
       qryLotePagto.Post;

       updsqlLotePagto.Apply(ukInsert);

       qryLoteXDocumento.first;

       while not(qryLoteXDocumento.eof) do
       begin
          GetNumLancto(qryLoteXDocumentoCODDOCUMENTO.AsInteger,iNumLancto,sDebCre);

          ExecutarQuery(DtmbaseDados.Qry,'UPDATE DOCUMENTO SET CODPORTFORMA = ' +
                        dblkcmbDescricao.LookupValue + ' WHERE CODDOCUMENTO = ' +
                        qryLoteXDocumentoCODDOCUMENTO.AsString);


          ImpostoRetidoLote.RecPag := IntegraBack.RecPag[1];
          ImpostoRetidoLote.IdEmpresa := Sistema.IdEmpresa;
          ImpostoRetidoLote.IdUsuario := Sistema.IdUsuario;
          ImpostoRetidoLote.IdModulo := Sistema.IdModulo;
          ImpostoRetidoLote.IdPlanoConta  := IntegraBack.Plano;
          ImpostoRetidoLote.UsaPlanoPatro := Sistema.UsaPlanoPatro;
          ImpostoRetidoLote.IntegraContab := (IntegraBack.Contabilidade = 'S');
          ImpostoRetidoLote.PartidaDobrada := ParamIntegra.PartidaDobrada;          
          ImpostoRetidoLote.NumLote := qryLoteXDocumentoNUMLOTE.AsFloat;
          ImpostoRetidoLote.DataProgramada := qryLotePagtoDATAEMISSAO.AsDateTime;
          ImpostoRetidoLote.OperacaoDocumento := qryLoteXDocumentoOPERACAO.AsString;
          ImpostoRetidoLote.IdForCli := qryLoteXDocumentoIDFORCLI.AsInteger;
          ImpostoRetidoLote.CodDocumento := qryLoteXDocumentoCODDOCUMENTO.AsInteger;
          ImpostoRetidoLote.NumLancto := iNumLancto;
          ImpostoRetidoLote.ValorLancto := qryLoteXDocumentoVALOR.AsFloat;
          ImpostoRetidoLote.ValorLiquido := qryLoteXDocumentoVLRLIQUIDO.AsFloat;
          ImpostoRetidoLote.DataLancto := qryLotePagtoDATAEMISSAO.AsDateTime;
          ImpostoRetidoLote.DataEmissao := qryLotePagtoDATAEMISSAO.AsDateTime;
          ImpostoRetidoLote.DebCre := sDebCre;
          ImpostoRetidoLote.MomentoLancamento := mlBaixa;
          ImpostoRetidoLote.CodPortForma := StrToInt(dblkcmbDescricao.LookupValue);
          ImpostoRetidoLote.Incluir;

          Modulo.VlrRetencao := ImpostoRetidoLote.ValorAlteradores;

          //Para documentos com a natureza invertida
          If ((sDebCre = 'D') And (IntegraBack.RecPag = 'P')) Or
             ((sDebCre = 'C') And (IntegraBack.RecPag = 'R')) Then
             Modulo.VlrRetencao := Modulo.VlrRetencao * -1;

          If ImpostoRetidoLote.ValorAlteradores <> 0 Then
          Begin
             qryLoteXDocumento.Edit;
             qryLoteXDocumentoVALOR.AsFloat := qryLoteXDocumentoVALOR.AsFloat + Modulo.VlrRetencao;
             qryLoteXDocumento.Post;
          End;

          if qryLoteXDocumentoOPERACAO.AsString = '10' Then
          Begin
             If ExecutarQuery(DtmBaseDados.Qry,'UPDATE RECBTOPAGTO SET NUMCHQBORDERO = ''' +
               qryLotePagtoNUMLOTE.AsString + ''' WHERE CODDOCUMENTO = ' + qryLoteXDocumentoCODDOCUMENTO.AsString) Then
             Begin
                 If FazQuery(DtmBaseDados.Qry,'SELECT CODLANCFINANC FROM RECBTOPAGTO WHERE CODDOCUMENTO = ' +
                              qryLoteXDocumentoCODDOCUMENTO.AsString) Then
                 Begin
                      If Not ExecutarQuery(DtmBaseDados.Qry,'UPDATE MOVIMFINANC SET NUMCHQBORDERO = ''' +
                             qryLotePagtoNUMLOTE.AsString + ''', HISTORICO = ''BORDERÔ Nº ' + qryLotePagtoNUMLOTE.AsString +
                             ''' WHERE CODLANCFINANC = ' + IntToStr(DtmBaseDados.Qry.Fields[0].AsInteger)) Then
                             Raise EdataBaseError.Create('Não foi possível atualizar movimento financeiro para o Doc ' +
                                                   qryLoteXDocumentoCODDOCUMENTO.AsString + ', verifique');
                 End
                 Else
                    Raise EdataBaseError.Create('Erro ao selecionar movimento financeiro para o Doc ' +
                           qryLoteXDocumentoCODDOCUMENTO.AsString + ', verifique');
             End
             Else
                Raise EdataBaseError.Create('Não foi possível atualiar Nº do Cheque\Borderô para o Doc ' +
                      qryLoteXDocumentoCODDOCUMENTO.AsString + ', verifique');
          End;

          if qryLoteXDocumento.UpdateStatus in [usModified,usInserted] then
             updsqlLoteXDocumento.Apply(ukInsert);

          qryLoteXdocumento.next;
       end;

       ImpostoRetidoLote.NumLote := qryLoteXDocumentoNUMLOTE.AsFloat;
       ImpostoRetidoLote.CodPortForma := StrToInt(dblkcmbDescricao.LookupValue);
       ImpostoRetidoLote.EfetivaNovoDocumento;
       If Not Sistema.GravaLogOperacoes('Criar Lote') Then
          Raise
            Exception.Create('Não Consegui Gravar o Log');
       CommitTransacao;

       ImpostoRetidoLote.CancelaAcumulaImposto;

       FuncaoGeral.FechaQry([qryLoteXDocumento,qryLotePagto],false,True);
       qryLoteXDocumento.Open;
       qryLotePagto.Open;

       bbtnDesfazPgto.Enabled:=False;

       bbtnCriaLote.Enabled:=False;

       bbtnPgto.enabled := false;
       bbtnPgtoParcial.enabled  := false;

       DesabilitaLote;
       iSeqDisperdicado := 0;
       Msgdlg('Lote gerado com sucesso ','Atenção!',mtInformation,[mbOk],0);
       bMontaQuery := True;

       MontaQryVazia(False);

       FuncaoGeral.TiraIcone;
     except
        RollbackTransacao;
        ImpostoRetidoLote.CancelaAcumulaImposto;
        Msgdlg('Erro ao Gerar Lotes','Atenção!',mtInformation,[mbOk],0);
        If qryLotePagto.UpdatesPending Then qryLotePagto.CancelUpdates;
        If qryLoteXDocumento.UpdatesPending Then qryLoteXDocumento.CancelUpdates;
        bbtnDesfazPgto.enabled := true;
        raise;
     end;
  End;
end;

procedure TfrmGeraLotePgto.bbtnSelecionaDocClick(Sender: TObject);
Var sqlDocPendentes: String;
begin
  inherited;
  If Trim(dblkcmbDescricao.Text) = '' Then
  Begin
    Msgdlg('Favor Indicar a  Contas/Caixas x Forma Pagamento ','Atenção!',mtInformation,[mbOk],0);
    If dblkcmbDescricao.CanFocus Then dblkcmbDescricao.SetFocus;
  End
  Else

  Begin
     Try
        Screen.Cursor := CrHourGlass;
        qryDocPendentes.DisableControls;
        qryLoteXDocumento.DisableControls;

        sqlDocPendentes:=
               'SELECT LANCTODOCUM.VLRLIQUIDO, (0)as SALDO,DOCUMENTO.IDFORCLI,DOCUMENTO.OPERACAO,DOCUMENTO.CODDOCUMENTO,'+
               ' DOCUMENTO.IDPESSOA,DOCUMENTO.NoDOCUMENTO,DOCUMENTO.COMPLDOCUMENTO,DOCUMENTO.DATAPROGRAMADA,'+
               ' DOCUMENTO.DATAVENCTO,DOCUMENTO.RECPAG,PESSOA.RAZAOSOCIAL AS NOME,DOCUMENTO.STATUS, DOCUMENTO.NUMLEITCODBARRAS, DOCUMENTO.NUMDIGCODBARRAS, DOCUMENTO.IDFORCLI '+
               ' FROM DOCUMENTO,LANCTODOCUM,PESSOA WHERE (DOCUMENTO.IDFORCLI=PESSOA.IDPESSOA) AND ((EMISBLOQ <> ''S'') OR (EMISBLOQ IS NULL)) AND ';

               If Modulo.EmiteLancaBaixa Then
                 sqlDocPendentes := sqlDocPendentes +
                 ' ((((DOCUMENTO.STATUS=''0'') OR (DOCUMENTO.STATUS=''1'') OR (DOCUMENTO.STATUS is  NULL))   AND ' +
                 ' ((DOCUMENTO.OPERACAO=''2'') OR (DOCUMENTO.OPERACAO=''3'') OR (DOCUMENTO.OPERACAO=''14''))) OR ' +
                 ' ((DOCUMENTO.STATUS = ''2'') AND (DOCUMENTO.OPERACAO = ''10''))) AND ' +
                 ' (DOCUMENTO.FLGEMITELANCBAIX IS NULL) AND ' +
                  ' documento.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
                               IntegraBack.RecPag+''' and not exists  (select 1 from UsuarioxTpdocto b where recpag='+#39+integraback.recpag+#39+' and b.idusuario=' +
                               inttostr(sistema.IdUsuario)+') union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
                               IntegraBack.RecPag+ '''  and exists (select 1 from UsuarioxTpdocto b where recpag='+#39+integraback.recpag+#39+' and a.codtipdoc=b.codtipdoc and b.idusuario=' +
                               inttostr(sistema.idusuario)+')) and '
               Else
                 sqlDocPendentes := sqlDocPendentes +
                 ' (DOCUMENTO.STATUS=''0'' or DOCUMENTO.STATUS=''1'' or (DOCUMENTO.STATUS is  NULL))   AND '+
                 ' (DOCUMENTO.OPERACAO=''2'' OR DOCUMENTO.OPERACAO=''3'' OR DOCUMENTO.OPERACAO=''14'') AND '+
                 ' documento.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
                               IntegraBack.RecPag+''' and not exists  (select 1 from UsuarioxTpdocto b where recpag='+#39+integraback.recpag+#39+' and b.idusuario=' +
                               inttostr(sistema.IdUsuario)+') union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
                               IntegraBack.RecPag+ '''  and exists (select 1 from UsuarioxTpdocto b where recpag='+#39+integraback.recpag+#39+' and a.codtipdoc=b.codtipdoc and b.idusuario=' +
                               inttostr(sistema.idusuario)+')) and ' ;

        if  CPForCli.ForCliReg.RazaoSocial <> '' then
            sqlDocPendentes:= sqlDocPendentes + ' (DOCUMENTO.IDFORCLI = ' + IntToStr(CPForCli.ForCliReg.Id) + ') AND ';

        if DtIni.text<>'' then
           sqlDocPendentes:= sqlDocPendentes + ' (DOCUMENTO.DATAPROGRAMADA >= TO_DATE('''+DtIni.text+''',''DD/MM/YYYY'')) AND ';

        if DtFim.text<>'' then
           sqlDocPendentes:= sqlDocPendentes + ' (DOCUMENTO.DATAPROGRAMADA <= TO_DATE('''+DtFim.text+''',''DD/MM/YYYY'')) AND ';

        if EdtNumDoc.value <> 0 then
           sqlDocPendentes:= sqlDocPendentes + ' (DOCUMENTO.NODOCUMENTO = ' + Trim(EdtNumDoc.Text) + ') AND ';

        if CmbSisOrigem.Text <> '' then
           sqlDocPendentes:= sqlDocPendentes + ' (DOCUMENTO.NODOCUMENTO = ' + CmbSisOrigem.LookupValue + ') AND ';

        if EdtCompl.Text <> '' then
           sqlDocPendentes:= sqlDocPendentes + ' (RTRIM(DOCUMENTO.COMPLDOCUMENTO) = ''' + EdtCompl.Text + ''') AND ';

        If CkbAutorPag.Checked Then
           sqlDocPendentes:= sqlDocPendentes + ' (DOCUMENTO.FLGCONFIRMARECPAG = ''S'') AND ';

        If Not CkbCPMF.Checked Then
           sqlDocPendentes:= sqlDocPendentes + ' (DOCUMENTO.CODTIPDOC <> ' + IntToStr(Modulo.CodDocCPMF) + ') AND ';

        if CmbTipoDocRecPag.Text <> '' then
           sqlDocPendentes:= sqlDocPendentes + ' (DOCUMENTO.CODTIPDOC = ' + CmbTipoDocRecPag.LookupValue + ') AND ';




        if (CkbSelDoc.Checked) And
           (Not qryDescPortadorFormaCODFORMA.IsNull) And
           (dblkcmbDescricao.Text <> '') and (DblCodForma.Text = '') Then

            sqlDocPendentes:= sqlDocPendentes + ' (DOCUMENTO.CODFORMA = ' + qryDescPortadorFormaCODFORMA.AsString + ') AND '
        else
        if (DblCodForma.Text <> '') Then
            sqlDocPendentes := sqlDocPendentes + ' (DOCUMENTO.CODFORMA = ' + DblCodForma.LookupValue + ') AND ';

        if (CkbPortForma.Checked) And
           (dblkcmbDescricao.Text <> '') Then
            sqlDocPendentes:= sqlDocPendentes + ' (DOCUMENTO.CODPORTFORMA = ' + qryDescPortadorFormaCODPORTFORMA.AsString + ') AND ';

        sqlDocPendentes:= sqlDocPendentes +
//               ' (DOCUMENTO.CODDOCUMENTO !=ALL (select coddocumento from lotexdocum where flgbaixa is null or flgbaixa = ''N'')) AND ' +
               ' (DOCUMENTO.RECPAG='''+IntegraBack.RecPag+''') AND '+
               ' (DOCUMENTO.IDPESSOA='+IntToStr(Sistema.idEmpresa)+ ') AND ' +
               ' (DOCUMENTO.OPERACAO = LANCTODOCUM.OPERACAO) AND ' +
               ' (DOCUMENTO.CODDOCUMENTO = LANCTODOCUM.CODDOCUMENTO) AND ' +
               ' (LANCTODOCUM.ESTORNO IS NULL)' +
               ' ORDER BY  PESSOA.RAZAOSOCIAL ,DOCUMENTO.DATAPROGRAMADA, DOCUMENTO.NoDOCUMENTO';

        FazQuery(qryDocPendentes,sqlDocPendentes);

        bbtnPgtoParcial.Enabled := Not qryDocPendentes.IsEmpty;
        bbtnPgto.Enabled := bbtnPgtoParcial.Enabled;

        //Rosane 26/11/2001
        {if Documento.ProcessoAutLote <> 0 then begin
            qryDocPendentes.First;
            While Not qryDocPendentes.Eof Do
            Begin
               //Faz query do rateio do documento para saber se tem processo do rad.
               qryRateio.Close;
               qryRateio.ParamByName('CODDOCUMENTO').AsFloat := qryDocPendentes.FieldByName('CODDOCUMENTO').AsFloat;
               qryRateio.Open;
               bNaoAutorizou := False;
               While not qryRateio.Eof do Begin
                  if not FazQuery(DtmBaseDados.qry,'SELECT FLGOK FROM RADINSTPROCESSO WHERE (IDPROCESSO = '+qryRateio.FieldByName('IDPROCESSO').AsString+') AND (FLGOK = ''S'')') Then begin
                     bNaoAutorizou := True;
                     Break;
                  end;
                  qryRateio.Next;
               end;
               if bNaoAutorizou then
                  qryDocPendentes.Delete;
               qryDocPendentes.Next;
            End;
        end;}

        qryLoteXDocumento.First;
        While Not qryLoteXDocumento.Eof Do
        Begin
           If qryDocPendentes.Locate('CODDOCUMENTO',qryLoteXDocumentoCODDOCUMENTO.AsFloat,[]) Then
              qryDocPendentes.Delete;

           qryLoteXDocumento.Next;
        End;

        qryLoteXDocumento.First;

        PgLote.ActivePage := TbsDocumentos;
        PgLote.OnChange(Self);

        CalculaSaldos;
     finally
        Screen.Cursor := CrDefault;
        qryDocPendentes.EnableControls;
        qryLoteXDocumento.EnableControls;
     End;
  End;
end;

procedure TfrmGeraLotePgto.dbgrdDocPendentesCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  If (Not (Sender As TwwDbGrid).DataSource.DataSet.IsEmpty) And
     ((Sender As TwwDbGrid).DataSource.DataSet.FieldByName('DATAPROGRAMADA').AsDateTime < Date) Then
  Begin
    if (Field.FieldName='SALDO') OR
       (Field.FieldName='VALOR') Then
       begin
         AFont.Color:= $0080FFFF;
         ABrush.Color:=ClRed;
       end;
  End
  Else
  if (Field.FieldName='SALDO') OR
     (Field.FieldName='VALOR') Then
  begin
     AFont.Color:=clNavy;
     ABrush.Color:=$0080FFFF;{Amarelo claro}
  end;
end;

procedure TfrmGeraLotePgto.bbtnFavorecidoClick(Sender: TObject);
Var
 bFavorecidoBanco: Boolean;
 sOldNome: String;
begin
  inherited;

  qryLoteXDocumento.First;
  sOldNome := qryLoteXDocumentoNome.AsString;

  bFavorecidoBanco := False;

  While Not qryLoteXDocumento.EOF Do
  Begin
      If qryLoteXDocumentoNome.AsString <> sOldNome Then bFavorecidoBanco := True;
      sOldNome := qryLoteXDocumentoNome.AsString;
      qryLoteXDocumento.Next;
  End;

  qryLoteXDocumento.First;

  If bFavorecidoBanco Then
     sFavorecido := qryDescPortadorFormaRAZAOSOCIAL.AsString
  Else
     sFavorecido := qryLoteXDocumentoNome.AsString;

  If Not InputQuery('Favorecido','Entre com o nome do favorecido :',sFavorecido) Then Abort;

  qryLotePagto.edit;
  qryLotePagtoFAVORECIDO.asstring:=sFavorecido;
  qryLotePagtoflagcancel.asstring:='';
  qryLotePagto.post;
end;

procedure TfrmGeraLotePgto.bbtnObsClick(Sender: TObject);
begin
  inherited;
  sObservacao:=InputBox('Observação ','Entre com a observação :',sObservacao);
  qryLotePagto.edit ;
  qryLotePagtoOBSERVACAO.asstring:=sObservacao;
  qryLotePagtoflagcancel.asstring:='';
  qryLotePagto.post;
end;

function TfrmGeraLotePgto.verifica_adianto(idocumento:integer):boolean;
begin
   result := false;
   Try
     if (qrydocpendentesOPERACAO.AsString = '14') and
        (IntegraBack.Contabilidade = 'S')   then
     begin

        if IntegraBack.RecPag = 'P'   then
        Begin
           with Qryaux do
           begin
               sSql := ' SELECT CONTACADIANTAMENTO FROM EMPRESAFORN EMP , DOCUMENTO DOC '+
                       ' WHERE DOC.CODDOCUMENTO  =  ''' + INTTOSTR(IDOCUMENTO) + '''   AND '+
                       '       DOC.IDPESSOA      = EMP.IDPESSOA AND '+
                       '       DOC.IDFORCLI      = EMP.IDFORCLI ';
               FazQuery(QryAux,sSql);
               Sadiantapag:=  FieldByName('CONTACADIANTAMENTO').Asstring;
           end;
        End
        else
        Begin
           with Qryaux do
           begin
              sSql := ' SELECT CONTACADIANTAMENTO FROM EMPRESACLIENTE EMP , DOCUMENTO DOC '+
                      ' WHERE DOC.CODDOCUMENTO  =  ''' + INTTOSTR(IDOCUMENTO) + '''   AND '+
                      '       DOC.IDPESSOA      = EMP.IDPESSOA AND '+
                      '       DOC.IDFORCLI      = EMP.IDFORCLI ';
              FazQuery(QryAux,sSql);
              Sadiantarec:=  FieldByName('CONTACADIANTAMENTO').Asstring;
           end;
        End;

        if qryAux.FieldByName('CONTACADIANTAMENTO').AsString <> '' then
           result := true
        else
           Msgdlg('Não existe Conta de Adiantamento','Aviso',mterror,[mbOk],0);
     End
     else
        result := true;
  except
      Raise;
  end;
end;

procedure TfrmGeraLotePgto.dblkcmbDescricaoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  If modified Then
  Begin
     dblkcmbDescricao.LookupValue := dblkcmbDescricao.LookupValue;

     bbtnCriaLote.Enabled:= (dblkcmbDescricao.text <> '' );

     If Not qryDocPendentes.isEmpty Then  MontaQryVazia(True);
  End;
end;

Function TfrmGeraLotePgto.TestaLotexDocum(iCodDoc:Integer):Boolean;
Begin
  result := (Not qryLoteXDocumento.Locate('CodDocumento',iCodDoc,[]));

  If Not result Then
     Msgdlg('Este Documento já está cadastrado neste lote','Aviso',mtWarning,[mbOk],0);
End;

Procedure TfrmGeraLotePgto.MontaQryVazia(bLimpaDocPendentes:Boolean);
Var
  sSql: String;
Begin
  rSumValor := 0;

  FuncaoGeral.FechaQry([qryLotePagto,qryLoteXDocumento],false,True);

  If bLimpaDocPendentes Then
  Begin
     If qryDocPendentes.Active And qryDocPendentes.UpdatesPending Then qryDocPendentes.CancelUpdates;

     sSql:='SELECT LANCTODOCUM.VLRLIQUIDO,(0)as SALDO,DOCUMENTO.IDFORCLI,DOCUMENTO.OPERACAO,DOCUMENTO.CODDOCUMENTO,'+
     'DOCUMENTO.IDPESSOA,DOCUMENTO.NoDOCUMENTO,DOCUMENTO.COMPLDOCUMENTO,DOCUMENTO.DATAPROGRAMADA,'+
     'DOCUMENTO.DATAVENCTO,DOCUMENTO.RECPAG,PESSOA.RAZAOSOCIAL AS NOME,DOCUMENTO.STATUS, DOCUMENTO.NUMLEITCODBARRAS, DOCUMENTO.NUMDIGCODBARRAS '+
     'FROM DOCUMENTO,LANCTODOCUM,PESSOA WHERE (1=2) ';
     FazQuery(qryDocPendentes,sSql);
  End;

  sSql:='SELECT 0 AS VLRLIQUIDO, LOTEXDOCUM.NUMLOTE, LOTEXDOCUM.CODDOCUMENTO, LOTEXDOCUM.VALOR, ' +
                     'LOTEXDOCUM.CODBARRA, LOTEXDOCUM.CODBARRAVALOR, Pessoa.RAZAOSOCIAL AS nome,DOCUMENTO.DATAPROGRAMADA, '+
                     'Documento.idpessoa,DOCUMENTO.DATAVENCTO,DOCUMENTO.NoDOCUMENTO, '+
                     'DOCUMENTO.COMPLDOCUMENTO, DOCUMENTO.OPERACAO, DOCUMENTO.IDFORCLI,0 as imp, 0 as tot FROM LOTEXDOCUM,PESSOA,DOCUMENTO  '+
                     'WHERE  (1=2)';
  FazQuery(qryLoteXDocumento,sSql);

  sSql:='SELECT NUMLOTE, IDPESSOA, CODPORTFORMA, DATAEMISSAO, IDPROCESSO, ' +
                ' NUMCHQBORDERO, FAVORECIDO, FLAGEMISSAO, FLAGCANCEL, OBSERVACAO, IDUSUARIOINCLUSAO, DATADIFERIDO ' +
                ' FROM LOTEPAGTO WHERE (1=2)';
  FazQuery(qryLotePagto,sSql);
End;

procedure TfrmGeraLotePgto.PgLoteChange(Sender: TObject);
begin
  inherited;
  CPForCli.Visible :=  (PgLote.ActivePage = TbsParametros);
end;

procedure TfrmGeraLotePgto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Rad.Free;
  ImpostoRetidoLote.Free;
end;

Procedure TfrmGeraLotePgto.GetNumLancto(iCodDocumento :Integer; Var iNumLancto :Integer; Var sDebCre :String);
Begin
  If QryNumlancto.Active       Then QryNumlancto.Close;
  If Not QryNumlancto.Prepared Then QryNumlancto.Prepare;
  QryNumlancto.ParamByName('CODDOCUMENTO').AsInteger := iCodDocumento;
  QryNumlancto.Open;
  iNumLancto := QryNumlanctoNUMLANCTO.AsInteger;
  sDebCre    := QryNumlanctoDEBCRE.AsString;
  QryNumlancto.Close;
End;

end.

