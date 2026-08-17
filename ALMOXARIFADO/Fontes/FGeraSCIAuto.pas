unit FGeraSCIAuto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, fcLabel, Db,
  DBTables, Wwquery, wwdblook, TREdit, ComCtrls, Wwdatsrc, MontaSelect;

type
  TFrmGeraSCIAuto = class(TfrmSairAjuda)
    ToolbarSep971: TToolbarSep97;
    pln: TPanel;
    plnSCI: TPanel;
    plnReq: TPanel;
    plnlbReq: TPanel;
    fcLabel1: TfcLabel;
    GrdReq: TwwDBGrid;
    plnItem: TPanel;
    plnLbItem: TPanel;
    fcLabel2: TfcLabel;
    Splitter1: TSplitter;
    qryAtiv: TwwQuery;
    qryAtivUNIDNEGOC: TFloatField;
    qryAtivNOME: TStringField;
    Label6: TLabel;
    dblcCentRespon: TwwDBLookupCombo;
    Label7: TLabel;
    dblcAtiv: TwwDBLookupCombo;
    GpDotOrc: TGroupBox;
    btnOrcamento: TSpeedButton;
    ReResOrc: TRealEdit;
    btnGerar: TBitBtn;
    BtnPreview: TBitBtn;
    pBar: TProgressBar;
    LbPreview: TLabel;
    qrySCI: TwwQuery;
    qryItem: TwwQuery;
    dsSCI: TwwDataSource;
    dsItem: TwwDataSource;
    updItem: TUpdateSQL;
    updSCI: TUpdateSQL;
    qryReqMat: TwwQuery;
    qryReqMatNUMREQUISICAO: TFloatField;
    qryReqMatDATAEMISSAO: TDateTimeField;
    qryReqMatDATANECESSIDADE: TDateTimeField;
    qryReqMatIDEMPRESA: TFloatField;
    qryReqMatCODCENTROCUSTO: TStringField;
    qryReqMatCODALMOXAORIGEM: TFloatField;
    qryReqMatCODARTIGO: TStringField;
    qryReqMatQTDEPEDIDA: TFloatField;
    qryReqMatCODMEDIDA: TStringField;
    qryReqMatDESCRICAO: TStringField;
    qryReqMatCODGRUPOPROD: TStringField;
    qryReqMatDESCALMOX: TStringField;
    qryGravaDet: TwwQuery;
    updGravaDet: TUpdateSQL;
    qryGrava: TwwQuery;
    GrdItem: TwwDBGrid;
    updGrava: TUpdateSQL;
    qryGravaDetIDITEMSOLI: TFloatField;
    qryGravaDetNUMSOLCOMPRA: TFloatField;
    qryGravaDetCODARTIGO: TStringField;
    qryGravaDetCODMEDIDA: TStringField;
    qryGravaDetQTDEPEDIDA: TFloatField;
    qryGravaDetQTDEPENDENTE: TFloatField;
    qryGravaDetDESCRICAO: TStringField;
    MsResORc: TMontaSelect;
    qrySCINUMREQUISICAO: TFloatField;
    qrySCINUMSOLCOMPRA: TFloatField;
    qrySCIIDPESSOA: TFloatField;
    qrySCIIDEMPRESA: TFloatField;
    qrySCICODCENTROCUSTO: TStringField;
    qrySCIDATAEMISSAO: TDateTimeField;
    qrySCIDATAENTREGA: TDateTimeField;
    qrySCICUSTOESTOQUE: TStringField;
    qrySCIIMPRESSO: TStringField;
    qrySCICODCENTRORESPON: TStringField;
    qrySCIUNIDNEGOC: TFloatField;
    qrySCICODALMOXARIFADO: TFloatField;
    qrySCIFLGPREPRONTA: TStringField;
    qrySCIIDRESERVAORCAMEN: TFloatField;
    qrySCIIDPROCESSO: TFloatField;
    qrySCIDESCALMOX: TStringField;
    qryGravaNUMREQUISICAO: TFloatField;
    qryGravaNUMSOLCOMPRA: TFloatField;
    qryGravaIDPESSOA: TFloatField;
    qryGravaIDEMPRESA: TFloatField;
    qryGravaCODCENTROCUSTO: TStringField;
    qryGravaDATAEMISSAO: TDateTimeField;
    qryGravaDATAENTREGA: TDateTimeField;
    qryGravaCUSTOESTOQUE: TStringField;
    qryGravaIMPRESSO: TStringField;
    qryGravaCODCENTRORESPON: TStringField;
    qryGravaUNIDNEGOC: TFloatField;
    qryGravaCODALMOXARIFADO: TFloatField;
    qryGravaFLGPREPRONTA: TStringField;
    qryGravaIDRESERVAORCAMEN: TFloatField;
    qryGravaIDPROCESSO: TFloatField;
    qryGravaDESCALMOX: TStringField;
    qryItemIDITEMSOLI: TFloatField;
    qryItemNUMSOLCOMPRA: TFloatField;
    qryItemCODARTIGO: TStringField;
    qryItemCODMEDIDA: TStringField;
    qryItemQTDEPEDIDA: TFloatField;
    qryItemQTDEPENDENTE: TFloatField;
    qryItemDESCRICAO: TStringField;
    qrySCISOLICIATENDIDA: TStringField;
    qrySCISOLICIACEITA: TStringField;
    qryGravaSOLICIATENDIDA: TStringField;
    qryGravaSOLICIACEITA: TStringField;
    qryGravaDetSALDOACOMPRAR: TFloatField;
    qryItemSALDOACOMPRAR: TFloatField;
    qryCRespon: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure BtnPreviewClick(Sender: TObject);
    procedure qrySCIAfterScroll(DataSet: TDataSet);
    procedure btnGerarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOrcamentoClick(Sender: TObject);
  private
    { Private declarations }
    bOk : Boolean;
    Procedure Sel( n : LongInt);
    Procedure Preview;
    Procedure Detalhe( n : LongInt);
    Procedure GeraSCI;
    Procedure Move( Var qo, qd : TwwQuery);

  public
    { Public declarations }
  end;

