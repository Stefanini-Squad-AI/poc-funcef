unit FGerProcMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, Wwdatsrc, GanttCh,
  DBTables, wwdblook,  ComCtrls, TeeProcs, TeEngine, Chart, DBChart, Series,
  wwdbdatetimepicker, CMDateTimePicker, DBClient, CMDBLookupCombo, uCmSqlParams,
  uCMClientDataSet, uCtrlTipoProcesso;

type
  TfrmGerProcMT = class(TfrmSairAjuda)
    BtnSel: TBitBtn;
    BtnLimpar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    ToolbarSep972: TToolbarSep97;
    grpPeriodo: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edDataI: TCMDateTimePicker;
    EdDataF: TCMDateTimePicker;
    Label3: TLabel;
    dblcProc: TCMDBLookupCombo;
    Pgc: TPageControl;
    TbConsulta: TTabSheet;
    TbGraf: TTabSheet;
    Panel1: TPanel;
    Grd: TwwDBGrid;
    Panel2: TPanel;
    Cht: TChart;
    Series1: THorizBarSeries;
    sqlConsulta: TCMSqlParams;
    cdsProc: TCMClientDataSet;
    cdsConsulta: TCMClientDataSet;
    dsConsulta: TwwDataSource;
    procedure BtnLimparClick(Sender: TObject);
    procedure BtnSelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    _TipoProcesso : TCtrlTipoProcesso;
    Procedure FazConsulta;
  public
    { Public declarations }
  end;

var
  frmGerProcMT: TfrmGerProcMT;

implementation

{$R *.DFM}

Uses uMensErro, uSistema, dBaseDados;

procedure TfrmGerProcMT.BtnLimparClick(Sender: TObject);
begin
  inherited;
  edDataI.Text   := '';
  edDataF.Text   := '';
  dblcProc.Text  := '';
  Pgc.ActivePage := TbConsulta;
end;

Procedure TfrmGerProcMT.FazConsulta;
Var
   iTotEnt : LongInt;
   iTotFin : LongInt;
   iTotNor : LongInt;
   iTotAtr : LongInt;
