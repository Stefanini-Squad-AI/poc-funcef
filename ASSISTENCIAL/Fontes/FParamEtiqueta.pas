unit FParamEtiqueta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMParamRel, MAHlpBtn, StdCtrls, Buttons, cmRepBtn, ExtCtrls, DBCtrls,
  Mask, MskEdDlg, wwdblook, ComCtrls, Db, Wwdatsrc, DBTables,TB97, TB97Tlbr, IvDictio, IvMulti, IvEMulti, FOkCancelar,
  Wwquery, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamEtiqueta = class(TFrmOKCancelar)
    qryplanass: TwwQuery;
    dsplanass: TwwDataSource;
    qryPatro: TwwQuery;
    qryPlano: TwwQuery;
    ListBox1: TListBox;
    Label6: TLabel;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    bitbtn: TSpeedButton;
    edLargura: TEdit;
    edAltura: TEdit;
    edpag: TEdit;
    CheckBox1: TCheckBox;
    qrySitPart: TwwQuery;
    GroupBox1: TGroupBox;
    LABEL1: TLabel;
    label4: TLabel;
    Label13: TLabel;
    dblkpcmbPatro: TwwDBLookupCombo;
    dblkpcmbPlano: TwwDBLookupCombo;
    dblkpcmbPlanass: TwwDBLookupCombo;
    GroupBox5: TGroupBox;
    Label3: TLabel;
    Label15: TLabel;
    Label2: TLabel;
    Label12: TLabel;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label5: TLabel;
    Label16: TLabel;
    edNumInsc: TEdit;
    mskdlgDataInsc: TCMDateTimePicker;
    numinscprev: TEdit;
    datainscprev: TCMDateTimePicker;
    dblkpcmbSituacao: TwwDBLookupCombo;
    edmatricula: TEdit;
    edcpf: TEdit;
    ednome: TEdit;
    rbtnimprimir: TBitBtn;
    rbtnvisualizar: TBitBtn;
    procedure rbtnVisualizarClick(Sender: TObject);
    procedure rbtnImprimirClick(Sender: TObject);
    procedure bbtnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ListBox1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamEtiqueta: TfrmParamEtiqueta;

implementation

uses FEtiqueta;

{$R *.DFM}

procedure TfrmParamEtiqueta.rbtnVisualizarClick(Sender: TObject);
begin
  inherited;
  if (edlargura.text = '') or (edaltura.text ='')  then
  begin
       showmessage('Valores de largura ou altura não foram encontrados .');
       exit;
  end;
  try
      frmEtiquetas := TfrmEtiquetas.Create(Self );
      frmEtiquetas.qr.preview;
  finally
  //    frmEtiquetas.close;
  end;
end;

procedure TfrmParamEtiqueta.rbtnImprimirClick(Sender: TObject);
begin
  inherited;
  if (edlargura.text = '') or (edaltura.text = ' ')  then
  begin
       showmessage('Valores de largura ou altura não foram encontrados .');
       exit;
  end;
  try
     frmEtiquetas := TfrmEtiquetas.Create(Self);
     frmEtiquetas.qr.print;
  finally
  //    frmEtiquetas.close;
  end;
end;

procedure TfrmParamEtiqueta.bbtnFecharClick(Sender: TObject);
begin
  inherited;
  CLOSE;
end;

procedure TfrmParamEtiqueta.FormClose(Sender: TObject;
var Action: TCloseAction);
begin
  inherited;
  ACTION := CAFREE;
end;

procedure TfrmParamEtiqueta.ListBox1Click(Sender: TObject);
begin
  inherited;
  edaltura.readonly := true;
  edlargura.readonly := true;
  edpag.readonly := true;
  case listbox1.itemindex of
    0 : begin edaltura.text := inttostr(21); edlargura.text := inttostr(29); edpag.text := inttostr(10); end;
    1 : begin edaltura.text := inttostr(23); edlargura.text := inttostr(30); edpag.text := inttostr(10); end;
    2 : begin edaltura.text := inttostr(25); edlargura.text := inttostr(33); edpag.text := inttostr(10); end;
    3 : begin edaltura.text := inttostr(25); edlargura.text := inttostr(25); edpag.text := inttostr(10); end;
    4 : begin edaltura.text := inttostr(25); edlargura.text := inttostr(25); edpag.text := inttostr(10);
              edaltura.readonly := false; edlargura.readonly := false; edpag.readonly := false; end;
  end;
end;

procedure TfrmParamEtiqueta.BitBtn1Click(Sender: TObject);
begin
  //  inherited;
  edaltura.text := '';
  edlargura.text := '';
  edpag.text := '';
  edaltura.readonly := false;
  edlargura.readonly := false;
  edpag.readonly := false;
  edlargura.setfocus;
end;

procedure TfrmParamEtiqueta.FormCreate(Sender: TObject);
begin
  inherited;
  qrypatro.open;
  qryplano.open;
  qryplanass.open;
  qrysitpart.open;
end;

end.
