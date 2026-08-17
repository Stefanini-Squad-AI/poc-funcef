unit FCancelaOC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Mask, DBCtrls, TB97Ctls, Db, Wwdatsrc,
  DBTables, Wwquery, MontaSelect, ComCtrls, Grids, Wwdbigrd, Wwdbgrid,
  Menus;

type
  TFrmCancelaOC = class(TfrmSairAjuda)
    Dock972: TDock97;
    Label5: TLabel;
    Toolbar971: TToolbar97;
    btnCancela: TToolbarButton97;
    sbtnProcurar: TToolbarButton97;
    edNumOC: TDBEdit;
    qryOC: TwwQuery;
    dsOC: TwwDataSource;
    qryItemOC: TwwQuery;
    qryItemOCCODARTIGO: TStringField;
    qryItemOCDESCRICAO: TStringField;
    qryItemOCQTDEPEDIDA: TFloatField;
    qryItemOCCODMEDIDA: TStringField;
    qryItemOCVALORUN: TFloatField;
    qryItemOCIDITEMOC: TFloatField;
    qryItemOCNUMOC: TFloatField;
    qryItemOCQTDERECEBIDA: TFloatField;
    qryItemOCFLGITEMATENDIDO: TStringField;
    qryItemOCOBSITEMOC: TStringField;
    qryItemOCIDPRODVARI: TFloatField;
    qryItemOCCODPRODUTO: TStringField;
    dsItemOC: TwwDataSource;
    MontaSelect: TMontaSelect;
    Label1: TLabel;
    edFron: TDBEdit;
    Label2: TLabel;
    edData: TDBEdit;
    DBText1: TDBText;
    plnItem: TPanel;
    PgOC: TPageControl;
    TabItem: TTabSheet;
    TabOBS: TTabSheet;
    GrdItem: TwwDBGrid;
    memObsOC: TDBMemo;
    Splitter1: TSplitter;
    dsPrazoEntOC: TwwDataSource;
    qryPrazoEntOC: TwwQuery;
    qryPrazoEntOCQTDEENTREGA: TFloatField;
    qryPrazoEntOCPRAZOENTREGA: TFloatField;
    qryPrazoEntOCDATAENTREGA: TDateTimeField;
    qryPrazoEntOCIDITEMOC: TFloatField;
    qryPrazoEntOCPARCELAENTREGA: TFloatField;
    qryPrazoEntOCPERIODOPRAZO: TStringField;
    dsPrazoPagOC: TwwDataSource;
    qryPrazoPagOC: TwwQuery;
    qryPrazoPagOCPERCPAGTO: TFloatField;
    qryPrazoPagOCPRAZOPGTO: TFloatField;
    qryPrazoPagOCDATAPAGTO: TDateTimeField;
    qryPrazoPagOCIDITEMOC: TFloatField;
    qryPrazoPagOCPARCELAPGTO: TFloatField;
    qryPrazoPagOCPERIODOPRAZO: TStringField;
    dsAgregItemOC: TwwDataSource;
    qryAgregItemOC: TwwQuery;
    qryAgregItemOCDESCCUSTAGREG: TStringField;
    qryAgregItemOCALIQUOTA: TFloatField;
    qryAgregItemOCBASECALCULO: TFloatField;
    qryAgregItemOCVLRAGREGITEM: TFloatField;
    qryAgregItemOCIDITEMOC: TFloatField;
    qryAgregItemOCIDAGREGITEMOC: TFloatField;
    qryAgregItemOCCODTIPOCUSTAGREG: TFloatField;
    qrySCItemOC: TwwQuery;
    qrySCItemOCIDITEMOC: TFloatField;
    qrySCItemOCIDITEMSOLI: TFloatField;
    qrySCItemOCNUMSOLCOMPRA: TFloatField;
    qryItemOCSTATUS: TStringField;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Pendente: TLabel;
    Recebido: TLabel;
    Label6: TLabel;
    qryOCNUMOC: TFloatField;
    qryOCIDFORCLI: TFloatField;
    qryOCIDPESSOA: TFloatField;
    qryOCOCATENDIDA: TStringField;
    qryOCFLGIMPRESSA: TStringField;
    qryOCFLGCOMSEMOC: TStringField;
    qryOCSTATUS: TStringField;
    qryOCOBSOC: TStringField;
    qryOCDATAOC: TDateTimeField;
    qryOCIDPROCESSO: TFloatField;
    qryOCRAZAOSOCIAL: TStringField;
    qryOCFLGCOMSEMCOT: TStringField;
    qrySelCotacao: TwwQuery;
    qrySelCotacaoCODPROCESSO: TFloatField;
    qrySelCotacaoIDPROCXART: TFloatField;
    qrySelCotacaoIDCOMPRADOR: TFloatField;
    qryCotacao: TwwQuery;
    qryProcxArt: TwwQuery;
    dsSelCotacao: TwwDataSource;
    qryCotacaoCODPROCESSO: TFloatField;
    qryCotacaoIDPROCXART: TFloatField;
    qryCotacaoIDFORCLI: TFloatField;
    qryCotacaoPROPOSTA: TFloatField;
    qryCotacaoQTDEFORNECIDA: TFloatField;
    qryCotacaoPRECO: TFloatField;
    qryCotacaoCODMEDIDA: TStringField;
    qryCotacaoNUMCOT: TFloatField;
    qryCotacaoDATACOT: TDateTimeField;
    qryCotacaoOBS: TStringField;
    qryCotacaoMOECODIGO: TFloatField;
    qryCotacaoTXJUROS: TFloatField;
    qryProcxArtIDPROCXART: TFloatField;
    qryProcxArtCODPROCESSO: TFloatField;
    qryProcxArtIDPRODVARI: TFloatField;
    qryProcxArtCODARTIGO: TStringField;
    qryProcxArtQTDEPEDIDA: TFloatField;
    qryProcxArtCODMEDIDA: TStringField;
    qryProcxArtDATANECESSIDADE: TDateTimeField;
    qryPrazoPgto: TwwQuery;
    qryPrazoEntrega: TwwQuery;
    qryPrazoPgtoCODPROCESSO: TFloatField;
    qryPrazoPgtoIDPROCXART: TFloatField;
    qryPrazoPgtoIDFORCLI: TFloatField;
    qryPrazoPgtoPROPOSTA: TFloatField;
    qryPrazoPgtoIDPRAZOPGTO: TFloatField;
    qryPrazoPgtoPRAZOPGTO: TFloatField;
    qryPrazoPgtoPERIODOPRAZO: TStringField;
    qryPrazoPgtoDATAPGTO: TDateTimeField;
    qryPrazoPgtoPERCENT: TFloatField;
    qryPrazoEntregaCODPROCESSO: TFloatField;
    qryPrazoEntregaIDPROCXART: TFloatField;
    qryPrazoEntregaIDFORCLI: TFloatField;
    qryPrazoEntregaPROPOSTA: TFloatField;
    qryPrazoEntregaIDPRAZOENT: TFloatField;
    qryPrazoEntregaQTDEENT: TFloatField;
    qryPrazoEntregaCODMEDIDA: TStringField;
    qryPrazoEntregaPERIODOPRAZO: TStringField;
    qryPrazoEntregaDATAENT: TDateTimeField;
    qryImpostos: TwwQuery;
    qryImpostosCODPROCESSO: TFloatField;
    qryImpostosIDPROCXART: TFloatField;
    qryImpostosIDFORCLI: TFloatField;
    qryImpostosPROPOSTA: TFloatField;
    qryImpostosCODTIPOCUSTAGREG: TFloatField;
    qryImpostosBASECALCULO: TFloatField;
    qryImpostosPERCENT: TFloatField;
    qryImpostosVALOR: TFloatField;
    qrySCI: TwwQuery;
    dsSCI: TwwDataSource;
    qrySCINUMSOLCOMPRA: TFloatField;
    qrySCICODARTIGO: TStringField;
    qrySCIQTDEPEDIDA: TFloatField;
    qrySCIQTDEPENDENTE: TFloatField;
    qrySCICODMEDIDA: TStringField;
    qrySCIOBSITEMSOLIC: TStringField;
    Label3: TLabel;
    edProcesso: TDBEdit;
    qryItemOCCODPROCESSO: TFloatField;
    PgItem: TPageControl;
    TabPrazoEnt: TTabSheet;
    GrdPrazoEnt: TwwDBGrid;
    TabPrazoPag: TTabSheet;
    GrdPrazoPag: TwwDBGrid;
    TabAgreg: TTabSheet;
    wwDBGrid1: TwwDBGrid;
    TabObsItem: TTabSheet;
    qrySCIDESCRICAO: TStringField;
    Panel4: TPanel;
    Label4: TLabel;
    dbreOBS: TDBRichEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure dsItemOCDataChange(Sender: TObject; Field: TField);
    procedure btnCancelaClick(Sender: TObject);
    procedure GrdItemCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure GrdItemDblClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GrdItemMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
     Procedure Sel( iNumOC : LongInt );
     Procedure SelFilhos( iIDitemOC : LongInt);
     Function  PodeCancelarOC( iIDitemOC : LongInt ) : Boolean;
     Function  CancelaItem(iIdItemOC:LongInt;bComCotacao:Boolean; var iNumCot: LongInt) : Boolean;
     Procedure ViewSCI( iIDitemOC : LongInt );
     Procedure ViewCotacao( iIDitemOC : LongInt );
  public
    { Public declarations }
  end;

