//------------------------------------------------------------------------------
//Alterações
{-------------------------------------------------------------------------------
Desenvolvedor: Marcus Oliveira
Data         : 24/08/2007
Pendência    : 23738
Descrição    : Criado uma opção para trazer apenas documentos aprovados pelo
               RAD(Ultima Etapa)
{-------------------------------------------------------------------------------
Data      : 22/06/2007
Autor     : Marcus Oliveira
Pendência : 25644
Descrição : Corrigido os valores da StatusBar - Seleção.
{-------------------------------------------------------------------------------
Data      : 31/01/2007
Autor     : Marcus Oliveira
Pendência : 24363
Descrição : Removido o Owner CM.
-------------------------------------------------------------------------------
Rotinas   : bbtnSelecionaDocClick
Data      : 06/11/2006
Autor     : andré tavares
Pendência : 23658
Descrição : adaptação para filtar os documento de conta corrente do mesmo banco do portador forma,
bem como a exibição dos dados das contas corrente dos mesmos.
-------------------------------------------------------------------------------}
//------------------------------------------------------------------------------
// Componentes : CdsLotePagto, CdsLoteXDocumento
// Data        : 19/08/2004 (término)
// Autor       : David Ayrolla
// Pendência   : 17221
// Descrição   : Implementar processo RAD por lote ou por documento.
//------------------------------------------------------------------------------
// Rotina    : bbtnPgtoClick
// Data      : 01/07/04 (término)
// Autor     : David Ayrolla
// Pendência : 14646
// Descrição : Só permitir pagamento de documentos aprovados pelo RAD.
//------------------------------------------------------------------------------

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
  wwdbdatetimepicker, CMDateTimePicker, uMensErro, DBClient,menus,
  CmParamReport, uCMClientDataSet, CMProcuraSubTipo,
  uCtrlGeraLotePgto,uCMTypes, uCmSqlParams, Wwquery, uCtrlBaixaDocumentos;

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
    CdsDescPortadorFormaCODPORTFORMA: TFloatField;
    CdsLotePagtoIDPESSOA: TFloatField;
    CdsLotePagtoIDUSUARIOINCLUSAO: TFloatField;
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
    Panel1: TPanel;
    Panel5: TPanel;
    dbgrdDocPendentes: TwwDBGrid;
    Panel9: TPanel;
    bbtnPgto: TBitBtn;
    bbtnPgtoParcial: TBitBtn;
    btnSelecionarDoc: TBitBtn;
    PnlDocPendentes: TPanel;
    SbStatusSelecao: TStatusBar;
    CdsLoteXDocumentoIDPROCESSO: TFloatField;
    CdsLotePagtoFLGRADLOTEDOC: TStringField;
    CMSqlParams1: TCMSqlParams;
    CdsDocPendentesTIPO: TStringField;
    CdsDocPendentesVLRLIQUIDO: TFloatField;
    CdsDocPendentesSALDO: TFloatField;
    CdsDocPendentesIDFORCLI: TFloatField;
    CdsDocPendentesOPERACAO: TStringField;
    CdsDocPendentesCODDOCUMENTO: TFloatField;
    CdsDocPendentesIDPESSOA: TFloatField;
    CdsDocPendentesNODOCUMENTO: TFloatField;
    CdsDocPendentesCOMPLDOCUMENTO: TStringField;
    CdsDocPendentesDATAPROGRAMADA: TDateTimeField;
    CdsDocPendentesDATAVENCTO: TDateTimeField;
    CdsDocPendentesRECPAG: TStringField;
    CdsDocPendentesRAZAOSOCIAL: TStringField;
    CdsDocPendentesFORNECEDOR: TStringField;
    CdsDocPendentesNOME: TStringField;
    CdsDocPendentesSTATUS: TStringField;
    CdsDocPendentesNUMLEITCODBARRAS: TStringField;
    CdsDocPendentesNUMDIGCODBARRAS: TStringField;
    CdsDocPendentesPLANOPREV: TStringField;
    CMSqlParams2: TCMSqlParams;
    CdsLoteXDocumentoPLANOPREV: TStringField;
    CmpDadosParaBaixa: TCmParamReport;
    CdsDocPendentesFLGPPDIFERENTE: TStringField;
    CdsDocPendentesBANCO: TStringField;
    CdsDocPendentesNUMAGENCIA: TStringField;
    CdsDocPendentesCONTACORRENTE: TStringField;
    CdsLoteXDocumentoBANCO: TStringField;
    CdsLoteXDocumentoNUMAGENCIA: TStringField;
    CdsLoteXDocumentoCONTACORRENTE: TStringField;
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
    procedure btnSelecionarDocClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgrdDocPendentesTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure dbgrdLotePagtoTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure FormDestroy(Sender: TObject);
  Private

    CtrlBaixaDocumentos : TCtrlBaixaDocumentos;
    CtrlGeraLotePgto : TCtrlGeraLotePgto;
    iordem           : integer;

    //Marcus Oliveira 25644 22/06/2007
    dValorTotCdsDocPendetes : Double;

     lista: tstringlist;
     rTotalLote: real ;
     sfavorecido, sobservacao: String;

     Function TestaLotexDocum(iCodDoc:Integer):Boolean;
     //Marcus Oliveira 25644 22/06/2007
     Procedure AtualizaValoresStatusSelecao;

     Procedure DesabilitaLote;
     Procedure AbreLote;
     Procedure InsereDoc(sTipoPgto:string;rValorPago:real);
     Procedure VerificaFornecedor(destroi : boolean);
     procedure GetParams;
  Public
  End;

Var
  FrmGeraLotePgtoMT: TFrmGeraLotePgtoMT;

Implementation



Uses
  UDataBase, UFuncaoGeral, UModulo, uCMDialogs, uCtrlPadroes, uCtrlParamIntegra,
  FParamGeraLote, uFormManager;

{$R *.DFM}

Procedure TFrmGeraLotePgtoMT.FormCreate(Sender: TObject);
Begin
  Inherited;

  self.CtrlBaixaDocumentos := TCtrlBaixaDocumentos.Create; //andre tavares
  self.CtrlBaixaDocumentos.InitializeAs( padroes );

  self.CtrlGeraLotePgto := TCtrlGeraLotePgto.Create;
  self.CtrlGeraLotePgto.InitializeAs( ParamIntegra );


  CtrlGeraLotePgto.IdEmpresa       := Sistema.IdEmpresa;
  CtrlGeraLotePgto.IdUsuario       := Sistema.IdUsuario;
  CtrlGeraLotePgto.IdModulo        := Sistema.IdModulo;
  CtrlGeraLotePgto.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
  CtrlGeraLotePgto.IdPlanoConta    := ParamIntegra.Plano;
  CtrlGeraLotePgto.IdEspAcesso     := Sistema.IdEspAcesso;
  CtrlGeraLotePgto.RecPag          := ParamIntegra.RecPag;
  CtrlGeraLotePgto.IntegraContab   := ParamIntegra.IntegraContab;
  CtrlGeraLotePgto.PartidaDobrada  := ParamIntegra.PartidaDobrada;
  CtrlGeraLotePgto.ValorZero       := 0;
  CtrlGeraLotePgto.IdTipoProcRad   := Modulo.IdTipoProcRad;
  CtrlGeraLotePgto.RADValMinimo    := Modulo.RADValMinimo;
  CtrlGeraLotePgto.VlrRetencao     := Modulo.VlrRetencao;
  CtrlGeraLotePgto.EmiteLancaBaixa := Modulo.EmiteLancaBaixa;
  CtrlGeraLotePgto.RadLote         := Modulo.RadLote;

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

  CtrlGeraLotePgto.AbreQueries;


  CdsDescPortadorForma.Data := CtrlGeraLotePgto.GetDataPacket( CtrlGeraLotePgto.GeraSql( 'DBLKCMBDESCRICAO' ) );
  bbtnPgtoParcial.enabled := false;
  bbtnPgto.enabled := false;

// Daniel Simões - 26/01/2006 - Início------------------------------------------
  if ParamIntegra.Recpag = 'P' then
  begin
    HelpContext           := 30022;
    bbtnAjuda.HelpContext := 30022;
  end;
// Daniel Simões - 26/01/2006 - Fim---------------------------------------------

End;

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

Procedure TFrmGeraLotePgtoMT.AbreLote;
Begin

  If CdsDocPendentes.IsEmpty Then Exit;
  rTotalLote:=0;
  bbtnDesfazPgto.Enabled:=True;

  CdsLotePagto.Insert;
  CtrlGeraLotePgto.iNumSeqLote            := CtrlGeraLotePgto.SequenciaTabela('SEQLOTEPAGTO', CtrlGeraLotePgto.iSeqDesperdicado );
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
              //início - andre tavares - pendência 23658 - 06/11/2006
              CdsLoteXDocumentoBANCO.AsString           := CdsDocPendentesBANCO.AsString;
              CdsLoteXDocumentoNUMAGENCIA.AsString       := CdsDocPendentesNUMAGENCIA.AsString;
              CdsLoteXDocumentoCONTACORRENTE.AsString    := CdsDocPendentesCONTACORRENTE.AsString;
              //fim - andre tavares - pendência 23658 - 06/11/2006
              CdsLoteXDocumentoPLANOPREV.AsString        := CdsDocPendentesPLANOPREV.AsString;
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
  bDocumentoPPDiferente: Boolean;
begin
  inherited;
  If ((Not CdsLoteXDocumento.IsEmpty) And (CdsDocPendentesOPERACAO.AsString = '10')) Or
     (CdsLoteXDocumentoOPERACAO.AsString = '10') Then
     Msgdlg('Lança e baixa simultânea tem que estar num lote individual','Atenção!',mtInformation,[mbOk],0)
  Else
  Begin
    if (dbgrdDocPendentes.SelectedList.count) > 0 then
     begin

       //início - andre tavares - pendencia 21601 - 24/08/2006
       bDocumentoPPDiferente := false;
       For X := 0 To dbgrdDocPendentes.SelectedList.count - 1 Do
       begin
         CdsDocPendentes.GotoBookmark(dbgrdDocPendentes.SelectedList[x]);
         if not CtrlBaixaDocumentos.VerificaPortadorContaXPlano(CdsDocPendentesCODDOCUMENTO.AsInteger,
                                                      self.CmpDadosParaBaixa.ParamValues[0].Value) then
         begin
           CdsDocPendentes.Edit;
           CdsDocPendentes.FieldByName('FLGPPDIFERENTE').asString := 'S';
           CdsDocPendentes.Post;
           bDocumentoPPDiferente := true;
         end;
       end;

       if bDocumentoPPDiferente then
       begin
         dbgrdDocPendentes.UnselectAll;
         Msgdlg('Um ou mais documentos selecionados possuem rateios cujos planos previdenciários'+#13+
                'contábeis não estão relacionados à Conta Caixa X Forma de Pagamento selecionada.',
                'Atenção!',mtInformation,[mbOk],0);

         exit;
       end;
       //fim - andre tavares - pendencia 21601 - 24/08/2006

       //Verifica se o documento já consta no lote selecionado
       For X := 0 To dbgrdDocPendentes.SelectedList.count - 1 Do
       Begin
         CdsDocPendentes.GotoBookmark(dbgrdDocPendentes.SelectedList[x]);
         If Not TestaLotexDocum(CdsDocPendentesCODDOCUMENTO.AsInteger) Then
                dbgrdDocPendentes.UnselectRecord
         else
           VerificaFornecedor(x=(dbgrdDocPendentes.SelectedList.count - 1));

         //DAVID - Pendência 14646
         //Verifica se o processo RAD foi autorizado
         if Sistema.UsaRAD Then
         begin
           if not CtrlBaixaDocumentos.ProcessoRadLiberado( CdsDocPendentesCODDOCUMENTO.AsInteger ) then
           begin
             Msgdlg( 'O documento ' + CdsDocPendentesNODOCUMENTO.AsString + ' não está autorizado para geração de lote.', 'Aviso', mtinformation, [mbOk], 0 );
             exit;
           end;
         end;

       End;

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

  //Marcus Oliveira P. 25644 22/06/2007 
  AtualizaValoresStatusSelecao;

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
  bInsereDoc : Boolean;
begin
  inherited;
  For X := 0 To dbgrdDocPendentes.SelectedList.count - 1 Do
  begin

    //início - andre tavares - pendencia 21601 - 24/08/2006
    CdsDocPendentes.GotoBookmark(dbgrdDocPendentes.SelectedList[x]);
    if not CtrlBaixaDocumentos.VerificaPortadorContaXPlano(CdsDocPendentesCODDOCUMENTO.AsInteger,
                                                 self.CmpDadosParaBaixa.ParamValues[0].Value) then
    begin
      Msgdlg('Um ou mais documentos selecionados possuem rateios cujos planos previdenciários'+#13+
             'contábeis não estão relacionados à Conta Caixa X Forma de Pagamento selecionada.',
             'Atenção!',mtInformation,[mbOk],0);
      exit;
    end;
    //fim - andre tavares - pendencia 21601 - 24/08/2006

    VerificaFornecedor(x=(dbgrdDocPendentes.SelectedList.count - 1));
    //DAVID - Pendência 14646
    //Verifica se o processo RAD foi autorizado
    CdsDocPendentes.GotoBookmark(dbgrdDocPendentes.SelectedList[x]);    
    if Sistema.UsaRAD Then
    begin
      if not CtrlBaixaDocumentos.ProcessoRadLiberado( CdsDocPendentesCODDOCUMENTO.AsInteger ) then
      begin
        Msgdlg( 'O documento ' + CdsDocPendentesNODOCUMENTO.AsString + ' não está autorizado para geração de lote.', 'Aviso', mtinformation, [mbOk], 0 );
        exit;
      end;
    end;
  end;
  
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
      bInsereDoc := true;
      if ((dbgrdDocPendentes.SelectedList.count)>0) and (rValorPago<>0) then
      begin
         if CdsDocPendentesSALDO.Asfloat < 0 then
         begin
            if rValorPago > 0  then
            begin
               bInsereDoc := False;
               Msgdlg('O Valor do Pagamento é maior que o saldo do documento','Atenção!',mtInformation,[mbOk],0);
            end
            else
            if ABS(rValorPago) > ABS(CdsDocPendentesSALDO.Asfloat) then
            begin
               bInsereDoc := False;
               Msgdlg('O Valor do Pagamento é maior que o saldo do documento','Atenção!',mtInformation,[mbOk],0);
            end;
         end
         else
            if rValorPago < 0  then
            begin
               bInsereDoc := False;
               Msgdlg('O Valor do Pagamento é menor que zero','Atenção!',mtInformation,[mbOk],0);
            end;
         if bInsereDoc then
         begin
           if not( CtrlGeraLotePgto.bLoteSendoGerado) then AbreLote;
           InsereDoc('PgtoParcial',rValorPago);
           Str(rTotalLote:5:2,sTotalLote);
           SbLote.Panels[1].Text := DESCVALLOTE + sTotalLote; // atualiza Total do Lote na Tela
         end;
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
               CdsDocPendentesPLANOPREV.AsString        := CdsLoteXDocumentoPLANOPREV.AsString;
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
  bdataok : boolean;
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
    End
    Else
      if vDataModulo = 0 then
      begin
         Msgdlg('Informe a Data de Compensação do Cheque','Atenção!',mtInformation,[mbOk],0);
         Exit;
      end
      else
        sAuxDataDiferido := DateToStr( vDataModulo );
  End;

  If Not InputDate('Lote Para Pagto','Indique a Data Para Emissão dos Lotes:', vDataModulo) Then
    Msgdlg('A Criação do Lote foi cancelada','Atenção!',mtInformation,[mbOk],0)
  Else
  Begin
    if vDataModulo = 0 then
    begin
       Msgdlg('Informe a Data Para Emissão dos Lotes','Atenção!',mtInformation,[mbOk],0);
       Exit;
    end
    else
    begin
       sAuxData := DateToStr( vDataModulo );
       SbLote.Panels[2].Text := DESCDATLOTE + sAuxData;
       If SbLote.Panels[2].Text = DESCDATLOTE Then
          SbLote.Panels[2].Text := DESCDATLOTE + sAuxData;
        Try
//andre tavares pendência 24229 - 17/01/2007
          if trim(CmpDadosParaBaixa.ParamValues[0].asString) <> '' then
          begin
            If CtrlGeraLotePgto.bbtnCriaLoteClick( Copy( SbLote.Panels[2].Text, 26, 10 ),
                                                   CmpDadosParaBaixa.ParamValues[0].AsString,
                                                   sAuxDataDiferido ) Then
            Begin
              bbtnDesfazPgto.Enabled  := False;
              bbtnCriaLote.Enabled    := False;
              bbtnPgto.enabled        := false;
              bbtnPgtoParcial.enabled := false;
              DesabilitaLote;
              FuncaoGeral.TiraIcone;
            End;
          end
          Else //andre tavares pendência 24321
          Begin
             MsgDlg( 'Deve-se selecionar uma Conta Caixa X Forma de Pagamento', 'Aviso', mtWarning, [ mbOk ], 0 );
             bbtnDesfazPgto.enabled := true;
          End;
        Finally
          MsgDlg( CtrlGeraLotePgto.MessageInfo, 'Aviso', mtWarning, [ mbOk ], 0 );
        End;

    end;
  End;
End;

procedure TFrmGeraLotePgtoMT.bbtnSelecionaDocClick(Sender: TObject);
Var
  DocPend         : Integer;
  ValtotSel       : Double;

Begin
  Inherited;


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

      //Marcus Oliveira P. 25644 22/06/2007 Inicio
      AtualizaValoresStatusSelecao;

      Screen.Cursor := CrDefault;
      CdsDocPendentes.EnableControls;
      CdsLoteXDocumento.EnableControls;
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
         AFont.Color := $0080FFFF;
         ABrush.Color:=ClRed;
       end;
  End
  Else
  if (Field.FieldName='SALDO') OR
     (Field.FieldName='VALOR') Then
  begin
     AFont.Color:=clNavy;
     ABrush.Color := $0080FFFF;{Amarelo claro}
  end;

  //andré tavares - pendência 21601
  if ((Sender As TwwDbGrid).DataSource.DataSet.FindField ('FLGPPDIFERENTE') <> nil) then
    if (Not (Sender As TwwDbGrid).DataSource.DataSet.IsEmpty) And
       ((Sender As TwwDbGrid).DataSource.DataSet.FieldByName('FLGPPDIFERENTE').AsString = 'S') then
    begin
       AFont.Color := clGrayText;
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
Var
  DocPend         : Integer;
  ValtotSel       : Double;

Begin
  Inherited;

  FrmParamGeraLote := TFrmParamGeraLote.Create(self);

  // Rodolpho da Silva - 28/11/2006
  FrmParamGeraLote.ExibirCheckBox(False);

  FrmParamGeraLote.EventoGetParam := GetParams;
  FrmParamGeraLote.ShowModal;
  if FrmParamGeraLote.modalResult = mrOK then
  begin
    Try
      DocPend   := 0;
      ValtotSel := 0;

//andre tavares pendência 24229 - 17/01/2007
      if trim(CmpDadosParaBaixa.ParamValues[0].asString) <> '' then
        CtrlGeraLotePgto.bbtnSelecionaDocClick( CmpDadosParaBaixa,
                                                Modulo.CodDocCPMF,
                                                DocPend,
                                                ValtotSel );
    Finally
      bbtnPgtoParcial.Enabled := Not CdsDocPendentes.IsEmpty;
      bbtnPgto.Enabled := bbtnPgtoParcial.Enabled;

      //Marcus Oliveira P. 25644 22/06/2007 Inicio
      AtualizaValoresStatusSelecao;
      //Marcus Oliveira P. 25644 22/06/2007 Fim

      Screen.Cursor := CrDefault;
      CdsDocPendentes.EnableControls;
      CdsLoteXDocumento.EnableControls;
    End;
  end;

  bbtnPgto.Enabled        := True;
  bbtnPgtoParcial.Enabled := True;
End;

procedure TFrmGeraLotePgtoMT.FormShow(Sender: TObject);
begin
   inherited;

   WindowState := wsMaximized;
end;



procedure TFrmGeraLotePgtoMT.dbgrdDocPendentesTitleButtonClick(
  Sender: TObject; AFieldName: String);
var
  IndexDef : TIndexDef;

  begin
  inherited;
//catia - p: 22472 - 14/07/2006
  if ( iOrdem = 0 ) or ( iOrdem = 2 ) then
    iOrdem := 1
  else
    iOrdem := 2;

  CdsDocPendentes.IndexName := '';
  CdsDocPendentes.IndexDefs.Clear;
  IndexDef := CdsDocPendentes.IndexDefs.AddIndexDef;
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

  CdsDocPendentes.IndexName := IndexDef.Name;
  CdsDocPendentes.First;
//fim

end;




procedure TFrmGeraLotePgtoMT.dbgrdLotePagtoTitleButtonClick(
  Sender: TObject; AFieldName: String);
var
  IndexDef : TIndexDef;

  begin
  inherited;
  if ( iOrdem = 0 ) or ( iOrdem = 2 ) then
    iOrdem := 1
  else
    iOrdem := 2;

  CdsLotePagto.IndexName := '';
  CdsLotePagto.IndexDefs.Clear;
  IndexDef := CdsLotePagto.IndexDefs.AddIndexDef;
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

  CdsLotePagto.IndexName := IndexDef.Name;
  CdsLotePagto.First;
//fim


end;

procedure TFrmGeraLotePgtoMT.FormDestroy(Sender: TObject);
begin
  self.CtrlGeraLotePgto.Free;
  self.CtrlBaixaDocumentos.free;
  inherited;
end;


procedure TFrmGeraLotePgtoMT.GetParams;//evento que pega os paâmetros do form Modal
var i: integer;
begin
  for i := 0 to FrmParamGeraLote.CmpDadosParaBaixa.params.Count - 1 do
    self.CmpDadosParaBaixa.ParamValues[i].Value := FrmParamGeraLote.CmpDadosParaBaixa.ParamValues[i].Value;

  if trim(self.CmpDadosParaBaixa.ParamValues[0].asString) <> '' then
    CdsDescPortadorForma.Locate('CODPORTFORMA', VarArrayOf([self.CmpDadosParaBaixa.ParamValues[0].asString]), [loPartialKey]);

end;

  //Marcus Oliveira - 25644 Atualiza valores da status bar Seleção
procedure TFrmGeraLotePgtoMT.AtualizaValoresStatusSelecao;
begin

  dValorTotCdsDocPendetes := 0;
  CdsDocPendentes.first;
  while not CdsDocPendentes.Eof do
  begin
    dValorTotCdsDocPendetes := dValorTotCdsDocPendetes + CdsDocPendentes.Fieldbyname('SALDO').AsFloat;
    CdsDocPendentes.Next;
  end;

  SbStatusSelecao.Panels[0].Text := 'Documentos pendentes: ' + IntToStr(CdsDocPendentes.RecordCount);
  SbStatusSelecao.Panels[1].Text := 'Valor total da seleção: ' + FloatToStrf(dValorTotCdsDocPendetes,ffCurrency,17,2);


end;

end.

