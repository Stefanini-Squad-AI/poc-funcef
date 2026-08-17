// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 07.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit fParamRelGerencial02;

interface

uses
  Windows    , Messages, SysUtils, Classes , Graphics, Controls,
  FOkCancelar, IvDictio, IvMulti , IvEMulti, MAHlpBtn, StdCtrls,
  TB97Tlbr   , TB97    , ExtCtrls, Dialogs ,  Forms  , Buttons ,
  Db         , DBTables, Wwquery , Wwdatsrc, Spin    , wwdblook, TREdit;
type
  TfrmParamRelGerencial02 = class(TfrmOkCancelar)
    GroupBox1        : TGroupBox;
    cmbPatrocinadora : TwwDBLookupCombo;
    GroupBox2        : TGroupBox;
    cmbPlano         : TwwDBLookupCombo;
    GroupBox3        : TGroupBox;
    cmbMes01         : TComboBox;
    spnAno01         : TSpinEdit;
    dsPatrocinadora  : TwwDataSource;
    qryPatrocinadora : TwwQuery;
    dsPlano          : TwwDataSource;
    qryPlano         : TwwQuery;
    GroupBox4        : TGroupBox;
    dtVrs            : TRealEdit;
    qryContribuicao  : TwwQuery;
    GroupBox5        : TGroupBox;
    Memo1            : TMemo;
    qryTmp04         : TwwQuery;
    qryTipo04        : TwwQuery;
    qryDetalhe       : TwwQuery;
    dsTmp04          : TwwDataSource;
    dsDetalhe        : TwwDataSource;
    chkbcTempo: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure cmbPlanoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamRelGerencial02 : TfrmParamRelGerencial02;
  iIdContribuicao        : Integer;
implementation

uses dRelatGerencial, UAdmPrev, fAguarde;

{$R *.DFM}

//******************************************************************************
//*                                                                            *
//* Alterado por.: Elcio Braga.                                                *
//* Em...........: 09/11/2000.                                                 *
//* Motivo.......: Otimização do Relatório Gerencial nº 05.                    *
//*                                                                            *
//******************************************************************************

procedure TfrmParamRelGerencial02.FormCreate(Sender: TObject);
begin
  inherited;
  // Abre Querys
  QryPatrocinadora.Close;
  QryPatrocinadora.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;
  QryPatrocinadora.Open;

  qryPlano.Close;
  qryPlano.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryPlano.Open;
  qryTipo04.Open;
end;

procedure TfrmParamRelGerencial02.FormClose(Sender: TObject;var Action: TCloseAction);
begin
  inherited;
  // Fecha Querys
  QryContribuicao.Close;
  QryTmp04.Close;
  QryTipo04.Close;
  // Libera Form
  Action := caFree;
end;

procedure TfrmParamRelGerencial02.bbtnConfirmarClick(Sender: TObject);
Var bFaz     , bNext   : Boolean;
    sData1   , sFaixa  : String;
    sVlrMeio , sVlr    : String;
    sVlrDobro, sVlrCem : String;
    sTipo    , sPatro  : String;
    sMes               : String;
    cSeparador         : Char;
    iCtrl    , iFem    : LongInt;
    iPart    , iNpart  : LongInt;
    iAtual   , iMasc   : LongInt;
    fValor             : Double;
