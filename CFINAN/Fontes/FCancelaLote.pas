(*******************************************************************************
 11/02/1999
  Exclusão do lançamento no financeiro caso o momento de lançamento
  seja na emissão do Lote
 06/04/1999
  Inicialização da faixa de datas de emissão do lote com a data do dia
 30/04/1999
  Correção do Falta expressão na abertura do form
 08/10/1999 - 2.13.15
  Exclusão/Estorno da contabilização do cheques emitidos com o parâmetro de
  contabiliza emissão de cheques;
 19/01/2000 - 02.16.02
  Alterações no Layout;
 24/01/2000 - 02.16.03
  Implementação do cancelamento do procesos no RAD no momento do cancelamento
  do lote
 08/02/2000 - 2.17.05
  Implementação da exclusão dos impostos/agregados retidos na baixa do documento
 *******************************************************************************)

unit FCancelaLote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Grids, Wwdbigrd,
  Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc,Udocumento,UMensErro, uSistema,
  TB97Tlbr, IvDictio, IvMulti, IvEMulti, uIntegraBack, fcOutlookList, uImpostoRetido,
  fcButton, fcImgBtn, fcShapeBtn, fcClearPanel, fcButtonGroup, fcOutlookBar,
  ImgList, wwdbdatetimepicker, CMDateTimePicker;

type
  TCancelaLoteError =Exception;

  TFrmCancelaLote = class(TfrmSairAjuda)
    Panel1: TPanel;
    Panel2: TPanel;
    dbgrdLotePagto: TwwDBGrid;
    DsGrid: TwwDataSource;
    QryGrid: TwwQuery;
    qryLotePagto: TwwQuery;
    QryUnid: TwwQuery;
    dsdoc: TwwDataSource;
    Qrydoc: TwwQuery;
    qryAux: TwwQuery;
    qryParamCAP: TwwQuery;
    Dbgrdlote: TwwDBGrid;
    dsLote: TwwDataSource;
    Pnldocpago: TPanel;
    Panel5: TPanel;
    QryGridNOME: TStringField;
    QryGridDATAPROGRAMADA: TDateTimeField;
    QryGridIDPESSOA: TFloatField;
    QryGridDATAVENCTO: TDateTimeField;
    QryGridNODOCUMENTO: TFloatField;
    QryGridCOMPLDOCUMENTO: TStringField;
    QryGridCODDOCUMENTO: TFloatField;
    QryGridOPERACAO: TStringField;
    QryGridPLANO: TFloatField;
    QryGridPLACONTA: TStringField;
    QryGridCODCENTROCUSTO: TStringField;
    QryGridFLAGEMISSAO: TStringField;
    QryGridCODLANCFINANC: TFloatField;
    QryGridVALOR: TFloatField;
    QryGridNUMLOTE: TFloatField;
    QryGridFLGBAIXA: TStringField;
    Panel3: TPanel;
    FobCancela: TfcOutlookBar;
    LstGerados: TfcOutlookList;
    PageGerados: TfcShapeBtn;
    Lstcancelados: TfcOutlookList;
    PageCancelados: TfcShapeBtn;
    ImlLotes: TImageList;
    Panel4: TPanel;
    Label2: TLabel;
    DlIni: TCMDateTimePicker;
    Label1: TLabel;
    DlFim: TCMDateTimePicker;
    qryLotePagtoNUMLOTE: TFloatField;
    qryLotePagtoCODLANCFINANC: TFloatField;
    qryLotePagtoIDUSUARIOINCLUSAO: TFloatField;
    qryLotePagtoDATAEMISSAO: TDateTimeField;
    qryLotePagtoNUMCHQBORDERO: TStringField;
    qryLotePagtoFAVORECIDO: TStringField;
    qryLotePagtoFLAGEMISSAO: TStringField;
    qryLotePagtoCODPORTFORMA: TFloatField;
    qryLotePagtoFLAGCANCEL: TStringField;
    qryLotePagtoIDPESSOA: TFloatField;
    qryLotePagtoOBSERVACAO: TStringField;
    qryLotePagtoPLNCODIGO: TFloatField;
    qryLotePagtoIDPROCESSO: TFloatField;
    QryGridNUMLANCTO: TFloatField;
    QryExcluiImposto: TwwQuery;
    QrySelecionaImposto: TwwQuery;
    qryvalida: TwwQuery;
    QryNumlancto: TwwQuery;
    QryNumlanctoNUMLANCTO: TFloatField;
    QryNumlanctoDEBCRE: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DbgrdloteMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure fcOutlookBar1OutlookList1Items0Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList1Items1Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items1Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure FobCancelaChange(ButtonGroup: TfcCustomButtonGroup;
      OldSelected, Selected: TfcButtonGroupItem);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    sSqlIntegraContab, sFLAGEMISSAO, sNUMLOTE: String;
    ImpostoRetidoCanc :TImpostoRetido;
    procedure limpa_tela;
    Procedure baixa_lotex_pagto;
    Procedure baixa_lote_pagto;
    Procedure exclui_lotex_pagto;
    Procedure selecionadoc;
    procedure regera_lote;
    procedure selecionalote;
    procedure ExcluiContabEmissao;
    procedure GetNumLancto(iCodDocumento: Integer; var iNumLancto: Integer;
      var sDebCre: String);
  public
    { Public declarations }
  protected
    iNumSeqLote: real;
  end;

