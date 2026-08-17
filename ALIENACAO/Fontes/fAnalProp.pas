unit fAnalProp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, Db, DBTables, Wwquery, Wwdatsrc,
  Mask, DBCtrls, TREdit, Grids, Wwdbigrd, Wwdbgrid, DBGrids, mProposta,
  ppDB, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDBPipe, ppDBBDE, ppTypes, ppStrtch,
  ppRegion, fPreview;

type
  TfrmAnalProp = class(TfrmSairAjuda)
    btnCalcular: TBitBtn;
    Panel1: TPanel;
    ToolbarSep971: TToolbarSep97;
    dsProp: TwwDataSource;
    Panel2: TPanel;
    grd: TwwDBGrid;
    qryGrid: TwwQuery;
    dsGrid: TwwDataSource;
    updGrid: TUpdateSQL;
    qryGridVLREVOLUCAOVENDA: TFloatField;
    qryGridVLRENDIMENTO: TFloatField;
    qryGridVLRALUGUEL: TFloatField;
    qryGridVLRRENDALUG: TFloatField;
    Panel3: TPanel;
    Label9: TLabel;
    edTotRend: TRealEdit;
    edTotDif: TRealEdit;
    edTotAlug: TRealEdit;
    qryGridMESREF: TStringField;
    qryProp: TwwQuery;
    qryPropIDCONTRATOIMOVEL: TFloatField;
    qryPropCONNUMERO: TStringField;
    qryPropCONNOME: TStringField;
    qryPropCONDATAINICIO: TDateTimeField;
    qryPropFLGTIPOCONTRATO: TStringField;
    qryPropCONTAXAADMIN: TFloatField;
    qryPropCONVLRAJUSTADO: TFloatField;
    qryPropCONVLRTOTAL: TFloatField;
    qryPropCONDESCRICAO: TMemoField;
    qryPropVLRPROPOSTA: TFloatField;
    qryPropVLRPRESENTE: TFloatField;
    qryPropVLRCONTABIL: TFloatField;
    qryPropCONINDICEMORA: TFloatField;
    qryPropCONINDICEREAJUSTE: TFloatField;
    qryPropCONDATAREAJUSTE: TDateTimeField;
    Label24: TLabel;
    edValorAvali: TRealEdit;
    lbTxCorret: TDBText;
    Label25: TLabel;
    lblAluguel: TLabel;
    edValorAlug: TRealEdit;
    lbPercAlug: TDBText;
    Label27: TLabel;
    Label28: TLabel;
    edValPresAnal: TRealEdit;
    qryGridMES: TFloatField;
    molProposta1: TmolProposta;
    Label1: TLabel;
    qryGridVLRRENDALUGACUM: TFloatField;
    qryGridVLRRENDALUGAPLIC: TFloatField;
    Label2: TLabel;
    Label3: TLabel;
    btnImprime: TBitBtn;
    pplGrid: TppBDEPipeline;
    rpAnalProp: TppReport;
    HeaderBand1: TppHeaderBand;
    Label11: TppLabel;
    Line1: TppLine;
    LblEmpresa: TppLabel;
    DetailBand1: TppDetailBand;
    FooterBand1: TppFooterBand;
    Line2: TppLine;
    LblSistema: TppLabel;
    Calc2: TppSystemVariable;
    Calc1: TppSystemVariable;
    ppDBText2: TppDBText;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDBText3: TppDBText;
    ppLabel5: TppLabel;
    ppDBText4: TppDBText;
    ppLine1: TppLine;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLine2: TppLine;
    qryGridVLRRECEBTO: TFloatField;
    qryCondPag: TwwQuery;
    qryCondPagIDCONTRATOIMOVEL: TFloatField;
    qryCondPagIDCONDPAGIMOVEL: TFloatField;
    qryCondPagINDCORRECAO: TFloatField;
    qryCondPagVLRFINANC: TFloatField;
    qryCondPagPRAZO: TStringField;
    qryCondPagPERIODO: TFloatField;
    qryCondPagTAXAJUROS: TFloatField;
    qryCondPagPERIODOTAXA: TStringField;
    qryCondPagNUMPARCELAS: TFloatField;
    qryCondPagFLGPERCVALOR: TStringField;
    qryGridVLRRENDRECEBTO: TFloatField;
    qryGridVLRRECEBTOACUM: TFloatField;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    lblProposta: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppRegion1: TppRegion;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    lblVlrPresente: TppLabel;
    lblVlrAluguel: TppLabel;
    lblVlrDif: TppLabel;
    ppRegion2: TppRegion;
    lblAlug: TppLabel;
    lblAval: TppLabel;
    lblPres: TppLabel;
    lblVlrAval: TppLabel;
    lblVlrAlug: TppLabel;
    lblVlrPres: TppLabel;
    Label4: TLabel;
    edTotReceb: TRealEdit;
    ppLabel17: TppLabel;
    lblVlrReceb: TppLabel;
    qryPropPERALUGUELIDEAL: TFloatField;
    qryPropPERCTXJURMERC: TFloatField;
    qryPropPERITXJURMERC: TStringField;
    qryCondPagFLGREAJMENSAL: TStringField;
    qryCondPagIDINDCORRPROJ: TFloatField;
    qryPropDATAOPERACAO: TDateTimeField;
    qryPropCONPERREAJUSTE: TFloatField;
    qryCondPagDATAVENCIMENTO: TDateTimeField;
    qryCondPagTIPOCONDPAG: TStringField;
    Label5: TLabel;
    Label6: TLabel;
    procedure btnCalcularClick(Sender: TObject);
    procedure molProposta1btnLimpaPropClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnImprimeClick(Sender: TObject);
    procedure rpAnalPropBeforePrint(Sender: TObject);
    procedure molProposta1btnBuscaPropClick(Sender: TObject);
    procedure grdCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure grdTopRowChanged(Sender: TObject);
  private
    { Private declarations }
    Procedure Sel( n : Double );
    Procedure Calc;
    Procedure CalcRecebimento(qryTempCondPag : Twwquery);
    Function  CalcProxReajuste(dUltReajuste:TDateTime) : TDateTime;
    Function  CalcValIndice(iIndice:LongInt;dDataRef:TDateTime;sExato:Char; var sTipo:String) : Double;
  public
    { Public declarations }
  end;

