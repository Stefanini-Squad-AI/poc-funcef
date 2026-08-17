{----------------------------------------------------------------------------------------------------------------------------------
---------------------------------------- Histórico de Alterações ------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
Rotina......: prc_CriaArquivos
Nº SIG......: 100268
Data........: 03/06/2020
Responsável.: Fábio Sampaio
Descrição...: Inclusão das SubConsultas 5 e 6
-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------}

unit FExportaRelatorioMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBCtrls,
  Mask, wwdbedit, uCmSqlParams, uCtrlDataview, uCtrlGrupoUsu, wwdblook,
  Grids, Wwdbigrd, Wwdbgrid, ZipMstr, BfDialogs, BrowseFolder, uProcuraDir,FileCtrl;

type

  TAuxGrid = class(TStringGrid);
  TFrmExportaRelatorioMT = class(TFrmCadastroMT)
    btnExportar: TBitBtn;
    Panel1: TPanel;
    sbtnInserirRel: TToolbarButton97;
    sbtnExcluirRel: TToolbarButton97;
    gridListExpor: TStringGrid;
    CdsReports: TCMClientDataSet;
    ZipMaster1: TZipMaster;
    Dlg: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnInserirRelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbtnExcluirRelClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);


  private
    { Private declarations }
    wpos : integer;
    MemoInfoRelat : TMemo;
    Dataview: TCtrlDataview;
    DataviewAcesso: TCtrlGrupoUsu;
    ListaArquivos : TStringList;
    ListaMD5 : TStringList;
    sArquivoLogZip : string;
    procedure prc_CorrigeBotoes;
    procedure prc_AddList;
    procedure prc_Exporta(sDir : string);
    procedure prc_CriaArquivos(sDir : string);
    procedure prc_Limpa;

  public
  end;

var
  FrmExportaRelatorioMT: TFrmExportaRelatorioMT;

implementation

Uses uMensErro, dBasedados, uSistema, uMidasUtil, uModulo, uVerificaSQL,
     FDesenhoOutLookMT, uMD5;

{$R *.DFM}

procedure TFrmExportaRelatorioMT.FormCreate(Sender: TObject);
begin
  inherited;
  Dataview := TCtrlDataview.Create();
  Dataview.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                       Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
  DataviewAcesso := TCtrlGrupoUsu.Create();
  DataviewAcesso.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                             Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
  Dataview.Cds := Cds;

  MemoInfoRelat := TMemo.Create(self);
  MemoInfoRelat.visible := false ;
  MemoInfoRelat.Parent := Self;
  MemoInfoRelat.Clear;

  ListaArquivos := TStringList.Create;
  ListaMD5 := TStringList.Create;
end;

procedure TFrmExportaRelatorioMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(Dataview);
  FreeAndNil(DataviewAcesso);
  FreeAndNil(MemoInfoRelat);
  FreeAndNil(ListaMD5);
  FreeAndNil(ListaArquivos);

end;

procedure TFrmExportaRelatorioMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;

  If MontaSelect.RetornouValor Then
     prc_AddList;
end;

procedure TFrmExportaRelatorioMT.bbtnConfirmarClick(Sender: TObject);
var sDir : string;
options : TSelectDirOpts;
begin
   inherited;

   sArquivoLogZip := 'LOTE_RELATORIOS_' + FormatDateTime('DDMMYYYYHHMMSS',now) + '.zip';
   Dlg.InitialDir := GetCurrentDir;
   Dlg.FileName := sArquivoLogZip;
   Dlg.Title := 'Destino para Exportação';

   if Dlg.Execute then
      prc_Exporta(Dlg.FileName);

   prc_CorrigeBotoes;
end;

