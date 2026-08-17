// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Vinicius Eduardo Nascimento Maciel
// Data        : 12/05/2011
// Rotina      : MontaSQLValores
// Pendência   : SOL 133646 KINTANA 780791
// Descricao   : Remocao dos idcontribuicao
// *****************************************************************************
// Autor(a)    : Ricardo de Freitas Araújo
// Data        : 27/01/2010
// Rotina      : MontaSQLValores
// Pendência   : SOL 151602 KINTANA 1114747
// Descricao   : Inclusão do idcontribuicao 690,691,689 e 35 na condição da query.
// *****************************************************************************
// Autor(a)    : Marcos Luiz de Jesus
// Data        : 17/06/2010
// Rotina      : MontaSQLValores
// Pendência   : SOL 136904 KINTANA 837295
// Descricao   : Inclusão do idcontribuicao 695 na condição da query.
// *****************************************************************************
// Autor(a)    : Marcos Luiz de Jesus
// Data        : 01/06/2010
// Rotina      : MontaSQLValores
// Pendência   : SOL 136535 KINTANA 820343
// Descricao   : Inclusão do idcontribuicao 692,693 na condição da query.
// *****************************************************************************
// Autor(a)    : Fábio Henrique Beccaria Sampaio
// Data        : 26/04/2010
// Rotina      : MontaSQLValores
// Pendência   : 134514_793613
// Descricao   : Alteração nas contribuições a serem buscadas.
//------------------------------------------------------------------------------
// Autor(a)    : Bruno Bastos
// Data        : 12/02/2010
// Rotina      : MontaEndereco
// Pendência   : 131008_740127
// Descricao   : Alteração na colsuta que busca cs endereços.
//------------------------------------------------------------------------------
// Autor(a)    : Marilza Colpani
// Data        : 10/02/2010
// Rotina      : MontaSQLValores
// Pendência   : 130940_738541
// Descricao   : Correção nas contribuições a serem buscadas.
//------------------------------------------------------------------------------
// Autor(a)    : Bruno Bastos
// Data        : 09/02/2010
// Rotina      : MontaSQLValores
// Pendência   : 130873_737515
// Descricao   : Tratar o campo flgdevolução no campo valorrecebido que agora é
//               usado no lugar do totalrecebido.
//------------------------------------------------------------------------------
// Autor(a)    : Bruno Bastos
// Data        : 03/02/2010
// Rotina      : Várias
// Pendência   : 130432_732115
// Descricao   : Alteração para usar o campo valorrecebido no lugar de totalrecebido.
//------------------------------------------------------------------------------
// Autor(a)    : Bruno Bastos
// Data        : 25/01/2010
// Rotina      : MontaSQLValores
// Pendência   : 130204_719119
// Descricao   : Alteração nas contribuições a serem buscadas.
//------------------------------------------------------------------------------
// Autor(a)    : Bruno Bastos
// Data        : 20/04/2009
// Rotina      : MontaSQLValores
// Pendência   : SOL 114433 KINTANA 535461
// Descricao   : Inclusão do idcontribuicao 359, 461, 602, 625 na condição da query.
//------------------------------------------------------------------------------
// Autor(a)    : Bruno Bastos
// Data        : 23/03/2009
// Rotina      : MontaSQLValores
// Pendência   : SOL 111735 KINTANA  518034
// Descricao   : Inclusão do idcontribuicao 602 na condição da query.
//------------------------------------------------------------------------------
// Autor(a)    : Bruno Bastos
// Data        : 23/03/2009
// Rotina      : MontaSQLValores
// Pendência   : SOL 110773 KINTANA 518202
// Descricao   : Inclusão do idcontribuicao 461 e idcontribuicao 625 na condição da query.
//------------------------------------------------------------------------------
// Autor(a)    : Bruno Bastos
// Data        : 12/03/2009
// Rotina      : MontaSQLValores
// Pendência   : SOL 111091 KINTANA  513139
// Descricao   : Inclusão do idcontribuicao 318 na condição da query.
//------------------------------------------------------------------------------
// Autor(a)    : Bruno Bastos
// Data        : 19/02/2009
// Rotina      : btnGeraTXTClick
// Pendência   : SOL 109607 KINTANA  497477
// Descricao   : Alteração para usar a query que o cliente pediu para ser usada pela tela.
//------------------------------------------------------------------------------
// Autor(a)    : Ádler Teodoro de Souza
// Data        : 12/02/2009
// Rotina      : Gerar TXT
// Pendência   : SOL 108697 KINTANA  492829
// Descricao   : Retirei as linhas do processo de geração de acordo com a solicitação.
//------------------------------------------------------------------------------
// Autor(a)    : Bruno Bastos
// Data        : 19/02/2008
// Rotina      : MontaSQLValores
// Pendência   : 27357
// Descricao   : Infelizmente tive que colocar o if iTipoCliente.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 26/09/2007
// Rotina      : Relatório Facultativos
// Pendência   : 25053
// Descricao   : Alteração na query principal para filtrar contribuições de mantido e/ou banco
//------------------------------------------------------------------------------
// Autor(a)    : Bruno Bastos
// Data        : 27/03/2007
// Rotina      : Relatório Facultativos
// Pendência   : 24805
// Descricao   : Alteração na query principal e nos labels do relatório.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 07/02/2007
// Rotina      : Relatório Facultativos
// Pendência   : 24418
// Descricao   : alteração na consulta que busca as informações do informe de contribuição facultativas
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 23/02/2006
// Rotina      : Relatório Facultativos
// Pendência   : 21633
// Descricao   : Inclusão de contribuições de anos anteriores (devolução, atraso e total)
//------------------------------------------------------------------------------
unit fRelatInformeFacultativo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, uCmSqlParams, StdCtrls, Mask, wwdbedit, Wwdbspin,
  mParticipante, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr,
  TB97, ExtCtrls, Db, DBClient, uCMClientDataSet, uSistema;

type
  TfrmRelatInformeFacultativo = class(TfrmOkCancelar)
    molParticipante: TmolParticipante;
    Label5: TLabel;
    dbspnAnoBase: TwwDBSpinEdit;
    Label1: TLabel;
    dbSpnExercicio: TwwDBSpinEdit;
    sqlValores: TCMSqlParams;
    cdsValores: TCMClientDataSet;
    cdsDadosParticipante: TCMClientDataSet;
    cdsDadosParticipanteNOME_PART: TStringField;
    cdsDadosParticipanteMATRICULA: TStringField;
    cdsDadosParticipanteCPF: TStringField;
    cdsDadosParticipantePATRO: TStringField;
    cdsDadosParticipanteCGC: TStringField;
    sqlDadosParticipante: TCMSqlParams;
    btnGeraTXT: TBitBtn;
    Save: TSaveDialog;
    sqlEndereco: TCMSqlParams;
    cdsEndereco: TCMClientDataSet;
    ChkBxAutoPatro: TCheckBox;
    Label2: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGeraTXTClick(Sender: TObject);
  private
    { Private declarations }

    fValorEmpregado : Currency;
    fValorEmpresa   : Currency;
    fValorCorrecao  : Currency;
    fValorJuros     : Currency;
    fValorMulta     : Currency;
    fOutros         : Currency;
    iTipoCliente    : Integer;

    procedure MontaSQLValores;
    procedure MontaSQLDadosParticipante(iPessoa : Int64);
    procedure MontaDados;
    procedure MontaEndereco(sMatricula : String);

    function  Completa(sNome: String; iTam : integer):String;
    function  CompletaZero(sNome: String; iTam : integer):String;
    function  OraNumero (Numero: string): string;

  public
    { Public declarations }
  end;

var
  frmRelatInformeFacultativo: TfrmRelatInformeFacultativo;

implementation

uses dRelatInformeFacultativo;

{$R *.DFM}


procedure TfrmRelatInformeFacultativo.bbtnConfirmarClick(Sender: TObject);
begin
   MontaDados;
   inherited;
end;



procedure TfrmRelatInformeFacultativo.FormShow(Sender: TObject);
var
   iAno, iMes, iDia : word;
begin
   inherited;
   DecodeDate(Date,iAno, iMes, iDia);
   dbspnAnoBase.Value   := iAno;
   dbSpnExercicio.Value := iAno + 1;
   iTipoCliente:= Sistema.TipoCliente; //CPrev - 23/01/2008
end;



procedure TfrmRelatInformeFacultativo.MontaDados;
var
   sMatricula      : String;
   sNome           : String;
   rdevolucao, ratraso, rtotalant: real; 
