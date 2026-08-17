unit FMTConsultaSaldo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Mask, DBCtrls,
  TREdit, MontaSelect, Db, Wwdatsrc, uCtrlArtigo, DBClient,
  uCMClientDataSet;

type
  TFrmMTConsultaSaldo = class(TfrmSairAjuda)
    dsUltComp: TwwDataSource;
    ds: TwwDataSource;
    MontaSelect: TMontaSelect;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    edCodArt: TEdit;
    edDesc: TEdit;
    edUn: TEdit;
    DBRealEdit1: TDBRealEdit;
    edForn: TDBEdit;
    edDate: TDBEdit;
    DBRealEdit2: TDBRealEdit;
    edGrp: TEdit;
    Panel1: TPanel;
    GrdEtapa: TwwDBGrid;
    Panel2: TPanel;
    plntot: TPanel;
    Label9: TLabel;
    LbTotSaldo: TLabel;
    LbTotVal: TLabel;
    BtnSel: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    cds: TCMClientDataSet;
    cdsUltComp: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure BtnSelClick(Sender: TObject);
  private
    { Private declarations }
    Artigo : TCtrlArtigo;
    Procedure Sel ( s : String );

  public
    { Public declarations }
  end;

var
  FrmMTConsultaSaldo: TFrmMTConsultaSaldo;

implementation

{$R *.DFM}
Uses DBaseDados, uSistema;

procedure TFrmMTConsultaSaldo.FormCreate(Sender: TObject);
begin
  inherited;
  Artigo := TCtrlArtigo.Create;
  Artigo.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  Sel('');

  lbTotSaldo.Caption := '';
  lbTotVal.Caption   := '';
end;

procedure TFrmMTConsultaSaldo.Sel(s: String);
begin
   cds.Data         := Artigo.ListSaldoProduto(Sistema.IdEmpresa, s);
   cdsUltComp.Data  := Artigo.GetUltCompra(Sistema.IdEmpresa, s);
end;

procedure TFrmMTConsultaSaldo.BtnSelClick(Sender: TObject);
Var
   rTotSaldo, rTotVal : Double;
Begin
    rTotSaldo := 0;
    rTotVal   := 0;
    MontaSelect.Executar;
    If MontaSelect.RetornouValor Then
       Begin
            Sel(MontaSelect.ValoresChave[0]);
            cds.DisableControls;
            cds.First;
            While Not cds.Eof Do
               Begin
                   rTotSaldo := rTotSaldo + cds.FieldByName('SALDOQTDE').asFloat;
                   rTotVal   := rTotVal + cds.FieldByName('VALOREST').asFloat;
                   cds.Next;
               End;
            cds.First;
            cds.EnableControls;
            lbTotSaldo.Caption := Format('%15.4f',[rTotSaldo]);
            lbTotVal.Caption   := Format('%15.2f',[rTotVal]);
            //
            edCodArt.Text := MontaSelect.ValoresChave[0];
            edDesc.Text   := MontaSelect.ValoresChave[1];
            edGrp.Text    := MontaSelect.ValoresChave[2];
            edUn.Text     := MontaSelect.ValoresChave[3];
       End;
end;

end.
