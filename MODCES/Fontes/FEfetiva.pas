unit FEfetiva;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fOkCancelar,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, wwdblook, Mask, MskEdDlg, Db, DBTables, Wwquery,
  TB97, TB97Tlbr, IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmEfetiva = class(TfrmOkCancelar)
    gbxData: TGroupBox;
    gbxTipo: TGroupBox;
    qryMotivo: TwwQuery;
    DataEfet: TCMDateTimePicker;
    dblcTipoEv: TwwDBLookupCombo;
    Toolbar972: TToolbar97;
    sbtnConfigEtiqueta: TSpeedButton;
    sbtnDesfConfigEtiqueta: TSpeedButton;
    procedure DataEfetChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnConfigEtiquetaClick(Sender: TObject);
    procedure sbtnDesfConfigEtiquetaClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  end;

var
  frmEfetiva: TfrmEfetiva;

implementation

uses fSimul, dRelatorioEtiqAltCTPS;

{$R *.DFM}

procedure TfrmEfetiva.FormCreate(Sender: TObject);
begin
  inherited;
  qryMotivo.Open;
  dblcTipoEv.SelText := qryMotivo.FieldByName('DESCRICAO').asString;
  DataEfet.Date := Date;
end;

procedure TfrmEfetiva.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryMotivo.Close;
  inherited;
end;

procedure TfrmEfetiva.DataEfetChange(Sender: TObject);
begin
  inherited;
  bbtnConfirmar.Enabled := (DataEfet.Text <> '');
end;

procedure TfrmEfetiva.sbtnConfigEtiquetaClick(Sender: TObject);
begin
  frmSimul.ImprimeRelatorio.Configurar;
end;

procedure TfrmEfetiva.sbtnDesfConfigEtiquetaClick(Sender: TObject);
begin
  frmSimul.ImprimeRelatorio.RestaurarConfiguracao;
end;

procedure TfrmEfetiva.bbtnConfirmarClick(Sender: TObject);
begin
  frmSimul.sDataAlteracao := DataEfet.Text;
  frmSimul.IdMotivo := qryMotivo.FieldByName('IDMOTIVO').asInteger;
  inherited;
end;

end.
