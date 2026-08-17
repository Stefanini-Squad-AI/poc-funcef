unit FPRelCarta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMParamRel, MAHlpBtn, StdCtrls, Buttons, cmRepBtn, ExtCtrls, Mask,
  MskEdDlg, wwdblook, ComCtrls, Spin, wwriched, Db, Wwdatsrc, DBTables,
  Wwquery, cmseldlg, TB97, TB97Tlbr, IvDictio, IvMulti, IvEMulti;

type
  TfrmPRelCarta = class(TCMParamRel)
    Panel2: TPanel;
    pgctrlConsulta: TPageControl;
    tbsPrincipal: TTabSheet;
    GroupBox1: TGroupBox;
    LABEL1: TLabel;
    label4: TLabel;
    dblkpcmbPatro: TwwDBLookupCombo;
    dblkpcmbPlano: TwwDBLookupCombo;
    GroupBox5: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label2: TLabel;
    mskdlgDataInsc: TcmMaskEditDlg;
    edNumInsc: TEdit;
    dblkpcmbSituacao: TwwDBLookupCombo;
    RadioGroup1: TRadioGroup;
    rgrpStatusInsc: TRadioGroup;
    tbsAdicionais: TTabSheet;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox4: TGroupBox;
    Label11: TLabel;
    Edit7: TEdit;
    GroupBox3: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    GroupBox6: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    GroupBox7: TGroupBox;
    Label12: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    RadioGroup3: TRadioGroup;
    RadioGroup2: TRadioGroup;
    GroupBox8: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    wwDBLookupCombo2: TwwDBLookupCombo;
    wwDBLookupCombo3: TwwDBLookupCombo;
    tbsAvancada: TTabSheet;
    lstTabelas: TListBox;
    pnlPesqAvanc: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    sbtnOU: TSpeedButton;
    sbtnE: TSpeedButton;
    sbtnApagar: TSpeedButton;
    rgrpSinal: TRadioGroup;
    lstCampo: TListBox;
    edConteudo: TEdit;
    lstResult: TListBox;
    rgrpSexo: TRadioGroup;
    rgrpFlag: TRadioGroup;
    rgrpEstCivil: TRadioGroup;
    mskedData: TcmMaskEditDlg;
    mskedMes: TcmMaskEditDlg;
    Panel4: TPanel;
    bbtnEscolher: TBitBtn;
    Panel3: TPanel;
    Label21: TLabel;
    spedCopias: TSpinEdit;
    dsCarta: TwwDataSource;
    dbreTexto: TwwDBRichEdit;
    sbtnTexto: TSpeedButton;
    bbtnLocaliza: TBitBtn;
    qryCarta: TwwQuery;
    selDlgProcuraQry: TcmSelectDlg;
    qryAux: TwwQuery;
    procedure bbtnEscolherClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnTextoClick(Sender: TObject);
    procedure rbtnVisualizarClick(Sender: TObject);
    procedure rbtnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPRelCarta: TfrmPRelCarta;

implementation

uses RCarta;

{$R *.DFM}

procedure TfrmPRelCarta.bbtnEscolherClick(Sender: TObject);
begin
  inherited;
  qryAux.Close;
  qryAux.Open;
  if seldlgProcuraQry.Execute
  then begin
    qryCarta.Close;
    qryCarta.Open;
    qryCarta.Locate('NumCarta',qryAux.FieldByName('NumCarta').AsInteger,[loPartialKey]);
  end;
//  qryAux.Close;
end;

procedure TfrmPRelCarta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmPRelCarta.bbtnFecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmPRelCarta.FormCreate(Sender: TObject);
begin
  inherited;
  qryCarta.Close;
  qryCarta.Open;
end;

procedure TfrmPRelCarta.sbtnTextoClick(Sender: TObject);
begin
  inherited;
  dbreTexto.Execute;
end;

procedure TfrmPRelCarta.rbtnVisualizarClick(Sender: TObject);
begin
  inherited;
  try
     relCarta := TrelCarta.Create(Self);
     relCarta.QR.Preview;
  finally
//     relCarta.Free;
//     relCarta := nil;
  end;
end;

procedure TfrmPRelCarta.rbtnImprimirClick(Sender: TObject);
begin
  inherited;
  try
     relCarta := TrelCarta.Create(Self);
     relCarta.QR.Print;
  finally
//     relCarta.Free;
//     relCarta := nil;
  end;
end;

end.
