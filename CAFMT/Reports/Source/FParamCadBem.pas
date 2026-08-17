unit FParamCadBem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, uCmSqlParams, Db, DBClient, uCMClientDataSet,
  wwdbdatetimepicker, CMDateTimePicker, ExtCtrls, StdCtrls, wwdblook,
  CmParamReport, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr,
  TB97;

type
  TfrmParamCadBem = class(TfrmParamReports_Padrao)
    grpSelecao: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    cmbGrupo: TwwDBLookupCombo;
    cmbResponsavel: TwwDBLookupCombo;
    cmbLocalizacao: TwwDBLookupCombo;
    cmbControle: TComboBox;
    cmbConjunto: TwwDBLookupCombo;
    cmbClasse: TwwDBLookupCombo;
    RdGrpOrdem: TRadioGroup;
    rdgBaixados: TRadioGroup;
    grpMovim: TGroupBox;
    dteDataMov: TCMDateTimePicker;
    grpPeriodo: TGroupBox;
    Label2: TLabel;
    dteDataIni: TCMDateTimePicker;
    dteDataFim: TCMDateTimePicker;
    cdsClasse: TCMClientDataSet;
    cdsGrupo: TCMClientDataSet;
    cdsLocalizacao: TCMClientDataSet;
    cdsResponsavel: TCMClientDataSet;
    cdsConjunto: TCMClientDataSet;
    sqlConjunto: TCMSqlParams;
    sqlResponsavel: TCMSqlParams;
    sqlLocalizacao: TCMSqlParams;
    sqlGrupo: TCMSqlParams;
    sqlClasse: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamCadBem: TfrmParamCadBem;

implementation

{$R *.DFM}

procedure TfrmParamCadBem.FormCreate(Sender: TObject);
begin
  inherited;
   // Seleção da Classe
   sqlClasse.Open;
   // Seleção de Grupo
   sqlGrupo.Open;
   // Seleção de Localização
   sqlLocalizacao.Open;
   // Seleção de Responsavel
   sqlResponsavel.Open;
   // Seleção de Conjunto
   sqlConjunto.Open;
   //-------------------------------------------------------------------------------------
   dteDataMov.Date := date;

end;

procedure TfrmParamCadBem.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  //*** passa os paramentos para o componente padrao ***
  Cmp_Padrao.ParamValues[0].AsString   := cmbControle.Text;
  Cmp_Padrao.ParamValues[1].AsInteger  := StrToIntDef(cmbClasse.LookupValue,0);
  Cmp_Padrao.ParamValues[2].AsInteger  := StrToIntDef(cmbGrupo.LookupValue,0);
  Cmp_Padrao.ParamValues[3].AsInteger  := StrToIntDef(cmbLocalizacao.LookupValue,0);
  Cmp_Padrao.ParamValues[4].AsInteger  := StrToIntDef(cmbResponsavel.LookupValue,0);
  Cmp_Padrao.ParamValues[5].AsInteger  := StrToIntDef(cmbConjunto.LookupValue,0);
  Cmp_Padrao.ParamValues[6].AsString   := dteDataIni.Text;
  Cmp_Padrao.ParamValues[7].AsString   := dteDataFim.Text;
  Cmp_Padrao.ParamValues[8].AsString   := dteDataMov.Text;
  Cmp_Padrao.ParamValues[9].AsInteger  := RdGrpOrdem.ItemIndex;
  Cmp_Padrao.ParamValues[10].AsInteger := rdgBaixados.ItemIndex;

end;

end.
