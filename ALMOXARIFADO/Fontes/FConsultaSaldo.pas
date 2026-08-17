unit FConsultaSaldo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, MontaSelect, Db,
  Wwdatsrc, DBTables, Wwquery, TREdit, Mask, DBCtrls;

type
  TFrmConsultaSaldo = class(TfrmSairAjuda)
    Panel1: TPanel;
    GrdEtapa: TwwDBGrid;
    Panel2: TPanel;
    edCodArt: TEdit;
    edDesc: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edUn: TEdit;
    Label3: TLabel;
    BtnSel: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    MontaSelect: TMontaSelect;
    Label4: TLabel;
    edGrp: TEdit;
    Label5: TLabel;
    qry: TwwQuery;
    ds: TwwDataSource;
    qryDESCALMOX: TStringField;
    qrySALDOQTDE: TFloatField;
    qryCUSTOMEDIO: TFloatField;
    qryVALOREST: TFloatField;
    Label6: TLabel;
    qryUltComp: TwwQuery;
    DBRealEdit1: TDBRealEdit;
    dsUltComp: TwwDataSource;
    Label7: TLabel;
    edForn: TDBEdit;
    edDate: TDBEdit;
    Label8: TLabel;
    plntot: TPanel;
    Label9: TLabel;
    LbTotSaldo: TLabel;
    LbTotVal: TLabel;
    Label10: TLabel;
    DBRealEdit2: TDBRealEdit;
    qryUltCompCODARTIGO: TStringField;
    qryUltCompDATAULTCOMP: TDateTimeField;
    qryUltCompFORMECEDOR: TStringField;
    qryUltCompQTDE: TFloatField;
    qryUltCompUNID: TStringField;
    qryUltCompVALUNIT: TFloatField;
    procedure BtnSelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Procedure Sel;
  public
    { Public declarations }
  end;

var
  FrmConsultaSaldo: TFrmConsultaSaldo;

implementation

{$R *.DFM}

Uses uSistema;


Procedure TFrmConsultaSaldo.Sel;
Var
   rTotSaldo, rTotVal : Double;
Begin
    rTotSaldo := 0;
    rTotVal   := 0;
    MontaSelect.Executar;
    If MontaSelect.RetornouValor Then
       Begin
            qry.Close;
            qry.ParamByName('pCODARTIGO').AsString := Trim(MontaSelect.ValoresChave[0]);
            qry.ParamByName('pIDPESSOA').AsInteger := Sistema.idEmpresa;
            qry.Open;
            qry.DisableControls;
            qry.First;
            While Not qry.Eof Do
               Begin
                   rTotSaldo := rTotSaldo + qry.FieldByName('SALDOQTDE').asFloat;
                   rTotVal   := rTotVal + qry.FieldByName('VALOREST').asFloat;
                   qry.Next;
               End;
            qry.First;
            qry.EnableControls;
            lbTotSaldo.Caption := Format('%15.4f',[rTotSaldo]);
            lbTotVal.Caption   := Format('%15.2f',[rTotVal]);
            //
            qryUltComp.Close;
            qryUltComp.ParamByName('pCODARTIGO').AsString := Trim(MontaSelect.ValoresChave[0]);
            qryUltComp.Open;
            //
            edCodArt.Text := MontaSelect.ValoresChave[0];
            edDesc.Text   := MontaSelect.ValoresChave[1];
            edGrp.Text    := MontaSelect.ValoresChave[2];
            edUn.Text     := MontaSelect.ValoresChave[3];
       End;
End;

procedure TFrmConsultaSaldo.BtnSelClick(Sender: TObject);
begin
  inherited;
  Sel;
end;

procedure TFrmConsultaSaldo.FormCreate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.Params[0].AsString  := '';
  qry.Params[1].AsInteger := -1;
  qry.Open;
  //
  lbTotSaldo.Caption := '';
  lbTotVal.Caption   := '';
end;

end.