Begin
    cdsConsulta.DisableControls;
    sqlConsulta.Sql.Clear;
    sqlConsulta.Sql.Add(' SELECT                            ');
    sqlConsulta.Sql.Add('       TP.IDTIPOPROCESSO,          ');
    sqlConsulta.Sql.Add('       TP.NOME,                    ');
    sqlConsulta.Sql.Add('       ENTRADA.NUMENT,             ');
    sqlConsulta.Sql.Add('       FINALIZA.NUMFIN,            ');
    sqlConsulta.Sql.Add('       NORMAL.NUMNOR,              ');
    sqlConsulta.Sql.Add('       ATRASO.NUMATR               ');
    sqlConsulta.Sql.Add(' FROM                              ');
    sqlConsulta.Sql.Add('      RADTIPOPROCESSO TP,          ');
    sqlConsulta.Sql.Add('      ( SELECT                     ');
    sqlConsulta.Sql.Add('              IDTIPOPROCESSO,      ');
    sqlConsulta.Sql.Add('              COUNT(*) AS NUMENT   ');
    sqlConsulta.Sql.Add('        FROM                       ');
    sqlConsulta.Sql.Add('            RADINSTPROCESSO        ');
    sqlConsulta.Sql.Add('        WHERE                      ');
    sqlConsulta.Sql.Add('               (DATAINIPROCESSO >= TO_DATE('''+DateToStr(edDataI.Date)+''',''DD/MM/YYYY''))    ');
    sqlConsulta.Sql.Add('           AND (DATAINIPROCESSO <= TO_DATE('''+DateToStr(edDataF.Date)+''',''DD/MM/YYYY''))    ');
    sqlConsulta.Sql.Add('        GROUP BY IDTIPOPROCESSO                                         ');
    sqlConsulta.Sql.Add('       ) ENTRADA,                                                       ');
    sqlConsulta.Sql.Add('      ( SELECT                                                          ');
    sqlConsulta.Sql.Add('              IDTIPOPROCESSO,                                           ');
    sqlConsulta.Sql.Add('              COUNT(*) AS NUMFIN                                        ');
    sqlConsulta.Sql.Add('        FROM                                                            ');
    sqlConsulta.Sql.Add('            RADINSTPROCESSO                                             ');
    sqlConsulta.Sql.Add('        WHERE                                                           ');
    sqlConsulta.Sql.Add('               (DATAFIMPROCESSO >= TO_DATE('''+DateToStr(edDataI.Date)+''',''DD/MM/YYYY''))  ');
    sqlConsulta.Sql.Add('           AND (DATAFIMPROCESSO <= TO_DATE('''+DateToStr(edDataF.Date)+''',''DD/MM/YYYY''))  ');
    sqlConsulta.Sql.Add('        GROUP BY IDTIPOPROCESSO                                         ');
    sqlConsulta.Sql.Add('       ) FINALIZA,                                                      ');
    sqlConsulta.Sql.Add('      ( SELECT                                                          ');
    sqlConsulta.Sql.Add('              IDTIPOPROCESSO,                                           ');
    sqlConsulta.Sql.Add('              COUNT(*) AS NUMNOR                                        ');
    sqlConsulta.Sql.Add('        FROM                                                            ');
    sqlConsulta.Sql.Add('            RADINSTPROCESSO                                             ');
    sqlConsulta.Sql.Add('        WHERE                                                           ');
    sqlConsulta.Sql.Add('               (FLGOK <> ''S'')                                           ');
    sqlConsulta.Sql.Add('           AND (DATAFIMPREV >= TO_DATE('''+DateToStr(Date)+''',''DD/MM/YYYY''))      ');
    sqlConsulta.Sql.Add('           AND (DATAINIPROCESSO >= TO_DATE('''+DateToStr(edDataI.Date)+''',''DD/MM/YYYY''))  ');
    sqlConsulta.Sql.Add('           AND (DATAINIPROCESSO <= TO_DATE('''+DateToStr(edDataF.Date)+''',''DD/MM/YYYY''))  ');
    sqlConsulta.Sql.Add('        GROUP BY IDTIPOPROCESSO                                         ');
    sqlConsulta.Sql.Add('       ) NORMAL,                                                        ');
    sqlConsulta.Sql.Add('      ( SELECT                                                          ');
    sqlConsulta.Sql.Add('              IDTIPOPROCESSO,                                           ');
    sqlConsulta.Sql.Add('              COUNT(*) AS NUMATR                                        ');
    sqlConsulta.Sql.Add('        FROM                                                            ');
    sqlConsulta.Sql.Add('            RADINSTPROCESSO                                             ');
    sqlConsulta.Sql.Add('        WHERE                                                           ');
    sqlConsulta.Sql.Add('               (FLGOK <> ''S'')                                           ');
    sqlConsulta.Sql.Add('           AND (DATAFIMPREV < TO_DATE('''+DateToStr(Date)+''',''DD/MM/YYYY''))       ');
    sqlConsulta.Sql.Add('           AND (DATAINIPROCESSO >= TO_DATE('''+DateToStr(edDataI.Date)+''',''DD/MM/YYYY''))  ');
    sqlConsulta.Sql.Add('           AND (DATAINIPROCESSO <= TO_DATE('''+DateToStr(edDataF.Date)+''',''DD/MM/YYYY''))  ');
    sqlConsulta.Sql.Add('        GROUP BY IDTIPOPROCESSO                                         ');
    sqlConsulta.Sql.Add('       ) ATRASO                                                         ');
    sqlConsulta.Sql.Add(' WHERE                                                                  ');
 If Trim(dblcProc.Text) <> '' Then
    Begin
        sqlConsulta.Sql.Add('      (TP.IDTIPOPROCESSO = '+dblcProc.LookupValue+' )');
        sqlConsulta.Sql.Add('  AND (TP.IDTIPOPROCESSO = ENTRADA.IDTIPOPROCESSO)');
    End
 Else
    sqlConsulta.Sql.Add('       (TP.IDTIPOPROCESSO = ENTRADA.IDTIPOPROCESSO)     ');
    sqlConsulta.Sql.Add('   AND (TP.IDTIPOPROCESSO = FINALIZA.IDTIPOPROCESSO(+)) ');
    sqlConsulta.Sql.Add('   AND (TP.IDTIPOPROCESSO = NORMAL.IDTIPOPROCESSO(+))   ');
    sqlConsulta.Sql.Add('   AND (TP.IDTIPOPROCESSO = ATRASO.IDTIPOPROCESSO(+))   ');
    sqlConsulta.Sql.Add(' ORDER BY TP.NOME                                       ');
    sqlConsulta.Open;
    
    iTotEnt := 0;
    iTotFin := 0;
    iTotNor := 0;
    iTotAtr := 0;
    cdsConsulta.First;
    While Not cdsConsulta.EOF Do
      Begin
          iTotEnt := iTotEnt + cdsConsulta.FieldByName('NUMENT').asInteger;
          iTotFin := iTotFin + cdsConsulta.FieldByName('NUMFIN').asInteger;
          iTotNor := iTotNor + cdsConsulta.FieldByName('NUMNOR').asInteger;
          iTotAtr := iTotAtr + cdsConsulta.FieldByName('NUMATR').asInteger;
          cdsConsulta.Next;
      End;
    Series1.Clear;
    Series1.AddBar(iTotAtr,'Pendente (Atrasado)',clRed);
    Series1.AddBar(iTotNor,'Pendente (Normal)',clGreen);
    Series1.AddBar(iTotFin,'Finalizações',clYellow);
    Series1.AddBar(iTotEnt,'Entradas',clBlue);
    cdsConsulta.EnableControls;
End;

procedure TfrmGerProcMT.BtnSelClick(Sender: TObject);
begin
  inherited;
  If Trim(edDataI.Text) = '' Then
     Begin
        MsgDlg('Data de início não preenchida','Erro',mtError,[mbOk],0);
        edDataI.SetFocus;
     End
  Else
  If Trim(edDataF.Text) = '' Then
     Begin
        MsgDlg('Data final não preenchida','Erro',mtError,[mbOk],0);
        edDataF.SetFocus;
     End
  Else
  If edDataI.Date > edDataF.Date Then
     Begin
        MsgDlg('Data de início não pode ser maior que a data final','Erro',mtError,[mbOk],0);
        edDataI.SetFocus;
     End
  Else
     FazConsulta;
end;

procedure TfrmGerProcMT.FormCreate(Sender: TObject);
begin
  inherited;
  Pgc.ActivePage := TbConsulta;
  
  _TipoProcesso := TCtrlTipoProcesso.Create;
  _TipoProcesso.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, True, nil, nil, False);
  
  CdsProc.Data := _TipoProcesso.ListaTipoProcesso(Sistema.idUsuario);
  sqlConsulta.Prepare;
  sqlConsulta.Open;
  
end;

procedure TfrmGerProcMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  _TipoProcesso.Free;
end;

end.
