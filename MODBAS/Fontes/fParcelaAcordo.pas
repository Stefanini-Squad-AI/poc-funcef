unit fParcelaAcordo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCadMestreDetCS, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker,
  TREdit, Mask, wwdbedit;

type
  TfrmParcelaAcordo = class(TfrmCadMestreDetalheCS)
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    dbedNumProc: TwwDBEdit;
    dbedNome: TwwDBEdit;
    dbredNumParcela: TDBRealEdit;
    dbredValorParcela: TDBRealEdit;
    dbredDataParcela: TCMDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParcelaAcordo: TfrmParcelaAcordo;

implementation

uses FCadProcesso, uDataBase, uFuncoesUteisRH;

{$R *.DFM}

procedure TfrmParcelaAcordo.FormCreate(Sender: TObject);
var
  Ind: Integer;
  Tot: Double;
begin
  inherited;
  qry.Close;
  qry.ParamByName('NumProcTrab').Value := frmCadProcesso.qry.FieldByName('NumProcTrab').Value;
  qry.Open;
  qryDet.Close;
  qryDet.ParamByName('NumProcTrab').Value := frmCadProcesso.qry.FieldByName('NumProcTrab').Value;
  qryDet.Open;
  TFloatField(qryDet.FieldByName('ValorParcela')).DisplayFormat := '###,###,##0.00';
  if qryDet.IsEmpty then
  begin
    frmCadProcesso.qryObjeto.First;
    while not frmCadProcesso.qryObjeto.Eof do
    begin
      Tot := Tot + frmCadProcesso.qryObjeto.FieldByName('VALORSENTENCA').AsFloat;
      frmCadProcesso.qryObjeto.Next;
    end;
    frmCadProcesso.qryObjeto.First;
    for Ind := 1 to round(frmCadProcesso.sbspeParc.Value) do
    begin
       qryDet.Insert;
       qryDet.FieldByName('NumProcTrab').Value := frmCadProcesso.qry.FieldByName('NumProcTrab').Value;
       qryDet.FieldByName('NumParcela').Value  := Ind;
       qryDet.FieldByName('ValorParcela').Value:= Tot / frmCadProcesso.sbspeParc.Value;
       qryDet.FieldByName('DataParcela').AsString := IncData(frmCadProcesso.dbedEncerr.Text,
                                                      0,Ind,0);
       qryDet.Post;
    end;
    qryDet.First;
  end;
end;

procedure TfrmParcelaAcordo.FormShow(Sender: TObject);
begin
  inherited;
  sbtnAlterar.Enabled := True;
end;

procedure TfrmParcelaAcordo.CmeCadastroConfirma(Sender: TObject);
begin
//  inherited;
   try
      AplicaAlteracoes([qryDet]);
   except
      raise;
   end;
end;

procedure TfrmParcelaAcordo.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  qryDet.FieldByName('NumProcTrab').Value := frmCadProcesso.qry.FieldByName('NumProcTrab').Value;
end;

end.
