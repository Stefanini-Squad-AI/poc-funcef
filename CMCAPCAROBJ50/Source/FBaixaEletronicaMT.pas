{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ -  Baixa Eletrônica de Títulos                        }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 16/09/2002                             }
{                                                       }
{*******************************************************}

unit FBaixaEletronicaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Db, DBTables,
  wwdblook, uMensErro, TB97Tlbr, Grids, Wwdbigrd, Wwdbgrid, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, CMDBLookupCombo, DBClient,
  uCMClientDataSet, uCmSqlParams, uCtrlIntBanco, uCtrlPadroes;

CONST
 SQLDOCVAZIO = 'SELECT ' +
               '   D.CODDOCUMENTO, ' +
               '   D.IDPESSOA, ' +
               '   D.PLACONTA, ' +
               '   D.CODCENTROCUSTO, ' +
               '   D.IDFORCLI, ' +
               '   D.IDUSUARIOINCLUSAO, ' +
               '   D.NODOCUMENTO, ' +
               '   D.COMPLDOCUMENTO, ' +
               '   D.DATAEMISSAO, ' +
               '   D.CODSUBCONTA, ' +
               '   D.CODTIPDOC, ' +
               '   ''D'' AS DEBCRE, ' +
               '   D.DATAVENCTO, ' +
               '   D.DATAPROGRAMADA, ' +
               '   D.OPERACAO, ' +
               '   L.VALOR, ' +
               '   L.VALOROUTRAMOEDA, ' +
               '   R.NUMLOTE, ' +
               '   R.CODLANCFINANC, ' +
               '   D.NOSSONUMERO, ' +
               '   P.RAZAOSOCIAL, ' +
               '   (0) AS JUROS, ' +
               '   (0) AS DESCONTOS, ' +
               '   (0) AS ABATIMENTO, ' +
               '   D.DATAPROGRAMADA AS DATABAIXA, ' +
               '   D.CODPORTFORMA, ' +
               '   P.NOME, ' +
               '   (0) AS TARIFABANCARIA, ' +
               '   (0) AS VALORNOMINAL ' +
               'FROM ' +
               '   DOCUMENTO D, ' +
               '   LANCTODOCUM L, ' +
               '   RECBTOPAGTO R, ' +
               '   PESSOA P ' +
               'WHERE ' +
               '   1=2 ';
               
type
  TFrmBaixaEletronicaMT = class(TfrmOkCancelar)
    DlgAbrir: TOpenDialog;
    GrdQryDocumentos: TwwDBGrid;
    Panel1: TPanel;
    LblPgto: TLabel;
    EdtArquivoRetorno: TEdit;
    LblPath: TLabel;
    SbtnAbrirArquivoRet: TSpeedButton;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    DsDoc: TwwDataSource;
    CmbModeloCnab: TCMDBLookupCombo;
    SQLModelos: TCMSqlParams;
    CdsModelo: TCMClientDataSet;
    SQLDocs: TCMSqlParams;
    CdsDocs: TCMClientDataSet;
    SQLAuxDoc: TCMSqlParams;
    CdsAuxDoc: TCMClientDataSet;
    SQLOcorrencias: TCMSqlParams;
    CdsOcorrencias: TCMClientDataSet;
    procedure SbtnAbrirArquivoRetClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlIntBanco : TCtrlIntBanco;

    sListaRetorno: TStrings;
    iNumChqBordero: Integer;

    function lCharReplace(S: String; c: Char): String;
    procedure HabilitaBotoes(bHabilita: Boolean);
    procedure MontaGrid;
  public
    { Public declarations }
  end;

var
  FrmBaixaEletronicaMT: TFrmBaixaEletronicaMT;

implementation

uses uDataBase, uSistema, uCtrlParamIntegra, uCMMath, uCmDialogs,
     JclStrings, JclShell, uCMTypes;

{$R *.DFM}

