unit URltDecisionCube;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, mxgrid;

type
  TRltDecisionCube = class(TQuickRep)
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    TitleBand1: TQRBand;
    QRLblTitulo: TQRLabel;
    QRLblTCU: TQRLabel;
    QRLblSistema: TQRLabel;
    QRSysData2: TQRSysData;
    QRShape1: TQRShape;
    QRSysData1: TQRSysData;
    Procedure CreateLabels;
    Procedure FreeLabels;
    procedure RltDecisionCubeNeedData(Sender: TObject;
      var MoreData: Boolean);
    procedure RltDecisionCubeBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    RowCounter,
    MaxCols: integer;
    ColumnLabels: array[0..59] of TQRLabel;
    DataLabels: array[0..59] of TQRLabel;
    SafeToRun : boolean;
    TituloRelatorio : string;
    DecisionGrid1: TDecisionGrid;
    PivotSummary : string;
  end;

var
  RltDecisionCube: TRltDecisionCube;

implementation

{$R *.DFM}

procedure TRltDecisionCube.CreateLabels;
var
  LabelWidth,
  nIdx: integer;
begin
  // If the user disables either the column header or the detail band,
  // then we can't run this report
//  frmCubeReport.QuickRep1.ReportTitle := TituloRelatorio;
MaxCols := DecisionGrid1.ColCount - 1;
if maxcols > 0 then
begin  // tem colunas
  RltDecisionCube.QRLblTitulo.caption := TituloRelatorio;
  if (RltDecisionCube.Bands.HasDetail) and (RltDecisionCube.Bands.HasColumnHeader) then
  begin
    // If the user disabled the title band, we turn it back on, but we lose
    // the controls on it.  Here's how to test for that.  Another would be to
    // check to make sure that qrlCubeSummary is not nil.

    with DecisionGrid1 do
    begin
      // We don't count the first two columns

      // Make sure that our array does not go out of bounds.  This arbitrary
      // for thsi example. You would define to meet your own needs.
//mexi aqui - para aumentar largura em caso de relat. muito grande
      if MaxCols > 15 then
      begin
          RltDecisionCube.Page.Width :=
             RltDecisionCube.Page.Width + (Maxcols - 15) * 20;
      end;

      // pick up our label width
      LabelWidth := (RltDecisionCube.Bands.ColumnHeaderBand.Width div MaxCols) - 2;

      // Now loop the columns.  We create our column header and detail controls
      // and we also set the column header captions
      nIdx := 0;

      while nIdx < MaxCols do
      begin
        // We create the TQRLabels and set their properties so that they will
        // output at runtime.

        ColumnLabels[nIdx] := TQRLabel.Create(Self);
        with ColumnLabels[nIdx] do
        begin
          // You can set the text attributes any way that you want.
          Font.Style := [fsItalic];
          Color := clSilver;
          alignment := taCenter;

          // You must set the parent property or this control will not
          // appear on the report
          Parent := RltDecisionCube.Bands.ColumnHeaderBand;
          Height := Parent.Height;
          AlignToBand := False;
          Top := 0;
          Autosize := false;
          Width := LabelWidth;

          // Grab the captions from the DecisionGrid
// mexi aqui, para tratar mais de 1 dimensao na vertical
          Caption := Cells[nIdx-FixedCols+1, -1];

