unit cRelHistoricoContratual;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, mContrato,
  mImovelMestre, Spin, fcCombo, fcColorCombo, mLocatario;

type
  TcfgRelHistoricoContratual = class(TfrmParamReports_Padrao)
    molImovelMestre1: TmolImovelMestre;
    molContrato1: TmolContrato;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    SpeAnoInicial: TSpinEdit;
    Label1: TLabel;
    SpeAnoFinal: TSpinEdit;
    molLocatario1: TmolLocatario;
    cbSemContrato: TCheckBox;
    chkConverte: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  cfgRelHistoricoContratual: TcfgRelHistoricoContratual;

implementation

uses uComunsImobiliario;

{$R *.DFM}

procedure TcfgRelHistoricoContratual.FormShow(Sender: TObject);
var
  AAAA, MM, DD : Word;
begin
  inherited;
  DecodeDate(Date, AAAA, MM, DD);
  SpeAnoInicial.Value := AAAA;
  SpeAnoFinal.Value   := AAAA;
end;

procedure TcfgRelHistoricoContratual.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  cmp_Padrao.ParamByName('iIdImovelMestre').AsInteger := molImovelMestre1.iMestre;
  cmp_Padrao.ParamByName('iIdContrato').AsInteger     := molContrato1.iContrato;
  cmp_Padrao.ParamByName('iIdLocatario').AsInteger    := molLocatario1.iLocatario;
  cmp_Padrao.ParamByName('bSemContrato').AsBoolean    := cbSemContrato.Checked;
  cmp_Padrao.ParamByName('bConverte').AsBoolean       := chkConverte.Checked;  
  cmp_Padrao.ParamByName('iAnoInicial').AsInteger     := SpeAnoInicial.Value;
  cmp_Padrao.ParamByName('iAnoFinal').AsInteger       := SpeAnoFinal.Value;
end;

end.