var
  FrmCancelaOC: TFrmCancelaOC;
  iNumCot     : LongInt;
implementation

{$R *.DFM}

Uses uMensErro, DbaseDados, uDataBase, uModulo, FViewSCI,
     DCompras, uSistema,FViewCotacao;

procedure TFrmCancelaOC.FormCreate(Sender: TObject);
begin
  inherited;
  iNumCot := 0;
  qryOC.Close;
  If Not qryOC.Prepared Then qryOC.Prepare;
  qryItemOC.Close;
  If Not qryItemOC.Prepared Then qryItemOC.Prepare;
  qryPrazoEntOC.Close;
  If Not qryPrazoEntOC.Prepared Then qryPrazoEntOC.Prepare;
  qryPrazoPagOC.Close;
  If Not qryPrazoPagOC.Prepared Then qryPrazoPagOC.Prepare;
  qryAgregItemOC.Close;
  If Not qryAgregItemOC.Prepared Then qryAgregItemOC.Prepare;
  qrySCItemOC.Close;
  If Not qrySCItemOC.Prepared Then qrySCItemOC.Prepare;
  qrySelCotacao.Close;
  If Not qrySelCotacao.Prepared Then qrySelCotacao.Prepare;
  qryCotacao.Close;
  If Not qryCotacao.Prepared Then qryCotacao.Prepare;
  qryProcxArt.Close;
  If Not qryProcxArt.Prepared Then qryProcxArt.Prepare;
  qryPrazoPgto.Close;
  If Not qryPrazoPgto.Prepared Then qryPrazoPgto.Prepare;
  qryPrazoEntrega.Close;
  If Not qryPrazoEntrega.Prepared Then qryPrazoEntrega.Prepare;
  qryImpostos.Close;
  If Not qryImpostos.Prepared Then qryImpostos.Prepare;
  qrySCI.Close;
  If Not qrySCI.Prepared Then qrySCI.Prepare;
  Sel(-1);
  //
  qrySelCotacao.Close;
  qrySelCotacao.ParamByName('IDITEMOC').AsInteger := -1;
  qrySelCotacao.Open;
  //
  qryCotacao.Open;
  qryProcxArt.Open;
  qryPrazoPgto.Open;
  qryPrazoEntrega.Open;
  qryImpostos.Open;

  MontaSelect.Filtro.Add('OC.IDPESSOA = '+IntToStr(Sistema.IdEmpresa) );  
