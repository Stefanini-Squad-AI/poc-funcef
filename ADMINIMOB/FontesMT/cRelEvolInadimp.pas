unit cRelEvolInadimp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook, Db,
  DBClient, uCMClientDataSet, uCtrlIndicadorImovel, JCLSysUtils,
  wwdbdatetimepicker, Mask, wwdbedit, Wwdbspin;

type
  TcfgRelEvolInadimp = class(TfrmParamReports_Padrao)
    grpPeriodoIni: TGroupBox;
    Label15: TLabel;
    cboMesIni: TComboBox;
    Label1: TLabel;
    spnAnoIni: TwwDBSpinEdit;
    grpPeriodoFim: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    cboMesFim: TComboBox;
    spnAnoFim: TwwDBSpinEdit;
    grpTipoContrato: TGroupBox;
    rbTodos: TRadioButton;
    rbLocacao: TRadioButton;
    rbAlienacao: TRadioButton;
    grpExibir: TGroupBox;
    rbQtde: TRadioButton;
    rbVAlores: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  cfgRelEvolInadimp: TcfgRelEvolInadimp;

implementation

{$R *.DFM}

uses dRelEvolInadimp;

procedure TcfgRelEvolInadimp.FormCreate(Sender: TObject);
var
  iDia, iMes, iAno: word;
begin
  inherited;
  DecodeDate( Now, iAno, iMes, iDia );
  cboMesIni.ItemIndex := iMes - 1;
  spnAnoIni.Value     := iAno;
  cboMesFim.ItemIndex := iMes - 1;
  spnAnoFim.Value     := iAno;
end;

procedure TcfgRelEvolInadimp.bbtnConfirmarClick(Sender: TObject);
var
  sTipoContrato : string;
  sExibir : string;
begin
  inherited;

  if rbTodos.Checked then
    sTipoContrato := 'T'
  else if rbLocacao.Checked then
    sTipoContrato := 'L'
  else
    sTipoContrato := 'A';

  if rbQtde.Checked then
    sExibir := 'Q'
  else
    sExibir := 'V';

  Cmp_Padrao.ParamByName('TipoContrato').AsString := sTipoContrato;
  Cmp_Padrao.ParamByName('Exibir').AsString       := sExibir;
  Cmp_Padrao.ParamByName('Inicio').AsString       := FormatFloat( '0000', trunc( spnAnoIni.Value ) ) + FormatFloat( '00', cboMesIni.ItemIndex + 1 );
  Cmp_Padrao.ParamByName('Fim').AsString          := FormatFloat( '0000', trunc( spnAnoFim.Value ) ) + FormatFloat( '00', cboMesFim.ItemIndex + 1 );

end;

end.