procedure TFrmBaixaEletronicaMT.SbtnAbrirArquivoRetClick(Sender: TObject);
begin
   inherited;
   Application.ProcessMessages;

   If CmbModeloCnab.Text = '' Then
   Begin
     MsgDlg('Favor Indicar o ' + LblPgto.Caption,'Aviso',mtError,[mbOk],0);
     CmbModeloCnab.SetFocus;
     Exit;
   End;

   With SQLOcorrencias, Sql Do
   Begin
      Clear;
      Add(' SELECT ');
      Add('   C.IDCODIGOSCNAB, ');
      Add('   C.RECPAG, ');
      Add('   C.IDMODELOSCNAB , ');
      Add('   C.TIPO, ');
      Add('   C.CODIGO, ');
      Add('   C.DESCRICAO, ');
      Add('   C.FLGINDICABAIXA, ');
      Add('   M.DESCRICAO AS DESCMODELO ');
      Add(' FROM ');
      Add('   CODIGOSCNAB C, MODELOSCNAB M ');
      Add(' WHERE ');
      Add('   (C.IDMODELOSCNAB = :IDMODELOSCNAB) AND ');
      Add('   (C.RECPAG = :RECPAG) AND ');
      Add('   (C.IDMODELOSCNAB = M.IDMODELOSCNAB) AND ');
      Add('   (C.RECPAG = M.RECPAG) ');

      Prepare;
      ParamByName('IDMODELOSCNAB').AsInteger := StrToIntDef(CmbModeloCnab.LookupValue, 0);
      ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
      Open;
   End;

   If CdsOcorrencias.RecordCount = 0 Then
   Begin
      If ParamIntegra.RecPag = 'R' Then
          MsgDlg('Falta indicação dos Códigos de Baixa para este tipo de Cobrança','Aviso',mtError,[mbOk],0)
      Else
          MsgDlg('Falta indicação dos Códigos de Baixa para este tipo de Pagamento','Aviso',mtError,[mbOk],0);

      CdsOcorrencias.Close;
   end
   Else
      If DlgAbrir.Execute Then
      Begin
         EdtArquivoRetorno.Text := DlgAbrir.FileName;

         If ParamIntegra.RecPag = 'R' Then
            sListaRetorno := CtrlIntBanco.BaixadeTitulosAutomatica(StrToIntDef(CmbModeloCnab.LookupValue,0),DlgAbrir.FileName,UPPERCASE(Sistema.NomeEmpresa))
         Else
            sListaRetorno := CtrlIntBanco.BaixadeSispagAutomatica(StrToIntDef(CmbModeloCnab.LookupValue,0),DlgAbrir.FileName,UPPERCASE(Sistema.NomeEmpresa));

         If sListaRetorno = nil Then Abort;

         If sListaRetorno.Count = 0 Then
          MsgDlg('Não foram encontrados registros para baixa no arquivo','Aviso',mtError,[mbOk],0)
         Else
         Begin
            CopyFile(Pchar(Copy(DlgAbrir.FileName,1,Pos('.',DlgAbrir.FileName))+ 'LOG'),
                     Pchar(Copy(DlgAbrir.FileName,1,Pos('.',DlgAbrir.FileName))+ 'Txt'),false);

            ShellExecAndWait(Copy(DlgAbrir.FileName,1,Pos('.',DlgAbrir.FileName))+ 'Txt');

            If (UpperCase(Copy(sListaRetorno[0],1,4)) <> 'ERRO') Then
               MontaGrid;
         End;

         HabilitaBotoes(Not CdsDocs.IsEmpty);
      End;
end;

procedure TFrmBaixaEletronicaMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  EdtArquivoRetorno.Text := '';
  CmbModeloCnab.Text := '';
  DlgAbrir.FileName := '';
  HabilitaBotoes(False);
end;

procedure TFrmBaixaEletronicaMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If ParamIntegra.Recpag = 'R' Then
  Begin
    iNumChqBordero := 0;

    If InputValue('Baixa Automática','Favor Indicar o Nº do Lote de Recebimento', iNumChqBordero) Then
       Exit;
  End;
