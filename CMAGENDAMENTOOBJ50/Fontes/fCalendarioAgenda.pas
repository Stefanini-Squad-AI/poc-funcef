unit fCalendarioAgenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, wwdbdatetimepicker, Db, DBClient,
  uCMClientDataSet, uSistema, dBaseDados, uCtrlAgendamento, Grids,
  Wwdbigrd, Wwdbgrid, uCtrlAusenciaAtende, uCtrlAtendeAgenda, JCLSysUtils,
  wwdblook, Provider, DBTables, ActnList, fAgendaComum;

type

  TAgendamento = record
    iIdAtendeAgenda : integer;
    dData : TDateTime;
    sHora : string;
  end;

  TCorTabela = array[1..4] of TColor;

  TfrmCalendarioAgenda = class(TfrmOkCancelar)
    pgcCalendario: TPageControl;
    tbsPorData: TTabSheet;
    tbsPorAtendente: TTabSheet;
    pnlTopData: TPanel;
    lblPorData: TLabel;
    dtData: TwwDBDateTimePicker;
    pnlBodyPorData: TPanel;
    pnlPorDataHorarios: TPanel;
    splttrPorData: TSplitter;
    cdsHorariosNaData: TCMClientDataSet;
    cdsHorariosNaDataHORARIO: TStringField;
    dtsHorariosNaData: TDataSource;
    dbgrdHorarios: TwwDBGrid;
    dbgrdAtendentesNoHorario: TwwDBGrid;
    cdsAtendentesNoHorario: TCMClientDataSet;
    cdsAtendentesNoHorarioIDATENDEAGENDA: TFloatField;
    cdsAtendentesNoHorarioNOME: TStringField;
    cdsAtendentesNoHorarioSOLICITANTE: TStringField;
    cdsAtendentesNoHorarioASSUNTO: TStringField;
    dtsAtendentesNoHorario: TDataSource;
    cdsAtendentesNoHorarioAusente: TBooleanField;
    cdsAtendentesNoHorarioSituacao: TStringField;
    cdsAtendentesNoHorarioIDAGENDAMENTO: TFloatField;
    pnlTopAtendente: TPanel;
    lblPorAtendente: TLabel;
    cdsAtendeAgenda: TCMClientDataSet;
    cdsAtendeAgendaNOME: TStringField;
    cdsAtendeAgendaNOMEUSUARIO: TStringField;
    cdsAtendeAgendaIDATENDEAGENDA: TFloatField;
    cmbAtendente: TwwDBLookupCombo;
    pnlBodyPorAtendente: TPanel;
    pnlProximo: TPanel;
    pnlAtual: TPanel;
    pnlAnterior: TPanel;
    pnlAtualTop: TPanel;
    dbgrdAtual: TwwDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    dbgrdAnt: TwwDBGrid;
    dbgrdPos: TwwDBGrid;
    btnAnt: TSpeedButton;
    btnProx: TSpeedButton;
    lblDiaSemanaAtual: TLabel;
    dtAtual: TwwDBDateTimePicker;
    lblDiaSemanaAnt: TLabel;
    lblDiaSemanaPos: TLabel;
    cdsAtual: TCMClientDataSet;
    dtsAtual: TDataSource;
    cdsAtualIDAGENDAMENTO: TFloatField;
    cdsAtualHORARIO: TStringField;
    cdsAtualSOLICITANTE: TStringField;
    cdsAtualASSUNTO: TStringField;
    cdsAtualSituacao: TStringField;
    cdsAtualAusente: TBooleanField;
    cdsAnt: TCMClientDataSet;
    dtsAnt: TDataSource;
    cdsPos: TCMClientDataSet;
    dtsPos: TDataSource;
    cdsAntHORARIO: TStringField;
    cdsAntSituacao: TStringField;
    cdsAntSOLICITANTE: TStringField;
    cdsAntASSUNTO: TStringField;
    cdsAntAusente: TBooleanField;
    cdsAntIDAGENDAMENTO: TFloatField;
    cdsPosHORARIO: TStringField;
    cdsPosSituacao: TStringField;
    cdsPosSOLICITANTE: TStringField;
    cdsPosASSUNTO: TStringField;
    cdsPosAusente: TBooleanField;
    cdsPosIDAGENDAMENTO: TFloatField;
    ActionList: TActionList;
    actDefinir: TAction;
    cdsAtendentesNoHorarioFLGSITUACAO: TFloatField;
    cdsAntFLGSITUACAO: TFloatField;
    cdsAtualFLGSITUACAO: TFloatField;
    cdsPosFLGSITUACAO: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure dtDataCloseUp(Sender: TObject);
    procedure dtDataExit(Sender: TObject);
    procedure dtDataKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtDataEnter(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbgrdHorariosRowChanged(Sender: TObject);
    procedure cdsAtendentesNoHorarioCalcFields(DataSet: TDataSet);
    procedure dbgrdAtendentesNoHorarioDrawDataCell(Sender: TObject;
      const Rect: TRect; Field: TField; State: TGridDrawState);
    procedure dbgrdAntEnter(Sender: TObject);
    procedure cmbAtendenteEnter(Sender: TObject);
    procedure cmbAtendenteCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure cmbAtendenteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmbAtendenteExit(Sender: TObject);
    procedure dtAtualEnter(Sender: TObject);
    procedure dtAtualCloseUp(Sender: TObject);
    procedure dtAtualExit(Sender: TObject);
    procedure dtAtualKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnProxClick(Sender: TObject);
    procedure btnAntClick(Sender: TObject);
    procedure cdsAtualCalcFields(DataSet: TDataSet);
    procedure dbgrdAtualDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure cdsAntCalcFields(DataSet: TDataSet);
    procedure cdsPosCalcFields(DataSet: TDataSet);
    procedure dbgrdAntDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure dbgrdPosDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure pgcCalendarioChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure actDefinirExecute(Sender: TObject);
    procedure actDefinirUpdate(Sender: TObject);
    procedure dbgrdAtendentesNoHorarioDblClick(Sender: TObject);
  private
    CtrlAgendamento : TCtrlAgendamento;
    CtrlAusenciaAtende : TCtrlAusenciaAtende;
    CtrlAtendeAgenda : TCtrlAtendeAgenda;

    CoresTabela : array[1..5] of TCorTabela;

    procedure PintaCelula( Grid : TwwDBGrid; IndiceCor : integer; bSelecionado : boolean );

    procedure MsgErro(sMsg: String);

    function DiaSemana( dData : TDateTime ) : string;
    function GrdSelected( grd : TwwDBGrid ) : boolean;
  public

    iIdAgendamento : integer;
    Selecionado    : TAgendamento;
    Selecionavel   : boolean;

    dDataAntFocus : TDateTime;
    iIdAtendeAntFocus : integer;
    dDataAtualAntFocus : TDateTime;

    procedure SelecionouData;
    procedure SelecionouHorario;

    procedure SelecionouAtendente;
    procedure SelecionouDataPorAtendente;
    procedure SelecionouAtendenteEData;

    procedure AtualizaDatas;

    function SelecionadoPorAtendente : TAgendamento;
    function SelecionadoPorData      : TAgendamento;

  end;

  function SelecionaAgendamento( iIdAgendamento : integer; var Agendamento : TAgendamento ) : boolean;

  function UsuarioEAtendente : boolean;

  function AgendamentoPorAtendimento( iIdAtend : integer ) : integer;

var
  frmCalendarioAgenda: TfrmCalendarioAgenda;

implementation

{$R *.DFM}

procedure TfrmCalendarioAgenda.FormCreate(Sender: TObject);
begin
  inherited;

  CtrlAgendamento := TCtrlAgendamento.Create;
  CtrlAgendamento.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );

  CtrlAusenciaAtende := TCtrlAusenciaAtende.Create;
  CtrlAusenciaAtende.InitializeAs( CtrlAgendamento );

  CtrlAtendeAgenda := TCtrlAtendeAgenda.Create;
  CtrlAtendeAgenda.InitializeAs( CtrlAgendamento );

  cdsAtendeAgenda.Data := CtrlAtendeAgenda.LookupAtendentes;

  dDataAntFocus      := 0;
  iIdAtendeAntFocus  := 0;
  dDataAtualAntFocus := 0;

  Selecionavel := False;

  iIdAgendamento := 0;

  //Normal
  CoresTabela[1][1] := clBlack;
  CoresTabela[1][2] := clWhite;
  CoresTabela[1][3] := clWhite;
  CoresTabela[1][4] := clNavy;

  //Atualmente agendado
  CoresTabela[2][1] := clBlack;
  CoresTabela[2][2] := $00D3C6AF;
  CoresTabela[2][3] := clWhite;
  CoresTabela[2][4] := $00776542;

  //Não selecionável
  CoresTabela[3][1] := clGray;
  CoresTabela[3][2] := clWhite;
  CoresTabela[3][3] := clSilver;
  CoresTabela[3][4] := clNavy;

  //Agendado
  CoresTabela[4][1] := clMaroon;
  CoresTabela[4][2] := clWhite;
  CoresTabela[4][3] := $00D5EAFD;
  CoresTabela[4][4] := clNavy;

  //Atualmente agendado, porém ausente
  CoresTabela[5][1] := clGray;
  CoresTabela[5][2] := $00D3C6AF;
  CoresTabela[5][3] := clSilver;
  CoresTabela[5][4] := $00776542;