var
  frmAnalProp: TfrmAnalProp;

implementation

{$R *.DFM}

Uses uMensErro, math, dBaseDados, uDataBase, DFinanciamento, FCadPropFinanc,
     FPrincipal, uSistema, UFuncAlienacao, uFuncoesImob;

Procedure TfrmAnalProp.Sel( n : Double );
Begin
  qryProp.Close;
  If Not qryProp.Prepared then qryProp.Prepare;
  qryProp.Params[0].AsFloat := n;
  qryProp.Open;
  
  qryCondPag.Close;
  If Not qryCondPag.Prepared then qryCondPag.Prepare;
  qryCondPag.Params[0].AsFloat := n;
  qryCondPag.Open;

  qryGrid.Close;
  qryGrid.Open;
End;

procedure TfrmAnalProp.Calc;
Var
   x                : Integer;
   y,z : string;
   rTxMercado       : Double;
   rValAntVenda     : Double;
   rValAntAlug      : Double;
   rValAlugRend     : Double;
   rValAluguel      : Double;
   rValAlugRendAcum : Double;
   dDataRef         : TDateTime;
   dProxReajuste    : TDateTime;
   dReajusteAnt     : TDateTime;
   rIndiceAnt, rIndiceAtu,rFatCorr : Double;
   sTipo            : String;
   iDia, iMes, iAno : Word;
   iDiaP, iMesP, iAnoP: Word;