end;

procedure TFrmCancelaOC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryOC.Close;
  If qryOC.Prepared Then qryOC.UnPrepare;
  qryItemOC.Close;
  If qryItemOC.Prepared Then qryItemOC.UnPrepare;
  qryPrazoEntOC.Close;
  If qryPrazoEntOC.Prepared Then qryPrazoEntOC.UnPrepare;
  qryPrazoPagOC.Close;
  If qryPrazoPagOC.Prepared Then qryPrazoPagOC.UnPrepare;
  qryAgregItemOC.Close;
  If qryAgregItemOC.Prepared Then qryAgregItemOC.UnPrepare;
  qrySCItemOC.Close;
  If qrySCItemOC.Prepared Then qrySCItemOC.UnPrepare;
  qrySelCotacao.Close;
  If qrySelCotacao.Prepared Then qrySelCotacao.UnPrepare;
  qryCotacao.Close;
  If qryCotacao.Prepared Then qryCotacao.UnPrepare;
  qryProcxArt.Close;
  If qryProcxArt.Prepared Then qryProcxArt.UnPrepare;
  qryPrazoPgto.Close;
  If qryPrazoPgto.Prepared Then qryPrazoPgto.UnPrepare;
  qryPrazoEntrega.Close;
  If qryPrazoEntrega.Prepared Then qryPrazoEntrega.UnPrepare;
  qryImpostos.Close;
  If qryImpostos.Prepared Then qryImpostos.UnPrepare;
  qrySCI.Close;
  If qrySCI.Prepared Then qrySCI.UnPrepare;
