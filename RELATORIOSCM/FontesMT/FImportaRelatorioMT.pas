{----------------------------------------------------------------------------------------------------------------------------------
---------------------------------------- Histórico de Alterações ------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
Rotina......: TReports, FormCreate, fct_LeituraArquivos, fct_Validacao, fct_Import 
Nº SIG......: 100268
Data........: 03/06/2020
Responsável.: Fábio Sampaio
Descrição...: Inclusão das SubConsultas 5 e 6 e Alteração para possibilitar a atualização do relatório
-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------}

unit FImportaRelatorioMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBCtrls,
  Mask, wwdbedit, uCmSqlParams, uCtrlDataview, uCtrlGrupoUsu, wwdblook,
  Grids, Wwdbigrd, Wwdbgrid, ZipMstr, BfDialogs, BrowseFolder, uProcuraDir,FileCtrl,
  FCadastroCS, DBTables, Wwquery,uDataBase,uCmControlObject,uCtrlReportsRelCM,DBaseDados, USistema,
  Provider;

type

  TDataview = class
    Nome,
    Sql        : String;
    IdDataview : Integer;
    Template   : TMemoryStream;
    Update     : Boolean; // Alterado por FHBS - 03/06/2020 - SIG100268

    private

    public
      Constructor Create;
      Destructor  Destroy; Override;
  end;

  TReports = class
    Nome         ,
    Sql          ,
    IdReports    ,
    Grupo        ,
    Modulo       : String;
    Template     : TMemoryStream;
    Dataview     : TDataview;
    SubDataview1 : TDataview;
    SubDataview2 : TDataview;
    SubDataview3 : TDataview;
    SubDataview4 : TDataview;
    SubDataview5 : TDataview; // Alterado por FHBS - 03/06/2020 - SIG100268
    SubDataview6 : TDataview; // Alterado por FHBS - 03/06/2020 - SIG100268
    Acao         : Byte;      // Alterado por FHBS - 03/06/2020 - SIG100268 ( 0 - Ignorar, 1 - Incluir, 2 - Atualizar)

    private

    public
      Constructor Create;
      Destructor  Destroy; Override;
  end;

  TfrmImportarRelatorioMT = class(TfrmCadastroMT)
    gridList: TStringGrid;
    dlgArq: TOpenDialog;
    edtArq: TEdit;
    btnImport: TBitBtn;
    ZipMaster1: TZipMaster;
    qryDataView: TwwQuery;
    cdsDataView: TClientDataSet;
    dspDataView: TDataSetProvider;
    qryReports: TwwQuery;
    cdsReports: TClientDataSet;
    dspReports: TDataSetProvider;
    procedure btnImportClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    wpos : integer;
    sDirTmp : string;

    ListaArquivos : TStringList;
    ListaMD5 : TStringList;
    Relatorio: TCtrlReportsRelCM;

    Reports : TReports;
    ListRepor : TList;

    procedure prc_CorrigeBotoes;
    procedure prc_ListarDiretorio(sDiretorio: string; Sub:Boolean);
    procedure prc_Limpa;
    procedure prc_ApagaDir(sDir : string; bSub: boolean);
    procedure prc_CarregaRelatorios;
    procedure prc_CarregaGrid;

    function  fct_DescompArquivo:Boolean;
    function  TemAtributo(Attr, Val: Integer): Boolean;
    function  fct_ValidaLote(sDir:string):Boolean;
    function  fct_ValidaMD5(sDir,sArq :string):Boolean;
    function  fct_LeituraArquivos(sArq :string) : Boolean;
    function  fct_Validacao : Boolean;
    function  fct_Import: Boolean;
  end;

var
  frmImportarRelatorioMT: TfrmImportarRelatorioMT;

implementation

uses uMD5;
{$R *.DFM}

{ TfrmImportarRelatorioMT }

procedure TfrmImportarRelatorioMT.prc_CorrigeBotoes;
begin
  bbtnCancelar.Enabled := True;
  pnlFundo.Enabled := True;
  Toolbar971.Visible := False;
  btnImport.Enabled := True;

  if wpos >= 1 then
    bbtnConfirmar.Enabled := True
  else
    bbtnConfirmar.Enabled := False;

end;

procedure TfrmImportarRelatorioMT.btnImportClick(Sender: TObject);
begin
  inherited;

  if wpos > 0 then exit;

  dlgArq.DefaultExt := '.zip';
  dlgArq.InitialDir := GetCurrentDir;
  dlgArq.Title := 'Arquivo para Importação';

  if dlgArq.Execute then
     edtArq.Text := dlgArq.FileName;

  if (edtArq.Text <> '') and
     (FileExists(edtArq.Text)) then
  begin
    if pos('.ZIP',UpperCase(edtArq.Text)) = 0 then
    begin
       ShowMessage('Arquivo Invalido');
       Exit;
    end;

    Application.ProcessMessages;

    if not fct_DescompArquivo then
    begin
      prc_Limpa;
      exit;
    end;

    prc_CarregaRelatorios;

    prc_CarregaGrid;

    if fct_Validacao then
    begin
      bbtnConfirmar.Enabled := True;
      btnImport.Enabled := False;
    end
    else
    begin
      bbtnConfirmar.Enabled := False;
      btnImport.Enabled := True;
      prc_Limpa;
    end;
  end;
