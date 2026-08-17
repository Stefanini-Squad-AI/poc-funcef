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
Unit
  FGeraLotePgtoMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOKCancelar, StdCtrls, wwdblook, ComCtrls, ExtCtrls, MAHlpBtn, Buttons,
  ToolWin, Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwdatsrc, DBCtrls,
  Usistema,UAutorizacao, DBaseDados, TB97, FSairAjuda, TB97Tlbr,
  MontaSelect, IvDictio, IvMulti, IvEMulti,
  FProcuraCliForDlg, TREdit, CMDBLookupCombo,
  wwdbdatetimepicker, CMDateTimePicker, uMensErro, DBClient,
  uCMClientDataSet, CmParamReport, CMProcuraSubTipo, uCtrlGeraLotePgto;

CONST
   DESCNUMLOTE = 'Nº do Lote Gerado: ';
   DESCVALLOTE = 'Valor total do Lote: ';
   DESCDATLOTE = 'Data de Emissão do Lote: ';

Type
  TFrmGeraLotePgtoMT = Class(TFrmProcuraCliForDlg)
    dsDocPendentes: TwwDataSource;
    CdsDocPendentes: TCMClientDataSet;
    Panel2: TPanel;
    Panel3: TPanel;
    dbgrdLotePagto: TwwDBGrid;
    CdsDocPendentesCODDOCUMENTO: TFloatField;
    CdsDocPendentesIDPESSOA: TFloatField;
    CdsDocPendentesNODOCUMENTO: TFloatField;
    CdsDocPendentesCOMPLDOCUMENTO: TStringField;
    CdsDocPendentesDATAPROGRAMADA: TDateTimeField;
    CdsDocPendentesDATAVENCTO: TDateTimeField;
    CdsDocPendentesNOME: TStringField;
    CdsDocPendentesDOCUMENTO: TStringField;
    CdsDocPendentesRECPAG: TStringField;
    dsLoteXDocum: TwwDataSource;
    CdsLoteXDocumento: TCMClientDataSet;
    CdsLoteXDocumentoCODDOCUMENTO: TFloatField;
    CdsLoteXDocumentoVALOR: TFloatField;
    CdsLoteXDocumentoNOME: TStringField;
    CdsLoteXDocumentoDATAPROGRAMADA: TDateTimeField;
    CdsLoteXDocumentoDATAVENCTO: TDateTimeField;
    CdsLoteXDocumentoNODOCUMENTO: TFloatField;
    CdsLoteXDocumentoCOMPLDOCUMENTO: TStringField;
    CdsLoteXDocumentoDOCUMENTO: TStringField;
    CdsDescPortadorForma: TCMClientDataSet;
    CdsDocPendentesSTATUS: TStringField;
    dsLotePagto: TwwDataSource;
    CdsLotePagto: TCMClientDataSet;
    CdsLotePagtoNUMLOTE: TFloatField;
    CdsLotePagtoCODPORTFORMA: TFloatField;
    CdsLotePagtoDATAEMISSAO: TDateTimeField;
    CdsLotePagtoNUMCHQBORDERO: TStringField;
    CdsLotePagtoFAVORECIDO: TStringField;
    CdsLotePagtoFLAGEMISSAO: TStringField;
    CdsLotePagtoFLAGCANCEL: TStringField;
    CdsLotePagtoOBSERVACAO: TStringField;
    CdsLoteXDocumentoNUMLOTE: TFloatField;
    CdsDocPendentesSALDO: TFloatField;
    CdsDocPendentesIDFORCLI: TFloatField;
    CdsDescPortadorFormaCODPORTFORMA: TFloatField;
    CdsLotePagtoIDPESSOA: TFloatField;
    CdsLotePagtoIDUSUARIOINCLUSAO: TFloatField;
    CdsDocPendentesOPERACAO: TStringField;
    CdsAux: TCMClientDataSet;
    CdsDescPortadorFormaIDTEMPLCHEQUE: TFloatField;
    CdsDescPortadorFormaDESCRICAO: TStringField;
    CdsDescPortadorFormaRAZAOSOCIAL: TStringField;
    Pnldocpago: TPanel;
    Panel10: TPanel;
    bbtnDesfazPgto: TBitBtn;
    bbtnCriaLote: TBitBtn;
    bbtnFavorecido: TBitBtn;
    bbtnObs: TBitBtn;
    SbLote: TStatusBar;
    CdsDescPortadorFormaCODFORMA: TFloatField;
    CdsDocPendentesNUMLEITCODBARRAS: TStringField;
    CdsDocPendentesNUMDIGCODBARRAS: TStringField;
    CdsLoteXDocumentoCODBARRA: TStringField;
    CdsLoteXDocumentoCODBARRAVALOR: TStringField;
    CdsLoteXDocumentoOPERACAO: TStringField;
    CdsLoteXDocumentoIDFORCLI: TFloatField;
    CdsLotePagtoIDPROCESSO: TFloatField;
    CdsDescPortadorFormaFLGCHEQUEDIFERIDO: TStringField;
    CdsLotePagtoDATADIFERIDO: TDateTimeField;
    CdsNumlancto: TCMClientDataSet;
    CdsNumlanctoNUMLANCTO: TFloatField;
    CdsNumlanctoDEBCRE: TStringField;
    Splitter1: TSplitter;
    CdsFormadePagto: TCMClientDataSet;
    CdsFormaPagDESCRICAO: TStringField;
    CdsFormaPagCODFORMA: TFloatField;
    CdsFormaPagRECPAG: TStringField;
    Cdsseladiantpendent: TCMClientDataSet;
    CdsLoteXDocumentoIDPESSOA: TFloatField;
    CdsLoteXDocumentoVLRLIQUIDO: TFloatField;
    CdsDocPendentesVLRLIQUIDO: TFloatField;
    CdsModulos: TCMClientDataSet;
    CdsModulosNOMEMODULO: TStringField;
    CdsModulosIDMODULO: TFloatField;
    CdsTipoDocRecPag: TCMClientDataSet;
    CdsTipoDocRecPagCODTIPDOC: TFloatField;
    CdsTipoDocRecPagDESCRICAO: TStringField;
    CdsDescPortadorFormaFLGOBRIGAFAV: TStringField;
    CdsSaldoLoteNaoEmitido: TCMClientDataSet;
    CdsSaldoLoteNaoEmitidoVALORLOTE: TFloatField;
    CdsRateio: TCMClientDataSet;
    CmpDadosParaBaixa: TCmParamReport;
    Panel1: TPanel;
    Panel5: TPanel;
    dbgrdDocPendentes: TwwDBGrid;
    Panel9: TPanel;
    bbtnPgto: TBitBtn;
    bbtnPgtoParcial: TBitBtn;
    btnSelecionarDoc: TBitBtn;
    PnlDocPendentes: TPanel;
    SbStatusSelecao: TStatusBar;
    Procedure CdsDocPendentesCalcFields(DataSet: TDataSet);
    Procedure FormCreate(Sender: TObject);
    Procedure CdsLoteXDocumentoCalcFields(DataSet: TDataSet);
    Procedure bbtnPgtoClick(Sender: TObject);
    Procedure dbgrdDocPendentesMultiSelectRecord(Grid: TwwDBGrid;
      Selecting: Boolean; var Accept: Boolean);
    Procedure bbtnPgtoParcialClick(Sender: TObject);
    Procedure bbtnDesfazPgtoClick(Sender: TObject);
    Procedure bbtnCriaLoteClick(Sender: TObject);
    Procedure bbtnSelecionaDocClick(Sender: TObject);
    Procedure dbgrdDocPendentesCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    Procedure bbtnFavorecidoClick(Sender: TObject);
    Procedure bbtnObsClick(Sender: TObject);
    Procedure dblkcmbDescricaoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    Procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelecionarDocClick(Sender: TObject);
  Private
    CtrlGeraLotePgto : TCtrlGeraLotePgto;


     //-------antigos
     lista: tstringlist;
     rTotalLote: real ;
     sfavorecido, sobservacao: String;

     Function TestaLotexDocum(iCodDoc:Integer):Boolean;
     Procedure DesabilitaLote;
     Procedure AbreLote;
     Procedure InsereDoc(sTipoPgto:string;rValorPago:real);
     Procedure VerificaFornecedor(destroi : boolean);
  Public

  End;