end;

procedure TfrmCalendarioAgenda.FormDestroy(Sender: TObject);
begin
  CtrlAgendamento.Free;
  CtrlAusenciaAtende.Free;
  CtrlAtendeAgenda.Free;
  inherited;
end;

procedure TfrmCalendarioAgenda.SelecionouData;
begin
  if dtData.Date = dDataAntFocus then exit;

  cdsHorariosNaData.Close;
  cdsAtendentesNoHorario.Close;

  if dtData.Date = 0 then exit; 

  cdsHorariosNaData.Data := CtrlAgendamento.HorariosNaData( dtData.Date );
  SelecionouHorario;

  dDataAntFocus := dtData.Date;
end;

procedure TfrmCalendarioAgenda.dtDataCloseUp(Sender: TObject);
begin
  inherited;
  SelecionouData;
end;

procedure TfrmCalendarioAgenda.dtDataExit(Sender: TObject);
begin
  inherited;
  SelecionouData;
end;

procedure TfrmCalendarioAgenda.dtDataKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    SelecionouData;
end;

procedure TfrmCalendarioAgenda.dtDataEnter(Sender: TObject);
begin
  inherited;
  dDataAntFocus := dtData.Date;
end;

procedure TfrmCalendarioAgenda.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end;

procedure TfrmCalendarioAgenda.SelecionouHorario;
begin
  cdsAtendentesNoHorario.Close;
  cdsAtendentesNoHorario.Data := CtrlAgendamento.AtendentesNoHorario( dtData.Date, cdsHorariosNaDataHORARIO.AsString );
