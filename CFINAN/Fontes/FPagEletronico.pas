(*******************************************************************************
 04/01/99
  Exclusão da Obrigatoriedade de alguns campos do boleto ( Ver CobrCm.Dpl )
 19/01/99
  Verificação da obrigatoriedade dos dados do endereço em função da Emissão de
  Aviso de pagamento;
 25/01/1999
  Implementação do parâmetro de lançamento no financeiro ( Módulo )
 05/02/1999
  Alterações Para o Layout das Cobranças/Pagamentos Unibanco
 22/06/1999
  Alteração no Filtro da Conta Corrente da Empresa Proprietária para selecionar
  a conta do Portador Forma.
 01/09/1999 - 02.13.02
  Alteração da consulta de endereços do cliente;
 04/10/1999 - 02.13.14
  Inclusão do campo tipoconta para validação da conta bancária de acordo com o tipo:
  poupança, conta corrente e pagamento;
  Inclusão da indicação da data para o lançamento no financeiro;
 15/10/1999 - 02.14.03
  Correção da data indicada para a gravação da emissão do arquivo
 07/01/2000 - 02.15.01
  Implementação do processo do RAD de controle de pagamentos
 31/01/2000 - 2.16.06
  Correção da validação da autorização do processo RAD associado ao LOTE
 03/04/00 Codigo barras para cada documento
*******************************************************************************)

unit FPagEletronico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Db, DBTables,
  Wwquery,   uAutorizacao, uSistema, Grids, Wwdbigrd, uIntegraBack,
  Wwdbgrid, DBCtrls, Wwdatsrc, uMensErro, TB97Tlbr, IvDictio, IvMulti,
  IvEMulti, wwdblook, CMDBLookupCombo, wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmPagEletronico = class(TfrmOkCancelar)
    SrcLabel: TLabel;
    SrcList: TListBox;
    ExcAllBtn: TSpeedButton;
    ExcludeBtn: TSpeedButton;
    IncAllBtn: TSpeedButton;
    IncludeBtn: TSpeedButton;
    DstLabel: TLabel;
    DstList: TListBox;
    qryLotePagto: TwwQuery;
    PnlCodigodeBarras: TPanel;
    EdtBarras: TEdit;
    EdtRepBarras: TEdit;
    Label2: TLabel;
    wwDBGrid1: TwwDBGrid;
    Label3: TLabel;
    Label4: TLabel;
    DBNavigator1: TDBNavigator;
    QryLoteDoc: TwwQuery;
    DsQryLoteDoc: TwwDataSource;
    QryAtualizaBarras: TwwQuery;
    QryLoteDocNUMLOTE: TFloatField;
    QryLoteDocNODOCUMENTO: TFloatField;
    QryLoteDocVALOR: TFloatField;
    QryLoteDocCODDOCUMENTO: TFloatField;
    ChkDoc: TCheckBox;
    QryLoteDocCODBARRA: TStringField;
    QryLoteDocCODBARRAVALOR: TStringField;
    LblRemessa: TLabel;
    QryDocumentos: TwwQuery;
    QryPortadorForma: TwwQuery;
    QryDocumentosIDPESSOA: TFloatField;
    QryDocumentosNOME: TStringField;
    QryDocumentosRAZAOSOCIAL: TStringField;
    QryDocumentosNUMDOCUMENTO: TStringField;
    QryDocumentosCONTACORRENTE: TStringField;
    QryDocumentosNUMAGENCIA: TStringField;
    QryDocumentosLOGRADOURO: TStringField;
    QryDocumentosNUMERO: TStringField;
    QryDocumentosCOMPLEMENTO: TStringField;
    QryDocumentosBAIRRO: TStringField;
    QryDocumentosCEP: TStringField;
    QryDocumentosIDFORCLI: TFloatField;
    QryDocumentosCODDOCUMENTO: TFloatField;
    QryDocumentosVALOR: TFloatField;
    QryDocumentosVALORDESCONTO: TFloatField;
    QryDocumentosVALORJUROS: TFloatField;
    QryDocumentosDATAVENCTO: TDateTimeField;
    QryDocumentosDATAPROGRAMADA: TDateTimeField;
    QryDocumentosTIPOMOEDA: TFloatField;
    QryDocumentosNUMLOTE: TFloatField;
    QryDocumentosCODPORTFORMA: TFloatField;
    QryDocumentosCODFORMAPAGTO: TFloatField;
    QryDocumentosCODTIPOPAGTO: TFloatField;
    QryDocumentosFLGEMITEAVISO: TStringField;
    QryDocumentosCODARQUIVOREMESSA: TFloatField;
    QryDocumentosIDBANCO: TFloatField;
    QryDocumentosNOCONTACORR: TStringField;
    QryDocumentosCODBARRA: TStringField;
    QryDocumentosCODBARRAVALOR: TStringField;
    C: TFloatField;
    QryDocumentosCOMPLDOCUMENTO: TStringField;
    QryDocumentosTIPO: TStringField;
    BtnIncluiBarras: TBitBtn;
    QryDocumentosCODBANCOFAVORECIDO: TStringField;
    QryDocumentosNUMEMPRESABANCO: TStringField;
    QryDocumentosDEBCRE: TStringField;
    QryModelosCnab: TwwQuery;
    CmbModeloCnab: TCMDBLookupCombo;
    QryModelosCnabIDMODELOSCNAB: TFloatField;
    QryModelosCnabDESCRICAO: TStringField;
    QryLoteDocCODPORTFORMA: TFloatField;
    QryDocumentosCIDADE: TStringField;
    QryDocumentosCODESTADO: TStringField;
    QryDocumentosNOMEAGENCIA: TStringField;
    QryDocumentosTIPOCONTA: TStringField;
    RgEmisLote: TRadioGroup;
    DtEmis: TCMDateTimePicker;
    QryDocumentosCODPORTADOR: TFloatField;
    QryDocumentosLIVRE: TStringField;
    procedure IncludeBtnClick(Sender: TObject);
    procedure ExcludeBtnClick(Sender: TObject);
    procedure IncAllBtnClick(Sender: TObject);
    procedure ExcAllBtnClick(Sender: TObject);
    procedure MoveSelected(List: TCustomListBox; Items: TStrings);
    procedure SetItem(List: TListBox; Index: Integer);
    function  GetFirstSelection(List: TCustomListBox): Integer;
    procedure SetButtons;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure ChkDocClick(Sender: TObject);
    procedure DsQryLoteDocDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure BtnIncluiBarrasClick(Sender: TObject);
    procedure CmbModeloCnabCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure RgEmisLoteClick(Sender: TObject);
    procedure QryDocumentosCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    sSQL, sLostesSel:String;
    bExibeBarras :Boolean;
    procedure AtualizaBarras;
    procedure MontaQueryBoletos;    
  public
    { Public declarations }
  end;

