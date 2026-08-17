unit FProcessaEventoCobranca;

{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Autor: Ewerton Beltramini 
Data:  16/12/2020 
Pendência: SIG53021
Descrição: Inclusão de filtro por periodo na tela. 
--------------------------------------------------------------------------------
Autor(a)    : FELIPE SANTOS
Data        : 21/02/2013
Pendência   : SOL 179255/11104 KINTANA 1772792
Descrição   : Criação da funcionalidade. 
------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, Db,
  DBTables, Spin;

type
  TfrmProcessaEventoCobranca = class(TfrmSairAjuda)
    dtpDataLimite: TCMDateTimePicker;
    lblDataLimite: TLabel;
    rdgProcessarEventos: TRadioGroup;
    chkConsContrato: TCheckBox;
    chkNaoConsContrato: TCheckBox;
    bbtnProcessar: TBitBtn;
    Label1: TLabel;
    sEdtAnoInicio: TSpinEdit;
    CmbMesesInicio: TComboBox;
    CmbMesesFim: TComboBox;
    sEdtAnoFim: TSpinEdit;
    Label2: TLabel;
    procedure bbtnProcessarClick(Sender: TObject);
    procedure chkConsContratoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure chkNaoConsContratoMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure chkNaoConsContratoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chkConsContratoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bPeriodoCompetencia : Boolean;
  end;

var
  frmProcessaEventoCobranca: TfrmProcessaEventoCobranca;

implementation

{$R *.DFM}

procedure TfrmProcessaEventoCobranca.bbtnProcessarClick(Sender: TObject);
var
   stpEventosCobranca : TStoredProc;
   dtInicio, dtFim, dtTotal : TDateTime;
begin
  inherited;

  if dtpDataLimite.Date = 0 then
  begin
       ShowMessage('Campo Data Limite é de preenchimento obrigatório');
       dtpDataLimite.SetFocus;
       Exit;
  end;

  //Ewerton Beltramini - 16/12/2020 - SIG53021 - Inicio...
  bPeriodoCompetencia := True;
  if (   (sEdtAnoInicio.Value = sEdtAnoFim.Value) and (CmbMesesInicio.ItemIndex > CmbMesesFim.ItemIndex)
      or (sEdtAnoInicio.Value > sEdtAnoFim.Value)  )then
  begin
       ShowMessage('A referência (mês/ano) inicial não pode ser maior que a Referência (mês/ano) final!');
       CmbMesesInicio.SetFocus;
       bPeriodoCompetencia := False;
       Exit;
  end;

  if  ((CmbMesesInicio.ItemIndex <> -1) and (CmbMesesFim.ItemIndex = -1))
   or ((CmbMesesInicio.ItemIndex = -1) and (CmbMesesFim.ItemIndex <> -1)) then
  begin
       ShowMessage('A Referência (mês/ano) deve ser preenchida em ambos os campos!');
       CmbMesesInicio.SetFocus;
       bPeriodoCompetencia := False;
       Exit;
  end;

  if ((CmbMesesInicio.ItemIndex = -1) and (CmbMesesFim.ItemIndex = -1)) then
     bPeriodoCompetencia := False;
  //Ewerton Beltramini - 16/12/2020 - SIG53021 - Fim.


  if ((not(chkConsContrato.Checked)) and (not(chkNaoConsContrato.Checked))) then
  begin
       ShowMessage('Campo Contrato do arquivo é de preenchimento obrigatório');
       chkConsContrato.SetFocus;
       Exit;
  end;

  try

     stpEventosCobranca := TStoredProc.Create(Application);
     stpEventosCobranca.DatabaseName := 'BaseDados';
     stpEventosCobranca.StoredProcName := 'CM.SP_EVENTOS_COBRANCA';

     // parâmetros

     stpEventosCobranca.Params.CreateParam(ftInteger, 'pInArquivo', ptInput);
     stpEventosCobranca.Params.CreateParam(ftInteger, 'pNotInArquivo', ptInput);
     stpEventosCobranca.Params.CreateParam(ftDate, 'pDataLimite', ptInput);
     stpEventosCobranca.Params.CreateParam(ftInteger, 'pTipoProcesso', ptInput);

     //Ewerton Beltramini - 16/12/2020 - SIG53021 - Inicio...
     stpEventosCobranca.Params.CreateParam(ftInteger, 'pDataInicio', ptInput);
     stpEventosCobranca.Params.CreateParam(ftInteger, 'pDataFim', ptInput);
     //Ewerton Beltramini - 16/12/2020 - SIG53021 - Fim.

     // passando valores para os parâmetros

     if (chkConsContrato.Checked) then
     begin
          stpEventosCobranca.ParamByName('pInArquivo').AsInteger := 1;
     end
     else
     begin
          stpEventosCobranca.ParamByName('pInArquivo').AsInteger := -1;
     end;

     if (chkNaoConsContrato.Checked) then
     begin
          stpEventosCobranca.ParamByName('pNotInArquivo').AsInteger := 1;
     end
     else
     begin
          stpEventosCobranca.ParamByName('pNotInArquivo').AsInteger := -1;
     end;

     stpEventosCobranca.ParamByName('pDataLimite').AsDate := dtpDataLimite.Date;

     if (rdgProcessarEventos.ItemIndex = 0) then
     begin
        stpEventosCobranca.ParamByName('pTipoProcesso').AsInteger := 3;
     end
     else if (rdgProcessarEventos.ItemIndex = 1) then
     begin
        stpEventosCobranca.ParamByName('pTipoProcesso').AsInteger := 0;
     end
     else if (rdgProcessarEventos.ItemIndex = 2) then
     begin
        stpEventosCobranca.ParamByName('pTipoProcesso').AsInteger := 1;
     end
     else
     begin
        stpEventosCobranca.ParamByName('pTipoProcesso').AsInteger := 2;
     end;


     //Ewerton Beltramini - 16/12/2020 - SIG53021 - Inicio...
     if bPeriodoCompetencia then
     begin
         stpEventosCobranca.ParamByName('pDataInicio').AsDate := StrToDate('01/' + Copy('0'+ IntToStr(CmbMesesInicio.ItemIndex) ,length('0'+ IntToStr(CmbMesesInicio.ItemIndex))-1,2) + '/' + IntToStr(sEdtAnoInicio.Value));
         stpEventosCobranca.ParamByName('pDataFim').AsDate := StrToDate('01/' + Copy('0'+ IntToStr(CmbMesesFim.ItemIndex) ,length('0'+ IntToStr(CmbMesesFim.ItemIndex))-1,2) + '/' + IntToStr(sEdtAnoFim.Value));
     end
     else
     begin
         stpEventosCobranca.ParamByName('pDataInicio').AsDate := null;
         stpEventosCobranca.ParamByName('pDataFim').AsDate := null;
     end;
    //Ewerton Beltramini - 16/12/2020 - SIG53021 - Fim.

     stpEventosCobranca.Prepare;

     dtInicio := now;

     stpEventosCobranca.ExecProc;

     // tempo do processamento

     dtFim := now;

     // passou de 24 horas
     if (dtFim - dtInicio >= 1) then
     begin
          dtTotal := (dtFim - dtInicio) * 24;

          ShowMessage('Tempo Total do Processo: ' + FloatToStr(Trunc(dtTotal))
                       + ':' + FormatDateTime('nn:ss', dtFim - dtInicio));
     end
     // não passou
     else
     begin
          ShowMessage('Tempo Total do Processo: ' +
                             FormatDateTime('hh:nn:ss', dtFim - dtInicio));
     end;

  finally
     FreeAndNil(stpEventosCobranca);
  end;

end;

procedure TfrmProcessaEventoCobranca.chkConsContratoMouseUp(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  if (chkNaoConsContrato.Checked) then
      chkNaoConsContrato.Checked := False;
end;

procedure TfrmProcessaEventoCobranca.chkNaoConsContratoMouseUp(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  if (chkConsContrato.Checked) then
     chkConsContrato.Checked := False;
end;

procedure TfrmProcessaEventoCobranca.chkNaoConsContratoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (chkConsContrato.Checked) then
     chkConsContrato.Checked := false;
end;

procedure TfrmProcessaEventoCobranca.chkConsContratoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (chkNaoConsContrato.Checked) then
     chkNaoConsContrato.Checked := False;
end;

procedure TfrmProcessaEventoCobranca.FormCreate(Sender: TObject);
begin
  inherited;
   //Ewerton Beltramini - 16/12/2020 - SIG53021 - Inicio...
   CmbMesesInicio.ItemIndex := StrToInt(FormatDateTime('mm',date));
   CmbMesesFim.ItemIndex    := StrToInt(FormatDateTime('mm',IncMonth(date,1)));
   sEdtAnoInicio.Value      := StrToInt(FormatDateTime('yyyy',date));
   if CmbMesesInicio.ItemIndex <> 12 then
      sEdtAnoFim.Value      := StrToInt(FormatDateTime('yyyy',date))
   else
      sEdtAnoFim.Value      := StrToInt(FormatDateTime('yyyy',date))+1;
   //Ewerton Beltramini - 16/12/2020 - SIG53021 - Fim.


end;

end.
