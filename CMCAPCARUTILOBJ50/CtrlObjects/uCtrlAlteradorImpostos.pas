{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O-,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$define Debug}
{******************************************************************************}
{  Sistema - Contas a Pagar                                                    }
{  Unit    - uCtrlAlteradorImpostos                                            }
{  Propósito: Fazer todo o controle das regras de negócio relacionadas ao      }
{             lançamento de alteradores automáticos de impostos.               }
{******************************************************************************}
//----------------------------------------------------------------------------------
// N. Solicitação: WO24106
// Dt Alteração..: 07/08/2025    
// Responsável...: Paulo Nobre
// Descrição.....: Incluso na função GravaAlteradores, seleção do campo FLGVALORBASE
//                 que indica se o alterador usa o valor base para a retenção de
//                 tributos. Caso a flag seja = 'S', então, atribui ao
//                 VALORBASERETENCAO o VALOR DA AP (Campo "Valor Moeda Corrente").
//----------------------------------------------------------------------------------
// Nº SOL......: 189828
// Nº KINTANA..: 1794500
// Data........: 13/05/2013
// Responsável.: Paulo Nobre
// Descrição...: Inclusão do Alteradores de forma automática
//------------------------------------------------------------------------------
{ -----------------------------------------------------------------------------
 *** ATENCAO *** ATENCAO *** ATENCAO *** ATENCAO *** ATENCAO *** ATENCAO ***
  -----------------------------------------------------------------------------
 Caso esta Unit sofra alguma alteração de código a mesma é usada pelos módulos
  - Contas a Pagar
  - Administração imobiliária (LANÇAMENTO MULTIPLO DE DESPESAS)
      -José Roberto Marque - 13/11/2011
 -----------------------------------------------------------------------------}
{------------------------------------------------------------------------------
 Rotina......: alterado o tipo da variavel p_numlancto de integer para int64
 Nº SOL......: 199641
 Nº KINTANA..: 1921256
 Data........: 25/01/2013
 Responsável.: Edilaine Ferraresi
 Descrição...: permitir que o NODOCUMENTO não seja limitado pelo tipo integer
-------------------------------------------------------------------------------
  N. Sol..........: 179108
  N. Kintana......: 1654527
  Data............: 27/06/2012
  Responsável.....: Edilaine Ferraresi
  Rotina..........: GravaAlteradores, ContribuicaoSocial
  Descrição.......: atualizar valor do alterador do tipo Contribuição
--------------------------------------------------------------------------------
  N. Sol..........: 136242
  N. Kintana......: 813941
  Data............: 03/10/2011
  Responsável.....: José Roberto Marque
  Descrição.......: Implementação inicial da Unit.
-------------------------------------------------------------------------------}
unit uCtrlAlteradorImpostos;

interface

uses
  WIndows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCtrlTipoRecDesembxAlterador, MontaSelect, DBTables, Db, DBClient,
  uCMClientDataSet, uCmControlObject, uCmDbObject, wwQuery;

type
  TCtrlAlteradorImpostos = class(TCmControlObject)
    private
      pr_vlrMinRetIR: Double;   //  valor mínimo de retenção de IR;
      pr_vlrMinRetCS: Double;   //  Valor mínimo para retnção da CS;
    protected

    public
      p_coddocumento,
      p_numlancto: int64;     // Edilaine - SOL 199641 / KTN 1921256
      p_plncodigo:        Integer;
      p_datalancto:       TDateTime;
      p_valor,
      p_valoroutramoeda:  Double;
      p_debcre,
      p_historicocompl:   String;
      p_estorno,
      p_lotetransmissao:  Integer;
      p_codtipdoc:        Integer;
      p_vlrliquido:       Double;
      p_numfatura,
      p_flgtipofatura,
      p_flgfatemitida,
      p_numrecibo:        String;
      p_idnflivro,
      p_unidnegoc,
      p_numlotemanual,
      p_coddocinss:       Integer;
      p_numnf,
      p_flgrecebeunf:     String;
      p_idapuracaopis,
      p_idmotivocancfat:  Integer;
      p_flglancbaixaadto,
         p_flglancbaixa,
         p_flgcontabiliza,
         p_flgincideIRRF, p_dscUnidNegoc {SOL 189828 KTN 1794500 - Paulo Nobre}: String;
      p_idloteexportactb,
         p_plnantecipa,
         p_idenviodocumento, p_contagem {SOL 189828 KTN 1794500 - Paulo Nobre}: Integer;
      { Propriedades de trabalho  (São usadas internamente para geração dos alteradores)}
      p_IDPESSOA:     integer;
      p_RECPAG:       String;
      p_CODTIPRECDES: string;
      p_CODALTERADOR: Double;
      p_VALORBRUTO:   Double;
      p_VALORALTERA1: Double;
      P_VALORALTERA2: Double;
      p_PORCENTAGEM1: Double;
      p_PORCENTAGEM2: Double;
      p_CNPJBUSCAR: String;
      p_RAIZNPJ: String;
      P_Mesbusca: String;
      p_Anobusca: String;
      p_OPERACAO: String;
      p_FLGSIMPLES: Boolean;
      p_FLGESPECIAL: Boolean;
      Constructor Create; Override;
      Destructor Destroy; Override;

      Procedure VerificaAlteradores; //  Verifica se o tipo de desembolso possui alteradores cadastrados.
      Procedure RecuperaParametros; //  Recupera os valores parametrizados
      Procedure ImpostoDeRenda;
      Procedure ContribuicaoSocial;
      Procedure GravaAlteradores(tpimposto: String);
      Procedure rn_006;
      Procedure rn_007;
      Function Msg001(): Boolean;
      Function Msg002(): Boolean;
      Function Msg003(): Boolean;

   Published

   End;

