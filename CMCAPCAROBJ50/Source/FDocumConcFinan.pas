unit FDocumConcFinan;
//Alterações
//------------------------------------------------------------------------------
// Autor     : Rodolpho da Silva
// Data      : 21/07/2005
// Pendência : 19792
// Descrição : Filtrar documentos conciliados/regularizados por REC/PAG
//------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, Wwdatsrc,
  uCMClientDataSet, DBClient, uMensErro,
  uSistema, uCmSqlParams, ppComm, ppRelatv, ppProd, ppClass, ppReport,
  ppBands, ppCache,

  // Rodolpho da Silva - P: 19422
  uCtrlDocxCobranca, uCtrlPadroes;


type
  TFrmDocumConcFinan = class(TfrmOkCancelar)
    Grid: TwwDBGrid;
    ds: TwwDataSource;
    CdsDocFinan: TCMClientDataSet;
    Panel1: TPanel;
    Memo1: TMemo;
    procedure GridTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure GridCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure GridTopRowChanged(Sender: TObject);
    procedure CdsDocFinanAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlDocxCobranca: TCtrlDocxCobranca;


  public
    { Public declarations }

    function BuscaDocumFinanceiro(sCodFinanc: string): boolean;
  end;

var
  FrmDocumConcFinan: TFrmDocumConcFinan;

implementation

{$R *.DFM}



procedure TFrmDocumConcFinan.GridTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  CdsDocFinan.IndexFieldNames := AFieldName;
end;



procedure TFrmDocumConcFinan.GridCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  // faz com que as linhas do grid tenham cores alternadas
  if State <> [gdSelected] then begin
     if not Highlight then begin
        // linhas ímpares = amarelo, linhas pares = branco
        if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
           ABrush.Color := $00C0FFFF; // amarelo bebê
        end else begin
           ABrush.Color := clWhite;
        end;
     end;
  end else begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end;
end;




procedure TFrmDocumConcFinan.GridTopRowChanged(Sender: TObject);
begin
  inherited;
  (sender as TwwDBGrid).Invalidate;
end;




function TFrmDocumConcFinan.BuscaDocumFinanceiro(sCodFinanc: string): boolean;
begin
   CdsDocFinan.Data := CtrlDocxCobranca.SelecionaDocumFinanceiro(sCodFinanc);
   Result           := (CdsDocFinan.IsEmpty);
end;



procedure TFrmDocumConcFinan.CdsDocFinanAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField(DataSet.FieldByName('VALORLANCFINAN')).DisplayFormat  := '#,##0.00';
  TFloatField(DataSet.FieldByName('VALOROUTRAMOEDA')).DisplayFormat := '#,##0.00';
end;




procedure TFrmDocumConcFinan.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlDocxCobranca := TCtrlDocxCobranca.Create;
   CtrlDocxCobranca.InitializeAs(Padroes);
end;




procedure TFrmDocumConcFinan.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlDocxCobranca);
  inherited;
end;

end.
