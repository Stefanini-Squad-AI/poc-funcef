unit fListaTit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Db,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, DBTables,
  Wwquery, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, fSairAjuda;

type
  TfrmListaTit = class(TfrmSairAjuda)
    qryTitular: TwwQuery;
    dbgdListaTit: TwwDBGrid;
    dsTitular: TwwDataSource;
    updSQLTitular: TUpdateSQL;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure dbgdListaTitCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure dbgdListaTitTopRowChanged(Sender: TObject);
  private
    sIDTitular: string;
  end;

var
  frmListaTit: TfrmListaTit;

  procedure MostraListaTit(ID: string);

implementation

uses uMensErro, uFuncoesUteis;

{$R *.DFM}

procedure MostraListaTit(ID: string);
var
  c: integer;
begin
  frmListaTit := TfrmListaTit.Create(Application);

  with (frmListaTit) do
  begin
    if (Pos(',',ID) > 0) then
    begin
      qryTitular.SQL[14] := '      (DP.IDTITULAR     IN (' +ID+ ')) AND';
      qryTitular.SQL[20] := '  (F.IDPESSOA IN (' +ID+ ')) AND'
    end
    else
    begin
      qryTitular.SQL[14] := '      (DP.IDTITULAR     = ' +ID+ ') AND';
      qryTitular.SQL[20] := '  (F.IDPESSOA  = ' +ID+ ') AND';
    end;
    qryTitular.Open;

    sIDTitular:=''; c:=1;
    qryTitular.First;
    while not(qryTitular.EOF) do
    begin
      if (c = 1) then
      begin
        sIDTitular := sIDTitular + qryTitular.FieldByname('IDPESSOA').asString;
        Inc(c);
      end
      else
        sIDTitular := sIDTitular +','+ qryTitular.FieldByname('IDPESSOA').asString;

      qryTitular.Next;
    end;

    sIDTitular := ID;

    if (ShowModal = mrOk) then
    begin
      sIDTitular := '';
      qryTitular.First;
      while not(qryTitular.EOF) do
      begin
        if (qryTitular.FieldByName('MUDANUM').asInteger = 1) then
        begin
          qryTitular.Edit;
          qryTitular.FieldByName('NUMDEPIRRF').asInteger := qryTitular.FieldByName('NUM_IRRF').asInteger;
          qryTitular.FieldByName('NUMDEPSALF').asInteger := qryTitular.FieldByName('NUM_SAL_FAM').asInteger;
          qryTitular.FieldByName('NUMDEPTOT').asInteger  := qryTitular.FieldByName('NUM_TOT').asInteger;
          qryTitular.Post;
        end;

        qryTitular.Next;
      end;
      qryTitular.ApplyUpdates;
    end;
    Free;
  end;
end;

procedure TfrmListaTit.dbgdListaTitCalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  // faz com que as linhas do grid tenham cores alternadas
  if (State <> [gdSelected]) then
  begin
    if not(Highlight) then
    begin
      // linhas ímpares = amarelo, linhas pares = branco
      if (((Sender as TwwDBGrid).CalcCellRow mod 2) = 0) then
        ABrush.Color := CL_AMARELO_CLARO
      else
        ABrush.Color := clWhite;
    end;
  end
  else
  begin
    ABrush.Color := clHighLight;
    AFont.Color  := clHighLightText;
  end;
end;

procedure TfrmListaTit.dbgdListaTitTopRowChanged(Sender: TObject);
begin
  inherited;
  // Acerta as cores quando muda a linha da grid
  dbgdListaTit.Invalidate;
end;

end.