Var
  FrmGeraLotePgtoMT: TFrmGeraLotePgtoMT;

Implementation

Uses
  UDataBase, UFuncaoGeral, UModulo, uCMDialogs, uCtrlPadroes, uCtrlParamIntegra;

{$R *.DFM}
//************************************************
Procedure TFrmGeraLotePgtoMT.FormCreate(Sender: TObject);
Begin
  Inherited;
  CtrlGeraLotePgto := TCtrlGeraLotePgto.Create;

  CtrlGeraLotePgto.IdEmpresa       := Sistema.IdEmpresa;
  CtrlGeraLotePgto.IdUsuario       := Sistema.IdUsuario;
  CtrlGeraLotePgto.IdModulo        := Sistema.IdModulo;
  CtrlGeraLotePgto.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
  CtrlGeraLotePgto.IdPlanoConta    := ParamIntegra.Plano;
  CtrlGeraLotePgto.IdEspAcesso     := Sistema.IdEspAcesso;
  CtrlGeraLotePgto.RecPag          := ParamIntegra.RecPag;
  CtrlGeraLotePgto.IntegraContab   := ParamIntegra.IntegraContab;
  CtrlGeraLotePgto.PartidaDobrada  := ParamIntegra.PartidaDobrada;
  CtrlGeraLotePgto.ValorZero       := Modulo.ValorZero;
  CtrlGeraLotePgto.IdTipoProcRad   := Modulo.IdTipoProcRad;
  CtrlGeraLotePgto.VlrRetencao     := Modulo.VlrRetencao;
  CtrlGeraLotePgto.EmiteLancaBaixa := Modulo.EmiteLancaBaixa;

  CtrlGeraLotePgto.CdsDocPendentes        := CdsDocPendentes;
  CtrlGeraLotePgto.CdsLoteXDocumento      := CdsLoteXDocumento;
  CtrlGeraLotePgto.CdsDescPortadorForma   := CdsDescPortadorForma;
  CtrlGeraLotePgto.CdsLotePagto           := CdsLotePagto;
  CtrlGeraLotePgto.CdsAux                 := CdsAux;
  CtrlGeraLotePgto.CdsNumlancto           := CdsNumlancto;
  CtrlGeraLotePgto.CdsFormadePagto        := CdsFormadePagto;
  CtrlGeraLotePgto.Cdsseladiantpendent    := Cdsseladiantpendent;
  CtrlGeraLotePgto.CdsModulos             := CdsModulos;
  CtrlGeraLotePgto.CdsTipoDocRecPag       := CdsTipoDocRecPag;
  CtrlGeraLotePgto.CdsSaldoLoteNaoEmitido := CdsSaldoLoteNaoEmitido;
  CtrlGeraLotePgto.CdsRateio              := CdsRateio;

  CtrlGeraLotePgto.InitializeAs( ParamIntegra );

  If ( ParamIntegra.RecPag = 'R' ) Then Begin
    CmpDadosParaBaixa.ParamByName( 'dblkcmbDescricao' ).Caption := 'Contas/Caixas x Forma Cobrança';
    CmpDadosParaBaixa.ParamByName( 'DblCodForma' ).Caption      := 'Tipo de Cobrança';
  End Else Begin
    CmpDadosParaBaixa.ParamByName( 'dblkcmbDescricao' ).Caption := 'Contas/Caixas x Forma Pagamento';
    CmpDadosParaBaixa.ParamByName( 'DblCodForma' ).Caption      := 'Forma de Pagamento';
  End;

  CmpDadosParaBaixa.ParamValues[ 0 ].LookupSettings.SQL.Text := CtrlGeraLotePgto.GeraSql( 'DBLKCMBDESCRICAO' );
  CmpDadosParaBaixa.ParamValues[ 0 ].LookupSettings.SQL.Text := CtrlGeraLotePgto.GeraSql( 'DBLCODFORMA' );
  CmpDadosParaBaixa.ParamValues[ 0 ].LookupSettings.SQL.Text := CtrlGeraLotePgto.GeraSql( 'CMBTIPODOCRECPAG' );
  CtrlGeraLotePgto.AbreQueries;

  bbtnPgtoParcial.enabled := false;
  bbtnPgto.enabled := false;