var
  FrmPagEletronico: TFrmPagEletronico;

implementation

uses DBaseDados, uModulo, fAguarde, uFuncaoGeral,uIea, uDataBase, uLancFinanc,
  DDadosBancarios;

{$R *.DFM}

procedure TFrmPagEletronico.IncludeBtnClick(Sender: TObject);
var
  Index: Integer;
begin
  If (SrcList.selected[SrcList.ItemIndex]) And (Modulo.ProcessoRadLiberado(StrToInt(SrcList.Items[SrcList.ItemIndex]))) Then
  Begin
    Index := GetFirstSelection(SrcList);
    MoveSelected(SrcList, DstList.Items);
    SetItem(SrcList, Index);
  End;
end;

procedure TFrmPagEletronico.ExcludeBtnClick(Sender: TObject);
var
  I: Integer;
begin

  for I := 0 to DstList.Items.Count - 1 do
    SrcList.Items.AddObject(DstList.Items[I], DstList.Items.Objects[I]);
  DstList.Items.Clear;
  SetItem(DstList, 0);

 { MoveSelected(DstList, SrcList.Items);
  SetItem(DstList, Index); }
end;

procedure TFrmPagEletronico.IncAllBtnClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to SrcList.Items.Count - 1 do
  Begin

    If Not Modulo.ProcessoRadLiberado(StrToInt(SrcList.Items[I])) Then
    Begin
      MontaQueryBoletos;
      Break;
    End;

    DstList.Items.AddObject(SrcList.Items[I],SrcList.Items.Objects[I]);
  End;
  SrcList.Items.Clear;
  SetItem(SrcList, 0);
end;

procedure TFrmPagEletronico.ExcAllBtnClick(Sender: TObject);
var
 // I: Integer;
 Index:  Integer;
begin
  //DF 04/07 Gustavo
  //Exclusão do Hint - Value assigned to 'index' never used
  //Index := GetFirstSelection(DstList);
  //Fim DF 04/07 Gustavo

  If (DstList.selected[DstList.ItemIndex]) And (Modulo.ProcessoRadLiberado(StrToInt(DstList.Items[DstList.ItemIndex]))) Then
  Begin
    Index := GetFirstSelection(DstList);
    MoveSelected(DstList, SrcList.Items);
    SetItem(DstList, Index);
  End;
  {for I := 0 to DstList.Items.Count - 1 do
    SrcList.Items.AddObject(DstList.Items[I], DstList.Items.Objects[I]);
  DstList.Items.Clear;
  SetItem(DstList, 0); }
end;


procedure TFrmPagEletronico.MoveSelected(List: TCustomListBox; Items: TStrings);
var
  I: Integer;
begin
  for I := List.Items.Count - 1 downto 0 do
    if List.Selected[I] then
    begin
        Items.AddObject(List.Items[I], List.Items.Objects[I]);
        List.Items.Delete(I);
    end;
end;