var
  FrmCancelaLote: TFrmCancelaLote;

implementation

uses DBaseDados,Uautorizacao, UDataBase, uModulo, uLancFinanc, uLancContab;

{$R *.DFM}

procedure TFrmCancelaLote.FormActivate(Sender: TObject);
var
  sqlParamcap,sqlunid : string;
begin
  inherited;
  If IntegraBack.Contabilidade = 'S' Then
     sSqlIntegraContab := '(PLACONTA is not null) and '
  Else
     sSqlIntegraContab := '';

  sqlParamcap:= ' SELECT INTEGRACONTAB FROM PARAMCAP ' +
                ' WHERE IDPESSOA = '+InttoStr(Sistema.IdEmpresa) +
                ' AND RECPAG = ''' + IntegraBack.RecPag +'''';

  sqlunid    := 'Select * from ParamGlobal where idPessoa = '+ IntToStr(Sistema.idEmpresa);

  FazQuery(qryParamCap,sqlParamcap);
  FazQuery(Qryunid,sqlunid);
end;

procedure TFrmCancelaLote.limpa_tela;
Begin
  If qryLotePagto.Active Then qryLotePagto.Close;
  qryLotePagto.Sql.Text := 'SELECT ' +
                           '  LOTEPAGTO.NUMLOTE, LOTEPAGTO.CODLANCFINANC, ' +
                           '  LOTEPAGTO.IDUSUARIOINCLUSAO,LOTEPAGTO.DATAEMISSAO, ' +
                           '  LOTEPAGTO.NUMCHQBORDERO,LOTEPAGTO.FAVORECIDO, ' +
                           '  LOTEPAGTO.FLAGEMISSAO,LOTEPAGTO.CODPORTFORMA ,LOTEPAGTO.FLAGCANCEL, ' +
                           '  LOTEPAGTO.IDPESSOA,LOTEPAGTO.OBSERVACAO, LOTEPAGTO.PLNCODIGO,  LOTEPAGTO.IDPROCESSO ' +
                           'FROM ' +
                           '  LOTEPAGTO, LOTEXDOCUM LOTEX, DOCUMENTO DOC ' +
                           'WHERE ' +
                           '  1=2 ';
  qryLotePagto.Open;


  If QryGrid.Active Then QryGrid.Close;
  QryGrid.Sql.Text := ' SELECT   PESS.NOME,                               '+
                      ' DOC.DATAPROGRAMADA,                               '+
                      ' DOC.IDFORCLI AS IDPESSOA,                         '+
                      ' DOC.DATAVENCTO,                                   '+
                      ' DOC.NoDOCUMENTO,                                  '+
                      ' DOC.COMPLDOCUMENTO,                               '+
                      ' DOC.CODDOCUMENTO,                                 '+
                      ' DOC.OPERACAO,                                     '+
                      ' DOC.PLANO , DOC.PLACONTA,  DOC.CODCENTROCUSTO,    '+
                      ' LOTEPAG.FLAGEMISSAO, LOTEPAG.CODLANCFINANC,       '+
                      ' LOTEX.VALOR,                                      '+
                      ' LOTEX.NUMLOTE,                                    '+
                      ' LOTEX.FLGBAIXA,                                   '+
                      ' LANC.NUMLANCTO                                    '+
                      ' FROM  DOCUMENTO DOC,PESSOA PESS, LOTEXDOCUM LOTEX, LOTEPAGTO LOTEPAG,   LANCTODOCUM LANC '+
                      ' WHERE  1=2';
  QryGrid.Open;
end;

procedure TFrmCancelaLote.FormCreate(Sender: TObject);
begin
  inherited;
  visible:=false;
  windowstate:=wsMaximized;
  visible:=true;

  limpa_tela;

  DlIni.Date := Date;
  DlFim.Date := Date;

  FobCancela.ActivePage := PageGerados;

  ImpostoRetidoCanc := TImpostoRetido.Create;
end;

Procedure TFrmCancelaLote.baixa_lotex_pagto;
var
  sSql : string;
Begin
  sSql := 'UPDATE DOCUMENTO SET EMISBLOQ = NULL WHERE CODDOCUMENTO = '  +
          QryGridCODDOCUMENTO.AsString;
  ExecutarQuery(qryAux,sSQL);

  sSql := 'UPDATE LOTEXDOCUM SET FLGBAIXA= ''C'' WHERE CODDOCUMENTO = '  +
          QryGridCODDOCUMENTO.AsString;
  ExecutarQuery(qryAux,sSQL);

  If QryGridOPERACAO.AsString = '10' Then
     Documento.EmiteLancaBaixa(QryGridCODDOCUMENTO.AsInteger,False);
End;

Procedure TFrmCancelaLote.Exclui_lotex_pagto;
Var
  sSql: String;
Begin
  sSql := 'UPDATE DOCUMENTO SET EMISBLOQ = NULL WHERE CODDOCUMENTO = '  +
          QryGridCODDOCUMENTO.AsString;
  ExecutarQuery(qryAux,sSQL);

  sSql := 'DELETE LOTEXDOCUM WHERE CODDOCUMENTO = '
          + QryGridCODDOCUMENTO.AsString +
          ' AND NUMLOTE = ' + sNUMLOTE;
  ExecutarQuery(qryAux,sSQL);
End;

Procedure TFrmCancelaLote.baixa_lote_pagto;
var
  iCodLancFinanc: Integer;
Begin
  if sFLAGEMISSAO = '1' THEN
  begin
    If Not ExecutarQuery(qryAux,'UPDATE LOTEPAGTO SET FLAGCANCEL = ''C'',CODLANCFINANC = NULL, PLNCODIGO = NULL WHERE NUMLOTE = ' + sNUMLOTE) Then
      raise TCancelaLoteError.Create('Erro ao atualizar o Lote como baixado');
  end
  else
  Begin
    If Not ExecutarQuery(qryAux,'DELETE LOTEPAGTO WHERE (NUMLOTE = ' + sNUMLOTE + ')') Then
       raise TCancelaLoteError.Create('Erro ao exclui lote');
  End;

  //maria
  If Not ExecutarQuery(qryAux,'update documento set numslip=null where coddocumento in (select coddocumento from lotexdocum  where numlote='+sNUMLOTE +' )') Then
    raise TCancelaLoteError.Create('Erro ao atualizar o numslip do documento emitido');

  If Not qryLotePagtoIDPROCESSO.IsNull Then
    If Not ExecutarQuery(qryAux,'UPDATE RADINSTPROCESSO SET FLGOK = ''R'' WHERE (IDPROCESSO = ' + IntToStr(qryLotePagtoIDPROCESSO.AsInteger) + ')') Then
      raise TCancelaLoteError.Create('Erro ao atualizar processo referente ao Lote no RAD');
  QryGrid.first;
  If (Not QryGrid.FieldByname('CODLANCFINANC').IsNull) Then
  Begin
    iCodLancFinanc := QryGrid.FieldByname('CODLANCFINANC').AsInteger;

    If Modulo.EstornaFinanc Then
      LancFinanc.EstornoFinanceiro(DateToStr(Date),'S',iCodLancFinanc,0)
    Else
      LancFinanc.ExcluiFinanceiro(iCodLancFinanc);

    If iCodLancFinanc = - 1 Then
      raise TCancelaLoteError.Create('Erro ao cancelar\estornar lançamento no financeiro');
  End;
End;

Procedure TFrmCancelaLote.selecionadoc;
var
  sqlGrid, sSql : string;
Begin
  sqlGrid       := ' SELECT   PESS.NOME,                               '+
                   ' DOC.DATAPROGRAMADA,                               '+
                   ' DOC.IDFORCLI AS IDPESSOA,                         '+
                   ' DOC.DATAVENCTO,                                   '+
                   ' DOC.NoDOCUMENTO,                                  '+
                   ' DOC.COMPLDOCUMENTO,                               '+
                   ' DOC.CODDOCUMENTO,                                 '+
                   ' DOC.OPERACAO,                                     '+
                   ' DOC.PLANO , DOC.PLACONTA,  DOC.CODCENTROCUSTO,    '+
                   ' LOTEPAG.FLAGEMISSAO, LOTEPAG.CODLANCFINANC,       '+
                   ' LOTEX.VALOR,                                      '+
                   ' LOTEX.NUMLOTE,                                    '+
                   ' LOTEX.FLGBAIXA,                                   '+
                   ' LANC.NUMLANCTO                                    '+
                   ' FROM  DOCUMENTO DOC,PESSOA PESS, LOTEXDOCUM LOTEX, LOTEPAGTO LOTEPAG, LANCTODOCUM LANC '+
                   ' WHERE  ' + sSql +
                   '       (DOC.IDPESSOA = '+InttoStr(Sistema.IdEmpresa) + ') AND '+
                   '       (DOC.RECPAG = ''' + IntegraBack.RecPag + ''') AND '+
                   sSqlIntegraContab +


                   'doc.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
                         IntegraBack.RecPag+''' and not exists  (select 1 from UsuarioxTpdocto b where recpag='+#39+integraback.recpag+#39+' and b.idusuario=' +
                         inttostr(sistema.IdUsuario)+') union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
                         IntegraBack.RecPag+ '''  and exists (select 1 from UsuarioxTpdocto b where recpag='+#39+integraback.recpag+#39+' and a.codtipdoc=b.codtipdoc and b.idusuario=' +
                         inttostr(sistema.idusuario)+')) and '  +

                   '       (LOTEX.NUMLOTE    = ' + qryLotePagto.FieldByName('NUMLOTE').AsString + ')  AND ' +
                   '       ((LOTEX.FLGBAIXA     IS NULL) OR (LOTEX.FLGBAIXA <> ''B'')) AND '+
                   '       (LOTEPAG.NUMLOTE = LOTEX.NUMLOTE) AND ' +
                   '       (DOC.IDFORCLI = PESS.IDPESSOA) AND ' +
                   '       (LANC.CODDOCUMENTO = DOC.CODDOCUMENTO) AND ' +
                   '       (LANC.OPERACAO = DOC.OPERACAO) AND ' +
                   '       (LANC.ESTORNO IS NULL) AND ' +
                   '       (LOTEX.CODDOCUMENTO = DOC.CODDOCUMENTO) ';
  FazQuery(qryGrid,sqlGrid);
End;

Procedure TFrmCancelaLote.Regera_lote;
var
   sDebCre, sValorsemVirgula, sSql, sSqlInc : string;
   iNumLancto, iPosVirgula: Integer;
begin
 with qryAux do
      begin
          Close;
          sSqlInc := '';
          sSql := '';

          sSql := 'UPDATE LOTEPAGTO SET FLAGCANCEL = ''R'', PLNCODIGO = NULL WHERE NUMLOTE = ' + qryLotePagto.FieldByName('NUMLOTE').AsString;
          Sql.Text := sSql;
          ExecSQL;

          iNumSeqLote:= LeUltRegistro(nil,'LOTEPAGTO');

          sSql := 'INSERT INTO ' + Sistema.PrefixoServidor +
                  'LOTEPAGTO (NUMLOTE, ' +
                             'CODLANCFINANC, ' +
                             'IDUSUARIOINCLUSAO, ' +
                             'CODPORTFORMA, ' +
                             'DATAEMISSAO, ' +
                             'NUMCHQBORDERO, ' +
                             'FAVORECIDO, ' +
                             'FLAGCANCEL, ' +
                             'OBSERVACAO, ' +
                             'IDPESSOA) ' +
                  'Values( ' + FloatToStr(iNumSeqLote) + ', null, ' +
                  IntToStr(qryLotePagto.FieldByName('IDUSUARIOINCLUSAO').AsInteger) + ', ' +
                  IntToStr(qryLotePagto.FieldByName('CODPORTFORMA').AsInteger) + ', ' +
                  'TO_DATE(''' +  qryLotePagto.FieldByName('DATAEMISSAO').AsString
                  + ''',''DD/MM/YYYY''), ''' +
                  qryLotePagto.FieldByName('NUMCHQBORDERO').AsString + ''', ''' +
                  qryLotePagto.FieldByName('FAVORECIDO').AsString + ''', null, '''  +
                  qryLotePagto.FieldByName('OBSERVACAO').AsString + ''', '''  +
                  IntToStr(Sistema.IdEmpresa) + ''')';
          Sql.Text := sSql;
          ExecSQL;
      end;

      QryGrid.First;
      While Not QryGrid.Eof Do
      Begin
          sValorsemVirgula := qryGrid.FieldByName('VALOR').AsString;
          iPosVirgula := Pos(',',qryGrid.FieldByName('VALOR').AsString);
          If iPosVirgula <> 0 Then sValorSemvirgula[iPosVirgula] := '.';

          with qryAux do
               begin
                    Close;
                    sSqlInc := '';
                    sSql := '';
                    sSql := 'INSERT INTO LOTEXDOCUM(NUMLOTE,CODDOCUMENTO,VALOR) Values(';
                    sSqlInc := sSqlInc +FloatToStr(iNumSeqLote);
                    sSqlInc := sSqlInc + ','+ qryGrid.FieldByName('CODDOCUMENTO').AsString;
                    sSqlInc := sSqlInc + ', '+ sValorsemVirgula;
                    sSql    := sSql + sSqlInc  + ')';
                    Sql.Text := sSql;
                    ExecSQL;

                    GetNumLancto(qryGrid.FieldByName('CODDOCUMENTO').AsInteger,iNumLancto,sDebCre);

                    //Recálculo de Imposto ao regerar o lote
                    ImpostoRetidoCanc.NumLote           := iNumSeqLote;
                    ImpostoRetidoCanc.DataProgramada    := qryGrid.FieldByName('DATAPROGRAMADA').AsDateTime;
                    ImpostoRetidoCanc.OperacaoDocumento := qryGrid.FieldByName('OPERACAO').AsString;
                    ImpostoRetidoCanc.IdForCli          := qryGrid.FieldByName('IDPESSOA').AsInteger;
                    ImpostoRetidoCanc.CodDocumento      := qryGrid.FieldByName('CODDOCUMENTO').AsInteger;
                    ImpostoRetidoCanc.NumLancto         := iNumLancto;
                    ImpostoRetidoCanc.ValorLancto       := qryGrid.FieldByName('VALOR').AsFloat;
                    ImpostoRetidoCanc.ValorLiquido      := qryGrid.FieldByName('VALOR').AsFloat;
                    ImpostoRetidoCanc.DataLancto        := qryLotePagto.FieldByName('DATAEMISSAO').AsDateTime;
                    ImpostoRetidoCanc.DataEmissao       := qryLotePagto.FieldByName('DATAEMISSAO').AsDateTime;
                    ImpostoRetidoCanc.DebCre            := sDebCre;
                    ImpostoRetidoCanc.MomentoLancamento := mlBaixa;
                    ImpostoRetidoCanc.CodPortForma      := qryLotePagto.FieldByName('CODPORTFORMA').AsInteger;
                    ImpostoRetidoCanc.Incluir;
                    //Recálculo de Imposto ao regerar o lote

                    // ---- incluso no Park Avenue 11/11/98
                    sSql := 'UPDATE DOCUMENTO SET EMISBLOQ = NULL WHERE CODDOCUMENTO = ' + qryGrid.FieldByName('CODDOCUMENTO').AsString;
                    Sql.Text := sSql;
                    ExecSQL;
                    // -------------------------------------
               end;


          QryGrid.next;
      End;

end;



procedure TFrmCancelaLote.selecionalote;
var
  SqlLotePagto, ssql : string;
begin

   limpa_tela;

   if FobCancela.ActivePage = PageGerados then
      ssql := ' (lp.FLAGCANCEL = '' '' OR rtrim(lp.FLAGCANCEL) IS NULL ) AND '
   else
      ssql := ' (Lp.FLAGCANCEL = ''C'')                        AND ';

   If (DlIni.Text <> '')And (DlFim.Text <> '') Then
   begin
      sSQL := sSQL + ' (lp.DATAEMISSAO BETWEEN to_date('''+ DlIni.text+ ''',''dd/MM/yyyy'')  and  to_date(''' + DlFim.text + ''',''dd/MM/yyyy'')) AND ';

   end;
   SqlLotePagto := ' SELECT DISTINCT lp.NUMLOTE, lp.CODLANCFINANC,  '+
                   ' lp.IDUSUARIOINCLUSAO,lp.DATAEMISSAO,       '+
                   ' lp.NUMCHQBORDERO,lp.FAVORECIDO,      '+
                   ' lp.FLAGEMISSAO,lp.CODPORTFORMA ,lp.FLAGCANCEL,  '+
                   ' lp.IDPESSOA,lp.OBSERVACAO, lp.PLNCODIGO,  lp.IDPROCESSO'+
                   ' FROM LotePagto lp,LOTEXDOCUM LOTEX,DOCUMENTO DOC      '+
                   ',(select count(*) as totdocum , lp.numlote from lotepagto lp,lotexdocum ld , documento d where '+
                   '        D.RECPAG         = '''+ IntegraBack.RecPag +'''  AND '+sSQL+ ' lp.numlote=ld.numlote and '+
                   '       ((ld.FLGBAIXA     IS NULL) OR (ld.FLGBAIXA <> ''B'')) AND '+
                   '         ld.CODDOCUMENTO = D.CODDOCUMENTO group by lp.numlote  ) totdocum '+

                   ',(select count(*) as totdocum , lp.numlote from lotepagto lp,lotexdocum ld , documento d where '+
                   '        D.RECPAG         = '''+ IntegraBack.RecPag +'''  AND '+sSQL+ '  lp.numlote=ld.numlote and '+
                   '       ((ld.FLGBAIXA     IS NULL) OR (ld.FLGBAIXA <> ''B'')) AND '+
                   '         ld.CODDOCUMENTO = D.CODDOCUMENTO  and '+
                   '         d.codtipdoc in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
                         IntegraBack.RecPag+''' and not exists  (select 1 from UsuarioxTpdocto b where recpag='+#39+integraback.recpag+#39+' and b.idusuario=' +
                         inttostr(sistema.IdUsuario)+') union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
                         IntegraBack.RecPag+ '''  and exists (select 1 from UsuarioxTpdocto b where recpag='+#39+integraback.recpag+#39+' and a.codtipdoc=b.codtipdoc and b.idusuario=' +
                         inttostr(sistema.idusuario)+')) group by lp.numlote  ) totlote '+

                   ' WHERE       '+  ssql +
                   ' totlote.totdocum=totdocum.totdocum and '+
                   ' totlote.numlote=totdocum.numlote and   totlote.numlote=  lp.NUMLOTE and '+
                   '        lp.IDPESSOA = ' + InttoStr(Sistema.IdEmpresa) + ' AND '+
                   '        DOC.RECPAG         = '''+ IntegraBack.RecPag +'''                     AND '+
                   '       ((LOTEX.FLGBAIXA     IS NULL) OR (LOTEX.FLGBAIXA <> ''B'')) AND '+
                   '        lp.NUMLOTE  = LOTEX.NUMLOTE                           AND '+
                   '        LOTEX.CODDOCUMENTO = DOC.CODDOCUMENTO   ';


   FazQuery(qryLotePagto,SqlLotePagto);

   If Not qryLotePagto.IsEmpty Then selecionadoc;
end;



procedure TFrmCancelaLote.DbgrdloteMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  If qryLotePagto.IsEmpty Then Exit;

  selecionadoc;
end;

procedure TFrmCancelaLote.ExcluiContabEmissao;
Var
  liExercicio, liPeriodo, liEmpresa :Integer;
  sMens :String;
Begin
   If Not qryLotePagto.FieldByName('PLNCODIGO').isNull Then
   Begin
      If IntegraBack.EstornaContab = 'S' Then
      Begin
         liExercicio     := 0;
         liPeriodo       := 0;
         liEmpresa       :=Sistema.IdEmpresa;

         If (TestaPeriodo(True,'BASEDADOS',qryLotePagto.FieldByName('DATAEMISSAO').AsString,IntToStr(Sistema.IdModulo),liExercicio,
                         liPeriodo,liEmpresa,sMens) <> 0) Then raise TCancelaLoteError.Create(sMens);

         If (EstornaLanc(True,qryLotePagto.FieldByName('PLNCODIGO').AsInteger,
                    'BaseDados',qryLotePagto.FieldByName('DATAEMISSAO').AsString, liExercicio,
                    liPeriodo,Sistema.IdEmpresa,IntegraBack.MascaraPlano) = -1) Then raise TCancelaLoteError.Create('Erro ao estornar lançamento contábil da emissão do cheque');
      End
      Else
      Begin
         if (ExcluiLanc(True,qryLotePagto.FieldByName('PLNCODIGO').AsInteger,'BASEDADOS', IntToStr(Sistema.idModulo),
             IntegraBack.Plano, Sistema.IdEmpresa, Sistema.idUsuario, True,0,IntegraBack.MascaraPlano) <> 0) then raise TCancelaLoteError.Create('Erro ao excluir lançamento contábil da emissão do cheque');
      End;
   End;
End;

procedure TFrmCancelaLote.fcOutlookBar1OutlookList1Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  selecionalote;
end;

procedure TFrmCancelaLote.fcOutlookBar1OutlookList1Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  If (Not qryLotePagto.IsEmpty) And
     (Application.MessageBox('Confirma o cancelamento do Lote','Atenção',Mb_YesNo + Mb_IconQuestion) = Id_Yes) Then
  Begin
     Dbgrdlote.enabled  := false;

     Try
        StartTransacao;

        sFLAGEMISSAO := QryGridFLAGEMISSAO.AsString;
        sNUMLOTE := QryGridNUMLOTE.AsString;

        // by Carlos - 17/05/2001 - verifica se sNUMLOTE preenchida
        if sNUMLOTE = '' then
          raise TCancelaLoteError.Create('Erro: numero do lote em branco');

        QryGrid.First;

        while not QryGrid.eof do
        begin
           if QryGridFLAGEMISSAO.AsString =  '1' then
              baixa_lotex_pagto
           else
              exclui_lotex_pagto;

           ImpostoRetidoCanc.CodDocumento    := QryGridCODDOCUMENTO.AsInteger;
           //ImpostoRetidoCanc.NumLancto       := QryGridNUMLANCTO.AsInteger;
           //ImpostoRetidoCanc.NumLanctoOrigem := QryGridNUMLANCTO.AsInteger;
           ImpostoRetidoCanc.NumLancto       := 0;
           ImpostoRetidoCanc.NumLanctoOrigem := 0;
           ImpostoRetidoCanc.TipoExclusao    := teSoBaixa;
           ImpostoRetidoCanc.NumLote         := QryGridNUMLOTE.AsFloat;
           ImpostoRetidoCanc.NumLoteManual   := 0;
           ImpostoRetidoCanc.Excluir;

           QryGrid.next;
        end;
        
        QryGrid.first;
        baixa_lote_pagto;

        ExcluiContabEmissao;

        If Not Sistema.GravaLogOperacoes('Cancelamento de Lote') Then
          Raise
            Exception.Create('Não Consegui Gravar o Log');

        CommitTransacao;

        Dbgrdlote.SelectedList.clear;
        Dbgrdlote.enabled  := true;

        selecionalote;
     Except
       On E:Exception Do
       Begin
          RollbackTransacao;
          Msgdlg('O Lote não pode ser cancelado. ' + (#13+#10) + E.Message,'Aviso',mtError,[mbOk],0);
          Dbgrdlote.SelectedList.clear;
          Dbgrdlote.enabled  := true;
          selecionalote;
          Raise;
       End;
     End;
  End;

end;

procedure TFrmCancelaLote.fcOutlookBar1OutlookList2Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  QryGrid.first;
  while not QryGrid.eof do
  begin
     qryvalida.sql.clear;
     qryvalida.sql.add('select 1 from lotexdocum where coddocumento='+QryGrid.fieldbyname('coddocumento').asstring+
                       ' and numlote >'+QryGrid.fieldbyname('numlote').asstring);
     qryvalida.close;
     qryvalida.open;
     if not qryvalida.IsEmpty then
     begin
        Msgdlg('Existe documento deste lote em outro lote','Aviso',mterror,[mbOk],0);
        exit;
     end;
     QryGrid.next;
  end;

  QryGrid.first;
  If (Not qryLotePagto.IsEmpty) And
     (Application.MessageBox('Confirma que deseja regerar o lote','Atenção',Mb_YesNo + Mb_IconQuestion) = Id_Yes) Then
  Begin
     Try
       StartTransacao;

       Dbgrdlote.enabled := False;

       regera_lote;

       {Efetiva os documentos gerados no regera_lote}
       ImpostoRetidoCanc.NumLote := iNumSeqLote;
       ImpostoRetidoCanc.CodPortForma := qryLotePagto.FieldByName('CODPORTFORMA').AsInteger;
       ImpostoRetidoCanc.EfetivaNovoDocumento;

       If Not Sistema.GravaLogOperacoes('Alteracao de Lote') Then
          Raise
            Exception.Create('Não Consegui Gravar o Log');


       CommitTransacao;

       ImpostoRetidoCanc.CancelaAcumulaImposto;


       CommitTransacao;

       Dbgrdlote.SelectedList.clear;
       Dbgrdlote.enabled  := true;

       selecionalote;
     Except
       RollbackTransacao;
       Dbgrdlote.enabled           := True;
       Msgdlg('O Lote não pode ser regerado','Aviso',mterror,[mbOk],0);
     End;
  End;


end;


procedure TFrmCancelaLote.FobCancelaChange(
  ButtonGroup: TfcCustomButtonGroup; OldSelected,
  Selected: TfcButtonGroupItem);
begin
  inherited;
  limpa_tela;
end;

procedure TFrmCancelaLote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ImpostoRetidoCanc.Free;
end;

Procedure TFrmCancelaLote.GetNumLancto(iCodDocumento :Integer; Var iNumLancto :Integer; Var sDebCre :String);
Begin
  If QryNumlancto.Active       Then QryNumlancto.Close;
  If Not QryNumlancto.Prepared Then QryNumlancto.Prepare;
  QryNumlancto.ParamByName('CODDOCUMENTO').AsInteger := iCodDocumento;
  QryNumlancto.Open;
  iNumLancto := QryNumlanctoNUMLANCTO.AsInteger;
  sDebCre    := QryNumlanctoDEBCRE.AsString;
  QryNumlancto.Close;
End;

end.