//          if Caption = 'Sum' then
          if nIdx = (MaxCols - 1) then
          begin
            caption := 'Total';
          end;

          // If the user selects on the vertical dimension, then we set the
          // caption to the name of the summary function that had we picked up
          // when the mainform was created.  It's not the best solution, but it
          // appears to work.
          if (nIdx = 1) and (Caption = '') then
            Caption := pivotsummary;

          if nIdx = 0 then
            Left := 0
          else begin
            Left := ColumnLabels[nIdx-1].Left + ColumnLabels[nIdx-1].Width + 2
          end;
        end;

        DataLabels[nIdx] := TQRLabel.Create(Self);
        with DataLabels[nIdx] do
        begin
          // The first detail column is the header, so we set the color,
          // alignment, and fon style to make it stand out.
          if nIdx = 0 then
          begin
            alignment := taLeftJustify;
            Color := clSilver;
            Font.Style := [fsBold];
          end
          else
          begin
            // This example only has numeric data, so I have forced
            // everything to be right justfied.  You can alter this code
            // to match your data
            alignment := taRightJustify;
          end;

          // Set the summary column to silver
          if ((RowCount - FixedRows) > 1) then   // tem área de dados no grid
            if nIdx = (MaxCols-1) then
              Color := clSilver;

          // If only one dimension has been selected, then force the detail columns
          // to clWhite
          if FixedRows = 2 then
            Color := clWhite;

          Parent := RltDecisionCube.Bands.DetailBand;
          Height := Parent.Height;
          AlignToBand := False;
          Top := 0;
          Autosize := false;

          // Size the detail labels to match the horizontal properties of the
          // column header labels so that they line up evenly
          Left := ColumnLabels[nIdx].Left;
          Width := ColumnLabels[nIdx].Width;
        end;
        Inc(nIdx);
      end;

      // Some additional code to handle pivot variations
      if ColumnLabels[MaxCols -1].Caption = '[Error]' then
      begin
        for nIdx := 0 to MaxCols-1 do
          ColumnLabels[nIdx].Caption := Cells[nIdx-2, -1];;
      end;

    end;

    // We are ready to run, so set the flag
    SafeToRun := True;
  end;
end;  // tem colunas (maxcols > 0)
end;

procedure TRltDecisionCube.FreeLabels;
var
  nIdx: integer;
begin
  // Set the flag to false as this report will no longer be able to run.
  SafeToRun := false;
  for nIdx := 0 to MaxCols do
  //mexi aqui - para excluir qtas existirem
  begin
    if ColumnLabels[nIdx] <> nil then
    begin
      ColumnLabels[nIdx].Free;
      ColumnLabels[nIdx] := nil;
    end;
    if DataLabels[nIdx] <> nil then
    begin
      DataLabels[nIdx].Free;
      DataLabels[nIdx] := nil;
    end;
  end;
end;

procedure TRltDecisionCube.RltDecisionCubeNeedData(Sender: TObject;
  var MoreData: Boolean);
var
  nIdx: integer;
begin
  // Check to see if we can process any data
if maxcols = 0 then // nao tem colunas
  MoreData := false
else
begin
  MoreData := SafeToRun;

  if MoreData then
    with DecisionGrid1 do
    begin
      // Make sure that we still have more rows to read from the grid
      // This method does not always work
//      MoreData := RowCounter < RowCount - 1;

      // The number of rows to output will vary depending on the settings.
      // This will make sure that we have not gone to far
      MoreData := Cells[-FixedCols+1, RowCounter] <> '[Error]';


      // start with the first column in this row
      nIdx := 0;

      while nIdx < MaxCols do
      begin
        with DataLabels[nIdx] do
        begin
          // Get the current data
          Caption := Cells[nIdx-FixedCols+1, RowCounter];

          Color := clWhite;

          // Set the summay fields to a different color
          if Caption = 'Sum' then
          begin
            Color := $00D8D8D8;
            caption := 'Total';
          end;

          // If we have more than 1 dimension in the output and it's the last
          // row, then we are on the summary line and we set the color to match.
          // If you have disabled the summary row, then you would modify this
          // code to handle that.
          if (RowCounter > 0) and (RowCounter = (RowCount -3)) then
            Color := clSilver;
        end;
        // Move to the next column in this row
        Inc(nIdx);
      end;

      // Move to the next column
      Inc(RowCounter);
    end;
  end; // else não tem colunas

end;

procedure TRltDecisionCube.RltDecisionCubeBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
  // Initialize our row counter.  Any variables that need to be
  // reset when you run a report must be put in the report's
  // BeforePrint event.
  RowCounter := 0;
end;

end.
