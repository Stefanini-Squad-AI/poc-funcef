unit FGerExecEtapaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db,
  DBTables, Wwquery, wwdblook, CMDBLookupCombo, Wwdatsrc,
  wwdbdatetimepicker, CMDateTimePicker, uCtrlTipoProcesso, DBClient,
  uCMClientDataSet, uCmSqlParams;

type
  TFrmGerExecEtapaMT = class(TfrmSairAjuda)
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
    Label3: TLabel;
    dblcProc: TCMDBLookupCombo;
    dsConsulta: TwwDataSource;
    cdsProc: TCMClientDataSet;
    sqlConsulta: TCMSqlParams;
    cdsConsulta: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure BtnSelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    _TipoProcesso : TCtrlTipoProcesso;
    Procedure FazConsulta;
  public
    { Public declarations }
  end;

var
  FrmGerExecEtapaMT: TFrmGerExecEtapaMT;

implementation

{$R *.DFM}

Uses uMensErro, uSistema, dBaseDados;

procedure TFrmGerExecEtapaMT.FormCreate(Sender: TObject);
begin
  inherited;
  _TipoProcesso := TCtrlTipoProcesso.Create;
  _TipoProcesso.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  
  CdsProc.Data := _TipoProcesso.ListaTipoProcesso(Sistema.idUsuario);
  sqlConsulta.Prepare;
  sqlConsulta.Open;
end;

Procedure TFrmGerExecEtapaMT.FazConsulta;
Begin
    cdsConsulta.DisableControls;
    sqlConsulta.SQL.Clear;
    sqlConsulta.Sql.add(' SELECT                                               ');
    sqlConsulta.Sql.add('      USU.IDUSUARIO,                                  ');
    sqlConsulta.Sql.add('      USU.NOMEUSUARIO,                                ');
    sqlConsulta.Sql.add('      TE.NOME,                                        ');
    sqlConsulta.Sql.add('      TP.NOME AS NOMEPROC,                            ');
    sqlConsulta.Sql.add('      SUB.NUM                                         ');
    sqlConsulta.Sql.add(' FROM                                                 ');
    sqlConsulta.Sql.add('      USUARIOSISTEMA USU,                             ');
    sqlConsulta.Sql.add('      RADTIPOETAPA TE,                                ');
    sqlConsulta.Sql.add('      RADTIPOPROCESSO TP,                             ');
  If Trim(dblcProc.Text) <> '' Then
    sqlConsulta.Sql.add('      RADTIPOETAPAXPROC EXP,                          ');
    sqlConsulta.Sql.add('      (                                               ');
    sqlConsulta.Sql.add('       SELECT                                         ');
    sqlConsulta.Sql.add('            IP.IDTIPOPROCESSO,                        ');
    sqlConsulta.Sql.add('            AUT.IDUSUARIO,                            ');
    sqlConsulta.Sql.add('            IE.IDTIPOETAPA,                           ');
    sqlConsulta.Sql.add('            COUNT(*) AS NUM                           ');
    sqlConsulta.Sql.add('       FROM                                           ');
    sqlConsulta.Sql.add('           RADAUTORIZACAO AUT,                        ');
    sqlConsulta.Sql.add('           RADINSTETAPA IE,                           ');
    sqlConsulta.Sql.add('           RADINSTPROCESSO IP                         ');
    sqlConsulta.Sql.add('       WHERE                                          ');
    sqlConsulta.Sql.add('               (AUT.DATAAUTORIZACAO >= TO_DATE('''+DateToStr(edDataI.Date)+''',''DD/MM/YYYY'') )');
    sqlConsulta.Sql.add('           AND (AUT.DATAAUTORIZACAO <= TO_DATE('''+DateToStr(edDataF.Date)+''',''DD/MM/YYYY'') )');
    sqlConsulta.Sql.add('           AND (AUT.IDETAPA = IE.IDETAPA)             ');
    sqlConsulta.Sql.add('           AND (IE.IDPROCESSO = IP.IDPROCESSO)        ');
    sqlConsulta.Sql.add('       GROUP BY IP.IDTIPOPROCESSO,                    ');
    sqlConsulta.Sql.add('                AUT.IDUSUARIO,                        ');
    sqlConsulta.Sql.add('                IE.IDTIPOETAPA                        ');
    sqlConsulta.Sql.add('         ) SUB                                        ');
    sqlConsulta.Sql.add(' WHERE                                                ');
  If Trim(dblcProc.Text) <> '' Then
    Begin
       sqlConsulta.Sql.add('       (EXP.IDTIPOPROCESSO = '+dblcProc.LookupValue+') ');
       sqlConsulta.Sql.add('   AND (SUB.IDTIPOETAPA    = EXP.IDTIPOETAPA)          ');
       sqlConsulta.Sql.add('   AND (SUB.IDTIPOPROCESSO = EXP.IDTIPOPROCESSO)       ');
       sqlConsulta.Sql.add('   AND (SUB.IDUSUARIO      = USU.IDUSUARIO)            ');
    End
  Else
    sqlConsulta.Sql.add('       (SUB.IDUSUARIO  = USU.IDUSUARIO)               ');
    sqlConsulta.Sql.add('   AND (SUB.IDTIPOETAPA = TE.IDTIPOETAPA)             ');
    sqlConsulta.Sql.add('   AND (SUB.IDTIPOPROCESSO = TP.IDTIPOPROCESSO)       ');
    sqlConsulta.Sql.add(' ORDER BY USU.NOMEUSUARIO, TP.NOME                    ');
    sqlConsulta.Open;
    cdsConsulta.EnableControls;
End;

procedure TFrmGerExecEtapaMT.BtnLimparClick(Sender: TObject);
begin
  inherited;
  edDataI.Text  := '';
  edDataF.Text  := '';
  dblcProc.Text := '';
end;

procedure TFrmGerExecEtapaMT.BtnSelClick(Sender: TObject);
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

procedure TFrmGerExecEtapaMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  _TipoProcesso.Free;
end;

end.