end;

procedure TfrmImportarRelatorioMT.FormCreate(Sender: TObject);
begin
  inherited;

  Relatorio := TCtrlReportsRelCM.Create;
  Relatorio.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                        Sistema.ConnectionSide, Sistema.AppRemoteServer, True );

  Relatorio.cds := cds;

  ListaArquivos := TStringList.Create;
  ListaMD5      := TStringList.Create;
  ListRepor := TList.Create;

  wpos := 0;

  sdirtmp := 'C:\Planus\Temp';

  if not DirectoryExists(sdirtmp) then
     ForceDirectories(sdirtmp);

  gridList.Cells[0,0]:= 'Relatorio';
  gridList.Cells[1,0]:= 'Ação'; // Alterado por FHBS - 03/06/2020 - SIG100268


end;

procedure TfrmImportarRelatorioMT.FormActivate(Sender: TObject);
begin
  inherited;
  prc_CorrigeBotoes;
end;

procedure TfrmImportarRelatorioMT.prc_ListarDiretorio(sDiretorio: string;
  Sub: Boolean);
var
  F: TSearchRec;
  Ret: Integer;
  TempNome: string;
begin

  Ret := FindFirst(sDiretorio+ '\*.*', faAnyFile, F);
  try
    while Ret = 0 do
      begin
        if TemAtributo(F.Attr, faDirectory) then
          begin
            if (F.Name <> '.') And (F.Name <> '..') then
              if Sub = True then
                begin
                  TempNome := sDiretorio+'\' + F.Name;
                  prc_ListarDiretorio(TempNome, True);
                end;
          end
        else
          begin
            if pos('.TXT', UpperCase(F.Name)) <> 0 then
              ListaArquivos.Add(F.Name);
          end;
        Ret := FindNext(F);
      end;
  finally
    begin
      FindClose(F);
    end;
  end;
end;

function TfrmImportarRelatorioMT.TemAtributo(Attr, Val: Integer): Boolean;
begin
  Result := Attr and Val = Val;
end;

procedure TfrmImportarRelatorioMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(ListaArquivos);
  FreeAndNil(ListaMD5);
  FreeAndNil(Relatorio);

  FreeAndNil(ListRepor);

  if DirectoryExists(sDirTmp) then
  begin
    prc_ApagaDir(sDirTmp,True);
    RemoveDirectory(pchar(sDirTmp));
  end;
end;

procedure TfrmImportarRelatorioMT.prc_Limpa;
var wcont : integer;
begin

  ListaArquivos.Clear;
  ListaMD5.Clear;

  for wcont := 0 to ListRepor.Count - 1 do
    TReports(ListRepor[wcont]).Free;

  ListRepor.Clear;

  wpos := 0;
  edtArq.Clear;

  for wcont:= 1 to gridList.RowCount -1 do
    gridList.Rows[wcont].Clear;

  gridList.RowCount := 2;

  prc_ApagaDir(sDirTmp,True);

  prc_CorrigeBotoes;

end;

procedure TfrmImportarRelatorioMT.prc_CarregaGrid;
var wcont : integer;
begin

  for wcont := 0 to ListRepor.Count - 1 do
  begin
    Application.ProcessMessages;
    inc(wpos);
    gridList.Cells[0,wpos] := TReports(ListRepor[wcont]).Nome;
    gridList.RowCount := wpos + 1;
    gridList.Row := wpos;
  end;

end;

function TfrmImportarRelatorioMT.fct_ValidaMD5(sDir,sArq: string): Boolean;
var wcont : integer;
    smd5 : string;