Begin

   if (qryPropCONVLRTOTAL.AsFloat <= 0) and (qryPropCONVLRAJUSTADO.AsFloat <= 0) then begin
      MsgDlg('Não existe valor de aluguel nesta proposta','Erro',mtError,[mbOk],0);
      Exit;
   end;

   
   edValorAlug.Value   := 0;
   edValorAvali.Value  := (qryPropCONVLRAJUSTADO.AsFloat / (1-(qryPropCONTAXAADMIN.AsFloat/100)));
   if qryPropPERALUGUELIDEAL.AsFloat <> 0 then begin
      if qryPropCONVLRTOTAL.AsFloat > 0 then begin
         lblAluguel.Caption := 'Aluguel / ';
         edValorAlug.Value  := (qryPropCONVLRTOTAL.AsFloat / (qryPropPERALUGUELIDEAL.AsFloat/100));
      end else begin
         lblAluguel.Caption := 'Avaliação * ';
         edValorAlug.Value := (qryPropCONVLRAJUSTADO.AsFloat * (qryPropPERALUGUELIDEAL.AsFloat/100));
      end;
   end;
   edValPresAnal.Value := qryPropVLRPRESENTE.AsFloat;

   // Converte a taxa do mercado finaceiro para mes
   rTxMercado := qryPropPERCTXJURMERC.AsFloat;
   if qryPropPERITXJURMERC.AsString = 'D' then begin
      rTxMercado := Power(((rTxMercado/100) + 1),30);
      rTxMercado := (rTxMercado - 1) * 100;
   end;
   if qryPropPERITXJURMERC.AsString = 'A' then begin
      rTxMercado := Power(((rTxMercado/100) + 1),(1/12));
      rTxMercado := (rTxMercado - 1) * 100;
   end;

   edTotRend.Value  := 0;
   edTotAlug.Value  := 0;
   edTotReceb.Value := 0;
   rValAlugRend     := 0;
   if qryPropCONVLRTOTAL.AsFloat > 0 then begin
      rValAluguel   := qryPropCONVLRTOTAL.AsFloat;
   end else begin
      rValAluguel   := qryPropCONVLRAJUSTADO.AsFloat * (qryPropPERALUGUELIDEAL.AsFloat/100);
   end;
   dDataRef         := qryPropDATAOPERACAO.AsDateTime;
   rValAntAlug      := 0;
   rValAntVenda     := 0;
   rValAlugRendAcum := 0;
   rFatCorr         := 0;

   dReajusteAnt  := qryPropCONDATAREAJUSTE.AsDateTime;
   dProxReajuste := CalcProxReajuste(qryPropCONDATAREAJUSTE.AsDateTime);
   while dProxReajuste <= dDataRef do begin
      dReajusteAnt  := dProxReajuste;
      dProxReajuste := CalcProxReajuste(dProxReajuste);
   end;

   For x := 1 To 1000 Do
      Begin
         If qryPropVLRPRESENTE.AsFloat <= edTotAlug.Value Then
            Break;
         qryGrid.Append;
         qryGridMes.asInteger := x;
         DecodeDate(dDataRef, iAno, iMes, iDia);
         DecodeDate(dProxReajuste, iAnoP, iMesP, iDiaP);
         qryGridMESREF.AsString := FormatFloat('00', StrToFloat(IntToStr(iMes))) +'/'+ IntToStr(iAno);
         y := DateToStr(dProxReajuste);
         z := DateToStr(dReajusteAnt);

         if (iMes = iMesP) and (iAno = iAnoP) then begin

            rFatCorr      := DtmFinanciamento.CalculaFatorCorrecao(qryPropCONINDICEREAJUSTE.AsInteger, dReajusteAnt, dProxReajuste, False);
            dReajusteAnt  := dProxReajuste;
            dProxReajuste := CalcProxReajuste(dProxReajuste);

            if rFatCorr <> 0 then begin
               rValAluguel := rValAluguel * rFatCorr;
            end;
         end;
         IF  x = 1 Then
            Begin
               qryGridVLREVOLUCAOVENDA.AsFloat := qryPropVLRPRESENTE.AsFloat;
               rValAntVenda                    := qryGridVLREVOLUCAOVENDA.AsFloat;
               qryGridVLRALUGUEL.AsFloat       := 0;
               qryGridVLRRENDALUG.AsFloat      := 0;
            End
         Else
            Begin
               qryGridVLREVOLUCAOVENDA.AsFloat := rValAntVenda * (1 + (rTxMercado/100));
               qryGridVLRALUGUEL.AsFloat       := rValAntAlug;
               qryGridVLRRENDALUG.AsFloat      := (rValAntAlug+rValAlugRend) * (1 + (rTxMercado/100));
               rValAlugRend := (qryGridVLRRENDALUG.AsFloat - qryGridVLRALUGUEL.AsFloat);
               rValAlugRendAcum := rValAlugRendAcum + qryGridVLRRENDALUG.AsFloat;
            End;
         qryGridVLRRENDALUGAPLIC.AsFloat    := rValAlugRend;
         qryGridVLRRENDALUGACUM.AsFloat     := rValAlugRendAcum;
         qryGridVLRENDIMENTO.AsFloat        := qryGridVLREVOLUCAOVENDA.AsFloat - rValAntVenda;
         qryGrid.Post;
         rValAntVenda    := qryGridVLREVOLUCAOVENDA.AsFloat;
         rValAntAlug     := rValAluguel;
         edTotRend.Value := edTotRend.Value + qryGridVLRENDIMENTO.AsFloat;
         edTotAlug.Value := edTotAlug.Value + qryGridVLRRENDALUG.AsFloat;

         dDataRef := DiasUteis.SomaMeses(dDataRef,1);
      End;
      edTotDif.Value := edTotRend.Value - edTotAlug.Value;
   qryGrid.First;