begin
   dtmInformeFacultativo.lblExercicio.Caption  := FloatToStr(dbSpnExercicio.Value);
   dtmInformeFacultativo.lblAnoBase.Caption    := FloatToStr(dbSpnAnoBase.Value);
   dtmInformeFacultativo.lblAnoBaseDet.Caption := FloatToStr(dbSpnAnoBase.Value);

   dtmInformeFacultativo.cdsInformeFacultativo.Close;
   with dtmInformeFacultativo.sqlInformeFacultativo do
   begin
      Open;
   end;

   MontaSQLValores;
   sqlValores.SQL.SaveToFile(Sistema.TempDir + 'SQLVALORES.TXT');
   sqlValores.Open;
   while not cdsValores.Eof do
   begin
      sMatricula := cdsValores.FieldByName('MATRICULA').AsString;
      sNome      := cdsValores.FieldByName('NOME').AsString;

      MontaSQLDadosParticipante(cdsValores.FieldByName('IDPESSOA').AsInteger);
      sqlDadosParticipante.Open;

      fValorEmpregado := 0;
      fValorEmpresa   := 0;
      fValorCorrecao  := 0;
      fValorJuros     := 0;
      fValorMulta     := 0;
      fOutros         := 0;

      rdevolucao:=0;
      ratraso:=0;
      rtotalant:=0;

      {
      while (sMatricula = cdsValores.FieldByName('MATRICULA').AsString) and
            (not cdsValores.Eof) do
      begin
         if cdsValores.FieldByName('TIPO').AsString = 'EMPREGADO' then
         begin
            fValorEmpregado := cdsValores.FieldByName('VALORPAGO').AsCurrency;
         end;

         if cdsValores.FieldByName('TIPO').AsString = 'EMPRESA' then
         begin
            fValorEmpresa := cdsValores.FieldByName('VALORPAGO').AsCurrency;
         end;


         if cdsValores.FieldByName('TIPO').AsString = 'EMPRESA' then
         Begin
           if cdsValores.FieldByName('VALORPAGO_ANOANTERIOR').AsCurrency <> 0 then
             rdevolucao:=rdevolucao+abs(cdsValores.FieldByName('VALORPAGO_ANOANTERIOR').AsCurrency);
         End
         Else
         Begin

           if cdsValores.FieldByName('VALORPAGO_ANOANTERIOR').AsCurrency <> 0 then
             ratraso:=ratraso+abs(cdsValores.FieldByName('VALORPAGO_ANOANTERIOR').AsCurrency);
         End;


         rtotalant:=rtotalant+cdsValores.FieldByName('VALORPAGO_ANOANTERIOR').AsCurrency;

         if cdsValores.FieldByName('TIPO').AsString = 'ALTERADOR' then
         begin
            if Pos('JUROS', UpperCase(cdsValores.FieldByName('NOMEALTERADOR').AsString)) > 0 then
            begin
               fValorJuros := fValorJuros + cdsValores.FieldByName('VALORPAGO').AsCurrency;
            end
            else
            if Pos('MULTA', UpperCase(cdsValores.FieldByName('NOMEALTERADOR').AsString)) > 0 then
            begin
               fValorMulta := fValorMulta + cdsValores.FieldByName('VALORPAGO').AsCurrency;
            end
            else
            if Pos('MONET', UpperCase(cdsValores.FieldByName('NOMEALTERADOR').AsString)) > 0 then
            begin
               fValorCorrecao := fValorCorrecao + cdsValores.FieldByName('VALORPAGO').AsCurrency;
            end
            else
               fOutros := fOutros + cdsValores.FieldByName('VALORPAGO').AsCurrency;

         end;
      end;
      }

      with dtmInformeFacultativo.cdsInformeFacultativo do
      begin
         Append;
         FieldByName('NOME_PART').AsString := sNome;
         FieldByName('MATRICULA').AsString := sMatricula;
         FieldByName('CPF').AsString       := cdsDadosParticipante.FieldByName('CPF').AsString;
         FieldByName('PATRO').AsString     := cdsDadosParticipante.FieldByName('PATRO').AsString;
         FieldByName('CGC').AsString       := cdsDadosParticipante.FieldByName('CGC').AsString;
         FieldByName('CONTREMPR').AsFloat  := fValorEmpregado;
         FieldByName('CONTRPATRO').AsFloat := fValorEmpresa;
         FieldByName('CORRECAO').AsFloat   := fValorCorrecao;
         FieldByName('JUROS').AsFloat      := fValorJuros;
         FieldByName('MULTA').AsFloat      := fValorMulta;
         FieldByName('OUTROS').AsFloat     := fOutros;
         //FieldByName('TOTAL').AsFloat      := fValorEmpregado + fValorEmpresa + fValorCorrecao + fValorJuros + fValorMulta + fOutros;
         FieldByName('TOTALRECEBIDO').AsFloat  := cdsValores.FieldByName('TOTALRECEBIDO').AsFloat;
         FieldByName('VALORRECEBIDO').AsFloat  := cdsValores.FieldByName('VALORRECEBIDO').AsFloat; //Bruno Bastos - Sol: 130432 - Kintana: 732115
         FieldByName('ATRASOANT').AsFloat  := abs(ratraso);
         FieldByName('DEVOLANT').AsFloat   := abs(rdevolucao);
         FieldByName('TOTALANT').AsFloat   := abs(rtotalant);
         Post;
      end;
      cdsValores.Next;
   end;

   dtmInformeFacultativo.cdsInformeFacultativo.First;

end;



procedure TfrmRelatInformeFacultativo.MontaSQLDadosParticipante(iPessoa : Int64);
var
   sSQL : String;
begin
   sSQL :=
   'SELECT '                                                  + #13 +
   '    PES.NOME AS NOME_PART, '                              + #13 +
   '    DEP.MATRICULA, '                                      + #13 +
   '    CPF.NUMDOCUMENTO AS CPF, '                            + #13 +
   '    PAT.NOME AS PATRO, '                                  + #13 +
   '    CGC.NUMDOCUMENTO AS CGC '                             + #13 +
   'FROM '                                                    + #13 +
   '    PESSOA PES, '                                         + #13 +
   '    PESSOA PAT, '                                         + #13 +
   '    DOCPESSOA CPF, '                                      + #13 +
   '    DOCPESSOA CGC, '                                      + #13 +
   '    DEPENTIT DEP '                                        + #13 +
   'WHERE '                                                   + #13 +
   '    DEP.IDPESSOA       = ' + IntToStr(iPessoa)            + #13 +
   'AND PAT.IDPESSOA       = ' + IntToStr(Sistema.IdEmpresa)  + #13 +
   'AND CPF.IDDOCUMENTO(+) = 2 '                              + #13 +
   'AND CGC.IDDOCUMENTO    = 1 '                              + #13 +
   'AND PES.IDPESSOA       = DEP.IDPESSOA '                   + #13 +
   'AND PES.IDPESSOA       = CPF.IDPESSOA(+) '                + #13 +
   'AND CGC.IDPESSOA       = PAT.IDPESSOA '                   + #13;

   cdsDadosParticipante.Close;
   sqlDadosParticipante.Sql.Text := sSQL;
end;


procedure TfrmRelatInformeFacultativo.MontaSQLValores;
var
   sSQL : String;
