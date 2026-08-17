unit OrdenaGrid;

interface

uses SysUtils, Classes,  Controls, Graphics, Db, DbClient, Grids, DbGrids,
  Wwdbigrd, Wwdbgrid;

type
  TOrdenaGrid = class(TComponent)
  private
    FImgCima: TBitmap;
    FImgBaixo: TBitmap;
    FGrid: TwwDbGrid;
    FCds: TClientDataSet;

    FOnBeforeOpen: TDataSetNotifyEvent;
    FOnDrawDataCell: TDrawDataCellEvent;
    FOnTitleButtonClick: TTitleButtonClickEvent;

    FIndiceCriado: boolean;
    FCampoIndice: string;
    FCampoSubIndice: string;
    FIndiceAscendente: boolean;
//    FOrdenaColFixa: boolean;
//    FClicouColunaFixa: boolean;

    procedure InitIndice;
  protected
    procedure SetGrid(Valor: TwwDbGrid);
    function  GetField(Index, IndexField: integer): string;

    procedure OnBeforeOpen(DataSet: TDataSet);
  //  procedure OnDrawDataCell(Sender: TObject; const Rect: TRect;
   //   Field: TField; State: TGridDrawState);
//    procedure OnTitleButtonClick(Sender: TObject; AFieldName: string);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Grid: TwwDbGrid read FGrid write SetGrid;
    property CampoSubIndice: string read FCampoSubIndice write FCampoSubIndice;
//    property OrdenaColFixa: boolean read FOrdenaColFixa write FOrdenaColFixa;
  end;

procedure Register;

implementation

//uses StrUtils;

{$R *.DCR}

procedure Register;
begin
  RegisterComponents('RH', [TOrdenaGrid]);
end;

{ TOrdenaGrid }

constructor TOrdenaGrid.Create(AOwner: TComponent);
begin
  inherited;
  FImgCima := TBitmap.Create;
  FImgBaixo := TBitmap.Create;

  FImgCima.LoadFromResourceName(HInstance, 'CIMA');
  FImgBaixo.LoadFromResourceName(HInstance, 'BAIXO');

  FImgCima.Transparent := true;
  FImgCima.TransparentColor := FImgCima.Canvas.Pixels[0,0];

  FImgBaixo.Transparent := true;
  FImgBaixo.TransparentColor := FImgCima.Canvas.Pixels[0,0];

  FCampoSubIndice := '';
//  FOrdenaColFixa := false;
end;

destructor TOrdenaGrid.Destroy;
begin
  FImgBaixo.Free;
  FImgCima.Free;
  inherited;
end;

procedure TOrdenaGrid.InitIndice;
begin
  FIndiceCriado := false;
  FCampoIndice := '';
  FIndiceAscendente := true;
  if Assigned(FCds) then
    FCds.IndexName := '';
end;

procedure TOrdenaGrid.SetGrid(Valor: TwwDbGrid);
begin
  FGrid := Valor;
  FGrid.TitleButtons := true;
//  FGrid.Options := FGrid.Options + [dgRowResize];
  if Assigned(FGrid.DataSource.DataSet) then
  begin
    FCds := TClientDataSet(FGrid.DataSource.DataSet);
    FOnBeforeOpen := FCds.BeforeOpen;
    FCds.BeforeOpen := OnBeforeOpen;

   // FOnDrawDataCell := FGrid.OnDrawDataCell;
  //  FGrid.OnDrawDataCell := OnDrawDataCell;

    FOnTitleButtonClick := FGrid.OnTitleButtonClick;
  //  FGrid.OnTitleButtonClick := OnTitleButtonClick;
  end
  else
    FCds := nil;
end;

function TOrdenaGrid.GetField(Index, IndexField: integer): string;
var
  iPos, c: integer;
  sItemAux, sItemAtual: string;
