unit fAnalProp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, Db, DBTables, Wwquery, Wwdatsrc,
  Mask, DBCtrls, TREdit, Grids, Wwdbigrd, Wwdbgrid;

type
  TfrmAnalProp = class(TfrmSairAjuda)
    btnBuscar: TBitBtn;
    Panel1: TPanel;
    ToolbarSep971: TToolbarSep97;
    MontaSelect: TMontaSelect;
    ds: TwwDataSource;
    Label1: TLabel;
    edNumCont: TDBEdit;
    Label2: TLabel;
    edNomeCont: TDBEdit;
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
    Label10: TLabel;
    qryGridMESREF: TStringField;
    qry: TwwQuery;
    qryIDCONTRATOIMOVEL: TFloatField;
    qryCONNUMERO: TStringField;
    qryCONNOME: TStringField;
    qryCONDATAASSINATURA: TDateTimeField;
    qryCONDATAINICIO: TDateTimeField;
    qryFLGTIPOCONTRATO: TStringField;
    qryCONPERCENTMORA: TFloatField;
    qryCONPERMORA: TStringField;
    qryCONTAXAADMIN: TFloatField;
    qryCONVLRAJUSTADO: TFloatField;
    qryCONPERREAJUSTE: TFloatField;
    qryCONPERCENTMULTA: TFloatField;
    qryCONVLRTOTAL: TFloatField;
    qryCONDESCRICAO: TMemoField;
    qryVLRPROPOSTA: TFloatField;
    qryVLRPRESENTE: TFloatField;
    qryVLRCONTABIL: TFloatField;
    qryCONINDICEMORA: TFloatField;
    qryCONINDICEREAJUSTE: TFloatField;
    qryCONDATAREAJUSTE: TDateTimeField;
    qryCONDIASTOLERANCIA: TFloatField;
    Label24: TLabel;
    edValorAvali: TRealEdit;
    lbTxCorret: TDBText;
    Label25: TLabel;
    Label26: TLabel;
    edValorAlug: TRealEdit;
    lbPercAlug: TDBText;
    Label27: TLabel;
    Label28: TLabel;
    edValPresAnal: TRealEdit;
    qryGridMES: TFloatField;
    procedure btnBuscarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Sel( n : Double );
    Procedure Calc;
    Function  CalcProxReajuste(dUltReajuste:TDateTime) : TDateTime;
    Function  CalcValIndice(iIndice:LongInt;dDataRef:TDateTime;sExato:Char) : Double;
  public
    { Public declarations }
  end;

var
  frmAnalProp: TfrmAnalProp;

implementation

{$R *.DFM}

Uses uMensErro, math, dBaseDados, uDataBase;

Procedure TfrmAnalProp.Sel( n : Double );
Begin
  qry.Close;
  If Not qry.Prepared then qry.Prepare;
  qry.Params[0].AsFloat := n;
  qry.Open;
  //
  qryGrid.Close;
  qryGrid.Open;
End;

procedure TfrmAnalProp.Calc;
Var
   x             : Integer;
   rTxMercado    : Double;
   rValAntVenda  : Double;
   rValAntAlug   : Double;
   rValAlugRend  : Double;
   rValAluguel   : Double;
   dDataRef      : TDateTime;
   dProxReajuste : TDateTime;
   rIndiceAnt, rIndiceAtu : Double;