begin
  inherited;
  // Inicializa Variáveis
  bFaz       := True;
  bNext      := True;
  sData1     := '';
  sVlrMeio   := '';
  sVlr       := '';
  sVlrDobro  := '';
  sVlrCem    := '';
  // Verifica se Todos as escolhas foram feitas
  If (cmbPatrocinadora.Text = '') Then
   Begin
     bFaz := False;
     ShowMessage('A escolha de uma Patrocinadora é obrigatória.');
     cmbPatrocinadora.SetFocus;
   End;
  If (cmbPlano.Text = '') Then
   Begin
     bFaz := False;
     ShowMessage('A escolha de um Plano é obrigatório.');
     cmbPlano.SetFocus;
   End;
  If (dtVrs.Text = '') Then
   Begin
     bFaz := False;
     ShowMessage('É obrigatória a digitação de um valor em VRS.');
     dtVrs.SetFocus;
   End
  Else
   Try
     cSeparador       := DecimalSeparator;
     DecimalSeparator := '.';
     sVlrMeio         := FormatFloat('########0.00',(dtVrs.Value/2));
     sVlr             := FormatFloat('########0.00',dtVrs.Value);
     sVlrDobro        := FormatFloat('########0.00',(dtVrs.Value*2));
     sVlrCem          := FormatFloat('########0.00',(dtVrs.Value*100));
     DecimalSeparator := cSeparador;
   Except
     bFaz             := False;
     ShowMessage('O valor digitado é inválido.');
     dtVrs.SetFocus;
   End;

  // Monta Intervalo de Data
  sData1 := spnAno01.Text+'/';
  // Mês 01
  If cmbMes01.ItemIndex < 9 Then sData1 := sData1+'0'+IntToStr(cmbMes01.ItemIndex+1)
  Else sData1 := sData1+IntToStr(cmbMes01.ItemIndex+1);

  // Monta Querys
  If bFaz Then
   Begin
     // ------------
     // Relatório 04
     // ------------



     qryTmp04.Close;
     qryTmp04.SQL.Clear;
     qryTmp04.SQL.Add(
'SELECT QRY.PATRO, '+
'       QRY.TIPO , '+
'       QRY.LABEL, '+
'       QRY.SEXO , '+
'       QRY.QTD  , '+
'       QRY.MEDIA '+
'/*--------------------------------------------------------------------*/ '+
'FROM (SELECT PAT.NOME                                        AS PATRO, '+
'             ''PARTICIPANTE''                                  AS TIPO , '+
'             DECODE(PF.SEXO,''F'',''FEMININO'',''M'',''MASCULINO'')  AS SEXO , '+
'             CFG.LABEL                                               , '+
'             COUNT(DISTINCT PF.IDPESSOA)                     AS QTD  , '+
'             ((SUM(SYSDATE - PF.DATANASC)/365)/ '+
'                COUNT(DISTINCT PF.IDPESSOA))                 AS MEDIA '+
'      /*------------------------------------------------------------------*/ '+
'      FROM PLANPREV     PL, PESSOA      PAT, PESSOAFISICA PF, '+
'           PARTPREVPLAN PP, EVENTOSPREV EP , SITPART      SP, '+
'      /*------------------------------------------------------------------*/ '+
'           (SELECT MAX(IDEVENTOSPREV) IDEVENTOSPREV, IDPESSOA '+
'              FROM EVENTOSPREV '+
'              GROUP BY IDPESSOA) MAXEVENTO, '+
'      /*------------------------------------------------------------------*/ '+
'           (SELECT 20 AS A0, 30  AS A1, ''20 A 30'' AS LABEL '+
'              FROM DUAL '+
'            UNION '+
'            SELECT 31 AS A0, 40  AS A1, ''30 A 40'' AS LABEL '+
'              FROM DUAL '+
'            UNION '+
'            SELECT 41 AS A0, 50  AS A1, ''40 A 50'' AS LABEL '+
'              FROM DUAL '+
'            UNION '+
'            SELECT 51 AS A0, 60  AS A1, ''50 A 60'' AS LABEL '+
'              FROM DUAL '+
'            UNION '+
'            SELECT 61 AS A0, 70  AS A1, ''60 A 70'' AS LABEL '+
'              FROM DUAL '+
'            UNION '+
'            SELECT 71 AS A0, 120 AS A1, ''MAIS DE 70'' AS LABEL '+
'              FROM DUAL) CFG '+
'      /*------------------------------------------------------------------*/ '+
'      WHERE  (SP.FLGINTERNO          <> ''AS'') '+
'      AND    (SP.FLGINTERNO          <> ''CA'') '+
'      AND    (SP.FLGINTERNO          <> ''CI'') '+
'      AND    (PF.SEXO IS NOT NULL) '+
'      AND    (PAT.IDPESSOA            = '+cmbPatrocinadora.LookupValue+') '+
'      AND    (TO_CHAR(EP.DATAREGISTRO,''YYYY/MM'') <= '+QuotedStr(sData1)+') '+
'      AND    ((TRUNC((SYSDATE-PF.DATANASC)/365)  >= CFG.A0) '+
'      AND     (TRUNC((SYSDATE-PF.DATANASC)/365)  <= CFG.A1)) '+
'      AND    (PP.IDPLANOPREV          = '+cmbPlano.LookupValue+') '+
'      AND    (PP.IDPLANOPREV          = PL.IDPLANOPREV) '+
'      AND    (PP.IDPESSOA             = PF.IDPESSOA) '+
'      AND    (PP.IDPESSJUR            = PAT.IDPESSOA) '+
'      AND    (EP.IDSITPARTNOVO        = SP.IDSITPART) '+
'      AND    (EP.IDPESSJUR            = PP.IDPESSJUR) '+
'      AND    (EP.IDPLANOPREV          = PP.IDPLANOPREV) '+
'      AND    (EP.IDPESSOA             = PP.IDPESSOA) '+
'      AND    (EP.SEQPROPOSTA          = PP.SEQPROPOSTA) '+
'      AND    (MAXEVENTO.IDPESSOA      = EP.IDPESSOA) '+
'      AND    (MAXEVENTO.IDEVENTOSPREV = EP.IDEVENTOSPREV) '+
'      GROUP BY PAT.NOME, PF.SEXO, CFG.LABEL '+
'      UNION '+
'      SELECT PAT.NOME                                       AS PATRO, '+
'             ''NÃO PARTICIPANTE''                             AS TIPO , '+
'             DECODE(PF.SEXO,''F'',''FEMININO'',''M'',''MASCULINO'') AS SEXO , '+
'             CFG.LABEL                                              , '+
'             COUNT(DISTINCT PF.IDPESSOA)                    AS QTD  , '+
'             (SUM(((SYSDATE-PF.DATANASC)/365))/ '+
'                 COUNT(DISTINCT PF.IDPESSOA))               AS MEDIA '+
'      /*-------------------------------------------------*/ '+
'      FROM PESSOA    PAT, PESSOAFISICA PF , SITFUNC SF, '+
'           ELEGPATRO EL, '+
'      /*-------------------------------------------------*/ '+
'           (SELECT 20 AS A0, 30  AS A1, ''20 A 30'' AS LABEL '+
'              FROM DUAL '+
'            UNION '+
'            SELECT 31 AS A0, 40  AS A1, ''30 A 40'' AS LABEL '+
'              FROM DUAL '+
'            UNION '+
'            SELECT 41 AS A0, 50  AS A1, ''40 A 50'' AS LABEL '+
'              FROM DUAL '+
'            UNION '+
'            SELECT 51 AS A0, 60  AS A1, ''50 A 60'' AS LABEL '+
'              FROM DUAL '+
'            UNION '+
'            SELECT 61 AS A0, 70  AS A1, ''60 A 70'' AS LABEL '+
'              FROM DUAL '+
'            UNION '+
'            SELECT 71 AS A0, 120 AS A1, ''MAIS DE 70'' AS LABEL '+
'              FROM DUAL) CFG '+
'      /*-------------------------------------------------*/ '+
'      WHERE (SF.FLGINTERNO <> ''D'') '+
'      AND   (SF.FLGINTERNO <> ''M'') '+
'      AND   (SF.FLGINTERNO <> ''P'') '+
'      AND   (EL.IDPESSJUR   = '+cmbPatrocinadora.LookupValue+') '+
'      AND   (PF.SEXO IS NOT NULL) '+
'      AND   ((TRUNC((SYSDATE-PF.DATANASC)/365) >= CFG.A0) '+
'      AND    (TRUNC((SYSDATE-PF.DATANASC)/365) <= CFG.A1)) '+
'      AND   (EL.IDPESSJUR   = PAT.IDPESSOA) '+
'      AND   (EL.IDPESSOA    = PF.IDPESSOA) '+
'      AND   (EL.IDSITFUNC   = SF.IDSITFUNC) '+
'      AND   (PF.DATANASC IS NOT NULL) '+
'      AND   ((EL.PARTICIPPREVID = 0) OR '+
'             (EL.IDPESSOA IN (SELECT PP.IDPESSOA '+
'                                FROM PARTPREVPLAN PP, SITPLANOPREV SP '+
'                                WHERE PP.IDSITPLANOPREV = SP.IDSITPLANOPREV '+
'                                AND   SP.FLGINTERNO IN (''CA'', ''CI'') ) ) ) '+
'      GROUP BY PAT.NOME, CFG.LABEL, PF.SEXO) QRY '+
'/*--------------------------------------------------------------------*/ '+
'ORDER BY QRY.TIPO DESC, QRY.LABEL DESC, QRY.SEXO DESC');
     qryTmp04.Open;
     //
     // Inicializa Variáveis
     iNPart := 0;
     iPart  := 0;
     // Loop para contagem por Tipo
     While Not qryTmp04.Eof Do
      Begin
        If (qryTmp04.FieldByName('TIPO').AsString = 'PARTICIPANTE') Then iPart := iPart + qryTmp04.FieldByName('QTD').AsInteger
        Else iNPart := iNPart + qryTmp04.FieldByName('QTD').AsInteger;
        qryTmp04.Next;
      End;
     qryTmp04.First;
     // Query Virtual
     dtmRelatorioGerencial.qryGerencial02.Close;
     dtmRelatorioGerencial.qryGerencial02.Open;
     // Inicializa Variáveis
     sTipo  := QryTmp04.FieldByName('TIPO').AsString;
     sPatro := QryTmp04.FieldByName('PATRO').AsString;
     iCtrl  := 0;
     iAtual := 0;
     iFem   := 0;
     iMasc  := 0;
     // Prepara Query para receber dados
     dtmRelatorioGerencial.qryGerencial02.Edit;
     // Loop para preenchimento da query virtual
     While Not QryTmp04.Eof Do
      Begin
        //
        // Loop por TIPO (Participante ou Não Participante) e Label
        If (QryTmp04.FieldByName('LABEL').AsString = QryTipo04.FieldByName('LABEL').AsString) And
           (QryTmp04.FieldByName('TIPO').AsString  = sTipo) Then
         Begin
           // Verifica sexos
           If (QryTmp04.FieldByName('SEXO').AsString  = QryTipo04.FieldByName('SEXO').AsString) Then
            Begin
              // Insere Registros
              dtmRelatorioGerencial.qryGerencial02.FieldByName('PATRO').AsString := QryTmp04.FieldByName('PATRO').AsString;
              dtmRelatorioGerencial.qryGerencial02.FieldByName('TIPO').AsString  := QryTmp04.FieldByName('TIPO').AsString;
              dtmRelatorioGerencial.qryGerencial02.FieldByName('LABEL').AsString := QryTmp04.FieldByName('LABEL').AsString;
              // Quantidade Total (Masculino + Feminino) por Label
              iAtual := iAtual + QryTmp04.FieldByName('QTD').AsInteger;
              // Distinção por Sexo
              If (QryTmp04.FieldByName('SEXO').AsString = 'FEMININO') Then
               Begin
                 dtmRelatorioGerencial.qryGerencial02.FieldByName('QTDFEM').AsInteger   := QryTmp04.FieldByName('QTD').AsInteger;
                 dtmRelatorioGerencial.qryGerencial02.FieldByName('MEDIAFEM').AsString  := QryTmp04.FieldByName('MEDIA').AsString;
                 iFem  := QryTmp04.FieldByName('QTD').AsInteger;
                 iCtrl := iCtrl + 1;
               End
              Else
               Begin
                 dtmRelatorioGerencial.qryGerencial02.FieldByName('QTDMASC').AsInteger  := QryTmp04.FieldByName('QTD').AsInteger;
                 dtmRelatorioGerencial.qryGerencial02.FieldByName('MEDIAMASC').AsString := QryTmp04.FieldByName('MEDIA').AsString;
                 iMasc := QryTmp04.FieldByName('QTD').AsInteger;
                 iCtrl := iCtrl + 1;
               End;
              // Grava
              If (iCtrl = 2) Then
               Begin
                 // Atualiza Dados por Tipo no Label
                 If (QryTmp04.FieldByName('TIPO').AsString = 'PARTICIPANTE') Then
                  Begin
                    dtmRelatorioGerencial.qryGerencial02.FieldByName('QTDGERAL').AsInteger := iAtual;
                    dtmRelatorioGerencial.qryGerencial02.FieldByName('PERCENTUAL').AsFloat := (iAtual/iPart)*100;
                    dtmRelatorioGerencial.qryGerencial02.FieldByName('PERCFEM').AsFloat    := (iFem*100)/iAtual;
                    dtmRelatorioGerencial.qryGerencial02.FieldByName('PERCMASC').AsFloat   := (iMasc*100)/iAtual;
                  End
                 Else
                  Begin
                    dtmRelatorioGerencial.qryGerencial02.FieldByName('QTDGERAL').AsInteger := iAtual;
                    dtmRelatorioGerencial.qryGerencial02.FieldByName('PERCENTUAL').AsFloat := (iAtual/iNPart)*100;
                    dtmRelatorioGerencial.qryGerencial02.FieldByName('PERCFEM').AsFloat    := (iFem*100)/iAtual;
                    dtmRelatorioGerencial.qryGerencial02.FieldByName('PERCMASC').AsFloat   := (iMasc*100)/iAtual;
                  End;
                 // Grava
                 dtmRelatorioGerencial.qryGerencial02.Post;
                 dtmRelatorioGerencial.qryGerencial02.Insert;
                 iCtrl  := 0;
                 iAtual := 0;
                 iFem   := 0;
                 iMasc  := 0;
               End;
              bNext := True;
            End
           Else // Se não for do sexo especificado...
            Begin
              // Verifica iCtrl
              // --------------
              // Se nenhum label do tipo ainda foi realizado, faz o primeiro.
              If (iCtrl = 0) Then
               Begin
                 dtmRelatorioGerencial.qryGerencial02.FieldByName('PATRO').AsString := sPatro;
                 dtmRelatorioGerencial.qryGerencial02.FieldByName('TIPO').AsString  := sTipo;
                 dtmRelatorioGerencial.qryGerencial02.FieldByName('LABEL').AsString := QryTipo04.FieldByName('LABEL').AsString;
                 // Verifica Sexo
                 If (QryTipo04.FieldByName('SEXO').AsString = 'FEMININO') Then
                  Begin
                    dtmRelatorioGerencial.qryGerencial02.FieldByName('QTDFEM').AsInteger := 0;
                    dtmRelatorioGerencial.qryGerencial02.FieldByName('MEDIAFEM').AsFloat := 0;
                    dtmRelatorioGerencial.qryGerencial02.FieldByName('PERCFEM').AsFloat  := 0;
                  End
                 Else
                  Begin
                    dtmRelatorioGerencial.qryGerencial02.FieldByName('QTDMASC').AsInteger := 0;
                    dtmRelatorioGerencial.qryGerencial02.FieldByName('MEDIAMASC').AsFloat := 0;
                    dtmRelatorioGerencial.qryGerencial02.FieldByName('PERCMASC').AsFloat := 0;
                  End;
                 iCtrl := 1;
                 bNext := False;
               End
              Else If (iCtrl = 1) Then // Se 1 Label já foi realizado, faz o segundo.
               Begin

                 // Verifica Sexo
                 If (QryTipo04.FieldByName('SEXO').AsString = 'FEMININO') Then
                  Begin
                    dtmRelatorioGerencial.qryGerencial02.FieldByName('QTDFEM').AsInteger := 0;
                    dtmRelatorioGerencial.qryGerencial02.FieldByName('MEDIAFEM').AsFloat := 0;
                    dtmRelatorioGerencial.qryGerencial02.FieldByName('PERCFEM').AsFloat  := 0;
                  End
                 Else
                  Begin
                    dtmRelatorioGerencial.qryGerencial02.FieldByName('QTDMASC').AsInteger := 0;
                    dtmRelatorioGerencial.qryGerencial02.FieldByName('MEDIAMASC').AsFloat := 0;
                    dtmRelatorioGerencial.qryGerencial02.FieldByName('PERCMASC').AsFloat := 0;
                  End;

                 // Atualiza Dados por Tipo no Label
                 If (QryTmp04.FieldByName('TIPO').AsString = 'PARTICIPANTE') Then
                  Begin
                    dtmRelatorioGerencial.qryGerencial02.FieldByName('QTDGERAL').AsInteger := iAtual;
                    dtmRelatorioGerencial.qryGerencial02.FieldByName('PERCENTUAL').AsFloat := (iAtual/iPart)*100;
                  End
                 Else
                  Begin
                    dtmRelatorioGerencial.qryGerencial02.FieldByName('QTDGERAL').AsInteger := iAtual;
                    dtmRelatorioGerencial.qryGerencial02.FieldByName('PERCENTUAL').AsFloat := (iAtual/iNPart)*100;
                  End;
                 // Grava
                 dtmRelatorioGerencial.qryGerencial02.Post;
                 dtmRelatorioGerencial.qryGerencial02.Insert;
                 iCtrl  := 0;
                 iAtual := 0;
                 bNext  := False;
               End;
            End;
         End
        Else // Tipo e Label diferentes
         Begin
           // Verifica se o problema sestá no Tipo
           If (QryTmp04.FieldByName('TIPO').AsString  <> sTipo) Then
            Begin
              // Atualiza Tipo
              sTipo := QryTmp04.FieldByName('TIPO').AsString;
              bNext := False;
            End
           Else // Problema no Label
            Begin
              // Verifica iCtrl
              // --------------
              // Se nenhum label do tipo ainda foi realizado, faz o primeiro.
              If (iCtrl = 0) Then
               Begin
                 dtmRelatorioGerencial.qryGerencial02.FieldByName('PATRO').AsString := sPatro;
                 dtmRelatorioGerencial.qryGerencial02.FieldByName('TIPO').AsString  := sTipo;
                 dtmRelatorioGerencial.qryGerencial02.FieldByName('LABEL').AsString := QryTipo04.FieldByName('LABEL').AsString;
                 // Verifica Sexo
                 If (QryTipo04.FieldByName('SEXO').AsString = 'FEMININO') Then
                  Begin
                    dtmRelatorioGerencial.qryGerencial02.FieldByName('QTDFEM').AsInteger := 0;
                    dtmRelatorioGerencial.qryGerencial02.FieldByName('MEDIAFEM').AsFloat := 0;
                    dtmRelatorioGerencial.qryGerencial02.FieldByName('PERCFEM').AsFloat  := 0;
                  End
                 Else
                  Begin
                    dtmRelatorioGerencial.qryGerencial02.FieldByName('QTDMASC').AsInteger := 0;
                    dtmRelatorioGerencial.qryGerencial02.FieldByName('MEDIAMASC').AsFloat := 0;
                    dtmRelatorioGerencial.qryGerencial02.FieldByName('PERCMASC').AsFloat  := 0;
                  End;
                 iCtrl := 1;
                 bNext := False;
               End
              Else If (iCtrl = 1) Then // Se 1 Label já foi realizado, faz o segundo.
               Begin
                 // Verifica Sexo
                 If (QryTipo04.FieldByName('SEXO').AsString = 'FEMININO') Then
                  Begin
                    dtmRelatorioGerencial.qryGerencial02.FieldByName('QTDFEM').AsInteger := 0;
                    dtmRelatorioGerencial.qryGerencial02.FieldByName('MEDIAFEM').AsFloat := 0;
                    dtmRelatorioGerencial.qryGerencial02.FieldByName('PERCFEM').AsFloat  := 0;
                  End
                 Else
                  Begin
                    dtmRelatorioGerencial.qryGerencial02.FieldByName('QTDMASC').AsInteger := 0;
                    dtmRelatorioGerencial.qryGerencial02.FieldByName('MEDIAMASC').AsFloat := 0;
                    dtmRelatorioGerencial.qryGerencial02.FieldByName('PERCMASC').AsFloat  := 0;
                  End;
                 // Grava
                 dtmRelatorioGerencial.qryGerencial02.Post;
                 dtmRelatorioGerencial.qryGerencial02.Insert;
                 iCtrl := 0;
                 bNext := False;             
               End
              Else If (iCtrl > 1) Then // Se os 2 labels já foram realizado = ERRO.
               Begin
                 // ERRO a ser tratado
                 iCtrl := 0;
               End;
            End;
         End;

        // Próximo Registro, se for possível ...
        If bNext         Then  QryTmp04.Next;
        // Atualiza Variáveis
        If QryTipo04.Eof Then QryTipo04.First
        Else QryTipo04.Next;
      End;
