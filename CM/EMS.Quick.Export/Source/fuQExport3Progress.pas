unit fuQExport3Progress;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms, StdCtrls, ExtCtrls, QExport3;

const
  WM_QEXPORT_PROGRESS = WM_USER + 1;

  QEP_START = 1;
  QEP_FETCHED = 2;
  QEP_SKIPPED = 3;
  QEP_EXPORTED = 4;
  QEP_PAUSE = 5;
  QEP_CONTINUE = 6;
  QEP_ABORT = 7;
  QEP_FINISH = 8;
  QEP_DONE = 9;

type
  TQExportStatus = (estBegin, estSkipping, estFetching, estExporting, estPause,
    estContinue, estAbort, estEnd);

  TfmQExport3Progress = class(TForm)
    paButtons: TPanel;
    bButton: TButton;
    paInfo: TPanel;
    Bevel4: TBevel;
    laStatusValue: TLabel;
    Bevel3: TBevel;
    laStatus: TLabel;
    Bevel1: TBevel;
    laExported: TLabel;
    Bevel2: TBevel;
    laExportedValue: TLabel;
    Bevel5: TBevel;
    laTime: TLabel;
    Bevel6: TBevel;
    laTimeValue: TLabel;
    tmTimer: TTimer;
    laSpeed: TLabel;
    Bevel7: TBevel;
    laSpeedValue: TLabel;
    Bevel8: TBevel;
    procedure tmTimerTimer(Sender: TObject);
    procedure bButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FExportedRows: integer;
    FFetchedRows: integer;
    FStatus: TQExportStatus;
    FTime: TDateTime;
    FQExport: TQExport3;
    FSkippedRows: integer;

    procedure SetSkippedRows(const Value: integer);
    procedure SetExportedRows(Value: integer);
    procedure SetFetchedRows(const Value: integer);

    procedure SetStatus(const Value: TQExportStatus);
  protected
    procedure CreateParams( var Params: TCreateParams ); override;
    procedure ExportProgress(var Msg: TMessage); message WM_QEXPORT_PROGRESS;
  public
    constructor CreateProgress(AOwner: TComponent; AQExport: TQExport3);
    procedure ShowTime;

    property SkippedRows: integer read FSkippedRows write SetSkippedRows;
    property ExportedRows: integer read FExportedRows write SetExportedRows;
    property FetchedRows: integer read FFetchedRows write SetFetchedRows;
    property Status: TQExportStatus read FStatus write SetStatus;
  end;


implementation

uses {$IFDEF WIN32}QExport3StrIDs{$ENDIF}
     {$IFDEF LINUX}QExport3Consts{$ENDIF};

{$R *.DFM}

{ TQExportDialogProgressF }

constructor TfmQExport3Progress.CreateProgress(AOwner: TComponent;
  AQExport: TQExport3);
begin
  inherited Create(AOwner);
  FQExport := AQExport;
  FSkippedRows := 0;
  FExportedRows := 0;
  FTime := 0;
  ShowTime;
end;

procedure TfmQExport3Progress.CreateParams(var Params: TCreateParams);
begin
  inherited;
  if Assigned(Owner) and (Owner is TForm) then
    with Params do
    begin
      Style := Style or ws_Overlapped;
      WndParent := (Owner as TForm).Handle;
    end;
end;

procedure TfmQExport3Progress.ExportProgress(var Msg: TMessage);
begin
  if Msg.Msg = WM_QEXPORT_PROGRESS then
    case Msg.WParam of
      QEP_START: begin
         if not tmTimer.Enabled then tmTimer.Enabled := true;
         Status := estBegin;
      end;
      QEP_FETCHED: begin
        if not tmTimer.Enabled then tmTimer.Enabled := true;
        Status := estFetching;
        FetchedRows := FetchedRows + 1;
      end;
      QEP_SKIPPED: begin
        if not tmTimer.Enabled then tmTimer.Enabled := true;
        Status := estSkipping;
        SkippedRows := SkippedRows + 1;
      end;
      QEP_EXPORTED: begin
        if not tmTimer.Enabled then tmTimer.Enabled := true;
        Status := estExporting;
        ExportedRows := ExportedRows + 1;
      end;
      QEP_PAUSE: begin
        if tmTimer.Enabled then tmTimer.Enabled := false;
        Status := estPause;
      end;
      QEP_CONTINUE: begin
        if not tmTimer.Enabled then tmTimer.Enabled := true;
        Status := estContinue;
      end;
      QEP_ABORT: begin
        if tmTimer.Enabled then tmTimer.Enabled := false;
        Status := estAbort;
      end;
      QEP_FINISH: begin
        if tmTimer.Enabled then tmTimer.Enabled := false;
        Status := estEnd;
      end;
      QEP_DONE: Close;
    end;
end;

procedure TfmQExport3Progress.SetSkippedRows(const Value: integer);
begin
  FSkippedRows := Value;
  laExportedValue.Caption := IntToStr(FSkippedRows);
end;

procedure TfmQExport3Progress.SetExportedRows(Value: integer);
begin
  FExportedRows := Value;
  laExportedValue.Caption := IntToStr(FExportedRows);
end;

procedure TfmQExport3Progress.SetFetchedRows(const Value: integer);
begin
  FFetchedRows := Value;
  laExportedValue.Caption := IntToStr(FFetchedRows);
end;

