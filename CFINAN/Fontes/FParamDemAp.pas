(*
 17/05/2000 - Alterações Funcef
   Ordenação do Relatório por Data de Vencimento e Número da Ap
*)

unit FParamDemAp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, wwdblook, Db, DBTables, Wwquery,
  fcTreeView, Mask, CMProcuraSubTipo, ImgList, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, {$IFDEF VER0505} uComum{$ELSE} uCMTypes{$ENDIF};

type
  TFrmParamDemAp = class(TfrmOkCancelar)
    qryCentroRespon: TwwQuery;
    qryCentroResponCODCENTRORESPON: TStringField;
    qryCentroResponNOME: TStringField;
    qryCentroResponANALITICOSINTET: TStringField;
    qryCentroResponCODCENTROCUSTO: TStringField;
    lblCentroRespon: TLabel;
    GroupBox1: TGroupBox;
    DtIni: TCMDateTimePicker;
    DtFin: TCMDateTimePicker;
    Rgdata: TRadioGroup;
    TreeCRespon: TfcTreeView;
    ImlTreeView: TImageList;
    RgSitDoc: TRadioGroup;
    qrycpmf: TwwQuery;
    qrycpmfCODDOCLANCADO: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure TreeCResponEditing(TreeView: TfcCustomTreeView;
      Node: TfcTreeNode; var AllowEdit: Boolean);
    procedure TreeCResponToggleCheckbox(TreeView: TfcCustomTreeView;
      Node: TfcTreeNode);
  private
    { Private declarations }
    //sListaDescricao :String;

    Procedure MontaArvore;
    //Function BuscaCentRespon:String;

  public
    { Public declarations }
    TipoRelat :Char;
  end;

var
  FrmParamDemAp: TFrmParamDemAp;

implementation

uses DRelatoriosCapCar2, uSistema, uIntegraBack, uDataBase, uDocumento, uString,
     uMensErro,  umodulo, DRelatoriosCapCar3;

{$R *.DFM}

procedure TFrmParamDemAp.FormCreate(Sender: TObject);
begin
  inherited;
  With qryCentroRespon Do
  Begin
    If Active Then Close;
    If Not Prepared Then Prepare;
    Params[0].AsFloat := Sistema.idEmpresa;
    Open;
  End;


  MontaArvore;


end;

procedure TFrmParamDemAp.bbtnConfirmarClick(Sender: TObject);
{Var
   rsaldo      :real;
   rSaldoOm   :real;

   sCampodata :String;
   sDescData :String;
   iLinhaAdd :Integer;
   sListaCentroRespon :String;
   Descricao, Quebra :String;
   sStatus :String;}
