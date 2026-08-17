unit FRelAprovaDocs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  uCtrlParamIntegra, wwdblook, Db, DBTables, Wwquery, Machklb, IvDictio, IvMulti,
  IvEMulti, wwdbdatetimepicker, CMDateTimePicker, fParamReports_Padrao,
  CmParamReport, DBClient, uCMClientDataSet, uCmSqlParams, FAguarde;

type
  TFrmRelAprovaDocs = class(TfrmParamReports_Padrao)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    DlIni: TCMDateTimePicker;
    DlFim: TCMDateTimePicker;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    LckModulo: TwwDBLookupCombo;
    CklLotes: TCMchklistbox;
    SqlModulo: TCMSqlParams;
    CdsModulo: TCMClientDataSet;
    SqlLotePagto: TCMSqlParams;
    CdsLotePagto: TCMClientDataSet;
    SbAdTodos: TBitBtn;
    SbAdInverte: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure LckModuloCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DlIniExit(Sender: TObject);
    procedure DlFimEnter(Sender: TObject);
    procedure SbAdTodosClick(Sender: TObject);
  private
    { Private declarations }
    procedure SelFaixaLotes;
  public
    { Public declarations }
  end;

var
  FrmRelAprovaDocs: TFrmRelAprovaDocs;

implementation

uses uDataBase, uSistema, uMensErro;
{$R *.DFM}

Procedure TFrmRelAprovaDocs.SelFaixaLotes;
Begin
  frmAguarde.Mostra( 'Pesquisando lotes' );
  SqlLotePagto.SQL.Clear;
  SqlLotePagto.SQL.Add(' SELECT DISTINCT LOTEPAGTO.NUMLOTE,LOTEPAGTO.NUMCHQBORDERO  ' +
    ' FROM LOTEPAGTO, LOTEXDOCUM LOTEX, DOCUMENTO DOC ' +
    ',(select count(*) as totdocum , numlote from lotexdocum ld , documento d where ' +
    '        D.RECPAG         = ''' + ParamIntegra.RecPag + '''  AND ' +
    '         ld.CODDOCUMENTO = D.CODDOCUMENTO group by numlote  ) totdocum ' +
    ',(select count(*) as totdocum , numlote from lotexdocum ld , documento d where ' +
    '        D.RECPAG         = ''' + ParamIntegra.RecPag + '''  AND ' +
    '         ld.CODDOCUMENTO = D.CODDOCUMENTO  and ' +
    '         d.codtipdoc in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
    ParamIntegra.RecPag + ''' and not exists  (select 1 from UsuarioxTpdocto b where recpag=' + #39 + ParamIntegra.recpag + #39 +
    ' and b.idusuario=' +
    inttostr(sistema.IdUsuario) + ') union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
    ParamIntegra.RecPag + '''  and exists (select 1 from UsuarioxTpdocto b where recpag=' + #39 + ParamIntegra.recpag + #39 +
    ' and a.codtipdoc=b.codtipdoc and b.idusuario=' +
    inttostr(sistema.idusuario) + ')) group by numlote  ) totlote ' +
    ' WHERE ' +
    ' (LOTEPAGTO.FLAGEMISSAO = ''1'') AND  ' +
    '  totlote.totdocum=totdocum.totdocum and ' +
    ' totlote.numlote=totdocum.numlote and   totlote.numlote=  LOTEPAGTO.NUMLOTE  and ');
  if (LckModulo.Text <> '') then
    SqlLotePagto.SQL.Add(' (DOC.IDMODULO  = ' + LckModulo.LookupValue + ') AND ');

  if (DlIni.text <> '') and (DlFim.text <> '') then
    SqlLotePagto.SQL.Add(' (LOTEPAGTO.DATAEMISSAO BETWEEN to_date(''' + DlIni.text + ''',''dd/MM/yyyy'')  and  to_date(''' +
      DlFim.text + ''',''dd/MM/yyyy'')) AND ');

  SqlLotePagto.SQL.Add(' (LOTEPAGTO.IDPESSOA = ' + InttoStr(Sistema.IdEmpresa) + ') AND ' +
    ' (DOC.RECPAG         = ''' + ParamIntegra.RecPag + ''')            AND ' +
    ' (LOTEPAGTO.NUMLOTE  = LOTEX.NUMLOTE)                           AND ' +
    ' (LOTEX.CODDOCUMENTO = DOC.CODDOCUMENTO)                        ' +
    ' ORDER BY LOTEPAGTO.NUMCHQBORDERO,LOTEPAGTO.NUMLOTE');

  SqlLotePagto.Open;
  CklLotes.Clear;
  CklLotes.Items.BeginUpdate;
  CdsLotePagto.First;
  While Not CdsLotePagto.Eof Do
  Begin
    CklLotes.Items.Add(CdsLotePagto.FieldByName('NUMCHQBORDERO').AsString + ' \ ' + CdsLotePagto.FieldByName('NUMLOTE').AsString);
    CdsLotePagto.Next;
  End;
  CklLotes.Items.EndUpdate;
  frmAguarde.Apaga;
  lckModulo.SetFocus;
End;

procedure TFrmRelAprovaDocs.FormCreate(Sender: TObject);
begin
  inherited;
  SqlModulo.Open;
  DlIni.Date := Date;
  DlFim.Date := Date;
end;

procedure TFrmRelAprovaDocs.bbtnConfirmarClick(Sender: TObject);
var
  sNumLotes: string;
  x: integer;
begin
  inherited;

  sNumLotes := '';
  for X := 0 to CklLotes.Items.Count - 1 do
    if CklLotes.Selected[x] then
      sNumLotes := sNumLotes + Copy(CklLotes.Items[x], Pos('\', CklLotes.Items[x]) + 2, Length(CklLotes.Items[x])) + ',';

  sNumLotes := Copy(sNumLotes, 1, Length(sNumLotes) - 1);
  if trim(sNumLotes) = '' then
  begin
    MsgDlg('Favor indicar os lotes para o relatório', 'Erro', mtError, [mbOK], 0);
    CklLotes.SetFocus;
    Exit;
  end;

  // Passagem de parametros
  Cmp_Padrao.ParamValues[0].AsString := sNumLotes;
end;

procedure TFrmRelAprovaDocs.LckModuloCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
    SelFaixaLotes;
end;

procedure TFrmRelAprovaDocs.DlIniExit(Sender: TObject);
begin
  inherited;
  SelFaixaLotes;
end;

procedure TFrmRelAprovaDocs.DlFimEnter(Sender: TObject);
begin
  inherited;
  SelFaixaLotes;
end;

procedure TFrmRelAprovaDocs.SbAdTodosClick(Sender: TObject);
var
  X: Integer;
begin
  inherited;
  case (Sender as TBitBtn).Tag of
    0: for X := 0 to CklLotes.Items.Count - 1 do
        CklLotes.Selected[X] := True;
    1: for X := 0 to CklLotes.Items.Count - 1 do
        CklLotes.Selected[X] := not CklLotes.Selected[X];
  end;
end;
end.