End;

procedure TfrmAnalProp.btnCalcularClick(Sender: TObject);
begin
   inherited;
   if molProposta1.iProposta > 0 then begin
      Sel(molProposta1.iProposta);

      if (qryPropCONDATAREAJUSTE.AsDateTime  = 0) or
         (qryPropCONPERREAJUSTE.AsInteger    = 0) or
         (qryPropCONINDICEREAJUSTE.AsInteger = 0) then begin
         MsgDlg('Informe a forma de reajuste do aluguel na Proposta','Informação',mtInformation,[mbOk],0);
      end else begin
         qryGrid.DisableControls;
         Calc;
         CalcRecebimento(qryCondPag);
         qryGrid.EnableControls;
      end;
   end
   else begin
      MsgDlg('Selecione uma Proposta','Informação',mtInformation,[mbOk],0);
   end;
end;

function TfrmAnalProp.CalcProxReajuste(dUltReajuste:TDateTime) : TDateTime;
var iDia, iMes, iAno  : Word;
begin
   DecodeDate(dUltReajuste, iAno, iMes, iDia);
   iMes := iMes + qryPropCONPERREAJUSTE.AsInteger;
   if iMes > 12 then begin
      iAno := iAno + (iMes div 12);
      iMes := iMes - (12 * (iMes div 12));
      if iMes = 0 then begin
         iMes := 12;
         iAno := iAno - 1;
      end;
   end;
   Result := EncodeDate(iAno, iMes, iDia);
end;

function TfrmAnalProp.CalcValIndice(iIndice:LongInt;dDataRef:TDateTime;sExato:Char; var sTipo:String) : Double;
var sSql:String;
begin
   Result := 0;
   if sExato = 'S' then
      sSql  := ' SELECT C.COTVALOR, '+
               '        M.FLGPERCVALOR '+
               ' FROM   COTACAOMOEDA C, '+
               '        MOEDA M '+
               ' WHERE  (M.MOECODIGO = C.MOECODIGO) '+
               '   AND  (C.MOECODIGO = '+IntToStr(iIndice)+') '+
               '   AND  (C.COTDATA = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))'
   else
      sSql  := ' SELECT C.COTVALOR, '+
               '        M.FLGPERCVALOR '+
               ' FROM   COTACAOMOEDA C, '+
               '        MOEDA M '+
               ' WHERE  (M.MOECODIGO = C.MOECODIGO) '+
               '   AND  (C.MOECODIGO = '+IntToStr(iIndice)+') '+
               '   AND  (C.COTDATA <= TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))'+
               ' ORDER BY C.COTDATA DESC ';
   if FazQuery(DtmBaseDados.qry,sSql) then begin
      Result := DtmBaseDados.qry.FieldByName('COTVALOR').AsFloat;
      sTipo  := DtmBaseDados.qry.FieldByName('FLGPERCVALOR').AsString;
   end;
