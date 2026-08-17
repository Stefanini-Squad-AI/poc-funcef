unit FAssociaHorario;

interface

uses            
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, ExtCtrls, Grids, DBGrids, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, Db, DBTables, Wwquery,
  Wwdatsrc;

type
  TfrmAssociaHorario = class(TfrmOkCancelar)
    qryModifica: TwwQuery;
    qryHorarioTrab: TwwQuery;
    qryHorarioTrabIDHORARIO: TFloatField;
    qryHorarioTrabNOMEHORARIO: TStringField;
    dsHorarioTrab: TwwDataSource;
    dsTurnoDiaSel: TwwDataSource;
    qryTurnoDiaSel: TwwQuery;
    dsTurnoDiaDisp: TwwDataSource;
    qryTurnoDiaDisp: TwwQuery;
    qryTurnoDiaDispIDTURNODIARIO: TFloatField;
    qryTurnoDiaDispINICIOEXPEDIENTE: TStringField;
    qryTurnoDiaDispINICIOALMOCO: TStringField;
    qryTurnoDiaDispFINALALMOCO: TStringField;
    qryTurnoDiaDispFINALEXPEDIENTE: TStringField;
    qryTurnoDiaSelINICIOEXPEDIENTE: TStringField;
    qryTurnoDiaSelINICIOALMOCO: TStringField;
    qryTurnoDiaSelFINALALMOCO: TStringField;
    qryTurnoDiaSelFINALEXPEDIENTE: TStringField;
    qryTurnoDiaSelDIASEMANA: TStringField;
    qryTurnoDiaSelIDDIASEMANA: TFloatField;
    qryTurnoDiaSelIDHORARIO: TFloatField;
    qryTurnoDiaSelIDTURNODIARIO: TFloatField;
    gbxHorarioTrab: TGroupBox;
    dbgrdHorarioTrab: TDBGrid;
    gbxTurnoDiaDisp: TGroupBox;
    dbgrdTurnoDia: TDBGrid;
    rdgDiasSem: TRadioGroup;
    gbxTurnoDiaSel: TGroupBox;
    dbgrdTurnoSem: TDBGrid;
    sbIncluirHorario: TSpeedButton;
    sbIncluirHorarioSemanal: TSpeedButton;
    sbExcluirHorario: TSpeedButton;
    sbExcluirTodosHorarios: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrdHorarioTrabCellClick(Column: TColumn);
    procedure sbIncluirHorarioClick(Sender: TObject);
    procedure sbExcluirHorarioClick(Sender: TObject);
    procedure sbExcluirTodosHorariosClick(Sender: TObject);
    procedure sbIncluirHorarioSemanalClick(Sender: TObject);
  private
    bMsg: boolean;
    iIdHorario: integer;
  public
    { Public declarations }
  end;

var
  frmAssociaHorario: TfrmAssociaHorario;

implementation

uses uMensErro;

{$R *.DFM}

procedure TfrmAssociaHorario.FormCreate(Sender: TObject);
begin
  inherited;
  qryHorarioTrab.Open;
  qryTurnoDiaDisp.Open;
  qryTurnoDiaSel.Prepare;
  qryTurnoDiaSel.ParamByName('IDHORARIO').asString := qryHorarioTrab.FieldByName('IDHORARIO').asString;
  qryTurnoDiaSel.Open;
  iIdHorario := qryHorarioTrab.FieldByName('IDHORARIO').asInteger;
end;

procedure TfrmAssociaHorario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryHorarioTrab.Close;
  qryTurnoDiaDisp.Close;
  qryTurnoDiaSel.Close;
  qryTurnoDiaSel.UnPrepare;
  inherited;
end;

procedure TfrmAssociaHorario.dbgrdHorarioTrabCellClick(Column: TColumn);
begin
  inherited;
  if (iIdHorario <> qryHorarioTrab.FieldByName('IDHORARIO').asInteger) then
  begin
    iIdHorario := qryHorarioTrab.FieldByName('IDHORARIO').asInteger;
    qryTurnoDiaSel.Close;
    qryTurnoDiaSel.ParamByName('IDHORARIO').asString := qryHorarioTrab.FieldByName('IDHORARIO').asString;
    qryTurnoDiaSel.Open;
  end;
