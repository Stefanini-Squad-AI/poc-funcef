unit FConsHistRecEmp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Tabs, Db,
  Wwdatsrc, DBTables, Wwquery, MAHlpBtn, Buttons, TB97, TB97Tlbr, IvDictio,
  IvMulti, IvEMulti;

type
  TfrmConsHistRecEmp = class(TfrmSairAjuda)
    wwqryItemDesp: TwwQuery;
    wwqryItemDespANOMESVENC: TStringField;
    wwqryItemDespNOMEITEMDESP: TStringField;
    wwqryItemDespDATAPREVDESPCRED: TDateTimeField;
    wwqryItemDespDATAREALDESPCRED: TDateTimeField;
    wwqryItemDespVALDESPCRED: TFloatField;
    wwdsItemDesp: TwwDataSource;
    wwdsItemRec: TwwDataSource;
    wwqryItemRec: TwwQuery;
    wwqryItemRecANOMESVENC: TStringField;
    wwqryItemRecNOMEITEMRECCRED: TStringField;
    wwqryItemRecDATAPREVRECCRED: TDateTimeField;
    wwqryItemRecDATAREALRECCRED: TDateTimeField;
    wwqryItemRecVALRECCRED: TFloatField;
    wwqryItemRecSALDORECEB: TFloatField;
    wwqryParcelas: TwwQuery;
    wwqryParcelasMESREF: TStringField;
    wwqryParcelasDATAPREVREC: TDateTimeField;
    wwqryParcelasVALPREVREC: TFloatField;
    wwqryParcelasCODOPERACAO: TStringField;
    wwqryParcelasDATAREALREC: TDateTimeField;
    wwqryParcelasVALREALREC: TFloatField;
    wwqryParcelasDATAOPERACAO: TDateTimeField;
    wwqryParcelasSALDODEV: TFloatField;
    wwqryParcelasIDCONTRCREDMUT: TFloatField;
    wwqryParcelasFLGFOLHA: TFloatField;
    wwqryParcelasIDOPERACAO: TFloatField;
    ds: TwwDataSource;
    tsetResult: TTabSet;
    grpResultado: TGroupBox;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape8: TShape;
    Shape4: TShape;
    Shape9: TShape;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    dbgrdResultado3: TwwDBGrid;
    dbgrdResultado2: TwwDBGrid;
    dbgrdResultado: TwwDBGrid;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText11: TStaticText;
    procedure dbgrdResultadoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgrdResultado2CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgrdResultado3CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure tsetResultClick(Sender: TObject);
  private
    { Private declarations }
  public
    IdRegra, IdMoe, DiaRef : string;
    bFoiFolha : boolean;
    { Public declarations }
  end;

var
  frmConsHistRecEmp: TfrmConsHistRecEmp;

implementation

uses dAtend, FPrincipal;

{$R *.DFM}

procedure TfrmConsHistRecEmp.dbgrdResultadoCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
 if (wwqryParcelas.FieldByName('flgfolha').AsInteger = 0) and (wwqryParcelas.FieldByName('codoperacao').AsString <> 'E') then begin
     ABrush.Color := clWhite;
     AFont.Color  := clBlack;
     if highlight then begin
        ABrush.Color := clWhite;
        AFont.Color  := clBlack;
     end;
  end
  else if (wwqryParcelas.FieldByName('flgfolha').AsInteger = 1) then begin
     ABrush.Color := clNavy;
     AFont.Color  := clWhite;
     if highlight then begin
        ABrush.Color := clNavy;
        AFont.Color  := clWhite;
     end;
 end
 else if (wwqryParcelas.FieldByName('flgfolha').AsInteger = 2) then begin
     ABrush.Color := clSilver;
     AFont.Color  := clWhite;
     if highlight then begin
        ABrush.Color := clSilver;
        AFont.Color  := clWhite;
     end;
 end
 else if (wwqryParcelas.FieldByName('flgfolha').AsInteger = 3) then begin
     ABrush.Color := clMaroon;
     AFont.Color  := clWhite;
     if highlight then begin
        ABrush.Color := clMaroon;
        AFont.Color  := clWhite;
     end;
 end
 else if (wwqryParcelas.FieldByName('flgfolha').AsInteger = 4) then begin
     ABrush.Color := $00FFDDBB;
     AFont.Color  := clBlack;
     if highlight then begin
        ABrush.Color := $00FFDDBB;
        AFont.Color  := clBlack;
     end;
 end
 else if (wwqryParcelas.FieldByName('flgfolha').AsInteger = 5) then begin
     ABrush.Color := $0095B8FF;
     AFont.Color  := clWhite;
     if highlight then begin
        ABrush.Color := $0095B8FF;
        AFont.Color  := clWhite;
     end;
 end;

