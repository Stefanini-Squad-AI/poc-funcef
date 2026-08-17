unit FGeraParcelaCont;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Mask, DBCtrls, MontaSelect, Db, Wwdatsrc,
  DBTables, Wwquery, Grids, Wwdbigrd, Wwdbgrid;

type
  TFrmGeraParcelaCont = class(TfrmSairAjuda)
    MontaSelect: TMontaSelect;
    Label1: TLabel;
    edNumCont: TDBEdit;
    Label2: TLabel;
    edNomeCont: TDBEdit;
    Label3: TLabel;
    btnBuscar: TBitBtn;
    btnGerar: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep971: TToolbarSep97;
    edComprador: TDBEdit;
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
    qryIDLOCATARIO: TFloatField;
    ds: TwwDataSource;
    qryDet: TwwQuery;
    qryDetIDIMOVEL: TFloatField;
    qryDetIDCONTRATOIMOVEL: TFloatField;
    qryCondPag: TwwQuery;
    qryCondPagIDCONTRATOIMOVEL: TFloatField;
    qryCondPagIDCONDPAGIMOVEL: TFloatField;
    qryCondPagINDCORRECAO: TFloatField;
    qryCondPagVLRFINANC: TFloatField;
    qryCondPagFLGSINAL: TStringField;
    qryCondPagDATAINI: TDateTimeField;
    qryCondPagPRAZO: TStringField;
    qryCondPagPERIODO: TFloatField;
    qryCondPagTAXAJUROS: TFloatField;
    qryCondPagPERIODOTAXA: TStringField;
    qryCondPagSISTCORRECAO: TStringField;
    qryCondPagNUMPARCELAS: TFloatField;
    qryCondPagATRASOINDCORREC: TFloatField;
    qryCondPagATRASOMULTA: TFloatField;
    qryCondPagATRASOTXJUROS: TFloatField;
    qryRAZAOSOCIAL: TStringField;
    qryParc: TwwQuery;
    qryParcIDPARCFINANCIMOV: TFloatField;
    qryParcCODDOCUMENTO: TFloatField;
    qryParcIDCONDPAGIMOVEL: TFloatField;
    qryParcVLRSALDODEVEDOR: TFloatField;
    qryParcVLRJUROS: TFloatField;
    qryParcVLRAMORTIZACAO: TFloatField;
    qryParcVLRPRESTACAO: TFloatField;
    qryParcDATAVENCIMENTO: TDateTimeField;
    qryParcNUMPARCELA: TFloatField;
    qryParcVLRPRESTATUALIZADA: TFloatField;
    qryParcVLRRESIDUO: TFloatField;
    qryParcVLRRESIDUOATUALI: TFloatField;
    qryParcVLRCORRIGIDOATRASO: TFloatField;
    qryParcVLRMULTAATRASO: TFloatField;
    qryParcVLRMORAATRASO: TFloatField;
    updParc: TUpdateSQL;
    Panel1: TPanel;
    Panel2: TPanel;
    grd: TwwDBGrid;
    dsParc: TwwDataSource;
    qryCondPagFLGPERCVALOR: TStringField;
    qryParcFATOR: TFloatField;
    procedure btnBuscarClick(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Sel( n : Double );
    Procedure GeraParc(n : Byte);
    Procedure Gera;
    Function CalcFator( cTipo : String; sDataAnt,sDataAtu : String ) : Double;
  public
    { Public declarations }
  end;

var
  FrmGeraParcelaCont: TFrmGeraParcelaCont;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, uDataBase, Math,uDiasUteis, dBasedados;

Procedure TFrmGeraParcelaCont.Sel( n : Double );
Begin
  qry.Close;
  If Not qry.Prepared then qry.Prepare;
  qry.Params[0].AsFloat := n;
  qry.Open;
  //
  qryDet.Close;
  If Not qryDet.Prepared then qryDet.Prepare;
  qryDet.Params[0].AsFloat := n;
  qryDet.Open;
  //
  qryCondPag.Close;
  If Not qryCondPag.Prepared then qryCondPag.Prepare;
  qryCondPag.Params[0].AsFloat := n;
  qryCondPag.Open;
  //
  qryParc.Close;
  If Not qryParc.Prepared then qryParc.Prepare;
  qryParc.Params[0].AsFloat := qryCondPagIDCONDPAGIMOVEL.AsFloat;
  qryParc.Open;
End;

procedure TFrmGeraParcelaCont.btnBuscarClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;
  if MontaSelect.RetornouValor Then
     Begin
        Sel(StrToFloat(MontaSelect.ValoresChave[0]));
        btnGerar.Enabled := True;
     End;
end;

Function TFrmGeraParcelaCont.CalcFator( cTipo : String; sDataAnt,sDataAtu : String ) : Double;
Var
   sSql : String;
Begin
    Result := 1;
    If Trim(sDataAnt) <> '' Then
    sDataAnt := Copy(sDataAtu,4,Length(sDataAnt));
    If Trim(sDataAtu) <> '' Then
    sDataAtu := Copy(sDataAtu,4,Length(sDataAtu));
    If cTipo = 'V' Then
       Begin
           sSql := ' SELECT '+
                   '      (MESATU.VALOR / MESANT.VALOR) AS FATOR  '+
                   '  FROM  '+
                   '      ( '+
                   '       SELECT COTVALOR AS VALOR '+
                   '       FROM COTACAOMOEDA        '+
                   '       WHERE  (MOECODIGO = '+qryCondPagINDCORRECAO.AsString+') '+
                   '          AND (TO_CHAR(COTDATA,''MM/YYYY'') = '+QuotedStr(sDataAnt)+') '+
                   '       )MESANT,'+
                   '      (        '+
                   '       SELECT COTVALOR AS VALOR '+
                   '       FROM COTACAOMOEDA        '+
                   '       WHERE  (MOECODIGO = '+qryCondPagINDCORRECAO.AsString+') '+
                   '          AND (TO_CHAR(COTDATA,''MM/YYYY'') = '+QuotedStr(sDataAtu)+') '+
                   '       )MESATU, '+
                   '  PARAMGLOBAL G '+
                   '  WHERE         '+
                   '       (G.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+') ';
           If FazQuery(DtmBaseDados.qry,sSql) Then
              Result := DtmBaseDados.qry.FieldByName('FATOR').AsFloat;
       End
    Else
       Begin
           sSql := ' SELECT COTVALOR AS VALOR '+
                   ' FROM COTACAOMOEDA        '+
                   ' WHERE  (MOECODIGO = '+qryCondPagINDCORRECAO.AsString+') '+
                   '    AND (TO_CHAR(COTDATA,''MM/YYYY'') = '+QuotedStr(sDataAtu)+') ';
           If FazQuery(DtmBaseDados.qry,sSql) Then
              Result := DtmBaseDados.qry.FieldByName('VALOR').AsFloat;
       End;
