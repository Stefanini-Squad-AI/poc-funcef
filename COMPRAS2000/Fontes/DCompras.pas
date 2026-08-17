unit DCompras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery, Wwdatsrc; 

type
  TDtmCompras = class(TDataModule)
    qryOC: TwwQuery;
    qryItemOC: TwwQuery;
    qryPrazoEntOC: TwwQuery;
    qryPrazoPagOC: TwwQuery;
    qryAgregItemOC: TwwQuery;
    qryAgregOC: TwwQuery;
    qryItemOCIDITEMOC: TFloatField;
    qryItemOCNUMOC: TFloatField;
    qryItemOCCODARTIGO: TStringField;
    qryItemOCCODMEDIDA: TStringField;
    qryItemOCQTDEPEDIDA: TFloatField;
    qryItemOCQTDERECEBIDA: TFloatField;
    qryItemOCVALORUN: TFloatField;
    qryItemOCFLGITEMATENDIDO: TStringField;
    qryItemOCOBSITEMOC: TStringField;
    qryItemOCIDPRODVARI: TFloatField;
    qryPrazoEntOCIDITEMOC: TFloatField;
    qryPrazoEntOCPARCELAENTREGA: TFloatField;
    qryPrazoEntOCPRAZOENTREGA: TFloatField;
    qryPrazoEntOCQTDEENTREGA: TFloatField;
    qryPrazoEntOCPERIODOPRAZO: TStringField;
    qryPrazoEntOCDATAENTREGA: TDateTimeField;
    qryPrazoPagOCIDITEMOC: TFloatField;
    qryPrazoPagOCPARCELAPGTO: TFloatField;
    qryPrazoPagOCPRAZOPGTO: TFloatField;
    qryPrazoPagOCPERIODOPRAZO: TStringField;
    qryPrazoPagOCPERCPAGTO: TFloatField;
    qryPrazoPagOCDATAPAGTO: TDateTimeField;
    qryAgregItemOCIDITEMOC: TFloatField;
    qryAgregItemOCIDAGREGITEMOC: TFloatField;
    qryAgregItemOCCODTIPOCUSTAGREG: TFloatField;
    qryAgregItemOCALIQUOTA: TFloatField;
    qryAgregItemOCBASECALCULO: TFloatField;
    qryAgregItemOCVLRAGREGITEM: TFloatField;
    qryAgregOCIDAGREGTOTOC: TFloatField;
    qryAgregOCNUMOC: TFloatField;
    qryAgregOCCODTIPOCUSTAGREG: TFloatField;
    qryAgregOCALIQUOTA: TFloatField;
    qryAgregOCBASECALCULO: TFloatField;
    qryAgregOCVLRAGREGTOT: TFloatField;
    dsOC: TwwDataSource;
    dsItemOC: TwwDataSource;
    dsPrazoEntOC: TwwDataSource;
    dsPrazoPagOC: TwwDataSource;
    dsAgregItemOC: TwwDataSource;
    dsAgregOC: TwwDataSource;
    updOC: TUpdateSQL;
    updItemOC: TUpdateSQL;
    updPrazoEntOC: TUpdateSQL;
    updPrazoPagOC: TUpdateSQL;
    updAgregItemOC: TUpdateSQL;
    updAgregOC: TUpdateSQL;
    qryOCNUMOC: TFloatField;
    qryOCIDFORCLI: TFloatField;
    qryOCIDPESSOA: TFloatField;
    qryOCOCATENDIDA: TStringField;
    qryOCFLGIMPRESSA: TStringField;
    qryOCFLGCOMSEMOC: TStringField;
    qryOCOBSOC: TStringField;
    qryOCDATAOC: TDateTimeField;
    qryOCIDPROCESSO: TFloatField;
    qryItemOCDESCRICAO: TStringField;
    qryItemOCCODPRODUTO: TStringField;
    qryAgregItemOCDESCCUSTAGREG: TStringField;
    qrySCItemOC: TwwQuery;
    dsSCItemOC: TwwDataSource;
    updSCItemOC: TUpdateSQL;
    qrySCItemOCIDITEMOC: TFloatField;
    qrySCItemOCNUMSOLCOMPRA: TFloatField;
    qrySCItemOCIDITEMSOLI: TFloatField;
    qryOCFLGCOMSEMCOT: TStringField;
    qryOCVALOROC: TFloatField;
    qryEndCobEnt: TwwQuery;
    qryEndCobEntNUMDOCUMENTO: TStringField;
    qryEndCobEntENDCOB: TStringField;
    qryEndCobEntNUMCOB: TStringField;
    qryEndCobEntCOMPLCOB: TStringField;
    qryEndCobEntCIDADECOB: TStringField;
    qryEndCobEntBAIRROCOB: TStringField;
    qryEndCobEntUFCOB: TStringField;
    qryEndCobEntENDENT: TStringField;
    qryEndCobEntNUMENT: TStringField;
    qryEndCobEntCOMPLENT: TStringField;
    qryEndCobEntCIDADEENT: TStringField;
    qryEndCobEntBAIRROENT: TStringField;
    qryEndCobEntUFENT: TStringField;
    qryEndCobEntCEPCOB: TStringField;
    qryEndCobEntCEPENT: TStringField;
    qryEndCobEntDDDCOB: TStringField;
    qryEndCobEntTELCOB: TStringField;
    qryEndCobEntDDDFAXCOB: TStringField;
    qryEndCobEntFAXCOB: TStringField;
    qryEndCobEntDDDENT: TStringField;
    qryEndCobEntTELENT: TStringField;
    qryEndCobEntDDDFAXENT: TStringField;
    qryEndCobEntFAXENT: TStringField;
    qryEndCobEntMASCARA: TStringField;
    qryEndCobEntIDIMAGEM: TFloatField;
    qryItemOCIDRESERVAORCAMEN: TFloatField;
    qryItemOCCODGRUPOPROD: TStringField;
    qryAux: TwwQuery;
    qryDelPrev: TwwQuery;
    qryOCFLGTIPOFRETE: TFloatField;
    qryOCCONTATO: TStringField;
    procedure DtmComprasCreate(Sender: TObject);
    procedure DtmComprasDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure SelOC( n : LongInt );
    Procedure SelItemOC( n : LongInt );
    Function  DeletaPrevCap( NumOC : LongInt ) : Boolean;
  end;

