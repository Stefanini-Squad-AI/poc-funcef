unit FAcertaDepend;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSelPessoal, Db, DBTables, Wwquery, Wwdatsrc, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdblook, Spin, TEdNum, Wwtable, wwdbdatetimepicker,
  CMDateTimePicker, ComCtrls;

type
  TfrmAcertaDepend = class(TfrmSelPessoal)
    gbxDataBase: TGroupBox;
    dtBaseSalFam: TCMDateTimePicker;
    dsDepentit: TwwDataSource;
    tblDepentit: TwwTable;
    tblDepend: TwwTable;
    tblPesFis: TwwTable;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAcertaDepend: TfrmAcertaDepend;

implementation

{$R *.DFM}

uses uMensErro, fAguarde;

procedure TfrmAcertaDepend.FormCreate(Sender: TObject);
begin
  inherited;
  dtBaseSalFam.Date := Date;
  cbxTemporarios.Checked := True;
  cbxEstagiarios.Checked := True;
  cbxTerceiros.Checked := True;
  cbxProprietarios.Checked := True;
  cbxAutonomos.Checked := True;
  cbxAfastados.Checked := True;
end;

procedure TfrmAcertaDepend.bbtnConfirmarClick(Sender: TObject);
var
  DepTotal, DepIRRF, DepSalF, Idade, FlgSal: integer;
begin
  tblDepend.Close;
  tblDepentit.Close;
  tblPesFis.Close;

  if (MsgDlg('Você está prestes a executar um procedimento que vai alterar as ' +
             'quantidades de dependentes dos empregados (pasta Dados Pessoais), ' +
             'baseado no Cadastro de Dependentes. Confirma a execução ? ','Confirmação ',
             mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo) then
    exit;

  if (MsgDlg('Esta é uma segunda chance para se arrepender. Confirma mesmo a execução ? '
             ,'Confirmação ',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo) then
    exit;

  frmAguarde.Mostra ('Verificando e ajustando a quantidade de dependentes...');
  frmAguarde.Pos := 0;

  inherited;

  tblDepentit.Open;
  tblDepend.Open;
  tblPesFis.Open;
  tblPessoal.First;

  frmAguarde.Max := tblPessoal.RecordCount;
  frmAguarde.Min := 0;

  while not(tblPessoal.EOF) do
  begin
    DepTotal := 0;
    DepIRRF  := 0;
    DepSalF  := 0;
    tblDepentit.First;
    while not(tblDepentit.EOF) do
    begin
      DepTotal := DepTotal + 1;
      if (tblDepentit.FieldByName('FLGCONTAIMPOSTOR').AsInteger = 1) then
        DepIRRF := DepIRRF + 1;

      if (tblDepentit.FieldByName('IDDEPENDENCIA').AsString = 'FIL') then
      begin
        if not(tblDepend.FieldByName('DataNasc').IsNull) then
        begin
          FlgSal := 0;
          Idade := round(int((dtBaseSalFam.Date + 1 -
                   tblDepend.FieldByName('DataNasc').Value) / 365.25));
          if (Idade < 14) then
            FlgSal := 1;

          if (FlgSal <> tblDepentit.FieldByName('FLGCONTASALARIOF').AsInteger) then
          begin
            tblDepentit.Edit;
            tblDepentit.FieldByName('FLGCONTASALARIOF').AsInteger := FlgSal;
            tblDepentit.Post;
            tblDepentit.Next; //??? Parece que ele voltava 1 para tras
          end;

          if (FlgSal = 1) then
            DepSalF := DepSalF + 1;
        end;
      end;
      tblDepentit.Next;
    end;

    if (tblPessoal.FieldByName('NUMDEPTOT').AsInteger  <> DepTotal) or
       (tblPessoal.FieldByName('NUMDEPIRRF').AsInteger <> DepIRRF) or
       (tblPessoal.FieldByName('NUMDEPSALF').AsInteger <> DepSalF) then
    begin
      tblPesFis.Edit;
      tblPesFis.FieldByName('NUMDEPTOT').AsInteger  := DepTotal;
      tblPesFis.FieldByName('NUMDEPIRRF').AsInteger := DepIRRF;
      tblPesFis.FieldByName('NUMDEPSALF').AsInteger := DepSalF;
      tblPesFis.Post;
    end;
    tblPessoal.Next;

    if (frmAguarde.Pos >= tblPessoal.RecordCount) then
      frmAguarde.Pos := 0
    else
    if (tblPessoal.EOF) then
      frmAguarde.Pos := frmAguarde.Max
    else
      frmAguarde.Pos := frmAguarde.Pos+1;
    frmAguarde.Refresh;
  end;

  frmAguarde.Apaga;

  tblDepentit.Close;
  tblDepend.Close;
  tblPesFis.Close;
end;

end.