procedure TfmQExport3Progress.SetStatus(const Value: TQExportStatus);
begin
{  if (FStatus = estFetching) and (Value = estExporting)
    then}
  FStatus := Value;
  case FStatus of
    estBegin: begin
      laStatusValue.Caption := 'Preparando';//{$IFDEF WIN32}QExportLoadStr(QEDP_Preparing){$ENDIF}
                               //{$IFDEF LINUX}QEDP_Preparing{$ENDIF};
      bButton.Caption := {$IFDEF WIN32}QExportLoadStr(QEDP_Cancel){$ENDIF}
                         {$IFDEF LINUX}QEDP_Cancel{$ENDIF};
    end;
    estSkipping: begin
      laStatusValue.Caption := 'Pulando';//{$IFDEF WIN32}QExportLoadStr(QEDP_Skipping){$ENDIF}
                               //{$IFDEF LINUX}QEDP_Skipping{$ENDIF};
      laExported.Caption := 'Exportado';//{$IFDEF WIN32}QExportLoadStr(QEDP_Skipped){$ENDIF}
                            //{$IFDEF LINUX}QEDP_Skipped{$ENDIF};
    end;
    estExporting: begin
      laStatusValue.Caption := 'Exportando';//{$IFDEF WIN32}QExportLoadStr(QEDP_Exporting){$ENDIF}
                               //{$IFDEF LINUX}QEDP_Exporting{$ENDIF};
      laExported.Caption := 'Exportado';//{$IFDEF WIN32}QExportLoadStr(QEDP_Exported){$ENDIF}
                            //{$IFDEF LINUX}QEDP_Exported{$ENDIF};
    end;
    estFetching: begin
      laStatusValue.Caption := 'Buscando';//{$IFDEF WIN32}QExportLoadStr(QEDP_Fetching){$ENDIF}
                               //{$IFDEF LINUX}QEDP_Fetching{$ENDIF};
      laExported.Caption := 'Exportado';//{$IFDEF WIN32}QExportLoadStr(QEDP_Fetched){$ENDIF}
                            //{$IFDEF LINUX}QEDP_Fetched{$ENDIF};
    end;
    estPause: laStatusValue.Caption := 'Pausa';//{$IFDEF WIN32}QExportLoadStr(QEDP_Pause){$ENDIF}
                                       //{$IFDEF LINUX}QEDP_Pause{$ENDIF};
    estContinue: begin
      laStatusValue.Caption := 'Exportando';//{$IFDEF WIN32}QExportLoadStr(QEDP_Exporting){$ENDIF}
                               //{$IFDEF LINUX}QEDP_Exporting{$ENDIF};
      bButton.Caption := {$IFDEF WIN32}QExportLoadStr(QEDP_Cancel){$ENDIF}
                         {$IFDEF LINUX}QEDP_Cancel{$ENDIF};
    end;
    estAbort: begin
      laStatusValue.Caption := 'Abortado';//{$IFDEF WIN32}QExportLoadStr(QEDP_Aborted){$ENDIF}
                               //{$IFDEF LINUX}QEDP_Aborted{$ENDIF};
      bButton.Caption := {$IFDEF WIN32}QExportLoadStr(QEDP_OK){$ENDIF}
                         {$IFDEF LINUX}QEDP_OK{$ENDIF};
    end;
    estEnd: begin
      laStatusValue.Caption := 'Finalizado';//{$IFDEF WIN32}QExportLoadStr(QEDP_Finished){$ENDIF}
                              // {$IFDEF LINUX}QEDP_Finished{$ENDIF};
      bButton.Caption := {$IFDEF WIN32}QExportLoadStr(QEDP_OK){$ENDIF}
                         {$IFDEF LINUX}QEDP_OK{$ENDIF};
    end;
  end;
end;

procedure TfmQExport3Progress.tmTimerTimer(Sender: TObject);
var
  FSpeed: integer;
  Hour, Min, Sec, MSec: word;
begin
  FTime := FTime + 0.00001;
  ShowTime;
  DecodeTime(FTime, Hour, Min, Sec, MSec);

  if (Sec + Min * 60 + Hour * 3600) > 0
    then FSpeed := Trunc((FetchedRows + ExportedRows + SkippedRows) /
      (Sec + Min * 60 + Hour * 3600))
    else FSpeed := 0;
  laSpeedValue.Caption := Format({$IFDEF WIN32}QExportLoadStr(QEDP_RowsPerSec){$ENDIF}
                                 {$IFDEF LINUX}QEDP_RowsPerSec{$ENDIF}, [FSpeed]);
end;

procedure TfmQExport3Progress.bButtonClick(Sender: TObject);
begin
  case Status of
    estBegin,
    estFetching,
    estExporting,
    estContinue: begin
      FQExport.Abort;
    end;
    else ModalResult := mrOk;
  end;
end;

procedure TfmQExport3Progress.ShowTime;
begin
  laTimeValue.Caption := FormatDateTime({$IFDEF WIN32}QExportLoadStr(QEDP_TimeFormat){$ENDIF}
                                        {$IFDEF LINUX}QEDP_TimeFormat{$ENDIF}, FTime);
end;

procedure TfmQExport3Progress.FormShow(Sender: TObject);
begin
  Caption := {$IFDEF WIN32}QExportLoadStr(QEDP_Caption){$ENDIF}
             {$IFDEF LINUX}QEDP_Caption{$ENDIF};
  laStatus.Caption :='Situação';// {$IFDEF WIN32}QExportLoadStr(QEDP_Status){$ENDIF}
                      //{$IFDEF LINUX}QEDP_Status{$ENDIF};
  laTime.Caption := 'Tempo';//{$IFDEF WIN32}QExportLoadStr(QEDP_Time){$ENDIF}
                    //{$IFDEF LINUX}QEDP_Time{$ENDIF};
  laSpeed.Caption := 'Velocidade';//{$IFDEF WIN32}QExportLoadStr(QEDP_Speed){$ENDIF}
                     //{$IFDEF LINUX}QEDP_Speed{$ENDIF};
end;

end.