end;

Procedure TFrmCancelaOC.Sel( iNumOC : LongInt );
Begin
  qryOC.Close;
  qryOC.ParamByName('pNUMOC').AsInteger := iNumOC;
  qryOC.Open;
  //
  qryItemOC.Close;
  qryItemOC.ParamByName('NUMOC').AsInteger := iNumOC;
  qryItemOC.Open;
  qryItemOC.First;
  //
  btnCancela.Enabled := Not qryOC.IsEmpty;
End;

Procedure TFrmCancelaOC.SelFilhos( iIdItemOC : LongInt);
Begin
  qryPrazoEntOC.Close;
  qryPrazoEntOC.Params[0].AsInteger := iIdItemOC;
  qryPrazoEntOC.Open;
  //
  qryPrazoPagOC.Close;
  qryPrazoPagOC.Params[0].AsInteger := iIdItemOC;
  qryPrazoPagOC.Open;
  //
  qryAgregItemOC.Close;
  qryAgregItemOC.Params[0].AsInteger := iIdItemOC;
  qryAgregItemOC.Open;
  //
  qrySCItemOC.Close;
  qrySCItemOC.Params[0].AsInteger := iIdItemOC;
  qrySCItemOC.Open;
End;

procedure TFrmCancelaOC.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;
  If MontaSelect.RetornouValor Then Begin
     Sel(StrToInt(MontaSelect.ValoresChave[0]));
     iNumCot := 0;
  end;
end;

procedure TFrmCancelaOC.dsItemOCDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  If dsItemOC.DataSet.State = dsBrowse Then
     SelFilhos( qryItemOCIDITEMOC.AsInteger );
end;

Function TFrmCancelaOC.PodeCancelarOC( iIDitemOC : LongInt ) : Boolean;
Var
  sSQL : String;
Begin
    Result := True;
    sSQL := ' SELECT IDITEMOC FROM ITEMOC '+
            ' WHERE  (QTDERECEBIDA > 0) '+
            ' AND ( NUMOC = '+IntToStr(qryOCNUMOC.AsInteger)+') ';
    If FazQuery(DtmBaseDados.qry,sSQL) Then
       Result := False;
End;

