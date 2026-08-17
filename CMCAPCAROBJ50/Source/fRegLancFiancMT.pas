(*******************************************************************************
 13/10/1999 - 2.13.14 (R)
   Implementação da tela para regularização de lançamentos não identificados no
   financeiro no momento da baixa manual de documentos no contas a receber
*******************************************************************************)
unit fRegLancFiancMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid,
  DBClient, uCMClientDataSet, uCmSqlParams;

type
  TFrmRegLancFinancMT = class(TfrmOkCancelar)
    DsLancFinanc: TwwDataSource;
    GrdFinanc: TwwDBGrid;
    SqlLancFinanc: TCMSqlParams;
    CdsLancFinanc: TCMClientDataSet;
    procedure GrdFinancCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure GrdFinancDblClick(Sender: TObject);
    procedure GrdFinancKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CdsLancFinancAfterOpen(DataSet: TDataSet);
    procedure GrdFinancTitleButtonClick(Sender: TObject;
      AFieldName: String);
  private
    { Private declarations }
  public
    { Public declarations }
    iCodlancnaoident :LongInt;
    sDataLancto :String;
  end;

var
  FrmRegLancFinancMT: TFrmRegLancFinancMT;

implementation

{$R *.DFM}

Uses uSistema;

procedure TFrmRegLancFinancMT.GrdFinancCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  if (Field.FieldName='REGULARIZA') Then
  begin
    AFont.Color:=clNavy;
    ABrush.Color:=$0080FFFF;{Amarelo claro}
  end;
end;

procedure TFrmRegLancFinancMT.GrdFinancDblClick(Sender: TObject);
Var
  iCodLancFinanc: Integer;
begin
  inherited;

  CdsLancFinanc.Edit;
  If CdsLancFinanc.FieldByName('REGULARIZA').AsInteger = 0 Then
     CdsLancFinanc.FieldByName('REGULARIZA').AsInteger := 1
  Else
     CdsLancFinanc.FieldByName('REGULARIZA').AsInteger := 0;
  CdsLancFinanc.Post;

  iCodLancFinanc := CdsLancFinanc.FieldByName('CODLANCFINANC').AsInteger;

  CdsLancFinanc.First;
  While Not CdsLancFinanc.Eof Do
  Begin
    If iCodLancFinanc <> CdsLancFinanc.FieldByName('CODLANCFINANC').AsInteger Then
    Begin
      CdsLancFinanc.Edit;
      CdsLancFinanc.FieldByName('REGULARIZA').AsInteger := 0;
      CdsLancFinanc.Post;
    End;
    CdsLancFinanc.Next;
  End;
end;

procedure TFrmRegLancFinancMT.GrdFinancKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  If key = Vk_Space Then GrdFinancDblClick(Sender);
end;

procedure TFrmRegLancFinancMT.bbtnConfirmarClick(Sender: TObject);
Var
  iCodLancFinanc :LongInt;
  bMarcado       :Boolean;
begin
  inherited;
  CdsLancFinanc.First;
  bMarcado := False;
  While Not CdsLancFinanc.Eof Do
  Begin
    If CdsLancFinanc.FieldByName('REGULARIZA').AsInteger = 1 Then
    Begin
       iCodLancFinanc := CdsLancFinanc.FieldByName('CODLANCFINANC').AsInteger;
       bMarcado := True;
       iCodlancnaoident := CdsLancFinanc.FieldByName('CODLANCFINANC').AsInteger;
       CdsLancFinanc.Last;
    End
    Else
      CdsLancFinanc.Next;
  End;
  If bMarcado Then
     ModalResult := MrOk
  Else
     ModalResult := MrCancel;
end;




procedure TFrmRegLancFinancMT.CdsLancFinancAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField(DataSet.FieldByName('VALORLANCFINAN')).DisplayFormat  := '#,##0.00';
  TFloatField(DataSet.FieldByName('VALOROUTRAMOEDA')).DisplayFormat := '#,##0.00';
end;




procedure TFrmRegLancFinancMT.GrdFinancTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  CdsLancFinanc.IndexFieldNames := AFieldName;
end;

end.