var
  FrmGeraSCIAuto: TFrmGeraSCIAuto;

implementation

{$R *.DFM}
Uses uSistema, uMensErro, uFuncaoGeral, uDataBase, dBaseDados,
     uIntegraback, uOrcamento, uModulo;

Procedure TFrmGeraSCIAuto.Preview;
Var
  rNumReq   : Double;
  sCodGrupo : String;
  iNumSol   : LongInt;

Begin
    //Gerando preview das SCI's
    Sel(-1);
    bOk       := False;
    rNumReq   := 0;
    iNumSol   := 0;
    sCodGrupo := '';
    qryReqMat.Close;
    qryReqMat.ParamByName('IDPESSOA').asInteger := Sistema.IdEmpresa;
    qryReqMat.Open;
    If Not qryReqMat.IsEmpty  Then
       Begin
          LbPreview.Visible := True;
          pBar.Visible      := True;
          pBar.Min          := -1;
          pBar.Max          := qryReqMat.RecordCount;
          Application.ProcessMessages;
          qryItem.DisableControls;
          qrySCI.DisableControls;
          qryReqMat.First;
          While Not qryReqMat.Eof Do
             Begin
                If ((rNumReq = 0 ) or (rNumReq <> qryReqMatNUMREQUISICAO.AsFloat)) or
                   ((sCodGrupo = '') or (sCodGrupo <> qryReqMatCODGRUPOPROD.AsString))
                Then
                   Begin
                      Inc( iNumSol );
                      rNumReq   := qryReqMatNUMREQUISICAO.AsFloat;
                      sCodGrupo := qryReqMatCODGRUPOPROD.AsString;
                      qrySCI.Append;
                      qrySCINUMREQUISICAO.AsFloat      := rNumReq;
                      qrySCINUMSOLCOMPRA.AsFloat       := iNumSol;
                      qrySCIIDPESSOA.AsInteger         := Sistema.IdEmpresa;
                      qrySCIIDEMPRESA.AsInteger        := qryReqMatIDEMPRESA.AsInteger;
                      qrySCICODCENTROCUSTO.asString    := qryReqMatCODCENTROCUSTO.AsString;
                      qrySCIDATAEMISSAO.AsDateTime     := qryReqMatDATAEMISSAO.AsDateTime;
                      qrySCICUSTOESTOQUE.asString      := 'E';
                      qrySCIIMPRESSO.asString          := 'F';
                      qrySCICODALMOXARIFADO.AsInteger  := qryReqMatCODALMOXAORIGEM.AsInteger;
                      qrySCIFLGPREPRONTA.asString      := 'N';
                      qrySCIDATAENTREGA.AsDateTime     := qryReqMatDATANECESSIDADE.AsDateTime;
                      qrySCIDESCALMOX.asString         := qryReqMatDESCALMOX.asString;
                      qrySCISOLICIATENDIDA.asString    := 'F';
                      qrySCISOLICIACEITA.asString      := 'N';
                      qrySCIIDRESERVAORCAMEN.Clear;
                      qrySCI.Post;
                   End;
                qryItem.Append;
                qryItemNUMSOLCOMPRA.asFloat  := iNumSol;
                qryItemCODARTIGO.asString    := qryReqMatCODARTIGO.AsString;
                qryItemCODMEDIDA.asString    := qryReqMatCODMEDIDA.AsString;
                qryItemQTDEPEDIDA.asFloat    := qryReqMatQTDEPEDIDA.asFloat;
                qryItemQTDEPENDENTE.asFloat  := qryReqMatQTDEPEDIDA.asFloat;
                qryItemSALDOACOMPRAR.asFloat := qryReqMatQTDEPEDIDA.asFloat;
                qryItemDESCRICAO.asString    := qryReqMatDESCRICAO.AsString;
                qryItem.Post;

                pBar.Position := pBar.Position + 1;
                Application.ProcessMessages;
                qryReqMat.Next;
             End;
          LbPreview.Visible := False;
          pBar.Visible      := False;
          qrySCI.First;
          qryItem.EnableControls;
          qrySCI.EnableControls;
          bOk               := True;
          Detalhe( qrySCINUMSOLCOMPRA.AsInteger );
       End
    Else
      MsgDlg('Não Existe Requsições pendetes para geração','Aviso',mtInformation,[mbOK],0);
