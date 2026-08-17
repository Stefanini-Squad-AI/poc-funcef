unit fParamPenhora;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelProcessoCons,
  Db, DBTables, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, wwdblook, TEdNum, Spin, wwdbdatetimepicker, CMDateTimePicker, ExtCtrls, ComCtrls,
  Grids, DBGrids, uCmSqlParams, DBClient, uCMClientDataSet, CmParamReport,
  MontaSelect, TREdit;

type
  TfrmParamPenhora = class(TfrmSelProcessoCons)
    tbshRelatorio: TTabSheet;
    rgSelecao: TRadioGroup;
    MontaSelect: TMontaSelect;
    gbxPercDesvio: TGroupBox;
    redDesvio: TRealEdit;
    Label7: TLabel;
    Label8: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  end;

var
  frmParamPenhora: TfrmParamPenhora;
  sTipoPessoa: string;

implementation

uses fAguarde, uCtrlFuncoesRH, uMensErro;

{$R *.DFM}

procedure TfrmParamPenhora.FormCreate(Sender: TObject);
begin
  inherited;
  IrPaginaResult := false;
  rgSitProc.ItemIndex := 0;
  rgSitProc.Enabled := false;
end;

procedure TfrmParamPenhora.bbtnConfirmarClick(Sender: TObject);
var
  sListaNumProcesso: string;
begin
  frmAguarde.Pos := 0;
  frmAguarde.Mostra('Excesso ou Insuficiência de Penhora');
  frmAguarde.Update;
  inherited;
  if (CdsProcesso.IsEmpty) then
  begin
    frmAguarde.Apaga;
    MsgDlg('Nenhum processo foi encontrado com as características selecionadas.', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    ModalResult := mrNone;
    exit;
  end
  else
  begin
    frmAguarde.Update;
    sListaNumProcesso := '';
    repeat
      if (sListaNumProcesso = '') then
        sListaNumProcesso := CdsProcesso.FieldByName('NUMPROCTRAB').asString
      else
        sListaNumProcesso := sListaNumProcesso +','+ CdsProcesso.FieldByName('NUMPROCTRAB').asString;

      CdsProcesso.Next;
    until (CdsProcesso.EOF);
  end;

  Cmp_Padrao.ParamByName('Selecao').asInteger := rgSelecao.ItemIndex;
  Cmp_Padrao.ParamByName('Desvio').asFloat := redDesvio.Value;
  Cmp_Padrao.ParamByName('NumProcessos').asString := sListaNumProcesso;
end;

end.