var
  DtmCompras: TDtmCompras;

implementation

{$R *.DFM}

Uses uDataBase, uSistema, uModulo, uIntegraBack;

procedure TDtmCompras.DtmComprasCreate(Sender: TObject);
Var
    x : Integer;
Begin
   For x := 0 To ComponentCount - 1 Do
     Begin
        IF (Components[x] is TwwQuery) Then
           Begin
              If (Not (Components[x] as TwwQuery).Prepared ) and ( Trim((Components[x] as TwwQuery).SQL.Text) <> '')  Then
                 (Components[x] as TwwQuery).Prepare;
           End;
     End;
end;

procedure TDtmCompras.DtmComprasDestroy(Sender: TObject);
Var
    x : Integer;
Begin
  For x := 0 To ComponentCount - 1 Do
    Begin
       IF (Components[x] is TwwQuery) Then
          Begin
             (Components[x] as TwwQuery).Close;
             If (Components[x] as TwwQuery).Prepared Then
                (Components[x] as TwwQuery).Unprepare;
          End;
    End;
end;

procedure TDtmCompras.SelOC( n : LongInt );
Begin
   qryOC.Close;
   qryOC.Params[0].AsInteger := n;
   qryOC.Open;
   //
   qryItemOC.Close;
   qryItemOC.Params[0].AsInteger := n;
   qryItemOC.Open;
   //
   SelItemOC(qryItemOCIDITEMOC.AsInteger);
   //
   qryAgregOC.Close;
   qryAgregOC.Params[0].AsInteger := n;
   qryAgregOC.Open;
End;

Procedure TDtmCompras.SelItemOC( n : LongInt );
Begin
   qryPrazoEntOC.Close;
   qryPrazoEntOC.Params[0].AsInteger := n;
   qryPrazoEntOC.Open;
   //
   qryPrazoPagOC.Close;
   qryPrazoPagOC.Params[0].AsInteger := n;
   qryPrazoPagOC.Open;
   //
   qryAgregItemOC.Close;
   qryAgregItemOC.Params[0].AsInteger := n;
   qryAgregItemOC.Open;
   //
   qrySCItemOC.Close;
   qrySCItemOC.ParamByName('IDPESSOA').AsInteger := n;
   qrySCItemOC.Open;
End;

Function  TDtmCompras.DeletaPrevCap( NumOC : LongInt ) : Boolean;
Var
  sSql : String;
Begin
  Result := True;
  qryDelPrev.Close;
  qryDelPrev.ParamByName('IDNUMOC').AsInteger  := NumOC;
  qryDelPrev.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryDelPrev.Open;
  qryDelPrev.First;
   While Not qryDelPrev.Eof Do
      Begin
         sSql := 'DELETE LANCTODOCUM WHERE CODDOCUMENTO = ' + qryDelPrev.FieldByName('CODDOCUMENTO').AsString;
         If Not ExecutarQuery(qryAux,sSQL) Then
            Begin
               Result := False;
               Abort;
            End;
         sSql := 'DELETE RATEIODOCUM WHERE CODDOCUMENTO = ' + qryDelPrev.FieldByName('CODDOCUMENTO').AsString;
         If Not ExecutarQuery(qryAux,sSQL) Then
            Begin
               Result := False;
               Abort;
            End;
         sSql := 'DELETE DOCUMENTO WHERE CODDOCUMENTO = ' + qryDelPrev.FieldByName('CODDOCUMENTO').AsString;
         If Not ExecutarQuery(qryAux,sSQL) Then
            Begin
               Result := False;
               Abort;
            End;
         qryDelPrev.Next;
      End;

End;

end.
