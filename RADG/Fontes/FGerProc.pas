unit FGerProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, Wwdatsrc,
  DBTables, Wwquery, wwdblook,  ComCtrls,
  TeeProcs, TeEngine, Chart, DBChart, Series, GanttCh, CMDBLookupCombo,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmGerProc = class(TfrmSairAjuda)
    qry: TwwQuery;
    ds: TwwDataSource;
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
    qryIDTIPOPROCESSO: TFloatField;
    qryNOME: TStringField;
    qryNUMENT: TFloatField;
    qryNUMFIN: TFloatField;
    qryNUMNOR: TFloatField;
    qryNUMATR: TFloatField;
    Pgc: TPageControl;
    TbConsulta: TTabSheet;
    TbGraf: TTabSheet;
    Panel1: TPanel;
    Grd: TwwDBGrid;
    Panel2: TPanel;
    Cht: TChart;
    Series1: THorizBarSeries;
    procedure BtnLimparClick(Sender: TObject);
    procedure BtnSelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
     Procedure FazConsulta;
  public
    { Public declarations }
  end;

var
  FrmGerProc: TFrmGerProc;

implementation

{$R *.DFM}
Uses uMensErro, DRelRAD, uSistema;

procedure TFrmGerProc.BtnLimparClick(Sender: TObject);
begin
  inherited;
  edDataI.Text   := '';
  edDataF.Text   := '';
  dblcProc.Text  := '';
  Pgc.ActivePage := TbConsulta;
end;

Procedure TFrmGerProc.FazConsulta;
Var
   iTotEnt : LongInt;
   iTotFin : LongInt;
   iTotNor : LongInt;
   iTotAtr : LongInt;
