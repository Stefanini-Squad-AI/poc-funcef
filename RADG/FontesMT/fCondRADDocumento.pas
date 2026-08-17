unit fCondRADDocumento      ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBClient, ImgList, TB97Ctls, Grids,
  Wwdbigrd, Wwdbgrid;

type
  TfrmCondRADDocumento = class(TfrmOkCancelar)
    Panel1: TPanel;
    cdsCondicoes: TClientDataSet;
    cdsCondicoesGRUPORESPON: TStringField;
    cdsCondicoesVALORMIN: TFloatField;
    cdsCondicoesVALORMAX: TFloatField;
    cdsCondicoesETAPA: TIntegerField;
    DataSource2: TDataSource;
    Panel2: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Edit4: TEdit;
    Panel3: TPanel;
    Dock973: TDock97;
    tb97BotoesDetalhe: TToolbar97;
    sbtnInsDet: TToolbarButton97;
    sbtnAltDet: TToolbarButton97;
    sbtnExcluiDet: TToolbarButton97;
    ImlPadrao: TImageList;
    pnlDados: TPanel;
    Label2: TLabel;
    cmbGrupoRespon: TComboBox;
    Label4: TLabel;
    edtValMin: TEdit;
    Label5: TLabel;
    edtValMax: TEdit;
    Dock974: TDock97;
    tb97Detalhe: TToolbar97;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    bbtnVoltarDet: TBitBtn;
    pnlTabela: TPanel;
    wwDBGrid1: TwwDBGrid;
    pnlTopo: TPanel;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label9: TLabel;
    cmbTipoDoc: TComboBox;
    cdsCondicoesTIPOPRODUTO: TStringField;
    procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCondRADDocumento: TfrmCondRADDocumento;

implementation

{$R *.DFM}

procedure TfrmCondRADDocumento.wwDBGrid1CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  if not ( gdSelected in State ) then
    if ( cdsCondicoes.RecNo mod 2 ) = 0 then
      ABrush.Color:= $00C0FFFF;
end;

procedure TfrmCondRADDocumento.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  pnlTabela.SendToBack;
  cmbGrupoRespon.ItemIndex := -1;
  cmbTipoDoc.ItemIndex := -1;
  edtValMin.Text := '';
  edtValMax.Text := '';
end;

procedure TfrmCondRADDocumento.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  pnlTabela.SendToBack;
  cmbGrupoRespon.ItemIndex := cmbGrupoRespon.Items.IndexOf( cdsCondicoesGRUPORESPON.Text );
  cmbTipoDoc.ItemIndex := cmbTipoDoc.Items.IndexOf( cdsCondicoesTIPOPRODUTO.Text );
  edtValMin.Text := cdsCondicoesVALORMAX.AsString;
  edtValMax.Text := cdsCondicoesVALORMIN.AsString;
end;

procedure TfrmCondRADDocumento.bbtnOkDetClick(Sender: TObject);
begin
  inherited;
  sbtnInsDet.Down := False;
  sbtnAltDet.Down := False;
  pnlTabela.BringToFront;
end;

end.
