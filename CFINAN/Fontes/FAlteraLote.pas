(*******************************************************************************
 11/01/1999
  Erro ao confirmar a inclusão do documento
 09/03/1999 - 02.05.08
  Alteração no Grid dos Documentos Pendentes e do Lote para exibir em vermelho os
  Documentos Atrasados e Exibição dos Complementos Documentos do Clientes;
  Alteração na Query Dos Lostes para Exibição do Complemento do Documento;
  Verificação do Cálculos dos Saldos, excluindo os Saldos Zerados e Alterando
  Rotina Pois Quando Deletava Saldo Zerado não calculava o saldo do anterior;
 01/11/1999 - 2.14.10
   Possibilitar a alteração do lote qdo o lançamento no financeiro for exclusivamente
   na baixa do documento e o cheque não for contabilizado no momento da emissão
*******************************************************************************)

unit FAlteraLote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Db, DBTables, Wwquery, StdCtrls, wwdblook, Grids, Wwdbigrd, uIntegraBack,
  Wwdbgrid, MAHlpBtn, Buttons, TB97, ExtCtrls, Wwdatsrc, Udocumento, uSistema, uMensErro, TB97Tlbr, TB97Ctls, MontaSelect, IvDictio,
  IvMulti, IvEMulti, CMProcuraSubTipo, FProcuraCliForDlg,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmAlteraLote = class(TFrmProcuraCliForDlg)
    Panel2: TPanel;
    dbgrdLotePagto: TwwDBGrid;
    updsqlDocumento: TUpdateSQL;
    updsqlLotexdocum: TUpdateSQL;
    qryLotePagto: TwwQuery;
    qryDocumentos: TwwQuery;
    qryDocumentosNOME: TStringField;
    qryDocumentosDATAPROGRAMADA: TDateTimeField;
    qryDocumentosDOCUMENTO: TStringField;
    qryDocumentosDATAVENCTO: TDateTimeField;
    qryDocumentosSALDO: TFloatField;
    qryDocumentosIDPESSOA: TFloatField;
    qryDocumentosCOMPLDOCUMENTO: TStringField;
    qryDocumentosCODDOCUMENTO: TFloatField;
    qryDocumentosRECPAG: TStringField;
    qryDocumentosSTATUS: TStringField;
    qryDocumentosIDFORCLI: TFloatField;
    dbgrdDocumentos: TwwDBGrid;
    dslotexdocum: TwwDataSource;
    dsdocumento: TwwDataSource;
    qryAux: TwwQuery;
    wwQuery1: TwwQuery;
    UpdateSQL1: TUpdateSQL;
    qryLoteXDocum: TwwQuery;
    Panel1: TPanel;
    bbtnincluir: TBitBtn;
    bbtnExcluir: TBitBtn;
    bbtnConfirma: TBitBtn;
    Panel3: TPanel;
    lblDataProgramada: TLabel;
    dtedDataProg: TCMDateTimePicker;
    lblDocumento: TLabel;
    bbtnSelecionaDoc: TToolbarButton97;
    Label3: TLabel;
    QryDocPendentes: TwwQuery;
    QryDocPendentesNODOCUMENTO: TFloatField;
    QryDocPendentesCOMPLDOCUMENTO: TStringField;
    QryDocPendentesCODDOCUMENTO: TFloatField;
    BtnCancela: TBitBtn;
    qryDocumentosNODOCUMENTO: TFloatField;
    qryLoteXDocumNOME: TStringField;
    qryLoteXDocumDATAPROGRAMADA: TDateTimeField;
    qryLoteXDocumIDPESSOA: TFloatField;
    qryLoteXDocumDATAVENCTO: TDateTimeField;
    qryLoteXDocumNODOCUMENTO: TFloatField;
    qryLoteXDocumCODDOCUMENTO: TFloatField;
    qryLoteXDocumOPERACAO: TStringField;
    qryLoteXDocumFLAGEMISSAO: TStringField;
    qryLoteXDocumVALOR: TFloatField;
    qryLoteXDocumNUMLOTE: TFloatField;
    qryLoteXDocumFLGBAIXA: TStringField;
    Panel8: TPanel;
    Pnldocpago: TPanel;
    qryLoteXDocumCOMPLDOCUMENTO: TStringField;
    dblkcmbloteIni: TwwDBLookupCombo;
    LckDoc: TwwDBLookupCombo;
    procedure bbtnSelecionaDocClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnincluirClick(Sender: TObject);
    procedure dbgrdDocumentosMultiSelectRecord(Grid: TwwDBGrid;
      Selecting: Boolean; var Accept: Boolean);
    procedure bbtnExcluirClick(Sender: TObject);
    procedure bbtnConfirmaClick(Sender: TObject);
    procedure dbgrdLotePagtoMultiSelectRecord(Grid: TwwDBGrid;
      Selecting: Boolean; var Accept: Boolean);
    procedure dblkcmbloteIni1CloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure BtnCancelaClick(Sender: TObject);
    procedure dbgrdDocumentosCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
  private
    { Private declarations }
     procedure Calcula_saldo;
  public
    { Public declarations }
  end;