Begin
   //
   edValorAvali.Value  := (qryCONVLRAJUSTADO.AsFloat / (1-(qryCONTAXAADMIN.AsFloat/100)));
   if qryCONPERCENTMULTA.AsFloat <> 0 then
      edValorAlug.Value   := (qryCONVLRTOTAL.AsFloat / (qryCONPERCENTMULTA.AsFloat/100))
   else
      edValorAlug.Value   := 0;
   edValPresAnal.Value := qryVLRPRESENTE.AsFloat;
   // Converte a taxa do mercado finaceiro para mes
   if qryCONPERMORA.AsString = 'D' then
      rTxMercado := Power(qryCONPERCENTMORA.AsFloat,30)
   else
   If qryCONPERMORA.AsString = 'A' then
      rTxMercado := Power(qryCONPERCENTMORA.AsFloat,(1/12))
   else
      rTxMercado := qryCONPERCENTMORA.AsFloat;
   edTotRend.Value := 0;
   edTotAlug.Value := 0;
   rValAlugRend    := 0;
   rValAluguel     := qryCONVLRTOTAL.AsFloat;
   dDataRef        := qryCONDATAINICIO.AsDateTime;
   //
   rIndiceAnt    := CalcValIndice(qryCONINDICEREAJUSTE.AsInteger,qryCONDATAREAJUSTE.AsDateTime,'N');
   dProxReajuste := CalcProxReajuste(qryCONDATAREAJUSTE.AsDateTime);
   rIndiceAtu    := CalcValIndice(qryCONINDICEREAJUSTE.AsInteger,dProxReajuste,'N');
   For x := 1 To qryCONPERREAJUSTE.AsInteger Do
      Begin
         If qryVLRPRESENTE.AsFloat <= edTotAlug.Value Then
            Break;
         qryGrid.Append;
         qryGridMes.asInteger   := x;
         qryGridMESREF.AsString := Copy(DateToStr(dDataRef),4,7);
         if qryGridMESREF.AsString = Copy(DateToStr(dProxReajuste),4,7) then begin
            if rIndiceAnt <> 0 then
               rValAluguel := rValAluguel / rIndiceAnt * rIndiceAtu;
            rIndiceAnt    := rIndiceAtu;
            dProxReajuste := CalcProxReajuste(dProxReajuste);
            rIndiceAtu    := CalcValIndice(qryCONINDICEREAJUSTE.AsInteger,dProxReajuste,'N');
         end;
         IF  x = 1 Then
            Begin
               qryGridVLREVOLUCAOVENDA.AsFloat := qryVLRPRESENTE.AsFloat;
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
            End;
         qryGridVLRENDIMENTO.AsFloat        := qryGridVLREVOLUCAOVENDA.AsFloat - rValAntVenda;
         qryGrid.Post;
         rValAntVenda    := qryGridVLREVOLUCAOVENDA.AsFloat;
         rValAntAlug     := rValAluguel;
         edTotRend.Value := edTotRend.Value + qryGridVLRENDIMENTO.AsFloat;
         edTotAlug.Value := edTotAlug.Value + qryGridVLRRENDALUG.AsFloat;
         //
         dDataRef := StrToDate('15/'+Copy(DateToStr(dDataRef),4,7))+30;
      End;
      edTotDif.Value := edTotRend.Value - edTotAlug.Value;
   qryGrid.First;
End;

procedure TfrmAnalProp.btnBuscarClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;
  if MontaSelect.RetornouValor Then
     Begin
        Sel(StrToFloat(MontaSelect.ValoresChave[0]));
        Calc;
     End;
end;

function TfrmAnalProp.CalcProxReajuste(dUltReajuste:TDateTime) : TDateTime;
var iMes, iAno  : Integer;
    sMes, sAno, sUltReajuste : String;
begin
   sUltReajuste := DateToStr(dUltReajuste);
   iMes := StrToInt(copy(sUltReajuste,4,2));
   iAno := StrToInt(copy(sUltReajuste,7,4));
   iMes := iMes + qryCONDIASTOLERANCIA.AsInteger;
   if iMes > 12 Then
      Begin
         iAno := iAno + (iMes div 12);
         iMes := iMes - (12 * (iMes div 12));
      End;
   sAno := IntToStr(iAno);
   if iMes < 10 then
      sMes := '0'+IntToStr(iMes)
   else
      sMes := IntToStr(iMes);
   Result := StrToDate(copy(sUltReajuste,1,3)+sMes+'/'+sAno);
end;

function TfrmAnalProp.CalcValIndice(iIndice:LongInt;dDataRef:TDateTime;sExato:Char) : Double;
var sSql:String;
begin
   Result := 0;
   if sExato = 'S' then
      sSql  := ' SELECT C.COTVALOR '+
               ' FROM COTACAOMOEDA C  '+
               ' WHERE  (C.MOECODIGO = '+IntToStr(iIndice)+') '+
               '    AND (C.COTDATA = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))'
   else
      sSql  := ' SELECT C.COTVALOR '+
               ' FROM COTACAOMOEDA C  '+
               ' WHERE  (C.MOECODIGO = '+IntToStr(iIndice)+') '+
               '    AND (C.COTDATA <= TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))'+
               ' ORDER BY C.COTDATA DESC ';
   if FazQuery(DtmBaseDados.qry,sSql) Then
      Result := DtmBaseDados.qry.FieldByName('COTVALOR').AsFloat;
end;

end.