End;
//************************************************
Procedure TFrmGeraLotePgtoMT.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  Inherited;
  CtrlGeraLotePgto.Free;
End;
//************************************************
Procedure TFrmGeraLotePgtoMT.DesabilitaLote;
Begin
  sbLote.Panels[0].Text := DESCNUMLOTE;
  sbLote.Panels[1].Text := DESCVALLOTE;
  sbLote.Panels[2].Text := DESCDATLOTE;

  bbtnObs.Enabled:=False;
  sObservacao:='';
  sFavorecido:='';
  bbtnFavorecido.Enabled:=False;
  bbtnObs.Enabled:=False;
  CtrlGeraLotePgto.bLoteSendoGerado := False;
End;
//************************************************
Procedure TFrmGeraLotePgtoMT.AbreLote;
Begin

  If CdsDocPendentes.IsEmpty Then Exit;
  rTotalLote:=0;
  bbtnDesfazPgto.Enabled:=True;

  CdsLotePagto.Insert;
  CtrlGeraLotePgto.iNumSeqLote := CtrlGeraLotePgto.SequenciaTabela('SEQLOTEPAGTO', CtrlGeraLotePgto.iSeqDesperdicado );
  CdsLotePagtoDATAEMISSAO.AsDateTime      := Date;
  CdsLotePagtoNUMLOTE.Value               := CtrlGeraLotePgto.iNumSeqLote;
  CdsLotePagtoOBSERVACAO.AsString         := sObservacao;
  CdsLotePagtoFAVORECIDO.AsString         := sFavorecido;
  CdsLotePagtoIDUSUARIOINCLUSAO.AsInteger := Sistema.idUsuario;
  CdsLotePagtoIDPESSOA.AsInteger          := Sistema.IDEmpresa;
  CdsLotePagtoFLAGCANCEL.AsString         := '';

  SbLote.Panels[0].Text := DESCNUMLOTE + FloatToStr( CtrlGeraLotePgto.iNumSeqLote );
  SbLote.Panels[2].Text := DESCDATLOTE + DatetoStr(Date);

  CtrlGeraLotePgto.bLoteSendoGerado := True;
  bbtnObs.Enabled  := True;
  bbtnFavorecido.Enabled:=true;
