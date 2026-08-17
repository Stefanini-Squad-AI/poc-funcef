unit FViewUltComp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery, Grids,
  Wwdbigrd, Wwdbgrid, MontaSelect;

type
  TFrmViewUltComp = class(TfrmSairAjuda)
    plnUltComp: TPanel;
    Panel4: TPanel;
    GrdUltComp: TwwDBGrid;
    qryUltComp: TwwQuery;
    qryUltCompVLRUNITARIO: TFloatField;
    qryUltCompVALUNEST: TFloatField;
    qryUltCompCODMEDIDA: TStringField;
    qryUltCompQTDERECEBDEVOL: TFloatField;
    qryUltCompDATAENTDEVOL: TDateTimeField;
    qryUltCompRAZAOSOCIAL: TStringField;
    dsUltComp: TwwDataSource;
    Label1: TLabel;
    Label2: TLabel;
    edDesc: TEdit;
    Label3: TLabel;
    edUn: TEdit;
    edCodArt: TEdit;
    BtnSel: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    MontaSelect: TMontaSelect;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSelClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Sel( s : String );
  public
    { Public declarations }
  end;

var
  FrmViewUltComp: TFrmViewUltComp;

implementation

{$R *.DFM}
Uses uString;

Procedure TFrmViewUltComp.Sel( s : String );
Begin
    s := Espaco(Trim(s),14);
    qryUltComp.Close;
    qryUltComp.ParamByName('CODARTIGO').AsString := s;
    qryUltComp.Open;
End;

procedure TFrmViewUltComp.FormCreate(Sender: TObject);
begin
  inherited;
    qryUltComp.Close;
    If Not qryUltComp.Prepared Then qryUltComp.Prepare;
    //
    Sel('');
end;

procedure TFrmViewUltComp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    qryUltComp.Close;
    If qryUltComp.Prepared Then qryUltComp.UnPrepare;
end;

procedure TFrmViewUltComp.BtnSelClick(Sender: TObject);
begin
  inherited;
    MontaSelect.Executar;
    If MontaSelect.RetornouValor Then
       Begin
          Sel(MontaSelect.ValoresChave[0]);
          edCodArt.Text := MontaSelect.ValoresChave[0];
          edDesc.Text   := MontaSelect.ValoresChave[1];
          edUn.Text     := MontaSelect.ValoresChave[2];
       End;
end;

end.