//---------------------------------------------------------------------------------------------------
     // ------------
     // Relatório 05
     // ------------
     qryTmp04.Close;
     qryTmp04.SQL.Clear;
     qryTmp04.SQL.Add(
'SELECT DISTINCT '+
'       QRY.PATRO            , '+
'       QRY.IDPESSOA         , '+
'       QRY.TIPO             , '+
'       QRY.IDPF             , '+
'       QRY.FAIXA            , '+
'       QRY.IDRUBSALPARTICIP , '+
'       QRY.IDRUBSALMANUT    , '+
'       QRY.INTERVALO1       , '+
'       QRY.INTERVALO2       , '+
'       '+QuotedStr(sData1)+' AS MES '+
'/*--------------------------------------------------------------------------*/ '+
'FROM (SELECT PAT.NOME                           AS PATRO        , '+
'             PAT.IDPESSOA, '+
'             ''PARTICIPANTE''                     AS TIPO         , '+
'             EP.IDPESSOA                        AS IDPF         , '+
'             CFG.FAIXA                          AS FAIXA        , '+
'             PATRO.IDRUBSALPARTICIP , '+
'             PATRO.IDRUBSALMANUT    , '+
'             CFG.A1                             AS INTERVALO1   , '+
'             CFG.A2                             AS INTERVALO2 '+
'      /*--------------------------------------------------------------*/ '+
'      FROM PLANPREV    PL, PESSOA       PAT, SITPART SP, '+
'           EVENTOSPREV EP, PARTPREVPLAN PP , PATRO     , '+
'      /*--------------------------------------------------------------*/ '+
'           (SELECT MAX(IDEVENTOSPREV) IDEVENTOSPREV, IDPESSOA '+
'              FROM EVENTOSPREV '+
'              GROUP BY IDPESSOA) MAXEVENTO, '+
'      /*--------------------------------------------------------------*/ '+
'           (SELECT 0    AS A1, '+sVlrMeio+'        AS A2, '' ATÉ 1/2 VRS''      AS FAIXA '+
'              FROM PARAMAPREV '+
'            UNION '+
'            SELECT '+sVlrMeio+'  AS A1, '+sVlr+'   AS A2, '' DE 1/2 ATÉ 1 VRS'' AS FAIXA '+
'              FROM PARAMAPREV '+
'            UNION '+
'            SELECT '+sVlr+' AS A1, '+sVlrDobro+'   AS A2, ''DE 1 ATÉ 2 VRS''    AS FAIXA '+
'              FROM PARAMAPREV '+
'            UNION '+
'            SELECT '+sVlrDobro+' AS A1, '+sVlrCem+' AS A2, ''MAIS DE 2 VRS''     AS FAIXA '+
'              FROM PARAMAPREV) CFG '+
'      /*--------------------------------------------------------------*/ '+
'      WHERE (TO_CHAR(EP.DATAREGISTRO,''YYYY/MM'') <= '+QuotedStr(sData1)+') '+
'      AND   (SP.FLGINTERNO          <> ''AS'') '+
'      AND   (SP.FLGINTERNO          <> ''CA'') '+
'      AND   (SP.FLGINTERNO          <> ''CI'') '+
'      AND   (PL.IDPLANOPREV          = '+cmbPlano.LookupValue+') '+
'      AND   (PAT.IDPESSOA            = '+cmbPatrocinadora.LookupValue+') '+
'      AND   (PAT.IDPESSOA            = PATRO.IDPESSOA) '+
'      AND   (PP.IDPLANOPREV          = PL.IDPLANOPREV) '+
'      AND   (PP.IDPESSJUR            = PAT.IDPESSOA) '+
'      AND   (EP.IDSITPARTNOVO        = SP.IDSITPART) '+
'      AND   (EP.IDPESSJUR            = PP.IDPESSJUR) '+
'      AND   (EP.IDPLANOPREV          = PP.IDPLANOPREV) '+
'      AND   (EP.IDPESSOA             = PP.IDPESSOA) '+
'      AND   (EP.SEQPROPOSTA          = PP.SEQPROPOSTA) '+
'      AND   (MAXEVENTO.IDPESSOA      = EP.IDPESSOA) '+
'      AND   (MAXEVENTO.IDEVENTOSPREV = EP.IDEVENTOSPREV) '+
' '+
'      UNION '+
' '+
'      SELECT PAT.NOME                           AS PATRO        , '+
'             PAT.IDPESSOA, '+
'             ''NÃO PARTICIPANTE''                 AS TIPO         , '+
'             EL.IDPESSOA                        AS IDPF         , '+
'             CFG.FAIXA                          AS FAIXA        , '+
'             PATRO.IDRUBSALPARTICIP , '+
'             PATRO.IDRUBSALMANUT    , '+
'             CFG.A1, '+
'             CFG.A2 '+
'      /*--------------------------------------------------------------*/ '+
'      FROM PESSOA PAT, SITFUNC SF, ELEGPATRO EL, PATRO, '+
'      /*--------------------------------------------------------------*/ '+
'           (SELECT 0    AS A1, '+sVlrMeio+'        AS A2, '' ATÉ 1/2 VRS''      AS FAIXA '+
'              FROM PARAMAPREV '+
'            UNION '+
'            SELECT '+sVlrMeio+'  AS A1, '+sVlr+'   AS A2, '' DE 1/2 ATÉ 1 VRS'' AS FAIXA '+
'              FROM PARAMAPREV '+
'            UNION '+
'            SELECT '+sVlr+' AS A1, '+sVlrDobro+'   AS A2, ''DE 1 ATÉ 2 VRS''    AS FAIXA '+
'              FROM PARAMAPREV '+
'            UNION '+
'            SELECT '+sVlrDobro+' AS A1, '+sVlrCem+' AS A2, ''MAIS DE 2 VRS''     AS FAIXA '+
'              FROM PARAMAPREV) CFG '+
'      /*--------------------------------------------------------------*/ '+
'      WHERE (SF.FLGINTERNO      <> ''D'') '+
'      AND   (SF.FLGINTERNO      <> ''M'') '+
'      AND   (SF.FLGINTERNO      <> ''P'') '+
'      AND   (PAT.IDPESSOA        = '+cmbPatrocinadora.LookupValue+') '+
'      AND   (PAT.IDPESSOA        = PATRO.IDPESSOA) '+
'      AND   (EL.IDPESSJUR        = PAT.IDPESSOA) '+
'      AND   (EL.IDSITFUNC        = SF.IDSITFUNC) '+
'      AND   ((EL.PARTICIPPREVID  = 0) '+
'      OR     (EL.IDPESSOA IN (SELECT PP.IDPESSOA '+
'                                FROM PARTPREVPLAN PP, SITPLANOPREV SP '+
'                                WHERE (SP.FLGINTERNO IN (''CA'', ''CI'')) '+
'                                AND   (PP.IDPLANOPREV    = '+cmbPlano.LookupValue+') '+
'                                AND   (PP.IDPESSJUR      = '+cmbPatrocinadora.LookupValue+') '+
'                                AND   (PP.IDSITPLANOPREV = SP.IDSITPLANOPREV)))) ) QRY '+
'/*--------------------------------------------------------------------------*/ '+
'ORDER BY QRY.PATRO ASC, QRY.TIPO ASC, QRY.FAIXA DESC');
     // Abre Querys
     qryTmp04.Open;                         
     qryDetalhe.Open;
     dtmRelatorioGerencial.QryGer02Sub01.Close;
     dtmRelatorioGerencial.QryGer02Sub01.Open;
     dtmRelatorioGerencial.QryGer02Sub01.Edit;
     // Inicializa Variáveis
     sPatro                    := QryTmp04.FieldByName('PATRO').AsString;
     sTipo                     := QryTmp04.FieldByName('TIPO').AsString;
     sFaixa                    := QryTmp04.FieldByName('FAIXA').AsString;
     sMes                      := QryTmp04.FieldByName('MES').AsString;
     fValor                    := 0;
     iAtual                    := 0;
     dRelatGerencial.iTotTipo1 := 0;
     dRelatGerencial.iTotTipo2 := 0;     
     // Loop para o preenchimento da query virtual
     While Not QryTmp04.Eof Do
      Begin
        If (sPatro <> QryTmp04.FieldByName('PATRO').AsString) Or
           (sTipo  <> QryTmp04.FieldByName('TIPO').AsString)  Or
           (sFaixa <> QryTmp04.FieldByName('FAIXA').AsString) Then
         Begin
           // Bacalhau
           // Grava e pega nova Patro, Tipo e Faixa
           dtmRelatorioGerencial.QryGer02Sub01.FieldByName('PATRO').AsString        := sPatro;
           dtmRelatorioGerencial.QryGer02Sub01.FieldByName('TIPO').AsString         := sTipo;
           dtmRelatorioGerencial.QryGer02Sub01.FieldByName('FAIXA').AsString        := sFaixa;
           dtmRelatorioGerencial.QryGer02Sub01.FieldByName('MES').AsString          := sMes;
           dtmRelatorioGerencial.QryGer02Sub01.FieldByName('VALORABSOLUTO').AsFloat := iAtual;
           // Se a quantidade for > 0 faz a média salaria (Erro: divisão por zero)
           If (iAtual > 0) Then dtmRelatorioGerencial.QryGer02Sub01.FieldByName('MEDIASALARIAL').AsFloat := fValor/iAtual
           Else dtmRelatorioGerencial.QryGer02Sub01.FieldByName('MEDIASALARIAL').AsFloat := 0;
           // Grava e abre póximo registro para inserção
           dtmRelatorioGerencial.QryGer02Sub01.Post;
           dtmRelatorioGerencial.QryGer02Sub01.Insert;
           // Verifica se é Participante ou Não
           If (sTipo = 'PARTICIPANTE') Then dRelatGerencial.iTotTipo1 := dRelatGerencial.iTotTipo1 + iAtual
           Else dRelatGerencial.iTotTipo2 := dRelatGerencial.iTotTipo2 + iAtual;
           // Atualiza Variáveis
           fValor := 0;
           iAtual := 0;
           sFaixa := QryTmp04.FieldByName('FAIXA').AsString;
           sTipo  := QryTmp04.FieldByName('TIPO').AsString;
           sPatro := QryTmp04.FieldByName('PATRO').AsString;
         End;
        // Continua acumulando Faixa
        fValor := fValor + QryDetalhe.FieldByName('VALOR').AsFloat;
        If (QryDetalhe.FieldByName('VALOR').AsFloat > 0) Then iAtual := iAtual + 1;
        // Próximo Registro
        QryTmp04.Next;
      End;
     // Fecha Querys Auxiliares
     qryTmp04.Close;
     qryDetalhe.Close;
     // Form de Aviso
