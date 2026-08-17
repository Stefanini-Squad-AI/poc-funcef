unit FMTViewUltCompra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, DBClient,
  uCMClientDataSet, Wwdatsrc, uCtrlArtigo, MontaSelect;

type
  TFrmMTViewUltCompra = class(TfrmSairAjuda)
    Label1: TLabel;
    edCodArt: TEdit;
    Label2: TLabel;
    edDesc: TEdit;
    Label3: TLabel;
    edUn: TEdit;
    plnUltComp: TPanel;
    Panel4: TPanel;
    GrdUltComp: TwwDBGrid;
    dsUltComp: TwwDataSource;
    cdsUltComp: TCMClientDataSet;
    ToolbarSep971: TToolbarSep97;
    BtnSel: TBitBtn;
    MontaSelect: TMontaSelect;
    procedure BtnSelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Artigo : TCtrlArtigo;
  public
    { Public declarations }
  end;

var
  FrmMTViewUltCompra: TFrmMTViewUltCompra;

implementation

{$R *.DFM}

Uses DBaseDados, uSistema;

procedure TFrmMTViewUltCompra.BtnSelClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;
  If MontaSelect.RetornouValor Then
     Begin
        cdsUltComp.Data := Artigo.ListUltCompra(MontaSelect.ValoresChave[0]);
        edCodArt.Text   := MontaSelect.ValoresChave[0];
        edDesc.Text     := MontaSelect.ValoresChave[1];
        edUn.Text       := MontaSelect.ValoresChave[2];
     End;
end;

procedure TFrmMTViewUltCompra.FormCreate(Sender: TObject);
begin
  inherited;
  Artigo := TCtrlArtigo.Create;
  Artigo.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  cdsUltComp.Data := Artigo.ListUltCompra('');
end;

procedure TFrmMTViewUltCompra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Artigo.Free;
end;

end.
