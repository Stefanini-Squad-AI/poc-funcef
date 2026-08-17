unit FGeraContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Mask, DBCtrls,
  MontaSelect, Db, DBTables, Wwquery, wwdblook, Wwdatsrc, TREdit,
  CMDBLookupCombo;

type
  TFrmGeraContrato = class(TfrmSairAjuda)
    Label1: TLabel;
    edNumCont: TDBEdit;
    Label2: TLabel;
    edNomeCont: TDBEdit;
    btnGerar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    MontaSelect: TMontaSelect;
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
    btnBuscar: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    dblcLocatario: TwwDBLookupCombo;
    Label3: TLabel;
    ds: TwwDataSource;
    qryIDLOCATARIO: TFloatField;
    qryGrava: TwwQuery;
    qryGravaIDCONTRATOIMOVEL: TFloatField;
    qryGravaCONNUMERO: TStringField;
    qryGravaCONNOME: TStringField;
    qryGravaCONDATAASSINATURA: TDateTimeField;
    qryGravaCONDATAINICIO: TDateTimeField;
    qryGravaFLGTIPOCONTRATO: TStringField;
    qryGravaCONPERCENTMORA: TFloatField;
    qryGravaCONPERMORA: TStringField;
    qryGravaCONTAXAADMIN: TFloatField;
    qryGravaCONVLRAJUSTADO: TFloatField;
    qryGravaCONPERREAJUSTE: TFloatField;
    qryGravaCONPERCENTMULTA: TFloatField;
    qryGravaCONVLRTOTAL: TFloatField;
    qryGravaCONDESCRICAO: TMemoField;
    qryGravaVLRPROPOSTA: TFloatField;
    qryGravaVLRPRESENTE: TFloatField;
    qryGravaVLRCONTABIL: TFloatField;
    qryGravaCONINDICEMORA: TFloatField;
    qryGravaCONINDICEREAJUSTE: TFloatField;
    qryGravaCONDATAREAJUSTE: TDateTimeField;
    qryGravaCONDIASTOLERANCIA: TFloatField;
    qryGravaIDLOCATARIO: TFloatField;
    updGrava: TUpdateSQL;
    qryCondPag: TwwQuery;
    updDetGrava: TUpdateSQL;
    qryDet: TwwQuery;
    qryDetIDIMOVEL: TFloatField;
    qryDetIDCONTRATOIMOVEL: TFloatField;
    updCondDetGrava: TUpdateSQL;
    qryCondPagGrava: TwwQuery;
    qryDetGrava: TwwQuery;
    qryDetGravaIDIMOVEL: TFloatField;
    qryDetGravaIDCONTRATOIMOVEL: TFloatField;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    EdMulta: TRealEdit;
    Label6: TLabel;
    edTXJuros: TRealEdit;
    qryLocatario: TwwQuery;
    qryLocatarioRAZAOSOCIAL: TStringField;
    qryLocatarioIDLOCATARIO: TFloatField;
    Label4: TLabel;
    qryMoeda: TwwQuery;
    qryMoedaMOEDESC: TStringField;
    qryMoedaMOECODIGO: TFloatField;
    dblcIndCorret: TCMDBLookupCombo;
    qryCondPagGravaIDCONTRATOIMOVEL: TFloatField;
    qryCondPagGravaIDCONDPAGIMOVEL: TFloatField;
    qryCondPagGravaINDCORRECAO: TFloatField;
    qryCondPagGravaVLRFINANC: TFloatField;
    qryCondPagGravaFLGSINAL: TStringField;
    qryCondPagGravaDATAINI: TDateTimeField;
    qryCondPagGravaPRAZO: TStringField;
    qryCondPagGravaPERIODO: TFloatField;
    qryCondPagGravaTAXAJUROS: TFloatField;
    qryCondPagGravaPERIODOTAXA: TStringField;
    qryCondPagGravaSISTCORRECAO: TStringField;
    qryCondPagGravaNUMPARCELAS: TFloatField;
    qryCondPagGravaATRASOINDCORREC: TFloatField;
    qryCondPagGravaATRASOMULTA: TFloatField;
    qryCondPagGravaATRASOTXJUROS: TFloatField;
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
    procedure FormCreate(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure dblcLocatarioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnGerarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Sel( n : Double );
    Procedure Move( Var qo, qd : TwwQuery);
    Procedure Gerar;
  public
    { Public declarations }
  end;

var
  FrmGeraContrato: TFrmGeraContrato;

implementation

{$R *.DFM}

Uses uMensErro, uDataBase;

Procedure TFrmGeraContrato.Sel( n : Double );
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
  qryGrava.Close;
  qryGrava.Params[0].AsFloat := -1;
  qryGrava.Open;
  //
  qryDetGrava.Close;
  qryDetGrava.Params[0].AsFloat := -1;
  qryDetGrava.Open;
  //
  qryCondPagGrava.Close;
  qryCondPagGrava.Params[0].AsFloat := -1;
  qryCondPagGrava.Open;
  //
  dblcIndCorret.Clear;
  EdMulta.Clear;
  edTXJuros.Clear;
End;

procedure TFrmGeraContrato.FormCreate(Sender: TObject);
begin
  inherited;
  qryLocatario.Open;
  qryMoeda.Open;
end;

procedure TFrmGeraContrato.btnBuscarClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;
  if MontaSelect.RetornouValor Then
     Begin
        Sel(StrToFloat(MontaSelect.ValoresChave[0]));
     End;
end;

procedure TFrmGeraContrato.dblcLocatarioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if ( modified ) And (Trim(dblcLocatario.Text) <> '') Then
     btnGerar.Enabled := True
  Else
     btnGerar.Enabled := False;  

end;

Procedure TFrmGeraContrato.Move( Var qo, qd : TwwQuery);
Var
  x : Integer;
Begin
   qd.Append;
   For x := 0 To qo.FieldCount -1 Do
     qd.Fields[x].Value := qo.Fields[x].Value;
   qd.Post;
End;

Procedure TFrmGeraContrato.Gerar;
Begin
    Move(qry,qryGrava);
    Try
       StartTransacao;
       qryGrava.Edit;
       qryGravaIDCONTRATOIMOVEL.AsFloat := LeUltRegistro(nil,'CONTRATOIMOVEL');
       qryGravaFLGTIPOCONTRATO.AsString := 'V';
       qryGravaIDLOCATARIO.AsFloat      := qryLocatarioIDLOCATARIO.AsFloat;
       qryGrava.Post;
       qryDet.First;

       While Not qryDet.EOF Do
         Begin
             Move(qryDet,qryDetGrava);
             qryDetGrava.Edit;
             qryDetGravaIDCONTRATOIMOVEL.AsFloat := qryGravaIDCONTRATOIMOVEL.AsFloat;
             qryDetGrava.Post;
             qryDet.Next;
         End;
       While Not qryCondPag.EOF Do
         Begin
             Move(qryCondPag,qryCondPagGrava);
             qryCondPagGrava.Edit;
             qryCondPagGravaIDCONDPAGIMOVEL.AsFloat   := LeUltRegistro(nil,'CONDPAGIMOVEL');
             qryCondPagGravaIDCONTRATOIMOVEL.AsFloat  := qryGravaIDCONTRATOIMOVEL.AsFloat;
             If Trim(dblcIndCorret.Text) <> '' Then
             qryCondPagGravaATRASOINDCORREC.AsInteger := StrToInt(dblcIndCorret.LookupValue);
             qryCondPagGravaATRASOMULTA.AsFloat       := EdMulta.Value;
             qryCondPagGravaATRASOTXJUROS.AsFloat     := edTXJuros.Value;
             qryCondPagGrava.Post;
             qryCondPag.Next;
         End;
       qryGrava.ApplyUpdates;
       qryDetGrava.ApplyUpdates;
       qryCondPagGrava.ApplyUpdates;
       CommitTransacao;
       MsgDlg('Contrato gerado com sucesso','Informação',mtInformation,[mbOK],0);
    Except
      RollBackTransacao;
      MsgDlg('Erro na geração do Contrato','Erro',mtError,[mbOK],0);
      Raise;
    End;
End;

procedure TFrmGeraContrato.btnGerarClick(Sender: TObject);
begin
  inherited;
  btnGerar.Enabled := False;
  Gerar;
  dblclocatario.Text := '';
  Sel(-1);
end;

end.
