unit fListaTitular;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, DBTables,
  Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, fSairAjuda, DBClient, uCMClientDataSet, Db,
  uCtrlListaTitular;

type
  TfrmListaTitular = class(TfrmSairAjuda)
    dsTitular: TwwDataSource;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    dbgdListaTit: TwwDBGrid;
    CdsTitular: TCMClientDataSet;
    procedure dbgdListaTitCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure dbgdListaTitTopRowChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    CtrlListaTitular: TCtrlListaTitular;
  public
    procedure Sel(ListaIdPessoa: string);
  end;

var
  frmListaTitular: TfrmListaTitular;

implementation

uses uMensErro, uCtrlPadroes, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmListaTitular.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlListaTitular := TCtrlListaTitular.Create;
  CtrlListaTitular.InitializeAs(Padroes);
  CtrlListaTitular.Cds := CdsTitular;
end;

procedure TfrmListaTitular.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlListaTitular);
  inherited;
end;

procedure TfrmListaTitular.dbgdListaTitCalcCellColors(Sender: TObject; Field: TField;
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

procedure TfrmListaTitular.dbgdListaTitTopRowChanged(Sender: TObject);
begin
  inherited;
  // Acerta as cores quando muda a linha da grid
  dbgdListaTit.Invalidate;
end;

procedure TfrmListaTitular.bbtnConfirmarClick(Sender: TObject);
begin
  CtrlListaTitular.Gravar;
end;

procedure TfrmListaTitular.Sel(ListaIdPessoa: string);
begin
  CdsTitular.Data := CtrlListaTitular.ListTitular(ListaIdPessoa);
end;

end.
