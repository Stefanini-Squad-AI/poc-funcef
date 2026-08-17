unit FParamPeriodo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, uCmSqlParams, Db, DBClient, uCMClientDataSet,
  StdCtrls, wwdblook, CmParamReport, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls;

type
  TfrmParamPeriodos = class(TfrmParamReports_Padrao)
    Panel1: TPanel;
    lblGrupo: TLabel;
    Label2: TLabel;
    dblkExercicioIni: TwwDBLookupCombo;
    dblkExercicioFim: TwwDBLookupCombo;
    cdsExerIni: TCMClientDataSet;
    sqlExerIni: TCMSqlParams;
    sqlExerFim: TCMSqlParams;
    cdsExerFim: TCMClientDataSet;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamPeriodos: TfrmParamPeriodos;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema, uString,
     uModulo, uData, uFuncaoGeral, FSM_FxLib;

{$R *.DFM}

procedure TfrmParamPeriodos.FormShow(Sender: TObject);
begin
  inherited;
   with sqlExerIni do begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
      Open;
   end;
   with sqlExerFim do begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
      Open;
   end;

end;

procedure TfrmParamPeriodos.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  //*** passa os paramentos para o componente padrao ***
  Cmp_Padrao.ParamValues[0].AsString  := dblkExercicioIni.LookupValue;
  Cmp_Padrao.ParamValues[1].AsString  := dblkExercicioFim.LookupValue;

end;

end.