procedure TFrmPagEletronico.SetButtons;
var
  SrcEmpty, DstEmpty: Boolean;
begin
  SrcEmpty           := SrcList.Items.Count = 0;
  DstEmpty           := DstList.Items.Count = 0;
  IncludeBtn.Enabled := not SrcEmpty;
  IncAllBtn.Enabled  := not SrcEmpty;
  ExcludeBtn.Enabled := not DstEmpty;
  ExCAllBtn.Enabled  := not DstEmpty;
end;

function TFrmPagEletronico.GetFirstSelection(List: TCustomListBox): Integer;
begin
  for Result := 0 to List.Items.Count - 1 do
    if List.Selected[Result] then Exit;
  Result := LB_ERR;
end;

procedure TFrmPagEletronico.SetItem(List: TListBox; Index: Integer);
var
  MaxIndex: Integer;
begin
  with List do
  begin
    SetFocus;
    MaxIndex := List.Items.Count - 1;
    if Index = LB_ERR then Index := 0
    else if Index > MaxIndex then Index := MaxIndex;
    Selected[Index] := True;
  end;
  SetButtons;
end;


procedure TFrmPagEletronico.bbtnConfirmarClick(Sender: TObject);
Var
  x,iCodLancFinanc: Integer;
  sNumChq, sDoc, sDataEmissao: String;