end;

procedure TfrmCalendarioAgenda.dbgrdHorariosRowChanged(Sender: TObject);
begin
  inherited;
  SelecionouHorario;
end;

procedure TfrmCalendarioAgenda.cdsAtendentesNoHorarioCalcFields(
  DataSet: TDataSet);
var
  dDataHora : TDateTime;
begin
  inherited;

  dDataHora := dtData.Date + EncodeTime( StrToInt( Copy( cdsHorariosNaDataHORARIO.AsString, 1, 2 ) ),
                             StrToInt( Copy( cdsHorariosNaDataHORARIO.AsString, 3, 2 ) ), 0, 0 );

  cdsAtendentesNoHorarioAusente.AsBoolean := CtrlAusenciaAtende.AusenteNoHorario(
   cdsAtendentesNoHorarioIDATENDEAGENDA.AsInteger, dDataHora );

  if cdsAtendentesNoHorarioFLGSITUACAO.AsInteger = 0 then
    cdsAtendentesNoHorarioSituacao.AsString := Iff( cdsAtendentesNoHorarioAusente.AsBoolean, 'Ausente', iff( dDataHora < Now, '-', 'Livre' ) )
  else
  begin
    if cdsAtendentesNoHorarioFLGSITUACAO.AsInteger = 1 then cdsAtendentesNoHorarioSituacao.AsString := 'Agendado';
    if cdsAtendentesNoHorarioFLGSITUACAO.AsInteger = 2 then cdsAtendentesNoHorarioSituacao.AsString := 'Efetivado';
  end;
end;