End;

Procedure TFrmGeraLotePgtoMT.InsereDoc(sTipoPgto:string;rValorPago:real);
Var
   i :integer;
   rValorCorrente :real;
   bFazPostLote :boolean;
   bignora      :boolean;
Begin
  if ((sTipoPgto='PgtoParcial') or (sTipoPgto='PgtoTotal')) then
  begin
     Try
        CdsDocPendentes.DisableControls;
        CdsLoteXDocumento.DisableControls;

        For i:=0 To (dbgrdDocPendentes.SelectedList.count-1) Do Begin
          dbgrdDocPendentes.datasource.dataset.GotoBookmark(dbgrdDocPendentes.SelectedList.items[i]);
          dbgrdDocPendentes.datasource.dataset.FreeBookmark(dbgrdDocPendentes.SelectedList.items[i]);
          if not(CdsLoteXDocumento.locate('CODDOCUMENTO',
                               CdsDocPendentesCODDOCUMENTO.Asinteger,[])) AND
                  ((CdsdocpendentesOPERACAO.AsString = '14') and
                   ( ParamIntegra.IntegraContab )  and
                   ( CtrlGeraLotePgto.Verifica_Adianto( CdsdocpendentesCODDOCUMENTO.AsInteger ) ) ) Or
                  ( ( CdsdocpendentesOPERACAO.AsString <> '14') or
                  ( ParamIntegra.IntegraContab ))

          Then Begin // documento nao existe no lote
              bignora := false;
              CdsLoteXDocumento.insert; // insere na Consulta detalhe LoteXDocum
              CdsLoteXDocumentoCODDOCUMENTO.Asinteger    := CdsDocPendentesCODDOCUMENTO.Asinteger;
              CdsLoteXDocumentoNUMLOTE.Value             := CtrlGeraLotePgto.iNumSeqLote;
              CdsLoteXDocumentoNOME.Asstring             := CdsDocPendentesNOME.Asstring;
              CdsLoteXDocumentoNODOCUMENTO.Asstring      := CdsDocPendentesNODOCUMENTO.Asstring;
              CdsLoteXDocumentoCOMPLDOCUMENTO.Asstring   := CdsDocPendentesCOMPLDOCUMENTO.Asstring;
              CdsLoteXDocumentoDATAPROGRAMADA.Asdatetime := CdsDocPendentesDATAPROGRAMADA.Asdatetime;
              CdsLoteXDocumentoDATAVENCTO.Asdatetime     := CdsDocPendentesDATAVENCTO.Asdatetime;
              CdsLoteXDocumentoCODBARRAVALOR.AsString    := CdsDocPendentesNUMDIGCODBARRAS.AsString;
              CdsLoteXDocumentoCODBARRA.AsString         := CdsDocPendentesNUMLEITCODBARRAS.AsString;
              CdsLoteXDocumentoOPERACAO.AsString         := CdsDocPendentesOPERACAO.AsString;
              CdsLoteXDocumentoIDFORCLI.AsInteger        := CdsDocPendentesIDFORCLI.AsInteger;
              CdsLoteXDocumentoVLRLIQUIDO.AsFloat        := CdsDocPendentesVLRLIQUIDO.AsFloat;
              rValorCorrente:=0;
              bFazPostLote:=False;
          end
          else
          begin  // documento ja existe no lote
             bignora := true;
             CdsLoteXDocumento.edit;
             rValorcorrente:=CdsLoteXDocumentoVALOR.asfloat;
             bFazPostLote:=true;
          end;

          if not bignora then  // ignora
          begin
             if sTipoPgto='PgtoParcial' then
             begin
               CdsLoteXDocumentoVALOR.Asfloat:=rValorPago+rValorCorrente;
               if rValorPago=CdsDocPendentesSALDO.Asfloat then
                 CdsDocPendentes.delete // valor digitado pagou todo o lote
               else
               begin
                  CdsDocPendentes.edit;
                  CdsDocPendentesSALDO.Asfloat:=CdsDocPendentesSALDO.Asfloat-rValorPago;
                  CdsDocPendentes.POST;
               end;
             end
             else // PgtoTotal
             begin
               CdsLoteXDocumentoVALOR.Asfloat:=CdsDocPendentesSALDO.Asfloat+rValorCorrente;
               CdsDocPendentes.delete;
             end;


             // Acresce Total do Lote
             rTotalLote:=rTotalLote+CdsLoteXDocumentoVALOR.Asfloat-rValorCorrente;

             if bFazPostLote then CdsLoteXDocumento.post;
          end; // ignora
        end; {for }

     Finally
       dbgrdDocPendentes.SelectedList.clear;
       CdsDocPendentes.EnableControls;
       CdsLoteXDocumento.EnableControls;
     End;
  end;
