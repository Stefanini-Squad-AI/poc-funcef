unit FAvisoContratosCorrecaoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, FSairAjuda, uCtrlContratos;

type
  TfrmAvisoContratosCorrecaoMT = class(TfrmSairAjuda)
    dbgContratos: TwwDBGrid;
    cdsContratosCorr: TCMClientDataSet;
    ds: TDataSource;
    spAux: TCMSqlParams;
    btnCorrigir: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    shpEmCorrecao: TShape;
    Label1: TLabel;
    shpEmAtraso: TShape;
    lblEmatraso: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CarregaDados(rNumDiasAviso: Double);
    procedure dbgContratosCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure btnCorrigirClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure dbgContratosDblClick(Sender: TObject);
  private
    { Private declarations }
    CtrlContratos : TCtrlContratos;
  public
    { Public declarations }
    bCorrigir : Boolean;
  end;

var
  frmAvisoContratosCorrecaoMT: TfrmAvisoContratosCorrecaoMT;

implementation

{$R *.DFM}

uses uSistema, dBaseDados;

procedure TfrmAvisoContratosCorrecaoMT.FormCreate(Sender: TObject);
begin
   inherited;
   bCorrigir:=False;
   CtrlContratos:=TCtrlContratos.Create(Sistema.IdEmpresa, Sistema.IdUsuario);
   CtrlContratos.Initialize(dtmBaseDados.dbBaseDados,True);
end;

procedure TfrmAvisoContratosCorrecaoMT.FormDestroy(Sender: TObject);
begin
   CtrlContratos.Free;
   inherited;
end;

procedure TfrmAvisoContratosCorrecaoMT.CarregaDados(rNumDiasAviso: Double);
begin
   Caption := 'Contratos que serão Reajustados em até ' + FloatToStr(rNumDiasAviso)+' dia(s)';
   cdsContratosCorr.Data := CtrlContratos.ListContratosACorrigir(0, rNumDiasAviso, Date);

   cdsContratosCorr.DisableControls;
   cdsContratosCorr.First;
   while not cdsContratosCorr.Eof do begin
      cdsContratosCorr.Edit;
      if (cdsContratosCorr.FieldByName('DATAPROXCORR').AsDateTime <= Date) then
           cdsContratosCorr.FieldByName('FLG_CORRIGE').AsString := 'S'
      else cdsContratosCorr.FieldByName('FLG_CORRIGE').AsString := 'N';
      cdsContratosCorr.Post;
      cdsContratosCorr.Next;
   end;
   cdsContratosCorr.First;
   cdsContratosCorr.EnableControls;
end;

procedure TfrmAvisoContratosCorrecaoMT.dbgContratosCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;
   if (cdsContratosCorr.FieldByName('DATAPROXCORR').AsDateTime = Date) then  begin
      ABrush.Color:=shpEmCorrecao.Brush.Color;
      AFont.Color:=clBlack;
      btnCorrigir.Enabled:=True;
   end;
   if (cdsContratosCorr.FieldByName('DATAPROXCORR').AsDateTime < Date) then begin
      ABrush.Color:=shpEmAtraso.Brush.Color;
      AFont.Color:=clBlack;
      btnCorrigir.Enabled:=True;
   end;
end;

procedure TfrmAvisoContratosCorrecaoMT.btnCorrigirClick(Sender: TObject);
begin
   bCorrigir:=True;
   Close;
end;

procedure TfrmAvisoContratosCorrecaoMT.bbtnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmAvisoContratosCorrecaoMT.dbgContratosDblClick(Sender: TObject);
begin
  inherited;
   // Marca ou Desmarca os contratos para reajuste
   if not cdsContratosCorr.IsEmpty then begin
      if (cdsContratosCorr.FieldByName('DATAPROXCORR').AsDateTime <= Date) then begin
         cdsContratosCorr.Edit;
         if cdsContratosCorr.FieldByName('FLG_CORRIGE').AsString = 'S' then
              cdsContratosCorr.FieldByName('FLG_CORRIGE').AsString := 'N'
         else cdsContratosCorr.FieldByName('FLG_CORRIGE').AsString := 'S';
         cdsContratosCorr.Post;
      end;
   end;
end;

end.