end;

procedure TfrmAssociaHorario.sbIncluirHorarioClick(Sender: TObject);
begin
  inherited;
  if (rdgDiasSem.ItemIndex <= -1) then
  begin
    MsgDlg('É necessário selecionar um Dia da Semana !','Aviso', mtInformation,[mbOK,mbHelp],0);
    rdgDiasSem.SetFocus;
  end
  else
  if not(qryTurnoDiaSel.Locate ('IDDIASEMANA',IntToStr(rdgDiasSem.ItemIndex+1),[])) then
  begin
    bMsg := false;
    qryModifica.SQL.Clear;
    qryModifica.SQL.Add('INSERT INTO TURNOSEM(IDHORARIO, IDDIASEMANA, IDTURNODIARIO) '+
                        'VALUES ('+qryHorarioTrab.FieldByName('IDHORARIO').asString+', '+
                        IntToStr(rdgDiasSem.ItemIndex+1)+
                        ', '+qryTurnoDiaDisp.FieldByName('IDTURNODIARIO').asString+')');
    try
      qryModifica.ExecSQL;
    except
      on E: EDBEngineError do
      begin
        MostrarErro(E);
        exit;
      end;
    end;
    qryTurnoDiaSel.Close;
    qryTurnoDiaSel.Open;
  end
  else
  begin
    bMsg := true;
    MsgDlg('Não é permitido selecionar outra vez um Dia da Semana para o mesmo horário !','Aviso', mtInformation,[mbOK,mbHelp],0);
  end;
end;

procedure TfrmAssociaHorario.sbExcluirHorarioClick(Sender: TObject);
begin
  inherited;
  if not(qryTurnoDiaSel.EOF) then
  begin
    qryModifica.SQL.Clear;
    qryModifica.SQL.Add('DELETE FROM TURNOSEM WHERE '+
                       	'(IDHORARIO     = '+qryTurnoDiaSel.FieldByName('IDHORARIO').asString+') AND '  +
                       	'(IDDIASEMANA   = '+qryTurnoDiaSel.FieldByName('IDDIASEMANA').asString+') AND '+
                       	'(IDTURNODIARIO = '+qryTurnoDiaSel.FieldByName('IDTURNODIARIO').asString+')');
    try
      qryModifica.ExecSQL;
    except
      on E: EDBEngineError do
      begin
        MostrarErro(E);
        exit;
      end;
    end;
    qryTurnoDiaSel.Close;
    qryTurnoDiaSel.Open;
  end
  else
    MsgDlg('Não há turnos a desassociar !','Aviso', mtInformation,[mbOK,mbHelp],0);
end;

procedure TfrmAssociaHorario.sbExcluirTodosHorariosClick(Sender: TObject);
begin
  inherited;
  if not(qryTurnoDiaSel.EOF) then
  begin
    qryModifica.SQL.Clear;
    qryModifica.SQL.Add('DELETE FROM TURNOSEM WHERE '+
                       	'(IDHORARIO = '+qryTurnoDiaSel.FieldByName('IDHORARIO').asString+')');
    try
      qryModifica.ExecSQL;
    except
      on E: EDBEngineError do
      begin
        MostrarErro(E);
        exit;
      end;
    end;
    qryTurnoDiaSel.Close;
    qryTurnoDiaSel.Open;
  end
  else
    MsgDlg('Não há turnos a desassociar !','Aviso', mtInformation,[mbOK,mbHelp],0);
end;

procedure TfrmAssociaHorario.sbIncluirHorarioSemanalClick(Sender: TObject);
var
  c: byte;
begin
  inherited;
  for c:=1 to 5 do
  begin
    rdgDiasSem.ItemIndex := c;
    sbIncluirHorarioClick(Sender);
    if (bMsg) then
      break;
  end;
  rdgDiasSem.ItemIndex := 1;
end;

end.
