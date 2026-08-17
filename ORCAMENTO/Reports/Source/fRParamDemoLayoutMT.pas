unit fRParamDemoLayoutMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, uCmSqlParams, Db,
  DBClient, uCMClientDataSet, wwdblook;

type
  TfrmRParamDemoLayoutMT = class(TfrmParamReports_Padrao)
    Label3: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    Label1: TLabel;
    dblkPeriodoIni: TwwDBLookupCombo;
    Label4: TLabel;
    dblkRelatorio: TwwDBLookupCombo;
    Label2: TLabel;
    dblkLayout: TwwDBLookupCombo;
    Label8: TLabel;
    edtTipo: TEdit;
    chkZerados: TCheckBox;
    cdsExercicio: TCMClientDataSet;
    sqlExercicio: TCMSqlParams;
    cdsPeriodoIni: TCMClientDataSet;
    sqlPeriodoIni: TCMSqlParams;
    cdsRelatorio: TCMClientDataSet;
    sqlRelatorio: TCMSqlParams;
    cdsLayout: TCMClientDataSet;
    sqlLayout: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure dblkExercicioClick(Sender: TObject);
    procedure dblkRelatorioClick(Sender: TObject);
    procedure dblkLayoutClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRParamDemoLayoutMT: TfrmRParamDemoLayoutMT;

implementation

uses USistema, UData, UMensErro;

{$R *.DFM}

procedure TfrmRParamDemoLayoutMT.FormCreate(Sender: TObject);
begin
  inherited;
  //Preenche as combo-boxes
  with sqlExercicio do begin
    Prepare;
    ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
    Open;
  end;
  with sqlPeriodoIni do begin
    Prepare;
    ParamByName('IDPESSOA').asInteger  := Sistema.idEmpresa;
    ParamByName('EXERCICIO').asInteger := Year(Date);
    Open;
    cdsPeriodoIni.First;
  end;
  with sqlRelatorio do begin
    Prepare;
    Open;
  end;
  with sqlLayout do begin
    Prepare;
    ParamByName('IDRELATORC').asInteger := 0;
    Open;
  end;
end;

procedure TfrmRParamDemoLayoutMT.dblkExercicioClick(Sender: TObject);
begin
  inherited;
  //Preenche a combo-box de período
  if Trim(dblkExercicio.text) <> '' then begin
    with sqlPeriodoIni do begin
      cdsPeriodoIni.Close;
      Prepare;
      ParamByName('IDPESSOA').asInteger  := Sistema.idEmpresa;
      ParamByName('EXERCICIO').asInteger := StrToInt(dblkExercicio.text);
      Open;
    end;
  end;
end;

procedure TfrmRParamDemoLayoutMT.dblkRelatorioClick(Sender: TObject);
begin
  inherited;
  if Trim(dblkRelatorio.text) <> '' then begin
    with sqlLayout do begin
      cdsLayout.Close;
      Prepare;
      ParamByName('IDRELATORC').asInteger := StrToInt(dblkRelatorio.LookupValue);
      Open;
    end;
  end;
end;

procedure TfrmRParamDemoLayoutMT.dblkLayoutClick(Sender: TObject);
var sTipo: string;
begin
  inherited;
  if Trim(dblkLayout.text) <> '' then begin
    sTipo := cdsLayout.FieldByName('FLGTIPOLAYOUT').asString;
    case sTipo[1] of
      '1' : begin
            edtTipo.text := 'Normal';
            dblkPeriodoIni.enabled := true;
            end;
      '2' : begin
            edtTipo.text := 'Colunado Mensal';
            dblkPeriodoIni.enabled := false;
            dblkPeriodoIni.text    := '';
            end;
    end;
  end;
end;

procedure TfrmRParamDemoLayoutMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if Trim(dblkExercicio.text) = '' then begin
    MsgDlg('O Exercício deve ser preenchido.','Erro',mtError,[mbOk],0);
    modalResult := mrNone;
  end else begin
    if (Trim(edtTipo.text) = 'Normal') and (Trim(dblkPeriodoIni.text) = '')
       then begin
      MsgDlg('O Período deve ser preenchido.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
    end else begin
      if Trim(dblkRelatorio.text) = '' then begin
        MsgDlg('O Relatório deve ser selecionado.','Erro',mtError,[mbOk],0);
        modalResult := mrNone;
      end else begin
        if Trim(dblkLayout.text) = '' then begin
          MsgDlg('O Layout do Demonstrativo deve ser selecionado.','Erro',
                 mtError,[mbOk],0);
          modalResult := mrNone;
        end else begin
          Cmp_Padrao.ParamValues[0].AsInteger := StrToInt(dblkExercicio.LookupValue);

          If ( Trim( dblkPeriodoIni.Text ) = '' ) Then Begin
            Cmp_Padrao.ParamValues[1].AsInteger := 12;        // 0
          End Else Begin
            Cmp_Padrao.ParamValues[1].AsInteger := StrToInt(dblkPeriodoIni.LookupValue);
          End;

          Cmp_Padrao.ParamValues[2].AsInteger := StrToInt(dblkRelatorio.LookupValue);
          Cmp_Padrao.ParamValues[3].AsInteger := StrToInt(dblkLayout.LookupValue);
          Cmp_Padrao.ParamValues[4].AsString  := Trim(edtTipo.Text);
          Cmp_Padrao.ParamValues[5].AsBoolean := chkZerados.Checked;
        end;
      end;
    end;
  end;
end;

end.