End;
//************************************************
Procedure TFrmGeraLotePgtoMT.VerificaFornecedor(destroi : boolean);
Begin
  If ( Lista = Nil ) Then Lista := TStringList.Create;

  If ( lista.IndexOf(CdsDocPendentesIDFORCLI.asstring) = -1 ) Then Begin

    CtrlGeraLotePgto.AbreCdsSelAdiantPendent;

    If Not ( CdsSelAdiantPendent.IsEmpty ) Then Begin
      If ( ParamIntegra.RecPag = 'R' ) Then
        Msgdlg( 'Existem Adiantamentos Pendentes de Regularização Para o Cliente '+
                CdsDocPendentesNOME.asstring,'Atenção!',mtInformation,[mbOk],0)
      Else Begin
        Msgdlg( 'Existem Adiantamentos Pendentes de Regularização Para o Fornecedor '+
                CdsDocPendentesNOME.asstring,'Atenção!',mtInformation,[mbOk],0) ;
      End;
      Lista.Add( CdsDocPendentesIDFORCLI.AsString );
    End;
    CdsSelAdiantPendent.Close;
  End;

  If destroi Then Begin
    Lista.Free;
    Lista := Nil;
  End;
end;

procedure TFrmGeraLotePgtoMT.CdsDocPendentesCalcFields(DataSet: TDataSet);

begin
  inherited;
  Dataset.FieldByName('DOCUMENTO').AsString:=Dataset.FieldByName('NoDOCUMENTO').AsString+'-'+
                             Dataset.FieldByName('COMPLDOCUMENTO').AsString;
end;

procedure TFrmGeraLotePgtoMT.CdsLoteXDocumentoCalcFields(DataSet: TDataSet);
begin
  inherited;
  Dataset.FieldByName('DOCUMENTO').AsString := Dataset.FieldByName('NoDOCUMENTO').AsString+'-'+
                                               Dataset.FieldByName('COMPLDOCUMENTO').AsString;
end;

procedure TFrmGeraLotePgtoMT.bbtnPgtoClick(Sender: TObject);
  var
  X : integer;
  sTotalLote : string;