Implementation

Uses USistema, UMensErro, UAutorizacao, DBaseDados, uCtrlParamIntegra, uString,
   FImpTipoDesembMT, uDataBase, FTrdxCCxContaMT, fCadRecDesXAgregMT, FLancDocCapCarMT;

Var
   CtrlTipoRecDesembxAlterador: TCtrlTipoRecDesembxAlterador;
   CdsAlteradores: TCMClientDataSet;
   CdsMovimento: TClientDataSet;
   vContribuicao: Double;

   { TCtrlAlteradorImpostos }

Constructor TCtrlAlteradorImpostos.Create;
Begin
   Inherited;
   //  Inicializa os objetos e propriedades:
   CtrlTipoRecDesembxAlterador := tCtrlTipoRecDesembxAlterador.Create;
   CtrlTipoRecDesembxAlterador.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

   p_IDPESSOA := 0;
   p_CODTIPRECDES := '';        
   p_CODALTERADOR := 0;
End;

Destructor TCtrlAlteradorImpostos.Destroy;
Begin
   Inherited;
End;

Function TCtrlAlteradorImpostos.Msg001: Boolean;
Begin
   //  MSG001 - Pergunta pela necessidade de lançamento dos alteradores
   If (MsgDlg('Existem documentos a vencer no mesmo mês do documento que está sendo lançado.' +
      ' A soma total atinge o limite de retenção.' + #13#10#13#10 +
      'Deseja Incluí-los no cálculo do tributo?', 'Alteradores de Impostos', mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
      Result := True
   Else
      Result := False;
End;

Function TCtrlAlteradorImpostos.Msg002: Boolean;
Begin
   //  MSG002 - Informa que já existem alteradores lançados
   Result := True;
   MsgDlg('Os Alteradores para retenção de impostos já foram lançados', 'Alteradores de Impostos', mtInformation, [mbYes], 0);
End;

Function TCtrlAlteradorImpostos.Msg003: Boolean;
Begin
   //  MSG003 - Avisa que o valor do alterador excede o valor da nota que está
   //           sendo lançada.
   //  Result := True;
   If (MsgDlg('O valor do do alterador apurado após o lançamento desta última nota, excede o valor da mesma.' + #13#10 +
      'Deseja gerar o alterador até o limite da nota que está sendo lançada?', 'Alteradores de Impostos', mtConfirmation, [mbYes, mbNo], 0) = mryes) Then
      Result := True
   Else
      Result := False;
End;

Procedure TCtrlAlteradorImpostos.VerificaAlteradores;
Var
   contagem: Integer;

Begin
   // Caso seja selecionado uma das FLAGs (Simples ou Situação Especial) o processo não executa.
   If p_FLGSIMPLES Or p_FLGESPECIAL Then
      Exit;

   // RN001 - Identifica obrigatoriedade do lançamento de alterador de IR.
   contagem := 0;
   contagem := CtrlTipoRecDesembxAlterador.PesqTipoRecDesembxAlterador(p_IDPESSOA, p_RECPAG, p_CODTIPRECDES, 0);
   // SOL 189828 KTN 1794500 - Paulo Nobre
   p_contagem := contagem;
   //
  // Se contagem > 0, significa que tem alteradores a aplicar; neste caso, vamos
  // Recuperar os alteradores encontrados em um dataset. Isso permitirá tomar as
  // próximas ações.
  if contagem > 0 then
  begin
    try
      begin
        // Recupera os parametros de valores minimos
        RecuperaParametros;
        // Busca os alteradores cadastrados para o tipo de desembolso em questão.
        CdsAlteradores := TCMClientDataSet.Create( CdsAlteradores );
        {}
        CdsAlteradores.Data := CtrlTipoRecDesembxAlterador.ListTipoRecDesembxAlterador(0, p_IDPESSOA, p_RECPAG, p_CODTIPRECDES, 0);

        CdsAlteradores.Open;
        CdsAlteradores.First;

        // Varre os alteradores cadastrados para o tipo de desembolso.
        while (not  CdsAlteradores.Eof ) do
        begin
          // Guarda o codigo do alterador
          p_CODALTERADOR := CdsAlteradores.FieldByName('CODALTERADOR').AsFloat;

          // Caso seja um alterador de IR, executa o Cálculo de IRRF
          if CdsAlteradores.FieldByName('TPIMPOSTO').Asstring = 'IR' then
          begin
            ImpostoDeRenda;
            GravaAlteradores('IR');
          end;
          // Caso seja um alterador de CONTRIBUIÇÃO SOCIAL, executa a regra de cálculo da CSLL
          if CdsAlteradores.fieldbyname('TPIMPOSTO').Asstring = 'CS' then
          begin
            ContribuicaoSocial;
            GravaAlteradores('CS');
          end;
          //  Próximo alterador cadastrado.
          CdsAlteradores.Next;
        end;
      end;
    finally
      // Finaliza. Fecha o dataset e libera a memória que ele pudesse estar usando.
      CdsAlteradores.close;
      FreeAndNil( CdsAlteradores );
    end;
  end;
end;

procedure TCtrlAlteradorImpostos.RecuperaParametros;
var
  CdsParms: TStringList;
begin
  // Recupera os parâmetros informados
  try
    Begin
      CdsParms := CtrlTipoRecDesembxAlterador.ListParamCap(p_IDPESSOA, p_RECPAG);
      pr_vlrMinRetIR := StrToFloat(CdsParms.Strings[0]); // CdsParms.fieldbyname('VLRMINIRRF').AsFloat;
      pr_vlrMinRetCS := StrToFloat(CdsParms.Strings[1]);  // CdsParms.fieldbyname('VLRMINCS').AsFloat;
    end;
  finally
    FreeAndNil( CdsParms );
  end;
end;

procedure TCtrlAlteradorImpostos.ImpostoDeRenda;
begin
  //  Geração do Imposto de Renda
  p_PORCENTAGEM1 := CdsAlteradores.fieldbyname('PERCENTUAL').AsFloat;
  if p_PORCENTAGEM1 <= 0 then
  begin
    p_VALORALTERA1 := 0;
  end
  else
  begin
    if p_VALORBRUTO <= 0 then
    begin
      p_VALORALTERA1 := 0;
    end
    else
    begin
        p_VALORALTERA1 := ((p_VALORBRUTO * p_PORCENTAGEM1 ) / 100);
    end;

    if p_VALORALTERA1 < pr_vlrMinRetIR then
    begin
        p_VALORALTERA1 := 0;
    end;
  end;
end;

procedure TCtrlAlteradorImpostos.ContribuicaoSocial;
var
  cdsMovto:    TClientDataSet;
  cdsContrRet: TClientDataSet;
  vHora:       TDateTime;
  vacumulado:  Extended;

begin
  //  Geração de contribuição social
  //  1.Verifica se o Mínimo para retenção de CS está parametrizado;
  if pr_vlrMinRetCS > 0 then
  begin
    //  Recupera porcentagem do alterador a ser aplicada.
    p_PORCENTAGEM2 := CdsAlteradores.fieldbyname('PERCENTUAL').AsFloat;
    //  Verifica se as propriedades para pesquisa estão preenchidas ok.
    if Length( Trim( p_CNPJBUSCAR )) < 14 then
    begin
      p_RAIZNPJ := p_CNPJBUSCAR;
    end
    else
    begin
      p_RAIZNPJ := Copy(p_CNPJBUSCAR,0,8 );
    end;
    //  Verifica os demais parametros ...
    if P_Mesbusca = '' then
      P_Mesbusca := FormatDateTime('mm' , p_datalancto );

    if p_Anobusca = '' then
      p_Anobusca := FormatDateTime('yyyy', p_datalancto );
    // Registra os parametros no log.
    vHora := Time;
    //  Para pesquisar o movimento, vamos inicializar o objeto de controle (uCtrl) relacionado ao movimento
    cdsMovto := TClientDataSet.Create( cdsMovto );
    cdsMovto.Data := CtrlTipoRecDesembxAlterador.varreOperacoesMes( p_RAIZNPJ , P_Mesbusca , p_Anobusca, 2 {StrToInt(p_OPERACAO)}, tbDtVencimento, IntToStr(p_coddocumento-1) );  // Edilaine - SOL 179108 / KTN 1654527
    cdsMovto.Open;
    //  2.Varre o movimento do mes, somando o valor bruto dos documentos para o mes corrente;
    vHora := Time;
    vacumulado := 0;
    cdsMovto.First;
    while (not cdsMovto.Eof) do
    begin
      if cdsMovto.FieldByName('VALOR').AsFloat > 0 then
      begin
        vacumulado := vacumulado + cdsMovto.FieldByName('VALOR').AsFloat;
      end;
      cdsMovto.Next;
    end;
    //  3.Caso o volume acumulado requeira lançamento do alterador, o valor é calculado, aplicando-se à porcentagem
    //    correspondente ao valor acumulado;
    if  (vacumulado + p_VALORBRUTO) >= pr_vlrMinRetCS then    // Edilaine - SOL 179108 / KTN 1654527
    begin
      // Exibe a msg001:
      if (not Msg001) then
      begin
        // Usuário respondeu que não (vide msg001).
        // neste caso, vai ser calculada apenas a retenção do documento
        vContribuicao := ((p_VALORBRUTO * p_PORCENTAGEM2 ) / 100);
        if vContribuicao > 0 then
          P_VALORALTERA2 := vContribuicao
        else
          P_VALORALTERA2 := 0;
      end
      else
      begin
        // Usuário respondeu que sim (vide msg001).
        // Neste caso o cálculo é feito com o Total Bruto acumulado dos documentos encontrados.
        vContribuicao := ((vAcumulado * p_PORCENTAGEM2 ) / 100) +   // Edilaine - SOL 179108 / KTN 1654527
                         ((p_VALORBRUTO * p_PORCENTAGEM2 ) / 100);  // Edilaine - SOL 179108 / KTN 1654527 - acrescido o valor do CS sobre o doc atual

        if vContribuicao > 0 then
        begin
          // Neste caso, vamos criar um novo dataset para verificar retenções de CS Anteriores a serem abatidas
          //  Para pesquisar os alteradores lançados, vamos inicializar o objeto de controle (uCtrl) relacionado ao movimento:
          cdsContrRet := TClientDataSet.Create( cdsContrRet );
          cdsContrRet.Data := CtrlTipoRecDesembxAlterador.varreOperacoesMes( p_RAIZNPJ , P_Mesbusca , p_Anobusca, 4, tbDtVencimento, IntToStr(p_coddocumento-1) );  // Edilaine - SOL 179108 / KTN 1654527
          cdsContrRet.Open;
          //  2.Varre o movimento do mes, somando o valor bruto dos documentos para o mes corrente;
          vHora := Time;
          vacumulado := 0;
          cdsContrRet.First;
          while (not cdsContrRet.Eof) do
          begin
            if cdsContrRet.FieldByName('VALOR').AsFloat > 0 then
              if cdsContrRet.FieldByName('TPIMPOSTO').AsString = 'CS' then
              begin
                vContribuicao := vContribuicao - cdsContrRet.FieldByName('VALOR').AsFloat;
              end;
            cdsContrRet.Next;
          end;
          // Fecha e libera o dataset de contribuições retidas
          cdsContrRet.Close;
          FreeAndNil(cdsContrRet);
          // Se a contribuição apurada for maior que zero, publica o valor. Este
          // será usado na hora de criar os alteradores no lançamento.
        end;
        if vContribuicao > 0 then
          P_VALORALTERA2 := vContribuicao
        else
          P_VALORALTERA2 := 0;
        // Verifica se o valor do alterador Excede o valor do documento
        //  Caso isso ocorra, o usuário é questionado acerca da retenção do total do documento.
        if P_VALORALTERA2 >= p_VALORBRUTO then
        begin
          if (not Msg003) then
            P_VALORALTERA2 := 0
          else
            P_VALORALTERA2 := p_VALORBRUTO;
        end;
      End;
    end
    else if  p_VALORBRUTO >= pr_vlrMinRetCS then  // Edilaine - SOL 179108 / KTN 1654527
    begin
      // não tem valor acumulado, calcula apenas do documento
      vContribuicao := ((p_VALORBRUTO * p_PORCENTAGEM2 ) / 100);

      if vContribuicao > 0 then
        P_VALORALTERA2 := vContribuicao
      else
        P_VALORALTERA2 := 0;
    end;   // Edilaine - SOL 179108 / KTN 1654527 - fim

    // Fecha e libera o dataset de lançamentos do mês.
    cdsMovto.Close;
    FreeAndNil( cdsMovto );
  end;
end;

procedure TCtrlAlteradorImpostos.GravaAlteradores(tpimposto: string);
var
  strRet1: string;
  strl1:   TStringList;
  qryAux: TwwQuery;
  sSQL, sDescAlterador, SFLGVALORBASE : String; // Paulo Nobre - WO24106
begin
  //  RN005 - Realiza a persistencia dos alteradores
  if (tpimposto = 'IR') and (p_VALORALTERA1 > 0 ) then
  begin
    p_valor      := p_VALORALTERA1;
    p_vlrliquido := p_VALORALTERA1;
    p_OPERACAO   := '4';
    p_debcre     := 'D';
    p_historicocompl := 'Retenção automática de imposto de renda';
    // Aqui deve verificar se já foi lançado alterador de IR para o documento em
    // questão. Caso haja, vai abater o valor de IR apurado do que já foi lançado.
    strRet1 := CtrlTipoRecDesembxAlterador.ProcuraAlteradorLancado( p_coddocumento, p_historicocompl, p_CODALTERADOR );
    if strRet1 <> '' then
    begin
      strl1 := TStringList.Create;
      strl1.CommaText := strRet1;

      CtrlTipoRecDesembxAlterador.AtualizaValorAlterador( StrToInt(strl1.Strings[0]),StrToInt(strl1[1]), p_VALORALTERA1);
      p_VALORALTERA1 := 0;

      strl1.free;
      strRet1 := '';
    end;
  end;

  if (tpimposto = 'CS') and (p_VALORALTERA2 > 0 ) then
  begin
    p_valor      := p_VALORALTERA2;
    p_vlrliquido := p_VALORALTERA2;
    p_OPERACAO   := '4';
    p_debcre     := 'D';
    p_historicocompl := 'Retenção automática das contribuições sociais';

    // Edilaine - SOL 179108 / KTN 1654527
    strRet1 := CtrlTipoRecDesembxAlterador.ProcuraAlteradorLancado( p_coddocumento, p_historicocompl, p_CODALTERADOR );
    if strRet1 <> '' then
    begin
      strl1 := TStringList.Create;
      strl1.CommaText := strRet1;

      CtrlTipoRecDesembxAlterador.AtualizaValorAlterador( StrToInt(strl1.Strings[0]),StrToInt(strl1[1]), p_VALORALTERA2);
      p_VALORALTERA2 := 0;
      strl1.free;
      strRet1 := '';
    end;
    // Edilaine - SOL 179108 / KTN 1654527 - fim
  end;
  {}
  If (((tpimposto = 'IR') and (p_VALORALTERA1 > 0 )) or
      ((tpimposto = 'CS') and (P_VALORALTERA2 > 0 ))) then
  begin

// SOL 189828 KTN 1794500 - Paulo Nobre
         QRYAUX := TWWQUERY.CREATE(Nil);
         QRYAUX.DATABASENAME := 'BASEDADOS';

         // PEGANDO A DESCRIÇÃO DO ALTERADOR
         QRYAUX.CLOSE;
         QRYAUX.SQL.CLEAR;
         SSQL := 'SELECT DESCRICAO,FLGVALORBASE FROM TIPOALTERADOR WHERE CODALTERADOR = ' + QUOTEDSTR(FLOATTOSTR(P_CODALTERADOR)); // Paulo Nobre - WO24106
         QRYAUX.SQL.ADD(SSQL);
         QRYAUX.OPEN;
         SDESCALTERADOR := QRYAUX.FIELDBYNAME('DESCRICAO').ASSTRING;

         // Paulo Nobre - WO24106 - Inicio
         // Esta flag indica se o alterador usa o valor base para a retenção de tributos ("S" ou "N")
         SFLGVALORBASE := QRYAUX.FIELDBYNAME('FLGVALORBASE').ASSTRING;
         // Paulo Nobre - WO24106 - Fim

         QRYAUX.CLOSE;
         FREEANDNIL(QRYAUX);

         // INSERIDO NO CDS DOS ALTERADORES - ABA ALTERADORES
         FRMLANCDOCCAPCAR.CDSALTERADORES.INSERT;
         FRMLANCDOCCAPCAR.CDSALTERADORES.FIELDBYNAME('DESCRICAO').ASSTRING := SDESCALTERADOR;
         FRMLANCDOCCAPCAR.CDSALTERADORES.FIELDBYNAME('CODALTERADOR').ASFLOAT := P_CODALTERADOR;
         FRMLANCDOCCAPCAR.CDSALTERADORES.FIELDBYNAME('DATALANCTO').ASDATETIME := P_DATALANCTO;
         FRMLANCDOCCAPCAR.CDSALTERADORES.FIELDBYNAME('VALOR').ASFLOAT := P_VALOR;
         FRMLANCDOCCAPCAR.CDSALTERADORES.FIELDBYNAME('VALOROUTRAMOEDA').ASFLOAT := P_VALOROUTRAMOEDA;
         FRMLANCDOCCAPCAR.CDSALTERADORES.FIELDBYNAME('DEBCRE').ASSTRING := P_DEBCRE;
         FRMLANCDOCCAPCAR.CDSALTERADORES.FIELDBYNAME('VLRLIQUIDO').ASFLOAT := P_VLRLIQUIDO;
         FRMLANCDOCCAPCAR.CDSALTERADORES.FIELDBYNAME('UNIDNEGOC').ASSTRING := V_UNIDNEGOC;
         FRMLANCDOCCAPCAR.CDSALTERADORES.FIELDBYNAME('NOME').ASSTRING := P_DSCUNIDNEGOC;
         FRMLANCDOCCAPCAR.CDSALTERADORES.FIELDBYNAME('CONTABILIZA').ASSTRING := P_FLGCONTABILIZA;
         FRMLANCDOCCAPCAR.CDSALTERADORES.FIELDBYNAME('FLGINCIDEIRRF').ASSTRING := '';

         // Paulo Nobre - WO24106 - Inicio
         // Se a flag indica que o alterador usa o valor base para a retenção de tributos
         // então atribui ao VALORBASERETENCAO o VALOR DA AP (Campo "Valor Moeda Corrente")
         If SFLGVALORBASE = 'S' Then  // Sim
            FRMLANCDOCCAPCAR.CDSALTERADORES.FIELDBYNAME('VALORBASERETENCAO').ASFLOAT := P_VALOR;
         // Paulo Nobre - WO24106 - Fim

         FRMLANCDOCCAPCAR.CDSALTERADORES.POST;

         {CtrlTipoRecDesembxAlterador.InsereAlterador( p_coddocumento, p_numlancto,
                                                         p_datalancto, p_valor, p_debcre,
                                                         p_historicocompl, p_lotetransmissao,
                                                         p_codtipdoc, p_vlrliquido, p_numfatura, p_flgtipofatura,
                                                         p_flgfatemitida, p_numrecibo, p_unidnegoc,
                                                         p_numlotemanual, p_numnf, p_flgrecebeunf,
                                                         p_idmotivocancfat, p_flglancbaixaadto,
                                                         p_flglancbaixa, p_flgcontabiliza,
                                                         p_idenviodocumento, p_IDPESSOA, p_OPERACAO, P_CODALTERADOR );}
         //
  end;
  {}
  if (tpimposto = 'IR') and (p_VALORALTERA1 > 0 ) then p_VALORALTERA1 := 0;
  if (tpimposto = 'CS') and (p_VALORALTERA2 > 0 ) then p_VALORALTERA2 := 0;
  {}
end;

procedure TCtrlAlteradorImpostos.rn_006;
begin
end;

procedure TCtrlAlteradorImpostos.rn_007;
begin

end;

end.