End;


procedure TFrmGeraSCIAuto.FormCreate(Sender: TObject);
begin
  inherited;
  If GpDotOrc.Enabled Then
     MsResORc.Filtro.Add('RESERVAORCAMEN.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
  bOk := False;
  Sel(-1);
  //
  qryCRespon.Close;
  qryCRespon.ParamByName('PIDPESS').AsInteger   := Sistema.IdEmpresa;
  qryCRespon.ParamByName('IDUSUARIO').AsInteger := Sistema.IdUsuario;
  qryCRespon.Open;
  //
  qryAtiv.Open;
  //
  GpDotOrc.Enabled := (IntegraBack.IntegraOrcamento = 'S');
  OrcamentoBack := TOrcamentoBack.Create;
end;

Procedure TFrmGeraSCIAuto.Sel( n : LongInt);
Begin
  qryItem.Close;
  qryItem.Params[0].AsInteger := -1;
  qryItem.Open;
  //
  qrySCI.Close;
  qrySCI.Params[0].AsInteger := -1;
  qrySCI.Open;
End;

Procedure TFrmGeraSCIAuto.Detalhe( n : LongInt);
Begin
   qryItem.Filtered := False;
   qryItem.Filter   := 'NUMSOLCOMPRA = '+IntToStr( n );
   qryItem.Filtered := True;
End;


procedure TFrmGeraSCIAuto.BtnPreviewClick(Sender: TObject);
begin
  inherited;
  Preview;
end;

procedure TFrmGeraSCIAuto.qrySCIAfterScroll(DataSet: TDataSet);
begin
  inherited;
  If (qrySCI.State = dsBrowse) And ( bOK  ) Then
    Detalhe( qrySCINUMSOLCOMPRA.AsInteger );
end;

Procedure TFrmGeraSCIAuto.Move( Var qo, qd : TwwQuery);
Var
  x : Integer;
Begin
   qd.Append;
   For x := 0 To qo.FieldCount -1 Do
     qd.Fields[x].Value := qo.Fields[x].Value;
   qd.Post;
   qo.Delete;
End;

Procedure TFrmGeraSCIAuto.GeraSCI;
Var
  sNumReq : String;
  sCodArt : String;
  sSql    : TStringList;
  x       : Integer;
Begin
  sSql := TStringList.Create;
  Try
    sSql.Clear;
      Try
         qryGrava.Close;
         qryGrava.Open;
         //
         qryGravaDet.Close;
         qryGravaDet.Open;
         // Enibe o Filter da Query
         BOk := False;
         sNumReq := FloatToStr(QrySCINUMREQUISICAO.AsFloat);
         Move(QrySCI,qryGrava);
         qryGrava.Edit;
         qryGravaNUMSOLCOMPRA.AsFloat      := LeUltRegistro(nil,'SOLICOMP');
         qryGravaCODCENTRORESPON.AsString  := dblcCentRespon.LookupValue;
         qryGravaUNIDNEGOC.AsInteger       := StrToInt(dblcAtiv.LookupValue);
         If (GpDotOrc.Enabled) and (ReResOrc.Value > 0) Then
            Begin
              qryGravaIDRESERVAORCAMEN.Value := ReResOrc.Value;
              If OrcamentoBack.MarcaReserva(Trunc(ReResOrc.Value),True) <> 0 Then
                 Abort;
            End
         Else
            qryGravaIDRESERVAORCAMEN.Clear;
         qryGrava.Post;
         //
         QryItem.First;
         While Not QryItem.Eof Do
            Begin
               If (OrcamentoBack.IdReserva <> 0) and (not Modulo.ValidaOrcxArt(OrcamentoBack.IdReserva,qryItemCODARTIGO.AsString)) then
                  Begin
                      MsgDlg('O artigo '+qryItemDESCRICAO.AsString+' não pode ser solicitado por esta reserva orçamentária','Erro',mtError,[mbOk],0);
                      Abort;
                  End;
               sCodArt := qryItemCODARTIGO.AsString;
               sSql.Add(' UPDATE ITEMPEDI SET FLGSCI =''S'' '+
                        ' WHERE  (NUMREQUISICAO = '+sNumReq+')'+
                        '    AND (RTRIM(CODARTIGO) = '''+Trim(sCodArt)+''')');
               Move(QryItem,qryGravaDet);
               qryGravaDet.Edit;
               qryGravaDetNUMSOLCOMPRA.AsFloat := qryGravaNUMSOLCOMPRA.AsFloat;
               qryGravaDetIDITEMSOLI.AsFloat   := LeUltRegistro(nil,'ITEMSOLI');
               qryGravaDet.Post;
            End;
         StartTransacao;
         qryGrava.ApplyUpdates;
         qryGravaDet.ApplyUpdates;
         For x := 0 To sSql.Count -1 Do
             If Not ExecutarQuery(dtmBaseDados.qry,sSql.Strings[x]) Then
                Abort;
         CommitTransacao;
         MsgDlg('Nº da SCI : '+IntToStr(qryGravaNUMSOLCOMPRA.AsInteger),'Informação',mtInformation,[mbOk],0);
         BOk := True;
         If Not qrySCI.EOF Then
            qrySCI.Next
         Else
            qrySCI.Prior;
      Except
         BOk := True;
         MsgDlg('Não foi possível gerar a S.C.I.','Erro',mtError,[mbOk],0);
         RollbackTransacao;
         Raise;
      End;
  Finally
      sSql.Free;
  End;
End;

procedure TFrmGeraSCIAuto.btnGerarClick(Sender: TObject);
begin
  inherited;
  If trim(dblcCentRespon.Text ) = '' Then
     Begin
        MsgDlg('Centro de responsabilidade não foi preenchido','Erro',mtError,[mbOk],0);
        dblcCentRespon.SetFocus;
     End
  Else
  If trim(dblcAtiv.Text ) = '' Then
     Begin
        MsgDlg('Atividade e projeto não foi preenchido','Erro',mtError,[mbOk],0);
        dblcAtiv.SetFocus;
     End
  Else   
  If (GpDotOrc.Enabled) and (ReResOrc.Value > 0) Then
     Begin
        MsgDlg('Reserva orçamentária não foi preenchido','Erro',mtError,[mbOk],0);
        ReResOrc.SetFocus;
     End
  Else
  If qrySCI.IsEmpty Then
     Begin
        MsgDlg('Não foi gerado nenhum preview ','Erro',mtError,[mbOk],0);
     End
  Else
    Begin
        GeraSCI;
    End;
end;

procedure TFrmGeraSCIAuto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  OrcamentoBack.Free;
end;

procedure TFrmGeraSCIAuto.btnOrcamentoClick(Sender: TObject);
begin
  inherited;
  MsResORc.Executar;
  If  MsResORc.RetornouValor Then
     Begin
        ReResOrc.Value := StrToInt(MsResORc.ValoresChave[1]);
        OrcamentoBack.IdReserva := StrToInt(MsResORc.ValoresChave[0]);
     End;
end;

end.