End;

Procedure TFrmGeraParcelaCont.GeraParc(n : Byte);
Var
   x             : Integer;
   k             : Integer;
   y             : Integer;
   q             : Integer;
   h             : Integer;
   Aux           : Double;
   rValPrestacao : Double;
   rSaldoDev     : Double;
   dVencimento   : TDateTime;
   rFator        : Double;
   rFatorAnt     : Double;
   IncParcela    : Integer;
   IncPrimParcVez : Integer;
   IncUltParcVez  : Integer;
   rResiduoAcum : Double;

Begin
   qryParc.Append;
   qryParcIDPARCFINANCIMOV.asFloat   := LeUltRegistro(nil,'PARCFINANCIMOV');
   qryParcCODDOCUMENTO.asFloat       := -1;
   qryParcIDCONDPAGIMOVEL.asFloat    := qryCondPagIDCONDPAGIMOVEL.AsFloat;
   qryParcVLRSALDODEVEDOR.asFloat    := qryCondPagVLRFINANC.AsFloat;
   qryParcVLRJUROS.asFloat           := 0;
   qryParcVLRAMORTIZACAO.asFloat     := 0;
   qryParcVLRPRESTACAO.asFloat       := 0;
   //qryParcDATAVENCIMENTO.AsDateTime  := qryCondPagDATAINI.AsDateTime;
   qryParcNUMPARCELA.asFloat         := 0;
   qryParcVLRPRESTATUALIZADA.asFloat := 0;
   qryParcVLRRESIDUO.asFloat         := 0;
   qryParcVLRRESIDUOATUALI.asFloat   := 0;
   qryParcVLRCORRIGIDOATRASO.asFloat := 0;
   qryParcVLRMULTAATRASO.asFloat     := 0;
   qryParcVLRMORAATRASO.asFloat      := 0;
   qryParcFATOR.AsFloat              := 1;
   qryParc.Post;
   //===============================
   // Nº de anos do Contrato
   q := n Div (12 div qryCondPagPERIODO.AsInteger);
   //===============================
   h := n;
   IncParcela     := 0;
   IncPrimParcVez := 0;
   IncUltParcVez  := 0;
   rResiduoAcum   := 0;
   q := q + 1;
   For y := 1 to q Do
      Begin
      //============================================================================================================
      // Teste a virada de ano (12 prestações)
      //============================================================================================================
        if y = 1 then
           rSaldoDev  := qryCondPagVLRFINANC.AsFloat
        else
           rSaldoDev  := (rSaldoDev * rFator) + rResiduoAcum;
        //
        rFator        := 0;
        rFatorAnt     := 1;
        if h = 0 then
           Break;
        if (qryCondPagTAXAJUROS.AsFloat <> 0) then begin
           Aux           := Power(1 + (qryCondPagTAXAJUROS.AsFloat/100),h);
           rValPrestacao := rSaldoDev *(((qryCondPagTAXAJUROS.AsFloat/100) * Aux)/(Aux -1));
        end else begin
           rValPrestacao := rSaldoDev / h;
        end;
        k             := (12 div qryCondPagPERIODO.AsInteger);
        if y = q then
           if n mod (12 div qryCondPagPERIODO.AsInteger) <> 0 then
              k := ((12 div qryCondPagPERIODO.AsInteger) - (((12 div qryCondPagPERIODO.AsInteger) * y) - n));
        IncPrimParcVez := IncParcela + 1;
        For x := 1 To k Do
          Begin
             qryParc.Append;
             Inc(IncParcela);
             If (x = 1) and (y = 1) Then
                dVencimento := DiasUteis.SomaMeses(qryCondPagDATAINI.AsDateTime,0)
             Else
                 dVencimento := DiasUteis.SomaMeses( dVencimento,1);
             rFator := 1;
             if not qryCondPagINDCORRECAO.isNull then begin
                // Calculo do Fator
                If qryCondPagFLGPERCVALOR.asString = 'V' Then
                   Begin
                      rFator := CalcFator(qryCondPagFLGPERCVALOR.asString,DateToStr(DiasUteis.SomaMeses( dVencimento,-1)),DateToStr((dVencimento)));
                   End
                Else
                   Begin
                     rFator  := CalcFator(qryCondPagFLGPERCVALOR.asString,'',DateToStr((dVencimento)));
                     rFator  :=  rFatorAnt * (1+(rFator/100));
                    End;
              end;
              rFatorAnt := rFator;
              qryParcFATOR.AsFloat := rFator;
              //
              qryParcIDPARCFINANCIMOV.asFloat   := LeUltRegistro(nil,'PARCFINANCIMOV');
              qryParcCODDOCUMENTO.asFloat       := -1;
              qryParcIDCONDPAGIMOVEL.asFloat    := qryCondPagIDCONDPAGIMOVEL.AsFloat;
              qryParcVLRJUROS.asFloat           := rSaldoDev * (qryCondPagTAXAJUROS.AsFloat/100);
              qryParcVLRAMORTIZACAO.asFloat     := rValPrestacao - qryParcVLRJUROS.asFloat;
              qryParcVLRSALDODEVEDOR.asFloat    := rSaldoDev - qryParcVLRAMORTIZACAO.asFloat;
              rSaldoDev                         := qryParcVLRSALDODEVEDOR.asFloat;
              qryParcDATAVENCIMENTO.asDateTime  :=  dVencimento;
              //
              qryParcVLRPRESTACAO.asFloat       := rValPrestacao;
              //
              qryParcNUMPARCELA.asFloat         := IncParcela;
              qryParcVLRPRESTATUALIZADA.asFloat := qryParcVLRPRESTACAO.asFloat * rFator;
              qryParcVLRRESIDUO.asFloat         := qryParcVLRPRESTATUALIZADA.asFloat - rValPrestacao;
              qryParcVLRRESIDUOATUALI.asFloat   := 0;
              // Não Grava Aqui
              qryParcVLRCORRIGIDOATRASO.asFloat := 0;
              qryParcVLRMULTAATRASO.asFloat     := 0;
              qryParcVLRMORAATRASO.asFloat      := 0;
              qryParc.Post;
              //
           End;
           IncUltParcVez  := IncParcela;
           qryParc.DisableControls;
           Try
              rResiduoAcum := 0;
              qryParc.First;
              While Not qryParc.Eof Do
                 Begin
                    if (qryParcNUMPARCELA.asInteger >= IncPrimParcVez) and
                       (qryParcNUMPARCELA.asInteger <= IncUltParcVez) then
                       Begin
                          qryParc.Edit;
                          qryParcVLRRESIDUOATUALI.asFloat := qryParcVLRRESIDUO.asFloat/qryParcFATOR.AsFloat*rFator;
                          qryParc.Post;
                          rResiduoAcum := rResiduoAcum + qryParcVLRRESIDUOATUALI.asFloat;
                       End;
                    qryParc.Next;
                 End;
           Finally
              qryParc.EnableControls;
           End;
           h := h - (12 div qryCondPagPERIODO.AsInteger);
      End;

  //
  qryParc.First;
