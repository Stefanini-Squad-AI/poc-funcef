{-------------------------------------------------------------------------------
Desenvolvedor: Marcus Oliveira
Data         : 31/01/2007
Pendência    : 24363
Descrição    : Removido o owner CM. 
-------------------------------------------------------------------------------}
{-------------------------------------------------------------------------------
Desenvolvedor: Alex Pereira
Data         : 14/04/04
Pendência    : 14761
Descrição    : Utilizar a CMIntBancoMT50 ao invés da CMIntBanco50
               com ajuda do Tavares
-------------------------------------------------------------------------------}
(*******************************************************************************
 18/04/2000 - 2.19.04
   Implementação da Tela
 28/04/2000 - 02.20.01
   - Alteração do arquivo de saída gerado, gravando o número da
     A.P. em vez do número do documento;
   - Correção da tela de log do arquivo de saída;
   - Otimização da consultas de exportação;
   - Correção do rateio R do arquivo de saída.  O número do
     documento aumentou para 10 posições e alteração
     do número do documento para o número da A. P.
 04/05/2000 - 02.20.04
   - Alteração das Colunas Código do Centro de Custo e Código Do Centro de Responsabilidade
     para suas respectivas descrições
 15/05/200 - Alterações Funcef
   ALteração na gravação do arquivo de saída: Exclusão de quebras de linha do campo observação;
 *******************************************************************************)

unit FExpLanctoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, Db, DBTables, Wwquery, FileCtrl,
  Wwdatsrc, wwdblook, BfDialogs, UCtrlParamINtegra,
  BrowseFolder, wwdbdatetimepicker, CMDateTimePicker, ExtCtrls, uProcuraDir,
  DBClient, uCMClientDataSet, uCmSqlParams, uCtrlDocumento, uCtrlPadroes,
// início André Tavares - pendência 15366 - 21/05/2004
  uctrlParamGlobal, uctrlCentRespon;
// fim André Tavares - pendência 15366 - 21/05/2004


