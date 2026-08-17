unit fConsRoteiros;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, CMDBLookupCombo, Db, DBClient,
  uCMClientDataSet, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmConsRoteiros = class(TfrmOkCancelar)
    lblRoteiro: TLabel;
    lblData: TLabel;
    lblDocumento: TLabel;
    lblUsuario: TLabel;
    lblObservacao: TLabel;
    lblOperacao: TLabel;
    lblNumLancto: TLabel;
    cdsRoteiro: TCMClientDataSet;
    dblkpRoteiro: TCMDBLookupCombo;
    dtApuracao: TCMDateTimePicker;
    edtNoDocumento: TEdit;
    edtUsuario: TEdit;
    rdgrpTipoApur: TRadioGroup;
    cmbOperacao: TComboBox;
    edtNumLancto: TEdit;
    lblDtExec: TLabel;
    dtExecucao: TCMDateTimePicker;
    edtObs: TEdit;
    CdsAtivo: TCMClientDataSet;
    lblAtivo: TLabel;
    dblkpAtivo: TCMDBLookupCombo;
    lblSituacao: TLabel;
    cmbSituacao: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCodApuracaoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsRoteiros: TfrmConsRoteiros;

implementation

{$R *.DFM}

procedure TfrmConsRoteiros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caHide;
end;

procedure TfrmConsRoteiros.edtCodApuracaoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
   if not ( Key in ['0'..'9', chr(8), chr(10), chr(13), chr(27)] ) Then
      Key := #0;
end;

procedure TfrmConsRoteiros.FormShow(Sender: TObject);
begin
  inherited;
  dblkpRoteiro.SetFocus;
end;

end.
