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

unit FExpLancto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, Db, DBTables, Wwquery, FileCtrl,
  Wwdatsrc, wwdblook, BfDialogs,
  BrowseFolder, wwdbdatetimepicker, CMDateTimePicker, ExtCtrls, uProcuraDir;

type
  TFrmExpLancto = class(TfrmOkCancelar)
    Panel1: TPanel;
    MemLog: TMemo;
    EdtFile: TEdit;
    Label1: TLabel;
    BtnFile: TSpeedButton;
    QryDocs: TwwQuery;
    QryDocsParcelados: TwwQuery;
    QryDocsNODOCUMENTO: TFloatField;
    QryDocsREFERENCIA: TStringField;
    QryDocsDATAVENCTO: TDateTimeField;
    QryDocsDATAPROGRAMADA: TDateTimeField;
    QryDocsDATALANCTO: TDateTimeField;
    QryDocsRAZAOSOCIAL: TStringField;
    QryDocsNUMDOCUMENTO: TStringField;
    QryDocsVALOR: TFloatField;
    QryDocsHISTORICOCOMPL: TStringField;
    QryDocsCODFORMA: TFloatField;
    QryDocsNUMBANCO: TStringField;
    QryDocsNOMEBANCO: TStringField;
    QryDocsNUMAGENCIA: TStringField;
    QryDocsNOMEAGENCIA: TStringField;
    QryDocsCONTACORRENTE: TStringField;
    QryDocsDESCRICAO: TStringField;
    QryDocsVALORALTERACRES: TFloatField;
    QryDocsVALORALTERDECRES: TFloatField;
    QryDocsVALORALTERIRRF: TFloatField;
    QryDocsVALORSALDO: TFloatField;
    QryDocsParceladosNODOCUMENTO: TFloatField;
    QryDocsParceladosREFERENCIA: TStringField;
    QryDocsParceladosDATAVENCTO: TDateTimeField;
    QryDocsParceladosDATAPROGRAMADA: TDateTimeField;
    QryDocsParceladosDATALANCTO: TDateTimeField;
    QryDocsParceladosRAZAOSOCIAL: TStringField;
    QryDocsParceladosNUMDOCUMENTO: TStringField;
    QryDocsParceladosVALOR: TFloatField;
    QryDocsParceladosHISTORICOCOMPL: TStringField;
    QryDocsParceladosCODFORMA: TFloatField;
    QryDocsParceladosNUMBANCO: TStringField;
    QryDocsParceladosNOMEBANCO: TStringField;
    QryDocsParceladosNUMAGENCIA: TStringField;
    QryDocsParceladosNOMEAGENCIA: TStringField;
    QryDocsParceladosCONTACORRENTE: TStringField;
    QryDocsParceladosDESCRICAO: TStringField;
    QryDocsParceladosVALORALTERACRES: TFloatField;
    QryDocsParceladosVALORALTERDECRES: TFloatField;
    QryDocsParceladosVALORALTERIRRF: TFloatField;
    QryDocsParceladosVALORSALDO: TFloatField;
    QryRateioDocs: TwwQuery;
    QryRateioDocsNODOCUMENTO: TFloatField;
    QryRateioDocsVALOR: TFloatField;
    QryRateioDocsCODTIPRECDES: TStringField;
    QryRateioParc: TwwQuery;
    QryRateioParcNODOCUMENTO: TFloatField;
    QryRateioParcVALOR: TFloatField;
    QryRateioParcCODTIPRECDES: TStringField;
    QryDocsCODDOCUMENTO: TFloatField;
    QryDocsParceladosCODDOCUMENTO: TFloatField;
    Label2: TLabel;
    DtLancIni: TCMDateTimePicker;
    DtLancFin: TCMDateTimePicker;
    QryAlteraDocs: TwwQuery;
    QryAlteraDocsVALACRE: TFloatField;
    QryAlteraDocsVALDECR: TFloatField;
    QryAlteraDocsVALIMP: TFloatField;
    QryAlteraParcOrigem: TwwQuery;
    QryAlteraParcOrigemVALACRE: TFloatField;
    QryAlteraParcOrigemVALDECR: TFloatField;
    QryAlteraParcOrigemVALIMP: TFloatField;
    QryAlteraParc: TwwQuery;
    QryAlteraParcVALACRE: TFloatField;
    QryAlteraParcVALDECR: TFloatField;
    QryAlteraParcVALIMP: TFloatField;
    DirDlg: TProcuraDirDlg;
    QryDocsParceladosOBS: TMemoField;
    QryDocsOBS: TMemoField;
    QryDocsParceladosNUMFATURA: TFloatField;
    QryDocsCODCENTRORESPON: TStringField;
    QryDocsParceladosNOMECR: TStringField;
    QryRateioDocsCODCENTROCUSTO: TStringField;
    QryRateioParcCODCENTROCUSTO: TStringField;
    QryRateioDocsCODCENTRORESPON: TStringField;
    QryRateioParcCODCENTRORESPON: TStringField;
    qryCentroRespon: TwwQuery;
    qryCentroResponCODCENTRORESPON: TStringField;
    qryCentroResponNOME: TStringField;
    qryCentroResponANALITICOSINTET: TStringField;
    qryCentroResponCODCENTROCUSTO: TStringField;
    lblCentroRespon: TLabel;
    dblcCentroRespon: TwwDBLookupCombo;
    procedure QryDocsCalcFields(DataSet: TDataSet);
    procedure QryDocsParceladosCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnFileClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Function AbreQry:Boolean;
    Procedure ShowStatus(sStatus :String);
    Function LimpaStr(S:String):String;
    Procedure SetaParametros(QryPar :TwwQuery; ValPar :array of Variant);
  public
    { Public declarations }
  end;