type
  TFrmExpLanctoMT = class(TfrmOkCancelar)
    Panel1: TPanel;
    MemLog: TMemo;
    EdtFile: TEdit;
    Label1: TLabel;
    BtnFile: TSpeedButton;
    Label2: TLabel;
    DtLancIni: TCMDateTimePicker;
    DtLancFin: TCMDateTimePicker;
    DirDlg: TProcuraDirDlg;
    lblCentroRespon: TLabel;
    dblcCentroRespon: TwwDBLookupCombo;
    sqlDocs: TCMSqlParams;
    sqlDocsParcelados: TCMSqlParams;
    sqlCentroRespon: TCMSqlParams;
    sqlRateioDocs: TCMSqlParams;
    sqlRateioParc: TCMSqlParams;
    sqlAlteraParc: TCMSqlParams;
    sqlAlteraDocs: TCMSqlParams;
    sqlAlteraParcOrigem: TCMSqlParams;
    cdsDocs: TCMClientDataSet;
    cdsDocsParcelados: TCMClientDataSet;
    cdsCentroRespon: TCMClientDataSet;
    cdsRateioDocs: TCMClientDataSet;
    cdsRateioParc: TCMClientDataSet;
    cdsAlteraParc: TCMClientDataSet;
    cdsAlteraDocs: TCMClientDataSet;
    cdsAlteraParcOrigem: TCMClientDataSet;
    cdsRateioParcCODCENTRORESPON: TStringField;
    cdsRateioParcNODOCUMENTO: TFloatField;
    cdsRateioParcCODCENTROCUSTO: TStringField;
    cdsRateioParcVALOR: TFloatField;
    cdsRateioParcCODTIPRECDES: TStringField;
    cdsDocsCODDOCUMENTO: TFloatField;
    cdsDocsCODCENTRORESPON: TStringField;
    cdsDocsNODOCUMENTO: TFloatField;
    cdsDocsREFERENCIA: TStringField;
    cdsDocsDATAVENCTO: TDateTimeField;
    cdsDocsDATAPROGRAMADA: TDateTimeField;
    cdsDocsDATALANCTO: TDateTimeField;
    cdsDocsRAZAOSOCIAL: TStringField;
    cdsDocsNUMDOCUMENTO: TStringField;
    cdsDocsVALOR: TFloatField;
    cdsDocsVALORALTERACRES: TFloatField;
    cdsDocsVALORALTERDECRES: TFloatField;
    cdsDocsVALORALTERIRRF: TFloatField;
    cdsDocsVALORSALDO: TFloatField;
    cdsDocsHISTORICOCOMPL: TStringField;
    cdsDocsCODFORMA: TFloatField;
    cdsDocsNUMBANCO: TStringField;
    cdsDocsNOMEBANCO: TStringField;
    cdsDocsNUMAGENCIA: TStringField;
    cdsDocsNOMEAGENCIA: TStringField;
    cdsDocsCONTACORRENTE: TStringField;
    cdsDocsDESCRICAO: TStringField;
    cdsDocsOBS: TMemoField;
    cdsDocsParceladosCODDOCUMENTO: TFloatField;
    cdsDocsParceladosNOMECR: TStringField;
    cdsDocsParceladosNODOCUMENTO: TFloatField;
    cdsDocsParceladosREFERENCIA: TStringField;
    cdsDocsParceladosDATAVENCTO: TDateTimeField;
    cdsDocsParceladosDATAPROGRAMADA: TDateTimeField;
    cdsDocsParceladosDATALANCTO: TDateTimeField;
    cdsDocsParceladosRAZAOSOCIAL: TStringField;
    cdsDocsParceladosNUMDOCUMENTO: TStringField;
    cdsDocsParceladosVALOR: TFloatField;
    cdsDocsParceladosVALORALTERACRES: TFloatField;
    cdsDocsParceladosVALORALTERDECRES: TFloatField;
    cdsDocsParceladosVALORALTERIRRF: TFloatField;
    cdsDocsParceladosVALORSALDO: TFloatField;
    cdsDocsParceladosHISTORICOCOMPL: TStringField;
    cdsDocsParceladosCODFORMA: TFloatField;
    cdsDocsParceladosNUMBANCO: TStringField;
    cdsDocsParceladosNOMEBANCO: TStringField;
    cdsDocsParceladosNUMAGENCIA: TStringField;
    cdsDocsParceladosNOMEAGENCIA: TStringField;
    cdsDocsParceladosCONTACORRENTE: TStringField;
    cdsDocsParceladosDESCRICAO: TStringField;
    cdsDocsParceladosOBS: TMemoField;
    cdsDocsParceladosNUMFATURA: TFloatField;
    cdsCentroResponCODCENTRORESPON: TStringField;
    cdsCentroResponNOME: TStringField;
    cdsCentroResponANALITICOSINTET: TStringField;
    cdsCentroResponCODCENTROCUSTO: TStringField;
    cdsRateioDocsCODCENTRORESPON: TStringField;
    cdsRateioDocsNODOCUMENTO: TFloatField;
    cdsRateioDocsCODCENTROCUSTO: TStringField;
    cdsRateioDocsVALOR: TFloatField;
    cdsRateioDocsCODTIPRECDES: TStringField;
    cdsCentroResponCODEXTERNO: TStringField;
    procedure sqlDocsCalcFields(DataSet: TDataSet);
    procedure sqlDocsParceladosCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnFileClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    CtrlDocumento : TCtrlDocumento;

// início André Tavares - pendência 15366 - 21/05/2004
    _ctrlCentroRespon : TctrlCentRespon;
// fim André Tavares - pendência 15366 - 21/05/2004

    _sqldocs,
    _sqldocsparcelados: string;
    Function AbreQry:Boolean;
    Procedure ShowStatus(sStatus :String);
    Function LimpaStr(S:String):String;
  public
    { Public declarations }
  end;

var
  FrmExpLanctoMT: TFrmExpLanctoMT;

implementation

Uses uMensErro, ustring, uFuncaoGeral,
  DDadosBancarios,uModulo,udatabase ,usistema;

{$R *.DFM}