begin
  sItemAux := FGrid.Selected[Index];
  sItemAtual := '';
  c := 0;

  while (Length(sItemAux) > 0) and (c < IndexField) do
  begin
    iPos := Pos(#9,sItemAux);
    if (iPos = 0) then
      iPos := Length(sItemAux)
    else
      Dec(iPos);

    sItemAtual := Copy(sItemAux,1,iPos);
    Delete(sItemAux,1,iPos+1);
    Inc(c);
  end;

  Result := sItemAtual;
end;

procedure TOrdenaGrid.OnBeforeOpen(DataSet: TDataSet);
begin
  if Assigned(FOnBeforeOpen) then
    FOnBeforeOpen(DataSet);
  InitIndice;
end;

{procedure TOrdenaGrid.OnDrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
var
  Celula: TGridCoord;
(*
 function GetIndiceCampo(NomeCampo: string): integer;
     var
       c: byte;
       sNomeCampo: string;
     begin
       Result := -1;
       for c:=0 to FGrid.Selected.Count-1 do
       begin
         sNomeCampo := GetField(c, 1);
         if (sNomeCampo = NomeCampo) then
         begin
           Result := c;
           exit;
         end;
       end;
end;
*) }
begin
 { if Assigned(FOnDrawDataCell) then
    FOnDrawDataCell(Sender, Rect, Field, State);

  Celula := FGrid.MouseCoord(Rect.Left, Rect.Top);
  if (Field.FieldName = FCampoIndice) and (Celula.Y = 1) then
  begin
    if (FIndiceAscendente) then
      FGrid.Canvas.Draw(Rect.Left, 1, FImgBaixo)
    else
      FGrid.Canvas.Draw(Rect.Left, 1, FImgCima);
  end;   }

{  if (Celula.Y = 1) then
  begin
    if (Field.FieldName = FCampoIndice) or (FClicouColunaFixa) then
    begin
      if (FIndiceAscendente) then
        FGrid.Canvas.Draw(Rect.Left, 1, FImgBaixo)
      else
        FGrid.Canvas.Draw(Rect.Left, 1, FImgCima);
    end;
  end;
end;   }

{procedure TOrdenaGrid.OnTitleButtonClick(Sender: TObject; AFieldName: string);
var
  c: byte;
  sNomeCampo, sSubIndice: string;
function eColunaFixa: boolean;
     var
       iPosCol, c: integer;
     begin
       iPosCol := -1;
       for c:=0 to FGrid.Selected.Count-1 do
       begin
         if (AFieldName = GetField(c, 1)) then
         begin
           iPosCol := c;
           break;
         end;
       end;
       Result := (iPosCol < FGrid.FixedCols);
end;
begin
  if Assigned(FOnTitleButtonClick) then
    FOnTitleButtonClick(Sender, AFieldName);

{  FClicouColunaFixa := false;
  if not(FOrdenaColFixa) and (FGrid.FixedCols > 0) then
    if (eColunaFixa) then
    begin
      FClicouColunaFixa := true;
      FLeft
      exit;
    end;}

  {FCds.DisableControls;
  FCds.IndexName := '';

  if (AFieldName = FCampoSubIndice) then
    sSubIndice := ''
  else
    sSubIndice := FCampoSubIndice;

  if not(FIndiceCriado) then
  begin
    FCds.AddIndex('CdsIndex', AFieldName +';'+ sSubIndice, [ixCaseInsensitive]);
    FCds.IndexDefs.Update;
    FIndiceCriado := true;
    FIndiceAscendente := true;
  end
  else
  begin
    FCds.DeleteIndex('CdsIndex');

    if (FCampoIndice = AFieldName) and (FIndiceAscendente) then
    begin
      FCds.AddIndex('CdsIndex', AFieldName +';'+ sSubIndice, [], AFieldName, sSubIndice);
      FIndiceAscendente := false;
    end
    else
    begin
      FCds.AddIndex('CdsIndex', AFieldName +';'+ sSubIndice, [ixCaseInsensitive]);
      FIndiceAscendente := true;
    end;
  end;

  for c:=0 to FGrid.Selected.Count-1 do
  begin
    sNomeCampo := GetField(c, 1);
    if (sNomeCampo = AFieldName) then
    begin
      FCds.FieldByName(sNomeCampo).DisplayLabel :=
        '   '+ TrimLeft(FCds.FieldByName(sNomeCampo).DisplayLabel);
      FGrid.Selected[c] := sNomeCampo +#9+ GetField(c, 2) +#9+ '   '+ TrimLeft(GetField(c, 3));
    end
    else
    if (sNomeCampo = FCampoIndice) then
    begin
      FCds.FieldByName(FCampoIndice).DisplayLabel :=
        TrimLeft(FCds.FieldByName(FCampoIndice).DisplayLabel);
      FGrid.Selected[c] := sNomeCampo +#9+ GetField(c, 2) +#9+ TrimLeft(GetField(c, 3));
    end;  
  end;

  FCds.IndexName := 'CdsIndex';
  FCds.First;
  FCds.EnableControls;
  FCampoIndice := AFieldName;
end; }

end.
