unit FCMParamRel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MAHlpBtn, StdCtrls, Buttons, cmRepBtn, CMFRMPROP, ExtCtrls, FTelaAut,
  FOkCancelar, FSairAjuda, TB97, ComCtrls,DBTables, Wwquery, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti;

type
  TCMParamRel = class(TfrmSairAjuda)
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    cdMestre: TColorDialog;
    BitBtn1: TBitBtn;
    cdCabecalho: TColorDialog;
    BitBtn2: TBitBtn;
    rbtnVisualizar: TBitBtn;
    rbtnImprimir: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    ToolbarSep972: TToolbarSep97;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CMParamRel: TCMParamRel;

implementation

{$R *.DFM}

Uses USistema, UAutorizacao, UMensErro, uDataBase, DBaseDados;

procedure TCMParamRel.BitBtn1Click(Sender: TObject);
begin
  inherited;
  try
    if cdMestre.Execute then
       Begin
//         Modulo.clCorMestreEsp:=cdMestre.Color;
//         Modulo.clCorMestre:= 'ES';
       end;
  except
  end;
end;

procedure TCMParamRel.BitBtn2Click(Sender: TObject);
begin
  inherited;
  try
    if cdCabecalho.Execute then
       Begin
//         Modulo.clCorCabEsp:=cdCabecalho.Color;
//         Modulo.clCorCab:= 'ES';
       end;
  except
  end;
end;


procedure TCMParamRel.FormCreate(Sender: TObject);
begin
  inherited;
  FazQuery(dtmBaseDados.qry, 'SELECT CORCABECALHO,CORMESTRE FROM PARAMGLOBAL WHERE IDPESSOA = ' + InttoStr(Sistema.idEmpresa));
//  Modulo.clCorCab    := dtmBaseDados.qry.FieldByName('CORCABECALHO').AsString;
//  Modulo.clCorMestre := dtmBaseDados.qry.FieldByName('CORMESTRE').AsString;
end;

end.