end;

procedure TfrmAnalProp.molProposta1btnLimpaPropClick(Sender: TObject);
begin
  inherited;
  molProposta1.btnLimpaPropClick(Sender);
  qryGrid.Close;
  qryGrid.Open;
end;

procedure TfrmAnalProp.FormShow(Sender: TObject);
begin
  inherited;
  if gFrmCadPropAtivo = true then begin
     if FrmCadPropFinanc.MontaSelect.RetornouValor then begin
        molProposta1.iProposta := StrToInt(FrmCadPropFinanc.MontaSelect.ValoresChave[0]);
        molProposta1.edtNumProp.Text := FrmCadPropFinanc.edNumCont.Text;
        molProposta1.edtNomProp.Text := FrmCadPropFinanc.edNomeCont.Text;
     end else if FrmCadPropFinanc.MS_Imovel.RetornouValor then begin
        molProposta1.iProposta := StrToInt(FrmCadPropFinanc.MS_Imovel.ValoresChave[0]);
        molProposta1.edtNumProp.Text := FrmCadPropFinanc.edNumCont.Text;
        molProposta1.edtNomProp.Text := FrmCadPropFinanc.edNomeCont.Text;
     end;
  end;
end;

procedure TfrmAnalProp.btnImprimeClick(Sender: TObject);
begin
   inherited;
   qryGrid.DisableControls;
   TfrmPreview.CreateModalPreview(Application, rpAnalProp,
                                  rpAnalProp.PrinterSetup.DocumentName);
   qryGrid.EnableControls;
end;

procedure TfrmAnalProp.rpAnalPropBeforePrint(Sender: TObject);
begin
   inherited;
   lblEmpresa.Caption := Sistema.NomeEmpresa;
   lblSistema.Caption := Sistema.NomeCompleto;
   lblProposta.Caption:= molProposta1.edtNumProp.Text + ' - ' + molProposta1.edtNomProp.Text;
   lblAval.Caption    := 'Avaliação  +  ' + qryPropCONTAXAADMIN.AsString + '%';
   if qryPropCONVLRTOTAL.AsFloat > 0 then begin
      lblAlug.Caption    := 'Aluguel  /  '   + qryPropPERALUGUELIDEAL.AsString + '%';
   end else begin
      lblAlug.Caption    := 'Avaliação  *  '   + qryPropPERALUGUELIDEAL.AsString + '%';
   end;
   lblVlrPresente.Caption := edTotRend.Text;
   lblVlrAluguel.Caption  := edTotAlug.Text;
   lblVlrReceb.Caption    := edTotReceb.Text;
   lblVlrDif.Caption      := edTotDif.Text;
   lblVlrAval.Caption     := edValorAvali.Text;
   lblVlrAlug.Caption     := edValorAlug.Text;
   lblVlrPres.Caption     := edValPresAnal.Text;
end;

procedure TfrmAnalProp.CalcRecebimento(qryTempCondPag : Twwquery) ;
var sRef       : String;
    rTxMercado : Double;
    iVlrRecebto: Double;
    bPrimeiro  : Boolean;
    iDia, iMes, iAno : Word;