begin
(* Bruno Bastos - SOL 109607 KINTANA  497477 - Comentei para alterar a query.
  if iTipoCliente = 19991 then
  begin
    sSQL :=
    'SELECT  '                                                                                                + #13 +

    '   CODTIPO, IDPESSOA, TIPO, MATRICULA, NOME, CODALTERADOR, NOMEALTERADOR, '                              + #13 +
    '   (CASE WHEN VALORPAGO_ANOANTERIOR > 0 '                                                                + #13 +
    '         THEN 0 '                                                                                        + #13 +
    '         ELSE NVL( VALORPAGO_ANOANTERIOR, 0) '                                                           + #13 +
    '    END) VALORPAGO_ANOANTERIOR, '                                                                        + #13 +
    '   (CASE WHEN VALORPAGO_ANOANTERIOR > 0 '                                                                + #13 +
    '         THEN (NVL( VALORPAGO, 0) + NVL( VALORPAGO_ANOANTERIOR, 0)) '                                    + #13 +
    '         ELSE  NVL( VALORPAGO, 0) '                                                                      + #13 +
    '    END) VALORPAGO '                                                                                     + #13 +

    'FROM '                                                                                                   + #13 +
    '   ( '                                                                                                   + #13 +
    'SELECT CODTIPO, IDPESSOA, TIPO, MATRICULA, NOME, CODALTERADOR, '                                         + #13 +
    '       NOMEALTERADOR, SUM(VALORPAGO_ANOANTERIOR) VALORPAGO_ANOANTERIOR, '                                + #13 +
    '       SUM(VALORPAGO) VALORPAGO '                                                                        + #13 +
    'FROM '                                                                                                   + #13 +
    '   ( '                                                                                                   + #13 +
    '     SELECT '                                                                                            + #13 +
    '          1 AS CODTIPO, '                                                                                + #13 +
    '          P.IDPESSOA, '                                                                                  + #13 +
    '          ''EMPREGADO'' AS TIPO, '                                                                       + #13 +
    '          EL.MATRICULA, '                                                                                + #13 +
    '          P.NOME, '                                                                                      + #13 +
    '          -1 AS CODALTERADOR, '                                                                          + #13 +
    '          '''' AS NOMEALTERADOR, '                                                                         + #13 +
    '          (CASE '                                                                                        + #13 +
    '           WHEN SUBSTR(H.MESREFERENCIA, 1,4) < ' + QuotedStr(FloatToStr(dbSpnAnoBase.Value)) + ' THEN '  + #13 +
    '                SUM(DECODE(NVL(H.FLGDEVOLUCAO,0),0,H.VALORRECEBIDO,-H.VALORRECEBIDO)) '                  + #13 +
    '           END) AS VALORPAGO_ANOANTERIOR, '                                                              + #13 +
    '          (CASE '                                                                                        + #13 +
    '           WHEN SUBSTR(H.MESREFERENCIA, 1,4) >= ' + QuotedStr(FloatToStr(dbSpnAnoBase.Value)) + ' THEN ' + #13 +
    '                SUM(DECODE(NVL(H.FLGDEVOLUCAO,0),0,H.VALORRECEBIDO,-H.VALORRECEBIDO)) '                  + #13 +
    '           END) AS VALORPAGO '                                                                           + #13 +

    '     FROM '                                                                                              + #13 +
    '          PESSOA P, '                                                                                    + #13 +
    '          ELEGPATRO EL, '                                                                                + #13 +
    '          HSTCONTRIBPREV H, '                                                                            + #13 +
    '          CONTPREV CP '                                                                                  + #13 +
    '      WHERE '                                                                                            + #13 +
    '        CP.FLGPAGADOR = ''C'''                                                                           + #13 ;

    If ( ChkBxAutoPatro.Checked = True  )
    Then sSQL := sSQL +   ' AND ( ( H.FOLHAORIGEM = ''C'' ) AND ( H.FLGSITFUNDACAO IN (''MA'', ''MP'', ''MS'') ) ) '
    Else sSQL := sSQL +   ' AND ( H.FOLHAORIGEM = ''C'') ';

    if molParticipante.iParticipante > 0 then
      sSQL := sSQL + '      AND P.IDPESSOA     = ' +  IntToStr(molParticipante.iParticipante)                 + #13 ;

    sSQL := sSQL +
    '      AND CP.IDCONTRIBUICAO IN (1,19,26,52,54,215,358,560,600,601,621,624,626,631,636) '         + #13 +
    '      AND H.MESCOBRANCA >= ' + QuotedStr(FloatToStr(dbSpnAnoBase.Value) + '/01')                         + #13 +
    '      AND H.MESCOBRANCA <= ' + QuotedStr(FloatToStr(dbSpnAnoBase.Value) + '/12')                         + #13 +
    '      AND NVL(H.FLGDESCFOLHA,0) = 0 '                                                                    + #13 +
    '      AND NVL(H.SITRECEBIMENTO,0) IN (2,3,5) '                                                           + #13 +
    '      AND CP.IDPLANOPREV    = H.IDPLANOPREV '                                                            + #13 +
    '      AND CP.IDCONTRIBUICAO = H.IDCONTRIBUICAO '                                                         + #13 +
    '      AND EL.IDPESSJUR = H.IDPESSJUR '                                                                   + #13 +
    '      AND EL.IDPESSOA = H.IDPESSOA '                                                                     + #13 +
    '      AND P.IDPESSOA = EL.IDPESSOA '                                                                     + #13 +
    '      GROUP BY '                                                                                         + #13 +
    '          P.IDPESSOA, '                                                                                  + #13 +
    '          EL.MATRICULA, '                                                                                + #13 +
    '          P.NOME, '                                                                                      + #13 +
    '          SUBSTR(H.MESREFERENCIA, 1,4)) '                                                                + #13 +
    'GROUP BY CODTIPO, IDPESSOA, TIPO, MATRICULA, NOME, CODALTERADOR, '                                       + #13 +
    '         NOMEALTERADOR '                                                                                 + #13 +

    'UNION '                                                                                                  + #13 +
    'SELECT CODTIPO, IDPESSOA, TIPO, MATRICULA, NOME, CODALTERADOR, '                                         + #13 +
    '       NOMEALTERADOR, SUM(VALORPAGO_ANOANTERIOR) VALORPAGO_ANOANTERIOR, '                                + #13 +
    '       SUM(VALORPAGO) VALORPAGO '                                                                        + #13 +
    'FROM '                                                                                                   + #13 +
    '  (SELECT '                                                                                              + #13 +
    '          2 AS CODTIPO, '                                                                                + #13 +
    '          P.IDPESSOA, '                                                                                  + #13 +
    '          ''EMPRESA'' AS TIPO, '                                                                         + #13 +
    '          EL.MATRICULA, '                                                                                + #13 +
    '          P.NOME, '                                                                                      + #13 +
    '          -1 AS CODALTERADOR, '                                                                          + #13 +
    '          '''' AS NOMEALTERADOR, '                                                                         + #13 +
    '          (CASE '                                                                                        + #13 +
    '           WHEN SUBSTR(H.MESREFERENCIA, 1,4) < ' + QuotedStr(FloatToStr(dbSpnAnoBase.Value)) + ' THEN '  + #13 +
    '                SUM(DECODE(NVL(H.FLGDEVOLUCAO,0),0,H.VALORRECEBIDO,-H.VALORRECEBIDO)) '                  + #13 +
    '           END) AS VALORPAGO_ANOANTERIOR, '                                                              + #13 +
    '          (CASE '                                                                                        + #13 +
    '           WHEN SUBSTR(H.MESREFERENCIA, 1,4) >= ' + QuotedStr(FloatToStr(dbSpnAnoBase.Value)) + ' THEN ' + #13 +
    '                SUM(DECODE(NVL(H.FLGDEVOLUCAO,0),0,H.VALORRECEBIDO,-H.VALORRECEBIDO)) '                  + #13 +
    '           END) AS VALORPAGO '                                                                           + #13 +
    '   FROM '                                                                                                + #13 +
    '          PESSOA P, '                                                                                    + #13 +
    '          ELEGPATRO EL, '                                                                                + #13 +
    '          HSTCONTRIBPREV H, '                                                                            + #13 +
    '          CONTPREV CP '                                                                                  + #13 +
    '      WHERE '                                                                                            + #13 +
    '            (CP.FLGPAGADOR IN (''C'',''P'')) '                                                           + #13 +
    '        AND (CP.IDCONTRIBUICAO IN (18,35,318,359,622,625,632,637)) '                                     + #13 ;

    If ( ChkBxAutoPatro.Checked = True  )
    Then sSQL := sSQL +   ' AND ( ( H.FOLHAORIGEM = ''C'' ) AND ( H.FLGSITFUNDACAO IN (''MA'', ''MP'', ''MS'') ) ) '
    Else sSQL := sSQL +   ' AND ( H.FOLHAORIGEM = ''C'') ';

    if molParticipante.iParticipante > 0 then
      sSQL := sSQL + '      AND P.IDPESSOA     = ' +  IntToStr(molParticipante.iParticipante)                 + #13 ;

    sSQL := sSQL +
    '      AND H.MESCOBRANCA >= ' + QuotedStr(FloatToStr(dbSpnAnoBase.Value) + '/01')                         + #13 +
    '      AND H.MESCOBRANCA <= ' + QuotedStr(FloatToStr(dbSpnAnoBase.Value) + '/12')                         + #13 +
    '      AND NVL(H.FLGDESCFOLHA,0) = 0 '                                                                    + #13 +
    '      AND NVL(H.SITRECEBIMENTO,0) IN (2,3,5) '                                                           + #13 +
    '      AND CP.IDPLANOPREV    = H.IDPLANOPREV '                                                            + #13 +
    '      AND CP.IDCONTRIBUICAO = H.IDCONTRIBUICAO '                                                         + #13 +
    '      AND EL.IDPESSJUR = H.IDPESSJUR '                                                                   + #13 +
    '      AND EL.IDPESSOA = H.IDPESSOA '                                                                     + #13 +
    '      AND P.IDPESSOA = EL.IDPESSOA '                                                                     + #13 +
    '      GROUP BY '                                                                                         + #13 +
    '          P.IDPESSOA, '                                                                                  + #13 +
    '          EL.MATRICULA, '                                                                                + #13 +
    '          P.NOME, '                                                                                      + #13 +
    '          SUBSTR(H.MESREFERENCIA, 1,4)) '                                                                + #13 +
    'GROUP BY CODTIPO, IDPESSOA, TIPO, MATRICULA, NOME, CODALTERADOR, '                                       + #13 +
    '         NOMEALTERADOR '                                                                                 + #13 +
    'UNION '                                                                                                  + #13 +
    'SELECT CODTIPO, IDPESSOA, TIPO, MATRICULA, NOME, CODALTERADOR, '                                         + #13 +
    '       NOMEALTERADOR, SUM(VALORPAGO_ANOANTERIOR) VALORPAGO_ANOANTERIOR, '                                + #13 +
    '       SUM(VALORPAGO) VALORPAGO '                                                                        + #13 +
    'FROM '                                                                                                   + #13 +
    '   (SELECT '                                                                                             + #13 +
    '          3 AS CODTIPO, '                                                                                + #13 +
    '          P.IDPESSOA, '                                                                                  + #13 +
    '          ''ALTERADOR'' AS TIPO, '                                                                       + #13 +
    '          EL.MATRICULA, '                                                                                + #13 +
    '          P.NOME, '                                                                                      + #13 +
    '          TA.CODALTERADOR, '                                                                             + #13 +
    '          TA.DESCRICAO AS NOMEALTERADOR, '                                                               + #13 +
    '          (CASE '                                                                                        + #13 +
    '           WHEN SUBSTR(H.MESREFERENCIA, 1,4) < ' + QuotedStr(FloatToStr(dbSpnAnoBase.Value)) + ' THEN '  + #13 +
    '                SUM(DECODE(NVL(H.FLGDEVOLUCAO,0),0,HA.VALOR,-HA.VALOR)) '                                + #13 +
    '           END) AS VALORPAGO_ANOANTERIOR, '                                                              + #13 +
    '          (CASE '                                                                                        + #13 +
    '           WHEN SUBSTR(H.MESREFERENCIA, 1,4) >= ' + QuotedStr(FloatToStr(dbSpnAnoBase.Value)) + ' THEN ' + #13 +
    '                SUM(DECODE(NVL(H.FLGDEVOLUCAO,0),0,HA.VALOR,-HA.VALOR)) '                                + #13 +
    '           END) AS VALORPAGO '                                                                           + #13 +
    '      FROM '                                                                                             + #13 +
    '          PESSOA P, '                                                                                    + #13 +
    '          ELEGPATRO EL, '                                                                                + #13 +
    '          HSTCONTRIBPREV H, '                                                                            + #13 +
    '          HSTATRASOCONTRIB HA, '                                                                         + #13 +
    '          CONTPREV CP, '                                                                                 + #13 +
    '          TIPOALTERADOR TA '                                                                             + #13 +
    '      WHERE '                                                                                            + #13 +
    '          CP.FLGPAGADOR IN (''C'',''P'') '                                                               + #13 ;

    If ( ChkBxAutoPatro.Checked = True  )
    Then sSQL := sSQL +   ' AND ( ( H.FOLHAORIGEM = ''C'' ) AND ( H.FLGSITFUNDACAO IN (''MA'', ''MP'', ''MS'') ) ) '
    Else sSQL := sSQL +   ' AND ( H.FOLHAORIGEM = ''C'') ';

    if molParticipante.iParticipante > 0 then
      sSQL := sSQL + '      AND P.IDPESSOA     = ' +  IntToStr(molParticipante.iParticipante)                 + #13 ;

    sSQL := sSQL +
    '      AND H.MESCOBRANCA >= ' + QuotedStr(FloatToStr(dbSpnAnoBase.Value) + '/01')                         + #13 +
    '      AND H.MESCOBRANCA <= ' + QuotedStr(FloatToStr(dbSpnAnoBase.Value) + '/12')                         + #13 +
    '      AND NVL(H.FLGDESCFOLHA,0) = 0 '                                                                    + #13 +
    '      AND NVL(H.SITRECEBIMENTO,0) IN (2,3,5) '                                                           + #13 +
    '      AND CP.IDPLANOPREV    = H.IDPLANOPREV '                                                            + #13 +
    '      AND CP.IDCONTRIBUICAO = H.IDCONTRIBUICAO '                                                         + #13 +
    '      AND EL.IDPESSJUR = H.IDPESSJUR '                                                                   + #13 +
    '      AND EL.IDPESSOA = H.IDPESSOA '                                                                     + #13 +
    '      AND P.IDPESSOA = EL.IDPESSOA '                                                                     + #13 +
    '      AND HA.NUMRECEBIMENTO = H.NUMRECEBIMENTO '                                                         + #13 +
    '      AND HA.MESCOBRANCA = H.MESCOBRANCA '                                                               + #13 +
    '      AND HA.MESREFERENCIA = H.MESREFERENCIA '                                                           + #13 +
    '      AND TA.CODALTERADOR = HA.CODALTERADOR '                                                            + #13 +
    '      GROUP BY '                                                                                         + #13 +
    '          P.IDPESSOA, '                                                                                  + #13 +
    '          EL.MATRICULA, '                                                                                + #13 +
    '          P.NOME, '                                                                                      + #13 +
    '          TA.CODALTERADOR, '                                                                             + #13 +
    '          TA.DESCRICAO, '                                                                                + #13 +
    '          SUBSTR(H.MESREFERENCIA, 1,4)) '                                                                + #13 +
    'GROUP BY CODTIPO, IDPESSOA, TIPO, MATRICULA, NOME, CODALTERADOR, '                                       + #13 +
    '         NOMEALTERADOR ) '                                                                               + #13 +
    'ORDER BY MATRICULA, CODTIPO, NOMEALTERADOR ';
  end
  else
  begin
    sSQL :=
    'SELECT  ' + #13 +

    '   CODTIPO, IDPESSOA, TIPO, MATRICULA, NOME, CODALTERADOR, NOMEALTERADOR, '                     + #13 +
    '   (CASE WHEN VALORPAGO_ANOANTERIOR > 0 '                                                       + #13 +
    '         THEN 0 '                                                                               + #13 +
    '         ELSE NVL( VALORPAGO_ANOANTERIOR, 0) '                                                  + #13 +
    '    END) VALORPAGO_ANOANTERIOR, '                                                               + #13 +
    '   (CASE WHEN VALORPAGO_ANOANTERIOR > 0 '                                                       + #13 +
    '         THEN (NVL( VALORPAGO, 0) + NVL( VALORPAGO_ANOANTERIOR, 0)) '                           + #13 +
    '         ELSE  NVL( VALORPAGO, 0) '                                                             + #13 +
    '    END) VALORPAGO '                                                                            + #13 +

    'FROM '     + #13 +
    '   ( '     + #13 +
    'SELECT CODTIPO, IDPESSOA, TIPO, MATRICULA, NOME, CODALTERADOR, '                                + #13 +
    '       NOMEALTERADOR, SUM(VALORPAGO_ANOANTERIOR) VALORPAGO_ANOANTERIOR, '                       + #13 +
    '       SUM(VALORPAGO) VALORPAGO '                                                               + #13 +
    'FROM '                                                                                          + #13 +
    '   ( '                                                                                          + #13 +
    '     SELECT '                                                                                   + #13 +
    '          1 AS CODTIPO, '                                                                       + #13 +
    '          P.IDPESSOA, '                                                                         + #13 +
    '          ''EMPREGADO'' AS TIPO, '                                                              + #13 +
    '          EL.MATRICULA, '                                                                       + #13 +
    '          P.NOME, '                                                                             + #13 +
    '          -1 AS CODALTERADOR, '                                                                 + #13 +
    '          '''' AS NOMEALTERADOR, '                                                              + #13 +
    '          (CASE '                                                                               + #13 +
    '           WHEN SUBSTR(H.MESREFERENCIA, 1,4) < ' + QuotedStr(FloatToStr(dbSpnAnoBase.Value)) + ' THEN '  + #13 +
    '                SUM(DECODE(NVL(H.FLGDEVOLUCAO,0),0,H.VALORRECEBIDO,-H.VALORRECEBIDO)) '         + #13 +
    '           END) AS VALORPAGO_ANOANTERIOR, '                                                     + #13 +
    '          (CASE '                                                                               + #13 +
    '           WHEN SUBSTR(H.MESREFERENCIA, 1,4) >= ' + QuotedStr(FloatToStr(dbSpnAnoBase.Value)) + ' THEN ' + #13 +
    '                SUM(DECODE(NVL(H.FLGDEVOLUCAO,0),0,H.VALORRECEBIDO,-H.VALORRECEBIDO)) '         + #13 +
    '           END) AS VALORPAGO '                                                                  + #13 +
    '     FROM '                                                                                    + #13 +
    '          PESSOA P, '                                                                           + #13 +
    '          ELEGPATRO EL, '                                                                       + #13 +
    '          HSTCONTRIBPREV H, '                                                                   + #13 +
    '          CONTPREV CP '                                                                         + #13 +
    '      WHERE '                                                                                   + #13 +
    '          CP.FLGPAGADOR = ''C'' ';

    //CPrev - Pend. 27357
    if iTipoCliente = 19991 then
      sSQL := sSQL + '      AND CP.IDCONTRIBUICAO IN (1,19,26,52,54,215,358,560,600,601,621,624,626,631,636) '        + #13 ;

    If ( ChkBxAutoPatro.Checked = True  )
    Then sSQL := sSQL +   ' AND ( ( H.FOLHAORIGEM = ''C'' ) AND ( H.FLGSITFUNDACAO IN (''MA'', ''MP'', ''MS'') ) ) '
    Else sSQL := sSQL +   ' AND ( H.FOLHAORIGEM = ''C'') ';

    if molParticipante.iParticipante > 0 then sSQL := sSQL +
       '      AND P.IDPESSOA = ' + IntToStr(molParticipante.iParticipante) + #13;

    // '      AND CP.FLGINTERNO IN (''MA'',''MP'') '                                                    + #13 +
    //CPrev - 23/01/08 - Inicio
    if iTipoCliente <> 19971 then
    begin
      sSQL := sSQL +
        '      AND H.MESCOBRANCA >= ' + QuotedStr(FloatToStr(dbSpnAnoBase.Value) + '/01')                + #13 + //CPrev - 22/01/08
        '      AND H.MESCOBRANCA <= ' + QuotedStr(FloatToStr(dbSpnAnoBase.Value) + '/12');                 //CPrev - 22/01/08
    end;

    if iTipoCliente = 19971 then
    begin
      sSQL := sSQL +
        '      AND TO_CHAR(H.DATARECEBIMENTO,''YYYY'') = ' + QuotedStr(FloatToStr(dbSpnAnoBase.Value));    //CPrev - 22/01/08
    end;
    //CPrev - 23/01/08 - Fim

    sSQL := sSQL +
    '      AND NVL(H.FLGDESCFOLHA,0) = 0 '                                                           + #13 +
    '      AND NVL(H.SITRECEBIMENTO,0) IN (2,3,5) '                                                  + #13 +
    '      AND CP.IDPLANOPREV    = H.IDPLANOPREV '                                                   + #13 +
    '      AND CP.IDCONTRIBUICAO = H.IDCONTRIBUICAO '                                                + #13 +
    '      AND EL.IDPESSJUR = H.IDPESSJUR '                                                          + #13 +
    '      AND EL.IDPESSOA = H.IDPESSOA '                                                            + #13 +
    '      AND P.IDPESSOA = EL.IDPESSOA '                                                            + #13 +
    '      GROUP BY '                                                                                + #13 +
    '          P.IDPESSOA, '                                                                         + #13 +
    '          EL.MATRICULA, '                                                                       + #13 +
    '          P.NOME, '                                                                             + #13 +
    '          SUBSTR(H.MESREFERENCIA, 1,4)) '                                                       + #13 +
    'GROUP BY CODTIPO, IDPESSOA, TIPO, MATRICULA, NOME, CODALTERADOR, '                              + #13 +
    '         NOMEALTERADOR '                                                                        + #13 +
    'UNION '                                                                                         + #13 +
    'SELECT CODTIPO, IDPESSOA, TIPO, MATRICULA, NOME, CODALTERADOR, '                                + #13 +
    '       NOMEALTERADOR, SUM(VALORPAGO_ANOANTERIOR) VALORPAGO_ANOANTERIOR, '                       + #13 +
    '       SUM(VALORPAGO) VALORPAGO '                                                               + #13 +
    'FROM '                                                                                          + #13 +
    '  (SELECT '                                                                                     + #13 +
    '          2 AS CODTIPO, '                                                                       + #13 +
    '          P.IDPESSOA, '                                                                         + #13 +
    '          ''EMPRESA'' AS TIPO, '                                                                + #13 +
    '          EL.MATRICULA, '                                                                       + #13 +
    '          P.NOME, '                                                                             + #13 +
    '          -1 AS CODALTERADOR, '                                                                 + #13 +
    '          '''' AS NOMEALTERADOR, '                                                              + #13 +
    '          (CASE '                                                                               + #13 +
    '           WHEN SUBSTR(H.MESREFERENCIA, 1,4) < ' + QuotedStr(FloatToStr(dbSpnAnoBase.Value)) + ' THEN '  + #13 +
    '                SUM(DECODE(NVL(H.FLGDEVOLUCAO,0),0,H.VALORRECEBIDO,-H.VALORRECEBIDO)) '         + #13 +
    '           END) AS VALORPAGO_ANOANTERIOR, '                                                     + #13 +
    '          (CASE '                                                                               + #13 +
    '           WHEN SUBSTR(H.MESREFERENCIA, 1,4) >= ' + QuotedStr(FloatToStr(dbSpnAnoBase.Value)) + ' THEN ' + #13 +
    '                SUM(DECODE(NVL(H.FLGDEVOLUCAO,0),0,H.VALORRECEBIDO,-H.VALORRECEBIDO)) '         + #13 +
    '           END) AS VALORPAGO '                                                                  + #13 +
    '   FROM '                                                                                       + #13 +
    '          PESSOA P, '                                                                           + #13 +
    '          ELEGPATRO EL, '                                                                       + #13 +
    '          HSTCONTRIBPREV H, '                                                                   + #13 +
    '          CONTPREV CP '                                                                         + #13 +
    '      WHERE ';

    //CPrev - Pend. 27357
    if iTipoCliente = 19991 then
      sSQL := sSQL + '         (CP.IDCONTRIBUICAO IN (18,35,318,359,622,625,632,637)) AND '                            + #13;

    //CPrev - 23/01/08 - Inicio
    if iTipoCliente <> 19971 then
      sSQL := sSQL +'          (CP.FLGPAGADOR IN (''C'',''P''))  ';

    if iTipoCliente = 19971 then
      sSQL := sSQL +'          (CP.FLGPAGADOR = ''P'')  ';
    //CPrev - 23/01/08 - Fim


    If ( ChkBxAutoPatro.Checked = True  )
    Then sSQL := sSQL +   ' AND ( ( H.FOLHAORIGEM = ''C'' ) AND ( H.FLGSITFUNDACAO IN (''MA'', ''MP'', ''MS'') ) ) '
    Else sSQL := sSQL +   ' AND ( H.FOLHAORIGEM = ''C'') ';

    if molParticipante.iParticipante > 0 then sSQL := sSQL +
       '      AND P.IDPESSOA = ' + IntToStr(molParticipante.iParticipante) + #13;

    // '      AND CP.FLGINTERNO IN (''MA'',''MP'') '                                                    + #13 +
    //CPrev - 23/01/08 - Inicio
    if iTipoCliente <> 19971 then
    begin
      sSQL := sSQL +
        '      AND H.MESCOBRANCA >= ' + QuotedStr(FloatToStr(dbSpnAnoBase.Value) + '/01')                + #13 + //CPrev - 22/01/08
        '      AND H.MESCOBRANCA <= ' + QuotedStr(FloatToStr(dbSpnAnoBase.Value) + '/12');
    end;

    if iTipoCliente = 19971 then
    begin
      sSQL := sSQL +
        '      AND TO_CHAR(H.DATARECEBIMENTO,''YYYY'') = ' + QuotedStr(FloatToStr(dbSpnAnoBase.Value));
    end;
    //CPrev - 23/01/08 - Fim

    sSQL := sSQL +
    '      AND NVL(H.FLGDESCFOLHA,0) = 0 '                                                           + #13 +
    '      AND NVL(H.SITRECEBIMENTO,0) IN (2,3,5) '                                                  + #13 +
    '      AND CP.IDPLANOPREV    = H.IDPLANOPREV '                                                   + #13 +
    '      AND CP.IDCONTRIBUICAO = H.IDCONTRIBUICAO '                                                + #13 +
    '      AND EL.IDPESSJUR = H.IDPESSJUR '                                                          + #13 +
    '      AND EL.IDPESSOA = H.IDPESSOA '                                                            + #13 +
    '      AND P.IDPESSOA = EL.IDPESSOA '                                                            + #13 +
    '      GROUP BY '                                                                                + #13 +
    '          P.IDPESSOA, '                                                                         + #13 +
    '          EL.MATRICULA, '                                                                       + #13 +
    '          P.NOME, '                                                                             + #13 +
    '          SUBSTR(H.MESREFERENCIA, 1,4)) '                                                       + #13 +
    'GROUP BY CODTIPO, IDPESSOA, TIPO, MATRICULA, NOME, CODALTERADOR, '                              + #13 +
    '         NOMEALTERADOR '                                                                        + #13 +
    'UNION '                                                                                         + #13 +
    'SELECT CODTIPO, IDPESSOA, TIPO, MATRICULA, NOME, CODALTERADOR, '                                + #13 +
    '       NOMEALTERADOR, SUM(VALORPAGO_ANOANTERIOR) VALORPAGO_ANOANTERIOR, '                       + #13 +
    '       SUM(VALORPAGO) VALORPAGO '                                                               + #13 +
    'FROM '                                                                                          + #13 +
    '   (SELECT '                                                                                    + #13 +
    '          3 AS CODTIPO, '                                                                       + #13 +
    '          P.IDPESSOA, '                                                                         + #13 +
    '          ''ALTERADOR'' AS TIPO, '                                                              + #13 +
    '          EL.MATRICULA, '                                                                       + #13 +
    '          P.NOME, '                                                                             + #13 +
    '          TA.CODALTERADOR, '                                                                    + #13 +
    '          TA.DESCRICAO AS NOMEALTERADOR, '                                                      + #13 +
    '          (CASE '                                                                               + #13 +
    '           WHEN SUBSTR(H.MESREFERENCIA, 1,4) < ' + QuotedStr(FloatToStr(dbSpnAnoBase.Value)) + ' THEN '  + #13 +
    '                SUM(DECODE(NVL(H.FLGDEVOLUCAO,0),0,HA.VALOR,-HA.VALOR)) '         + #13 +
    '           END) AS VALORPAGO_ANOANTERIOR, '                                                     + #13 +
    '          (CASE '                                                                               + #13 +
    '           WHEN SUBSTR(H.MESREFERENCIA, 1,4) >= ' + QuotedStr(FloatToStr(dbSpnAnoBase.Value)) + ' THEN ' + #13 +
    '                SUM(DECODE(NVL(H.FLGDEVOLUCAO,0),0,HA.VALOR,-HA.VALOR)) '         + #13 +
    '           END) AS VALORPAGO '                                                                  + #13 +
    '      FROM '                                                                                    + #13 +
    '          PESSOA P, '                                                                           + #13 +
    '          ELEGPATRO EL, '                                                                       + #13 +
    '          HSTCONTRIBPREV H, '                                                                   + #13 +
    '          HSTATRASOCONTRIB HA, '                                                                + #13 +
    '          CONTPREV CP, '                                                                        + #13 +
    '          TIPOALTERADOR TA '                                                                    + #13 +
    '      WHERE ';

    // '          CP.FLGINTERNO IN (''MA'',''MP'') '                                                    + #13 +
    // '      AND CP.FLGPAGADOR IN (''C'',''P'') '                                                      + #13; 
    //CPrev - 23/01/08 - Inicio
    if iTipoCliente <> 19971 then
      sSQL := sSQL +'          (CP.FLGPAGADOR IN (''C'',''P''))  ';

    if iTipoCliente = 19971 then
      sSQL := sSQL +'          (CP.FLGPAGADOR = ''C'')  ';
    //CPrev - 23/01/08 - Fim

    if molParticipante.iParticipante > 0 then sSQL := sSQL +
       '      AND P.IDPESSOA = ' + IntToStr(molParticipante.iParticipante) + #13;

    sSQL := sSQL +
    '      AND NVL(HA.VALORRECEBIDO,0) > 0 ';

    //CPrev - 23/01/08 - Inicio
    if iTipoCliente <> 19971 then
    begin
      sSQL := sSQL +
        '      AND H.MESCOBRANCA >= ' + QuotedStr(FloatToStr(dbSpnAnoBase.Value) + '/01')                + #13 + //CPrev - 22/01/08
        '      AND H.MESCOBRANCA <= ' + QuotedStr(FloatToStr(dbSpnAnoBase.Value) + '/12');
    end;

    if iTipoCliente = 19971 then
    begin
      sSQL := sSQL +
        '      AND TO_CHAR(H.DATARECEBIMENTO,''YYYY'') = ' + QuotedStr(FloatToStr(dbSpnAnoBase.Value));
    end;
    //CPrev - 23/01/08 - Fim

    sSQL := sSQL +
    '      AND NVL(H.FLGDESCFOLHA,0) = 0 '                                                           + #13 +
    '      AND NVL(H.SITRECEBIMENTO,0) IN (2,3,5) '                                                  + #13 +
    //CPrev - Pend. 27357 - 21/02/2008 - '      AND HA.CODALTERADOR <> 251 '                                                              + #13 +
    '      AND CP.IDPLANOPREV    = H.IDPLANOPREV '                                                   + #13 +
    '      AND CP.IDCONTRIBUICAO = H.IDCONTRIBUICAO '                                                + #13 +
    '      AND EL.IDPESSJUR = H.IDPESSJUR '                                                          + #13 +
    '      AND EL.IDPESSOA = H.IDPESSOA '                                                            + #13 +
    '      AND P.IDPESSOA = EL.IDPESSOA '                                                            + #13 +
    '      AND HA.NUMRECEBIMENTO = H.NUMRECEBIMENTO '                                                + #13 +
    '      AND HA.MESCOBRANCA = H.MESCOBRANCA '                                                      + #13 +
    '      AND HA.MESREFERENCIA = H.MESREFERENCIA '                                                  + #13 +
    '      AND TA.CODALTERADOR = HA.CODALTERADOR '                                                   + #13 +
    '      GROUP BY '                                                                                + #13 +
    '          P.IDPESSOA, '                                                                         + #13 +
    '          EL.MATRICULA, '                                                                       + #13 +
    '          P.NOME, '                                                                             + #13 +
    '          TA.CODALTERADOR, '                                                                    + #13 +
    '          TA.DESCRICAO, '                                                                       + #13 +
    '          SUBSTR(H.MESREFERENCIA, 1,4)) '                                                       + #13 +
    'GROUP BY CODTIPO, IDPESSOA, TIPO, MATRICULA, NOME, CODALTERADOR, '                              + #13 +
    '         NOMEALTERADOR ) '                                                                      + #13 +
    'WHERE '                                                                                         + #13 +
    ' ( ( NVL( VALORPAGO_ANOANTERIOR, 0 ) > 0  ) OR ( NVL( VALORPAGO, 0) > 0 ) ) '                   + #13 +
    'ORDER BY MATRICULA, CODTIPO, NOMEALTERADOR '                                                    + #13;
  end;
*)

  //Bruno Bastos - SOL 109607 KINTANA  497477 - Comentei para alterar a query - início
  sSQL :=
    ' SELECT '                                                                               + #13 +
      ' ''1'' AS TIPO, '                                                                     + #13 +
      ' A.IDPESSOA, '                                                                        + #13 +
      ' P.IDPESSOA, '                                                                        + #13 +
      ' P.NOME, '                                                                            + #13 +
      ' P.NUMDOCUMENTO, '                                                                    + #13 +
      ' MATRICULA, '                                                                         + #13 +
      ' SUM(TOTALRECEBIDO) TOTALRECEBIDO, '                                                  + #13 +
      ' SUM(A.VALORESPERADO), '                                                              + #13 +
      //Bruno Bastos - Sol: 130432 - Kintana: 732115 - ' SUM(A.VALORRECEBIDO) '                                                               + #13 +
      ' SUM(A.VALORRECEBIDO) as VALORRECEBIDO '                                              + #13 + //Bruno Bastos - Sol: 130432 - Kintana: 732115
    ' FROM '                                                                                 + #13 +
      ' PESSOA P, '                                                                          + #13 +
      ' (SELECT '                                                                            + #13 +
         ' HST.IDPESSOA, '                                                                   + #13 +
         ' EL.MATRICULA, '                                                                   + #13 +
         ' HST.VALORESPERADO, '                                                              + #13 +
         //Bruno Bastos - Sol: 130873 - Kintana: 737515 - ' HST.VALORRECEBIDO, '                                                              + #13 +
         ' DECODE(HST.FLGDEVOLUCAO,0, NVL(HST.VALORRECEBIDO,0),-NVL(HST.VALORRECEBIDO,0)) AS VALORRECEBIDO, ' + #13 + //Bruno Bastos - Sol: 130873 - Kintana: 737515
         ' (DECODE(HST.FLGDEVOLUCAO,0, NVL(HST.VALORRECEBIDO,0),-NVL(HST.VALORRECEBIDO,0))+SUM(DECODE(TA.ACRESDECRES,''C'',-HA.VALORRECEBIDO,''D'',HA.VALORRECEBIDO,0))) AS  TOTALRECEBIDO ' + #13 +
       ' FROM '                                                                              + #13 +
         ' CONTRIBUICAO C, '                                                                 + #13 +
         //Vinicius Maciel -  SOL 133646 KINTANA 780791 - Acrescimo da tabela CONTRIBUICAO_ANO
         ' CONTRIBUICAO_ANO CA, '                                                            + #13 +
         ' CONTPREV CP, '                                                                    + #13 +
         ' PATRO PT, '                                                                       + #13 +
         ' SITPART SP, '                                                                     + #13 +
         ' ELEGPATRO EL, '                                                                   + #13 +
         ' PARTPREVPLAN PP, '                                                                + #13 +
         ' CONTRIBPREVPARTP CPP, '                                                           + #13 +
         ' HSTCONTRIBPREV HST, '                                                             + #13 +
         ' DOCUMENTO D, '                                                                    + #13 +
         ' HSTATRASOCONTRIB HA, '                                                            + #13 +
         ' TIPOALTERADOR TA '                                                                + #13 +
       ' WHERE (HST.IDPESSOA    IN (SELECT distinct idpessoa '                               + #13 +
                                  ' FROM PARTPREVPLAN PPP, SITPART SP '                      + #13 +
                                  ' WHERE PPP.IDSITPART = SP.IDSITPART AND SP.FLGINTERNO IN (''AS'',''AT'',''CA'',''MA'',''MP'',''MS'',''PN''))) ' + #13 +
                                           //Bruno Bastos - Sol: 130204 - Kinatana: 719119 - ' AND CP.IDCONTRIBUICAO IN (1,18,19,22,26,33,52,54,215,259,318,358, 359, 400, 461, 480,520,540,560,600,601, 602, 621,623,624, 625, 629,630,631,633,636,643,645,647,649,651,653,657,659,661,662,663,664,669,671) ' + #13 +
                                           //' AND CP.IDCONTRIBUICAO IN (1,18,19,22,26,   52,54,215,259,318,358,      400, 461,     520,540,560,600,601, 602, 621,623,624, 625,    631,632,636,643,645,647,649,651,653,657,659,661,662,663,664,669,671, 673,674) ' + #13 + //Bruno Bastos - Sol: 130204 - Kinatana: 719119
                                           //' AND CP.IDCONTRIBUICAO IN (1,18,19,22,26,52,54,215,318,358, 461,520,560,600, 601, 602, 621,623,624, 625, 631,632,636,643,645,647,649,651,653,657,659,661,662,663,664,669,671, 673,674,521,658,359) ' + #13 + //Marilza Colpani - Sol: 130940 - Kinatana: 738541
                                           // Marcos Luiz de Jesus - Sol: 136535 KINTANA 820343
                                           //' AND CP.IDCONTRIBUICAO IN (1,18,19,22,26,52,54,215,318,358, 461,520,560,600, 601, 602, 621,623,624, 625, 631,632,636,637,643,645,647,649,651,653,657,659,661,662,663,664,669,671, 673,674,521,658,359,692,693) ' + #13 + // Alterado por FHBS - SOL: 134514 KTN: 793613

         //Ricardo Freitas - SOL 151602 KINTANA 1114747
         //Vinicius Maciel -  SOL 133646 KINTANA 780791 - Remocao do IdContribuicao ' AND CP.IDCONTRIBUICAO IN (1,18,19,22,26,35,52,54,215,318,358, 461,520,560,600, 601, 602, 621,623,624, 625, 631,632,636,637,643,645,647,649,651,653,657,659,661,662,663,664,669,671,673,674,521,658,359,689,690,691,692,693,695) ' + #13 +

         // Marcos Luiz de Jesus - SOL 136904 KINTANA 837295
         //Ricardo Freitas - SOL 151602 KINTANA 1114747 - COMENTADO - ' AND CP.IDCONTRIBUICAO IN (1,18,19,22,26,52,54,215,318,358, 461,520,560,600, 601, 602, 621,623,624, 625, 631,632,636,637,643,645,647,649,651,653,657,659,661,662,663,664,669,671, 673,674,521,658,359,692,693,695) ' + #13 +



         ' AND CP.IDPLANOPREV IN (29,74,75,28,2,79,66) '                                     + #13 ;

  if molParticipante.iParticipante > 0 then
    sSQL := sSQL + ' AND HST.IDPESSOA     = ' +  IntToStr(molParticipante.iParticipante)     + #13 ;

  sSQL := sSQL +
         ' AND (HST.CODDOCUMENTOPREV > 100 OR HST.CODDOCUMENTOPREV = 5) '                    + #13 +
         ' AND (HST.CODDOCUMENTOPREV = D.CODDOCUMENTO(+) ) '                                 + #13 +
         //Vinicius Maciel -  SOL 133646 KINTANA 780791 adicionei o join entre HSTCONTRIBPREV e CONTRIBUICAO_ANO
         ' AND (HST.IDCONTRIBUICAO = CA.IDCONTRIBUICAO) '                                    + #13 +
         ' AND (HST.IDCONTRIBUICAO = C.IDCONTRIBUICAO) '                                     + #13 +
         ' AND (CPP.IDPESSJUR      = HST.IDPESSJUR) '                                        + #13 +
         ' AND (CPP.IDPLANOPREV    = HST.IDPLANOPREV) '                                      + #13 +
         ' AND (CPP.IDPESSOA       = HST.IDPESSOA) '                                         + #13 +
         ' AND (CPP.SEQPROPOSTA    = HST.SEQPROPOSTA) '                                      + #13 +
         ' AND (CPP.IDCONTRIBUICAO = HST.IDCONTRIBUICAO) '                                   + #13 +
         ' AND (PP.IDPESSJUR       = CPP.IDPESSJUR) '                                        + #13 +
         ' AND (PP.IDPLANOPREV     = CPP.IDPLANOPREV) '                                      + #13 +
         ' AND (PP.IDPESSOA        = CPP.IDPESSOA) '                                         + #13 +
         ' AND (PP.SEQPROPOSTA     = CPP.SEQPROPOSTA) '                                      + #13 +
         ' AND (PT.IDPESSOA        = PP.IDPESSJUR) '                                         + #13 +
         ' AND (EL.IDPESSOA        = PP.IDPESSOA) '                                          + #13 +
         ' AND (EL.IDPESSJUR       = PP.IDPESSJUR) '                                         + #13 +
         ' AND (CP.IDCONTRIBUICAO  = CPP.IDCONTRIBUICAO) '                                   + #13 +
         ' AND (CP.IDPLANOPREV     = CPP.IDPLANOPREV) '                                      + #13 +
         ' AND (C.IDCONTRIBUICAO   = CP.IDCONTRIBUICAO) '                                    + #13 +
         ' AND (PP.IDSITPART       = SP.IDSITPART) '                                         + #13 +
         ' AND (HA.NUMRECEBIMENTO(+) = HST.NUMRECEBIMENTO) '                                 + #13 +
         ' AND (HA.MESCOBRANCA(+)    = HST.MESCOBRANCA) '                                    + #13 +
         ' AND (HA.MESREFERENCIA(+)  = HST.MESREFERENCIA) '                                  + #13 +
         ' AND (HA.IDMOTIVO(+)       = HST.IDMOTIVO) '                                       + #13 +
         ' AND (HA.CODALTERADOR      = TA.CODALTERADOR(+)) '                                 + #13 +
         ' AND HST.MESCOBRANCA BETWEEN '+ QuotedStr(FloatToStr(dbSpnAnoBase.Value) + '/01')  + #13 +
                                 ' AND '+ QuotedStr(FloatToStr(dbSpnAnoBase.Value) + '/12')  + #13 +
         //Vinicius Maciel -  SOL 133646 KINTANA 780791 - Adicionei o filtro ca.ano
         ' AND CA.Ano ='+ QuotedStr(FloatToStr(dbSpnAnoBase.Value))                          + #13 +
         ' AND HST.FLGDESCFOLHA = 0 '                                                        + #13 +
         ' AND HST.SITRECEBIMENTO = 2 '                                                      + #13 +
       ' GROUP BY '                                                                          + #13 +
         ' D.NODOCUMENTO, '                                                                  + #13 +
         ' D.NOSSONUMERO, '                                                                  + #13 +
         ' C.NOMERESUM, '                                                                    + #13 +
         ' C.NOME, '                                                                         + #13 +
         ' HST.MESREFERENCIA, '                                                              + #13 +
         ' HST.MESCOBRANCA, '                                                                + #13 +
         ' HST.DATAPREVISAORECE, '                                                           + #13 +
         ' HST.VALORESPERADO, '                                                              + #13 +
         ' HST.VALORRECEBIDO, '                                                              + #13 +
         ' HST.SITRECEBIMENTO, '                                                             + #13 +
         ' HST.IDLOTE, '                                                                     + #13 +
         ' HST.NUMRECEBIMENTO, '                                                             + #13 +
         ' HST.FLGDEVOLUCAO, '                                                               + #13 +
         ' DECODE(NVL(HST.FLGDEVOLUCAO, 0), 1, ''devolução'', ''''), '                       + #13 +
         ' HST.IDMOTIVO, '                                                                   + #13 +
         ' HST.DATARECEBIMENTO, '                                                            + #13 +
         ' HST.VALOROP1, '                                                                   + #13 +
         ' HST.VALOROP2, '                                                                   + #13 +
         ' HST.VALOROP3, '                                                                   + #13 +
         ' HST.CODDOCUMENTOPREV, '                                                           + #13 +
         ' HST.VALORCALCULADO, '                                                             + #13 +
         ' HST.FLGDESCFOLHA, '                                                               + #13 +
         ' HST.IDCONTRIBUICAO, '                                                             + #13 +
         ' HST.IDPESSJUR, '                                                                  + #13 +
         ' HST.IDPLANOPREV, '                                                                + #13 +
         ' HST.IDPESSOA, '                                                                   + #13 +
         ' HST.SEQPROPOSTA, '                                                                + #13 +
         ' HST.DATAINICIO, '                                                                 + #13 +
         ' HST.DATAFINAL, '                                                                  + #13 +
         ' HST.FLGSITFUNDACAO, '                                                             + #13 +
         ' HST.FLGEVENTO, '                                                                  + #13 +
         ' HST.DATACANCELAMENTO, '                                                           + #13 +
         ' HST.DATAEMISSCOB, '                                                               + #13 +
         ' HST.FLGCALCRESERVA, '                                                             + #13 +
         ' HST.PARCELA, '                                                                    + #13 +
         ' EL.MATRICULA, '                                                                   + #13 +
         ' CP.FLGPAGADOR, '                                                                  + #13 +
         ' CP.CODCENTROCUSTOC, '                                                             + #13 +
         ' CP.CODCENTROCUSTOD, '                                                             + #13 +
         ' PP.INSCRICAONUMERO, '                                                             + #13 +
         ' CPP.FLGDESCFOLHA, '                                                               + #13 +
         ' CPP.DIAVENCIMENTO, '                                                              + #13 +
         ' CP.CODTIPRECDES, '                                                                + #13 +
         ' CPP.PLANO, '                                                                      + #13 +
         ' CPP.PLACONTAC, '                                                                  + #13 +
         ' CPP.PLACONTAD, '                                                                  + #13 +
         ' CP.CODSUBCONTA , '                                                                + #13 +
         ' CP.CODCENTRORESPON, '                                                             + #13 +
         ' PP.SALMANTIDO, '                                                                  + #13 +
         ' CP.UNIDNEGOC, '                                                                   + #13 +
         ' CPP.IDEMPRESA, '                                                                  + #13 +
         ' CPP.PLANO, '                                                                      + #13 +
         ' CPP.DATAINICIO, '                                                                 + #13 +
         ' CPP.TIPCODIGO, '                                                                  + #13 +
         ' CPP.CODTIPDOC, '                                                                  + #13 +
         ' HST.CODPORTFORMA, '                                                               + #13 +
         ' CPP.CODPORTFORMA, '                                                               + #13 +
         ' CPP.PLANO13, '                                                                    + #13 +
         ' CPP.PLACONTAC13, '                                                                + #13 +
         ' CPP.PLACONTAD13, '                                                                + #13 +
         ' CPP.CODCENTROCUSTOC13, '                                                          + #13 +
         ' CPP.IDEMPRESA13, '                                                                + #13 +
         ' CPP.CODCENTROCUSTOD13, '                                                          + #13 +
         ' CPP.UNIDNEGOC13, '                                                                + #13 +
         ' CPP.IDEMPRESAPROP13, '                                                            + #13 +
         ' CPP.CODCENTRORESPON13, '                                                          + #13 +
         ' CPP.CODSUBCONTA13, '                                                              + #13 +
         ' CPP.RECPAG13, '                                                                   + #13 +
         ' CPP.CODTIPRECDES13, '                                                             + #13 +
         ' CPP.TIPCODIGO13, '                                                                + #13 +
         ' CPP.CODTIPDOC13, '                                                                + #13 +
         ' CPP.CODPORTFORMA13, '                                                             + #13 +
         ' CPP.IDPLANPREVCONTAB, '                                                           + #13 +
         ' CPP.PLACONTADBANCO, '                                                             + #13 +
         ' CPP.PLACONTADBANCO13, '                                                           + #13 +
         ' CPP.CODTIPDESEMBDEVOL, '                                                          + #13 +
         ' CPP.CODCCUSTODEVOL, '                                                             + #13 +
         ' CPP.PLACONTADEVOL, '                                                              + #13 +
         ' PP.SALMANTIDO, '                                                                  + #13 +
         ' HST.FLGDEVOLUCAO, '                                                               + #13 +
         ' CPP.DATAINICIO, '                                                                 + #13 +
         ' HST.FLGDEVOLUCAO, '                                                               + #13 +
         ' HST.SITRECEBIMENTO, '                                                             + #13 +
         ' CP.IDREGRACALCULO, '                                                              + #13 +
         ' SP.FLGINTERNO , '                                                                 + #13 +
         ' NVL(EL.IDPESSJURCEDIDO, EL.IDPESSJUR), '                                          + #13 +
         ' D.RECPAG '                                                                        + #13 +
       ' ORDER BY '                                                                          + #13 +
         ' HST.MESREFERENCIA DESC)A '                                                        + #13 +
    ' WHERE P.IDPESSOA = A.IDPESSOA '                                                        + #13 +
    ' GROUP BY '                                                                             + #13 +
      ' A.IDPESSOA, '                                                                        + #13 +
      ' P.IDPESSOA, '                                                                        + #13 +
      ' P.NOME, '                                                                            + #13 +
      ' P.NUMDOCUMENTO, '                                                                    + #13 +
      ' MATRICULA '                                                                          + #13 ;
  //Bruno Bastos - SOL 109607 KINTANA  497477 - Comentei para alterar a query - Fim


  cdsValores.Close;
  sqlValores.Sql.Text := sSQL;

end;

procedure TfrmRelatInformeFacultativo.btnGeraTXTClick(Sender: TObject);
var
   Arquivo   : TextFile;
   sLinha    : String;
   iContador : Integer;
begin
   inherited;
   if Save.Execute then
   begin
      AssignFile(Arquivo,Save.FileName);
      ReWrite(Arquivo);
      MontaDados;
      iContador := 1;
      sLinha := '1FUNCEFP082025 ' +
                FormatDateTime('ddmmyyyy',Date) +
                dbSpnExercicio.Text +
                dbspnAnoBase.Text  +
                'DEMONSTRATIVOS ANUAL PARA O IMPOSTO DE RENDA'+
                Completa(' ',129);
                WriteLn(Arquivo,sLinha);

{
1FUNCEFP082025 DDMMYYYY99999999DEMONSTRATIVOS ANUAL PARA O IMPOSTO DE RENDAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
20062805SILVIA MARIA BALDINI                    94245169834AV SAMAMBAIA 272                                  UBATUBA                  SP01168000000011193000001119300000000657000000000000000000000000224517
9000001194xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
}
      with dtmInformeFacultativo.cdsInformeFacultativo do
      begin
         while not eof do
         begin
            MontaEndereco(FieldByName('MATRICULA').AsString);
            Inc(iContador);
            sLinha := '2' +
                      Trim(FieldByName('MATRICULA').AsString)  + Completa(' ', 7 - Length(Trim(FieldByName('MATRICULA').AsString))) +
                      Copy(Trim(FieldByName('NOME_PART').AsString),1,40) + Completa(' ',40 - Length(Copy(Trim(FieldByName('NOME_PART').AsString),1,40))) +
                      Trim(FieldByName('CPF').AsString)      + Completa(' ',11 - Length(Trim(FieldByName('CPF').AsString))) +
                      Copy(Trim(cdsEndereco.FieldByName('ENDERECO').AsString),1,50) + Completa(' ', 50 - Length(Copy(Trim(cdsEndereco.FieldByName('ENDERECO').AsString),1,50))) +
                      Copy(Trim(cdsEndereco.FieldByName('CIDADE').AsString),1,25) + Completa(' ',25 - Length(Copy(Trim(cdsEndereco.FieldByName('CIDADE').AsString),1,25))) +
                      Trim(cdsEndereco.FieldByName('UF').AsString) + Completa(' ',2 - Length(Trim(cdsEndereco.FieldByName('UF').AsString))) +
                      Trim(cdsEndereco.FieldByName('CEP').AsString) + Completa(' ',8 - Length(Trim(cdsEndereco.FieldByName('CEP').AsString))) +
                      //Ádler Teodoro de Souza  SOL: 108697
                      //CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00',FieldByName('CONTREMPR').AsFloat)),'.','',[rfReplaceAll]),10)  +
                      //CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00',FieldByName('CONTRPATRO').AsFloat)),'.','',[rfReplaceAll]),10) +
                      //CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00',FieldByName('CORRECAO').AsFloat)),'.','',[rfReplaceAll]),10)   +
                      //CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00',FieldByName('JUROS').AsFloat)),'.','',[rfReplaceAll]),10)      +
                      //CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00',FieldByName('MULTA').AsFloat)),'.','',[rfReplaceAll]),10)      +
                      //FIM Ádler Teodoro de Souza  SOL: 108697 KINTANA  492829
                      //Bruno Bastos - 19/02/2009 - CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00',FieldByName('TOTAL').AsFloat)),'.','',[rfReplaceAll]),10) +
                      //Bruno Bastos - Sol: 130432 - Kintana: 732115 - CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00',FieldByName('TOTALRECEBIDO').AsFloat)),'.','',[rfReplaceAll]),10) +
                      CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00',FieldByName('VALORRECEBIDO').AsFloat)),'.','',[rfReplaceAll]),10) + //Bruno Bastos - Sol: 130432 - Kintana: 732115
                      CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00',FieldByName('ATRASOANT').AsFloat)),'.','',[rfReplaceAll]),10) +
                      CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00',FieldByName('DEVOLANT').AsFloat)),'.','',[rfReplaceAll]),10) +
                      CompletaZero(StringReplace(OraNumero(FormatFloat('######0.00',FieldByName('TOTALANT').AsFloat)),'.','',[rfReplaceAll]),10);

            WriteLn(Arquivo,sLinha);
            Next;
         end;

      end;
      Inc(iContador);
      sLinha := '9' +
                CompletaZero(IntToStr(iContador),9) +
                Completa(' ',194);
      WriteLn(Arquivo,sLinha);
      CloseFile(Arquivo);
   end;

end;


function TfrmRelatInformeFacultativo.Completa(sNome: String;
  iTam: integer): String;
var i : integer;
begin
   sNome  := trim(sNome);
   i      := length(sNome);
   Result := sNome + FuncaoGeral.Spc(iTam - i);
end;

function TfrmRelatInformeFacultativo.CompletaZero(sNome: String;
  iTam: integer): String;
var i, k : integer;
begin
   sNome  := trim(sNome);
   i      := length(sNome);
   Result := '';
   for k := 1 to (iTam - i) do
      Result := Result + '0';
   Result := Result + sNome;
end;


function TfrmRelatInformeFacultativo.OraNumero (Numero: string): string;
var
  i   : integer;
  sOra: string;
begin
  sOra := '';

  for i:=1 to length(Trim(Numero)) do
  begin
     if (Numero[i] = ',') then
       sOra := sOra + '.'
     else
       sOra := sOra + Numero[i]
   end;
   Result := sOra;
end;




procedure TfrmRelatInformeFacultativo.MontaEndereco(sMatricula: String);
var
   sSQL : String;
begin
  //Bruno Bastos - Sol: 131008 - Kinatana: 740127 - Início
   sSQL :=
   'SELECT ' + #13 +
           '    TRIM(END.LOGRADOURO) || '' '' || END.NUMERO || '' '' || END.COMPLEMENTO || '' '' || END.BAIRRO AS ENDERECO, ' + #13 +
   '    CID.NOME AS CIDADE, ' + #13 +
   '    CID.UF AS UF, ' + #13 +
   '    END.CEP ' + #13 +

   'FROM ' + #13 +
   '    PESSOA PES, ' + #13 +
   '    ELEGPATRO ELP, ' + #13 +
   '    ENDPESS   END, ' + #13 +
   '    CIDADES   CID  ' + #13 +

   'WHERE ' + #13 +
   '    ELP.MATRICULA        = ' + QuotedStr(sMatricula)  + #13 +
   'AND PES.IDPESSOA         = ELP.IDPESSOA ' + #13 +
   ' AND ELP.IDPESSOA         = END.IDPESSOA '             + #13 +
   ' AND END.IDENDERECO       = NVL(PES.IDENDCORRESP,(SELECT MAX(EN.IDENDERECO) FROM ENDPESS EN WHERE EN.IDPESSOA(+) = ELP.IDPESSOA)) '+ #13 +
   ' AND END.IDCIDADES        = CID.IDCIDADES(+) '         + #13;
  //Bruno Bastos - Sol: 131008 - Kinatana: 740127 - Fim

   cdsEndereco.Close;
   sqlEndereco.Sql.Text := sSQL;
   sqlEndereco.Open;
end;

end.