End;

Procedure TFrmGeraParcelaCont.Gera;
Begin
   qryCondPag.First;
   While Not qryCondPag.Eof Do
      Begin
         GeraParc( qryCondPagNUMPARCELAS.AsInteger);
         qryCondPag.Next;
      End;
End;

procedure TFrmGeraParcelaCont.btnGerarClick(Sender: TObject);
begin
  inherited;
  btnGerar.Enabled := False;
  If Not qry.IsEmpty Then
     Begin
         If Not qryParc.IsEmpty Then
           If MsgDlg('Já existem parcelas geradas. Subistituir','Confirmação',mtConfirmation,[mbYes,mbNo],0) =mrYes Then
              Begin
                 qryParc.DisableControls;
                 Try
                    qryParc.First;
                    While Not qryparc.EOF Do qryParc.Delete;
                 Finally
                    qryParc.EnableControls;
                 End;
              End;
        Gera;
     End
end;

end.
{
 =====================================================================
  FORMULAS DOS CÁCULOS UTILIZADOS
 =====================================================================
  * Aux            = Power(1 + (Taxa de Juros/100), nº de Parcelas )
  * Prestação      = Saldo Devedor *(((Taxa de Juros/100) * Aux )/( Aux - 1 ));
  * Juros          = 1 % do SaldoDevedor do periodo Anterior
  * Amortização    = Prestação - Juros
  * Saldo Devedor  = Saldo Devedor Anterior - Amortização
  * Ultima parcela = (Nº da Parcela div 12) * 12 + 12

 }

 SELECT
     (MESATU.VALOR - MESANT.VALOR) AS FATOR
FROM
    (
     SELECT COTVALOR AS VALOR
     FROM COTACAOMOEDA
     WHERE  (MOECODIGO = 170)
        AND (COTDATA  = TO_DATE('11/2000','MM/YYYY')) 
     )MESANT,
    (
     SELECT COTVALOR AS VALOR
     FROM COTACAOMOEDA
     WHERE  (MOECODIGO = 170)
        AND (COTDATA  = TO_DATE('12/2000','MM/YYYY')) 
     )MESATU,
PARAMGLOBAL G
WHERE
     (G.IDPESSOA = 1)

