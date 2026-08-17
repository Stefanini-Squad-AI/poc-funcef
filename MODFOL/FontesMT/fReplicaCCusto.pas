{ --------------------------------------------------------------------------------------------------
Rotina......: (Nova tela)
Nº SOL......: 136200
Nº KINTANA..: 813279
Data........: 04/04/2010
Responsável.: Thaise Amaral Martins
Descrição...: Criar uma rotina que possibilite inserir vários centros de custo para uma determinada conta;
-------------------------------------------------------------------------------------------------- }

unit fReplicaCCusto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Buttons, Db, DBClient,
  uCMClientDataSet, Wwdatsrc, StdCtrls, uCtrlCtFolha, DBTables;

type
  TfrmReplicaCCusto = class(TForm)
    PnlCCusto: TPanel;
    Panel2: TPanel;
    BtnSel: TSpeedButton;
    BtnSelAll: TSpeedButton;
    BtnDel: TSpeedButton;
    BtnDelAll: TSpeedButton;
    plnCCustoRelac: TPanel;
    PnlTitTipoAgreAssoc: TPanel;
    GrdSel: TwwDBGrid;
    Splitter1: TSplitter;
    plnCCusto: TPanel;
    Panel4: TPanel;
    GrdAll: TwwDBGrid;
    Splitter2: TSplitter;
    CdsSel: TCMClientDataSet;
    CdsAll: TCMClientDataSet;
    DsAll: TwwDataSource;
    Panel1: TPanel;
    bbtnConfirmar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure GrdSelCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure GrdAllCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure BtnSelClick(Sender: TObject);
    procedure BtnSelAllClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure BtnDelAllClick(Sender: TObject);
  private
   CtrlCtFolha: TCtrlCtFolha;
   procedure InsereCimaBaixo;
   procedure InsereBaixoCima;
    { Private declarations }
  public
    IdProvento: Double;
    ContDebito, ContCredito, CodCCustoNI: String;
    
    { Public declarations }
  end;

var
  frmReplicaCCusto: TfrmReplicaCCusto;

implementation
Uses uCtrlPadroes;
{$R *.DFM}

procedure TfrmReplicaCCusto.FormCreate(Sender: TObject);
begin
  CtrlCtFolha := TCtrlCtFolha.Create;
  CtrlCtFolha.InitializeAs(Padroes);
end;

procedure TfrmReplicaCCusto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlCtFolha);
end;

procedure TfrmReplicaCCusto.FormShow(Sender: TObject);
begin
  CdsSel.Data := CtrlCtFolha.ListCentCustContabCodExt(IdProvento, ContDebito, ContCredito);
  CdsAll.Data := CtrlCtFolha.ListCentCustInsCodExt(IdProvento, ContDebito, ContCredito);
end;

procedure TfrmReplicaCCusto.GrdSelCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if CdsSel.FieldByName('STATUSGRUPOCDC').AsString = 'S' then
  begin
    ABrush.Color := $00C4FFFF;
    AFont.Color := ClBlue;
  end;
end;

procedure TfrmReplicaCCusto.GrdAllCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if CdsAll.FieldByName('STATUSGRUPOCDC').AsString = 'S' then
  begin
    ABrush.Color := $00C4FFFF;
    AFont.Color := ClBlue;
  end;
end;

procedure TfrmReplicaCCusto.BtnSelClick(Sender: TObject);
var
  sCodigoAnalitico: String;
begin
  if not CdsALL.IsEmpty then
  begin
    if CdsAll.fieldbyname('STATUSGRUPOCDC').AsString = 'S' then
    begin
      sCodigoAnalitico := Trim(CdsAll.fieldbyname('CODCENTROCUSTO_CORRETO').AsString);
      while Pos(sCodigoAnalitico, Trim(CdsAll.fieldbyname('CODCENTROCUSTO_CORRETO').AsString)) = 1 do
        InsereBaixoCima;
    end
    else
      InsereBaixoCima;
  end;
end;

procedure TfrmReplicaCCusto.BtnSelAllClick(Sender: TObject);
begin
  if not CdsAll.IsEmpty then
  begin
    CdsAll.First;
    while not CdsAll.Eof do
      BtnSel.Click;
  end;
end;

procedure TfrmReplicaCCusto.BtnDelClick(Sender: TObject);
var
  sCodigoAnalitico: String;
begin
  inherited;
  if not CdsSel.IsEmpty then
  begin
    if CdsSel.fieldbyname('STATUSGRUPOCDC').AsString = 'S' then
    begin
      sCodigoAnalitico := Trim(CdsSel.fieldbyname('CODCENTROCUSTO_CORRETO').AsString);
      while Pos(sCodigoAnalitico, Trim(CdsSel.fieldbyname('CODCENTROCUSTO_CORRETO').AsString)) = 1 do
        InsereCimaBaixo;
    end
    else
      InsereCimaBaixo;
  end;
end;

procedure TfrmReplicaCCusto.BtnDelAllClick(Sender: TObject);
begin
  if not CdsSel.IsEmpty then
  begin
    CdsSel.First;
    while not CdsSel.Eof do
      BtnDel.Click;
  end;
end;

procedure TfrmReplicaCCusto.InsereCimaBaixo;
begin
  CdsAll.Append;
  CdsAll.Fieldbyname('NOME').asString           := CdsSel.Fieldbyname('NOME').asString;
  CdsAll.Fieldbyname('STATUSGRUPOCDC').AsString := CdsSel.FieldByName('STATUSGRUPOCDC').AsString;
  CdsAll.Fieldbyname('CODCENTROCUSTO').AsString := CdsSel.FieldByName('CODCENTROCUSTO').AsString;
  CdsAll.Fieldbyname('CODCENTROCUSTO_CORRETO').AsString := CdsSel.FieldByName('CODCENTROCUSTO_CORRETO').AsString;
//  CdsAll.Fieldbyname('ATIVO').AsString          := CdsSel.FieldByName('ATIVO').AsString;
  CdsAll.Post;
  CdsSel.Delete;
end;

procedure TfrmReplicaCCusto.InsereBaixoCima;
begin
  CdsSel.Append;
  CdsSel.Fieldbyname('NOME').AsString           := CdsAll.FieldByName('NOME').AsString;
  CdsSel.Fieldbyname('STATUSGRUPOCDC').AsString := CdsAll.FieldByName('STATUSGRUPOCDC').AsString;
  CdsSel.Fieldbyname('CODCENTROCUSTO').AsString := CdsAll.FieldByName('CODCENTROCUSTO').AsString;
  CdsSel.Fieldbyname('CODCENTROCUSTO_CORRETO').AsString := CdsAll.FieldByName('CODCENTROCUSTO_CORRETO').AsString;
//  CdsSel.Fieldbyname('ATIVO').AsString          := CdsAll.FieldByName('ATIVO').AsString;
  CdsSel.Post;
  CdsAll.Delete;
end;

end.