var
  FrmExpLancto: TFrmExpLancto;
  sqldocs,sqldocsparcelados:string;

implementation

Uses uMensErro, uDocumento, uIntegraBack, uBiblioteca, uFuncaoGeral,
  DDadosBancarios,uModulo,udatabase ,usistema;

{$R *.DFM}

Function TFrmExpLancto.AbreQry:Boolean;
Begin
  ShowStatus( 'Verificando Documentos Lançados Efetivos ' );
  With QryDocs Do
  Begin
     sql.text:=sqldocs;
     If Active Then Close;
     If Not Prepared Then Prepare;
     If (trim(dblcCentroRespon.text)<>'')  then
         sql.Insert(48,'rtrim(RD.CODCENTRORESPON) =  '+#39+trim(dblcCentroRespon.lookupvalue)+#39+' and');

     ParamByname('DATAINI').AsString := DtLancIni.Text;
     ParamByname('DATAFIN').AsString := DtLancFin.Text;
     Open;
  End;

  ShowStatus( 'Verificando Documentos Agrupados\Parcelados' );
  With QryDocsParcelados Do
  Begin
     If Active Then Close;
     sql.text:=sqldocsparcelados;
     If Not Prepared Then Prepare;
          If (trim(dblcCentroRespon.text)<>'')  then
         sql.Insert(67,'rtrim(RD.CODCENTRORESPON) =  '+#39+trim(dblcCentroRespon.lookupvalue)+#39+' and');


     ParamByname('DATAINI').AsString := DtLancIni.Text;
     ParamByname('DATAFIN').AsString := DtLancFin.Text;
     Open;
  End;

  Result := (Not QryDocs.IsEmpty) Or (Not QryDocsParcelados.IsEmpty) ;
End;

Procedure TFrmExpLancto.ShowStatus(sStatus :String);
Begin
  If Trim(sStatus) <> '' Then
     MemLog.Lines.Add(DateTimeToStr(Now) + ' ' + sStatus )
  Else
     MemLog.Lines.Add('');
  Application.ProcessMessages;
End;


procedure TFrmExpLancto.QryDocsCalcFields(DataSet: TDataSet);
Var
  rSaldo, rSaldoOM :Real;
begin
  inherited;
  SetaParametros(QryAlteraDocs,[QryDocsCODDOCUMENTO.AsFloat]);

  Documento.Saldo.GetSaldoDoc(QryDocsCODDOCUMENTO.AsInteger,'',
                              IntegraBack.RecPag,rSaldo,rSaldoOm);
  QryDocsVALORSALDO.AsFloat := rSaldo;

  QryDocsVALORALTERACRES.AsFloat  := QryAlteraDocsVALACRE.AsFloat;
  QryDocsVALORALTERDECRES.AsFloat := QryAlteraDocsVALDECR.AsFloat;
  QryDocsVALORALTERIRRF.AsFloat   := QryAlteraDocsVALIMP.AsFloat;
 // showmessage('fornecedor' +QryDocsRAZAOSOCIAL.asstring+' data vencto '+QryDocsDATAVENCTO.asstring)   ;
 // showmessage('valor liq '+QryDocsVALORSALDO.Asstring);
 // showmessage('rsaldo '+  (Format('%17.2f',[rsaldo])));
  if strtofloat(Format('%17.2f',[QryDocsVALORSALDO.AsFloat]))=0 then
  begin
     QryDocsVALORSALDO.AsFloat:=  QryDocsVALOR.Asfloat+
                                  QryDocsVALORALTERACRES.AsFloat-
                                  QryDocsVALORALTERDECRES.AsFloat-
                                  QryDocsVALORALTERIRRF.AsFloat;
  //  showmessage('valor liq corrigido '+QryDocsVALORSALDO.Asstring);
  end;

  If QryDocsDESCRICAO.AsString = '' Then
  Begin
     With DtmDadosBancarios Do
     Begin
        BuscaContaDoc(QryDocsCODDOCUMENTO.AsFloat);
        QryDocsNUMBANCO.AsString := ContaBancaria.Banco;
        QryDocsNOMEBANCO.AsString := ContaBancaria.NomeBanco;
        QryDocsNUMAGENCIA.AsString := ContaBancaria.Agencia;
        QryDocsNOMEAGENCIA.AsString := ContaBancaria.Nomeagencia;
        QryDocsCONTACORRENTE.AsString := ContaBancaria.Numero;
     End;
  End;
end;

procedure TFrmExpLancto.QryDocsParceladosCalcFields(DataSet: TDataSet);
Var
  rSaldo, rSaldoOM :Real;
begin
  inherited;

  SetaParametros(QryAlteraParc,[QryDocsParceladosCODDOCUMENTO.AsFloat]);
  SetaParametros(QryAlteraParcOrigem,[QryDocsParceladosCODDOCUMENTO.AsFloat,QryDocsParceladosNUMFATURA.AsFloat]);

  Documento.Saldo.GetSaldoDoc(QryDocsParceladosCODDOCUMENTO.AsInteger,'',
                              IntegraBack.RecPag,rSaldo,rSaldoOm);
  QryDocsParceladosVALORSALDO.AsFloat := rSaldo;

  QryDocsParceladosVALORALTERACRES.AsFloat  := QryAlteraParcVALACRE.AsFloat +
                                               QryAlteraParcOrigemVALACRE.AsFloat;
  QryDocsParceladosVALORALTERDECRES.AsFloat := QryAlteraParcVALDECR.AsFloat +
                                               QryAlteraParcOrigemVALDECR.AsFloat;
  QryDocsParceladosVALORALTERIRRF.AsFloat   := QryAlteraParcVALIMP.AsFloat +
                                               QryAlteraParcOrigemVALIMP.AsFloat;

    //  showmessage('fornecedor' +QryDocsRAZAOSOCIAL.asstring+' data vencto '+QryDocsDATAVENCTO.asstring)  ;
  // showmessage('valor liq '+QryDocsVALORSALDO.Asstring);
//  showmessage('rsaldo '+  (Format('%17.2f',[rsaldo])));
  if strtofloat(Format('%17.2f',[QryDocsParceladosVALORSALDO.AsFloat]))= 0  then
  begin
     QryDocsParceladosVALORSALDO.AsFloat:=  QryDocsParceladosVALOR.Asfloat+
                                            QryDocsParceladosVALORALTERACRES.AsFloat-
                                            QryDocsParceladosVALORALTERDECRES.AsFloat-
                                            QryDocsParceladosVALORALTERIRRF.AsFloat;
// showmessage('valor liq corrigido '+QryDocsVALORSALDO.Asstring);
  end;

  If QryDocsParceladosDESCRICAO.AsString = '' Then
  Begin
     With DtmDadosBancarios Do
     Begin
        BuscaContaDoc(QryDocsCODDOCUMENTO.AsFloat);
        QryDocsParceladosNUMBANCO.AsString := ContaBancaria.Banco;
        QryDocsParceladosNOMEBANCO.AsString := ContaBancaria.NomeBanco;
        QryDocsParceladosNUMAGENCIA.AsString := ContaBancaria.Agencia;
        QryDocsParceladosNOMEAGENCIA.AsString := ContaBancaria.Nomeagencia;
        QryDocsParceladosCONTACORRENTE.AsString := ContaBancaria.Numero;
     End;
  End;

end;

procedure TFrmExpLancto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FuncaoGeral.FechaQry([QryDocs,QryRateioDocs,QryAlteraDocs,QryDocsParcelados,QryRateioParc,QryAlteraParcOrigem,QryAlteraParc],false,true);
end;

procedure TFrmExpLancto.BtnFileClick(Sender: TObject);
begin
  inherited;
  If DirDlg.Execute Then EdtFile.text := DirDlg.Directory;
end;

procedure TFrmExpLancto.bbtnConfirmarClick(Sender: TObject);
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

                 With QryDocs Do
                 Begin
                    First;
                    iContador := 0;
                    ShowStatus( 'Progresso Para Lançamentos Efetivos ' + InttoStr(iContador));

                    While Not Eof Do
                    Begin

                      SetaParametros(QryRateioDocs,[QryDocsCODDOCUMENTO.AsFloat]);

                      Inc(iContador);
                      MemLog.Lines.Delete(MemLog.Lines.Count - 1);
                      Application.ProcessMessages;
                      ShowStatus( 'Progresso Para Lançamentos Efetivos ' + InttoStr(iContador));
                      sLinha := '';

                      For X:=1 To FieldCount - 1 Do
                      Begin
                        If X in [2,15] Then
                           sLinha := sLinha + Biblioteca.ZD(Fields[x].AsString,Fields[x].Tag)
                        Else
                        Begin
                           Case Fields[x].DataType Of
                             ftFloat:
                               sLinha := sLinha + Biblioteca.ZD(Biblioteca.RemoveVirgulas(Fields[x].AsFloat,2),Fields[x].Tag);
                             ftDateTime:
                               sLinha := sLinha + Biblioteca.RemoveBarras2(Fields[x].AsString);
                           Else
                               sLinha := sLinha + FuncaoGeral.Ae(Copy(Fields[x].AsString,1,Fields[x].Tag),Fields[x].Tag);
                           End;
                        End;
                      End;

                      WriteLn(TxtExport,LimpaStr(sLinha));

                      //Insere Registros do Rateio
                      QryRateioDocs.First;
                      While Not QryRateioDocs.Eof Do
                      Begin
                        sLinha := '';

                        For X:=0 To QryRateioDocs.FieldCount - 1 Do
                        Begin
                          If X = 1 Then
                             sLinha := sLinha + Biblioteca.ZD(QryRateioDocs.Fields[x].AsString,QryRateioDocs.Fields[x].Tag)
                          Else
                          Begin
                            Case QryRateioDocs.Fields[x].DataType Of
                              ftFloat:
                                sLinha := sLinha + Biblioteca.ZD(Biblioteca.RemoveVirgulas(QryRateioDocs.Fields[x].AsFloat,2),QryRateioDocs.Fields[x].Tag);
                              ftDateTime:
                                sLinha := sLinha + Biblioteca.RemoveBarras2(QryRateioDocs.Fields[x].AsString);
                            Else
                                sLinha := sLinha + FuncaoGeral.Ae(Copy(QryRateioDocs.Fields[x].AsString,1,QryRateioDocs.Fields[x].Tag),QryRateioDocs.Fields[x].Tag);
                            End;
                          End;
                        End;

                        WriteLn(TxtExportRateio,LimpaStr(sLinha));
                        QryRateioDocs.Next;
                      End;

                      Next;
                    End;
                    Close;
                 End;

                 With QryDocsParcelados Do
                 Begin
                    First;

                    iContador := 0;

                    ShowStatus( 'Progresso Para Agrupados\Parcelados ' + IntToStr(iContador));

                    While Not Eof Do
                    Begin
                      sLinha := '';

                      SetaParametros(QryRateioParc,[QryDocsParceladosCODDOCUMENTO.AsFloat]);

                      Inc(iContador);
                      MemLog.Lines.Delete(MemLog.Lines.Count - 1);
                      Application.ProcessMessages;
                      ShowStatus( 'Progresso Para Agrupados\Parcelados ' + IntToStr(iContador));

                      For X:=1 To FieldCount - 2 Do
                      Begin
                        If X in [2,15] Then
                           sLinha := sLinha + Biblioteca.ZD(Fields[x].AsString,Fields[x].Tag)
                        Else
                        Begin
                            Case Fields[x].DataType Of
                              ftFloat:
                                sLinha := sLinha + Biblioteca.ZD(Biblioteca.RemoveVirgulas(Fields[x].AsFloat,2),Fields[x].Tag);
                              ftDateTime:
                                sLinha := sLinha + Biblioteca.RemoveBarras2(Fields[x].AsString);
                            Else
                                sLinha := sLinha + FuncaoGeral.Ae(Copy(Fields[x].AsString,1,Fields[x].Tag),Fields[x].Tag);
                            End;
                        End;
                      End;

                      WriteLn(TxtExport,LimpaStr(sLinha));

                      //Insere Registros do Rateio
                      QryRateioParc.First;
                      While Not QryRateioParc.Eof Do
                      Begin
                        sLinha := '';

                        For X:=0 To QryRateioParc.FieldCount - 1 Do
                        Begin
                          If X = 1 Then
                             sLinha := sLinha + Biblioteca.ZD(QryRateioParc.Fields[x].AsString,QryRateioParc.Fields[x].Tag)
                          Else
                          Begin
                            Case QryRateioParc.Fields[x].DataType Of
                              ftFloat:
                                sLinha := sLinha + Biblioteca.ZD(Biblioteca.RemoveVirgulas(QryRateioParc.Fields[x].AsFloat,2),QryRateioParc.Fields[x].Tag);
                              ftDateTime:
                                sLinha := sLinha + Biblioteca.RemoveBarras2(QryRateioParc.Fields[x].AsString);
                            Else
                                sLinha := sLinha + FuncaoGeral.Ae(Copy(QryRateioParc.Fields[x].AsString,1,QryRateioParc.Fields[x].Tag),QryRateioParc.Fields[x].Tag);
                            End;
                          End;
                        End;

                        WriteLn(TxtExportRateio,LimpaStr(sLinha));
                        QryRateioParc.Next;
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

procedure TFrmExpLancto.bbtnCancelarClick(Sender: TObject);
begin                            inherited;
  DtLancIni.Text := '';
  DtLancFin.Text := '';
  EdtFile.Text := '';
end;

Function TFrmExpLancto.LimpaStr(S:String):String;
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

Procedure TFrmExpLancto.SetaParametros(QryPar :TwwQuery; ValPar :array of Variant);
Var
  X:Integer;
Begin
  With QryPar Do
  Begin
     If Active Then Close;
     If Not Prepared Then Prepare;
     For X:=0 To High(ValPar) Do
         Params[x].Value := ValPar[x];
     Open;
  End;
End;

procedure TFrmExpLancto.FormCreate(Sender: TObject);
begin
  inherited;
  If Modulo.coddocumento = 0 Then
     FazQuery(qryCentroRespon,'SELECT CODCENTRORESPON,NOME,ANALITICOSINTET, CODCENTROCUSTO FROM CENTRESPON WHERE IDPESSOA = '+InttoStr(Sistema.idempresa)+' AND CODCENTRORESPON <> ''9999999999''  ORDER BY CODCENTRORESPON');
  sqldocs:= QryDocs.sql.text;
  sqldocsparcelados:=QryDocsParcelados.sql.text;

end;

{
  DF 11/07 Gustavo
  Correção na gravação da obs no arquivo de saída: Exclusão de quebras de linha do
  campo OBS
  Fim DF 11/07 Gustavo
}

{DF 24/08 - GUSTAVO VIEGAS
 Correção na seleção dos dados bancário referentes ao favorecido do documento:
 Passou a verificar a existência da conta bancária informado no lançamento do documento,
 caso não exista exibe a conta preferencial do favorecido;
 Otimização das Consultas;
FIM DF 24/08}

end.