Begin
    qry.DisableControls;
    qry.Close;
    qry.Sql.Clear;
    qry.Sql.Add(' SELECT                            ');
    qry.Sql.Add('       TP.IDTIPOPROCESSO,          '); 
    qry.Sql.Add('       TP.NOME,                    '); 
    qry.Sql.Add('       ENTRADA.NUMENT,             '); 
    qry.Sql.Add('       FINALIZA.NUMFIN,            '); 
    qry.Sql.Add('       NORMAL.NUMNOR,              '); 
    qry.Sql.Add('       ATRASO.NUMATR               '); 
    qry.Sql.Add(' FROM                              '); 
    qry.Sql.Add('      RADTIPOPROCESSO TP,          '); 
    qry.Sql.Add('      ( SELECT                     '); 
    qry.Sql.Add('              IDTIPOPROCESSO,      '); 
    qry.Sql.Add('              COUNT(*) AS NUMENT   '); 
    qry.Sql.Add('        FROM                       '); 
    qry.Sql.Add('            RADINSTPROCESSO        '); 
    qry.Sql.Add('        WHERE                      ');
    qry.Sql.Add('               (DATAINIPROCESSO >= TO_DATE('''+DateToStr(edDataI.Date)+''',''DD/MM/YYYY''))    ');
    qry.Sql.Add('           AND (DATAINIPROCESSO <= TO_DATE('''+DateToStr(edDataF.Date)+''',''DD/MM/YYYY''))    ');
    qry.Sql.Add('        GROUP BY IDTIPOPROCESSO                                         ');
    qry.Sql.Add('       ) ENTRADA,                                                       ');
    qry.Sql.Add('      ( SELECT                                                          ');
    qry.Sql.Add('              IDTIPOPROCESSO,                                           ');
    qry.Sql.Add('              COUNT(*) AS NUMFIN                                        ');
    qry.Sql.Add('        FROM                                                            ');
    qry.Sql.Add('            RADINSTPROCESSO                                             ');
    qry.Sql.Add('        WHERE                                                           ');
    qry.Sql.Add('               (DATAFIMPROCESSO >= TO_DATE('''+DateToStr(edDataI.Date)+''',''DD/MM/YYYY''))  ');
    qry.Sql.Add('           AND (DATAFIMPROCESSO <= TO_DATE('''+DateToStr(edDataF.Date)+''',''DD/MM/YYYY''))  ');
    qry.Sql.Add('        GROUP BY IDTIPOPROCESSO                                         ');
    qry.Sql.Add('       ) FINALIZA,                                                      ');
    qry.Sql.Add('      ( SELECT                                                          ');
    qry.Sql.Add('              IDTIPOPROCESSO,                                           ');
    qry.Sql.Add('              COUNT(*) AS NUMNOR                                        ');
    qry.Sql.Add('        FROM                                                            ');
    qry.Sql.Add('            RADINSTPROCESSO                                             ');
    qry.Sql.Add('        WHERE                                                           ');
    qry.Sql.Add('               (FLGOK <> ''S'')                                           ');
    qry.Sql.Add('           AND (DATAFIMPREV >= TO_DATE('''+DateToStr(Date)+''',''DD/MM/YYYY''))      ');
    qry.Sql.Add('           AND (DATAINIPROCESSO >= TO_DATE('''+DateToStr(edDataI.Date)+''',''DD/MM/YYYY''))  ');
    qry.Sql.Add('           AND (DATAINIPROCESSO <= TO_DATE('''+DateToStr(edDataF.Date)+''',''DD/MM/YYYY''))  ');
    qry.Sql.Add('        GROUP BY IDTIPOPROCESSO                                         ');
    qry.Sql.Add('       ) NORMAL,                                                        ');
    qry.Sql.Add('      ( SELECT                                                          ');
    qry.Sql.Add('              IDTIPOPROCESSO,                                           ');
    qry.Sql.Add('              COUNT(*) AS NUMATR                                        ');
    qry.Sql.Add('        FROM                                                            ');
    qry.Sql.Add('            RADINSTPROCESSO                                             ');
    qry.Sql.Add('        WHERE                                                           ');
    qry.Sql.Add('               (FLGOK <> ''S'')                                           ');
    qry.Sql.Add('           AND (DATAFIMPREV < TO_DATE('''+DateToStr(Date)+''',''DD/MM/YYYY''))       ');
    qry.Sql.Add('           AND (DATAINIPROCESSO >= TO_DATE('''+DateToStr(edDataI.Date)+''',''DD/MM/YYYY''))  ');
    qry.Sql.Add('           AND (DATAINIPROCESSO <= TO_DATE('''+DateToStr(edDataF.Date)+''',''DD/MM/YYYY''))  ');
    qry.Sql.Add('        GROUP BY IDTIPOPROCESSO                                         ');
    qry.Sql.Add('       ) ATRASO                                                         ');
    qry.Sql.Add(' WHERE                                                                  ');
 If Trim(dblcProc.Text) <> '' Then
    Begin
        qry.Sql.Add('      (TP.IDTIPOPROCESSO = '+dblcProc.LookupValue+' )');
        qry.Sql.Add('  AND (TP.IDTIPOPROCESSO = ENTRADA.IDTIPOPROCESSO)');
    End
 Else
    qry.Sql.Add('       (TP.IDTIPOPROCESSO = ENTRADA.IDTIPOPROCESSO)     ');
    qry.Sql.Add('   AND (TP.IDTIPOPROCESSO = FINALIZA.IDTIPOPROCESSO(+)) ');
    qry.Sql.Add('   AND (TP.IDTIPOPROCESSO = NORMAL.IDTIPOPROCESSO(+))   ');
    qry.Sql.Add('   AND (TP.IDTIPOPROCESSO = ATRASO.IDTIPOPROCESSO(+))   ');
    qry.Sql.Add(' ORDER BY TP.NOME                                       ');
    qry.Open;

    iTotEnt := 0;
    iTotFin := 0;
    iTotNor := 0;
    iTotAtr := 0;
    qry.First;
    While Not qry.EOF Do
      Begin
          iTotEnt := iTotEnt + qry.FieldByName('NUMENT').asInteger;
          iTotFin := iTotFin + qry.FieldByName('NUMFIN').asInteger;
          iTotNor := iTotNor + qry.FieldByName('NUMNOR').asInteger;
          iTotAtr := iTotAtr + qry.FieldByName('NUMATR').asInteger;
          qry.Next;
      End;
    Series1.Clear;
    Series1.AddBar(iTotAtr,'Pendente (Atrasado)',clRed);
    Series1.AddBar(iTotNor,'Pendente (Normal)',clGreen);
    Series1.AddBar(iTotFin,'Finalizações',clYellow);
    Series1.AddBar(iTotEnt,'Entradas',clBlue);
    qry.EnableControls;


End;

procedure TFrmGerProc.BtnSelClick(Sender: TObject);
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

procedure TFrmGerProc.FormCreate(Sender: TObject);
begin
  inherited;
  Pgc.ActivePage := TbConsulta;
  qry.Open;
  DtmRelRAD.qryProc.Close;
  DtmRelRAD.qryProc.Params[0].AsInteger := Sistema.idUsuario;
  DtmRelRAD.qryProc.Open;
end;

end.
