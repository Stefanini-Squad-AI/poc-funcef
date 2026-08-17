unit FMalaDireta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, quickrpt, DBCtrls, Buttons, StdCtrls, ExtCtrls, Mask,
  MskEdDlg, wwdblook, ComCtrls, MAHlpBtn, TB97, IvDictio, IvMulti,
  IvEMulti, TB97Tlbr;

type
  TfrmMalaDireta = class(TfrmOkCancelar)
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
    dblkpcmbSituacao: TwwDBLookupCombo;
    RadioGroup1: TRadioGroup;
    rgrpStatusInsc: TRadioGroup;
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
    TabSheet1: TTabSheet;
    Label6: TLabel;
    DBLookupListBox1: TDBLookupListBox;
    PrintDialog1: TPrintDialog;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label15: TLabel;
    procedure bbtnCancelaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMalaDireta: TfrmMalaDireta;

implementation

{$R *.DFM}

procedure TfrmMalaDireta.bbtnCancelaClick(Sender: TObject);
begin
inherited;
close;
end;

procedure TfrmMalaDireta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
action := cafree;
end;
procedure TfrmMalaDireta.BitBtn1Click(Sender: TObject);
begin
  inherited;
printdialog1.execute;
end;



procedure TfrmMalaDireta.bbtnSairClick(Sender: TObject);
begin
  inherited;
close;
end;

end.