begin
  inherited;

  If (DstList.Items.Count = 0) Then Exit;

  sLostesSel := '';

  For x:=0 To DstList.Items.Count -1 Do
      sLostesSel := sLostesSel + DstList.Items[x] + ',';

  sLostesSel := Copy(sLostesSel,1,LengTh(sLostesSel)-1);

  sSql := 'SELECT L.NUMLOTE, D.NODOCUMENTO,L.VALOR, L.CODDOCUMENTO, L.CODBARRA, L.CODBARRAVALOR, LP.CODPORTFORMA ' +
          'FROM ' +
          'DOCUMENTO D, '     +
          'LOTEXDOCUM  L, '   +
          'PORTADORFORMA P, ' +
          'LOTEPAGTO LP '     +
          'WHERE ' +
          '   (L.NUMLOTE IN ('+ sLostesSel +'))  AND ' +
          '   (D.RECPAG = ''' + IntegraBack.RecPag + ''' ) AND ' +
          '   (P.CODFORMAPAGTO IN (' + iEaCm.CodigosBarra + ') Or P.CODARQUIVOREMESSA IN (' + iEaCm.ModeloCodigoBarra + '))  AND ' +
          '   ((L.CODBARRA IS NULL)              AND ' +
          '   (L.CODBARRAVALOR IS NULL))         AND ' +
          '   (LP.NUMLOTE = L.NUMLOTE)           AND ' +
          '   (LP.CODPORTFORMA = P.CODPORTFORMA) AND ' +
          '   (D.CODDOCUMENTO = L.CODDOCUMENTO)      ' +
          'ORDER BY D.NODOCUMENTO';
  FazQuery(QryLoteDoc,sSql);

  If bExibeBarras And not QryLoteDoc.IsEmpty Then
  Begin
     PnlCodigodeBarras.Visible := True;
     EdtBarras.Text            := QryLoteDocCODBARRA.AsString;
     EdtRepBarras.Text         := QryLoteDocCODBARRAVALOR.AsString;
     EdtBarras.SetFocus;
  // maria bExibeBarras := False;
     Exit;
  End;

  frmAguarde.Max := 100;
  frmAguarde.Min := 0;

  frmAguarde.Mostra('Verificando Dados...');

  bExibeBarras := True;

  frmAguarde.Pos := 5;

//  PnlCodigodeBarras.Visible := False;

  FazQuery(DtmBaseDados.Qry, 'SELECT CODPORTFORMA FROM LOTEPAGTO WHERE (NUMLOTE IN ('+ sLostesSel +'))');


  sSql := ' SELECT DISTINCT PC.CONTROLEREMESSA, PF.PATHARQUIVOREM, CODPORTFORMA, LANCAFINANC '+
          ' FROM PORTADORFORMA PF, PORTADORCONTA PC'+
          ' Where ' +
          ' (PC.CODPORTADOR = PF.CODPORTADOR) AND ' +
          ' (PF.RECPAG = ''' + IntegraBack.RecPag + ''') AND ' +
          ' (PF.IDPESSOA = '+ IntToStr(Sistema.idEmpresa)+ ') AND' +
          ' (PF.CODPORTFORMA = ' + DtmBaseDados.Qry.Fields[0].AsString + ') ';

  DtmBaseDados.Qry.Close;

  If IeaCm.ObrigaTipoPagto(IeaCm.IndiceDoBanco) Then
     sSql := sSql  + ' AND (CODTIPOPAGTO IS NOT NULL) ';

  If IeaCm.ObrigaFormaPagto(IeaCm.IndiceDoBanco) Then
     sSql := sSql  + ' AND (CODFORMAPAGTO IS NOT NULL) ';

  FazQuery(QryPortadorForma, sSql);

  If Ieacm.VerficaDadosEmpresa('P', QryPortadorForma.FieldByName('codportforma').AsInteger) Then
  Begin
     If QryDocumentos.Active Then QryDocumentos.Close;
     frmAguarde.Pos := 10;
     QryDocumentos.Sql.Text := 'SELECT DISTINCT ' +
                               ' PESS.IDPESSOA, PESS.NOME, PESS.RAZAOSOCIAL, ' +
                               ' DECODE(PESS.TIPO,''J'',DECODE(PESS.NUMDOCUMENTO,NULL,''00000000000000'',PESS.NUMDOCUMENTO),DECODE(PESS.NUMDOCUMENTO,NULL,''00000000000'',PESS.NUMDOCUMENTO)) AS NUMDOCUMENTO, ' +
                               //' C.CONTACORRENTE, BA.NUMBANCO AS CODBANCOFAVORECIDO, AG.NUMAGENCIA, ' +
                               ' E.LOGRADOURO, E.NUMERO, E.COMPLEMENTO, E.BAIRRO, CID.NOME AS CIDADE, ES.CODESTADO, ' +
                               ' E.CEP, DOC.IDFORCLI, DOC.CODDOCUMENTO, LOTEX.VALOR, ' +
                               ' DOC.VALORDESCONTO, DOC.VALORJUROS, DOC.DATAVENCTO, DOC.DATAPROGRAMADA, ' +
                               ' DOC.MOECODIGO AS TIPOMOEDA, LP.NUMLOTE, LP.CODPORTFORMA, PF.CODFORMAPAGTO, PF.CODTIPOPAGTO, ' +
                               ' PF.FLGEMITEAVISO, PF.CODARQUIVOREMESSA, PC.IDBANCO, PC.NOCONTACORR, ' +
                               ' LOTEX.CODBARRA, pf.codportador,LOTEX.CODBARRAVALOR, DOC.NODOCUMENTO, DOC.COMPLDOCUMENTO, PESS.TIPO, PF.NUMEMPRESABANCO, TD.DEBCRE , ''                         '' as livre ' + //', PAG.NOME AS NOMEAGENCIA, C.TIPOCONTA ' +
                               'FROM '+
                                     ' PESSOA PESS, TIPODOCRECPAG TD,' +
                                     //' PESSOA PAG, ' +
                                     ' DOCUMENTO DOC, LOTEPAGTO LP, LOTEXDOCUM LOTEX, PARAMCAP PAR, ' +
                                     ' PORTADORFORMA PF, PORTADORCONTA PC,  CIDADES CID, ESTADO ES, ' +
                                     ' ENDPESS E, ' +
                                     //' CONTABANCARIA C,
                                     ' MOEDA M ' +
                                     //', AGENCIABANCARIA AG, BANCO BA' +
                               'WHERE (FLAGEMISSAO IS NULL OR FLAGEMISSAO = ''0'')AND ' +
                                     '(LOTEX.NUMLOTE IN ('+ sLostesSel +'))  AND ' +
                                     '(LP.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa)+ ') AND ' +
                                     '(FLAGCANCEL IS NULL OR FLAGCANCEL = ''0'')  AND ' +
                                     '(DOC.RECPAG         = ''' + IntegraBack.RecPag + ''') ';

      If IeaCm.ObrigaTipoPagto(IeaCm.IndiceDoBanco) Then
         QryDocumentos.Sql.Text := QryDocumentos.Sql.Text  + 'AND  (PF.CODTIPOPAGTO IS NOT NULL) ';

      If IeaCm.ObrigaFormaPagto(IeaCm.IndiceDoBanco) Then
         QryDocumentos.Sql.Text := QryDocumentos.Sql.Text  + 'AND (PF.CODFORMAPAGTO IS NOT NULL) ';

      QryDocumentos.Sql.Text := QryDocumentos.Sql.Text +
                                     'AND (LP.CODPORTFORMA = PF.CODPORTFORMA)     AND ' +
                                     '(LP.NUMLOTE  = LOTEX.NUMLOTE)               AND ' +
                                     '(LOTEX.CODDOCUMENTO = DOC.CODDOCUMENTO)     AND ' +
                                     '(PAR.IDPESSOA = LP.IDPESSOA)                AND ' +
                                     '(DOC.IDFORCLI = PESS.IDPESSOA)              AND ' +
                                     '(DOC.CODTIPDOC = TD.CODTIPDOC)              AND ' +
                                     '(PF.CODPORTADOR = PC.CODPORTADOR)           AND ' +
                                     '(E.IDPESSOA(+) = PESS.IDPESSOA)             AND ' +
                                     '(E.IDENDERECO(+) = PESS.IDENDCOBRANCA )     AND ' +
                                     '(E.IDCIDADES = CID.IDCIDADES(+))            AND ' +
                                     '(ES.IDESTADO(+) = CID.IDESTADO)             ' +
                                     //Busca Conta Preferencial do favorecido do pagto
                                     //'(C.FLGCONTAPREF(+) = ''1'')                 AND ' +
                                     //'((C.IDPESSOA(+) = PESS.IDPESSOA)            AND ' +
                                     //'(C.IDAGENCIA = AG.IDPESSOA(+))              AND ' +
                                     //'(AG.IDBANCO  = BA.IDPESSOA(+)))             AND ' +
                                     //'(PAG.IDPESSOA(+) = AG.IDPESSOA) ' +
                               'ORDER BY PF.CODTIPOPAGTO, PF.CODFORMAPAGTO';
     QryDocumentos.Open;

     frmAguarde.Pos := 15;

     If Not IeaCm.ValidaRemessa('P',QryDocumentos,False) Then
     Begin
        If frmAguarde.Visible Then frmAguarde.Apaga;
        QryDocumentos.Close;
     End
     Else
     Begin
       QryDocumentos.Close;

       frmAguarde.Apaga;

       //Inicio do Pagamento
       try
         StartTransacao;

         If IeaCm.MontaPagamentoEletronico(QryModelosCnabIDMODELOSCNAB.AsInteger,
                                           QryPortadorForma.FieldByName('ControleRemessa').AsInteger,
                                           QryDocumentos,
                                           QryPortadorForma.FieldByName('PathArquivoRem').AsString) Then
         Begin
            If Not QryDocumentos.Active Then QryDocumentos.Open;

            sDoc       :=  '';

            QryDocumentos.Open;
            While not QryDocumentos.Eof Do
            Begin
              sDoc     := sDoc + QryDocumentos.FieldByName('COdDocumento').AsString + ',';
              QryDocumentos.Next;
            End;

            sDoc := Copy(sDoc,1,Length(sDoc)-1);

            If (sDoc <> '') Then
               If (Not ExecutarQuery(QryDocumentos,'UPDATE DOCUMENTO SET ' +
                                  'EMISBLOQ = ''S'' WHERE CODDOCUMENTO IN (' + sDoc + ')')) Then Abort;

            If sLostesSel <> '' Then
            Begin
               iCodLancFinanc := 0;
               For x:=0 To DstList.Items.Count -1 Do
               Begin
                 sNumChq := DstList.Items[x];

                 if IntegraBack.RecPag = 'P' then
                    sSql       := ' SELECT  (''D'') as DEBCRE, '
                 else
                    sSql       := ' SELECT  (''C'') as DEBCRE, ';

                 sSql := sSql +  ' DOC.DATAPROGRAMADA,                               '+
                                       ' lote.codportforma ,            '+
                                       ' DOC.IDPESSOA,  pess.nome,                         '+
                                       ' DOC.DATAVENCTO,                                   '+
                                       ' DOC.NoDOCUMENTO,                                  '+
                                       ' DOC.COMPLDOCUMENTO,                               '+
                                       ' DOC.CODDOCUMENTO,                                 '+
                                       ' DOC.OPERACAO, LOTE.NUMLOTE,                       '+
                                       ' DOC.PLANO , DOC.PLACONTA,  DOC.CODCENTROCUSTO,    '+
                                       ' LOTE.CODLANCFINANC,                               '+
                                       ' LOTEX.VALOR,lote.numchqbordero,                   '+
                                       ' LOTEX.FLGBAIXA, LOTE.DATAEMISSAO, DOC.CODTIPDOC   '+
                                       ' FROM  ' +
                                       'DOCUMENTO DOC, ' +
                                       'PESSOA PESS, ' +
                                       'LOTEXDOCUM LOTEX , ' +
                                       'lotepagto lote' +
                                       ' WHERE LOTEX.NUMLOTE = '+ DstList.Items[x] +' AND ' +
                                       '       DOC.IDPESSOA = '+InttoStr(Sistema.IdEmpresa) + ' AND '+
                                       '       DOC.RECPAG = ''' + IntegraBack.RecPag +''''               + ' AND '+
                                       '       (LOTEX.FLGBAIXA = '' ''  OR LOTEX.FLGBAIXA IS NULL)     AND '+
                                       '       lote.numlote    = lotex.numlote                         and '+
                                       '       DOC.IDFORCLI = PESS.IDPESSOA                         AND '+
                                       '       LOTEX.CODDOCUMENTO = DOC.CODDOCUMENTO                    ';
                 FazQuery(dtmBaseDados.Qry,sSql);

                 If (RgEmisLote.ItemIndex = 0) Or (DtEmis.Text = '') Then
                     sDataEmissao := dtmBaseDados.Qry.FieldByname('DATAEMISSAO').AsString
                 Else
                     sDataEmissao := DtEmis.Text;

                 If (QryPortadorForma.FieldByName('LancaFinanc').AsString = 'S') and (IntegraBack.Financeiro <> 'N') Then
                 Begin
                    LancFinanc.FazerRateioCAPCAR(dtmBaseDados.Qry,'C',sNumChq,sDataEmissao,IntegraBack.RecPag, StrToInt(DstList.Items[x]),QryPortadorForma.FieldByName('CodPortForma').AsInteger,iCodLancFinanc);
                    if iCodLancFinanc = -1 then
                       abort;
                 End;

                 QryDocumentos.Close;
                 QryDocumentos.SQL.Text := 'UPDATE LOTEPAGTO SET ' +
                                           ' FLAGEMISSAO = ''1'', ' +
                                           ' NUMCHQBORDERO = ' + sNumChq +', ' +
                                           ' DATAEMISSAO = TO_DATE('''+ sDataEmissao + ''',''DD/MM/YYYY'') ';
                 If (QryPortadorForma.FieldByName('LancaFinanc').AsString = 'S') and
                     (IntegraBack.Financeiro <> 'N') Then
                     QryDocumentos.SQL.Text := QryDocumentos.SQL.Text +
                                              ',CODLANCFINANC = '+ IntToStr(iCodLancFinanc) + ' ';
                 QryDocumentos.SQL.Text := QryDocumentos.SQL.Text +
                                           ' WHERE NUMLOTE = ' + DstList.Items[x];
                 QryDocumentos.ExecSql;
               End;
            End;

            If Not Sistema.GravaLogOperacoes('Emissao de Documento Remessa Eletronica') Then
                  Raise Exception.Create('Não Consegui Gravar o Log');

            CommitTransacao;

            ExcAllBtnClick(Self);
            SrcList.Items.Clear;
            FuncaoGeral.TiraIcone;
            MsgDlg('Arquivo de Pagamento Eletrônico ' + IeaCm.NomeArquivoGerado + ' gerado com sucesso','Aviso',mtInformation,[mbOK],0);
         End
         Else
            RollbackTransacao;
       Except
         frmAguarde.Apaga;
         RollbackTransacao;
         MsgDlg('Não foi possível atualizar envio','Erro',mtError,[mbOK],0);
         QryDocumentos.Close;
         Raise;
       End;
       //Fim do Pagamento
     End;
  End;
end;

procedure TFrmPagEletronico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  QryLoteDoc.Close;
  qryLotePagto.Close;
end;

procedure TFrmPagEletronico.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  IF PnlCodigodeBarras.Visible Then
  Begin
     PnlCodigodeBarras.Visible := False;
      bExibeBarras := True
  End
  Else
     ExcAllBtnClick(Self);
end;

procedure TFrmPagEletronico.ChkDocClick(Sender: TObject);
begin
  inherited;
  If Not ChkDoc.Checked Then
    sSql := 'SELECT L.NUMLOTE, D.NODOCUMENTO,L.VALOR, L.CODDOCUMENTO, L.CODBARRA, L.CODBARRAVALOR ' +
               'FROM ' +
               Sistema.PrefixoServidor + 'DOCUMENTO D, '     +
               Sistema.PrefixoServidor + 'LOTEXDOCUM  L, '   +
               Sistema.PrefixoServidor + 'PORTADORFORMA P, ' +
               Sistema.PrefixoServidor + 'LOTEPAGTO LP '     +
               'WHERE ' +
               '   (P.CODARQUIVOREMESSA = ' + CmbModeloCnab.LookupValue + ') AND '+
               '   (L.NUMLOTE IN ('+ sLostesSel +'))  AND ' +
               '   (P.CODFORMAPAGTO IN (' + iEaCm.CodigosBarra + '))       AND ' +
               '   (LP.NUMLOTE = L.NUMLOTE)           AND ' +
               '   (LP.CODPORTFORMA = P.CODPORTFORMA) AND ' +
               '   (D.CODDOCUMENTO = L.CODDOCUMENTO)      ' +
               'ORDER BY D.NODOCUMENTO'
    Else
        sSql := 'SELECT L.NUMLOTE, D.NODOCUMENTO,L.VALOR, L.CODDOCUMENTO, L.CODBARRA, L.CODBARRAVALOR ' +
            'FROM ' +
            Sistema.PrefixoServidor + 'DOCUMENTO D, '     +
            Sistema.PrefixoServidor + 'LOTEXDOCUM  L, '   +
            Sistema.PrefixoServidor + 'PORTADORFORMA P, ' +
            Sistema.PrefixoServidor + 'LOTEPAGTO LP '     +
            'WHERE ' +
            '   (P.CODARQUIVOREMESSA = ' + CmbModeloCnab.LookupValue + ') AND '+
            '   (L.NUMLOTE IN ('+ sLostesSel +'))  AND ' +
            '   (P.CODFORMAPAGTO IN (' + iEaCm.CodigosBarra + '))     AND ' +
            '   ((L.CODBARRA IS NULL)              AND ' +
            '   (L.CODBARRAVALOR IS NULL))         AND ' +
            '   (LP.NUMLOTE = L.NUMLOTE)           AND ' +
            '   (LP.CODPORTFORMA = P.CODPORTFORMA) AND ' +
            '   (D.CODDOCUMENTO = L.CODDOCUMENTO)      ' +
            'ORDER BY D.NODOCUMENTO';
    FazQuery(QryLoteDoc,sSql);
end;

procedure TFrmPagEletronico.AtualizaBarras;
Var
  Marca: TBookMark;
Begin
  If Trim(EdtBarras.Text) <> '' Then
     If Not IeaCm.ValidaCodBarrasSispag(EdtBarras.Text,11) Then Exit;

  If Trim(EdtRepBarras.Text) <> '' Then
     If Not IeaCm.ValidaCodBarrasSispag(EdtRepBarras.Text,10) Then Exit;

  Try
     StartTransacao;

     sSql := 'UPDATE LOTEXDOCUM SET CODBARRA = ''' + Trim(EdtBarras.Text) + ''', ' +
                             'CODBARRAVALOR = ''' + Trim(EdtRepBarras.Text) + ''' ' +
             'WHERE (NUMLOTE = ' + QryLoteDocNUMLOTE.AsString + ') AND ' +
             '(CODDOCUMENTO = ' +  QryLoteDocCODDOCUMENTO.AsString + ')';

     ExecutarQuery(QryAtualizaBarras,sSql);

     CommitTransacao;
  Except
     RollbackTransacao;
     MsgDlg('Erro ao Alterar Código de Barras','Erro',mtError,[mbOK],0);
     Exit;
  End;

     Marca := QryLoteDoc.GetBookMark;
     QryLoteDoc.CLose;
     QryLoteDoc.Open;

     If QryLoteDoc.BookmarkValid(Marca) Then
        QryLoteDoc.GotoBookMark(Marca);

     QryLoteDoc.FreeBookMark(Marca);

     If Not QryLoteDoc.IsEmpty Then
     begin
     //   bbtnConfirmarClick(Self)
     //Else
        If (Not QryLoteDoc.Eof) And (QryLoteDoc.RecordCount > 1) Then
           QryLoteDoc.Next
        Else
          If (Not QryLoteDoc.Bof) And (QryLoteDoc.RecordCount > 1) Then
             QryLoteDoc.First;
    end
    else
    begin
        bExibeBarras := False; //maria
    end;
End;

procedure TFrmPagEletronico.DsQryLoteDocDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  If PnlCodigodeBarras.Visible Then
  Begin
    If QryLoteDoc.RecordCount = 0 Then
    Begin
        EdtBarras.Text := '';
        EdtRepBarras.Text := ''
    End
    Else
    Begin
        EdtBarras.Text := QryLoteDocCODBARRA.AsString;
        EdtRepBarras.Text := QryLoteDocCODBARRAVALOR.AsString;
    End;
  End;
end;

procedure TFrmPagEletronico.FormCreate(Sender: TObject);
begin
  inherited;
  QryModelosCnab.Open;
  bExibeBarras            := True;
  DtEmis.Date             := Date;
  PnlCodigodeBarras.Align := AlClient;
end;

procedure TFrmPagEletronico.BtnIncluiBarrasClick(Sender: TObject);
begin
  inherited;
  AtualizaBarras;
end;

procedure TFrmPagEletronico.CmbModeloCnabCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If modified Then MontaQueryBoletos;
  SetButtons;
end;

procedure TFrmPagEletronico.RgEmisLoteClick(Sender: TObject);
begin
  inherited;
  if RgEmisLote.ItemIndex = 0 then begin
     DtEmis.Enabled := False;
  end else begin
     DtEmis.Enabled := True;
  end;
end;

procedure TFrmPagEletronico.MontaQueryBoletos;
Begin
  DstList.Items.Clear;
  SrcList.Items.Clear;

  If CmbModeloCnab.Text <> '' Then
  Begin
    IeaCm.IndiceDoBanco := QryModelosCnabIDMODELOSCNAB.AsInteger;

    If DstList.Items.Count <> 0 Then ExcAllBtnClick(Self);

    sSQL :=  ' SELECT distinct LOTEPAGTO.NUMLOTE,LOTEPAGTO.CODPORTFORMA, ' +
           ' PORTADORFORMA.CODFORMAPAGTO, PORTADORFORMA.CODTIPOPAGTO, ' +
           ' PORTADORFORMA.FLGEMITEAVISO, PORTADORFORMA.CODARQUIVOREMESSA '+
           ' FROM ' + Sistema.PrefixoServidor + 'LotePagto, '+
           Sistema.PrefixoServidor + 'LOTEXDOCUM LOTEX, '+
           Sistema.PrefixoServidor + 'DOCUMENTO DOC, '+
           Sistema.PrefixoServidor + 'PESSOA PESS, '+
           Sistema.PrefixoServidor + 'PARAMCAP PAR,'+
           Sistema.PrefixoServidor + ' PortadorForma '+

          ',(select count(*) as totdocum , numlote from lotexdocum ld , documento d where '+
          '        D.RECPAG         = '''+ IntegraBack.RecPag +'''  AND '+
          '        ((LD.FLGBAIXA  IN (''N'',''R''))  OR (LD.FLGBAIXA IS NULL ))  AND  '+
          '         ld.CODDOCUMENTO = D.CODDOCUMENTO group by numlote  ) totdocum '+

          ',(select count(*) as totdocum , numlote from lotexdocum ld , documento d where '+
          '        D.RECPAG         = '''+ IntegraBack.RecPag +'''  AND '+
          '     ((LD.FLGBAIXA  IN (''N'',''R''))  OR (LD.FLGBAIXA IS NULL)) AND '+
          '         ld.CODDOCUMENTO = D.CODDOCUMENTO  and '+
          '         d.codtipdoc in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
                IntegraBack.RecPag+''' and not exists  (select 1 from UsuarioxTpdocto b where recpag='+#39+integraback.recpag+#39+' and b.idusuario=' +
                inttostr(sistema.IdUsuario)+') union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
                IntegraBack.RecPag+ '''  and exists (select 1 from UsuarioxTpdocto b where recpag='+#39+integraback.recpag+#39+' and a.codtipdoc=b.codtipdoc and b.idusuario=' +
                inttostr(sistema.idusuario)+')) group by numlote  ) totlote '+

          ' WHERE (FLAGEMISSAO IS NULL OR  FLAGEMISSAO = ''0'') AND                  '+
          '       (FLAGCANCEL IS NULL OR FLAGCANCEL = ''0'')    AND                  '+
          ' totlote.totdocum=totdocum.totdocum and '+
          ' totlote.numlote=totdocum.numlote and   totlote.numlote=  lotepagto.NUMLOTE and '+
          '       (LotePagto.IDPESSOA = ' + InttoStr(Sistema.IdEmpresa) + ') AND '+
          '       (DOC.RECPAG         = '''+ IntegraBack.RecPag +''')                     AND '+
          '       (PORTADORFORMA.CODARQUIVOREMESSA = ' + CmbModeloCnab.LookupValue + ') ';

     If IeaCm.ObrigaTipoPagto(IeaCm.IndiceDoBanco) Then
        sSql := sSql + ' AND (PORTADORFORMA.CODTIPOPAGTO IS NOT NULL) ';

     If IeaCm.ObrigaFormaPagto(IeaCm.IndiceDoBanco) Then
        sSql := sSql + ' AND (PORTADORFORMA.CODFORMAPAGTO IS NOT NULL) ';

        sSql := sSql +    '  AND (LOTEPAGTO.CODPORTFORMA = PORTADORFORMA.CODPORTFORMA) AND '+
           '       (LOTEPAGTO.NUMLOTE  = LOTEX.NUMLOTE)                           AND '+
           '       (LOTEX.CODDOCUMENTO = DOC.CODDOCUMENTO)                        AND '+
           '       (Par.IDPESSOA = LOTEPAGTO.IDPESSOA)                            AND '+
           '       (pess.idpessoa = LOTEPAGTO.idpessoa)                               '+
           ' ORDER BY NUMLOTE';

    FazQuery(QryLotePagto,sSql);

    If Not QryLotePagto.isEmpty Then
    Begin
      SrcList.Items.Clear;
      While Not QryLotePagto.Eof Do
      Begin
          SrcList.Items.Add(QryLotePagto.FieldByName('NUMLOTE').AsString);
          QryLotePagto.Next;
      End;
    end;
    QryLotePagto.First;
  End;
End;

procedure TFrmPagEletronico.QryDocumentosCalcFields(DataSet: TDataSet);
begin
  inherited;
  With DtmDadosBancarios Do
  Begin
     BuscaContaDoc(QryDocumentosCODDOCUMENTO.AsFloat);
     QryDocumentosCONTACORRENTE.AsString := ContaBancaria.Numero;
     QryDocumentosCODBANCOFAVORECIDO.AsString := ContaBancaria.Banco;
     QryDocumentosNUMAGENCIA.AsString := ContaBancaria.Agencia;
     QryDocumentosNOMEAGENCIA.AsString := ContaBancaria.Nomeagencia;
     QryDocumentosTIPOCONTA.AsString := ContaBancaria.Tipo;
  End;
end;

{DF 24/08 - GUSTAVO VIEGAS
 Correção na seleção dos dados bancário referentes ao favorecido do documento:
 Passou a verificar a existência da conta bancária informado no lançamento do documento,
 caso não exista exibe a conta preferencial do favorecido;
 Otimização das Consultas;
FIM DF 24/08}

End.
