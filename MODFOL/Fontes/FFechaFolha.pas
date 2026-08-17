unit FFechaFolha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, Db,
  DBTables, Wwtable, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  wwdbdatetimepicker, CMDateTimePicker, ExtCtrls;

type
  TfrmFechaFolha = class(TfrmOkCancelar)
    tblParam: TwwTable;
    gbxNormal: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    gbxFerias: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    gbx13Sal: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    dtedNorIni: TCMDateTimePicker;
    dtedNorFim: TCMDateTimePicker;
    dtedFerIni: TCMDateTimePicker;
    dtedFerFim: TCMDateTimePicker;
    dted13Ini: TCMDateTimePicker;
    dted13Fim: TCMDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFechaFolha: TfrmFechaFolha;

implementation

uses uMensErro, uFuncoesUteis;

{$R *.DFM}

procedure TfrmFechaFolha.FormCreate(Sender: TObject);
begin
  inherited;
  tblParam.Open;
  if not(tblParam.EOF) then
  begin
    dtedNorIni.Date := tblParam.FieldByName('NormalIni').Value;
    dtedNorFim.Date := tblParam.FieldByName('NormalFim').Value;
    dtedFerIni.Date := tblParam.FieldByName('FeriasIni').Value;
    dtedFerFim.Date := tblParam.FieldByName('FeriasFim').Value;
    dted13Ini.Date  := tblParam.FieldByName('Pgto13Ini').Value;
    dted13Fim.Date  := tblParam.FieldByName('Pgto13Fim').Value;
  end
  else
  begin
    MsgDlg('Não Há Período a Ser Fechado !','Aviso', mtInformation,[mbOk,mbHelp],0);
    Close;
  end;
end;

procedure TfrmFechaFolha.FormShow(Sender: TObject);
begin
  inherited;
  if (MsgDlg('Foram Feitos o Preparo e Geração para Todas as Unidades ?',
      LerMensagem(4), mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then
  begin
    close;
    exit;
  end;

  if (MsgDlg('Foram Emitidos Todos os Recibos de Pagamento Aplicáveis ?',
      LerMensagem(4), mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then
  begin
    close;
    exit;
  end;

  if (MsgDlg('Foram Emitidos Todos os Relatórios Operacionais Aplicáveis ?',
      LerMensagem(4), mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then
  begin
    close;
    exit;
  end;

  if (MsgDlg('Foram Executados Todos os Procedimentos Legais Aplicáveis (ex.: Emissão/Geração de Guias) ?',
      LerMensagem(4), mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then
  begin
    close;
    exit;
  end;

  if (MsgDlg('Confirma o Fechamento da Folha ?',
      LerMensagem(4), mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then
    exit;

  dtedNorIni.Text := IncData(dtedNorIni.Text,0,1,0);
  dtedFerIni.Text := IncData(dtedFerIni.Text,0,1,0);
  dted13Ini.Text  := IncData(dted13Ini.Text,0,1,0);
  dtedNorFim.Text := IncData(dtedNorFim.Text,0,1,0);
  dtedFerFim.Text := IncData(dtedFerFim.Text,0,1,0);
  dted13Fim.Text  := IncData(dted13Fim.Text,0,1,0);
  //
  MsgDlg('Após Fechar Esta Caixa de Aviso, Confirme ou Altere as Datas e Tecle OK para '+
         'Fechar a Folha ou Cancelar para Desistir','Aviso', mtInformation,[mbOk,mbHelp],0);
end;

procedure TfrmFechaFolha.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  tblParam.Edit;
  tblParam.FieldByName('NormalIni').Value := dtedNorIni.Date;
  tblParam.FieldByName('NormalFim').Value := dtedNorFim.Date;
  tblParam.FieldByName('FeriasIni').Value := dtedFerIni.Date;
  tblParam.FieldByName('FeriasFim').Value := dtedFerFim.Date;
  tblParam.FieldByName('Pgto13Ini').Value := dted13Ini.Date;
  tblParam.FieldByName('Pgto13Fim').Value := dted13Fim.Date;
  tblParam.Post;
  Close;
end;

end.
