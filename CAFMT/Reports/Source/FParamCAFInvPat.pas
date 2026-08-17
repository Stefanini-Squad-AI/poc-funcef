unit FParamCAFInvPat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, Db, DBClient, uCMClientDataSet, uCmSqlParams,
  ExtCtrls, StdCtrls, wwdblook, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97;

type
  TfrmParamCAFInvPat = class(TfrmParamReports_Padrao)
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
    sqlLocalizacao: TCMSqlParams;
    sqlResponsavel: TCMSqlParams;
    sqlClasse: TCMSqlParams;
    sqlGrupo: TCMSqlParams;
    sqlConjunto: TCMSqlParams;
    cdsConjunto: TCMClientDataSet;
    cdsGrupo: TCMClientDataSet;
    cdsClasse: TCMClientDataSet;
    cdsResponsavel: TCMClientDataSet;
    cdsLocalizacao: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamCAFInvPat: TfrmParamCAFInvPat;

implementation

{$R *.DFM}

procedure TfrmParamCAFInvPat.FormCreate(Sender: TObject);
begin
  inherited;
   // Seleção de Grupo
   sqlClasse.Open;
   // Seleção de Grupo
   sqlGrupo.Open;
   // Seleção de Localização
   sqlLocalizacao.Open;
   // Seleção de Responsavel
   sqlResponsavel.Open;
   // Seleção de Conjunto
   sqlConjunto.Open;

end;

procedure TfrmParamCAFInvPat.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  //*** passa os paramentos para o componente padrao ***
  Cmp_Padrao.ParamValues[0].AsInteger  := StrToIntDef(cmbLocalizacao.LookupValue,0);
  Cmp_Padrao.ParamValues[1].AsInteger  := StrToIntDef(cmbResponsavel.LookupValue,0);
  Cmp_Padrao.ParamValues[2].AsInteger  := StrToIntDef(cmbClasse.LookupValue,0);
  Cmp_Padrao.ParamValues[3].AsInteger  := StrToIntDef(cmbGrupo.LookupValue,0);
  Cmp_Padrao.ParamValues[4].AsInteger  := StrToIntDef(cmbConjunto.LookupValue,0);
  Cmp_Padrao.ParamValues[5].AsString   := Trim(cmbControle.Text);
  Cmp_Padrao.ParamValues[6].AsInteger  := RdGrpOrdem.ItemIndex;

end;

end.
