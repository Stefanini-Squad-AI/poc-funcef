unit fLiberaVersao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMDialog, StdCtrls, wwdblook, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  ExtCtrls, DBCtrls, Db, Wwdatsrc, DBTables, Wwquery, FileCtrl, fAguarde,
  Spin, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, uString, IvDictio, IvMulti,
  IvEMulti, Mask, ZipMstr, CMBussinesObject, CMPendencia, ActnList, CmDock,
  Twofish, CMProcura, MontaSelect;


CONST
   DIRREPOSITORIOFONTES = '\\cmapl\VersaoCMPrev\FontesaCompilar\';

type
  TfrmLiberaVersao = class(TForm)
    qryModulo: TwwQuery;
    dsModulo: TwwDataSource;
    qryModuloNOMEPROJETO: TStringField;
    qryModuloVERSAO: TStringField;
    qryModuloCOPIAFONTES: TDateTimeField;
    qryModuloCOMPILADO: TStringField;
    updModulo: TUpdateSQL;
    ZipLibera: TZipMaster;
    dsListaPendencias: TwwDataSource;
    qListaPendencias: TwwQuery;
    qryModuloOLDVERSAO: TStringField;
    CMPendencia: TCMPendencia;
    qListaPendenciasIDPENDENCIA: TFloatField;
    qListaPendenciasTELAModulo: TStringField;
    qListaPendenciasPRAZOHORAS: TFloatField;
    qListaPendenciasDESCHISTPENDENCIA: TMemoField;
    qListaPendenciasSITUACAOPENDENCIA: TFloatField;
    qListaPendenciasRESUMODESC: TStringField;
    qListaPendenciasFLGTERMINADO: TFloatField;
    usListaPendencias: TUpdateSQL;
    qListaPendenciasDATAINICIOPREV: TDateTimeField;
    qListaPendenciasDATATERMINOPREV: TDateTimeField;
    qryModuloNOMEModulo: TStringField;
    qryModuloIDModulo: TFloatField;
    PnlFundo: TPanel;
    flArq: TFileListBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    reAlteraVer: TRichEdit;
    TabSheet2: TTabSheet;
    Splitter1: TSplitter;
    Panel2: TPanel;
    dbgPendencias: TwwDBGrid;
    Panel5: TPanel;
    Panel3: TPanel;
    DBMemo1: TDBMemo;
    Panel4: TPanel;
    TabSheet3: TTabSheet;
    reAlteraExiste: TRichEdit;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    edAtual: TEdit;
    edV1: TSpinEdit;
    edV2: TSpinEdit;
    edV3: TSpinEdit;
    edRelease: TMaskEdit;
    CMOkCancelar: TCMOkCancelar;
    QryPathFontes: TwwQuery;
    MsModulo: TMontaSelect;
    EdtModulo: TEdit;
    SpeedButton1: TSpeedButton;
    qryModuloDPL: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edV1Change(Sender: TObject);
    procedure ZipLiberaProgress(Sender: TObject; ProgrType: ProgressType;
      Filename: string; FileSize: Integer);
    procedure PageControl1Change(Sender: TObject);
    procedure qListaPendenciasUpdateRecord(DataSet: TDataSet;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure CMOkCancelarOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
  private
    strVerNumero,
      strVerData,
      strVerAltera: TStringList;
    sOldVersao: string;
    DirFonte: string;
    procedure CopiaModulo;
    function PegaAlteracao: string;
    function PegaNovaVersao: string;
    procedure AtuAltera;
    procedure IncluiLista(iInsert: Integer; sVersao: string);
    procedure GravanoFonte;
    procedure AtuPendencias;
  public
  end;
  
var
  frmLiberaVersao: TfrmLiberaVersao;
  
implementation

uses
  uMensErro, iniFiles, uDataBase, FSM_WinAPILib, uCMTypes;
{$R *.DFM}

procedure TfrmLiberaVersao.FormCreate(Sender: TObject);
begin
  inherited;
  qryModulo.Open;
  CMPendencia.SituacaoPendencia := spDesenvolvimento;
  CMPendencia.LoadFromDB( - 1);
  strVerNumero := TStringList.Create;
  strVerData := TStringList.Create;
  strVerAltera := TStringList.Create;
  edV1.Value := 3;
end;

procedure TfrmLiberaVersao.CopiaModulo;
var iDir: Integer;
  sVersao, sDirTemp: AnsiString;
  ListaArqOrigem   : TStringList;
  lFim             : Boolean;
  iPos, X          : Integer;
  sArqZCM          : string;
begin
  inherited;
  try
    ListaArqOrigem := TStringList.Create;
    sDirTemp := QryPathFontes.FieldByName('DIRFONTES').AsString;
    lFim := False;
    while not lFim do
    begin
      iPos := Pos(';', sDirTemp);
      if iPos > 0 then
      begin
        ListaArqOrigem.Add(Trim(Copy(sDirTemp, 1, iPos - 1)));
        sDirTemp := Copy(sDirTemp, iPos + 1, 2000);
      end
      else
      begin
        ListaArqOrigem.Add(Trim(sDirTemp));
        lFim := True;
      end;
    end;

    For X:= (ListaArqOrigem.Count - 1) DownTo 0 Do
       If Trim(ListaArqOrigem[x]) = '' Then ListaArqOrigem.Delete(x);

    frmAguarde.Mostra('Compactando arquivos...');
    frmAguarde.Pos := 0;
    for iDir := 0 to ListaArqOrigem.Count - 1 do
    begin
      ZipLibera.FSpecArgs.Add(ListaArqOrigem[iDir] + '\*.*');
    end;


    If FileExists(DIRREPOSITORIOFONTES + sArqZCM) Then
       DeleteFile(DIRREPOSITORIOFONTES + sArqZCM);

    sArqZCM := qryModulo.FieldByName('NomeModulo').AsString + '.zcm';
    ZipLibera.ZipFilename := DIRREPOSITORIOFONTES + sArqZCM;
    ZipLibera.Password := '8903pdfus&*{+)F94Tfgd1465_#*#$()';
    ZipLibera.Add;

    frmAguarde.Mostra('Atualizando Banco de dados...');
    sVersao := PegaNovaVersao;
    with qryModulo do
    begin
      Edit;
      FieldByName('VERSAO').Value := sVersao;
      FieldByName('COPIAFONTES').Value := Now;
      FieldByName('COMPILADO').Value := 'N';
      FieldByName('OLDVERSAO').Value := sOldVersao;

      Post;
      Database.ApplyUpdates([qryModulo]);

      if not qListaPendencias.IsEmpty then
      begin
        AplicaAlteracoes([qListaPendencias]);
        qListaPendencias.Close;
        qListaPendencias.Open;
      end;
    end;

    frmAguarde.Apaga;
    MsgDlg('Versão liberada com sucesso!', 'Liberação de versão', mtInformation,[mbOK], 0)
  Except
    frmAguarde.Apaga;
    Raise;
  end;
end;

function TfrmLiberaVersao.PegaAlteracao: string;
var ArqPrincipal: TextFile;
  sLinha, sVersao, sDataVer: string; 
  lAlt, lVer               : Boolean;
begin
  reAlteraExiste.Lines.Clear;
  strVerNumero.Clear;
  strVerData.Clear;
  strVerAltera.Clear;
  // Pega as Alterações já efetuadas no Módulo
  if FileExists(DirFonte + '\' + Trim(qryModulo.FieldByName('NOMEPROJETO').AsString) + '.dpr') then
    AssignFile(ArqPrincipal, DirFonte + '\' + Trim(qryModulo.FieldByName('NOMEPROJETO').AsString) + '.dpr')
  else
    AssignFile(ArqPrincipal, DirFonte + '\' + Trim(qryModulo.FieldByName('NOMEPROJETO').AsString) + '.dpk');
  
  lAlt := False;
  lVer := False;
  Reset(ArqPrincipal);
  repeat
    Readln(ArqPrincipal, sLinha);
    if Pos('CM$ALT', sLinha) > 0 then
      lAlt := not lAlt;
    if Pos('CM$VER', sLinha) > 0 then
    begin
      lVer := True;
      sVersao := Trim(Copy(sLinha, 12, 12));
      sDataVer := Trim(Copy(sLinha, 25, 10));
    end;
    if lAlt then
      reAlteraExiste.Lines.Add(sLinha);
    
    if (lVer) and
      (Pos('CM$', sLinha) = 0) and
      (Pos('=====', sLinha) = 0) and
      (Pos('-----', sLinha) = 0) then
    begin
      strVerNumero.Add(sVersao);
      strVerData.Add(sDataVer);
      strVerAltera.Add(sLinha);
    end;
    
  until EOF(ArqPrincipal);
  CloseFile(ArqPrincipal);
end;

procedure TfrmLiberaVersao.FormDestroy(Sender: TObject);
begin
  inherited;
  strVerNumero.Free;
  strVerData.Free;
  strVerAltera.Free;
end;

procedure TfrmLiberaVersao.edV1Change(Sender: TObject);
var sVersao: string;
  iAchou, iPos: Integer;
begin
  inherited;

  If Sender is TSpinEdit Then
  Begin
    Case  (Sender as TSpinEdit).Tag of
    1:
    Begin
      edV2.Value := 0;
      edV3.Value := 0;
    End;
    2:
      edV3.Value := 0;
    End;

  End;

  sVersao := PegaNovaVersao;
  TabSheet1.Caption := 'Alterações efetuadas na versão ' + sVersao;
  
  // Procura a alteracao
  reAlteraVer.Lines.Clear;
  iAchou := strVerNumero.IndexOf(sVersao);
  if iAchou >= 0 then
  begin
    iPos := iAchou;
    while (iPos < strVerNumero.Count) and (strVerNumero[iPos] = sVersao) do
    begin
      reAlteraVer.Lines.Add(strVerAltera[iPos]);
      Inc(iPos)
    end;
  end;
end;

procedure TfrmLiberaVersao.AtuAltera;
var sVersao: string;
  I   : Integer;
  lFim: Boolean;
begin
  sVersao := PegaNovaVersao;
  I := 0;
  lFim := False;
  // Atualiza as Listas
  while not lFim do
  begin
    if (I < strVerNumero.Count) and (sVersao >= strVerNumero[I]) then
    begin
      lFim := True;
      IncluiLista(I, sVersao);
    end
    else
    begin
      Inc(I);
      if (I >= strVerNumero.Count) then
      begin
        IncluiLista(strVerNumero.Count, sVersao);
        lFim := True;
      end;
    end;
  end;

  // Atualiza no Memo
  reAlteraExiste.Lines.Clear;
  reAlteraExiste.Lines.Add('{CM$ALT');
  reAlteraExiste.Lines.Add('================================================================================');
  reAlteraExiste.Lines.Add('Histórico de alterações efetuadas no módulo ' + qryModulo.FieldByName('NomeModulo').AsString);
  reAlteraExiste.Lines.Add('================================================================================');

  I := 0;
  while I < strVerNumero.Count do
  begin
    sVersao := strVerNumero[I];
    reAlteraExiste.Lines.Add(Espaco('CM$VER', 12) + Espaco(sVersao, 12) + strVerData[I]);
    reAlteraExiste.Lines.Add('--------------------------------------------------------------------------------');
    while (I < strVerNumero.Count) and (sVersao = strVerNumero[I]) do
    begin
      if strVerAltera[I] <> '' then
        reAlteraExiste.Lines.Add(strVerAltera[I]);
      Inc(I);
    end;
    reAlteraExiste.Lines.Add('================================================================================');

  end;
  reAlteraExiste.Lines.Add('CM$ALT}');

  // Grava no Fonte
  GravanoFonte;
 
end;

function TfrmLiberaVersao.PegaNovaVersao: string;
var sVersao, sTemp: string;
begin
  sVersao := IntToStr(edV1.Value) + '.';
  sTemp := IntToStr(edV2.Value);
  while Length(sTemp) < 2 do
    sTemp := '0' + sTemp;
  sVersao := sVersao + sTemp + '.';
  sTemp := IntToStr(edV3.Value);
  while Length(sTemp) < 2 do
    sTemp := '0' + sTemp;
  Result := sVersao + sTemp + Trim(edRelease.Text);
end;

procedure TfrmLiberaVersao.IncluiLista(iInsert: Integer; sVersao: string);
var J: Integer;
begin
  while (iInsert < strVerNumero.Count) and (sVersao = strVerNumero[iInsert]) do
  begin
    strVerNumero.Delete(iInsert);
    strVerData.Delete(iInsert);
    strVerAltera.Delete(iInsert);
  end;

  // Inserir alteração de versao
  for J := 0 to reAlteraVer.Lines.Count - 1 do
  begin
    strVerNumero.Insert(iInsert, sVersao);
    strVerData.Insert(iInsert, FormatDateTime('dd/mm/yyyy', Date));
    strVerAltera.Insert(iInsert, reAlteraVer.Lines[J]);
    Inc(iInsert);
  end;
end;

procedure TfrmLiberaVersao.GravanoFonte;
var ArqPrincipal: TextFile;
  sLinha       : string;     
  lAlt         : Boolean;    
  lstFonte     : TStringList;
  sArqFonte,
    sIni       : string;     
  I, iPosInsert: Integer;    
begin
  lstFonte := TStringList.Create;

  // Grava o número da versao
  if FileExists(DirFonte + '\fprincipal.pas') then
  begin
    sArqFonte := DirFonte + '\fprincipal.pas';
    sIni := '';
  end
  else
     if FileExists(DirFonte + '\' + Trim(qryModulo.FieldByName('NOMEPROJETO').AsString) + '.dpk') then
     begin
       sArqFonte := DirFonte + '\' + Trim(qryModulo.FieldByName('NOMEPROJETO').AsString) + '.dpk'; AssignFile(ArqPrincipal, sArqFonte);
       sIni := '// ';
     end
     else
       if (QryModuloDPL.AsInteger = 2) And FileExists(DirFonte + '\' + Trim(qryModulo.FieldByName('NOMEPROJETO').AsString) + '.dpr') then
       begin
         sArqFonte := DirFonte + '\' + Trim(qryModulo.FieldByName('NOMEPROJETO').AsString) + '.dpr'; AssignFile(ArqPrincipal, sArqFonte);
         sIni := '// ';
       end;

    
  AssignFile(ArqPrincipal, sArqFonte);
  Reset(ArqPrincipal);
  repeat
    Readln(ArqPrincipal, sLinha);
    lstFonte.Add(sLinha);
  until EOF(ArqPrincipal);
  CloseFile(ArqPrincipal);
  
  for I := 0 to lstFonte.Count - 1 do
  begin
    if Pos('SISTEMA.VERSAO', UpperCase(lstFonte[I])) > 0 then
    begin
      lstFonte[I] := sIni + '   Sistema.Versao := ''' + PegaNovaVersao + ''';';
      edAtual.Text := PegaNovaVersao;
    end;
  end;
  lstFonte.SaveToFile(sArqFonte);
  lstFonte.Clear;

  // Grava As Alterações
  if FileExists(DirFonte + '\' + Trim(qryModulo.FieldByName('NOMEPROJETO').AsString) + '.dpr') then
    sArqFonte := DirFonte + '\' + Trim(qryModulo.FieldByName('NOMEPROJETO').AsString) + '.dpr'
  else
    sArqFonte := DirFonte + '\' + Trim(qryModulo.FieldByName('NOMEPROJETO').AsString) + '.dpk';

  AssignFile(ArqPrincipal, sArqFonte);
  Reset(ArqPrincipal);
  repeat
    Readln(ArqPrincipal, sLinha);
    lstFonte.Add(sLinha);
  until EOF(ArqPrincipal);
  CloseFile(ArqPrincipal);

  lAlt := False;
  I := 0;
  while I < lstFonte.Count do
  begin
    if Pos('CM$ALT', lstFonte[I]) > 0 then
    begin
      lAlt := not lAlt;
      lstFonte.Delete(I);
    end
    else if lAlt then
      lstFonte.Delete(I)
    else
      Inc(I);
  end;

  // Acha o fim do código
  iPosInsert := 0;
  for I := 0 to lstFonte.Count - 1 do
  begin
    if Pos('END.', UpperCase(lstFonte[I])) > 0 then
      iPosInsert := I + 1;
  end;

  lstFonte.Insert(iPosInsert, '');
  lstFonte.Insert(iPosInsert, '');
  for I := 0 to reAlteraExiste.Lines.Count - 1 do
  begin
    lstFonte.Insert(iPosInsert, reAlteraExiste.Lines[I]);
    Inc(iPosInsert);
  end;
  lstFonte.SaveToFile(sArqFonte);
  reAlteraExiste.Lines.SaveToFile(DirFonte + '\' + qryModulo.FieldByName('NOMEPROJETO').AsString + '.ALT');
  lstFonte.Free;
end;
procedure TfrmLiberaVersao.ZipLiberaProgress(Sender: TObject;
    ProgrType: ProgressType; Filename: string; FileSize: Integer);
begin
  inherited;
  Application.ProcessMessages;
end;

procedure TfrmLiberaVersao.PageControl1Change(Sender: TObject);
begin
  inherited;
  if (trim(EdtModulo.Text) <> '') and (PageControl1.ActivePage = TabSheet2) then
    if not qListaPendencias.Active then qListaPendencias.Open;
end;

procedure TfrmLiberaVersao.AtuPendencias;
begin
  if not qListaPendencias.IsEmpty then
  begin
    qListaPendencias.First;
    while not qListaPendencias.EOF do
    begin
      if qListaPendenciasFLGTERMINADO.AsInteger = 1 then
      begin
        reAlteraVer.Lines.Add('- Resolução da Pendência Nº ' + qListaPendenciasIDPENDENCIA.AsString);
        reAlteraVer.Lines.Add('  > Tela\Opçao No Sistema: ' + qListaPendenciasTELAModulo.AsString);
        reAlteraVer.Lines.Add('  ' + qListaPendenciasDESCHISTPENDENCIA.AsString);
      end;
      qListaPendencias.Next;
    end;
  end;
end;

procedure TfrmLiberaVersao.qListaPendenciasUpdateRecord(DataSet: TDataSet;
    UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
  UpdateAction := uaApplied;
  if CMPendencia.LoadFromDB(DataSet.FieldByName('IDPENDENCIA').AsFloat) then
    CMPendencia.AlterarPendencia(taEncerrar,
    'Pendência encerrada através do SAD em ' + FormatDateTime('dd/mm/yyyy hh:nn', Now),
    PegaNovaVersao, '', '', '0',
    DataSet.FieldByName('DATAINICIOPREV').AsDateTime,
    DataSet.FieldByName('DATATERMINOPREV').AsDateTime);
end;

procedure TfrmLiberaVersao.CMOkCancelarOkClick(Sender: TObject);
begin
  If (trim(EdtModulo.Text) <> '') Then
  Begin
    ShowMessage('Atualize o número da versão antes de liberar!!!' + #10 + #13 +
                'Preencha as alterações efetuadas na nova versão!!!');
    if QryPathFontes.FieldByName('DIRFONTES').AsString = '' then
      MsgDlg('O caminho do diretório de fontes está vazio' + #10 + #13 + 'Atualize seu cadastro de módulos', 'Liberação de versão', mtWarning,[mbOK], 0)
    else
    begin
      If Not DirectoryExists(DIRREPOSITORIOFONTES) Then
         MsgDlg('O Caminho do repositório de fontes na rede não existe. Não é possível liberar as versões!', 'Liberação de versão', mtWarning,[mbOK], 0)
      Else
         if MsgDlg('Confirma liberação da versão ' + PegaNovaVersao + '?', 'Liberação de versão', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
         begin
           AtuPendencias;
           AtuAltera;
           CopiaModulo;
         end;
    end;
  End;
end;

procedure TfrmLiberaVersao.FormClose(Sender: TObject;
  var Action: TCloseAction);
  Procedure FechaConsultas(Qrys : Array of TwwQUery);
  Var
    i, x :Integer;
  Begin
    i := High(Qrys);
    For X:=0 To i - 1 Do
        With Qrys[x] Do
        Begin
           If Active Then Close;
           If CachedUpdates And UpdatesPending Then CancelUpdates;
           If Prepared Then Unprepare;
        End;
  End;
begin
  FechaConsultas([QryPathFontes,qryModulo,qListaPendencias]);
end;

procedure TfrmLiberaVersao.SpeedButton1Click(Sender: TObject);
var iPos, iPos2: Integer;
  sVer: string;
begin
  If MsModulo.Executar = MrOk Then
  Begin
      EdtModulo.Text := MsModulo.ValoresChave[1];

      If qryModulo.Active Then qryModulo.Close;
      qryModulo.Params[0].AsInteger := StrToIntDef(MsModulo.ValoresChave[0],-1);
      qryModulo.Open;

      sOldVersao := '';
      if qListaPendencias.Active then
      begin
        if qListaPendencias.UpdatesPending then qListaPendencias.CancelUpdates;
        qListaPendencias.Close;
      end;
      qListaPendencias.ParamByname('pIdModulo').AsFloat := qryModuloIDModulo.asfloat;

      If QryPathFontes.Active Then QryPathFontes.Close;
      If Not QryPathFontes.Prepared Then QryPathFontes.Prepare;
      QryPathFontes.Params[0].AsFloat := qryModuloIDModulo.asfloat;
      QryPathFontes.Open;


      iPos := Pos(';', QryPathFontes.FieldByName('DIRFONTES').AsString);
      if iPos = 0 then
        DirFonte := Trim(QryPathFontes.FieldByName('DIRFONTES').AsString)
      else
        DirFonte := Trim(Copy(QryPathFontes.FieldByName('DIRFONTES').AsString, 1, iPos - 1));

      if (FileExists(DirFonte + '\fprincipal.pas')) or
        (FileExists(DirFonte + '\' + Trim(qryModulo.FieldByName('NOMEPROJETO').AsString) + '.dpk')) or
        ((qryModuloDPL.AsInteger = 2) And (FileExists(DirFonte + '\' + Trim(qryModulo.FieldByName('NOMEPROJETO').AsString) + '.dpr'))) then
      begin
        sVer := qryModulo.FieldByName('VERSAO').AsString;
        if sVer <> '' then
        begin
          iPos := Pos('.', sVer);
          iPos2 := Pos('.', Copy(sVer, iPos, 50)) + iPos + 2;
          edV1.Value := StrToInt(Copy(sVer, 1, iPos - 1));
          edV2.Value := StrToInt(Copy(sVer, iPos + 1, iPos2 - iPos - 1));
          edV3.Value := StrToInt(Copy(sVer, iPos2 + 1, 2)) + 1;
          edRelease.Text := Copy(sVer, iPos2 + 3, 1);
          PegaAlteracao;
          edAtual.Text := sVer;
          sOldVersao := sVer;
        end;
      end
      else
        ShowMessage('Não encontrei os fontes do módulo ' + qryModulo.FieldByName('NomeModulo').AsString);
  End
  Else
    EdtModulo.Text := '';
end;

end.

