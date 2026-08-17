unit FSelEstAval;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, TEdNum, Mask,
  Db, DBTables, Wwquery, TB97, IvDictio,
  IvMulti, IvEMulti, TB97Tlbr, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmSelEstAval = class(TfrmOkCancelar)
    gbxFaixaData: TGroupBox;
    Label1: TLabel;
    gbxValores: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ednMin1: TEditNum;
    ednMax1: TEditNum;
    ednMax2: TEditNum;
    ednMin2: TEditNum;
    ednMax3: TEditNum;
    ednMin3: TEditNum;
    ednMax4: TEditNum;
    ednMin4: TEditNum;
    ednMax5: TEditNum;
    ednMin5: TEditNum;
    ednMax6: TEditNum;
    ednMin6: TEditNum;
    ednMax7: TEditNum;
    ednMin7: TEditNum;
    ednMax8: TEditNum;
    ednMin8: TEditNum;
    EdData1: TCMDateTimePicker;
    EdData2: TCMDateTimePicker;
    qryTipAval: TwwQuery;
    Label10: TLabel;
    dblcTipoAval: TwwDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure EdData1Change(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelEstAval: TfrmSelEstAval;

implementation

uses fTelaAut, fEstAval;

{$R *.DFM}

procedure TfrmSelEstAval.FormCreate(Sender: TObject);
begin
  inherited;
  qryTipAval.Open;
  
  dblcTipoAval.SelText := qryTipAval.FieldByName('DESCRTIPOAVAL').asString;
  EdData1.Date := (Date-365);
  EdData2.Date := Date;
end;

procedure TfrmSelEstAval.EdData1Change(Sender: TObject);
begin
  inherited;
  bbtnConfirmar.Enabled := (EdData1.Text <> '') and (EdData2.Text <> '') and
    (EdData1.Date <= EdData2.Date) and (ednMax1.Text <> '');
end;

procedure TfrmSelEstAval.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmEstAval, TfrmEstAval, false);
end;

end.