begin
  inherited;
  If ((Not CdsLoteXDocumento.IsEmpty) And (CdsDocPendentesOPERACAO.AsString = '10')) Or
     (CdsLoteXDocumentoOPERACAO.AsString = '10') Then
     Msgdlg('Lança e baixa simultânea tem que estar num lote individual','Atenção!',mtInformation,[mbOk],0)
  Else
  Begin

    if (dbgrdDocPendentes.SelectedList.count) > 0 then
     begin
       //Verifica se o documento já consta no lote selecionado
       For X := 0 To dbgrdDocPendentes.SelectedList.count - 1 Do
       Begin
         CdsDocPendentes.GotoBookmark(dbgrdDocPendentes.SelectedList[x]);
         If Not TestaLotexDocum(CdsDocPendentesCODDOCUMENTO.AsInteger) Then
                dbgrdDocPendentes.UnselectRecord
         else
           VerificaFornecedor(x=(dbgrdDocPendentes.SelectedList.count - 1));
       End;
       // -----------------------------------------------------------------------

       if not( CtrlGeraLotePgto.bLoteSendoGerado) then AbreLote;

       InsereDoc('PgtoTotal',0);

       CdsLoteXDocumento.First;
       if not CdsLoteXDocumento.eof   then
          begin
               Str(rTotalLote:5:2,sTotalLote);
               SbLote.Panels[1].Text := DESCVALLOTE + sTotalLote;
               bbtnCriaLote.Enabled := True;
               bbtnDesfazPgto.Enabled := True;
          end;
     end;
  End;
end;

procedure TFrmGeraLotePgtoMT.dbgrdDocPendentesMultiSelectRecord(
  Grid: TwwDBGrid; Selecting: Boolean; var Accept: Boolean);
begin
  inherited;
  bbtnPgtoParcial.Enabled := ( CtrlGeraLotePgto.Verifica_Adianto( CdsdocpendentesCODDOCUMENTO.AsInteger ) );
  bbtnPgto.Enabled := bbtnPgtoParcial.Enabled;
end;

procedure TFrmGeraLotePgtoMT.bbtnPgtoParcialClick(Sender: TObject);
var
  sValorPago,sTotalLote : string;
  rValorPago : Double;
  x   : integer;
begin
  inherited;
  For X := 0 To dbgrdDocPendentes.SelectedList.count - 1 Do
      VerificaFornecedor(x=(dbgrdDocPendentes.SelectedList.count - 1));

  If CdsDocPendentesOPERACAO.AsString <> '10' Then
  Begin
    If TestaLotexDocum(CdsDocPendentesCODDOCUMENTO.AsInteger) Then
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
         if ABS(rValorPago) <= ABS(CdsDocPendentesSALDO.Asfloat) then
         begin
           if not( CtrlGeraLotePgto.bLoteSendoGerado) then AbreLote;
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

procedure TFrmGeraLotePgtoMT.bbtnDesfazPgtoClick(Sender: TObject);
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

           if CdsDocPendentes.locate('CODDOCUMENTO',CdsLoteXDocumentoCODDOCUMENTO.Asinteger,[]) then
           begin
              CdsDocPendentes.Edit;
              CdsDocPendentesSALDO.Asfloat:=CdsDocPendentesSALDO.Asfloat +
                                            CdsLoteXDocumentoVALOR.Asfloat;
              CdsDocPendentes.post;
           end
           else
           begin
               CdsDocPendentes.insert;
               CdsDocPendentesSALDO.Asfloat             := CdsLoteXDocumentoVALOR.Asfloat;
               CdsDocPendentesVLRLIQUIDO.Asfloat        := CdsLoteXDocumentoVLRLIQUIDO.Asfloat;
               CdsDocPendentesCODDOCUMENTO.Asinteger    := CdsLoteXDocumentoCODDOCUMENTO.Asinteger;
               CdsDocPendentesNOME.Asstring             := CdsLoteXDocumentoNOME.Asstring;
               CdsDocPendentesNODOCUMENTO.Asstring      := CdsLoteXDocumentoNODOCUMENTO.Asstring;
               CdsDocPendentesCOMPLDOCUMENTO.Asstring   := CdsLoteXDocumentoCOMPLDOCUMENTO.Asstring;
               CdsDocPendentesDATAPROGRAMADA.Asdatetime := CdsLoteXDocumentoDATAPROGRAMADA.Asdatetime;
               CdsDocPendentesDATAVENCTO.Asdatetime     := CdsLoteXDocumentoDATAVENCTO.Asdatetime;
               CdsDocPendentesNUMDIGCODBARRAS.AsString  := CdsLoteXDocumentoCODBARRAVALOR.AsString;
               CdsDocPendentesNUMLEITCODBARRAS.AsString := CdsLoteXDocumentoCODBARRA.AsString;
               CdsDocPendentesOPERACAO.AsString         := CdsLoteXDocumentoOPERACAO.AsString;
               CdsDocPendentesIDFORCLI.AsInteger        := CdsLoteXDocumentoIDFORCLI.AsInteger;
           end;
           rTotalLote := rTotalLote-CdsLoteXDocumentoVALOR.Asfloat; // Acresce Total do Lote

           If CdsLoteXDocumentoVALOR.AsFloat > 0 Then
              iFator := 1
           Else
              iFator := -1;

           CtrlGeraLotePgto.rSumValor := CtrlGeraLotePgto.rSumValor - (CdsLoteXDocumentoVLRLIQUIDO.AsFloat * iFator);

           CdsLoteXDocumento.Delete;
       end;
       Str(rTotalLote:5:2,sTotalLote);
       SbLote.Panels[1].Text := DESCVALLOTE + sTotalLote; // atualiza Total do Lote na Tela
       dbgrdLotePagto.SelectedList.clear; // Limpa selecao no grid

       if CdsLoteXDocumento.RecordCount = 0 then
       begin
           CdsLotePagto.delete;
           CtrlGeraLotePgto.bLoteSendoGerado:=False;
           bbtnDesfazPgto.Enabled:=False;
           DesabilitaLote;
           bbtnPgtoParcial.enabled := false;
           bbtnPgto.enabled := false;
       end;

       bbtnSelecionaDocClick( Self );;
  end;