begin
  inherited;
{  Case Rgdata.ItemIndex Of
    0:
    Begin
      sCampodata  := 'TRGDTINCLUSAO ';
      sDescData   := ' - Data de Inclusão ';
    End;
    1:
    Begin
      sCampodata  := 'DATAEMISSAO ';
      sDescData   := ' - Data de Emissão ';
    End;
    2:
    Begin
      sCampodata  := 'DATAPROGRAMADA ';
      sDescData   := ' - Data Programada ';
    End;
  End;

  Case RgSitDoc.ItemIndex Of
    0: sStatus := '0';
    1: sStatus := '2';
    2: sStatus := '';
  End;
     sListaCentroRespon := BuscaCentRespon;
     if trim(sListaCentroRespon) =''then
     Begin
        MsgDlg('Obrigatório Indicar o Centro de Responsabilidade.','Erro',mtError,[mbOk],0);
        exit;
     End;
     if (trim(DtIni.text)='') And (trim(DtFin.text)='') then
     Begin
        MsgDlg('Obrigatório Indicar o Período para o relatório.','Erro',mtError,[mbOk],0);
        exit;
     End;
     with DtmRelatoriosCapCar3 do
     begin

     //A Conceição Fez Merda !
     ////DtmRelatoriosCapCar3.rptdemapMemo1.Lines.Clear;

     sListaCentroRespon := BuscaCentRespon;

     If sListaDescricao <> '' Then
     Begin
       //DtmRelatoriosCapCar3.rptdemapMemo1.lines.add('Centro(s) de Responsabilidade selecionado(s): ' + sListaDescricao);
       //DtmRelatoriosCapCar3.rptdemapMemo1.lines.add('');
     End;

     if integraback.RecPag='P' then
     begin
        //DtmRelatoriosCapCar3.ppLabel47.caption:='Demonstrativo de atos Gestão por Ap no período: ' + DtIni.text + ' - ' + DtFin.text + ' (Contas a Pagar) '  ;
        //DtmRelatoriosCapCar3.rptdemapMemo1.lines.add('Despesas/Pagamentos');
     end;

     //DtmRelatoriosCapCar3.rptdemapMemo1.lines.add('');

     If sStatus <> '' Then
        //DtmRelatoriosCapCar3.rptdemapMemo1.lines.add(' Listagem de Documentos ' + RgSitDoc.Items[RgSitDoc.ItemIndex]);

     with DtmRelatoriosCapCar3.QryDemAp , DtmRelatoriosCapCar3 do
     begin
       //QryDemAp.DisableControls;
       //DisableControls;
       //close;
       //Parambyname('precpag').asstring:=integraback.RecPag;
       //parambyname('pidpessoa').asinteger:=Sistema.idempresa;

       iLinhaAdd := DtmRelatorioscapCar3.BuscaLInhaTrocaFiltro(1, DtmRelatorioscapCar3.QryDemAp);
       If (iLinhaAdd > 0) Then
       Begin
          If trim(sListaCentroRespon)<>'' then
             sql.Insert(iLinhaAdd,' R.CODCENTRORESPON IN (' + sListaCentroRespon + ') AND ');

          sql.Insert(iLinhaAdd, 'TO_DATE(TO_CHAR(D.' + sCampodata + ',''DD/MM/YYYY''),''DD/MM/YYYY'') >=  TO_DATE('+#39+DtIni.Text+#39+',''DD/MM/YYYY'') AND ');
          sql.Insert(iLinhaAdd, 'TO_DATE(TO_CHAR(D.' + sCampodata + ',''DD/MM/YYYY''),''DD/MM/YYYY'') <=  TO_DATE('+#39+DtFin.Text +#39+',''DD/MM/YYYY'') AND ');
          sql.Insert(iLinhaAdd,' (D.NUMAPGR IS NOT NULL) AND ');
          sql.Insert(iLinhaAdd,' (D.codtipdoc <> ' + inttostr(modulo.CodDocCPMF) + ') AND ');
   

          If sStatus = '0' Then
            sql.Insert(iLinhaAdd,' (RTRIM(D.STATUS) = ''0'' OR D.STATUS IS NULL) AND ')
            Else
            If sStatus = '2' Then
               sql.Insert(iLinhaAdd,' (RTRIM(D.STATUS) = ''2'') AND ')
       End;

       iLinhaAdd := DtmRelatorioscapCar3.BuscaLInhaTrocaFiltro(4, DtmRelatorioscapCar3.QryDemAp);
       If (iLinhaAdd > 0) Then
       Begin
          If trim(sListaCentroRespon)<>'' then
             sql.Insert(iLinhaAdd,' R.CODCENTRORESPON IN (' + sListaCentroRespon + ') AND ');

          iLinhaAdd := DtmRelatorioscapCar3.BuscaLInhaTrocaFiltro(3, DtmRelatorioscapCar3.QryDemAp);
         // sql.Insert(iLinhaAdd,' (D.' + sCampoData +' BETWEEN TO_DATE(''' + DtIni.Text + ''',''DD/MM/YYYY'') AND TO_DATE(''' + DtFin.Text + ''',''DD/MM/YYYY'')) AND ');
          sql.Insert(iLinhaAdd, 'TO_DATE(TO_CHAR(D.' + sCampodata + ',''DD/MM/YYYY''),''DD/MM/YYYY'') >=  TO_DATE('+#39+DtIni.Text+#39+',''DD/MM/YYYY'') AND ');
          sql.Insert(iLinhaAdd, 'TO_DATE(TO_CHAR(D.' + sCampodata + ',''DD/MM/YYYY''),''DD/MM/YYYY'') <=  TO_DATE('+#39+DtFin.Text +#39+',''DD/MM/YYYY'') AND ');
          sql.Insert(iLinhaAdd,' (D.NUMAPGR IS  NULL) AND ');
          sql.Insert(iLinhaAdd,' (D.codtipdoc <> ' + inttostr(modulo.CodDocCPMF) + ') AND ');

          If sStatus = '0' Then
            sql.Insert(iLinhaAdd,' (RTRIM(D.STATUS) = ''0'' OR D.STATUS IS NULL) AND ')
            Else
            If sStatus = '2' Then
               sql.Insert(iLinhaAdd,' (RTRIM(D.STATUS) = ''2'') AND ')
       End;

       open;
       QryauxDemAp.close;
       QryauxDemAp.open;
       QryDemAp.first;

       while not eof do
       begin
         if QryDemApanasint.asstring='S' then
         begin
           descricao:=QryDemApDESCRICAO.asstring;
           quebra:=QryDemApcodtiprecdes.asstring;

         end
         else
         begin
                 
           QryauxDemAp.append;
           QryauxDemApdescricao.asstring:=QryDemApDESCRICAO.asstring ;
           Documento.Saldo.GetSaldoDoc(QryDemApcoddocumento.asinteger,'','P',rSaldo,rSaldoOm);
           QryauxDemApvalorliquido.asfloat:=  rsaldo;
           QryauxDemApDATAPROGRAMADA.asstring:=QryDemApDATAPROGRAMADA.asstring;
           QryauxDemApdescr.asstring:=descricao;
           QryauxDemApDESCRICAO.asstring :=QryDemApDESCRICAO.asstring ;
           QryauxDemApNUMAPGR.asstring:=QryDemApNUMAPGR.asstring ;
           DtmRelatorioscapCar3.QryauxDemApOBS.asstring :=  DtmRelatorioscapCar3.QryDemApOBS.asstring  ;
           DtmRelatorioscapCar3.QryauxDemApquebra.asstring:=quebra ;

          // qrycpmf.close;
           //qrycpmf.parambyname('codtipdoc').asinteger:=modulo.CodDocCPMF;
          // qrycpmf.parambyname('coddocumento').asinteger:= QryDemApcoddocumento.asinteger;
          // qrycpmf.open;
           QryauxDemApvalorcpmf.asstring:='0'   ;
         //  if not qrycpmf.isempty then
         //  begin
         //    while  not qrycpmf.eof do
         //    begin
          //    Documento.Saldo.GetSaldoDoc(qrycpmfCODDOCLANCADO.asinteger,'','P',rSaldo,rSaldoOm);
          //    QryauxDemApvalorcpmf.asfloat:=QryauxDemApvalorcpmf.asfloat+ rsaldo ;
          //    qrycpmf.next;
          //   end;
          // end
       ;


           QryauxDemApquebra.asstring:=quebra;
           QryauxDemApdescr.asstring:=descricao;
           QryauxDemAp.post;

         end;
         QryDemAp.next;
       end;
      QryDemAp.close;
      QryauxDemAp.first;
      EnableControls;
      QryauxDemAp.EnableControls;

  End   ;
  End   ;}
  modalresult:=mrok;
end;


Procedure TFrmParamDemAp.MontaArvore;
Var
   NoPai, NoFilho :TfcTreeNode;
   iTamPai, itamNo :ShortInt;
   sDescFormat :String;
Begin
   TreeCRespon.Items.Clear;
   qryCentroRespon.First;
   iTamPai := length(qryCentroResponCODCENTRORESPON.AsString);
   itamNo  := length(qryCentroResponCODCENTRORESPON.AsString);

   NoPai := Nil;
   NoFilho := Nil;

   While Not qryCentroRespon.Eof Do
   Begin
      sDescFormat := FormatMaskText(IntegraBack.MascaraCr + ';0; ',qryCentroResponCODCENTRORESPON.AsString)  + ' - ' + qryCentroResponNOME.AsString;

      If qryCentroResponANALITICOSINTET.AsString = 'S' Then
      Begin
         If iTamPai > length(Trim(qryCentroResponCODCENTRORESPON.AsString)) Then
         Begin
            While (length(Trim(NoFilho.StringData)) > length(Trim(qryCentroResponCODCENTRORESPON.AsString))) Do
                  NoFilho := NoFilho.Parent;

            If (NoFilho = nil) Or (NoFilho.Parent = nil) Then
               NoPai := TreeCRespon.Items.Add(Nil,sDescFormat)
            Else
               NoPai := TreeCRespon.Items.AddChild(NoFilho,sDescFormat)

         End
         Else
            If iTamPai < length(Trim(qryCentroResponCODCENTRORESPON.AsString)) Then
               NoPai := TreeCRespon.Items.AddChild(NoPai,sDescFormat)
            Else
               NoPai := TreeCRespon.Items.Add(nil,sDescFormat);

         With NoPai Do
         Begin
            StringData  := qryCentroResponCODCENTRORESPON.AsString;
            StringData2 := 'S';
            CheckboxType := tvctCheckBox;
            ImageIndex := 0;
            selectedIndex := 0;
            StateIndex := 1;
         End;

         iTamPai := length(qryCentroResponCODCENTRORESPON.AsString);
      End
      Else
      Begin
        If (itamNo > length(qryCentroResponCODCENTRORESPON.AsString)) And
           (NoPai.Parent <> nil) Then NoPai := NoPai.Parent;

        While (NoPai.Parent <> nil) And
              (itamNo < Length(NoPai.Parent.Stringdata)) Do
              NoPai := NoPai.Parent;

        NoFilho := TreeCRespon.Items.AddChild(NoPai,sDescFormat);
        With Nofilho Do
        Begin
           StringData := qryCentroResponCODCENTRORESPON.AsString;
           StringData2 := 'A';
           CheckboxType := tvctCheckBox;
           ImageIndex := 2;
           selectedIndex := 2;
           StateIndex := 2;
        End;
      End;

      itamNo  := length(qryCentroResponCODCENTRORESPON.AsString);
      qryCentroRespon.Next;
   End;
End;

procedure TFrmParamDemAp.TreeCResponEditing(TreeView: TfcCustomTreeView;
  Node: TfcTreeNode; var AllowEdit: Boolean);
begin
  inherited;
  AllowEdit := False;
end;

procedure TFrmParamDemAp.TreeCResponToggleCheckbox(
  TreeView: TfcCustomTreeView; Node: TfcTreeNode);
Var
  No :tfcTreeNode;
begin
  inherited;
  If Node.ImageIndex = 0 Then
  Begin
    No := Node.getfirstchild;
    While No <> nil Do
    Begin
      No.Checked := Node.Checked;
      No := Node.GetNextChild(No);
    End;
  End;
end;

{Function TFrmParamDemAp.BuscaCentRespon:String;
Var
  X:Integer;
Begin
    Result := '';
    sListaDescricao := '';
    For X := 0 To TreeCRespon.Items.Count - 1 Do
        If (TreeCRespon.Items[x].StringData2 = 'A') And
           (TreeCRespon.Items[x].Checked) Then
           Begin
              If sListaDescricao = '' Then
                sListaDescricao := Copy(TreeCRespon.Items[x].Text,Pos('-',TreeCRespon.Items[x].Text) + 1,Length(Trim(TreeCRespon.Items[x].Text)))
              Else
                sListaDescricao := sListaDescricao + ' / ' + Copy(TreeCRespon.Items[x].Text,Pos('-',TreeCRespon.Items[x].Text) + 1,Length(Trim(TreeCRespon.Items[x].Text)));

              Result := Result + '''' + Espaco(TreeCRespon.Items[x].StringData,10) + ''',';
           End;

    If Result <> '' Then
       Result := Copy(Result,1,Length(Result)-1);
End;}

{
  DF 12/07 Gustavo
  Inclusão das colunas Plano, Patrocinadora, Programa e número do imóvel no rateio do
  relatório de Lançamento de Documentos - Modelo 2;
  Inlcusão da comtabilização dos documentos no relatório;
  Inclusão da descrição da Conta Contábil, Número do Lançamento e Histórico nos dados
  da contabilização;
  Implementação da seleção pelas datas de 'Inclusão', 'Emissão' e 'Programada'
  Fim DF 12/07 Gustavo
}


{DF 24/08 - GUSTAVO VIEGAS
 Correção na seleção dos dados bancário referentes ao favorecido do documento:
 Passou a verificar a existência da conta bancária informado no lançamento do documento,
 caso não exista exibe a conta preferencial do favorecido;
 Otimização das Consultas;
FIM DF 24/08}


{
SELECT
   CODTIPRECDES, DESCRICAO, SUM(VALORATU) AS VALORATU, SUM(VALORANT) AS VALORANT,
   ANASINT
FROM
  (SELECT
      T.CODTIPRECDES, T.DESCRICAO, (0) AS VALORATU, (0) AS VALORANT, T.ANASINT
   FROM
      TIPORECEBDESEMB T
   WHERE
      T.ANASINT = 'S' AND  T.RECPAG=? AND T.IDPESSOA=?
   UNION
   SELECT
      T.CODTIPRECDES, T.DESCRICAO,
      SUM(DECODE(T.RECPAG,'P',DECODE(L.DEBCRE,'C',R.VALOR,R.VALOR * -1),
      DECODE(L.DEBCRE,'D',R.VALOR,R.VALOR * -1))) AS VALORATU ,(0) AS VALORANT,
      T.ANASINT
   FROM
      RATEIODOCUM R, LANCTODOCUM L, DOCUMENTO D, TIPORECEBDESEMB T
   WHERE
TO_DATE(TO_CHAR(D.DATAPROGRAMADA ,'DD/MM/YYYY'),'DD/MM/YYYY') <=  TO_DATE('05/09/2000','DD/MM/YYYY') AND
TO_DATE(TO_CHAR(D.DATAPROGRAMADA ,'DD/MM/YYYY'),'DD/MM/YYYY') >=  TO_DATE('01/09/2000','DD/MM/YYYY') AND
 R.CODCENTRORESPON IN ('0305      ','0306      ') AND
-- #ADF1
      T.RECPAG = ? AND    ((d.numfatura is null and rtrim(d.operacao) in ('1','11') ) or rtrim(d.operacao) not in ('1','11'))    and
      D.RECPAG = ? AND
      T.IDPESSOA = ? AND
--      T.ANASINT = 'A' AND
      L.ESTORNO IS NULL AND
      T.CODTIPRECDES  = R.CODTIPRECDES AND
      T.IDPESSOA = R.IDPESSOA AND
      T.RECPAG = R.RECPAG AND
      D.CODDOCUMENTO = R.CODDOCUMENTO AND
      D.CODDOCUMENTO = L.CODDOCUMENTO AND
      D.OPERACAO = L.OPERACAO
   GROUP BY
      T.CODTIPRECDES, T.DESCRICAO, T.ANASINT, L.DEBCRE, T.RECPAG
   UNION
   SELECT
      T.CODTIPRECDES, T.DESCRICAO, (0) AS VALORATU,
      DECODE(T.RECPAG,'P',DECODE(L.DEBCRE,'C',SUM(R.VALOR),SUM(R.VALOR) * -1),
      DECODE(L.DEBCRE,'D',SUM(R.VALOR),SUM(R.VALOR) * -1)) AS VALORANT ,
      T.ANASINT
   FROM
      RATEIODOCUM R, LANCTODOCUM L, DOCUMENTO D, CENTRESPON CR, TIPORECEBDESEMB T
   WHERE
TO_DATE(TO_CHAR(D.DATAPROGRAMADA ,'DD/MM/YYYY'),'DD/MM/YYYY') <=  TO_DATE('31/08/2000','DD/MM/YYYY') AND
TO_DATE(TO_CHAR(D.DATAPROGRAMADA ,'DD/MM/YYYY'),'DD/MM/YYYY') >=  TO_DATE('01/08/2000','DD/MM/YYYY') AND
 (D.codtipdoc <> 29) AND
 (D.NUMAPGR IS NOT NULL) AND
 R.CODCENTRORESPON IN ('0305      ','0306      ') AND
-- #ADF2
      T.RECPAG = ? AND   ((d.numfatura is null and rtrim(d.operacao) in ('1','11') ) or rtrim(d.operacao) not in ('1','11'))    and
      D.RECPAG = ? AND
      T.IDPESSOA = ? AND
--      T.ANASINT = 'A' AND
      L.ESTORNO IS NULL AND
      T.CODTIPRECDES = R.CODTIPRECDES AND
      T.IDPESSOA = R.IDPESSOA AND
      T.RECPAG = R.RECPAG AND
      D.CODDOCUMENTO = R.CODDOCUMENTO AND
      D.CODDOCUMENTO = L.CODDOCUMENTO AND
      D.OPERACAO = L.OPERACAO AND
      CR.IDPESSOA = R.IDPESSOA(+) AND
      CR.CODCENTRORESPON = R.CODCENTRORESPON(+)
   GROUP BY
      T.CODTIPRECDES, T.DESCRICAO, T.ANASINT, L.DEBCRE, T.RECPAG

   UNION
   SELECT
      T.CODTIPRECDES, T.DESCRICAO,
      SUM(DECODE(T.RECPAG,'P',DECODE(L.DEBCRE,'C',R.VALOR,R.VALOR * -1),
      DECODE(L.DEBCRE,'D',R.VALOR,R.VALOR * -1))  * parcela.valor/valorlanc.valor) AS VALORATU ,(0) AS VALORANT,
      T.ANASINT
   FROM
      RATEIODOCUM R, LANCTODOCUM L, DOCUMENTO D, TIPORECEBDESEMB T  ,
      (select  d.numfatura, SUM(DECODE(D.RECPAG,'P',DECODE(L.DEBCRE,'C',l.VALOR,l.VALOR * -1),
        DECODE(L.DEBCRE,'D',l.VALOR,l.VALOR * -1)))  AS VALOR from
        lanctodocum l , documento d
         where d.coddocumento=l.coddocumento
         and   d.recpag=? and d.idpessoa=?
         and rtrim(d.operacao)in ('1','11')   and l.estorno is null
         and d.numfatura is not null group by d.numfatura) valorlanc,

      (select  d.numfatura, SUM(DECODE(D.RECPAG,'P',DECODE(L.DEBCRE,'C',l.VALOR,l.VALOR * -1),
        DECODE(L.DEBCRE,'D',l.VALOR,l.VALOR * -1))) AS VALOR from
        lanctodocum l , documento d
         where
TO_DATE(TO_CHAR(D.DATAPROGRAMADA ,'DD/MM/YYYY'),'DD/MM/YYYY') <=  TO_DATE('05/09/2000','DD/MM/YYYY') AND
TO_DATE(TO_CHAR(D.DATAPROGRAMADA ,'DD/MM/YYYY'),'DD/MM/YYYY') >=  TO_DATE('01/09/2000','DD/MM/YYYY') AND
-- #ADF3
         d.coddocumento=l.coddocumento    and l.estorno is null
         and   d.recpag=? and d.idpessoa=?
         and rtrim(d.operacao)in ('3','13') and d.operacao=l.operacao
         and d.numfatura is not null group by d.numfatura) parcela
   WHERE
 R.CODCENTRORESPON IN ('0305      ','0306      ') AND
-- #ADF4
      d.numfatura=parcela.numfatura and parcela.numfatura=valorlanc.numfatura and
      valorlanc.valor<> 0 and
      T.RECPAG = ?     AND ( rtrim(d.operacao) in ('1','11')  ) and  d.numfatura is not null and
      D.RECPAG = ? AND
      T.IDPESSOA = ? AND
--      T.ANASINT = 'A' AND
      L.ESTORNO IS NULL AND
      T.CODTIPRECDES  = R.CODTIPRECDES AND
      T.IDPESSOA = R.IDPESSOA AND
      T.RECPAG = R.RECPAG AND
      D.CODDOCUMENTO = R.CODDOCUMENTO AND
      D.CODDOCUMENTO = L.CODDOCUMENTO AND
      D.OPERACAO = L.OPERACAO
   GROUP BY
      T.CODTIPRECDES, T.DESCRICAO, T.ANASINT, L.DEBCRE, T.RECPAG
   UNION
   SELECT
      T.CODTIPRECDES, T.DESCRICAO,  (0) AS VALORATU   ,
      SUM(DECODE(T.RECPAG,'P',DECODE(L.DEBCRE,'C',R.VALOR,R.VALOR * -1),
      DECODE(L.DEBCRE,'D',R.VALOR,R.VALOR * -1))  * parcela.valor/valorlanc.valor) AS VALORANT ,
      T.ANASINT
   FROM
      RATEIODOCUM R, LANCTODOCUM L, DOCUMENTO D, TIPORECEBDESEMB T  ,
      (select  d.numfatura, SUM(DECODE(D.RECPAG,'P',DECODE(L.DEBCRE,'C',l.VALOR,l.VALOR * -1),
        DECODE(L.DEBCRE,'D',l.VALOR,l.VALOR * -1)))  AS VALOR from
        lanctodocum l , documento d
         where d.coddocumento=l.coddocumento
         and   d.recpag=? and d.idpessoa=?
         and rtrim(d.operacao)in ('1','11')   and l.estorno is null
         and d.numfatura is not null group by d.numfatura) valorlanc,

      (select  d.numfatura, SUM(DECODE(D.RECPAG,'P',DECODE(L.DEBCRE,'C',l.VALOR,l.VALOR * -1),
        DECODE(L.DEBCRE,'D',l.VALOR,l.VALOR * -1))) AS VALOR from
        lanctodocum l , documento d
         where
TO_DATE(TO_CHAR(D.DATAPROGRAMADA ,'DD/MM/YYYY'),'DD/MM/YYYY') <=  TO_DATE('31/08/2000','DD/MM/YYYY') AND
TO_DATE(TO_CHAR(D.DATAPROGRAMADA ,'DD/MM/YYYY'),'DD/MM/YYYY') >=  TO_DATE('01/08/2000','DD/MM/YYYY') AND
 (D.codtipdoc <> 29) AND
 (D.NUMAPGR IS NOT NULL) AND
-- #ADF5
         d.coddocumento=l.coddocumento    and l.estorno is null
         and   d.recpag=? and d.idpessoa=?
         and rtrim(d.operacao)in ('3','13') and d.operacao=l.operacao
         and d.numfatura is not null group by d.numfatura) parcela
   WHERE
 R.CODCENTRORESPON IN ('0305      ','0306      ') AND
-- #ADF6
      valorlanc.valor <> 0 and
      d.numfatura=parcela.numfatura and parcela.numfatura=valorlanc.numfatura and
      T.RECPAG = ?     AND ( rtrim(d.operacao) in ('1','11')  ) and  d.numfatura is not null and
      D.RECPAG = ? AND
      T.IDPESSOA = ? AND
--      T.ANASINT = 'A' AND
      L.ESTORNO IS NULL AND
      T.CODTIPRECDES  = R.CODTIPRECDES AND
      T.IDPESSOA = R.IDPESSOA AND
      T.RECPAG = R.RECPAG AND
      D.CODDOCUMENTO = R.CODDOCUMENTO AND
      D.CODDOCUMENTO = L.CODDOCUMENTO AND
      D.OPERACAO = L.OPERACAO
   GROUP BY
      T.CODTIPRECDES, T.DESCRICAO, T.ANASINT, L.DEBCRE, T.RECPAG
      )
GROUP BY
   CODTIPRECDES, DESCRICAO, ANASINT
ORDER BY
   CODTIPRECDES}

{SELECT  distinct
  NUMFATURA, CODDOCUMENTO, NUMAPGR, REFERENCIA, NODOCUMENTO, COMPLDOCUMENTO,
DATAVENCTO, DATAEMISSAO, DATAPROGRAMADA, NUMDOCUMENTO, sum(VALOR) as valor, sum(VALOROUTRAMOEDA) as VALOROUTRAMOEDA,
RAZAOSOCIAL, DESCRICAO, VALORRATEIO, '                                   ' as DESCTDR, '                         ' as NOMEAP, NOMECR, NOMECC, OBS,
FLGDOCBANCARIO, sum(VLACRE) as VLACRE, sum(VLDEC) as VLDEC, sum(VLIMP) as VLIMP, sum(VLLIQ) as VLLIQ, TRGUSERINCLUSAO,
  TO_DATE(TO_CHAR(TRGDTINCLUSAO,'DD/MM/YYYY'),'DD/MM/YYYY') AS TRGDTINCLUSAO,
  (0) AS TOTVALORBRUTO, (0) AS TOTVALORDEDUCOES, (0) AS TOTVALORACRESCIMO,
  (0) AS TOTVALORIMPOSTO, (0) AS TOTVALORAPAGAR, (0) AS SUMVALORBRUTO,
  (0) AS SUMVALORDEDUCOES, (0) AS SUMVALORACRESCIMO, (0) AS SUMVALORIMPOSTO,
  (0) AS SUMVALORAPAGAR, NUMIMOVEL, NOMEPATRO, DESCPLANO, DESCPROGRAMA, IDFORCLI,
  (0) AS VALOLANCTOLIQ, (0) AS SUMVALOLANCTOLIQ
FROM
 (SELECT
     D.NUMFATURA, D.CODDOCUMENTO, D.NUMAPGR, D.REFERENCIA, D.NODOCUMENTO,
     D.COMPLDOCUMENTO, D.DATAVENCTO, D.DATAEMISSAO, D.DATAPROGRAMADA,
     P.NUMDOCUMENTO, decode(d.recpag,'P',decode(l.debcre,'C',L.VALOR,l.valor*-1),decode(l.debcre,'D',L.VALOR,l.valor*-1)) as valor, decode(d.recpag,'P',decode(l.debcre,'C',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1),decode(l.debcre,'D',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1)) as valoroutramoeda, P.RAZAOSOCIAL, F.DESCRICAO,
     RD.VALOR AS VALORRATEIO, TDR.DESCRICAO AS DESCTDR, AP.NOME AS NOMEAP,
     CR.NOME AS NOMECR, CC.NOME AS NOMECC, D.OBS,
     F.FLGDADOSBANCARIOS AS FLGDOCBANCARIO, (0) AS VLACRE, (0) AS VLDEC,
     (0) AS VLIMP, (0) AS VLLIQ, D.TRGUSERINCLUSAO, D.TRGDTINCLUSAO,
     RD.NUMIMOVEL, PATRO.NOME AS NOMEPATRO, PLANO.NOME AS DESCPLANO,
     PROGRAMA.DESCPROGRAMA, D.IDFORCLI
 FROM
     PESSOA P, PESSOA PATRO, DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM RD, FORMARECPAG F,
     TIPORECEBDESEMB TDR, CENTCUST CC, UNIDNEGOCIO AP, CENTRESPON CR, PLANPREVCONTABIL PLANO,
     PROGRAMA
 WHERE
TO_DATE(TO_CHAR(D.TRGDTINCLUSAO ,'DD/MM/YYYY'),'DD/MM/YYYY') <=  TO_DATE('31/12/2000','DD/MM/YYYY') AND 
TO_DATE(TO_CHAR(D.TRGDTINCLUSAO ,'DD/MM/YYYY'),'DD/MM/YYYY') >=  TO_DATE('01/01/2000','DD/MM/YYYY') AND 
 (D.codtipdoc <> 71) AND 
 (D.NUMAPGR IS NOT NULL) AND 
-- #ADF1
-- STRING PARA ADICIONAR FILTRO DAS TELAS DE PARÂMETRO NA CONSULTA
     D.CODTIPDOC IN
        (SELECT
           CODTIPDOC
         FROM
           TIPODOCRECPAG A
         WHERE
           A.RECPAG = 'P' AND NOT EXISTS
              (SELECT * FROM USUARIOXTPDOCTO B
               WHERE
                  RECPAG= 'P' AND B.IDUSUARIO = 2)
         UNION
            SELECT
               CODTIPDOC
            FROM
               TIPODOCRECPAG A
            WHERE
               A.RECPAG = 'P' AND EXISTS
                  (SELECT * FROM USUARIOXTPDOCTO B
                   WHERE
                     RECPAG = 'P' AND A.CODTIPDOC = B.CODTIPDOC AND
                     B.IDUSUARIO = 2)) AND (d.numfatura is null)    and
     (L.ESTORNO IS NULL) AND (D.RECPAG = 'P') AND (D.IDPESSOA =  1) AND
     (D.CODDOCUMENTO = L.CODDOCUMENTO) AND (D.OPERACAO = L.OPERACAO) AND
     (D.CODDOCUMENTO = RD.CODDOCUMENTO) AND (P.IDPESSOA = D.IDFORCLI) AND
     (D.CODFORMA = F.CODFORMA(+)) AND (CC.CODCENTROCUSTO(+) = RD.CODCENTROCUSTO) AND
     (CC.IDEMPRESA(+) = RD.IDEMPRESA) AND (TDR.CODTIPRECDES(+) = RD.CODTIPRECDES) AND
     (TDR.RECPAG(+) = RD.RECPAG) AND (TDR.IDPESSOA(+) = RD.IDPESSOA) AND
     (AP.UNIDNEGOC(+) = RD.UNIDNEGOC) AND (AP.IDPESSOA(+) = RD.IDPESSOA) AND
     (CR.CODCENTRORESPON(+) = RD.CODCENTRORESPON) AND (CR.IDPESSOA(+) = RD.IDPESSOA) AND
     (PLANO.IDPLANOPREV(+) = RD.IDPLANOPREV) AND(PROGRAMA.IDPROGRAMA(+) = RD.IDPROGRAMA) AND
     (PATRO.IDPESSOA(+) = RD.IDPATRO)
 UNION
   SELECT
      Q1.NUMFATURA, Q1.CODDOCUMENTO, Q1.NUMAPGR,Q1.REFERENCIA, Q1.NODOCUMENTO,
      Q1.COMPLDOCUMENTO, Q1.DATAVENCTO, Q1.DATAEMISSAO, Q1.DATAPROGRAMADA,
      Q1.NUMDOCUMENTO, Q1.VALOR, Q1.VALOROUTRAMOEDA, Q1.RAZAOSOCIAL,
      Q1.DESCRICAO, SUM(((Q1.VALOR * Q2.VALOR)/ Q3.VALOR)) AS VALORRATEIO ,
      Q2.DESCTDR, Q2.NOMEAP, Q2.NOMECR, Q2.NOMECC , Q1.OBS, Q1.FLGDOCBANCARIO ,
      (0) AS VLACRE, (0) AS VLDEC, (0) AS VLIMP, (0) AS VLLIQ, Q1.TRGUSERINCLUSAO,
      Q1.TRGDTINCLUSAO, Q2.NUMIMOVEL, Q2.NOMEPATRO, Q2.DESCPLANO, Q2.DESCPROGRAMA, Q1.IDFORCLI
   FROM
     (SELECT
         DOC.NUMFATURA, DOC.CODDOCUMENTO, DOC.NUMAPGR,DOC.REFERENCIA, DOC.NODOCUMENTO,
         DOC.COMPLDOCUMENTO, DOC.DATAVENCTO, DOC.DATAEMISSAO, DOC.DATAPROGRAMADA,
         P.NUMDOCUMENTO, decode(doc.recpag,'P',decode(lan.debcre,'C',Lan.VALOR,lan.valor*-1),decode(lan.debcre,'D',Lan.VALOR,lan.valor*-1)) as valor, decode(doc.recpag,'P',decode(lan.debcre,'C',Lan.VALOROUTRAMOEDA,Lan.VALOROUTRAMOEDA*-1),decode(lan.debcre,'D',Lan.VALOROUTRAMOEDA,Lan.VALOROUTRAMOEDA*-1)) as valoroutramoeda, P.RAZAOSOCIAL, F.DESCRICAO,
         DOC.OBS, F.FLGDADOSBANCARIOS AS FLGDOCBANCARIO , (0) AS VLACRE, (0) AS VLDEC,
         (0) AS VLIMP, (0) AS VLLIQ, DOC.TRGUSERINCLUSAO, DOC.TRGDTINCLUSAO, DOC.IDFORCLI
      FROM
         PESSOA P, DOCUMENTO DOC, LANCTODOCUM LAN, FORMARECPAG F
      WHERE
TO_DATE(TO_CHAR(DOC.TRGDTINCLUSAO ,'DD/MM/YYYY'),'DD/MM/YYYY') <=  TO_DATE('31/12/2000','DD/MM/YYYY') AND
TO_DATE(TO_CHAR(DOC.TRGDTINCLUSAO ,'DD/MM/YYYY'),'DD/MM/YYYY') >=  TO_DATE('01/01/2000','DD/MM/YYYY') AND
 (Doc.codtipdoc <> 71) AND 
 (DOC.NUMAPGR IS NOT NULL) AND 
-- #ADF2
-- STRING PARA ADICIONAR FILTRO DAS TELAS DE PARÂMETRO NA CONSULTA
        DOC.CODTIPDOC IN
          (SELECT CODTIPDOC FROM TIPODOCRECPAG A
           WHERE
              A.RECPAG = 'P' AND NOT EXISTS
                 (SELECT * FROM USUARIOXTPDOCTO B
                  WHERE
                    RECPAG = 'P' AND B.IDUSUARIO = 2)
           UNION
           SELECT CODTIPDOC FROM TIPODOCRECPAG A
           WHERE
              A.RECPAG = 'P' AND EXISTS
                 (SELECT * FROM USUARIOXTPDOCTO B
                  WHERE
                    RECPAG = 'P' AND A.CODTIPDOC = B.CODTIPDOC AND
                    B.IDUSUARIO = 2)) AND
        (LAN.ESTORNO IS NULL) AND (DOC.RECPAG = 'P') AND
        (DOC.IDPESSOA = 1) AND (P.IDPESSOA = DOC.IDFORCLI)AND
        (DOC.CODFORMA = F.CODFORMA(+)) AND (RTRIM(LAN.OPERACAO) IN ('3','13')) AND
        (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)) Q1,
      (SELECT
         D.NUMFATURA,  (DECODE(D.RECPAG,'P',DECODE(L.DEBCRE,'C',Rd.VALOR,Rd.VALOR * -1),
      DECODE(L.DEBCRE,'D',Rd.VALOR,Rd.VALOR * -1))) as valor, TDR.DESCRICAO AS DESCTDR, AP.NOME AS NOMEAP,
         CR.NOME AS NOMECR ,CC.NOME AS NOMECC, RD.NUMIMOVEL, PATRO.NOME AS NOMEPATRO,
         PLANO.NOME AS DESCPLANO, PROGRAMA.DESCPROGRAMA
      FROM
         PESSOA PATRO, DOCUMENTO D,lanctodocum l, RATEIODOCUM RD, TIPORECEBDESEMB TDR,
         CENTCUST CC, UNIDNEGOCIO AP, CENTRESPON CR, PLANPREVCONTABIL PLANO, PROGRAMA
      WHERE
 (D.codtipdoc <> 71) AND 
 (D.NUMAPGR IS NOT NULL) AND
-- #ADF3
-- STRING PARA ADICIONAR FILTRO DAS TELAS DE PARÂMETRO NA CONSULTA
         (D.RECPAG = 'P') AND d.coddocumento=l.coddocumento and l.operacao=d.operacao and (D.IDPESSOA =  1) AND (D.NUMFATURA IS NOT NULL) AND
         (CC.CODCENTROCUSTO(+) = RD.CODCENTROCUSTO) AND (CC.IDEMPRESA(+) = RD.IDEMPRESA) AND
         (D.CODDOCUMENTO = RD.CODDOCUMENTO) AND (TDR.CODTIPRECDES(+) = RD.CODTIPRECDES) AND
         (TDR.RECPAG(+) = RD.RECPAG) AND (TDR.IDPESSOA(+) = RD.IDPESSOA) AND
         (AP.UNIDNEGOC(+) = RD.UNIDNEGOC) AND (AP.IDPESSOA(+) = RD.IDPESSOA) AND
         (CR.CODCENTRORESPON(+) = RD.CODCENTRORESPON) AND (PLANO.IDPLANOPREV(+) = RD.IDPLANOPREV) AND
         (PROGRAMA.IDPROGRAMA(+) = RD.IDPROGRAMA) AND (PATRO.IDPESSOA(+) = RD.IDPATRO) AND
         (CR.IDPESSOA(+) = RD.IDPESSOA)) Q2,
      (SELECT
          D.NUMFATURA, sum(decode(d.recpag,'P',decode(l.debcre,'C',L.VALOR,l.valor*-1),decode(l.debcre,'D',L.VALOR,l.valor*-1))) as valor
       FROM
          DOCUMENTO D, LANCTODOCUM L 
       WHERE
          (L.ESTORNO IS NULL)  AND (D.RECPAG= 'P') AND (D.IDPESSOA = 1) AND
          (RTRIM(L.OPERACAO) IN ('1','11')) AND (D.CODDOCUMENTO = L.CODDOCUMENTO) AND
          (D.OPERACAO = L.OPERACAO) AND (D.NUMFATURA IS NOT NULL)
       GROUP BY D.NUMFATURA) Q3
   WHERE
      (Q1.NUMFATURA = Q2.NUMFATURA) AND (Q3.NUMFATURA = Q2.NUMFATURA)
   GROUP BY
      Q1.NUMFATURA, Q1.CODDOCUMENTO, Q1.NUMAPGR, Q1.REFERENCIA, Q1.NODOCUMENTO,
      Q1.COMPLDOCUMENTO, Q1.DATAVENCTO, Q1.DATAEMISSAO, Q1.DATAPROGRAMADA,
      Q1.NUMDOCUMENTO, Q1.VALOR, Q1.VALOROUTRAMOEDA, Q1.RAZAOSOCIAL, Q1.DESCRICAO,
      Q2.DESCTDR, Q2.NOMEAP, Q2.NOMECR, Q2.NOMECC , Q1.OBS, Q1.FLGDOCBANCARIO,
      Q1.TRGUSERINCLUSAO, Q1.TRGDTINCLUSAO, Q2.NUMIMOVEL, Q2.NOMEPATRO,
      Q2.DESCPLANO, Q2.DESCPROGRAMA, Q1.IDFORCLI)

 group by NUMFATURA, CODDOCUMENTO, NUMAPGR, REFERENCIA, NODOCUMENTO, COMPLDOCUMENTO, 
  DATAVENCTO, DATAEMISSAO, DATAPROGRAMADA, NUMDOCUMENTO, VALOR, VALOROUTRAMOEDA,  
  RAZAOSOCIAL, DESCRICAO, VALORRATEIO,  NOMECR, NOMECC, OBS,  
  FLGDOCBANCARIO, TRGUSERINCLUSAO,     
   TRGDTINCLUSAO,
   NUMIMOVEL, NOMEPATRO, DESCPLANO, DESCPROGRAMA, IDFORCLI    
 ORDER BY RAZAOSOCIAL, IDFORCLI, CODDOCUMENTO , TRGDTINCLUSAO,NUMAPGR,NODOCUMENTO, OBS DESC
 }

end. 
