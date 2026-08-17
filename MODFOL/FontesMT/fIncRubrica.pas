unit fIncRubrica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoalMT,
  DBTables, Db, Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls,
  TB97, ComCtrls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, CMDateTimePicker, DBClient,
  wwdbdatetimepicker, uCmSqlParams, uCMClientDataSet, CmParamReport, uCtrlIncRubrica;

type
  TfrmIncRubrica = class(TfrmSelPessoalMT)
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure Progresso(Args: array of variant);    
  public
    CtrlIncRubrica: TCtrlIncRubrica;
  end;

function IncluirBeneficios(IdRubrica: double; AnoMesInicio: string;
  NumParcelas: integer; RubricaPermanente: boolean; IdRegra: double;
  NumOcorrencias: integer; Valor: double): boolean;
  
var
  frmIncRubrica: TfrmIncRubrica;

implementation

uses uCMTypes, uMensErro, uSistema, uCtrlPadroes, fAguarde, uCtrlUsoGeralRH;

{$R *.DFM}

function IncluirBeneficios(IdRubrica: double; AnoMesInicio: string;
  NumParcelas: integer; RubricaPermanente: boolean; IdRegra: double;
  NumOcorrencias: integer; Valor: double): boolean;
begin
  with TfrmIncRubrica.Create(Application) do
  begin
    IrPaginaResult := false;
    CtrlIncRubrica.IdRubrica := IdRubrica;
    CtrlIncRubrica.IdEmpresa := Sistema.IdEmpresa;
    CtrlIncRubrica.AnoMesInicio := AnoMesInicio;
    CtrlIncRubrica.NumParcelas := NumParcelas;
    CtrlIncRubrica.RubricaPermanente := RubricaPermanente;
    CtrlIncRubrica.IdRegra := IdRegra;
    CtrlIncRubrica.NumOcorrencias := NumOcorrencias;
    CtrlIncRubrica.Valor := Valor;
    Result := (ShowModal = mrOk);
    Free;
  end;
end;

procedure TfrmIncRubrica.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlIncRubrica := TCtrlIncRubrica.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlIncRubrica.InitializeAs(Padroes);
  CtrlIncRubrica.CdsPrincipal := CdsPrincipal;
  CtrlIncRubrica.Progresso := Progresso;
end;

procedure TfrmIncRubrica.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlIncRubrica);
  inherited;
end;

procedure TfrmIncRubrica.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  frmAguarde.Mostra('Incluindo Benefícios...');
  frmAguarde.Min := 0;
  frmAguarde.Max := CdsPrincipal.RecordCount;

  CtrlIncRubrica.CreateThreadProgresso;
  if (CtrlIncRubrica.ProcessarInclusaoBeneficios) then
    ModalResult := mrOk
  else
    ModalResult := mrNone;

  CtrlIncRubrica.FreeThreadProgresso;
  frmAguarde.Apaga;
  if (ModalResult = mrOk) then
    MsgDlg(CtrlIncRubrica.MessageInfo, 'Aviso', mtInformation, [mbOk,mbHelp], 0)
  else
    raise Exception.Create(CtrlIncRubrica.MessageInfo);
end;

procedure TfrmIncRubrica.Progresso(Args: array of variant);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

end.