end;

Procedure TFrmGeraLotePgtoMT.bbtnCriaLoteClick(Sender: TObject);
Var
  sAuxData, sAuxDataDiferido : String;
Begin
  Inherited;

  If Not CdsDescPortadorFormaIDTEMPLCHEQUE.IsNull Then  bbtnFavorecido.Click;

  If (sFavorecido = '') And
     (Trim(CdsLotePagtoFAVORECIDO.asstring) = '') And
     (CdsDescPortadorFormaFLGOBRIGAFAV.AsString = 'S') Then Begin
    Msgdlg('Para esta forma de pagamentos, Favor Indicar o favorecido','Atenção!',mtInformation,[mbOk],0);
    bbtnFavorecido.Click;
  End;

  sAuxDataDiferido := '';

  If ( Not CdsDescPortadorFormaIDTEMPLCHEQUE.IsNull) And
     ( CdsDescPortadorFormaFLGCHEQUEDIFERIDO.AsString = 'S') Then Begin

    If Not InputDate('Cheque Diferido','Indique a data de compensação do cheque', vDataModulo) Then Begin
       Msgdlg('A Criação do Lote foi cancelada','Atenção!',mtInformation,[mbOk],0);
       Exit;
    End Else
      sAuxDataDiferido := DateToStr( vDataModulo );
  End;

  If Not InputDate('Lote Para Pagto','Indique a Data Para Emissão dos Lotes:', vDataModulo) Then

    Msgdlg('A Criação do Lote foi cancelada','Atenção!',mtInformation,[mbOk],0)
  Else Begin
    sAuxData := DateToStr( vDataModulo );

    SbLote.Panels[2].Text := DESCDATLOTE + sAuxData;
    If SbLote.Panels[2].Text = DESCDATLOTE Then
       SbLote.Panels[2].Text := DESCDATLOTE + sAuxData;

    If CtrlGeraLotePgto.bbtnCriaLoteClick( Copy( SbLote.Panels[2].Text, 26, 10 ),
                                           CmpDadosParaBaixa.ParamValues[0].AsString,
                                           sAuxDataDiferido ) Then Begin

      bbtnDesfazPgto.Enabled  := False;
      bbtnCriaLote.Enabled    := False;
      bbtnPgto.enabled        := false;
      bbtnPgtoParcial.enabled := false;
      DesabilitaLote;
      FuncaoGeral.TiraIcone;
    End Else Begin
      bbtnDesfazPgto.enabled := true;

    End;
  End;
End;

procedure TFrmGeraLotePgtoMT.bbtnSelecionaDocClick(Sender: TObject);
Var
  DocPend         : Integer;
  ValtotSel       : Double;
