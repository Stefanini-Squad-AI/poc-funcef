unit fAssociaHorario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  StdCtrls, ExtCtrls, Grids, DBGrids, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, Db, DBTables, DBClient, uCMClientDataSet, Wwdatsrc, Wwdbigrd, Wwdbgrid,
  uCtrlAssociaHorario, uCtrlHoraTrab, uCtrlTurnoDia, uCmSqlParams;

type
  TfrmAssociaHorario = class(TfrmSairAjuda)
    dsHorarioTrab: TwwDataSource;
    dsTurnoDiaSel: TwwDataSource;
    dsTurnoDiaDisp: TwwDataSource;
    gbxHorarioTrab: TGroupBox;
    gbxTurnoDiaDisp: TGroupBox;
    rdgDiasSem: TRadioGroup;
    gbxTurnoDiaSel: TGroupBox;
    sbIncluirHorario: TSpeedButton;
    sbIncluirHorarioSemanal: TSpeedButton;
    sbExcluirHorario: TSpeedButton;
    sbExcluirTodosHorarios: TSpeedButton;
    CdsHorarioTrab: TCMClientDataSet;
    CdsTurnoDiaDisp: TCMClientDataSet;
    CdsTurnoDiaSel: TCMClientDataSet;
    dbgdTurnoDiaDisp: TwwDBGrid;
    dbgdTurnoDiaSel: TwwDBGrid;
    dbgrdHorarioTrab: TwwDBGrid;
    CMSqlParams1: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrdHorarioTrabCellChanged(Sender: TObject);
    procedure sbIncluirHorarioClick(Sender: TObject);
    procedure sbExcluirHorarioClick(Sender: TObject);
    procedure sbIncluirHorarioSemanalClick(Sender: TObject);
    procedure sbExcluirTodosHorariosClick(Sender: TObject);
  private
    CtrlAssociaHorario: TCtrlAssociaHorario;
    CtrlHoraTrab: TCtrlHoraTrab;
    CtrlTurnoDia: TCtrlTurnoDia;
    iIdHorario: integer;
  end;

var
  frmAssociaHorario: TfrmAssociaHorario;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmAssociaHorario.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlHoraTrab := TCtrlHoraTrab.Create;
  CtrlHoraTrab.InitializeAs(Padroes);

  CtrlTurnoDia := TCtrlTurnoDia.Create;
  CtrlTurnoDia.InitializeAs(Padroes);

  CtrlAssociaHorario := TCtrlAssociaHorario.Create;
  CtrlAssociaHorario.InitializeAs(Padroes);
  CtrlAssociaHorario.Cds := CdsTurnoDiaSel;

  CdsHorarioTrab.Data := CtrlHoraTrab.ListHoraTrab(0, 0);
  CdsTurnoDiaDisp.Data := CtrlTurnoDia.ListTurnoDiario;

  iIdHorario := -1;
  dbgrdHorarioTrabCellChanged(Sender);
end;

procedure TfrmAssociaHorario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlAssociaHorario);
  FreeAndNil(CtrlTurnoDia);
  FreeAndNil(CtrlHoraTrab);
  inherited;
end;

procedure TfrmAssociaHorario.dbgrdHorarioTrabCellChanged(Sender: TObject);
begin
  if (iIdHorario <> CdsHorarioTrab.FieldByName('IDHORARIO').asInteger) then
  begin
    iIdHorario := CdsHorarioTrab.FieldByName('IDHORARIO').asInteger;
    CdsTurnoDiaSel.DisableControls;
    CdsTurnoDiaSel.Data := CtrlAssociaHorario.ListTurnoDiaSel(iIdHorario);
    CdsTurnoDiaSel.EnableControls;
  end;
end;

procedure TfrmAssociaHorario.sbIncluirHorarioClick(Sender: TObject);
begin
  CdsTurnoDiaSel.DisableControls;
  if not(CtrlAssociaHorario.AssociarTurnoSemanal(
         rdgDiasSem.ItemIndex+1,
         rdgDiasSem.ItemIndex+1,
         iIdHorario,
         CdsTurnoDiaDisp.FieldByName('IDTURNODIARIO').asInteger,
         CdsTurnoDiaDisp.FieldByName('INICIOEXPEDIENTE').asString,
         CdsTurnoDiaDisp.FieldByName('INICIOALMOCO').asString,
         CdsTurnoDiaDisp.FieldByName('FINALALMOCO').asString,
         CdsTurnoDiaDisp.FieldByName('FINALEXPEDIENTE').asString)) then
    MsgDlg(CtrlAssociaHorario.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0)
  else
    CdsTurnoDiaSel.Data := CtrlAssociaHorario.ListTurnoDiaSel(iIdHorario);
  CdsTurnoDiaSel.EnableControls;
end;

procedure TfrmAssociaHorario.sbExcluirHorarioClick(Sender: TObject);
begin
  CdsTurnoDiaSel.DisableControls;
  if not(CtrlAssociaHorario.DesassociarTurnoSemanal) then
    MsgDlg(CtrlAssociaHorario.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0)
  else
    CdsTurnoDiaSel.Data := CtrlAssociaHorario.ListTurnoDiaSel(iIdHorario);  
  CdsTurnoDiaSel.EnableControls;
end;

procedure TfrmAssociaHorario.sbIncluirHorarioSemanalClick(Sender: TObject);
begin
  CdsTurnoDiaSel.DisableControls;
  if not(CtrlAssociaHorario.AssociarTurnoSemanal(
         2,
         6,
         iIdHorario,
         CdsTurnoDiaDisp.FieldByName('IDTURNODIARIO').asInteger,
         CdsTurnoDiaDisp.FieldByName('INICIOEXPEDIENTE').asString,
         CdsTurnoDiaDisp.FieldByName('INICIOALMOCO').asString,
         CdsTurnoDiaDisp.FieldByName('FINALALMOCO').asString,
         CdsTurnoDiaDisp.FieldByName('FINALEXPEDIENTE').asString)) then
    MsgDlg(CtrlAssociaHorario.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0)
  else
    CdsTurnoDiaSel.Data := CtrlAssociaHorario.ListTurnoDiaSel(iIdHorario);    
  CdsTurnoDiaSel.EnableControls;
end;

procedure TfrmAssociaHorario.sbExcluirTodosHorariosClick(Sender: TObject);
begin
  CdsTurnoDiaSel.DisableControls;
  CdsTurnoDiaSel.First;
  repeat
    if not(CtrlAssociaHorario.DesassociarTurnoSemanal) then
    begin
      raise Exception.Create(CtrlAssociaHorario.MessageInfo);
      break;
    end;
  until (CdsTurnoDiaSel.EOF);  
  CdsTurnoDiaSel.EnableControls;
end;

end.
