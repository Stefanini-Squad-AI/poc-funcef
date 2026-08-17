unit fAssocTabCap;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Wwdbigrd, Wwdbgrid,
  DBCtrls, Grids, DBGrids, Db, DBTables, Wwquery, Wwdatsrc, Menus, FTelaAut,
  TB97, TB97Tlbr, MontaSelect, IvDictio, IvMulti, IvEMulti, Wwdbgrd2,
  wwdbdatetimepicker, ComCtrls;

type
  TfrmAssocTabCap = class(TfrmSairAjuda)
    dbgCpLayout: TwwDBGrid;
    dbgLgLayout: TwwDBGrid;
    qryTabCap: TwwQuery;
    dsTabCap: TwwDataSource;
    qryPlanass: TwwQuery;
    dsPlanass: TwwDataSource;
    qryAssoc: TwwQuery;
    dsAssoc: TwwDataSource;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    BtnAssocia: TButton;
    qryUpd: TwwQuery;
    Label1: TLabel;
    wwDBGrid1: TwwDBGrid;
    qryPlanassIDPLANASS: TFloatField;
    qryPlanassNOME: TStringField;
    Label2: TLabel;
    qryTabCapIDCAPSEGASS: TFloatField;
    qryTabCapDESCPLANO: TStringField;
    qryTabCapTIPOSEG: TStringField;
    qryTabCapCAPITALMN: TFloatField;
    qryTabCapCAPITALIP: TFloatField;
    qryTabCapCAPITALMA: TFloatField;
    qryAssocNOME: TStringField;
    qryAssocDESCPLANO: TStringField;
    qryAssocTIPOSEG: TStringField;
    qryAssocCAPITALMN: TFloatField;
    qryAssocCAPITALIP: TFloatField;
    qryAssocCAPITALMA: TFloatField;
    Label3: TLabel;
    DtVigencia: TDateTimePicker;
    procedure BtnAssociaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
      { Private declarations }
      Inicio: Boolean;

  public
    { Public declarations }
  end;

var
  frmAssocTabCap: TfrmAssocTabCap;

implementation

uses UMensErro, UAdmAss, USistema, DBaseDados, UDataBase;

{$R *.DFM}

procedure TfrmAssocTabCap.BtnAssociaClick(Sender: TObject);
Var sSql,
    sData,
    sIdPlanass,
    sIdCapSegAss: String;
begin
  inherited;
  If (qryTabCap.IsEmpty)Or(qryPlanass.IsEmpty) then Exit;

  If Inicio then
  begin
    MsgDlg('Verifique a data de início de vigência antes de prosseguir.',
              'Erro',mtError,[mbOk,mbHelp],0);
    Inicio:=False;
    Exit;
  end;

  sData := DatetoStr(DTVigencia.Date);

  If Not DataValida(sData,False) then
  begin
    MsgDlg('Digite a data de Início de Vigência.',
              'Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  end;

  If not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;

  sIdPlanass:=qryPlanass.FieldByName('IDPLANASS').AsString;
  sIdCapSegAss:=qryTabCap.FieldByName('IDCAPSEGASS').AsString;

  sSql:='UPDATE CAPSEGASS SET IDPLANASS = '+sIdPlanass+','+
        ' FLGVIGENCIA = '+Chr(39)+'1'+Chr(39)+','+
        ' DTVIGENCIA = TO_DATE('+Chr(39)+sData+Chr(39)+','+
          Chr(39)+'DD/MM/YYYY'+Chr(39)+')'+
        ' WHERE IDCAPSEGASS = '+sIdCapSegAss;

  If sSql<>'' then
  With qryUpd do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSqL);
    try
      ExecSQL;
    except
      dtmBaseDados.dbBaseDados.Rollback;
      MsgDlg('Ocorreu um erro durante a transação. Operação será cancelada.',
              'Erro',mtError,[mbOk,mbHelp],0);
      Abort;
    end;
    dtmBaseDados.dbBaseDados.Commit;
    DtVigencia.Enabled:=False;
  end; {With}
  qryAssoc.Close;
  qryAssoc.Open;
  qryAssoc.Last;
end;

procedure TfrmAssocTabCap.FormCreate(Sender: TObject);
begin
  inherited;
  qryTabCap.Open;
  qryPlanass.Open;
  qryAssoc.Open;
  With qryUpd do
  begin
    Close;
    Sql.Clear;
    Sql.Add('SELECT IDCAPSEGASS'+
            ' FROM CAPSEGASS'+
            ' WHERE FLGVIGENCIA IS NULL');
    Open;
    If Not IsEmpty then
     MsgDlg('ATENÇÃO! VERIFICAR A REGRA DE CÁLCULO DE SEGURO.',
             'Erro',mtError,[mbOk,mbHelp],0);
    Close;
  end; {With}
  Inicio:=True;
end;

procedure TfrmAssocTabCap.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryTabCap.Close;
  qryPlanass.Close;
  qryAssoc.Close;
end;

end.