Begin
  Inherited;
  If Trim( CmpDadosParaBaixa.ParamValues[0].AsString ) = '' Then
  Begin
    Msgdlg('Favor Indicar a  Contas/Caixas x Forma Pagamento ','Atenção!',mtInformation,[mbOk],0);
    //If dblkcmbDescricao.CanFocus Then dblkcmbDescricao.SetFocus;
  End Else Begin
    Screen.Cursor := CrHourGlass;
    CdsDocPendentes.DisableControls;
    CdsLoteXDocumento.DisableControls;

    Try
      DocPend   := 0;
      ValtotSel := 0;

      CtrlGeraLotePgto.bbtnSelecionaDocClick( CmpDadosParaBaixa,
                                              Modulo.CodDocCPMF,
                                              DocPend,
                                              ValtotSel );
    Finally
      bbtnPgtoParcial.Enabled := Not CdsDocPendentes.IsEmpty;
      bbtnPgto.Enabled := bbtnPgtoParcial.Enabled;

      SbStatusSelecao.Panels[0].Text := 'Documetos pendentes: ' + IntToStr(DocPend);
      SbStatusSelecao.Panels[1].Text := 'Valor total da seleção: ' + FloatToStrF(ValtotSel,ffCurrency,17,2);

      Screen.Cursor := CrDefault;
      CdsDocPendentes.EnableControls;
      CdsLoteXDocumento.EnableControls;
    End;
  End;
End;

procedure TFrmGeraLotePgtoMT.dbgrdDocPendentesCalcCellColors(Sender: TObject;
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

procedure TFrmGeraLotePgtoMT.bbtnFavorecidoClick(Sender: TObject);
Var
 bFavorecidoBanco: Boolean;
 sOldNome: String;
begin
  inherited;

  CdsLoteXDocumento.First;
  sOldNome := CdsLoteXDocumentoNome.AsString;

  bFavorecidoBanco := False;

  While Not CdsLoteXDocumento.EOF Do
  Begin
      If CdsLoteXDocumentoNome.AsString <> sOldNome Then bFavorecidoBanco := True;
      sOldNome := CdsLoteXDocumentoNome.AsString;
      CdsLoteXDocumento.Next;
  End;

  CdsLoteXDocumento.First;

  If bFavorecidoBanco Then
     sFavorecido := CdsDescPortadorFormaRAZAOSOCIAL.AsString
  Else
     sFavorecido := CdsLoteXDocumentoNome.AsString;

  If Not InputQuery('Favorecido','Entre com o nome do favorecido :',sFavorecido) Then Abort;

  CdsLotePagto.edit;
  CdsLotePagtoFAVORECIDO.asstring:=sFavorecido;
  CdsLotePagtoflagcancel.asstring:='';
  CdsLotePagto.post;
end;

procedure TFrmGeraLotePgtoMT.bbtnObsClick(Sender: TObject);
begin
  inherited;
  sObservacao:=InputBox('Observação ','Entre com a observação :',sObservacao);
  CdsLotePagto.edit ;
  CdsLotePagtoOBSERVACAO.asstring:=sObservacao;
  CdsLotePagtoflagcancel.asstring:='';
  CdsLotePagto.post;
end;


procedure TFrmGeraLotePgtoMT.dblkcmbDescricaoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  If modified Then
  Begin
     //dblkcmbDescricao.LookupValue := dblkcmbDescricao.LookupValue;

     //bbtnCriaLote.Enabled:= (dblkcmbDescricao.text <> '' );

     If Not CdsDocPendentes.isEmpty Then CtrlGeraLotePgto.MontaCdsVazia(True);
  End;
end;

Function TFrmGeraLotePgtoMT.TestaLotexDocum(iCodDoc:Integer):Boolean;
Begin
  result := (Not CdsLoteXDocumento.Locate('CodDocumento',iCodDoc,[]));

  If Not result Then
     Msgdlg('Este Documento já está cadastrado neste lote','Aviso',mtWarning,[mbOk],0);
End;


Procedure TFrmGeraLotePgtoMT.btnSelecionarDocClick(Sender: TObject);
Begin
  If ( CmpDadosParaBaixa.Execute ) Then Begin
    bbtnPgto.Enabled        := True;
    bbtnPgtoParcial.Enabled := True;
  End Else Begin
    bbtnPgto.Enabled        := False;
    bbtnPgtoParcial.Enabled := False;
  End;
End;

End.