procedure TFrmExportaRelatorioMT.prc_CriaArquivos(sDir : string);
var
  sInsert, sArqC, sArqC1, sArqC2, sArqC3, sArqC4, sArqC5, sArqC6, sArqL, sArqI: string;
  iCount: integer;

  // Alterado por FHBS - 03/06/2020 - SIG100268
  procedure AdicionaValor(var pVariavel: String; pValor: String);
  begin
    if Trim(pVariavel) <> '' then
      pVariavel := pVariavel + ', ';

    pVariavel := pVariavel + pValor;
  end;
  // Fim - Alterado por FHBS - 03/06/2020 - SIG100268

  procedure prc_InsertDataview(sNameTag, sArq:string);
  var
      iCount: integer;
      sMergeSrc, sMergeInsF, sMergeInsV, sMergeUpd: string; // Alterado por FHBS - 03/06/2020 - SIG100268
  begin

    MemoInfoRelat.lines.Add(StringReplace(sNameTag,'#','#ID',[]) + '=' + cds.FieldByName('IDDATAVIEW').AsString); // Alterado por FHBS - 03/06/2020 - SIG100268
    MemoInfoRelat.lines.Add(sNameTag + '=' + cds.FieldByName('NAME').AsString);

    (** // Alterado por FHBS - 03/06/2020 - SIG100268
    MemoInfoRelat.Lines.Add(sNameTag + 'SQL= INSERT INTO CM.DATAVIEW( ') ;

    for iCount := 0 to (Cds.FieldCount -1) do
    begin
      sInsert := '';

      if ( not cds.Fields[iCount].IsNull ) and
         (cds.Fields[iCount].DisplayName <> 'TEMPLATE') and
         (cds.Fields[iCount].DisplayName <> 'TRGDTINCLUSAO') and
         (cds.Fields[iCount].DisplayName <> 'TRGUSERINCLUSAO') then
      begin
        if iCount > 0 then
          sInsert := ', ';

        sInsert := sInsert + cds.Fields[iCount].DisplayName;
        MemoInfoRelat.Lines.Add(sInsert);
      end;
    end;

    sInsert := ' ) ';
    MemoInfoRelat.Lines.Add(sInsert);

    MemoInfoRelat.Lines.Add(' VALUES ( ') ;
    // Alterado por FHBS - 03/06/2020 - SIG100268 **)

    // Alterado por FHBS - 03/06/2020 - SIG100268
    sMergeSrc := '';
    sMergeInsF := '';
    sMergeInsV := '';
    sMergeUpd := '';
    // Fim - Alterado por FHBS - 03/06/2020 - SIG100268

    for iCount := 0 to (Cds.FieldCount -1) do
    begin
      sInsert := '';

      if ( not cds.Fields[iCount].IsNull ) and
         (cds.Fields[iCount].DisplayName <> 'TEMPLATE') and
         (cds.Fields[iCount].DisplayName <> 'TRGDTINCLUSAO') and
         (cds.Fields[iCount].DisplayName <> 'TRGUSERINCLUSAO') then
      begin
        if iCount > 0 then
          sInsert := ', ';

        if (cds.Fields[iCount] is TstringField) or
           (cds.Fields[iCount] is TMemoField) or
           (cds.Fields[iCount] is TDateField) or
           (cds.Fields[iCount] is TDateTimeField) Then
        begin
          sInsert := sInsert + QuotedStr(cds.Fields[iCount].AsString);
          AdicionaValor(sMergeSrc, QuotedStr(cds.Fields[iCount].AsString) + ' AS ' + cds.Fields[iCount].DisplayName); // Alterado por FHBS - 03/06/2020 - SIG100268
        end
        else
        begin
          if cds.Fields[iCount].DisplayName = 'IDDATAVIEW' Then
          begin
            sInsert := sInsert + ' CM.SEQDATAVIEW.NEXTVAL ';
            AdicionaValor(sMergeSrc, cds.Fields[iCount].AsString + ' AS ' + cds.Fields[iCount].DisplayName); // Alterado por FHBS - 03/06/2020 - SIG100268
          end
          else
          begin
            sInsert := sInsert + cds.Fields[iCount].AsString;
            AdicionaValor(sMergeSrc, cds.Fields[iCount].AsString + ' AS ' + cds.Fields[iCount].DisplayName); // Alterado por FHBS - 03/06/2020 - SIG100268
          end;
        end;

        // Alterado por FHBS - 03/06/2020 - SIG100268
        AdicionaValor(sMergeInsF, 'C1.' + cds.Fields[iCount].DisplayName);

        if cds.Fields[iCount].DisplayName = 'IDDATAVIEW' then
          AdicionaValor(sMergeInsV, 'CM.SEQDATAVIEW.NEXTVAL')
        else
          AdicionaValor(sMergeInsV, 'C2.' + cds.Fields[iCount].DisplayName);

        if (cds.Fields[iCount].DisplayName <> 'IDDATAVIEW') and
           (cds.Fields[iCount].DisplayName <> 'ORIGEMCMDV') and
           (cds.Fields[iCount].DisplayName <> 'NAME') then
          AdicionaValor(sMergeUpd, 'C1.' + cds.Fields[iCount].DisplayName + ' = C2.' + cds.Fields[iCount].DisplayName);
        // Fim - Alterado por FHBS - 03/06/2020 - SIG100268

				(** // Alterado por FHBS - 03/06/2020 - SIG100268
        MemoInfoRelat.Lines.Add(sInsert);
        // Fim - Alterado por FHBS - 03/06/2020 - SIG100268 **)

      end;
    end;

    (** // Alterado por FHBS - 03/06/2020 - SIG100268
    sInsert := ' ) ';
    MemoInfoRelat.Lines.Add(sInsert);
    // Fim - Alterado por FHBS - 03/06/2020 - SIG100268 **)

    // Alterado por FHBS - 03/06/2020 - SIG100268
    MemoInfoRelat.Lines.Add(sNameTag + 'SQL= MERGE INTO CM.DATAVIEW C1 ');
    MemoInfoRelat.Lines.Add(' USING ( SELECT ' + sMergeSrc + ' FROM DUAL) C2');
    MemoInfoRelat.Lines.Add(' ON (C1.IDDATAVIEW = C2.IDDATAVIEW AND');
    MemoInfoRelat.Lines.Add('     C1.ORIGEMCMDV = C2.ORIGEMCMDV AND');
    MemoInfoRelat.Lines.Add('     C1.NAME = C2.NAME)');
    MemoInfoRelat.Lines.Add(' WHEN MATCHED THEN');
    MemoInfoRelat.Lines.Add('   UPDATE SET ' + sMergeUpd);
    MemoInfoRelat.Lines.Add(' WHEN NOT MATCHED THEN');
    MemoInfoRelat.Lines.Add('   INSERT (' + sMergeInsF + ')');
    MemoInfoRelat.Lines.Add('   VALUES (' + sMergeInsV + ')');
    // Fim - Alterado por FHBS - 03/06/2020 - SIG100268

    TBlobField(FrmExportaRelatorioMT.cds.FieldByName('TEMPLATE')).SaveToFile(sArq);

    if FileExists(sArq) then
      ListaArquivos.Add(sArq);

  end;

  procedure prc_InsertReports;
  var
    iCount: integer;
    sMergeSrc, sMergeInsF, sMergeInsV, sMergeUpd: string; // Alterado por FHBS - 03/06/2020 - SIG100268
  begin
    MemoInfoRelat.lines.Add('#IDREPORTS=' + CdsReports.fieldbyname('IDREPORTS').AsString); // Alterado por FHBS - 03/06/2020 - SIG100268
    MemoInfoRelat.lines.Add('#REPORTS=' + CdsReports.FieldByName('NAME').AsString);

    (** // Alterado por FHBS - 03/06/2020 - SIG100268
    MemoInfoRelat.Lines.Add('#REPORTSSQL= INSERT INTO CM.REPORTS( ') ;

    for iCount := 0 to (CdsReports.FieldCount -1) do
    begin
      sInsert := '';

      if (CdsReports.Fields[iCount].DisplayName <> 'TEMPLATE') and
         (CdsReports.Fields[iCount].DisplayName <> 'TRGDTINCLUSAO') and
         (CdsReports.Fields[iCount].DisplayName <> 'TRGUSERINCLUSAO') and
         ( not CdsReports.Fields[iCount].IsNull ) then
      begin
        if iCount > 0 then
          sInsert := ', ';

        sInsert := sInsert + CdsReports.Fields[iCount].DisplayName;

        MemoInfoRelat.Lines.Add(sInsert);
      end;
    end;

    sInsert := ' ) ';
    MemoInfoRelat.Lines.Add(sInsert);

    MemoInfoRelat.Lines.Add(' VALUES ( ') ;
    // Fim - Alterado por FHBS - 03/06/2020 - SIG100268 **)

    // Alterado por FHBS - 03/06/2020 - SIG100268
    sMergeSrc := '';
    sMergeInsF := '';
    sMergeInsV := '';
    sMergeUpd := '';
    // Fim - Alterado por FHBS - 03/06/2020 - SIG100268
    
    for iCount := 0 to (CdsReports.FieldCount -1) do
    begin
      sInsert := '';

      if (CdsReports.Fields[iCount].DisplayName <> 'TEMPLATE') and
         (CdsReports.Fields[iCount].DisplayName <> 'TRGDTINCLUSAO') and
         (CdsReports.Fields[iCount].DisplayName <> 'TRGUSERINCLUSAO') and
         ( not CdsReports.Fields[iCount].IsNull ) then
      begin
        if iCount > 0 then
          sInsert := ', ';

        if CdsReports.Fields[iCount] is TDateTimeField then
          sInsert := ', to_date( ';

        if (CdsReports.Fields[iCount] is TstringField) or
           (CdsReports.Fields[iCount] is TMemoField) or
           (CdsReports.Fields[iCount] is TDateField) or
           (CdsReports.Fields[iCount] is TDateTimeField) Then
            sInsert := sInsert + QuotedStr(CdsReports.Fields[iCount].AsString)
        else
        begin
          if CdsReports.Fields[iCount].DisplayName = 'IDREPORTS' Then
            sInsert := sInsert + 'CM.SEQREPORTS.NEXTVAL '
          else
          if CdsReports.Fields[iCount].DisplayName = 'IDDATAVIEW' Then
            sInsert := sInsert + '#IDDATAVIEW#'
          else
          if (CdsReports.Fields[iCount].DisplayName = 'IDSUBDATAVIEW1') and
             (CdsReports.FieldByName('IDSUBDATAVIEW1').AsString <> '-1') then
            sInsert := sInsert + '#IDSUBDATAVIEW1#'
          else
          if (CdsReports.Fields[iCount].DisplayName = 'IDSUBDATAVIEW2') and
             (CdsReports.FieldByName('IDSUBDATAVIEW2').AsString <> '-1') then
            sInsert := sInsert + '#IDSUBDATAVIEW2#'
          else
          if (CdsReports.Fields[iCount].DisplayName = 'IDSUBDATAVIEW3') and
             (CdsReports.FieldByName('IDSUBDATAVIEW3').AsString <> '-1') then
            sInsert := sInsert + '#IDSUBDATAVIEW3#'
          else
          if (CdsReports.Fields[iCount].DisplayName = 'IDSUBDATAVIEW4') and
             (CdsReports.FieldByName('IDSUBDATAVIEW4').AsString <> '-1') then
            sInsert := sInsert + '#IDSUBDATAVIEW4#'
          else
            sInsert := sInsert + CdsReports.Fields[iCount].AsString;

        end;

        if CdsReports.Fields[iCount] is TDateTimeField then
          sInsert := sInsert + ' , ' + QuotedStr('dd-mm-yyyy hh24:mi:ss') + ' ) ';

        // Alterado por FHBS - 03/06/2020 - SIG100268
        if CdsReports.Fields[iCount] is TDateTimeField then
          AdicionaValor(sMergeSrc, 'to_date( ' + QuotedStr(CdsReports.Fields[iCount].AsString) + ' , ' + QuotedStr('dd-mm-yyyy hh24:mi:ss') + ' ) ')
        else
        if (CdsReports.Fields[iCount] is TstringField) or
           (CdsReports.Fields[iCount] is TMemoField) or
           (CdsReports.Fields[iCount] is TDateField) Then
          AdicionaValor(sMergeSrc, QuotedStr(CdsReports.Fields[iCount].AsString) + ' AS ' + CdsReports.Fields[iCount].DisplayName)
        else
        if CdsReports.Fields[iCount].DisplayName = 'IDREPORTS' then
          AdicionaValor(sMergeSrc, CdsReports.Fields[iCount].AsString + ' AS ' + CdsReports.Fields[iCount].DisplayName)
        else
        if ((Pos('IDDATAVIEW', CdsReports.Fields[iCount].DisplayName) > 0) or
            (Pos('IDSUBDATAVIEW', CdsReports.Fields[iCount].DisplayName) > 0)) and
           (CdsReports.Fields[iCount].AsString <> '-1') and not (CdsReports.Fields[iCount].IsNull) then
          AdicionaValor(sMergeSrc, '#' + CdsReports.Fields[iCount].DisplayName + '# AS ' + CdsReports.Fields[iCount].DisplayName)
        else
          AdicionaValor(sMergeSrc, CdsReports.Fields[iCount].AsString + ' AS ' + CdsReports.Fields[iCount].DisplayName);

        AdicionaValor(sMergeInsF, 'C1.' + CdsReports.Fields[iCount].DisplayName);

        if CdsReports.Fields[iCount].DisplayName = 'IDREPORTS' then
          AdicionaValor(sMergeInsV, 'CM.SEQREPORTS.NEXTVAL')
        else
          AdicionaValor(sMergeInsV, 'C2.' + CdsReports.Fields[iCount].DisplayName);

        if (CdsReports.Fields[iCount].DisplayName <> 'IDREPORTS') and
           (CdsReports.Fields[iCount].DisplayName <> 'ORIGEMCM') and
           (CdsReports.Fields[iCount].DisplayName <> 'NAME') then
          AdicionaValor(sMergeUpd, 'C1.' + CdsReports.Fields[iCount].DisplayName + ' = C2.' + CdsReports.Fields[iCount].DisplayName);
        // Alterado por FHBS - 03/06/2020 - SIG100268

				(** // Alterado por FHBS - 03/06/2020 - SIG100268
        MemoInfoRelat.Lines.Add(sInsert);
        // Fim - Alterado por FHBS - 03/06/2020 - SIG100268 **)
      end;
    end;

	  (** // Alterado por FHBS - 03/06/2020 - SIG100268
    sInsert := ' ) ';
    MemoInfoRelat.Lines.Add(sInsert);
    // Fim - Alterado por FHBS - 03/06/2020 - SIG100268 **)

    // Alterado por FHBS - 03/06/2020 - SIG100268
    MemoInfoRelat.Lines.Add('#REPORTSSQL= MERGE INTO CM.REPORTS C1 ');
    MemoInfoRelat.Lines.Add(' USING ( SELECT ' + sMergeSrc + ' FROM DUAL) C2');
    MemoInfoRelat.Lines.Add(' ON (C1.IDREPORTS = C2.IDREPORTS AND');
    MemoInfoRelat.Lines.Add('     C1.ORIGEMCM = C2.ORIGEMCM AND');
    MemoInfoRelat.Lines.Add('     C1.NAME = C2.NAME)');
    MemoInfoRelat.Lines.Add(' WHEN MATCHED THEN');
    MemoInfoRelat.Lines.Add('   UPDATE SET ' + sMergeUpd);
    MemoInfoRelat.Lines.Add(' WHEN NOT MATCHED THEN');
    MemoInfoRelat.Lines.Add('   INSERT (' + sMergeInsF + ')');
    MemoInfoRelat.Lines.Add('   VALUES (' + sMergeInsV + ')');
    // Fim - Alterado por FHBS - 03/06/2020 - SIG100268

    TBlobField(FrmExportaRelatorioMT.CdsReports.FieldByName('TEMPLATE')).SaveToFile(sArqL);
  end;


begin
  MemoInfoRelat.Clear;

  sInsert  := '';
  iCount   := 0;
  sArqC    := sDir + '\Consulta_'  + StringReplace(UpperCase(CdsReports.FieldByName('NAME').asstring), ' ', '_', [rfReplaceAll, rfIgnoreCase]) + '.txt';
  sArqC1   := sDir + '\Consulta1_' + StringReplace(UpperCase(CdsReports.FieldByName('NAME').asstring), ' ', '_', [rfReplaceAll, rfIgnoreCase]) + '.txt';
  sArqC2   := sDir + '\Consulta2_' + StringReplace(UpperCase(CdsReports.FieldByName('NAME').asstring), ' ', '_', [rfReplaceAll, rfIgnoreCase]) + '.txt';
  sArqC3   := sDir + '\Consulta3_' + StringReplace(UpperCase(CdsReports.FieldByName('NAME').asstring), ' ', '_', [rfReplaceAll, rfIgnoreCase]) + '.txt';
  sArqC4   := sDir + '\Consulta4_' + StringReplace(UpperCase(CdsReports.FieldByName('NAME').asstring), ' ', '_', [rfReplaceAll, rfIgnoreCase]) + '.txt';
  // Alterado por FHBS - 03/06/2020 - SIG100268
  sArqC5   := sDir + '\Consulta5_' + StringReplace(UpperCase(CdsReports.FieldByName('NAME').asstring), ' ', '_', [rfReplaceAll, rfIgnoreCase]) + '.txt';
  sArqC6   := sDir + '\Consulta6_' + StringReplace(UpperCase(CdsReports.FieldByName('NAME').asstring), ' ', '_', [rfReplaceAll, rfIgnoreCase]) + '.txt';
  // Fim - Alterado por FHBS - 03/06/2020 - SIG100268
  sArqL    := sDir + '\Layout_'    + StringReplace(UpperCase(CdsReports.FieldByName('NAME').asstring), ' ', '_', [rfReplaceAll, rfIgnoreCase]) + '.txt';
  sArqI    := sDir + '\InfoRelat_' + StringReplace(UpperCase(CdsReports.FieldByName('NAME').asstring), ' ', '_', [rfReplaceAll, rfIgnoreCase]) + '.txt';

  if FileExists(sArqC) then
     DeleteFile(sArqC);

  if FileExists(sArqC1) then
     DeleteFile(sArqC1);

  if FileExists(sArqC2) then
     DeleteFile(sArqC2);

  if FileExists(sArqC3) then
     DeleteFile(sArqC3);

  if FileExists(sArqC4) then
     DeleteFile(sArqC4);

  // Alterado por FHBS - 03/06/2020 - SIG100268
  if FileExists(sArqC5) then
     DeleteFile(sArqC5);

  if FileExists(sArqC6) then
     DeleteFile(sArqC6);
  // Fim - Alterado por FHBS - 03/06/2020 - SIG100268

  if FileExists(sArqL) then
     DeleteFile(sArqL);

  if FileExists(sArqI) then
     DeleteFile(sArqI);

  MemoInfoRelat.lines.Add('#GRUPO=' + CdsReports.fieldbyname('IDGRUPORELATORIO').AsString);
  MemoInfoRelat.lines.Add('#MODULO=' + CdsReports.fieldbyname('IDMODULO').AsString);

  prc_InsertDataview('#DATAVIEW',sArqC);

  if (not CdsReports.FieldByName('IDSUBDATAVIEW1').IsNull) and // Alterado por FHBS - 03/06/2020 - SIG100268
     (CdsReports.FieldByName('IDSUBDATAVIEW1').AsString <> '-1') then
  begin
    Cds.Data := Dataview.ListaDataview(CdsReports.FieldByName('IDSUBDATAVIEW1').AsFloat,
                                       CdsReports.FieldByName('ORIGEMCMDV1').AsFloat);

    prc_InsertDataview('#SUBDATAVIEW1',sArqC1);
  end;

  if (not CdsReports.FieldByName('IDSUBDATAVIEW2').IsNull) and // Alterado por FHBS - 03/06/2020 - SIG100268
     (CdsReports.FieldByName('IDSUBDATAVIEW2').AsString <> '-1') then
  begin
    Cds.Data := Dataview.ListaDataview(CdsReports.FieldByName('IDSUBDATAVIEW2').AsFloat,
                                       CdsReports.FieldByName('ORIGEMCMDV2').AsFloat);

    prc_InsertDataview('#SUBDATAVIEW2',sArqC2);
  end;

  if (not CdsReports.FieldByName('IDSUBDATAVIEW3').IsNull) and // Alterado por FHBS - 03/06/2020 - SIG100268
     (CdsReports.FieldByName('IDSUBDATAVIEW3').AsString <> '-1') then
  begin
    Cds.Data := Dataview.ListaDataview(CdsReports.FieldByName('IDSUBDATAVIEW3').AsFloat,
                                       CdsReports.FieldByName('ORIGEMCMDV3').AsFloat);

    prc_InsertDataview('#SUBDATAVIEW3',sArqC3);
  end;

  if (not CdsReports.FieldByName('IDSUBDATAVIEW4').IsNull) and // Alterado por FHBS - 03/06/2020 - SIG100268
     (CdsReports.FieldByName('IDSUBDATAVIEW4').AsString <> '-1') then
  begin
    Cds.Data := Dataview.ListaDataview(CdsReports.FieldByName('IDSUBDATAVIEW4').AsFloat,
                                       CdsReports.FieldByName('ORIGEMCMDV4').AsFloat);

    prc_InsertDataview('#SUBDATAVIEW4',sArqC4);
  end;

  // Alterado por FHBS - 03/06/2020 - SIG100268
  if (not CdsReports.FieldByName('IDSUBDATAVIEW5').IsNull) and
     (CdsReports.FieldByName('IDSUBDATAVIEW5').AsString <> '-1') then
  begin
    Cds.Data := Dataview.ListaDataview(CdsReports.FieldByName('IDSUBDATAVIEW5').AsFloat,
                                       CdsReports.FieldByName('ORIGEMCMDV5').AsFloat);

    prc_InsertDataview('#SUBDATAVIEW5',sArqC5);
  end;

  if (not CdsReports.FieldByName('IDSUBDATAVIEW6').IsNull) and 
     (CdsReports.FieldByName('IDSUBDATAVIEW6').AsString <> '-1') then
  begin
    Cds.Data := Dataview.ListaDataview(CdsReports.FieldByName('IDSUBDATAVIEW6').AsFloat,
                                       CdsReports.FieldByName('ORIGEMCMDV6').AsFloat);

    prc_InsertDataview('#SUBDATAVIEW6',sArqC6);
  end;
  // Fim - Alterado por FHBS - 03/06/2020 - SIG100268

  prc_InsertReports;

  MemoInfoRelat.Lines.SaveToFile(sArqI);

  if FileExists(sArqC) then
     ListaArquivos.Add(sArqC);


  if FileExists(sArqC2) then
     ListaArquivos.Add(sArqC2);

  if FileExists(sArqC3) then
     ListaArquivos.Add(sArqC3);

  if FileExists(sArqC4) then
     ListaArquivos.Add(sArqC4);

  // Alterado por FHBS - 03/06/2020 - SIG100268
  if FileExists(sArqC5) then
     ListaArquivos.Add(sArqC5);

  if FileExists(sArqC6) then
     ListaArquivos.Add(sArqC6);
  // Fim - Alterado por FHBS - 03/06/2020 - SIG100268

  if FileExists(sArqL) then
     ListaArquivos.Add(sArqL);

  if FileExists(sArqI) then
     ListaArquivos.Add(sArqI);

end;

procedure TFrmExportaRelatorioMT.sbtnInserirRelClick(Sender: TObject);
begin
  inherited;
  FrmExportaRelatorioMT.sbtnProcurarClick(Sender);
  prc_corrigebotoes;
end;

procedure TFrmExportaRelatorioMT.FormActivate(Sender: TObject);
begin
  inherited;

  wpos := 0;
  gridListExpor.ColCount := 3;
  gridListExpor.Cells[0,0]:='Codigo';
  gridListExpor.Cells[1,0]:='Relatorio';
  gridListExpor.Cells[2,0]:='Consulta';

  prc_corrigebotoes;

end;


procedure TFrmExportaRelatorioMT.prc_AddList;
var wcont :integer;
begin

  for wcont := 1 to gridListExpor.RowCount do
  begin
    if gridListExpor.Cells[0,wcont] = MontaSelect.ValoresChave[ 0 ] then
    begin
         ShowMessage('Relatorio ja esta na lista!');
         exit;
    end;
  end;

  inc(wpos);
  gridListExpor.Cells[0,wpos] := MontaSelect.ValoresChave[ 0 ];
  gridListExpor.Cells[1,wpos] := MontaSelect.ValoresChave[ 1 ];
  gridListExpor.Cells[2,wpos] := MontaSelect.ValoresChave[ 3 ];

  gridListExpor.RowCount := wpos + 1;
  gridListExpor.Row := wpos;
end;

procedure TFrmExportaRelatorioMT.sbtnExcluirRelClick(Sender: TObject);
begin
  inherited;
  TAuxGrid(gridListExpor).DeleteRow(gridListExpor.Row);

  if wpos > 0 then
    wpos := wpos - 1;

  prc_corrigebotoes;
end;

procedure TFrmExportaRelatorioMT.prc_corrigebotoes;
begin

  sbtnInserirRel.Down := False;
  sbtnExcluirRel.Down := False;
  bbtnCancelar.Enabled := True;
  pnlFundo.Enabled := True;
  Toolbar971.Visible := False;

  if wpos >= 1 Then
    btnExportar.Enabled := True
  else
    btnExportar.Enabled := False;
end;

procedure TFrmExportaRelatorioMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  prc_Limpa;
  prc_corrigebotoes;
end;

procedure TFrmExportaRelatorioMT.prc_exporta(sDir : string);
var wcont : integer;
    sMD5 : string;
begin

  sDir := StringReplace(sDir,'\' + sArquivoLogZip, '', [rfReplaceAll, rfIgnoreCase]);

  bbtnCancelar.Enabled := False;
  bbtnConfirmar.Enabled := False;

  ListaArquivos.Clear;
  ListaMD5.Clear;

  if FileExists(sArquivoLogZip) then
     DeleteFile(sArquivoLogZip);

  for wcont := 1 to gridListExpor.RowCount - 1 do
  begin
      gridListExpor.Row := wcont;
      Application.ProcessMessages;

      CdsReports.Data := Dataview.ListaReports(StrToFloat(gridListExpor.Cells[0,wcont]));
      Cds.Data := Dataview.ListaDataview(CdsReports.FieldByName('IDDATAVIEW').AsFloat,
                                         CdsReports.FieldByName('ORIGEMCMDV').AsFloat);
      prc_CriaArquivos(sDir);
  end;

  for wcont := 0 to ListaArquivos.Count - 1 do
  begin
    ZipMaster1.FSpecArgs.Add(ListaArquivos[wcont]);
    sMD5 := StringReplace(ListaArquivos[wcont], sDir + '\', '', [rfReplaceAll, rfIgnoreCase]) + ' - ' + uMD5.MD5Print(MD5File(ListaArquivos[wcont]));
    ListaMD5.Add(sMD5);
  end;

  ListaMD5.SaveToFile(sDir + '\MD5');
  ZipMaster1.FSpecArgs.Add(sDir + '\MD5');

  ZipMaster1.ZipFileName := sArquivoLogZip;
  ZipMaster1.Add;

  Sleep(100);

  for wcont := 0 to ListaArquivos.Count - 1 do
  begin
    if FileExists(ListaArquivos[wcont]) then
       DeleteFile(ListaArquivos[wcont]);
  end;

  if FileExists(sDir + '\MD5') then
     DeleteFile(sDir + '\MD5');

  ShowMessage('Relatório(s) exportado(s) com êxito ' + sArquivoLogZip );

  prc_Limpa;
  prc_CorrigeBotoes;
end;

procedure TFrmExportaRelatorioMT.prc_Limpa;
var wcont : integer;
begin
  ListaArquivos.Clear;
  ListaMD5.Clear;
  MemoInfoRelat.Clear;
  wpos := 0;

  for wcont:= 1 to gridListExpor.RowCount -1 do
  begin
    gridListExpor.Rows[wcont].Clear;
  end;
  gridListExpor.RowCount := 2;
end;

end.




