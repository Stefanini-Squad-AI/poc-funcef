unit fParamConfCotas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, StdCtrls, ExtCtrls, wwdblook, CmParamReport,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, Db,
  DBClient, uCMClientDataSet, uCmSqlParams;

type
  TfrmParamConfCotas = class(TfrmParamReports_Padrao)
    grpDatas: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    dblkPeriodo: TwwDBLookupCombo;
    rdgValores: TRadioGroup;
    chkAtivProjSint: TCheckBox;
    sqlPeriodo: TCMSqlParams;
    cdsPeriodo: TCMClientDataSet;
    cdsExercicio: TCMClientDataSet;
    sqlExercicio: TCMSqlParams;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamConfCotas: TfrmParamConfCotas;

implementation

uses uSistema,UMensErro,uData;

{$R *.DFM}

procedure TfrmParamConfCotas.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   if dblkExercicio.text = '' then begin
     MsgDlg('O Exercício deve ser preenchido.','Erro',mtError,[mbOk],0);
     modalResult := mrNone;
     Exit;
  end;

  if dblkPeriodo.text = '' then begin
     MsgDlg('O Período deve ser preenchido.','Erro',mtError,[mbOk],0);
     modalResult := mrNone;
     Exit;
  end;

  Cmp_Padrao.ParamValues[0].AsInteger := StrToInt(dblkExercicio.LookupValue);
  Cmp_Padrao.ParamValues[1].AsInteger := StrToInt(dblkPeriodo.LookupValue);
  Cmp_Padrao.ParamValues[2].AsInteger := rdgValores.ItemIndex;
  Cmp_Padrao.ParamValues[3].AsBoolean := chkAtivProjSint.Checked;


end;

procedure TfrmParamConfCotas.FormShow(Sender: TObject);
begin
  inherited;
   with sqlExercicio do begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
      Open;
   end;
   with sqlPeriodo do begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
      ParamByName('PEREXERCICIO').asInteger := Year(Date);
      Open;
   end;

end;

end.