procedure TFrmCancelaOC.btnCancelaClick(Sender: TObject);
var bComCotacao : Boolean;
begin
  inherited;
  If PodeCancelarOC( qryOCNUMOC.AsInteger ) Then
     Begin
        If MsgDlg('Confirma o cancelamento da O.C. TODA','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes Then
           Begin
               Try
                   StartTransacao;
                   If Not ExecutarQuery(DtmBaseDados.qry,'UPDATE OC SET OCATENDIDA =''C'' WHERE (NUMOC = '+IntToStr(qryOCNUMOC.AsInteger)+') ') Then
                      Abort;
                   If Not DtmCompras.DeletaPrevCap(qryOCNUMOC.AsInteger) Then
                      Abort;

                   If Not qryOCIDPROCESSO.IsNull Then
                      If Not ExecutarQuery(DtmBaseDados.qry,'UPDATE RADINSTPROCESSO SET FLGOK = ''R'' WHERE (IDPROCESSO = '+IntToStr(qryOCIDPROCESSO.AsInteger)+') ') Then
                         Abort;
                   iNumCot     := 0;
                   bComCotacao := qryOCFLGCOMSEMCOT.AsString = 'C';
                   qryItemOC.First;
                   while not qryItemOC.EOF do begin
                      If qryItemOCSTATUS.AsString = 'P' then
                         if not CancelaItem(qryItemOCIDITEMOC.AsInteger,bComCotacao,iNumCot) Then Abort;
                      qryItemOC.Next;
                   end;
                   //
                   CommitTransacao;
                   If iNumCot <> 0 Then
                      MsgDlg('Foi gerado o processo de cotação Nº '+IntToStr(iNumCot),'Aviso',mtWarning,[mbOK],0);
                   MsgDlg('Cancelamento da O.C. Efetuado com Sucesso','Aviso',mtWarning,[mbOK],0);
                   Sel( -1 );
               Except
                   RollBackTransacao;
                   MsgDlg('Cancelamento da O.C. NÃO Efetuado','Erro',mtError,[mbOK],0);
                   Raise;
               End;
           End;
     End
  Else
     MsgDlg('Já existem itens recebidos. Não é possível o cancelamento da O.C. TODA. Cancele somente os itens possíveis.','Aviso',mtWarning,[mbOk],0);

End;

procedure TFrmCancelaOC.GrdItemCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  IF (Field.FieldName = 'STATUS') Then
     Begin
         If Field.AsString = 'P' Then
            ABrush.Color  := $0080FFFF
         Else
         If Field.AsString = 'C' Then
            ABrush.Color  := $008080FF
         Else
         If Field.AsString = 'R' Then
            ABrush.Color  := $0080FF80
         Else
         If Field.AsString = 'A' Then
            ABrush.Color  := ClAqua;

         If Highlight Then
            AFont.Color := clBlack;
     End;
end;

procedure TFrmCancelaOC.GrdItemDblClick(Sender: TObject);
var bComCotacao : Boolean;
    iNumCotAnt  : LongInt;
begin
  inherited;
  If Modulo.sFormCancela = 'S' Then
     Begin
        iNumCotAnt := iNumCot;
        If qryItemOCSTATUS.AsString = 'P' then
           Begin
              If MsgDlg('Confirma o cancelamento do Item '+qryItemOCDESCRICAO.AsString,'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
                 Begin
                    Try
                       StartTransacao;
                       bComCotacao := qryOCFLGCOMSEMCOT.AsString = 'C';
                       if not CancelaItem(qryItemOCIDITEMOC.AsInteger,bComCotacao,iNumCot) Then Abort;
                       CommitTransacao;
                       If (iNumCot <> 0) and (iNumCotAnt = 0) Then
                          MsgDlg('Foi gerado o processo de cotação Nº '+IntToStr(iNumCot)+'. Todos os itens cancelados nesta mesma operação receberão o mesmo número de processo','Aviso',mtWarning,[mbOK],0);
                       Sel(qryOCNUMOC.AsInteger);
                    Except
                       RollBackTransacao;
                       MsgDlg('Cancelamento do Item '+qryItemOCDESCRICAO.AsString+' NÃO Efetuado','Erro',mtError,[mbOK],0);
                       Raise;
                 End;
           End;
        End;
     End
  Else
    Begin
        ViewSCI(qryItemOCIDITEMOC.AsInteger);
    End;
end;

Function TFrmCancelaOC.CancelaItem(iIdItemOC:LongInt;bComCotacao:Boolean; var iNumCot: LongInt) : Boolean;
var sSql : String;
    DecAux  : Char;
Begin
   DecAux := DecimalSeparator;
   DecimalSeparator := '.';
   Try
      Result := False;
      If Not ExecutarQuery(DtmBaseDados.qry,'UPDATE ITEMOC SET FLGITEMATENDIDO =''C'' WHERE (IDITEMOC = '+IntToStr(iIdItemOC)+') ') Then
         Abort;
//====================================================================================================================================================================================
// Retorna a QTDE PENDETE da solicitação de Compras
//====================================================================================================================================================================================
     If Not bComCotacao Then
        Begin
           qrySCItemOC.First;
            While Not qrySCItemOC.Eof Do
               Begin
                  If Not ExecutarQuery(DtmBaseDados.qry,'UPDATE ITEMSOLI SET QTDEPENDENTE = QTDEPENDENTE + '+ Format('%12.2f',[qryItemOCQTDEPEDIDA.AsFloat]) +
                                                        ' WHERE (IDITEMSOLI = '+IntToStr(qrySCItemOCIDITEMSOLI.AsInteger)+') ') Then
                     Abort;
                  qrySCItemOC.Next;
               End;
        End;
//====================================================================================================================================================================================
      If bComCotacao Then
      begin
         qrySelCotacao.Close;
         qrySelCotacao.ParamByName('IDITEMOC').AsInteger := iIdItemOC;
         qrySelCotacao.Open;
         if not qrySelCotacao.IsEmpty then
         begin
            If iNumCot = 0 Then begin
               iNumCot := LeUltRegistro(nil,'PROCESSO');
               If Not ExecutarQuery(DtmBaseDados.qry,'INSERT INTO PROCESSO(CODPROCESSO,STATUS,IDCOMPRADOR) VALUES('+IntToStr(iNumCot)+',''C'','+IntToStr(qrySelCotacaoIDCOMPRADOR.AsInteger)+')') Then
                  Abort;
            end;
            sSql:='INSERT INTO PROCXART(IDPROCXART, CODPROCESSO, IDPRODVARI, '+
                  'CODARTIGO, QTDEPEDIDA, CODMEDIDA, DATANECESSIDADE) '+
                  'VALUES('+IntToStr(qryProcxArtIDPROCXART.AsInteger)+','+IntToStr(iNumCot)+',';
            If qryProcxArtIDPRODVARI.isNull Then
               sSql:=sSql+'NULL,'
            else
               sSql:=sSql+IntToStr(qryProcxArtIDPRODVARI.AsInteger)+',';
            sSql:=sSql+''''+qryProcxArtCODARTIGO.AsString+''','+Format('%12.2f',[qryProcxArtQTDEPEDIDA.AsFloat])+','+
                       ''''+qryProcxArtCODMEDIDA.AsString+''', TO_DATE('''+qryProcxArtDATANECESSIDADE.AsString+''',''DD/MM/YYYY''))';
            If Not ExecutarQuery(DtmBaseDados.qry,sSql) Then
               Abort;
            If Not ExecutarQuery(DtmBaseDados.qry,'UPDATE ITEMSOLI SET CODPROCESSO = '+IntToStr(iNumCot)+
                                                  ' WHERE (CODPROCESSO = '+IntToStr(qrySelCotacaoCODPROCESSO.AsInteger)+') AND (IDPROCXART = '+IntToStr(qrySelCotacaoIDPROCXART.AsInteger)+')') Then
               Abort;
            //
            qryCotacao.First;
            While not qryCotacao.EOF do
            begin
               sSql:='INSERT INTO COTACOES(IDPROCXART, CODPROCESSO, IDFORCLI, PROPOSTA, QTDEFORNECIDA, '+
                     'PRECO, CODMEDIDA, DATACOT, NUMCOT, OBS, MOECODIGO, TXJUROS) '+
                     'VALUES('+IntToStr(qryCotacaoIDPROCXART.AsInteger)+','+IntToStr(iNumCot)+','+
                     IntToStr(qryCotacaoIDFORCLI.AsInteger)+','+IntToStr(qryCotacaoPROPOSTA.AsInteger)+','+
                     Format('%12.2f',[qryCotacaoQTDEFORNECIDA.AsFloat])+','+Format('%17.4f',[qryCotacaoPRECO.AsFloat])+','+
                     ''''+qryCotacaoCODMEDIDA.AsString+''', TO_DATE('''+qryCotacaoDATACOT.AsString+''',''DD/MM/YYYY''),';
               If qryCotacaoNUMCOT.isNull Then
                  sSql:=sSql+'NULL,'
               else
                  sSql:=sSql+IntToStr(qryCotacaoNUMCOT.AsInteger)+',';
               If qryCotacaoOBS.isNull Then
                  sSql:=sSql+'NULL,'
               else
                  sSql:=sSql+''''+qryCotacaoOBS.AsString+''',';
               If qryCotacaoMOECODIGO.isNull Then
                  sSql:=sSql+'NULL,'
               else
                  sSql:=sSql+IntToStr(qryCotacaoMOECODIGO.AsInteger)+',';
               If qryCotacaoTXJUROS.isNull Then
                  sSql:=sSql+'NULL)'
               else
                  sSql:=sSql+Format('%17.4f',[qryCotacaoTXJUROS.AsFloat])+')';
               If Not ExecutarQuery(DtmBaseDados.qry,sSql) Then
                  Abort;
               qryCotacao.Next;
            end;
            //
            qryPrazoPgto.First;
            While not qryPrazoPgto.EOF do
            begin
               sSql:='INSERT INTO PRAZOPGTO(IDPROCXART, CODPROCESSO, IDFORCLI, PROPOSTA, IDPRAZOPGTO, '+
                     'PRAZOPGTO, PERIODOPRAZO, DATAPGTO, PERCENT) '+
                     'VALUES('+IntToStr(qryPrazoPgtoIDPROCXART.AsInteger)+','+IntToStr(iNumCot)+','+
                     IntToStr(qryPrazoPgtoIDFORCLI.AsInteger)+','+IntToStr(qryPrazoPgtoPROPOSTA.AsInteger)+','+
                     IntToStr(qryPrazoPgtoIDPRAZOPGTO.AsInteger)+','+IntToStr(qryPrazoPgtoPRAZOPGTO.AsInteger)+','+
                     ''''+qryPrazoPgtoPERIODOPRAZO.AsString+''', TO_DATE('''+qryPrazoPgtoDATAPGTO.AsString+''',''DD/MM/YYYY''),'+
                     Format('%12.2f',[qryPrazoPgtoPERCENT.AsFloat])+')';
               If Not ExecutarQuery(DtmBaseDados.qry,sSql) Then
                  Abort;
               qryPrazoPgto.Next;
            end;
            //
            qryImpostos.First;
            While not qryImpostos.EOF do
            begin
               sSql:='INSERT INTO VALORAGREGCOT(IDPROCXART, CODPROCESSO, IDFORCLI, PROPOSTA, CODTIPOCUSTAGREG, '+
                     'BASECALCULO, PERCENT, VALOR) '+
                     'VALUES('+IntToStr(qryImpostosIDPROCXART.AsInteger)+','+IntToStr(iNumCot)+','+
                     IntToStr(qryImpostosIDFORCLI.AsInteger)+','+IntToStr(qryImpostosPROPOSTA.AsInteger)+','+
                     IntToStr(qryImpostosCODTIPOCUSTAGREG.AsInteger)+','+Format('%12.2f',[qryImpostosBASECALCULO.AsFloat])+','+
                     Format('%12.2f',[qryImpostosPERCENT.AsFloat])+','+Format('%12.2f',[qryImpostosVALOR.AsFloat])+')';
               If Not ExecutarQuery(DtmBaseDados.qry,sSql) Then
                  Abort;
               qryImpostos.Next;
            end;
            //
            qryPrazoEntrega.First;
            While not qryPrazoEntrega.EOF do
            begin
               sSql:='INSERT INTO PRAZOENTREGA(IDPROCXART, CODPROCESSO, IDFORCLI, PROPOSTA, IDPRAZOENT, '+
                     'CODMEDIDA, PERIODOPRAZO, DATAENT, QTDEENT) '+
                     'VALUES('+IntToStr(qryPrazoEntregaIDPROCXART.AsInteger)+','+IntToStr(iNumCot)+','+
                     IntToStr(qryPrazoEntregaIDFORCLI.AsInteger)+','+IntToStr(qryPrazoEntregaPROPOSTA.AsInteger)+','+
                     IntToStr(qryPrazoEntregaIDPRAZOENT.AsInteger)+','''+qryPrazoEntregaCODMEDIDA.AsString+''','+
                     ''''+qryPrazoEntregaPERIODOPRAZO.AsString+''', TO_DATE('''+qryPrazoEntregaDATAENT.AsString+''',''DD/MM/YYYY''),'+
                     Format('%12.2f',[qryPrazoEntregaQTDEENT.AsFloat])+')';
               If Not ExecutarQuery(DtmBaseDados.qry,sSql) Then
                  Abort;
               qryPrazoEntrega.Next;
            end;
            //
            If Not ExecutarQuery(DtmBaseDados.qry,'DELETE COTACOESTEMP WHERE (CODPROCESSO = '+IntToStr(qrySelCotacaoCODPROCESSO.AsInteger)+')'+
                                                  ' AND (IDPROCXART = '+IntToStr(qrySelCotacaoIDPROCXART.AsInteger)+')') Then
               Abort;
            If Not ExecutarQuery(DtmBaseDados.qry,'DELETE VALORAGREGCOT '+
                                                  ' WHERE (CODPROCESSO = '+IntToStr(qrySelCotacaoCODPROCESSO.AsInteger)+') AND (IDPROCXART = '+IntToStr(qrySelCotacaoIDPROCXART.AsInteger)+')') Then
               Abort;
            If Not ExecutarQuery(DtmBaseDados.qry,'DELETE PRAZOENTREGA '+
                                                  ' WHERE (CODPROCESSO = '+IntToStr(qrySelCotacaoCODPROCESSO.AsInteger)+') AND (IDPROCXART = '+IntToStr(qrySelCotacaoIDPROCXART.AsInteger)+')') Then
               Abort;
            If Not ExecutarQuery(DtmBaseDados.qry,'DELETE PRAZOPGTO '+
                                                  ' WHERE (CODPROCESSO = '+IntToStr(qrySelCotacaoCODPROCESSO.AsInteger)+') AND (IDPROCXART = '+IntToStr(qrySelCotacaoIDPROCXART.AsInteger)+')') Then
               Abort;
            If Not ExecutarQuery(DtmBaseDados.qry,'DELETE COTACOES '+
                                                  ' WHERE (CODPROCESSO = '+IntToStr(qrySelCotacaoCODPROCESSO.AsInteger)+') AND (IDPROCXART = '+IntToStr(qrySelCotacaoIDPROCXART.AsInteger)+')') Then
               Abort;
            If Not ExecutarQuery(DtmBaseDados.qry,'DELETE PROCXART  '+
                                                  ' WHERE (CODPROCESSO = '+IntToStr(qrySelCotacaoCODPROCESSO.AsInteger)+') AND (IDPROCXART = '+IntToStr(qrySelCotacaoIDPROCXART.AsInteger)+')') Then
               Abort;
         end;
      end;
      Result := True;
   Finally
      DecimalSeparator := DecAux;
   end;
end;

procedure TFrmCancelaOC.FormPaint(Sender: TObject);
begin
  inherited;
  btnCancela.Visible := Modulo.sFormCancela = 'S';
  //
  If Modulo.sFormCancela = 'S' then
     Begin
        FrmCancelaOC.Caption := 'Cancelamento de O.C.';
        GrdItem.Hint         := 'Duplo click para cancelar o item';
        Self.HelpContext     := 1130014;
     End
  else
     Begin
        FrmCancelaOC.Caption := 'Consulta O.C.';
        GrdItem.Hint         := 'Duplo click para Vizualizar a S.C.I.'+Chr(13)+
                                'Click com Botão direito para Vizualizar a Cotação.';
        Self.HelpContext     := 1130038;
     End;
  bbtnAjuda.HelpContext      := Self.HelpContext;
  
  Application.ProcessMessages;
end;

Procedure TFrmCancelaOC.ViewSCI( iIDitemOC : LongInt );
Begin
   qrySCI.Close;
   qrySCI.ParamByName('IDITEMOC').AsFloat := iIDitemOC;
   qrySCI.Open;
   Application.CreateForm(TFrmViewSCI,FrmViewSCI);
   FrmViewSCI.ShowModal;
End;

procedure TFrmCancelaOC.FormShow(Sender: TObject);
begin
  inherited;
  If Sistema.idRad <> 0 Then
     Begin
        If FazQuery(DtmBaseDados.qry,'SELECT NUMOC FROM OC WHERE(IDPROCESSO ='+IntToStr(Sistema.idRad)+')')
        Then
            Sel(DtmBaseDados.qry.FieldByName('NUMOC').asInteger );
     End;

end;

procedure TFrmCancelaOC.ViewCotacao( iIDitemOC : LongInt );
begin
   qrySelCotacao.Close;
   qrySelCotacao.ParamByName('IDITEMOC').AsInteger := iIdItemOC;
   qrySelCotacao.Open;
   If Not qrySelCotacao.IsEmpty Then
      Begin
         Application.CreateForm(TFrmViewCotacao,FrmViewCotacao);
         //
         FrmViewCotacao.DescProduto := qryItemOCDESCRICAO.AsString;
         FrmViewCotacao.CodProcesso := qrySelCotacaoCODPROCESSO.AsInteger;
         FrmViewCotacao.IdProcxArt  := qrySelCotacaoIDPROCXART.AsInteger;
         FrmViewCotacao.ShowModal;
      End;
end;

procedure TFrmCancelaOC.GrdItemMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
    If Modulo.sFormCancela <> 'S' Then
       If ssRight in Shift Then
          ViewCotacao(qryItemOCIDITEMOC.AsInteger);
end;

End.