var
  FrmAlteraLote: TFrmAlteraLote;

implementation
Uses   UDataBase, DBaseDados, uModulo;
{$R *.DFM}



procedure TFrmAlteraLote.bbtnSelecionaDocClick(Sender: TObject);
var
   sqlData, sqldocumentos, sqlCli, sqlDoc : string;
begin
  inherited;

  If Trim(dblkcmbloteIni.Text) = '' Then
  Begin
      Msgdlg('Não Há Lote para ser alterado','Atenção!',mtError,[mbOk],0);
      Exit;
  End;

  bbtnIncluir.enabled    := false;
  bbtnExcluir.enabled    := false;
  bbtnConfirma.enabled   := false;

  sqlCli  := '';
  sqlDoc  := '';
  sqlData := '';

  If (CPForCli.ForCliReg.RazaoSocial <> '') Then
     sqlCli := ' (DOCUMENTO.IDFORCLI = ' + IntToStr(CPForCli.ForCliReg.Id) + ') AND ';

  If LckDoc.Text <> '' Then  sqlDoc := ' (DOCUMENTO.CODDOCUMENTO = ' + LckDoc.LookupValue + ') AND ';
  If dtedDataProg.Text <> '' Then sqlData := ' (DOCUMENTO.DATAPROGRAMADA = TO_DATE(''' + dtedDataProg.Text + ''',''DD/MM/YYYY'') ) AND ';

  sqlDocumentos  := ' SELECT (0)as SALDO,DOCUMENTO.IDFORCLI,DOCUMENTO.CODDOCUMENTO,'+
                    ' DOCUMENTO.IDPESSOA,DOCUMENTO.NoDOCUMENTO,DOCUMENTO.COMPLDOCUMENTO,DOCUMENTO.DATAPROGRAMADA,'+
                    ' DOCUMENTO.DATAVENCTO,DOCUMENTO.RECPAG,PESSOA.NOME,DOCUMENTO.STATUS '+
                    ' FROM DOCUMENTO, PESSOA ' +
                    'WHERE ' +
                    ' ((DOCUMENTO.STATUS=''0'') or (DOCUMENTO.STATUS=''1'') or (DOCUMENTO.STATUS is  NULL))AND '+
                    ' ((DOCUMENTO.OPERACAO=''2'') OR (DOCUMENTO.OPERACAO=''3'') OR (DOCUMENTO.OPERACAO=''14'')) AND ' +
                    ' ((DOCUMENTO.EMISBLOQ <> ''S'') OR (DOCUMENTO.EMISBLOQ IS NULL)) AND '+
                    ' (DOCUMENTO.RECPAG='''+IntegraBack.RecPag+''') AND '+
                    ' (DOCUMENTO.IDPESSOA= '+ IntToStr(Sistema.idEmpresa) + ') AND '+
                      sqlCli + sqlDoc + sqlData +
                    ' (DOCUMENTO.IDFORCLI = PESSOA.IDPESSOA) AND ' +

                    '  DOCUMENTO.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
                         IntegraBack.RecPag+''' and not exists  (select 1 from UsuarioxTpdocto b where recpag='+#39+integraback.recpag+#39+' and b.idusuario=' +
                         inttostr(sistema.IdUsuario)+') union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
                         IntegraBack.RecPag+ '''  and exists (select 1 from UsuarioxTpdocto b where recpag='+#39+integraback.recpag+#39+' and a.codtipdoc=b.codtipdoc and b.idusuario=' +
                         inttostr(sistema.idusuario)+')) and '   +


                    ' (DOCUMENTO.CODDOCUMENTO != ALL (select coddocumento from lotexdocum where flgbaixa is null)) '+
                    ' ORDER BY  PESSOA.NOME ,DOCUMENTO.DATAPROGRAMADA, DOCUMENTO.NoDOCUMENTO';
  FazQuery(qryDocumentos,SqlDocumentos);

  calcula_saldo;

  If (Not QryDocumentos.IsEmpty) and (Not qrylotexdocum.IsEmpty) Then
  Begin
    bbtnIncluir.enabled    := True;
    bbtnExcluir.enabled    := True;
  End;

end;

procedure TFrmAlteraLote.FormActivate(Sender: TObject);
var
  sSql: string;
begin
  inherited;
  sSql:= 'select DISTINCT NoDOCUMENTO,COMPLDOCUMENTO,CODDOCUMENTO FROM '+
                Sistema.PrefixoServidor +'DOCUMENTO '+
                 ' WHERE  (STATUS=''0'' or  STATUS=''1''  or (STATUS is  NULL) ) '+
                 '  AND (OPERACAO=2 OR OPERACAO=3 OR OPERACAO=14) ' +
                 '  AND (DOCUMENTO.RECPAG='''+IntegraBack.RecPag+''') AND '+
                 ' DOCUMENTO.IDPESSOA='+IntToStr(Sistema.idEmpresa) +
                 ' ORDER BY NODOCUMENTO,COMPLDOCUMENTO';
  FazQuery(QryDocPendentes,sSql);

  //03/08/98 - Gustavo Viegas
  //Seleciona todos os documentos que não estão associados ao um lote e que ainda não foram baixados
  If (IntegraBack.Financeiro <> 'N') Then
      sSql :=   ' SELECT DISTINCT LOTEPAGTO.NUMLOTE, '+
                ' LOTEPAGTO.IDUSUARIOINCLUSAO,LOTEPAGTO.DATAEMISSAO, ' +
                ' LOTEPAGTO.NUMCHQBORDERO,LOTEPAGTO.FAVORECIDO, ' +
                ' lotepagto.FLAGEMISSAO,LOTEPAGTO.CODPORTFORMA ,LOTEPAGTO.FLAGCANCEL, ' +
                ' LOTEPAGTO.IDPESSOA,LOTEPAGTO.OBSERVACAO '+
                ' FROM LotePagto, LOTEXDOCUM LOTEX, DOCUMENTO DOC '+
                   ',(select count(*) as totdocum , numlote from lotexdocum ld , documento d where '+
                   '        D.RECPAG         = '''+ IntegraBack.RecPag +'''  AND '+
                   '       ((ld.FLGBAIXA     IS NULL)  ) AND '+
                   '         ld.CODDOCUMENTO = D.CODDOCUMENTO group by numlote  ) totdocum '+

                   ',(select count(*) as totdocum , numlote from lotexdocum ld , documento d where '+
                   '        D.RECPAG         = '''+ IntegraBack.RecPag +'''  AND '+
                   '       ((ld.FLGBAIXA     IS NULL)  ) AND '+
                   '         ld.CODDOCUMENTO = D.CODDOCUMENTO  and '+
                   '         d.codtipdoc in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
                         IntegraBack.RecPag+''' and not exists  (select 1 from UsuarioxTpdocto b where recpag='+#39+integraback.recpag+#39+' and b.idusuario=' +
                         inttostr(sistema.IdUsuario)+') union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
                         IntegraBack.RecPag+ '''  and exists (select 1 from UsuarioxTpdocto b where recpag='+#39+integraback.recpag+#39+' and a.codtipdoc=b.codtipdoc and b.idusuario=' +
                         inttostr(sistema.idusuario)+')) group by numlote  ) totlote '+

                ' WHERE  ' +
                ' totlote.totdocum=totdocum.totdocum and '+
                ' totlote.numlote=totdocum.numlote and   totlote.numlote=  lotepagto.NUMLOTE and '+
                '        LotePagto.IDPESSOA = ' + InttoStr(Sistema.IdEmpresa) + ' AND '+
                '        DOC.RECPAG         = '''+ IntegraBack.RecPag +''' AND '+
                '        LOTEPAGTO.FLAGEMISSAO IS NULL AND '+
                '        LOTEX.FLGBAIXA IS NULL AND '+
                '        LOTEPAGTO.NUMLOTE  = LOTEX.NUMLOTE AND '+
                '        LOTEX.CODDOCUMENTO = DOC.CODDOCUMENTO '
  Else
      sSql :=   ' SELECT DISTINCT LOTEPAGTO.NUMLOTE, '+
                ' LOTEPAGTO.IDUSUARIOINCLUSAO,LOTEPAGTO.DATAEMISSAO, ' +
                ' LOTEPAGTO.NUMCHQBORDERO,LOTEPAGTO.FAVORECIDO, ' +
                ' lotepagto.FLAGEMISSAO,LOTEPAGTO.CODPORTFORMA ,LOTEPAGTO.FLAGCANCEL, ' +
                ' LOTEPAGTO.IDPESSOA,LOTEPAGTO.OBSERVACAO '+
                ' FROM LotePagto, LOTEXDOCUM LOTEX, DOCUMENTO DOC '+
                ',(select count(*) as totdocum , numlote from lotexdocum ld , documento d where '+
                '        D.RECPAG         = '''+ IntegraBack.RecPag +'''  AND '+
                '       ((ld.FLGBAIXA     IS NULL)  ) AND '+
                '         ld.CODDOCUMENTO = D.CODDOCUMENTO group by numlote  ) totdocum '+

                ',(select count(*) as totdocum , numlote from lotexdocum ld , documento d where '+
                '        D.RECPAG         = '''+ IntegraBack.RecPag +'''  AND '+
                '       ((ld.FLGBAIXA     IS NULL)  ) AND '+
                '         ld.CODDOCUMENTO = D.CODDOCUMENTO  and '+
                '         d.codtipdoc in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
                         IntegraBack.RecPag+''' and not exists  (select 1 from UsuarioxTpdocto b where recpag='+#39+integraback.recpag+#39+' and b.idusuario=' +
                         inttostr(sistema.IdUsuario)+') union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
                         IntegraBack.RecPag+ '''  and exists (select 1 from UsuarioxTpdocto b where recpag='+#39+integraback.recpag+#39+' and a.codtipdoc=b.codtipdoc and b.idusuario=' +
                         inttostr(sistema.idusuario)+')) group by numlote  ) totlote '+

                ' WHERE ' +
                '        LotePagto.IDPESSOA = ' + InttoStr(Sistema.IdEmpresa) + ' AND ' +
                ' totlote.totdocum=totdocum.totdocum and '+
                ' totlote.numlote=totdocum.numlote and   totlote.numlote=  LOTEX.NUMLOTE and '+
                '        DOC.RECPAG         = '''+ IntegraBack.RecPag +''' AND ' +
                '        LotePagto.PLNCODIGO IS NULL AND ' + 
                '        LOTEX.FLGBAIXA IS NULL AND '+
                '        LOTEPAGTO.NUMLOTE  = LOTEX.NUMLOTE AND '+
                '        LOTEX.CODDOCUMENTO = DOC.CODDOCUMENTO ';
  FazQuery(qryLotePagto,sSql);

  sSql  := ' SELECT (0)as SALDO,DOCUMENTO.IDFORCLI,DOCUMENTO.CODDOCUMENTO,'+
                    ' DOCUMENTO.IDPESSOA,DOCUMENTO.NoDOCUMENTO,DOCUMENTO.COMPLDOCUMENTO,DOCUMENTO.DATAPROGRAMADA,'+
                    ' DOCUMENTO.DATAVENCTO,DOCUMENTO.RECPAG,PESSOA.NOME,DOCUMENTO.STATUS '+
                    ' FROM ' +
                    Sistema.PrefixoServidor +'DOCUMENTO, ' +
                    Sistema.PrefixoServidor +'PESSOA WHERE DOCUMENTO.CODDOCUMENTO = NULL ';
  FazQuery(qryDocumentos,sSql);


  sSql:=  ' SELECT   PESS.NOME,                                        '+
                   ' DOC.DATAPROGRAMADA,                               '+
                   ' DOC.IDPESSOA,                                     '+
                   ' DOC.DATAVENCTO,                                   '+
                   ' DOC.NoDOCUMENTO,                                  '+
                   ' DOC.COMPLDOCUMENTO,                               '+
                   ' DOC.CODDOCUMENTO,                                 '+
                   ' DOC.OPERACAO,                                     '+
                   ' LOTEPAG.FLAGEMISSAO,                              '+
                   ' LOTEX.VALOR,                                      '+
                   ' LOTEX.NUMLOTE,                                    '+
                   ' LOTEX.FLGBAIXA                                    '+
                   ' FROM  ' +
                   Sistema.PrefixoServidor +'DOCUMENTO DOC, ' +
                   Sistema.PrefixoServidor +'PESSOA PESS,  ' +
                   Sistema.PrefixoServidor +'LOTEXDOCUM LOTEX, ' +
                   Sistema.PrefixoServidor +'LOTEPAGTO LOTEPAG '+
                   ' WHERE   1=2';
  FazQuery(qrylotexdocum,sSql);

end;



procedure TFrmAlteraLote.bbtnincluirClick(Sender: TObject);
var
   i : integer;
begin
  inherited;
  if (Sistema.UsaRAD) and (Modulo.ProcessoRadLiberado(qryLotePagto.FieldByName('NUMLOTE').AsInteger)) then
  begin
    Msgdlg('Este lote já foi autorizado. Não é possível inserir documentos no mesmo.','Aviso',mterror,[mbOk],0);
    Exit;
  end;

  If Trim(dblkcmbloteIni.Text) = '' Then   Exit;
  if (dbgrdDocumentos.SelectedList.count)>0 then
      begin
          bbtnincluir.enabled := false;
          qrydocumentos.DisableControls;
          qrylotexdocum.DisableControls;

          for i:=0 to (dbgrdDocumentos.SelectedList.count-1) do
              begin
                   dbgrdDocumentos.datasource.dataset.GotoBookmark(dbgrdDocumentos.SelectedList.items[i]);
                   dbgrdDocumentos.datasource.dataset.FreeBookmark(dbgrdDocumentos.SelectedList.items[i]);

                   qrylotexdocum.insert;
                   qrylotexdocum.FieldByName('NUMLOTE').AsInteger          := strtoint(dblkcmbloteIni.text);
                   qrylotexdocum.FieldByName('CODDOCUMENTO').ASinteger     := qryDocumentos.FieldByName('CODDOCUMENTO').Asinteger;
                   qrylotexdocum.FieldByName('NODOCUMENTO').AsFloat        := qryDocumentos.FieldByName('NODOCUMENTO').AsFloat;
                   qrylotexdocum.FieldByName('COMPLDOCUMENTO').AsString    := qryDocumentos.FieldByName('COMPLDOCUMENTO').AsString;
                   qrylotexdocum.FieldByName('DATAPROGRAMADA').AsDateTime  := qryDocumentos.FieldByName('DATAPROGRAMADA').AsDateTime;
                   qrylotexdocum.FieldByName('DATAVENCTO').AsDateTime      := qryDocumentos.FieldByName('DATAVENCTO').AsDateTime;
                   qrylotexdocumVALOR.AsFloat := qryDocumentosSALDO.AsFloat;
                   qrylotexdocum.FieldByName('NOME').Asstring            := qryDocumentos.FieldByName('NOME').Asstring ;
                   qrylotexdocum.Post;
                   qrydocumentos.delete;
              end;

          dbgrdDocumentos.SelectedList.clear;
          qrydocumentos.EnableControls;
          qrylotexdocum.EnableControls;

          bbtnConfirma.Enabled := True;
      end;
end;

procedure TFrmAlteraLote.dbgrdDocumentosMultiSelectRecord(Grid: TwwDBGrid;
  Selecting: Boolean; var Accept: Boolean);
begin
  inherited;
  if  ((dbgrdDocumentos.SelectedList.count>0) or (dbgrdDocumentos.SelectedList.count = 0)) then
      begin
         bbtnIncluir.enabled    := true;
         bbtnConfirma.enabled   := true;
         bbtnExcluir.enabled    := false;
         BtnCancela.enabled     := true;
     end;



end;

procedure TFrmAlteraLote.bbtnExcluirClick(Sender: TObject);
var
  i: integer;
begin
  inherited;
  if (dbgrdLotePagto.SelectedList.count)>0 then
      begin

          bbtnExcluir.enabled := false;
          for i:=0 to (dbgrdLotePagto.SelectedList.count-1) do
              begin
                  dbgrdLotePagto.datasource.dataset.GotoBookmark(dbgrdLotePagto.SelectedList.items[i]);
                  dbgrdLotePagto.datasource.dataset.FreeBookmark(dbgrdLotePagto.SelectedList.items[i]);


                  // insere novamente documento nas pendencias
                  qrydocumentos.insert;
                  qrydocumentos.FieldByName('CODDOCUMENTO').AsInteger     := qryLoteXDocum.FieldByName('CODDOCUMENTO').AsInteger;
                  qrydocumentos.FieldByName('NODOCUMENTO').AsFloat        := qryLoteXDocum.FieldByName('NODOCUMENTO').AsFloat;
                  qrydocumentos.FieldByName('COMPLDOCUMENTO').AsString    := qryLoteXDocum.FieldByName('COMPLDOCUMENTO').AsString;
                  qrydocumentos.FieldByName('DATAPROGRAMADA').AsDateTime  := qryLoteXDocum.FieldByName('DATAPROGRAMADA').AsDateTime;
                  qrydocumentos.FieldByName('DATAVENCTO').AsDateTime      := qryLoteXDocum.FieldByName('DATAVENCTO').AsDateTime ;
                  qrydocumentos.FieldByName('SALDO').AsFloat              := qryLoteXDocum.FieldByName('VALOR').AsFloat;
                  qrydocumentos.FieldByName('NOME').AsString              := qryLoteXDocum.FieldByName('NOME').AsString;
                  qrydocumentos.Post;
                  qrylotexdocum.Delete;

              end;  { for }
       dbgrdLotePagto.SelectedList.clear; // Limpa selecao no grid

       if qrylotexdocum.RecordCount=0 then
           begin
              // lote fica vazio entao e deletado
              qryLotePagto.delete;
           end;
        bbtnConfirma.Enabled := True;
      end;


end;

procedure TFrmAlteraLote.Calcula_saldo;
var
   icodigo                 : integer;
   rsaldo,rSaldoOutraMoeda : real;
begin

  if not qryDocumentos.eof then
     while not(qryDocumentos.EOF) do
           begin
                rsaldo           := 0;
                rsaldooutramoeda := 0;
                icodigo:=qryDocumentos.FieldByName('CODDOCUMENTO').Asinteger;
                Documento.Saldo.GetSaldoDoc(icodigo,'',IntegraBack.RecPag,rSaldo,rSaldoOutraMoeda);

                if Format('%17.2f',[rSaldo]) <> Format('%17.2f',[Modulo.ValorZero]) then
                   begin
                       qryDocumentos.edit;
                       qryDocumentos.FieldByName('SALDO').AsFloat:=rSaldo;
                       qryDocumentos.post;
                       qryDocumentos.Next;
                   end
                else
                   qryDocumentos.Delete;
           end;
end;


procedure TFrmAlteraLote.bbtnConfirmaClick(Sender: TObject);
begin
  inherited;
  bbtnIncluir.enabled      := False;
  bbtnExcluir.enabled      := False;
  bbtnConfirma.enabled     := False;
  BtnCancela.enabled       := False;
  bbtnSelecionaDoc.enabled := True;
  dtmBaseDados.dbBaseDados.StartTransaction;
  try
    dtmBaseDados.dbBaseDados.ApplyUpdates([qryLotexDocum]);

    If Not Sistema.GravaLogOperacoes('Alteracao de Lote') Then
       Raise
            Exception.Create('Não Consegui Gravar o Log');

    dtmBaseDados.dbBaseDados.Commit;
    Msgdlg('Lote alterado com sucesso ','Atenção!',mtInformation,[mbOk],0);

  except
     if dtmBaseDados.dbBaseDados.InTransaction then   dtmBaseDados.dbBaseDados.Rollback;
  raise;
  end;
end;




procedure TFrmAlteraLote.dbgrdLotePagtoMultiSelectRecord(Grid: TwwDBGrid;
  Selecting: Boolean; var Accept: Boolean);
begin
  inherited;
  if  ((dbgrdLotePagto.SelectedList.count>0) or (dbgrdLotePagto.SelectedList.count = 0)) then
      begin
         bbtnConfirma.enabled   := true;
         bbtnExcluir.enabled    := true;
         bbtnIncluir.enabled    := false;
         BtnCancela.enabled     := true;
     end;
end;

procedure TFrmAlteraLote.dblkcmbloteIni1CloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
Var sqllotexdocum: String;
begin
  inherited;
  If dblkcmbloteIni.Text = '' Then Exit;

  sqllotexdocum:=  ' SELECT   PESS.NOME,                               '+
                   ' DOC.DATAPROGRAMADA,                               '+
                   ' DOC.IDPESSOA,                                     '+
                   ' DOC.DATAVENCTO,                                   '+
                   ' DOC.NoDOCUMENTO,                                  '+
                   ' DOC.COMPLDOCUMENTO,                               '+
                   ' DOC.CODDOCUMENTO,                                 '+
                   ' DOC.OPERACAO,                                     '+
                   ' LOTEPAG.FLAGEMISSAO,                              '+
                   ' LOTEX.VALOR,                                      '+
                   ' LOTEX.NUMLOTE,                                    '+
                   ' LOTEX.FLGBAIXA                                    '+
                   ' FROM  ' +
                   Sistema.PrefixoServidor +'DOCUMENTO DOC, ' +
                   Sistema.PrefixoServidor +'PESSOA PESS, ' +
                   Sistema.PrefixoServidor +'LOTEXDOCUM LOTEX, '+
                   Sistema.PrefixoServidor +'LOTEPAGTO LOTEPAG '+
                  ' where  DOC.IDPESSOA = '+InttoStr(Sistema.IdEmpresa) + ' AND '+
                   '       DOC.RECPAG = ''' + IntegraBack.RecPag +''''               + ' AND '+
                   '       LOTEX.NUMLOTE       = ' + dblkcmbloteIni.Text    + ' AND '+
                   '       LOTEX.FLGBAIXA IS NULL                               AND '+
                   '       DOC.IDFORCLI = PESS.IDPESSOA                         AND '+
                   '       lotex.numlote = lotepag.numlote                      AND '+
                   '       LOTEX.CODDOCUMENTO = DOC.CODDOCUMENTO                    ';
  FazQuery(qrylotexdocum,sqllotexdocum);
end;

procedure TFrmAlteraLote.BtnCancelaClick(Sender: TObject);
begin
  inherited;
  bbtnIncluir.enabled      := false;
  bbtnExcluir.enabled      := false;
  bbtnConfirma.enabled     := false;
  BtnCancela.enabled     := false;
  bbtnSelecionaDoc.enabled := true;

  if dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.Rollback;

  qryLoteXDocum.Close;
  qryLoteXDocum.Open;

  qryDocumentos.Close;
  qryDocumentos.Open;

end;

procedure TFrmAlteraLote.dbgrdDocumentosCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  If (Not (Sender As TwwDbGrid).DataSource.DataSet.IsEmpty) And
     ((Sender As TwwDbGrid).DataSource.DataSet.FieldByName('DATAPROGRAMADA').AsDateTime < Date) Then
  Begin
    if (Field.FieldName='SALDO') OR
       (Field.FieldName='VALOR') Then
       begin
         AFont.Color:= $0080FFFF;
         ABrush.Color:=ClRed;
       end;
  End
  Else
  if (Field.FieldName='SALDO') OR (Field.FieldName='VALOR') then
    begin
      AFont.Color:=clNavy;
      ABrush.Color:=$0080FFFF;{Amarelo claro}
    end;
end;

end.