begin
  Result := False;

  for wcont := 0 to ListaMD5.Count - 1 do
  begin

    if pos(sArq,ListaMD5[wcont]) <> 0 then
    begin
       smd5 :=  copy(ListaMD5[wcont],
                     pos(' - ',ListaMD5[wcont]) + 3 ,
                     length(ListaMD5[wcont]) - pos(' - ',ListaMD5[wcont]) + 1);

       if uMD5.MD5Print(MD5File(sDir + '\' +sArq)) = smd5 then
          Result := True;
    end;

    if Result then
       Break;
  end;
end;

function TfrmImportarRelatorioMT.fct_ValidaLote(sDir: string): Boolean;
var wcont : integer;
begin
  Result := True;

  for wcont := 0 to ListaArquivos.Count - 1 do
  begin

    if not fct_ValidaMD5(sDirTmp,ListaArquivos[wcont]) then
      Result := False;

    if not Result then
       Break;
  end;

  if not Result then
  begin
    ShowMessage('Arquivo Corrompido');
    Exit;
  end;
end;

procedure TfrmImportarRelatorioMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  prc_Limpa;
end;

procedure TfrmImportarRelatorioMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  if fct_Import then
    ShowMessage('Arquivos importados com êxito');

  bbtnCancelarClick(Sender);
end;

procedure TfrmImportarRelatorioMT.prc_apagadir(sDir : string; bSub: boolean);
var
  F: TSearchRec;
  Ret: Integer;
  TempNome: string;
begin

  Ret := FindFirst(sDir + '\*.*', faAnyFile, F);
  try
    while Ret = 0 do
    begin
      if TemAtributo(F.Attr, faDirectory) then
      begin
        if (F.Name <> '.') And (F.Name <> '..') then
          if bSub = True then
          begin
            TempNome := sDir +'\' + F.Name;
            prc_ApagaDir(TempNome, True);
          end;
      end
      else
        DeleteFile(sDir + '\' + F.Name);

      Ret := FindNext(F);
    end;

  finally
    FindClose(F);
  end;
end;

procedure TfrmImportarRelatorioMT.prc_CarregaRelatorios;
var wcont : Integer;
begin

  for wcont := 0 to ListaArquivos.Count - 1 do
  begin
    Application.ProcessMessages;

    if pos('INFORELAT',UpperCase(ListaArquivos[wcont])) <> 0 then
    begin
      if not fct_LeituraArquivos(sDirTmp + '\' + ListaArquivos[wcont]) then
         break;
    end;
  end;
end;

function TfrmImportarRelatorioMT.fct_LeituraArquivos(sArq: string): Boolean;
var tArq : TextFile;
    sLinha, sSQL,sArqAux : string;
begin

  try
    Reports := TReports.Create;

    AssignFile(tArq,sArq);

    Reset(tArq);

    while (not eof(tArq)) do
    begin
      sLinha := '';

      readln(tArq, sLinha);

     if (copy(sLinha,1,1) = '#') then
     begin
        // Alterado por FHBS - 03/06/2020 - SIG100268
        if pos('#IDREPORTS=',UpperCase(sSQL)) <> 0 then
          Reports.IdReports := StringReplace(sSQL, '#IDREPORTS=', '', [rfReplaceAll, rfIgnoreCase])
        else
        // Fim - Alterado por FHBS - 03/06/2020 - SIG100268
        if pos('#GRUPO=',UpperCase(sSQL)) <> 0 then
          Reports.Grupo := StringReplace(sSQL, '#GRUPO=', '', [rfReplaceAll, rfIgnoreCase])
        else
        if pos('#MODULO=',UpperCase(sSQL)) <> 0 then
          Reports.Modulo := StringReplace(sSQL, '#MODULO=', '', [rfReplaceAll, rfIgnoreCase])
        else

        if pos('#DATAVIEW=',UpperCase(sSQL)) <> 0 then
          Reports.Dataview.Nome := StringReplace(sSQL, '#DATAVIEW=', '', [rfReplaceAll, rfIgnoreCase])
        else
        if pos('#SUBDATAVIEW1=',UpperCase(sSQL)) <> 0 then
          Reports.SubDataview1.Nome := StringReplace(sSQL, '#SUBDATAVIEW1=', '', [rfReplaceAll, rfIgnoreCase])
        else
        if pos('#SUBDATAVIEW2=',UpperCase(sSQL)) <> 0 then
          Reports.SubDataview2.Nome := StringReplace(sSQL, '#SUBDATAVIEW2=', '', [rfReplaceAll, rfIgnoreCase])
        else
        if pos('#SUBDATAVIEW3=',UpperCase(sSQL)) <> 0 then
          Reports.SubDataview3.Nome := StringReplace(sSQL, '#SUBDATAVIEW3=', '', [rfReplaceAll, rfIgnoreCase])
        else
        if pos('#SUBDATAVIEW4=',UpperCase(sSQL)) <> 0 then
          Reports.SubDataview4.Nome := StringReplace(sSQL, '#SUBDATAVIEW4=', '', [rfReplaceAll, rfIgnoreCase])
        else
        // Alterado por FHBS - 03/06/2020 - SIG100268
        if pos('#SUBDATAVIEW5=',UpperCase(sSQL)) <> 0 then
          Reports.SubDataview5.Nome := StringReplace(sSQL, '#SUBDATAVIEW5=', '', [rfReplaceAll, rfIgnoreCase])
        else
        if pos('#SUBDATAVIEW6=',UpperCase(sSQL)) <> 0 then
          Reports.SubDataview6.Nome := StringReplace(sSQL, '#SUBDATAVIEW6=', '', [rfReplaceAll, rfIgnoreCase])
        else

        if pos('#IDDATAVIEW=',UpperCase(sSQL)) <> 0 then
          Reports.Dataview.IdDataview := StrToIntDef(StringReplace(sSQL, '#IDDATAVIEW=', '', [rfReplaceAll, rfIgnoreCase]), 0)
        else
        if pos('#IDSUBDATAVIEW1=',UpperCase(sSQL)) <> 0 then
          Reports.SubDataview1.IdDataview := StrToIntDef(StringReplace(sSQL, '#IDSUBDATAVIEW1=', '', [rfReplaceAll, rfIgnoreCase]), 0)
        else
        if pos('#IDSUBDATAVIEW2=',UpperCase(sSQL)) <> 0 then
          Reports.SubDataview2.IdDataview := StrToIntDef(StringReplace(sSQL, '#IDSUBDATAVIEW2=', '', [rfReplaceAll, rfIgnoreCase]), 0)
        else
        if pos('#IDSUBDATAVIEW3=',UpperCase(sSQL)) <> 0 then
          Reports.SubDataview3.IdDataview := StrToIntDef(StringReplace(sSQL, '#IDSUBDATAVIEW3=', '', [rfReplaceAll, rfIgnoreCase]), 0)
        else
        if pos('#IDSUBDATAVIEW4=',UpperCase(sSQL)) <> 0 then
          Reports.SubDataview4.IdDataview := StrToIntDef(StringReplace(sSQL, '#IDSUBDATAVIEW4=', '', [rfReplaceAll, rfIgnoreCase]), 0)
        else
        if pos('#IDSUBDATAVIEW5=',UpperCase(sSQL)) <> 0 then
          Reports.SubDataview5.IdDataview := StrToIntDef(StringReplace(sSQL, '#IDSUBDATAVIEW5=', '', [rfReplaceAll, rfIgnoreCase]), 0)
        else
        if pos('#IDSUBDATAVIEW6=',UpperCase(sSQL)) <> 0 then
          Reports.SubDataview6.IdDataview := StrToIntDef(StringReplace(sSQL, '#IDSUBDATAVIEW6=', '', [rfReplaceAll, rfIgnoreCase]), 0)
        else
        // Fim - Alterado por FHBS - 03/06/2020 - SIG100268

        if pos('#REPORTS=',UpperCase(sSQL)) <> 0 then
          Reports.Nome := StringReplace(sSQL, '#REPORTS=', '', [rfReplaceAll, rfIgnoreCase])
        else

        if pos('#DATAVIEWSQL=',UpperCase(sSQL)) <> 0 then
            Reports.Dataview.Sql := StringReplace(sSQL, '#DATAVIEWSQL=', '', [rfReplaceAll, rfIgnoreCase])
        else
        if pos('#SUBDATAVIEW1SQL=',UpperCase(sSQL)) <> 0 then
            Reports.SubDataview1.Sql := StringReplace(sSQL, '#SUBDATAVIEW1SQL=', '', [rfReplaceAll, rfIgnoreCase])
        else
        if pos('#SUBDATAVIEW2SQL=',UpperCase(sSQL)) <> 0 then
            Reports.SubDataview2.Sql := StringReplace(sSQL, '#SUBDATAVIEW2SQL=', '', [rfReplaceAll, rfIgnoreCase])
        else
        if pos('#SUBDATAVIEW3SQL=',UpperCase(sSQL)) <> 0 then
          Reports.SubDataview3.Sql := StringReplace(sSQL, '#SUBDATAVIEW3SQL=', '', [rfReplaceAll, rfIgnoreCase])
        else
        if pos('#SUBDATAVIEW4SQL=',UpperCase(sSQL)) <> 0 then
          Reports.SubDataview4.Sql := StringReplace(sSQL, '#SUBDATAVIEW4SQL=', '', [rfReplaceAll, rfIgnoreCase])
        // Alterado por FHBS - 03/06/2020 - SIG100268
        else
        if pos('#SUBDATAVIEW5SQL=',UpperCase(sSQL)) <> 0 then
          Reports.SubDataview5.Sql := StringReplace(sSQL, '#SUBDATAVIEW5SQL=', '', [rfReplaceAll, rfIgnoreCase])
        else
        if pos('#SUBDATAVIEW6SQL=',UpperCase(sSQL)) <> 0 then
          Reports.SubDataview6.Sql := StringReplace(sSQL, '#SUBDATAVIEW6SQL=', '', [rfReplaceAll, rfIgnoreCase]);
        // Fim - Alterado por FHBS - 03/06/2020 - SIG100268

        sSQL := sLinha;
     end
     else
       sSQL := sSQL + sLinha;
    end;

    if pos('#REPORTSSQL=',UpperCase(sSQL)) <> 0 then
      Reports.Sql := StringReplace(sSQL, '#REPORTSSQL=', '', [rfReplaceAll, rfIgnoreCase])

  except

    Result := False;
  end;

  CloseFile(tArq);

  if Reports.Dataview.Nome <> '' then
  begin
    sArqAux := StringReplace(sArq , 'InfoRelat_', 'Consulta_', [rfReplaceAll, rfIgnoreCase]);

    if FileExists(sArqAux) then
      Reports.Dataview.Template.LoadFromFile(sArqAux);
  end;

  if Reports.SubDataview1.Nome <> '' then
  begin
    sArqAux := StringReplace(sArq , 'InfoRelat_', 'Consulta1_', [rfReplaceAll, rfIgnoreCase]);

    if FileExists(sArqAux) then
      Reports.SubDataview1.Template.LoadFromFile(sArqAux);
  end;

  if Reports.SubDataview2.Nome <> '' then
  begin
    sArqAux := StringReplace(sArq , 'InfoRelat_', 'Consulta2_', [rfReplaceAll, rfIgnoreCase]);

    if FileExists(sArqAux) then
      Reports.SubDataview2.Template.LoadFromFile(sArqAux);
  end;

  if Reports.SubDataview3.Nome <> '' then
  begin
    sArqAux := StringReplace(sArq , 'InfoRelat_', 'Consulta3_', [rfReplaceAll, rfIgnoreCase]);

    if FileExists(sArqAux) then
      Reports.SubDataview3.Template.LoadFromFile(sArqAux);
  end;

  if Reports.SubDataview4.Nome <> '' then
  begin
    sArqAux := StringReplace(sArq , 'InfoRelat_', 'Consulta4_', [rfReplaceAll, rfIgnoreCase]);

    if FileExists(sArqAux) then
      Reports.SubDataview4.Template.LoadFromFile(sArqAux);
  end;

  // Alterado por FHBS - 03/06/2020 - SIG100268
  if Reports.SubDataview5.Nome <> '' then
  begin
    sArqAux := StringReplace(sArq , 'InfoRelat_', 'Consulta5_', [rfReplaceAll, rfIgnoreCase]);

    if FileExists(sArqAux) then
      Reports.SubDataview5.Template.LoadFromFile(sArqAux);
  end;

  if Reports.SubDataview6.Nome <> '' then
  begin
    sArqAux := StringReplace(sArq , 'InfoRelat_', 'Consulta6_', [rfReplaceAll, rfIgnoreCase]);

    if FileExists(sArqAux) then
      Reports.SubDataview6.Template.LoadFromFile(sArqAux);
  end;
  // Fim - Alterado por FHBS - 03/06/2020 - SIG100268

  sArqAux := StringReplace(sArq , 'InfoRelat_', 'Layout_', [rfReplaceAll, rfIgnoreCase]);

  if FileExists(sArqAux) then
    Reports.Template.LoadFromFile(sArqAux);

  ListRepor.Add(Reports);

  Result := True;
end;

function TfrmImportarRelatorioMT.fct_Validacao: Boolean;
var qrySql :TwwQuery;
    wcont : integer;
begin

  Result := True;

  qrySql := TwwQuery.create(Application);
  qrySql.DataBaseName := 'BaseDados';

  for wcont := 0 to ListRepor.Count - 1 do
  begin

    gridList.Row := wcont + 1 ;
    Application.ProcessMessages;

    qrySql.Close;
    qrySql.SQL.Text := 'Select NAME ' +
                       'From REPORTS ' +
                       'Where NAME = ' + QuotedStr(TReports(ListRepor[wcont]).Nome) +
                       ' and IDGRUPORELATORIO = ' + TReports(ListRepor[wcont]).Grupo +
                       ' and IDMODULO = ' + TReports(ListRepor[wcont]).Modulo;
    qrySql.Open;


    // Alterado por FHBS - 03/06/2020 - SIG100268
    // 0 - Ignorar, 1 - Incluir, 2 - Atualizar
    TReports(ListRepor[wcont]).Acao := 1;

    if not qrySql.IsEmpty then
    begin
      // Alterado por FHBS - 03/06/2020 - SIG100268
      //Result := False;
      //ShowMessage('Já existe um relatório chamado ' + TReports(ListRepor[wcont]).Nome + ' no sistema');

      if (MessageBox(0, PChar('Já existe um relatório chamado ' + TReports(ListRepor[wcont]).Nome +
          ' no sistema.Deseja atualizá-lo?'),
          'Atenção', MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2) = idYes) then
        TReports(ListRepor[wcont]).Acao := 2
      else
        TReports(ListRepor[wcont]).Acao := 0;
      // Fim - Alterado por FHBS - 03/06/2020 - SIG100268
    end;

    // Alterado por FHBS - 03/06/2020 - SIG100268
    if TReports(ListRepor[wcont]).Acao = 0 then
      gridList.Cells[1, gridList.Row] := 'Ignorar'
    else
    if TReports(ListRepor[wcont]).Acao = 2 then
      gridList.Cells[1, gridList.Row] := 'Atualizar'
    else
      gridList.Cells[1, gridList.Row] := 'Criar';
    // Fim - Alterado por FHBS - 03/06/2020 - SIG100268

  end;

  FreeAndNil(qrySql);

end;

function TfrmImportarRelatorioMT.fct_Import: Boolean;
var wcont  : integer;
    qrySql :TwwQuery;
begin

  qrySql := TwwQuery.create(Application);
  qrySql.DataBaseName := 'BaseDados';

  for wcont := 0 to ListRepor.Count - 1 do
  if (TReports(ListRepor[wcont]).Acao > 0) then // Alterado por FHBS - 03/06/2020 - SIG100268 - Diferente de IGNORAR
  begin

    gridList.Row := wcont + 1 ;
    Application.ProcessMessages;

    StartTransacao;

    qrySql.close;
    qrySql.SQL.Text := TReports(ListRepor[wcont]).Dataview.Sql;
    qrySql.Prepare;
    qrySql.ExecSQL;

    CommitTransacao;

    qryDataView.Close;
    qryDataView.ParamByName('pNome').asstring := TReports(ListRepor[wcont]).Dataview.Nome;
    qryDataView.Open;

    if qryDataView.IsEmpty then
    begin
      Result := False;
      RollBackTransacao;
      FreeAndNil(qrySql);
      Exit;
    end;

    TReports(ListRepor[wcont]).Dataview.IdDataview := qryDataView.FieldByName('IDDATAVIEW').AsInteger;

    TReports(ListRepor[wcont]).Sql := StringReplace(TReports(ListRepor[wcont]).Sql,
                                                    '#IDDATAVIEW#',
                                                    IntToStr(TReports(ListRepor[wcont]).Dataview.IdDataview),
                                                    [rfReplaceAll, rfIgnoreCase]);

    qryDataView.Edit;
    TBlobField(qryDataView.FieldByName('TEMPLATE' )).LoadFromStream(TReports(ListRepor[wcont]).Dataview.Template);
    qryDataView.Post;
    qryDataView.ApplyUpdates;

    if TReports(ListRepor[wcont]).SubDataview1.Nome <> '' then
    begin
      StartTransacao;

      qrySql.close;
      qrySql.SQL.Text := TReports(ListRepor[wcont]).SubDataview1.Sql;
      qrySql.Prepare;
      qrySql.ExecSQL;

      CommitTransacao;

      qryDataView.Close;
      qryDataView.ParamByName('pNome').asstring := TReports(ListRepor[wcont]).SubDataview1.Nome;
      qryDataView.Open;

      if qryDataView.IsEmpty then
      begin
        Result := False;
        RollBackTransacao;
        FreeAndNil(qrySql);
        Exit;
      end;

      TReports(ListRepor[wcont]).SubDataview1.IdDataview := qryDataView.FieldByName('IDDATAVIEW').AsInteger;

      TReports(ListRepor[wcont]).Sql := StringReplace(TReports(ListRepor[wcont]).Sql,
                                                      '#IDSUBDATAVIEW1#',
                                                      IntToStr(TReports(ListRepor[wcont]).SubDataview1.IdDataview),
                                                      [rfReplaceAll, rfIgnoreCase]);

      qryDataView.Edit;
      TBlobField(qryDataView.FieldByName('TEMPLATE' )).LoadFromStream(TReports(ListRepor[wcont]).SubDataview1.Template);
      qryDataView.Post;
      qryDataView.ApplyUpdates;

    end;

    if TReports(ListRepor[wcont]).SubDataview2.Nome <> '' then
    begin
      StartTransacao;

      qrySql.close;
      qrySql.SQL.Text := TReports(ListRepor[wcont]).SubDataview2.Sql;
      qrySql.Prepare;
      qrySql.ExecSQL;

      CommitTransacao;

      qryDataView.Close;
      qryDataView.ParamByName('pNome').asstring := TReports(ListRepor[wcont]).SubDataview2.Nome;
      qryDataView.Open;

      if qryDataView.IsEmpty then
      begin
        Result := False;
        RollBackTransacao;
        FreeAndNil(qrySql);
        Exit;
      end;

      TReports(ListRepor[wcont]).SubDataview2.IdDataview := qryDataView.FieldByName('IDDATAVIEW').AsInteger;

      TReports(ListRepor[wcont]).Sql := StringReplace(TReports(ListRepor[wcont]).Sql,
                                                      '#IDSUBDATAVIEW2#',
                                                      IntToStr(TReports(ListRepor[wcont]).SubDataview2.IdDataview),
                                                      [rfReplaceAll, rfIgnoreCase]);


      qryDataView.Edit;
      TBlobField(qryDataView.FieldByName('TEMPLATE')).LoadFromStream(TReports(ListRepor[wcont]).SubDataview2.Template);
      qryDataView.Post;
      qryDataView.ApplyUpdates;

    end;

    if TReports(ListRepor[wcont]).SubDataview3.Nome <> '' then
    begin
      StartTransacao;

      qrySql.close;
      qrySql.SQL.Text := TReports(ListRepor[wcont]).SubDataview3.Sql;
      qrySql.Prepare;
      qrySql.ExecSQL;

      CommitTransacao;

      qryDataView.Close;
      qryDataView.ParamByName('pNome').asstring := TReports(ListRepor[wcont]).SubDataview3.Nome;
      qryDataView.Open;

      if qryDataView.IsEmpty then
      begin
        Result := False;
        RollBackTransacao;
        FreeAndNil(qrySql);
        Exit;
      end;

      TReports(ListRepor[wcont]).SubDataview3.IdDataview := qryDataView.FieldByName('IDDATAVIEW').AsInteger;

      TReports(ListRepor[wcont]).Sql := StringReplace(TReports(ListRepor[wcont]).Sql,
                                                      '#IDSUBDATAVIEW3#',
                                                      IntToStr(TReports(ListRepor[wcont]).SubDataview3.IdDataview),
                                                      [rfReplaceAll, rfIgnoreCase]);

      qryDataView.Edit;
      TBlobField(qryDataView.FieldByName('TEMPLATE' )).LoadFromStream(TReports(ListRepor[wcont]).SubDataview3.Template);
      qryDataView.Post;
      qryDataView.ApplyUpdates;

    end;

    if TReports(ListRepor[wcont]).SubDataview4.Nome <> '' then
    begin
      StartTransacao;

      qrySql.close;
      qrySql.SQL.Text := TReports(ListRepor[wcont]).SubDataview4.Sql;
      qrySql.Prepare;
      qrySql.ExecSQL;

      CommitTransacao;

      qryDataView.Close;
      qryDataView.ParamByName('pNome').asstring := TReports(ListRepor[wcont]).SubDataview4.Nome;
      qryDataView.Open;

      if qryDataView.IsEmpty then
      begin
        Result := False;
        RollBackTransacao;
        FreeAndNil(qrySql);
        Exit;
      end;

      TReports(ListRepor[wcont]).SubDataview4.IdDataview := qryDataView.FieldByName('IDDATAVIEW').AsInteger;

      TReports(ListRepor[wcont]).Sql := StringReplace(TReports(ListRepor[wcont]).Sql,
                                                      '#IDSUBDATAVIEW4#',
                                                      IntToStr(TReports(ListRepor[wcont]).SubDataview4.IdDataview),
                                                      [rfReplaceAll, rfIgnoreCase]);

      qryDataView.Edit;
      TBlobField(qryDataView.FieldByName('TEMPLATE' )).LoadFromStream(TReports(ListRepor[wcont]).SubDataview4.Template);
      qryDataView.Post;
      qryDataView.ApplyUpdates;
    end;

    // Alterado por FHBS - 03/06/2020 - SIG100268
    if TReports(ListRepor[wcont]).SubDataview5.Nome <> '' then
    begin
      StartTransacao;

      qrySql.close;
      qrySql.SQL.Text := TReports(ListRepor[wcont]).SubDataview5.Sql;
      qrySql.Prepare;
      qrySql.ExecSQL;

      CommitTransacao;

      qryDataView.Close;
      qryDataView.ParamByName('pNome').asstring := TReports(ListRepor[wcont]).SubDataview5.Nome;
      qryDataView.Open;

      if qryDataView.IsEmpty then
      begin
        Result := False;
        RollBackTransacao;
        FreeAndNil(qrySql);
        Exit;
      end;

      TReports(ListRepor[wcont]).SubDataview5.IdDataview := qryDataView.FieldByName('IDDATAVIEW').AsInteger;

      TReports(ListRepor[wcont]).Sql := StringReplace(TReports(ListRepor[wcont]).Sql,
                                                      '#IDSUBDATAVIEW5#',
                                                      IntToStr(TReports(ListRepor[wcont]).SubDataview5.IdDataview),
                                                      [rfReplaceAll, rfIgnoreCase]);

      qryDataView.Edit;
      TBlobField(qryDataView.FieldByName('TEMPLATE' )).LoadFromStream(TReports(ListRepor[wcont]).SubDataview5.Template);
      qryDataView.Post;
      qryDataView.ApplyUpdates;
    end;

    if TReports(ListRepor[wcont]).SubDataview6.Nome <> '' then
    begin
      StartTransacao;

      qrySql.close;
      qrySql.SQL.Text := TReports(ListRepor[wcont]).SubDataview6.Sql;
      qrySql.Prepare;
      qrySql.ExecSQL;

      CommitTransacao;

      qryDataView.Close;
      qryDataView.ParamByName('pNome').asstring := TReports(ListRepor[wcont]).SubDataview6.Nome;
      qryDataView.Open;

      if qryDataView.IsEmpty then
      begin
        Result := False;
        RollBackTransacao;
        FreeAndNil(qrySql);
        Exit;
      end;

      TReports(ListRepor[wcont]).SubDataview6.IdDataview := qryDataView.FieldByName('IDDATAVIEW').AsInteger;

      TReports(ListRepor[wcont]).Sql := StringReplace(TReports(ListRepor[wcont]).Sql,
                                                      '#IDSUBDATAVIEW6#',
                                                      IntToStr(TReports(ListRepor[wcont]).SubDataview6.IdDataview),
                                                      [rfReplaceAll, rfIgnoreCase]);

      qryDataView.Edit;
      TBlobField(qryDataView.FieldByName('TEMPLATE' )).LoadFromStream(TReports(ListRepor[wcont]).SubDataview6.Template);
      qryDataView.Post;
      qryDataView.ApplyUpdates;
    end;
    // Fim - Alterado por FHBS - 03/06/2020 - SIG100268

    StartTransacao;

    qrySql.close;
    qrySql.SQL.Text := TReports(ListRepor[wcont]).Sql;
    qrySql.Prepare;
    qrySql.ExecSQL;

    CommitTransacao;

    qryReports.Close;
    qryReports.ParamByName('pNome').asstring := TReports(ListRepor[wcont]).Nome;
    qryReports.Open;

    if qryReports.IsEmpty then
    begin
      Result := False;
      RollBackTransacao;
      FreeAndNil(qrySql);
      Exit;
    end;

    qryReports.Edit;
    TBlobField(qryReports.FieldByName('TEMPLATE' )).LoadFromStream(TReports(ListRepor[wcont]).Template);
    qryReports.Post;
    qryReports.ApplyUpdates;

  end;

  Result := True;
  FreeAndNil(qrySql);
end;

function TfrmImportarRelatorioMT.fct_DescompArquivo: Boolean;
begin

  Result := False;

  prc_ApagaDir(sDirTmp,True);

  CopyFile(pchar(edtArq.text),pchar(sdirtmp + '\Arq.zip'), True);
  Sleep(100);

  ZipMaster1.ZipFileName := sDirTmp + '\Arq.zip';
  ZipMaster1.FSpecArgs.Clear;
  ZipMaster1.FSpecArgs.Add('*.*');
  ZipMaster1.ExtrBaseDir := sDirTmp;
  ZipMaster1.Extract;

  Sleep(400);

  Application.ProcessMessages;

  if FileExists(sDirTmp + '\Arq.zip') then
     DeleteFile(sDirTmp + '\Arq.zip');

  if not FileExists(sDirTmp + '\MD5') then
  begin
    ShowMessage('Arquivo Corrompido');
    prc_Limpa;
    Result := False;
    Exit;
  end;

  ListaMD5.LoadFromFile(sDirTmp + '\MD5');

  if FileExists(sDirTmp + '\MD5') then
     DeleteFile(sDirTmp + '\MD5');

  prc_ListarDiretorio(sDirTmp,False);

  if not fct_ValidaLote(sDirTmp) then
  begin
    prc_Limpa;
    Result := False;
    Exit;
  end;

  Result := True;
end;

{ TDataview }

constructor TDataview.Create;
begin
  Template := TMemoryStream.Create;
end;

destructor TDataview.Destroy;
begin
  inherited;
  FreeAndNil(Template);
end;

{ TReports }

constructor TReports.Create;
begin
  inherited;

  Template     := TMemoryStream.Create;
  Dataview     := TDataview.Create;
  SubDataview1 := TDataview.Create;
  SubDataview2 := TDataview.Create;
  SubDataview3 := TDataview.Create;
  SubDataview4 := TDataview.Create;
  SubDataview5 := TDataview.Create; // Alterado por FHBS - 03/06/2020 - SIG100268
  SubDataview6 := TDataview.Create; // Alterado por FHBS - 03/06/2020 - SIG100268
end;

destructor TReports.Destroy;
begin
  inherited;

  FreeAndNil(Template);
  FreeAndNil(Dataview);
  FreeAndNil(SubDataview1);
  FreeAndNil(SubDataview2);
  FreeAndNil(SubDataview3);
  FreeAndNil(SubDataview4);
  FreeAndNil(SubDataview5); // Alterado por FHBS - 03/06/2020 - SIG100268
  FreeAndNil(SubDataview6); // Alterado por FHBS - 03/06/2020 - SIG100268

end;

end.
