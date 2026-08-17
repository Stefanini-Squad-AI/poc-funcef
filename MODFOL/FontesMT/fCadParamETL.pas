unit fCadParamETL;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, uCtrlParamETL,
  Mask, DBCtrls, TREdit, wwdbdatetimepicker, CMDateTimePicker, Wwquery;

type
  TFrmCadParamETL = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label3: TLabel;
    dbedValor: TDBRealEdit;
    Label2: TLabel;
    dbedDescr: TDBEdit;
    GroupBox1: TGroupBox;
    lblDataCotacao: TLabel;
    DbDataInicio: TCMDateTimePicker;
    LbldataFin: TLabel;
    DbDataFim: TCMDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure dsStateChange(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
  private
    { Private declarations }
    CtrlETL: TCtrlParamETL;
    sCodigo, sDescricao : string;
    dDataIni            : TDateTime;

    procedure Seleciona(Id: double);
    function  GravarRegistro: boolean;
    function ValidaPeriodoVigencia(sCodigo, dtInicio, dtFim : string): Boolean;

  public
    { Public declarations }
  end;

var
  FrmCadParamETL: TFrmCadParamETL;

implementation

uses uMensErro,uCtrlPadroes;

{$R *.DFM}

procedure TFrmCadParamETL.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlETL := TCtrlParamETL.Create;
  CtrlETL.InitializeAs(Padroes);
  CtrlETL.Cds := Cds;
  Seleciona(-1);

end;

procedure TFrmCadParamETL.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlETL);

end;

procedure TFrmCadParamETL.CmeCadastroInsert(Sender: TObject);
var
  qryInset :TwwQuery;
Begin
  Seleciona(-1);
  inherited;

  qryInset := TwwQuery.create(Application);
  qryInset.DataBaseName := 'BaseDados';
  qryInset.Close;
  qryInset.SQL.Text := ' SELECT MAX(ID) ID '+
                       ' FROM PARAMFP ';

  qryInset.Open;

  cds.FieldByName('id').AsFloat := qryInset.FieldByName('ID').AsInteger +1  ;

  if sCodigo <> '' then
  begin
    cds.FieldByName('codigo').AsString := sCodigo;
    cds.FieldByName('descricao').AsString := sDescricao;
    cds.FieldByName('dt_inicio').AsDateTime := dDataIni;
  end;

  qryInset.Destroy;

end;

procedure TFrmCadParamETL.Seleciona(Id: double);
begin
  Cds.Data := CtrlETL.ListGeral(Id);
end;

procedure TFrmCadParamETL.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Seleciona(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TFrmCadParamETL.bbtnConfirmarClick(Sender: TObject);
var
  bInserindo: boolean;

begin
  if (Trim(dbedCodigo.Text) = '') then
  begin
    MsgDlg('Preencha o Código.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedCodigo.SetFocus;
  end
  else
  if (Trim(dbedDescr.Text) = '') then
  begin
    MsgDlg('Preencha a Descrição.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedDescr.SetFocus;
  end
  else
  if (DbDataInicio.Text = '')then
  begin
    MsgDlg( 'Informe a Data Início', 'Aviso', MtInformation, [MbOk], 0 );
    Exit;
  end
  else
  if (DbDataFim.Text = '')then
  begin
    MsgDlg( 'Informe a Data Fim', 'Aviso', MtInformation, [MbOk], 0 );
    Exit;
  end
  else
  if (DbDataInicio.Date > DbDataFim.Date) and (DbDataFim.Text <> '')then begin
    MsgDlg( 'A Data Fim deve ser maior que a Data Início', 'Aviso', MtInformation, [MbOk], 0 );
    Exit;
  end
  else
  if ValidaPeriodoVigencia(dbedCodigo.Text, DbDataInicio.Text, DbDataFim.Text)  and (Cds.State = dsInsert) then
  begin
    MsgDlg('Já existe uma vigência para o período', 'Aviso', MtInformation, [MbOk], 0 );
    Exit;
  end
  else
  begin
    bInserindo := (Cds.State = dsInsert);
    inherited;
    if not(bInserindo) then
      CmeCadastroFind(Sender);
  end;

end;

function TFrmCadParamETL.ValidaPeriodoVigencia(sCodigo, dtInicio, dtFim : string): Boolean;
var
  sSql : string;
  qryConsulta:TwwQuery;
begin
  Result := False;

  qryConsulta := TwwQuery.create(Application);
  qryConsulta.DataBaseName := 'BaseDados';

  sSql :=  'SELECT  Count(*) as total ' +
           ' FROM  PARAMFP ' +
           ' WHERE  (codigo = ' + quotedstr(sCodigo) + ') ' +
           ' and ((' + quotedstr(dtInicio) + ' between dt_inicio and dt_fim) OR ' +
           ' (' + quotedstr(dtFim) + ' between dt_inicio and dt_fim)) ' ;

   qryConsulta.sql.Clear;
   qryConsulta.SQL.add(sSql);
   qryConsulta.Open();

   if qryConsulta.FieldByName('total').AsFloat > 0 then
     result := True;

   qryConsulta.Destroy;

end;


procedure TFrmCadParamETL.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;

end;

procedure TFrmCadParamETL.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;

end;

procedure TFrmCadParamETL.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;

end;

procedure TFrmCadParamETL.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

function TFrmCadParamETL.GravarRegistro: boolean;
begin
  Result := CtrlETL.Gravar;
  if not(Result) then
    raise exception.Create(CtrlETL.MessageInfo);
end;

procedure TFrmCadParamETL.sbtnInserirClick(Sender: TObject);
begin
  sCodigo    := '';
  sDescricao := '';
  dDataIni   := 0;

  if Length(trim(Cds.FieldByName('codigo').asString)) > 0 then
  begin
    sCodigo    := Cds.FieldByName('codigo').asString;
    sDescricao := Cds.FieldByName('descricao').asString;
    dDataIni   :=  Cds.FieldByName('dt_fim').asDateTime + 1;
  end;

  inherited;

end;

end.