//---------------------------------------------------------------------------------------------------
     // ------------
     // Relatório 06
     // ------------
     dtmRelatorioGerencial.QryGer02Sub02.Close;
     dtmRelatorioGerencial.QryGer02Sub02.SQL.Clear;
     dtmRelatorioGerencial.QryGer02Sub02.SQL.Add(
'SELECT PAT.NOME                      AS PATRO       , '+
'       CFG.FAIXA                                    , '+
'       COUNT(*)                      AS FREQABSOLUTA, '+
'       (SUM(HST.VALOROP1)/COUNT(*) ) AS MEDIA '+
'FROM PESSOA PAT, HSTCONTRIBPREV HST, PARAMAPREV PP,'+
'/*-----------------------------------------------------------------*/ '+
'     (SELECT ''De 0.1 a 3%'' AS FAIXA, '+
'             0.1             AS A1   , '+
'             3               AS A2 '+
'      FROM PARAMAPREV '+
'      UNION '+
'      SELECT ''De 3 a 5%''   AS FAIXA, '+
'             3               AS A1   , '+
'             5               AS A2 '+
'      FROM PARAMAPREV '+
'      UNION '+
'      SELECT ''De 5 a 8%''   AS FAIXA, '+
'             5               AS A1   , '+
'             8               AS A2 '+
'      FROM PARAMAPREV '+
'      UNION '+
'      SELECT ''De 8 a 11%''   AS FAIXA, '+
'             8                AS A1   , '+
'             11               AS A2 '+
'      FROM PARAMAPREV '+
'      UNION '+
'      SELECT ''Mais de 11%''  AS FAIXA, '+
'             11               AS A1  , '+
'             1100             AS A2 '+
'      FROM PARAMAPREV) CFG '+
'/*-----------------------------------------------------------------*/ '+
'WHERE  (HST.IDCONTRIBUICAO = '+IntToStr(iIdContribuicao)+') '+
'AND    (HST.MESREFERENCIA  = '+QuotedStr(sData1)+') '+
'AND    (HST.IDPESSJUR      = '+cmbPatrocinadora.LookupValue+') '+
'AND    (HST.IDMOTIVO       = PP.IDMOTIVOCONTRIBP) '+
'AND    (HST.IDPESSJUR      = PAT.IDPESSOA) '+
'AND    (HST.VALOROP1      >= CFG.A1) '+
'AND    (HST.VALOROP1       < CFG.A2) '+
'GROUP BY PAT.NOME, CFG.FAIXA '+
'ORDER BY PAT.NOME, CFG.FAIXA');

      // Lança Labels no Relatório
      // -------------------------
     dtmRelatorioGerencial.lbVrs.Caption     := FormatFloat('###,###,##0.00',dtVrs.Value);
     dtmRelatorioGerencial.lbPlano01.Caption := cmbPlano.Value;
     dtmRelatorioGerencial.lbPlano02.Caption := cmbPlano.Value;
     dtmRelatorioGerencial.lbPlano03.Caption := cmbPlano.Value;
     // Abre Query Fundação
     // -------------------
     DtmRelatorioGerencial.qryFundacao.Close;
     DtmRelatorioGerencial.qryFundacao.ParamByName('pFundacao').AsInteger := UAdmPrev.iIdFundacao;
     DtmRelatorioGerencial.qryFundacao.Open;
   End
  Else ModalResult := mrNone;
end;

procedure TfrmParamRelGerencial02.cmbPlanoChange(Sender: TObject);
begin
  inherited;
  // Abre query de Contribuição
  QryContribuicao.Close;
  QryContribuicao.ParamByName('IDPLANO').AsInteger := StrToInt(cmbPlano.LookupValue);
  QryContribuicao.Open;
  // Verifica se existe o tipo de contribuição especificado na query
  If (QryContribuicao.IsEmpty) Then
   Begin
     If MessageDlg('A Contribuição Suplementar Facultativa não existe neste Plano, você deseja continuar ?',mtConfirmation, [mbYes,mbNo],0) = mrNo Then
      Begin
        frmParamRelGerencial02.Enabled := True;
        cmbPlano.SetFocus;
      End;
   End
  Else iIdContribuicao := QryContribuicao.FieldByName('IDCONTRIBUICAO').AsInteger;
end;

end.