procedure TfrmCalendarioAgenda.dbgrdAtendentesNoHorarioDrawDataCell(
  Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
  if   ( Selecionado.iIdAtendeAgenda = cdsAtendentesNoHorarioIDATENDEAGENDA.AsInteger )
   and ( Selecionado.dData           = dtData.Date                                    )
   and ( Selecionado.sHora           = cdsHorariosNaDataHORARIO.Asstring              ) then
  begin
    if not cdsAtendentesNoHorarioAusente.AsBoolean then
      PintaCelula( dbgrdAtendentesNoHorario, 2, gdSelected in State )
    else
      PintaCelula( dbgrdAtendentesNoHorario, 5, gdSelected in State )
  end
  else
  begin
    if cdsAtendentesNoHorarioFLGSITUACAO.AsInteger = 0 then
    begin
      if cdsAtendentesNoHorarioAusente.AsBoolean then
        PintaCelula( dbgrdAtendentesNoHorario, 3, gdSelected in State )
      else
      begin
        if cdsAtendentesNoHorarioSituacao.AsString <> '-' then
          PintaCelula( dbgrdAtendentesNoHorario, 1, gdSelected in State )
        else
          PintaCelula( dbgrdAtendentesNoHorario, 3, gdSelected in State );
      end;
    end
    else
      PintaCelula( dbgrdAtendentesNoHorario, 4, gdSelected in State );
  end;
  dbgrdAtendentesNoHorario.DefaultDrawDataCell( Rect, Field, State	);
end;

procedure TfrmCalendarioAgenda.dbgrdAntEnter(Sender: TObject);
begin
  inherited;
  dbgrdAnt.Options   := dbgrdAnt.Options   - [dgAlwaysShowSelection];
  dbgrdAtual.Options := dbgrdAtual.Options - [dgAlwaysShowSelection];
  dbgrdPos.Options   := dbgrdPos.Options   - [dgAlwaysShowSelection];
  (Sender as TwwDBGrid ).Options   := (Sender as TwwDBGrid ).Options + [dgAlwaysShowSelection];
end;

procedure TfrmCalendarioAgenda.cmbAtendenteEnter(Sender: TObject);
begin
  inherited;
  iIdAtendeAntFocus := StrToIntDef( cmbAtendente.LookupValue, 0 );
end;

procedure TfrmCalendarioAgenda.cmbAtendenteCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  SelecionouAtendente;
end;

procedure TfrmCalendarioAgenda.cmbAtendenteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    SelecionouAtendente;
end;

procedure TfrmCalendarioAgenda.cmbAtendenteExit(Sender: TObject);
begin
  inherited;
  SelecionouAtendente;
end;

procedure TfrmCalendarioAgenda.SelecionouAtendente;
begin
  if StrToIntDef( cmbAtendente.LookupValue, 0 ) = iIdAtendeAntFocus then exit;

  AtualizaDatas;

  SelecionouAtendenteEData;

  iIdAtendeAntFocus := StrToIntDef( cmbAtendente.LookupValue, 0 );
end;

procedure TfrmCalendarioAgenda.SelecionouDataPorAtendente;
begin
  AtualizaDatas;

  if dtAtual.Date <> dDataAtualAntFocus then
    SelecionouAtendenteEData;

  dDataAtualAntFocus := dtAtual.Date;
end;

function TfrmCalendarioAgenda.DiaSemana(dData: TDateTime): string;
begin
  case DayOfWeek( dData ) of
    1 : Result := 'Domingo';
    2 : Result := 'Segunda-feira';
    3 : Result := 'Terça-feira';
    4 : Result := 'Quarta-feira';
    5 : Result := 'Quinta-feira';
    6 : Result := 'Sexta-feira';
    7 : Result := 'Sábado';
  end;
end;

procedure TfrmCalendarioAgenda.dtAtualEnter(Sender: TObject);
begin
  inherited;
  dDataAtualAntFocus := dtAtual.Date;
end;

procedure TfrmCalendarioAgenda.dtAtualCloseUp(Sender: TObject);
begin
  inherited;
  SelecionouDataPorAtendente;
end;

procedure TfrmCalendarioAgenda.dtAtualExit(Sender: TObject);
begin
  inherited;
  SelecionouDataPorAtendente;
end;

procedure TfrmCalendarioAgenda.dtAtualKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    SelecionouDataPorAtendente;
end;

procedure TfrmCalendarioAgenda.btnProxClick(Sender: TObject);
begin
  inherited;
  if dtAtual.Date = 0 then
    dtAtual.Date := Now
  else
    dtAtual.Date := dtAtual.Date + 1;
  SelecionouDataPorAtendente;
  dbgrdAtual.SetFocus;
end;

procedure TfrmCalendarioAgenda.btnAntClick(Sender: TObject);
begin
  inherited;
  if dtAtual.Date = 0 then
    dtAtual.Date := Now
  else
    dtAtual.Date := dtAtual.Date - 1;
  SelecionouDataPorAtendente;
  dbgrdAtual.SetFocus;
end;

procedure TfrmCalendarioAgenda.cdsAtualCalcFields(DataSet: TDataSet);
var
  dDataHora : TDateTime;
begin
  inherited;

  dDataHora := dtAtual.Date + EncodeTime( StrToInt( Copy( cdsAtualHORARIO.AsString, 1, 2 ) ),
                              StrToInt( Copy( cdsAtualHORARIO.AsString, 3, 2 ) ), 0, 0 );

  cdsAtualAusente.AsBoolean := CtrlAusenciaAtende.AusenteNoHorario(
   StrToIntDef( cmbAtendente.LookupValue, 0 ), dDataHora );

  if cdsAtualFLGSITUACAO.AsInteger = 0 then
    cdsAtualSituacao.AsString := Iff( cdsAtualAusente.AsBoolean, 'Ausente', iff( dDataHora < Now, '-', 'Livre' ) )
  else
  begin
    if cdsAtualFLGSITUACAO.AsInteger = 1 then cdsAtualSituacao.AsString := 'Agendado';
    if cdsAtualFLGSITUACAO.AsInteger = 2 then cdsAtualSituacao.AsString := 'Efetivado';
  end;
end;

procedure TfrmCalendarioAgenda.SelecionouAtendenteEData;
begin
  cdsAtual.Close;
  cdsAnt.Close;
  cdsPos.Close;

  if StrToIntDef( cmbAtendente.LookupValue, 0 ) = 0 then exit;
  if dtAtual.Date = 0 then exit;

  cdsAtual.Data := CtrlAgendamento.HorariosDoAtendenteNaData(
   StrToIntDef( cmbAtendente.LookupValue, 0 ), dtAtual.Date );

  cdsAnt.Data := CtrlAgendamento.HorariosDoAtendenteNaData(
   StrToIntDef( cmbAtendente.LookupValue, 0 ), dtAtual.Date - 1 );

  cdsPos.Data := CtrlAgendamento.HorariosDoAtendenteNaData(
   StrToIntDef( cmbAtendente.LookupValue, 0 ), dtAtual.Date + 1 );

  dbgrdAnt.Options   := dbgrdAnt.Options   - [dgAlwaysShowSelection];
  dbgrdAtual.Options := dbgrdAtual.Options + [dgAlwaysShowSelection];
  dbgrdPos.Options   := dbgrdPos.Options   - [dgAlwaysShowSelection];
end;

procedure TfrmCalendarioAgenda.cdsAntCalcFields(DataSet: TDataSet);
var
  dDataHora : TDateTime;
begin
  inherited;

  dDataHora := dtAtual.Date - 1 + EncodeTime( StrToInt( Copy( cdsAntHORARIO.AsString, 1, 2 ) ),
                                  StrToInt( Copy( cdsAntHORARIO.AsString, 3, 2 ) ), 0, 0 );

  cdsAntAusente.AsBoolean := CtrlAusenciaAtende.AusenteNoHorario(
   StrToIntDef( cmbAtendente.LookupValue, 0 ), dDataHora );

  if cdsAntFLGSITUACAO.AsInteger = 0 then
    cdsAntSituacao.AsString := Iff( cdsAntAusente.AsBoolean, 'Ausente', iff( dDataHora < Now, '-', 'Livre' ) )
  else
  begin
    if cdsAntFLGSITUACAO.AsInteger = 1 then cdsAntSituacao.AsString := 'Agendado';
    if cdsAntFLGSITUACAO.AsInteger = 2 then cdsAntSituacao.AsString := 'Efetivado';
  end;
end;

procedure TfrmCalendarioAgenda.cdsPosCalcFields(DataSet: TDataSet);
var
  dDataHora : TDateTime;
begin
  inherited;

  dDataHora := dtAtual.Date + 1 + EncodeTime( StrToInt( Copy( cdsPosHORARIO.AsString, 1, 2 ) ),
                                  StrToInt( Copy( cdsPosHORARIO.AsString, 3, 2 ) ), 0, 0 );

  cdsPosAusente.AsBoolean := CtrlAusenciaAtende.AusenteNoHorario(
   StrToIntDef( cmbAtendente.LookupValue, 0 ), dDataHora );

  if cdsPosFLGSITUACAO.AsInteger = 0 then
    cdsPosSituacao.AsString := Iff( cdsPosAusente.AsBoolean, 'Ausente', iff( dDataHora < Now, '-', 'Livre' ) )
  else
  begin
    if cdsPosFLGSITUACAO.AsInteger = 1 then cdsPosSituacao.AsString := 'Agendado';
    if cdsPosFLGSITUACAO.AsInteger = 2 then cdsPosSituacao.AsString := 'Efetivado';
  end;
end;

procedure TfrmCalendarioAgenda.dbgrdAtualDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
  if   ( Selecionado.iIdAtendeAgenda = StrToIntDef( cmbAtendente.LookupValue, 0 ) )
   and ( Selecionado.dData           = dtAtual.Date                               )
   and ( Selecionado.sHora           = cdsAtualHORARIO.AsString                   ) then
  begin
    if not cdsAtualAusente.AsBoolean then
      PintaCelula( dbgrdAtual, 2, gdSelected in State )
    else
      PintaCelula( dbgrdAtual, 5, gdSelected in State )
  end
  else
  begin
    if cdsAtualFLGSITUACAO.AsInteger = 0 then
    begin
      if cdsAtualAusente.AsBoolean then
        PintaCelula( dbgrdAtual, 3, gdSelected in State )
      else
      begin
        if cdsAtualSituacao.AsString <> '-' then
          PintaCelula( dbgrdAtual, 1, gdSelected in State )
        else
          PintaCelula( dbgrdAtual, 3, gdSelected in State )
      end;
    end
    else
      PintaCelula( dbgrdAtual, 4, gdSelected in State );
  end;
  dbgrdAtual.DefaultDrawDataCell( Rect, Field, State	);
end;

procedure TfrmCalendarioAgenda.dbgrdAntDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
  if   ( Selecionado.iIdAtendeAgenda = StrToIntDef( cmbAtendente.LookupValue, 0 ) )
   and ( Selecionado.dData           = dtAtual.Date - 1                           )
   and ( Selecionado.sHora           = cdsAntHORARIO.AsString                     ) then
  begin
    if not cdsAntAusente.AsBoolean then
      PintaCelula( dbgrdAnt, 2, gdSelected in State )
    else
      PintaCelula( dbgrdAnt, 5, gdSelected in State )
  end
  else
  begin
    if cdsAntFLGSITUACAO.AsInteger = 0 then
    begin
      if cdsAntAusente.AsBoolean then
        PintaCelula( dbgrdAnt, 3, gdSelected in State )
      else
      begin
        if cdsAntSituacao.AsString <> '-' then
          PintaCelula( dbgrdAnt, 1, gdSelected in State )
        else
          PintaCelula( dbgrdAnt, 3, gdSelected in State )
      end;
    end
    else
      PintaCelula( dbgrdAnt, 4, gdSelected in State );
  end;
  dbgrdAnt.DefaultDrawDataCell( Rect, Field, State	);
end;

procedure TfrmCalendarioAgenda.dbgrdPosDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
  if   ( Selecionado.iIdAtendeAgenda = StrToIntDef( cmbAtendente.LookupValue, 0 ) )
   and ( Selecionado.dData           = dtAtual.Date + 1                           )
   and ( Selecionado.sHora           = cdsPosHORARIO.AsString                     ) then
  begin
    if not cdsPosAusente.AsBoolean then
      PintaCelula( dbgrdPos, 2, gdSelected in State )
    else
      PintaCelula( dbgrdPos, 5, gdSelected in State )
  end
  else
  begin
    if cdsPosFLGSITUACAO.AsInteger = 0 then
    begin
      if cdsPosAusente.AsBoolean then
        PintaCelula( dbgrdPos, 3, gdSelected in State )
      else
      begin
        if cdsPosSituacao.AsString <> '-' then
          PintaCelula( dbgrdPos, 1, gdSelected in State )
        else
          PintaCelula( dbgrdPos, 3, gdSelected in State )
      end;
    end
    else
      PintaCelula( dbgrdPos, 4, gdSelected in State );    
  end;
  dbgrdPos.DefaultDrawDataCell( Rect, Field, State	);
end;

procedure TfrmCalendarioAgenda.pgcCalendarioChange(Sender: TObject);
var
  _Agendamento : TAgendamento;
begin
  inherited;
  if pgcCalendario.ActivePage = tbsPorData then
  begin
    _Agendamento := SelecionadoPorAtendente;
    if _Agendamento.iIdAtendeAgenda > 0 then
    begin
      dDataAntFocus := 0;
      dtData.Date := _Agendamento.dData;
      SelecionouData;
      cdsHorariosNaData.Locate( 'HORARIO', _Agendamento.sHora, [] );
      SelecionouHorario;
      cdsAtendentesNoHorario.Locate( 'IDATENDEAGENDA', _Agendamento.iIdAtendeAgenda, [] );
    end;
  end
  else
  begin
    _Agendamento := SelecionadoPorData;
    if _Agendamento.iIdAtendeAgenda > 0 then
    begin
      iIdAtendeAntFocus := 0;
      cmbAtendente.LookupValue := IntToStr( _Agendamento.iIdAtendeAgenda );
      dDataAtualAntFocus := 0;
      dtAtual.Date := _Agendamento.dData;
      SelecionouDataPorAtendente;
      cdsAtual.Locate( 'HORARIO', _Agendamento.sHora, [] );
      iIdAtendeAntFocus := StrToIntDef( cmbAtendente.LookupValue, 0 );
    end;
  end;
end;

function TfrmCalendarioAgenda.SelecionadoPorAtendente: TAgendamento;
begin
  Result.iIdAtendeAgenda := 0;
  Result.dData              := 0;
  Result.sHora              := '';

  if GrdSelected( dbgrdAnt ) then
  begin
    Result.iIdAtendeAgenda := StrToIntDef( cmbAtendente.LookupValue, 0 );
    Result.dData              := dtAtual.Date - 1;
    Result.sHora              := cdsAntHORARIO.AsString;
  end;

  if GrdSelected( dbgrdAtual ) then
  begin
    Result.iIdAtendeAgenda := StrToIntDef( cmbAtendente.LookupValue, 0 );
    Result.dData              := dtAtual.Date;
    Result.sHora              := cdsAtualHORARIO.AsString;
  end;

  if GrdSelected( dbgrdPos ) then
  begin
    Result.iIdAtendeAgenda := StrToIntDef( cmbAtendente.LookupValue, 0 );
    Result.dData              := dtAtual.Date + 1;
    Result.sHora              := cdsPosHORARIO.AsString;
  end;
end;

function TfrmCalendarioAgenda.GrdSelected( grd : TwwDBGrid ) : boolean;
begin
  Result := False;
  if ( (grd.DataSource.DataSet as TClientDataSet).Active ) and ( (grd.DataSource.DataSet as TClientDataSet).RecordCount > 0 ) then
    Result := ( dgAlwaysShowSelection in grd.Options );
end;

procedure TfrmCalendarioAgenda.AtualizaDatas;
begin
  if dtAtual.Date = 0 then
  begin
    lblDiaSemanaAtual.Caption := '';
    lblDiaSemanaAnt.Caption   := '';
    lblDiaSemanaPos.Caption   := '';
  end
  else
  begin
    lblDiaSemanaAtual.Caption := DiaSemana( dtAtual.Date     ) + ', ';
    lblDiaSemanaAnt.Caption   := DiaSemana( dtAtual.Date - 1 ) + ', ' + FormatDateTime( 'dd/mm/yyyy', dtAtual.Date - 1 );
    lblDiaSemanaPos.Caption   := DiaSemana( dtAtual.Date + 1 ) + ', ' + FormatDateTime( 'dd/mm/yyyy', dtAtual.Date + 1 );
  end;
end;

function TfrmCalendarioAgenda.SelecionadoPorData: TAgendamento;
begin
  Result.iIdAtendeAgenda    := 0;
  Result.dData              := 0;
  Result.sHora              := '';

  if cdsAtendentesNoHorario.Active then
    if cdsAtendentesNoHorario.RecordCount > 0 then
    begin
      Result.iIdAtendeAgenda := cdsAtendentesNoHorarioIDATENDEAGENDA.AsInteger;
      Result.dData           := dtData.Date;
      Result.sHora           := cdsHorariosNaDataHORARIO.AsString;
    end;
end;

function SelecionaAgendamento( iIdAgendamento : integer; var Agendamento : TAgendamento ) : boolean;
var
  frm : TfrmCalendarioAgenda;
begin
  Result := False;

  frm := TfrmCalendarioAgenda.Create( Application );
  try
    frm.FormStyle := fsNormal;
    frm.Visible := False;

    frm.Selecionavel := True;

    frm.Selecionado.iIdAtendeAgenda := Agendamento.iIdAtendeAgenda;
    frm.Selecionado.dData           := Agendamento.dData;
    frm.Selecionado.sHora           := Agendamento.sHora;

    frm.iIdAgendamento              := iIdAgendamento;

    frm.TB97oKCancelar.Visible      := True;
    frm.bbtnSair.Visible            := False;

    if frm.ShowModal = mrOk then
    begin
      Agendamento.iIdAtendeAgenda := frm.Selecionado.iIdAtendeAgenda;
      Agendamento.dData           := frm.Selecionado.dData;
      Agendamento.sHora           := frm.Selecionado.sHora;
      Result := True;
    end;

  finally
    frm.Free;
  end;

end;

procedure TfrmCalendarioAgenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Selecionavel then
    Action := caHide;
end;

procedure TfrmCalendarioAgenda.FormShow(Sender: TObject);
begin
  inherited;
  if Selecionado.dData = 0 then
  begin
    if UsuarioEAtendente and ( not Selecionavel ) then
    begin
      pgcCalendario.ActivePage := tbsPorAtendente;
      iIdAtendeAntFocus := 0;
      cmbAtendente.LookupValue := IntToStr( CtrlAtendeAgenda.AtendentePorUsuario( Sistema.IdUsuario ) );
      dDataAtualAntFocus := 0;
      dtAtual.Date := Now;
      SelecionouDataPorAtendente;
      iIdAtendeAntFocus := StrToIntDef( cmbAtendente.LookupValue, 0 );
    end
    else
    begin
      pgcCalendario.ActivePage := tbsPorData;
      dtData.Date  := Now;
      SelecionouData;
    end;
  end
  else
  begin
    pgcCalendario.ActivePage := tbsPorData;
    dDataAntFocus := 0;
    dtData.Date := Selecionado.dData;
    SelecionouData;
    cdsHorariosNaData.Locate( 'HORARIO', Selecionado.sHora, [] );
    SelecionouHorario;
    cdsAtendentesNoHorario.Locate( 'IDATENDEAGENDA', Selecionado.iIdAtendeAgenda, [] );
  end;
end;

procedure TfrmCalendarioAgenda.actDefinirExecute(Sender: TObject);
var
  AgendaAux : TAgendamento;
begin
  inherited;

  if pgcCalendario.ActivePage = tbsPorData then
    AgendaAux := SelecionadoPorData
  else
    AgendaAux := SelecionadoPorAtendente;

  Selecionado.iIdAtendeAgenda := AgendaAux.iIdAtendeAgenda;
  Selecionado.dData           := AgendaAux.dData;
  Selecionado.sHora           := AgendaAux.sHora;

  ModalResult := mrOk;
end;

procedure TfrmCalendarioAgenda.actDefinirUpdate(Sender: TObject);
var
  bHabilita : boolean;
  grd : TwwDbGrid;
begin
  inherited;
  bHabilita := False;

  if pgcCalendario.ActivePage = tbsPorData then
  begin
    if SelecionadoPorData.iIdAtendeAgenda > 0 then
      if cdsAtendentesNoHorarioAusente.AsBoolean = False then
        if  ( cdsAtendentesNoHorarioIDAGENDAMENTO.AsInteger = 0 )
         or ( cdsAtendentesNoHorarioIDAGENDAMENTO.AsInteger = iIdAgendamento ) then
          if cdsAtendentesNoHorarioSituacao.AsString <> '-' then
            bHabilita := True;
  end
  else
  begin
    if SelecionadoPorAtendente.iIdAtendeAgenda > 0 then
    begin
      grd := nil;
      if GrdSelected( dbgrdAnt   ) then grd := dbgrdAnt;
      if GrdSelected( dbgrdAtual ) then grd := dbgrdAtual;
      if GrdSelected( dbgrdPos   ) then grd := dbgrdPos;
      if grd <> nil then
        if grd.DataSource.DataSet.FieldByName('Ausente').AsBoolean = False then
          if  ( grd.DataSource.DataSet.FieldByName('IDAGENDAMENTO').AsInteger = 0 )
           or ( grd.DataSource.DataSet.FieldByName('IDAGENDAMENTO').AsInteger = iIdAgendamento ) then
            if grd.DataSource.DataSet.FieldByName('Situacao').AsString <> '-' then
              bHabilita := True;
    end;
  end;

  actDefinir.Enabled := bHabilita;
end;

procedure TfrmCalendarioAgenda.dbgrdAtendentesNoHorarioDblClick( Sender: TObject );
var
  _iIdAgendamento, _iIdAtendeAgenda : integer;
  _sHorario : string;
  Dataset : TDataset;
begin
  inherited;
  if Selecionavel then
  begin
    if actDefinir.Enabled then
      actDefinir.Execute;
  end
  else
  begin
    Dataset := (Sender as TwwDbGrid).DataSource.DataSet;
    if DataSet.FieldByName('FLGSITUACAO').AsInteger > 0 then
    begin
      _iIdAgendamento  := DataSet.FieldByName('IDAGENDAMENTO').AsInteger;
      _iIdAtendeAgenda := 0;
      if pgcCalendario.ActivePage = tbsPorData then
        _iIdAtendeAgenda := DataSet.FieldByName('IDATENDEAGENDA').AsInteger
      else
        _sHorario := DataSet.FieldByName('HORARIO').AsString;
      if AgendamentoAtend( _iIdAgendamento, 0, 0, '', 0, 0, '', True ) then
      begin
        if pgcCalendario.ActivePage = tbsPorData then
          SelecionouHorario
        else
          SelecionouAtendenteEData;
        if not DataSet.Locate( 'IDAGENDAMENTO', _iIdAgendamento, [] ) then
        begin
          if pgcCalendario.ActivePage = tbsPorData then
            DataSet.Locate( 'IDATENDEAGENDA;FLGSITUACAO', VarArrayOf( [_iIdAtendeAgenda, 0] ), [] )
          else
            DataSet.Locate( 'HORARIO;FLGSITUACAO', VarArrayOf( [_sHorario, 0] ), [] );
        end;
      end;
    end;
  end;
end;


function UsuarioEAtendente : boolean;
var
  CtrlAtendeAgenda : TCtrlAtendeAgenda;
begin
  CtrlAtendeAgenda := TCtrlAtendeAgenda.Create;
  try
    CtrlAtendeAgenda.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
     Sistema.ConnectionSide, Sistema.AppRemoteServer, True, nil );
    Result := CtrlAtendeAgenda.UsuarioEAtendente( Sistema.IdUsuario );
  finally
    CtrlAtendeAgenda.Free;
  end;
end;


function AgendamentoPorAtendimento( iIdAtend : integer ) : integer;
var
  CtrlAgendamento : TCtrlAgendamento;
begin
  CtrlAgendamento := TCtrlAgendamento.Create;
  try
    CtrlAgendamento.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
     Sistema.ConnectionSide, Sistema.AppRemoteServer, True, nil );
    Result := CtrlAgendamento.AgendamentoPorAtendimento( iIdAtend );
  finally
    CtrlAgendamento.Free;
  end;
end;

procedure TfrmCalendarioAgenda.PintaCelula( Grid : TwwDBGrid; IndiceCor : integer; bSelecionado : boolean );
begin
  if not bSelecionado then
  begin
    Grid.Canvas.Font.Color  := CoresTabela[IndiceCor][1];
    Grid.Canvas.Brush.Color := CoresTabela[IndiceCor][2];
  end
  else
  begin
    Grid.Canvas.Font.Color  := CoresTabela[IndiceCor][3];
    Grid.Canvas.Brush.Color := CoresTabela[IndiceCor][4];
  end;
end;

end.
