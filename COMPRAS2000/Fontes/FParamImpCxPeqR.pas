unit FParamImpCxPeqR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FParamImpCxPeq, Db, Wwdatsrc, DBTables, Wwquery, IvDictio, IvMulti,
  IvEMulti, StdCtrls, TREdit, wwdblook, CMDBLookupCombo, ExtCtrls,
  MAHlpBtn, Buttons, TB97Tlbr, TB97;

type
  TFrmParamImpCxPeqR = class(TFrmParamImpCxPeq)
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmParamImpCxPeqR: TFrmParamImpCxPeqR;

implementation

{$R *.DFM}

Uses DRelCompras, uSistema;
procedure TFrmParamImpCxPeqR.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  If Trim( dblcCaixaPeq.Value ) <> '' Then
     DtmRelCompras.LbTituloCxPeqR.Caption := 'Caixa Pequeno: ' + dblcCaixaPeq.Value;
  If edNumBord.Value > 0 Then
     DtmRelCompras.LbTituloCxPeqR.Caption := ' - Borderô Nº: ' + edNumBord.Text + ' - do dia: ' + DtmRelCompras.QryCxPeq.FieldByName( 'DATAEFETBORDERO' ).AsString;

end;

procedure TFrmParamImpCxPeqR.FormCreate(Sender: TObject);
begin
  inherited;
  qryCP.Close;
  qryCP.ParamByName('pIDPESSOA').AsInteger  := Sistema.IdEmpresa;
  qryCP.ParamByName('pIDUSUARIO').AsInteger := Sistema.IdUsuario;
  qryCP.Open;
end;

end.