end;

procedure TFrmBaixaEletronicaMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlIntBanco := TCtrlIntBanco.Create;
  CtrlIntBanco.InitializeAs( Padroes );

  HabilitaBotoes(False);
  sListaRetorno := TStringList.Create;

  SQLDocs.Sql.Text := SQLDOCVAZIO;
  SQLDocs.Open;

  SQLModelos.Prepare;
  SQLModelos.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
  SQLModelos.Open;

  if ParamIntegra.Recpag = 'P' then
  begin
    HelpContext           := 30046;
    bbtnAjuda.HelpContext := 30046;
  end
  else
  begin
    HelpContext           := 40052;
    bbtnAjuda.HelpContext := 40052;
  end;
end;

procedure TFrmBaixaEletronicaMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  sListaRetorno.Free;
  CtrlIntBanco.Free;  
end;

procedure TFrmBaixaEletronicaMT.MontaGrid;
Var
  X: Integer;
  sAux: String;
  sDataLancto: string;
Begin
 If ParamIntegra.RecPag = 'R' Then
 Begin
    {**
      Monta Grid de Pagamento do CNAB
    **}
    For x:= 0 To sListaRetorno.Count -1 Do
    Begin
      {**
        sAux vai receber o CODIGO DE OCORRÊNCIA de RETORNO
      **}
      sAux := Trim(Copy(sListaRetorno[X],26,2));

      If (CdsOcorrencias.Locate('Codigo',sAux,[])) AND (CdsOcorrencias.FieldByName('FLGINDICABAIXA').ASSTRING='S' ) Then     //MARIA
      Begin
        {**
          Fábio Barros - 10/04/2002
          Inclusão, no IF abaixo, de alguns modelos que tem o retorno
          controlado pelo CODDOCUMENTO/CODGRUPOCNAB.
          Linha original : IeaCm.IndiceDoBanco In [1,9,10,12,13,14]
        **}
        If (CtrlIntBanco.IndiceDoBanco In [0,1,2,9,10,11,12,13,14,17,19,20,21,23]) Then
           sAux    := Trim(Copy(sListaRetorno[x],41,16)) //CODDOCUMENTO/CODGRUPOCNAB
        Else
           sAux    := Trim(Copy(sListaRetorno[x],1,20)); //NOSSO NUMERO

        {**
          Alterar as remessas do contas a receber para gravar junto com a referencia para retorno(CODDOCUMENTO)
          o FLGGRUPO. Testar na baixa se o primeiro caracter do sAux acima é igual a S, se for fazer
          o select pelo CODGRUPOCNAB, se for N ou se for numérico faser como está abaixo, pelo CODDOCUMENTO.
          Implementar um loop para preencher a query de baixa pq o CODGRUPOCNAB pode trazer vários registros
        **}

        With SQLAuxDoc, Sql Do
        Begin
           Add(' SELECT ');
           Add('     D.CODDOCUMENTO, ');
           Add('     D.IDPESSOA, ');
           Add('     D.CODSUBCONTA, ');
           Add('     D.PLACONTA, ');
           Add('     D.CODCENTROCUSTO, ');
           Add('     D.IDFORCLI, ');
           Add('     D.IDUSUARIOINCLUSAO, ');
           Add('     D.NODOCUMENTO, ');
           Add('     D.COMPLDOCUMENTO, ');
           Add('     D.DATAEMISSAO, ');
           Add('     D.DATAVENCTO, ');
           Add('     D.DATAPROGRAMADA, ');
           Add('     D.OPERACAO, ');
           Add('     SUM(DECODE(L.DEBCRE,''D'',DECODE(D.RECPAG,''R'',L.VALOR,L.VALOR*-1),DECODE(D.RECPAG,''R'',L.VALOR*-1,L.VALOR))) AS VALOR, ');
           Add('     SUM(DECODE(L.DEBCRE,''D'',DECODE(D.RECPAG,''R'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1),DECODE(D.RECPAG,''R'',L.VALOROUTRAMOEDA*-1,L.VALOROUTRAMOEDA))) AS VALOROUTRAMOEDA, ');
           Add('     DECODE(D.RECPAG,''P'',''D'',''C'') AS DEBCRE, ');
           Add('     D.NOSSONUMERO, ');
           Add('     P.RAZAOSOCIAL, ');
           Add('     D.STATUS, ');
           Add('     D.CODPORTFORMA, ');
           Add('     P.NOME ');
           Add(' FROM ');
           Add('     DOCUMENTO D, ');
           Add('     LANCTODOCUM L, ');
           Add('     PESSOA P ');

           If (CtrlIntBanco.IndiceDoBanco In [0,1,2,9,10,11,12,13,14,17,19,20,21,23]) Then
           begin
             {**
               30/10/2001 - Fábio Barros
               Se a primeira posição não for um NÚMERO.
             **}
             if not StrIsNumber(copy(sAux,1,1)) then
             begin
               {**
                  Se a primeira posição for igual a 'S' ou 'N', significa que o
                  arquivo de remessa foi gerado utilizando essa nova filosofia da
                  baixa pelo GRUPO. Se a segunda posição não estiver em branco,
                  significa que este documento foi gerado por outro sistema e não
                  deve ser baixado.
               **}
               if copy(sAux,1,1) = 'S' then
                  Add(' WHERE (D.CODGRUPOCNAB = ' + Trim(Copy(sAux,3,20)) + ') AND ')
               else
                  Add(' WHERE (D.CODDOCUMENTO = ' + Trim(Copy(sAux,3,20)) + ') AND ');

               {**
                 Se TRUE, significa que o documento foi gerado por outro sistema
               **}
               if trim(copy(sAux,2,1)) <> '' then Add(' (1 = 2) AND ');
             end
             else
                {**
                  Se for um NÜMERO, significa que o arquivo de remessa foi gerado
                   pela rotina antiga.
                **}
                Add(' WHERE (D.CODDOCUMENTO = ' + sAux + ') AND ');
           end
           else
              Add(' WHERE (D.NOSSONUMERO LIKE ''%' + sAux + '%'') AND ');

           Add('    (D.IDPESSOA = :IDPESSOA) AND ');
           Add('    (D.RECPAG = ''R'') AND ');
           Add('    ((D.STATUS <> ''2'') OR (D.STATUS IS NULL))  AND ');
           Add('    (D.IDFORCLI = P.IDPESSOA) AND ');
           Add('    (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ');
           Add('    (RTRIM(D.OPERACAO) IN (''1'',''2'',''3'',''14'')) ');
           Add(' GROUP BY ');
           Add('    D.CODDOCUMENTO, ');
           Add('    D.IDPESSOA, ');
           Add('    D.CODSUBCONTA, ');
           Add('    D.PLACONTA, ');
           Add('    D.CODCENTROCUSTO, ');
           Add('    D.IDFORCLI, ');
           Add('    D.IDUSUARIOINCLUSAO, ');
           Add('    D.NODOCUMENTO, ');
           Add('    D.COMPLDOCUMENTO, ');
           Add('    D.DATAEMISSAO, ');
           Add('    D.DATAVENCTO, ');
           Add('    D.DATAPROGRAMADA, ');
           Add('    D.OPERACAO, ');
           Add('    D.RECPAG,  ');
           Add('    D.NOSSONUMERO, ');
           Add('    P.RAZAOSOCIAL, ');
           Add('    D.STATUS, ');
           Add('    D.CODPORTFORMA, ');
           Add('    P.NOME ');

           Prepare;
           ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
           Open;
        End;

        If (sAux <> '') And (Not CdsAuxDoc.IsEmpty) Then
        Begin
          while not CdsAuxDoc.EOF do
          begin
            If StrToFloatDef(lCharReplace(Copy(sListaRetorno[x],111,20),','), 0) > 0 Then
            Begin

              Try
                If Trim(CdsAuxDoc.FieldByName('STATUS').AsString) <> '2' Then
                   sDataLancto := lCharReplace(Copy(sListaRetorno[x],31,10),'/');
              Except
                sDataLancto := DateToStr(Date);
              End;

              MoveFields(CdsAuxDoc, CdsDocs, OpInserir, False);

              CdsDocs.Edit;
              CdsDocs.FieldByName('DATABAIXA').AsDateTime := StrToDate(sDataLancto);
              CdsDocs.FieldByName('VALOR').AsFloat := StrToFloatDef(lCharReplace(Copy(sListaRetorno[x],111,20),','),0);
              CdsDocs.FieldByName('VALOROUTRAMOEDA').AsFloat := CdsAuxDoc.FieldByName('VALOROUTRAMOEDA').AsFloat;
              CdsDocs.FieldByName('VALORNOMINAL').AsFloat := CdsAuxDoc.FieldByName('VALOR').AsFloat;
              CdsDocs.FieldByName('JUROS').AsFloat := StrToFloatDef(lCharReplace(Copy(sListaRetorno[x],131,20),','),0);
              CdsDocs.FieldByName('DESCONTOS').AsFloat := StrToFloatDef(lCharReplace(Copy(sListaRetorno[x],91,20),','),0);

              If CtrlIntBanco.IndiceDoBanco = 9 Then
                CdsDocs.FieldByName('ABATIMENTO').AsFloat := 0
              else
                CdsDocs.FieldByName('ABATIMENTO').AsFloat := StrToFloatDef(lCharReplace(Copy(sListaRetorno[x],71,20),','),0);

              {**
                Valor da Tarifa Bancária =
                [(VN + J - D - A) - VC] será lançado como Alterador Pré-definido no Parâmetro
              **}
              If CdsDocs.FieldByName('VALOR').AsFloat <> 0 Then
                 CdsDocs.FieldByName('TARIFABANCARIA').AsFloat := (
                                                                  (CdsDocs.FieldByName('VALORNOMINAL').AsFloat +
                                                                  CdsDocs.FieldByName('JUROS').AsFloat -
                                                                  CdsDocs.FieldByName('DESCONTOS').AsFloat -
                                                                  CdsDocs.FieldByName('ABATIMENTO').AsFloat) -
                                                                  CdsDocs.FieldByName('VALOR').AsFloat
                                                                  )
              Else
                 CdsDocs.FieldByName('TARIFABANCARIA').AsFloat := 0;

              CdsDocs.Post;
            End;
            CdsAuxDoc.Next;
          End;
        End;
      End;
    End;
 End
 Else
 Begin
   //Monta Grid Do Sispag
   For x:=0 To sListaRetorno.Count - 1 Do
   Begin
     If lCharReplace(Copy(sListaRetorno[x],76,20),',') <> '' Then
     Begin
        With SQLOcorrencias, Sql Do
        Begin
           If CtrlIntBanco.IndiceDoBanco = 0 Then
           Begin
             Clear;
             Add(' SELECT ');
             Add('   C.IDCODIGOSCNAB, ');
             Add('   C.RECPAG, ');
             Add('   C.IDMODELOSCNAB , ');
             Add('   C.TIPO, ');
             Add('   C.CODIGO, ');
             Add('   C.DESCRICAO, ');
             Add('   C.FLGINDICABAIXA, ');
             Add('   M.DESCRICAO AS DESCMODELO ');
             Add(' FROM ');
             Add('   CODIGOSCNAB C, MODELOSCNAB M ');
             Add(' WHERE ');
             Add('   (C.IDMODELOSCNAB = :IDMODELOSCNAB) AND ');
             Add('   (C.RECPAG = :RECPAG) AND ');
             Add('   (C.IDMODELOSCNAB = M.IDMODELOSCNAB) AND ');
             Add('   (C.RECPAG = M.RECPAG) AND ');
             Add('   (C.FLGINDICABAIXA = ''S'') AND ');
             Add('   (C.CODIGO IN (' + lCharReplace(Copy(sListaRetorno[x],76,20),',') + '))');
           End
           Else
           Begin
             Clear;
             Add(' SELECT ');
             Add('   C.IDCODIGOSCNAB, ');
             Add('   C.RECPAG, ');
             Add('   C.IDMODELOSCNAB , ');
             Add('   C.TIPO, ');
             Add('   C.CODIGO, ');
             Add('   C.DESCRICAO, ');
             Add('   C.FLGINDICABAIXA, ');
             Add('   M.DESCRICAO AS DESCMODELO ');
             Add(' FROM ');
             Add('  CODIGOSCNAB C, MODELOSCNAB M ');
             Add(' WHERE ');
             Add('   (C.IDMODELOSCNAB = :IDMODELOSCNAB) AND ');
             Add('   (C.RECPAG = :RECPAG) AND ');
             Add('   (C.IDMODELOSCNAB = M.IDMODELOSCNAB) AND ');
             Add('   (C.FLGINDICABAIXA = ''S'') AND ');
             Add('    (C.RECPAG = M.RECPAG) ');

             If Copy(sListaRetorno[x],76,2) = '01' Then
                Add(' AND C.CODIGO = ''01'' ')
             Else
              if  (CtrlIntBanco.IndiceDoBanco = 18) and (ParamIntegra.RecPag='P') Then
                Add(' AND C.CODIGO IN (' + lCharReplace(Copy(sListaRetorno[x],76,32),',') + ')')
              else
                Add(' AND C.CODIGO IN (' + lCharReplace(Copy(sListaRetorno[x],76,20),',') + ')');
           End;

           Prepare;
           ParamByName('IDMODELOSCNAB').AsInteger := StrToIntDef(CmbModeloCnab.LookupValue, 0);
           ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
           Open;
        End;

        If Not CdsOcorrencias.IsEmpty Then
        Begin
          sAux := (Trim(Copy(sListaRetorno[x],31,20)));
          If (sAux <> '') Then
          Begin
             With SQLAuxDoc, Sql Do
             Begin
                Clear;
                Add(' SELECT ');
                Add('    D.CODDOCUMENTO, ');
                Add('    D.IDPESSOA, ');
                Add('    D.CODSUBCONTA, ');
                Add('    D.PLACONTA, ');
                Add('    D.CODCENTROCUSTO, ');
                Add('    D.IDFORCLI, ');
                Add('    D.IDUSUARIOINCLUSAO, ');
                Add('    D.NODOCUMENTO, ');
                Add('    D.COMPLDOCUMENTO, ');
                Add('    D.DATAEMISSAO, ');
                Add('    D.DATAVENCTO, ');
                Add('    D.DATAPROGRAMADA, ');
                Add('    D.OPERACAO, ');
                Add('    SUM(DECODE(L.DEBCRE,''D'',DECODE(D.RECPAG,''R'',L.VALOR,L.VALOR*-1),DECODE(D.RECPAG,''R'',L.VALOR*-1,L.VALOR))) AS VALOR, ');
                Add('    SUM(DECODE(L.DEBCRE,''D'',DECODE(D.RECPAG,''R'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1),DECODE(D.RECPAG,''R'',L.VALOROUTRAMOEDA*-1,L.VALOROUTRAMOEDA))) AS VALOROUTRAMOEDA, ');
                Add('    DECODE(D.RECPAG,''P'',''D'',''C'') AS DEBCRE, ');
                Add('    D.NOSSONUMERO, ');
                Add('    P.RAZAOSOCIAL, ');
                Add('    D.STATUS, ');
                Add('    D.CODPORTFORMA, ');
                Add('    P.NOME  ');
                Add(' FROM ');
                Add('    DOCUMENTO D, ');
                Add('    LANCTODOCUM L, ');
                Add('    PESSOA P ');
                Add(' WHERE ');
                Add('    (D.CODDOCUMENTO = ' + sAux + ') AND  ');
                Add('    (D.IDPESSOA = :IDPESSOA AND  ');
                Add('    (D.RECPAG = ''P'') AND  ');
                Add('    ((D.STATUS <> ''2'') OR (D.STATUS IS NULL)) AND  ');
                Add('    (D.IDFORCLI = P.IDPESSOA) AND  ');
                Add('    (D.CODDOCUMENTO = L.CODDOCUMENTO) AND  ');
                Add('    (RTRIM(D.OPERACAO) IN (''1'',''2'',''3'',''14'')) ');
                Add(' GROUP BY ');
                Add('     D.CODDOCUMENTO, ');
                Add('     D.IDPESSOA, ');
                Add('     D.CODSUBCONTA, ');
                Add('     D.PLACONTA, ');
                Add('     D.CODCENTROCUSTO, ');
                Add('     D.IDFORCLI, ');
                Add('     D.IDUSUARIOINCLUSAO, ');
                Add('     D.NODOCUMENTO, ');
                Add('     D.COMPLDOCUMENTO, ');
                Add('     D.DATAEMISSAO,  ');
                Add('     D.DATAVENCTO, ');
                Add('     D.DATAPROGRAMADA, ');
                Add('     D.OPERACAO, ');
                Add('     D.RECPAG,  ');
                Add('     D.NOSSONUMERO, ');
                Add('     P.RAZAOSOCIAL, ');
                Add('     D.STATUS, ');
                Add('     D.CODPORTFORMA, ');
                Add('     P.NOME ');

                Prepare;
                ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
                Open;
             End;

             If Not CdsAuxDoc.IsEmpty Then
             Begin
                If StrToFloatDef( lCharReplace(Copy(sListaRetorno[x],61,15),','),0) > 0 Then
                Begin
                  Try
                     If Trim(CdsAuxDoc.FieldByName('STATUS').AsString) <> '2' Then
                        sDataLancto := lCharReplace(Copy(sListaRetorno[x],51,10),'/');
                  Except
                     sDataLancto := DateToStr(Date);
                  End;

                  MoveFields(CdsAuxDoc, CdsDocs, OpInserir, False);

                  CdsDocs.Edit;
                  CdsDocs.FieldByName('DATABAIXA').AsDateTime         := StrToDate(sDataLancto);
                  CdsDocs.FieldByName('VALOR').AsFloat                := StrToFloatDef(lCharReplace(Copy(sListaRetorno[x],61,15),','),0);
                  CdsDocs.FieldByName('VALOROUTRAMOEDA').AsFloat      := 0;
                  CdsDocs.FieldByName('VALORNOMINAL').AsFloat         := CdsAuxDoc.FieldByName('VALOR').AsFloat;
                  CdsDocs.FieldByName('JUROS').AsFloat                := 0;
                  CdsDocs.FieldByName('DESCONTOS').AsFloat            := 0;
                  CdsDocs.FieldByName('ABATIMENTO').AsFloat           := 0;
                  CdsDocs.FieldByName('TARIFABANCARIA').AsFloat       := 0;
                  CdsDocs.Post;
                End;
             End;
          End;
        End;
     End;
   End;
 End;
End;

procedure TFrmBaixaEletronicaMT.HabilitaBotoes(bHabilita: Boolean);
begin
   bbtnConfirmar.Enabled := bHabilita;
   bbtnCancelar.Enabled := bHabilita;
end;

function TFrmBaixaEletronicaMT.lCharReplace(S: String; c: Char): String;
Var
  sAuxCharReplace: String;
begin
  sAuxCharReplace := S;
  CharReplace(sAuxCharReplace, ' ', c);
  Result := sAuxCharReplace;
end;

end.