begin

   // Converte a taxa do mercado finaceiro para mes
   rTxMercado := qryPropPERCTXJURMERC.AsFloat;
   if qryPropPERITXJURMERC.AsString = 'D' then begin
      rTxMercado := Power(((rTxMercado/100) + 1),30);
      rTxMercado := (rTxMercado - 1) * 100;
   end;
   if qryPropPERITXJURMERC.AsString = 'A' then begin
      rTxMercado := Power(((rTxMercado/100) + 1),(1/12));
      rTxMercado := (rTxMercado - 1) * 100;
   end;

   qryTempCondPag.First;
   while not qryTempCondPag.eof do begin
      if (qryTempCondPag.FieldByName('TIPOCONDPAG').AsString = 'S') or
         (qryTempCondPag.FieldByName('TIPOCONDPAG').AsString = 'V') then begin

         DecodeDate(qryTempCondPag.FieldByName('DATAVENCIMENTO').AsDateTime, iAno, iMes, iDia);
         sRef := FormatFloat('00', StrToFloat(IntToStr(iMes))) +'/'+ IntToStr(iAno);
         if qryGrid.Locate('MESREF',sRef,[]) then begin
            qryGrid.Edit;
            qryGridVLRRECEBTO.AsFloat := qryGridVLRRECEBTO.AsFloat + qryTempCondPag.FieldByName('VLRFINANC').AsFloat;
            qryGrid.Post;
         end;
      end else begin
         with dtmFinanciamento do begin
            LimpaParametros(dtmFinanciamento.qryParc);
            qryParc.ParamByName('IDCONDPAGIMOVEL').AsFloat := qryTempCondPag.FieldByName('IDCONDPAGIMOVEL').AsFloat;
            qryParc.Open;
            if qryParc.IsEmpty then
               FuncAlienacao.GeraParcela(qryTempCondPag.FieldByName('IDCONDPAGIMOVEL').AsFloat,
                                         qryTempCondPag.FieldByName('DATAVENCIMENTO').AsDateTime,
                                         Date(), DtmFinanciamento.qryParc);

            qryParc.First;
            while not qryParc.eof do begin
               DecodeDate(qryParcDATAVENCIMENTO.AsDateTime, iAno, iMes, iDia);
               sRef := FormatFloat('00', StrToFloat(IntToStr(iMes))) +'/'+ IntToStr(iAno);
               if frmAnalProp.qryGrid.Locate('MESREF',sRef,[]) then begin
                  frmAnalProp.qryGrid.Edit;
                  frmAnalProp.qryGridVLRRECEBTO.AsFloat := frmAnalProp.qryGridVLRRECEBTO.AsFloat + qryParcVLRPRESTACAO.AsFloat;
                  frmAnalProp.qryGrid.Post;
               end;
               qryParc.Next;
            end;
         end;
      end;
      qryCondPag.Next;
   end;

   bPrimeiro   := True;
   iVlrRecebto := 0;
   qryGrid.First;
   while not qryGrid.eof do begin
      qryGrid.Edit;
      if bPrimeiro then begin
         qryGridVLRRENDRECEBTO.AsFloat     := 0;
         qryGridVLRRECEBTOACUM.AsFloat     := qryGridVLRRECEBTO.AsFloat;
         iVlrRecebto := qryGridVLRRECEBTOACUM.AsFloat;
         bPrimeiro   := False;
      end else begin
         qryGridVLRRENDRECEBTO.AsFloat := iVlrRecebto * (rTxMercado/100);
         qryGridVLRRECEBTOACUM.AsFloat := iVlrRecebto + qryGridVLRRENDRECEBTO.AsFloat + qryGridVLRRECEBTO.AsFloat;
         iVlrRecebto := qryGridVLRRECEBTOACUM.AsFloat;
      end;
      edTotReceb.Value := qryGridVLRRECEBTOACUM.AsFloat;
      qryGrid.Post;
      qryGrid.next;
   end;
   qryGrid.First;
end;

procedure TfrmAnalProp.molProposta1btnBuscaPropClick(Sender: TObject);
begin
   inherited;
   molProposta1.btnBuscaPropClick(3,False, Sender);
   qryGrid.Close;
   qryGrid.Open;
   edTotRend.Text := '';
   edTotAlug.Text := '';
   edTotDif.Text  := '';
end;

procedure TfrmAnalProp.grdCalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWindow;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;

procedure TfrmAnalProp.grdTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;

end.