end;

procedure TfrmConsHistRecEmp.dbgrdResultado2CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
wwqryParcelas.Locate('MESREF',wwqryItemRec.FieldByName('ANOMESVENC').AsString, []);
  if wwqryParcelas.FieldByName('flgfolha').AsInteger > 0 then
    bFoiFolha := true
  else
    bFoiFolha := false;

  if (wwqryItemRec.FieldByName('datarealreccred').AsString = '') and (not bFoiFolha) then begin
     ABrush.Color := clWhite;
     AFont.Color  := clBlack;
     if highlight then begin
        ABrush.Color := clWhite;
        AFont.Color  := clBlack;
     end;
  end
  else if (wwqryItemRec.FieldByName('datarealreccred').AsString = '') and (bFoiFolha) then begin
     ABrush.Color := clNavy;
     AFont.Color  := clWhite;
     if highlight then begin
        ABrush.Color := clNavy;
        AFont.Color  := clWhite;
     end;
 end
 else if (wwqryItemRec.FieldByName('datarealreccred').AsString <> '')  then begin
     ABrush.Color := clSilver;
     AFont.Color  := clWhite;
     if highlight then begin
        ABrush.Color := clSilver;
        AFont.Color  := clwhite;
     end;
 end;

end;

procedure TfrmConsHistRecEmp.dbgrdResultado3CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
 wwqryParcelas.Locate('MESREF',wwqryItemRec.FieldByName('ANOMESVENC').AsString, []);
  if wwqryParcelas.FieldByName('flgfolha').AsInteger > 0 then
    bFoiFolha := true
  else
    bFoiFolha := false;

  if (wwqryItemDesp.FieldByName('datarealdespcred').AsString = '') and (not bFoiFolha) then begin
     ABrush.Color := clWhite;
     AFont.Color  := clBlack;
     if highlight then begin
        ABrush.Color := clWhite;
        AFont.Color  := clBlack;
     end;
  end
  else if (wwqryItemDesp.FieldByName('datarealdespcred').AsString = '') and (bFoiFolha) then begin
     ABrush.Color := clNavy;
     AFont.Color  := clWhite;
     if highlight then begin
        ABrush.Color := clNavy;
        AFont.Color  := clWhite;
     end;
 end
 else if (wwqryItemDesp.FieldByName('datarealdespcred').AsString <> '') and (bFoiFolha) then begin
   ABrush.Color := clSilver;
   AFont.Color  := clWhite;
   if highlight then begin
      ABrush.Color := clSilver;
      AFont.Color  := clWhite;
   end;
 end;
end;

procedure TfrmConsHistRecEmp.tsetResultClick(Sender: TObject);
begin
  inherited;
case tsetResult.TabIndex of
   0 : begin
         dbgrdResultado.Visible := true;
         dbgrdResultado2.Visible := false;
         dbgrdResultado3.Visible := false;
       end;
   1 : begin
         dbgrdResultado.Visible := false;
         dbgrdResultado2.Visible := true;
         dbgrdResultado3.Visible := false;
       end;
   2 : begin
         dbgrdResultado.Visible := false;
         dbgrdResultado2.Visible := false;
         dbgrdResultado3.Visible := true;
       end;
  end;
end;

end.
