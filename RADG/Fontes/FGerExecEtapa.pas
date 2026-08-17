unit FGerExecEtapa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db,
  DBTables, Wwquery, wwdblook, CMDBLookupCombo, Wwdatsrc,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmGerExecEtapa = class(TfrmSairAjuda)
    Panel1: TPanel;
    Grd: TwwDBGrid;
    Panel2: TPanel;
    BtnSel: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    BtnLimpar: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    grpPeriodo: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edDataI: TCMDateTimePicker;
    EdDataF: TCMDateTimePicker;
    qry: TwwQuery;
    qryProc: TwwQuery;
    Label3: TLabel;
    dblcProc: TCMDBLookupCombo;
    qryIDUSUARIO: TFloatField;
    qryNOMEUSUARIO: TStringField;
    qryNOME: TStringField;
    qryNUM: TFloatField;
    ds: TwwDataSource;
    qryNOMEPROC: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure BtnSelClick(Sender: TObject);
  private
    { Private declarations }
    Procedure FazConsulta;
  public
    { Public declarations }
  end;

var
  FrmGerExecEtapa: TFrmGerExecEtapa;

implementation

{$R *.DFM}

Uses uMensErro, dRelRAD, uSistema;

procedure TFrmGerExecEtapa.FormCreate(Sender: TObject);
begin
  inherited;
  qry.Open;
  DtmRelRAD.qryProc.Close;
  DtmRelRAD.qryProc.Params[0].AsInteger := Sistema.idUsuario;
  DtmRelRAD.qryProc.Open;
end;

Procedure TFrmGerExecEtapa.FazConsulta;
Begin
    qry.DisableControls;
    qry.Close;
    qry.Sql.Clear;
    qry.Sql.add(' SELECT                                               ');
    qry.Sql.add('      USU.IDUSUARIO,                                  ');
    qry.Sql.add('      USU.NOMEUSUARIO,                                ');
    qry.Sql.add('      TE.NOME,                                        ');
    qry.Sql.add('      TP.NOME AS NOMEPROC,                            ');    
    qry.Sql.add('      SUB.NUM                                         ');
    qry.Sql.add(' FROM                                                 ');
    qry.Sql.add('      USUARIOSISTEMA USU,                             ');
    qry.Sql.add('      RADTIPOETAPA TE,                                ');
    qry.Sql.add('      RADTIPOPROCESSO TP,                             ');
  If Trim(dblcProc.Text) <> '' Then
    qry.Sql.add('      RADTIPOETAPAXPROC EXP,                          ');
    qry.Sql.add('      (                                               ');
    qry.Sql.add('       SELECT                                         ');
    qry.Sql.add('            IP.IDTIPOPROCESSO,                        ');
    qry.Sql.add('            AUT.IDUSUARIO,                            ');
    qry.Sql.add('            IE.IDTIPOETAPA,                           ');
    qry.Sql.add('            COUNT(*) AS NUM                           ');
    qry.Sql.add('       FROM                                           ');
    qry.Sql.add('           RADAUTORIZACAO AUT,                        ');
    qry.Sql.add('           RADINSTETAPA IE,                           ');
    qry.Sql.add('           RADINSTPROCESSO IP                         ');
    qry.Sql.add('       WHERE                                          ');
    qry.Sql.add('               (AUT.DATAAUTORIZACAO >= TO_DATE('''+DateToStr(edDataI.Date)+''',''DD/MM/YYYY'') )');
    qry.Sql.add('           AND (AUT.DATAAUTORIZACAO <= TO_DATE('''+DateToStr(edDataF.Date)+''',''DD/MM/YYYY'') )');
    qry.Sql.add('           AND (AUT.IDETAPA = IE.IDETAPA)             ');
    qry.Sql.add('           AND (IE.IDPROCESSO = IP.IDPROCESSO)        ');
    qry.Sql.add('       GROUP BY IP.IDTIPOPROCESSO,                    ');
    qry.Sql.add('                AUT.IDUSUARIO,                        ');
    qry.Sql.add('                IE.IDTIPOETAPA                        ');
    qry.Sql.add('         ) SUB                                        ');
    qry.Sql.add(' WHERE                                                ');
  If Trim(dblcProc.Text) <> '' Then
    Begin
       qry.Sql.add('       (EXP.IDTIPOPROCESSO = '+dblcProc.LookupValue+') ');
       qry.Sql.add('   AND (SUB.IDTIPOETAPA    = EXP.IDTIPOETAPA)          ');
       qry.Sql.add('   AND (SUB.IDTIPOPROCESSO = EXP.IDTIPOPROCESSO)       ');
       qry.Sql.add('   AND (SUB.IDUSUARIO      = USU.IDUSUARIO)            ');
    End
  Else
    qry.Sql.add('       (SUB.IDUSUARIO  = USU.IDUSUARIO)               ');
    qry.Sql.add('   AND (SUB.IDTIPOETAPA = TE.IDTIPOETAPA)             ');
    qry.Sql.add('   AND (SUB.IDTIPOPROCESSO = TP.IDTIPOPROCESSO)       ');
    qry.Sql.add(' ORDER BY USU.NOMEUSUARIO, TP.NOME                    ');
    qry.Open;
    qry.EnableControls;
End;

procedure TFrmGerExecEtapa.BtnLimparClick(Sender: TObject);
begin
  inherited;
  edDataI.Text  := '';
  edDataF.Text  := '';
  dblcProc.Text := '';
end;

procedure TFrmGerExecEtapa.BtnSelClick(Sender: TObject);
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

end.