Function TFrmExpLanctoMT.AbreQry:Boolean;
Begin
  ShowStatus( 'Verificando Documentos Lançados Efetivos ' );
  With sqlDocs Do
  Begin
     sql.text := _sqldocs;

     If Not Prepared Then Prepare;
     If (trim(dblcCentroRespon.text)<>'')  then
         sql.Insert(48,'rtrim(RD.CODCENTRORESPON) =  '+#39+trim(dblcCentroRespon.lookupvalue)+#39+' and');
     prepare;
     ParamByname('DATAINI').AsString := DtLancIni.Text;
     ParamByname('DATAFIN').AsString := DtLancFin.Text;
     Open;
  End;

  ShowStatus( 'Verificando Documentos Agrupados\Parcelados' );
  With sqlDocsParcelados Do
  Begin

     sql.text := _sqldocsparcelados;
     If Not Prepared Then Prepare;
          If (trim(dblcCentroRespon.text)<>'')  then
         sql.Insert(50,'  rtrim(CR.CODCENTRORESPON) =  '+#39+trim(dblcCentroRespon.lookupvalue)+#39+' and');

     prepare;
     ParamByname('DATAINI').AsString := DtLancIni.Text;
     ParamByname('DATAFIN').AsString := DtLancFin.Text;
     Open;
  End;

  Result := (Not CdsDocs.IsEmpty) Or (Not CdsDocsParcelados.IsEmpty) ;
End;

Procedure TFrmExpLanctoMT.ShowStatus(sStatus :String);
Begin
  If Trim(sStatus) <> '' Then
     MemLog.Lines.Add(DateTimeToStr(Now) + ' ' + sStatus )
  Else
     MemLog.Lines.Add('');
  Application.ProcessMessages;
End;


procedure TFrmExpLanctoMT.sqlDocsCalcFields(DataSet: TDataSet);
Var
  rSaldo, rSaldoOM :Real;
begin
  inherited;

  sqlAlteraDocs.Prepare;
  sqlAlteraDocs.ParamByName('CODDOCUMENTO').AsFloat := CdsDocs.FieldByName('CODDOCUMENTO').AsFloat;
  sqlAlteraDocs.Open;

  CtrlDocumento.Saldo.CalculaSaldo( CdsDocs.FieldByName('CODDOCUMENTO').AsInteger );
  rSaldo := CtrlDocumento.Saldo.Valor;
  
  CdsDocs.FieldByName('VALORSALDO').AsFloat := rSaldo;

  CdsDocs.FieldByName('VALORALTERACRES').AsFloat  := cdsAlteraDocs.FieldByName('VALACRE').AsFloat;
  CdsDocs.FieldByName('VALORALTERDECRES').AsFloat := cdsAlteraDocs.FieldByName('VALDECR').AsFloat;
  CdsDocs.FieldByName('VALORALTERIRRF').AsFloat   := cdsAlteraDocs.FieldByName('VALIMP').AsFloat;
  if strtofloat(Format('%17.2f',[cdsDocs.FieldByName('VALORSALDO').AsFloat]))=0 then
  begin
     cdsDocs.FieldByName('VALORSALDO').AsFloat:=  cdsDocs.FieldByName('VALOR').Asfloat+
                                  cdsDocs.FieldByName('VALORALTERACRES').AsFloat-
                                  cdsDocs.FieldByName('VALORALTERDECRES').AsFloat-
                                  cdsDocs.FieldByName('VALORALTERIRRF').AsFloat;
  end;

  If cdsDocs.FieldByName('DESCRICAO').AsString = '' Then
  Begin
     With DtmDadosBancarios Do
     Begin
        BuscaContaDoc(cdsDocs.FieldByName('CODDOCUMENTO').AsFloat);
        cdsDocs.FieldByName('NUMBANCO').AsString := ContaBancaria.Banco;
        cdsDocs.FieldByName('NOMEBANCO').AsString := ContaBancaria.NomeBanco;
        cdsDocs.FieldByName('NUMAGENCIA').AsString := ContaBancaria.Agencia;
        cdsDocs.FieldByName('NOMEAGENCIA').AsString := ContaBancaria.Nomeagencia;
        cdsDocs.FieldByName('CONTACORRENTE').AsString := ContaBancaria.Numero;
     End;
  End;
end;

procedure TFrmExpLanctoMT.sqlDocsParceladosCalcFields(DataSet: TDataSet);
Var
  rSaldo, rSaldoOM :Real;
begin
  inherited;

  sqlAlteraParc.Prepare;
  sqlAlteraParc.ParamByName('CODDOCUMENTO').AsFloat := cdsDocsParcelados.FieldByName('CODDOCUMENTO').AsFloat;
  sqlAlteraParc.Open;

  SqlAlteraParcOrigem.Prepare;
  SqlAlteraParcOrigem.ParamByName('CODDOCUMENTO').AsFloat := cdsDocsParcelados.FieldByName('CODDOCUMENTO').AsFloat;
  SqlAlteraParcOrigem.ParamByName('NUMFATURA').AsFloat := cdsDocsParcelados.FieldByName('NUMFATURA').AsFloat;
  SqlAlteraParcOrigem.Open;

  CtrlDocumento.Saldo.CalculaSaldo( cdsDocsParcelados.FieldByName('CODDOCUMENTO').AsInteger );
  rSaldo := CtrlDocumento.Saldo.Valor;

  cdsDocsParcelados.FieldByName('VALORSALDO').AsFloat := rSaldo;

  CdsDocsParcelados.FieldByName('VALORALTERACRES').AsFloat  := cdsAlteraParc.FieldByName('VALACRE').AsFloat +
                                               CdsAlteraParcOrigem.FieldByName('VALACRE').AsFloat;
  cdsDocsParcelados.FieldByName('VALORALTERDECRES').AsFloat := cdsAlteraParc.FieldByName('VALDECR').AsFloat +
                                               cdsAlteraParcOrigem.FieldByName('VALDECR').AsFloat;
  cdsDocsParcelados.FieldByName('VALORALTERIRRF').AsFloat   := cdsAlteraParc.FieldByName('VALIMP').AsFloat +
                                              cdsAlteraParcOrigem.FieldByName('VALIMP').AsFloat;

  if strtofloat(Format('%17.2f',[cdsDocsParcelados.FieldByName('VALORSALDO').AsFloat]))= 0  then
  begin
     cdsDocsParcelados.FieldByName('VALORSALDO').AsFloat:=  cdsDocsParcelados.FieldByName('VALOR').Asfloat+
                                            cdsDocsParcelados.FieldByName('VALORALTERACRES').AsFloat-
                                            cdsDocsParcelados.FieldByName('VALORALTERDECRES').AsFloat-
                                            cdsDocsParcelados.FieldByName('VALORALTERIRRF').AsFloat;
  end;

  If cdsDocsParcelados.FieldByName('DESCRICAO').AsString = '' Then
  Begin
     With DtmDadosBancarios Do
     Begin
        BuscaContaDoc(cdsDocs.FieldByName('CODDOCUMENTO').AsFloat);
        cdsDocsParcelados.FieldByName('NUMBANCO').AsString := ContaBancaria.Banco;
        cdsDocsParcelados.FieldByName('NOMEBANCO').AsString := ContaBancaria.NomeBanco;
        cdsDocsParcelados.FieldByName('NUMAGENCIA').AsString := ContaBancaria.Agencia;
        cdsDocsParcelados.FieldByName('NOMEAGENCIA').AsString := ContaBancaria.Nomeagencia;
        cdsDocsParcelados.FieldByName('CONTACORRENTE').AsString := ContaBancaria.Numero;
     End;
  End;

end;

procedure TFrmExpLanctoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlDocumento.FRee;
// início André Tavares - pendência 15366 - 21/05/2004
  _ctrlCentroRespon.Free;
// fim André Tavares - pendência 15366 - 21/05/2004

  FuncaoGeral.FechaQry([CdsDocs,CdsRateioDocs,cdsAlteraDocs,CdsDocsParcelados,CdsRateioParc,CdsAlteraParcOrigem,CdsAlteraParc],false,true);
end;

procedure TFrmExpLanctoMT.BtnFileClick(Sender: TObject);
begin
  inherited;
  If DirDlg.Execute Then EdtFile.text := DirDlg.Directory;
end;

procedure TFrmExpLanctoMT.bbtnConfirmarClick(Sender: TObject);
Var
  sDiretorio, sLinha :String;
  x: LongInt;
  TxtExport, TxtExportRateio :TextFile;
  iContador :Integer;
begin
  inherited;
  ShowStatus( 'Buscando Parâmetros para exportação...' );

  If Trim(EdtFile.text) = '' Then
     MsgDlg('Favor Informar o Nome do Arquivo','Aviso',mtError,[mbOk],0)
  Else
  Begin
     If (Trim(DtLancIni.text) = '') Or
        (Trim(DtLancFin.text) = '') Then
        ShowStatus( 'Exportação cancelada: falta de parâmetros.' )
     Else
     Begin
        sDiretorio := ExtractFilePath(EdtFile.Text);
        If (Not DirectoryExists(sDiretorio)) And
           (MsgDlg('Não existe o diretório informado, deseja criar o caminho?','Aviso',mtConfirmation, [mbYes,mbNo],0)=mrno) then
            ShowStatus( 'Exportação cancelada: Diretório de destino "' + sDiretorio + '" não existe.' )
        Else
        Begin
           If (Not DirectoryExists(sDiretorio)) Then ForceDirectories(sDiretorio);

           If (FileExists(EdtFile.Text)) And
              (MsgDlg('O Arquivo de destino já existe, deseja deseja substituir o arquivo?','Aviso',mtConfirmation, [mbYes,mbNo],0)=mrno) then
               ShowStatus( 'Exportação cancelada: Arquivo de destino "' + EdtFile.Text + '" já existe.' )
           Else
           Begin
              If AbreQry Then
              Begin
                 AssignFile(TxtExport,ExtractFilePath(EdtFile.text) + 'D' + ExtractFileName(EdtFile.text));
                 ReWrite(TxtExport);

                 AssignFile(TxtExportRateio,ExtractFilePath(EdtFile.text) + 'R' + ExtractFileName(EdtFile.text));
                 ReWrite(TxtExportRateio);

                 With cdsDocs Do
                 Begin
                    First;
                    iContador := 0;
                    ShowStatus( 'Progresso Para Lançamentos Efetivos ' + InttoStr(iContador));

                    While Not Eof Do
                    Begin

                      sqlRateioDocs.Prepare;
                      sqlRateioDocs.ParamByName('CODDOCUMENTO').AsFloat := cdsDocs.FieldByNAme('CODDOCUMENTO').AsFloat;
                      sqlRateioDocs.Open;

                      Inc(iContador);
                      MemLog.Lines.Delete(MemLog.Lines.Count - 1);
                      Application.ProcessMessages;
                      ShowStatus( 'Progresso Para Lançamentos Efetivos ' + InttoStr(iContador));
                      sLinha := '';

                      For X:=1 To FieldCount - 1 Do
                      Begin
                        If X in [2,15] Then
                           sLinha := sLinha + ZD(Fields[x].AsString,Fields[x].Tag)

                        Else
                        Begin
                           Case Fields[x].DataType Of
                             ftFloat:
                               sLinha := sLinha + ZD(RemoveVirgulas(Fields[x].AsFloat,2),Fields[x].Tag);                             ftDateTime:
                               sLinha := sLinha + RemoveBarras2(Fields[x].AsString);
                           Else
                              sLinha := sLinha + FuncaoGeral.Ae(Copy(Fields[x].AsString,1,Fields[x].Tag),Fields[x].Tag);
                           End;
                        End;
                      End;

                      WriteLn(TxtExport,LimpaStr(sLinha));

                      //Insere Registros do Rateio
                      cdsRateioDocs.First;
                      While Not cdsRateioDocs.Eof Do
                      Begin
                        sLinha := '';

                        For X:=0 To cdsRateioDocs.FieldCount - 1 Do
                        Begin
                          If X = 1 Then
                             sLinha := sLinha + ZD(cdsRateioDocs.Fields[x].AsString,cdsRateioDocs.Fields[x].Tag)
                          Else
                          Begin
                            Case cdsRateioDocs.Fields[x].DataType Of
                              ftFloat:
                              sLinha := sLinha + ZD(RemoveVirgulas(cdsRateioDocs.Fields[x].AsFloat,2),cdsRateioDocs.Fields[x].Tag);
                              ftDateTime:
                              sLinha := sLinha + RemoveBarras2(cdsRateioDocs.Fields[x].AsString);
                            Else
                              sLinha := sLinha + FuncaoGeral.Ae(Copy(cdsRateioDocs.Fields[x].AsString,1,cdsRateioDocs.Fields[x].Tag),cdsRateioDocs.Fields[x].Tag);
                            End;
                          End;
                        End;

                        WriteLn(TxtExportRateio,LimpaStr(sLinha));
                        cdsRateioDocs.Next;
                      End;

                      Next;
                    End;
                    Close;
                 End;

                 With cdsDocsParcelados Do
                 Begin
                    First;

                    iContador := 0;

                    ShowStatus( 'Progresso Para Agrupados\Parcelados ' + IntToStr(iContador));

                    While Not Eof Do
                    Begin
                      sLinha := '';

                      sqlRateioParc.Prepare;
                      sqlRateioParc.ParamByName('CODDOCUMENTO').AsFloat := cdsDocsParcelados.FieldByNAme('CODDOCUMENTO').AsFloat;
                      sqlRateioParc.Open;

                      Inc(iContador);
                      MemLog.Lines.Delete(MemLog.Lines.Count - 1);
                      Application.ProcessMessages;
                      ShowStatus( 'Progresso Para Agrupados\Parcelados ' + IntToStr(iContador));

                      For X:=1 To FieldCount - 2 Do
                      Begin
                        If X in [2,15] Then
                          sLinha := sLinha + ZD(Fields[x].AsString,Fields[x].Tag)
                        Else
                        Begin
                            Case Fields[x].DataType Of
                              ftFloat:
                              sLinha := sLinha + ZD(RemoveVirgulas(Fields[x].AsFloat,2),Fields[x].Tag);
                              ftDateTime:
                                sLinha := sLinha + RemoveBarras2(Fields[x].AsString);
                            Else
                                sLinha := sLinha + FuncaoGeral.Ae(Copy(Fields[x].AsString,1,Fields[x].Tag),Fields[x].Tag);

                            End;
                        End;
                      End;

                      WriteLn(TxtExport,LimpaStr(sLinha));

                      //Insere Registros do Rateio
                      cdsRateioParc.First;
                      While Not cdsRateioParc.Eof Do
                      Begin
                        sLinha := '';

                        For X:=0 To cdsRateioParc.FieldCount - 1 Do
                        Begin
                          If X = 1 Then
                             sLinha := sLinha + ZD(cdsRateioParc.Fields[x].AsString,cdsRateioParc.Fields[x].Tag)
                          Else
                          Begin
                            Case cdsRateioParc.Fields[x].DataType Of
                              ftFloat:

                                sLinha := sLinha + ZD(RemoveVirgulas(cdsRateioParc.Fields[x].AsFloat,2),cdsRateioParc.Fields[x].Tag);
                              ftDateTime:
                                sLinha := sLinha + RemoveBarras2(cdsRateioParc.Fields[x].AsString);
                            Else
                                sLinha := sLinha + FuncaoGeral.Ae(Copy(cdsRateioParc.Fields[x].AsString,1,cdsRateioParc.Fields[x].Tag),cdsRateioParc.Fields[x].Tag);
                            End;
                          End;
                        End;

                        WriteLn(TxtExportRateio,LimpaStr(sLinha));
                        cdsRateioParc.Next;
                      End;

                      Next;
                    End;
                    Close;
                 End;

                 CloseFile(TxtExport);
                 CloseFile(TxtExportRateio);
                 ShowStatus( 'Fim da Operacao' );
              End
              Else
                ShowStatus( 'Sem Arquivos Para Exportação.' );
           End;
        End;
     End;
  End;
end;

procedure TFrmExpLanctoMT.bbtnCancelarClick(Sender: TObject);
begin                            inherited;
  DtLancIni.Text := '';
  DtLancFin.Text := '';
  EdtFile.Text := '';
end;

Function TFrmExpLanctoMT.LimpaStr(S:String):String;
Var
  sAux :String;
  iPos :Integer;
Begin
  sAux := s;
  iPos := Pos(#13+#10,sAux);
  While iPos <> 0 Do
  Begin
      Delete(sAux,iPos,2);
      Insert(' ',sAux,iPos);
      iPos := Pos(#13+#10,sAux);
  End;

  iPos   := Pos(#13,sAux);
  While iPos <> 0 Do
  Begin
      Delete(sAux,iPos,1);
      Insert(' ',sAux,iPos);
      iPos := Pos(#13,sAux);
  End;

  Result := saux;
End;

procedure TFrmExpLanctoMT.FormCreate(Sender: TObject);
begin
  inherited;
// início André Tavares - pendência 15366 - 21/05/2004
  _ctrlCentroRespon := TCtrlCentRespon.Create;
  _ctrlCentroRespon.InitializeAS( Padroes );
// fim André Tavares - pendência 15366 - 21/05/2004

  CtrlDocumento := TCtrlDocumento.Create;
  CtrlDocumento.InitializeAs( Padroes );
  CtrlDocumento.OpenTransaction := false;

  CtrlDocumento.IdModulo          := Trunc( Sistema.IdModulo );
  CtrlDocumento.IdUsuario         := Trunc( Sistema.IdUsuario );
  CtrlDocumento.UsaPlanoPatro     := Sistema.UsaPlanoPatro;
  CtrlDocumento.IdEspAcesso       := Trunc( Sistema.IdEspAcesso );

  If Modulo.coddocumento = 0 Then
  begin
    cdsCentroRespon.Data := _ctrlCentroRespon.ListaCentRespon(Sistema.idEmpresa, '', 1, '',
                            ParamIntegra.PlanoCentroRespon, false, true);
  end;
  _sqldocs :=  sqlDocs.sql.text;
  _sqldocsparcelados := sqlDocsParcelados.sql.text;

// Daniel Simões - 25/01/2006 - Início------------------------------------------
  if ParamIntegra.Recpag = 'P' then
  begin
    HelpContext           := 30006;
    bbtnAjuda.HelpContext := 30006;
  end;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------

end;

end.
