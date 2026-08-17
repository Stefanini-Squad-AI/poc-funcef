unit uCtrlSPCConsiste;
{
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
 Autor.....: Paulo Nobre
 Chamado...: WO21525
 Data      : 22/05/2025
 Descrição : Inclusão do complemento do Patrimônio Social (quando este existir)
             na composição do somatório dos outros complementos.
//------------------------------------------------------------------------------
 Autor.....: Arnaldo Vicente Scarin
 SIG.......: 12742 - Contabilidade - Rentabilidade contábil
 Data      : 22/07/2024
 Descrição : Correção do Relatorio de Rentabilidade Contábil, que está apresentando
             erro ao não mostrar o valor do Ultimo Mês no resumo das contas
             selecionadas
//------------------------------------------------------------------------------
 Autor.....: Rafael Vasconcelos
 SIG.......: 87988
 Data      : 07/11/2019
 Descrição : Correção na Rentabilidade Contábil ao processar as rubricas 
			 relativas ao PATRIMONIO SOCIAL .
//------------------------------------------------------------------------------
 Autor.....: Marcelo Cardoso Santos Filho
 SIG.......: 26555
 Data      : 16/02/2017
 Descrição : Inclusão do grupo Patrimônio Social e inclusão do campo Conta para
             Aglutinação.
//------------------------------------------------------------------------------
N. Sol.............: 1721982
N. Kintana.........: 184376
Data...............: 05/07/2012
Responsável........: Fernando Xavier
Descrição..........: retirado a alteração do SOL 183592 de todas as funcionalidades
                     menos a da função SelecionaItemSpcConsisteRegra
//------------------------------------------------------------------------------
N. Sol.............: 183592
N. Kintana.........: 1715812
Data...............: 02/07/2012
Responsável........: Fernando Xavier
Descrição..........: alterado a query que monta a funcionalidade Consistencia de Regras
//------------------------------------------------------------------------------
N. Sol.............: 135224
N. Kintana.........: 802134
Data...............: 04/05/2010
Responsável........: Arnaldo Vicente Scarin
Descrição..........: Correção da rotina que Seleciona as regras de consistência.
//------------------------------------------------------------------------------
N. Sol.............: 131939
N. Kintana.........: 755306
Data...............: 08/03/2010
Responsável........: Ricardo Alves
Descrição..........: implementação e Validação dos campos data de Composição e
  Plano Contábil na janela Consistência de Regras.

Rotina............: ProcessaRentabilidade
N. Sol.............: 124446
N. Kintana......: 632154
Data...............: 16/09/2009
Responsável...: Cássio Camargo
Descrição........: Alteração na query que traz a Rentabilidade.
-------------------------------------------------------------------------------
Rotina............: ProcessaRentabilidade
N. Sol.............: 124287
N. Kintana......: 629798
Data...............: 14/09/2009
Responsável...: Cássio Camargo
Descrição........: Ajsute na query que traz a Rentabilidade do período informado.
                   Incluída cláusula indicada pelo campo
                   "Desconsiderar o encerramento de resultado".    
-------------------------------------------------------------------------------
Rotina............: ProcessaRentabilidade
N. Sol.............: 43993
N. Kintana......: 523266
Data...............: 03/09/2009
Responsável...: Cássio Camargo
Descrição........: Ajuste na rotina de Processamento da Rentabilidade, levando
                   em consideração a vigência dos Tipos de Rentabilidade.
--------------------------------------------------------------------------------
Rotina............: ProcessaRentabilidade
N. Sol.............: 109547
N. Kintana......: 497169
Data...............: 19/02/2009
Responsável...: Ricardo Alves
Descrição........: Alterada sentença SQL para melhoria de performance.

{------------------------------------------------------------------------------
  Desenvolvedor: Augusto
  Data         : 10/06/2008
  Pendência    : 25873 (Reabertura)
  Descrição    : Ajuste na apuração do saldo final para as contas de custo
{------------------------------------------------------------------------------
  Desenvolvedor: Augusto
  Data         : 07/06/2008
  Pendência    : 28065
  Descrição    : Ajuste na apuração do saldo inicial
{------------------------------------------------------------------------------
  Desenvolvedor: Augusto
  Data         : 07/06/2008
  Pendência    : 28056
  Descrição    : Ajuste na totalização do relatório
{------------------------------------------------------------------------------
  Desenvolvedor: Augusto
  Data         : 03/01/2008
  Pendência    : 26719
  Metodo       : Relatorio
  Descrição    : Ageragar Outros e Custo a opções de tela
{------------------------------------------------------------------------------
  Desenvolvedor: Augusto
  Data         : 03/01/2008
  Pendência    : 26719
  Metodo       : Relatorio
  Descrição    : Ageragar Outros e Custo a opções de tela
{------------------------------------------------------------------------------
  Desenvolvedor: Augusto
  Data         : 27/10/2007
  Pendência    : 26719
  Metodo       : Relatorio
  Descrição    : Acerto nas totalizações mensais
{------------------------------------------------------------------------------
  Desenvolvedor: Marcus Oliveira
  Data         : 21/09/2007
  Pendência    : 26384
  Descrição    : Criado método pra pegar o ultimo dia do mês
{------------------------------------------------------------------------------
  Desenvolvedor: Marcus Oliveira
  Data         : 13/09/2007
  Pendência    : 26345
  Descrição    : Se o mês for janeiro pegue a rentabilidade do ano anterior.
{------------------------------------------------------------------------------
  Desenvolvedor: Marcus Oliveira
  Data         : 05/09/2007
  Pendência    : 26237
  Descrição    : Criado o método AbreCDSRentab
{------------------------------------------------------------------------------
  Desenvolvedor: Marcus Oliveira
  Data         : 20/09/2006
  Pendência    : 22024
  Solução      : Somar toda rentabilidade contabil
                 Novo método: ProcessaVariasRentabilidade
{------------------------------------------------------------------------------
  Desenvolvedor: Alex Pereira
  Data         : 14/03/2005
  Pendência    : 18814
  Solução      : Prever saldo de movimentações e saldo atual
                 Novo campo: FLGSALDOOUMOVIM
------------------------------------------------------------------------------}

interface

Uses DB, uDataBase, uDbSPCConsiste, uDbItemSPCConsiste, uCmControlObject, dbclient, sysutils,
     Provider, ComCtrls,DBTables, Classes,
     uDiasUteis, uCtrlPlanoData, uCMMath, uCtrlPadroes,
     uCmClientDataSet, uCMTypes;

  Type

    TCtrlSPCConsiste = Class(TCmControlObject)
    private
      FcdsSPCConsiste: TCMClientDataSet;
      FDbSPCConsiste: TDbSPCConsiste;
      FcdsItemSPCConsiste: TCMClientDataSet;
      FDbItemSPCConsiste: TDbItemSPCConsiste;
      CtrlPlanoData: TCtrlPlanoData;

      procedure SetcdsSPCConsiste(const Value: TCMClientDataSet);
      procedure SetDbSPCConsiste(const Value: TDbSPCConsiste);
      procedure SetcdsItemSPCConsiste(const Value: TCMClientDataSet);
      procedure SetDbItemSPCConsiste(const Value: TDbItemSPCConsiste);
      protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;

      //Cássio
      function RetornaVigenciaValida(sPerIni, sPerFim: string; iIdSpcConsiste: Integer) : boolean;
      function VerificaVigenciaInicioPeriodo(sPerIni: string; iIdSpcConsiste: Integer): boolean;
    public
      // SIG 12742 - Contabilidade - Rentabilidade contábil
      // Alterador por Arnaldo Vicente Scarin em 22/07/2024
      ValorUltimoMesDisponibilidade : Double;
            
      constructor Create; Override;
      destructor Destroy; Override;

      property cdsSPCConsiste : TCMClientDataSet read FcdsSPCConsiste write SetcdsSPCConsiste;
      property cdsItemSPCConsiste : TCMClientDataSet read FcdsItemSPCConsiste write SetcdsItemSPCConsiste;
      property DbSPCConsiste : TDbSPCConsiste read FDbSPCConsiste write SetDbSPCConsiste;
      property DbItemSPCConsiste : TDbItemSPCConsiste read FDbItemSPCConsiste write SetDbItemSPCConsiste;

      function SelecionaSPCConsiste( iIdSPCConsiste : integer; sTipoConsiste : String ) : OLEVariant;
      function SelecionaItemSPCConsiste( iIdSPCConsiste : integer; dDtSpcConsiste: TDateTime ) : OLEVariant;
      function Gravar : Boolean;
      function Deletar : Boolean;
      //Cássio - SOL Nº 43993 KINTANA Nº 523266
      function DeletarItemSpcConsiste : boolean;

      // Ricardo A. SOL 131939 KTN 755306
      function SelecionaItemSpcConsisteRegra( dtSpcConsiste: TDateTime ): OleVariant;
      // FIM Ricardo A. SOL 131939 KTN 755306

      function SelecionaTodos( iPlano : integer ) : OLEVariant;
      function SelecionaTipoRentConabil( iPlano : Integer ) : OLEVariant;

      function RecuperaPatro : OLEVariant;
      function RecuperaPlano : OLEVariant;

      function EUltimoDiaMes(dData: Tdatetime): Boolean;
      function RetornaRentabilidade(iIdSPCConsiste: integer) : OleVariant;
      function ListaPlano: OleVariant;
      function AbreCdsRentab : OleVariant;
      function ListaPatro: OleVariant;
      function ListaImagem(iIdPessoa: integer): OleVariant;
      function AbreCdsResult: OleVariant;
      function ProcessaRentabilidade(iExercicio, iPerIni, iPerFim, iIdSpcConsiste : Integer;
                                     sIdPlanos, sIdPatros : String; bDesconsidera: boolean;
                                     CdsResult: TClientDataSet;
                                     var dRentPer: Double;
                                     iIdPessoa : Integer;
                                     piPlanoContabil : Integer = -1 ;

                                     cCusto        :       Char = 'X';
                                     cOutros       :       Char = 'X';
                                     cPatrimonio   :       Char = 'X' // MARCELO CARDOSO - SIG26555
                                     ): boolean;
    end;




implementation

{ TCtrlSPCConsiste }



function TCtrlSPCConsiste.AbreCdsRentab: OleVariant;
begin
   Result := GetDataPacket('SELECT ' +
                           ' (''                                                 '') as Descricao,  ' +
                           ' 0 as RENTPERIODO, ' +
                           ' 0 AS LIQUIDO, ' +
                           ' ''00000000000000000000'' AS ULT_MES, ' +
                           ' 0 AS MES, ' +
                           ' 0 AS RENTMENSAL ' +
                          'FROM DUAL ' +
                          '   WHERE 1 = 2 ');

end;

function TCtrlSPCConsiste.AbreCdsResult: OleVariant;
begin
   Result := GetDataPacket('SELECT ' +
                           ' (''                                                 '') as Descricao,  ' +
                           ' 0 as IDSPCCONSISTE, ' +
                           ' 0 as RENTPERIODO, ' +

                           ' TO_DATE(''00/00/0000'', ''DD/MM/YYYY'') AS DATA, ' +
                           ' 0 AS ATIVO, ' +
                           ' 0 AS PASSIVO, ' +
                           ' 0 AS LIQUIDO, ' +
                           ' 0 AS RECEITA, ' +
                           ' 0 AS DESPESA, ' +
                           ' 0 AS MES, ' +
                           ' 0 AS DIA, ' +
                           ' 0 AS RENTDIA, ' +
                           ' 0 AS RENTMENSAL, ' +
                           ' ''               '' AS PERNUMERO ' +
                          'FROM DUAL ' +
                          '   WHERE 1 = 2 ');
end;




constructor TCtrlSPCConsiste.Create;
begin
  inherited;
  FDbSPCConsiste     := TDbSPCConsiste.Create(Self);
  FDbItemSPCConsiste := TDbItemSPCConsiste.Create(Self);
  CtrlPlanoData      := TCtrlPlanoData.Create;
  CtrlPlanoData.InitializeAs(Padroes);
end;




function TCtrlSPCConsiste.Deletar: Boolean;
var
  Msg  : String;
begin
  if ConnectionSide = cnsClient Then
  begin
    Result := Connection.AppServer.Deletar( FcdsSPCConsiste.Data, FcdsItemSPCConsiste.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      FCdsItemSPCConsiste.First;
      while FCdsItemSPCConsiste.RecordCount > 0 do
      begin
        FCdsItemSPCConsiste.Delete;
        FCdsItemSPCConsiste.First;
      end;

      //Filhos
      Result := ApplyCds( FCdsItemSPCConsiste, FDbItemSPCConsiste,
                         [FDbSPCConsiste.Idspcconsiste], [FDbItemSPCConsiste.Idspcconsiste] );
      Msg    := FDbItemSPCConsiste.MessageInfo;
      if not Result then raise Exception.Create( Msg );

      //Pai
      Result := ApplyCds( FcdsSPCConsiste, FDbSPCConsiste, [], [] );
      Msg    := FDbSPCConsiste.MessageInfo;
      if not Result then raise Exception.Create( Msg );

      Commit;
    except
      On E:Exception Do
      begin
        Rollback;
        Result := False;
        MessageInfo := E.Message;
       end;
    end;
  end;
end;




function TCtrlSPCConsiste.DeletarItemSpcConsiste: boolean;
var
  Msg  : String;
begin
  if ConnectionSide = cnsClient Then
  begin
    Result := Connection.AppServer.Deletar( FcdsSPCConsiste.Data, FcdsItemSPCConsiste.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      FCdsItemSPCConsiste.First;
      while FCdsItemSPCConsiste.RecordCount > 0 do
      begin
        FCdsItemSPCConsiste.Delete;
        FCdsItemSPCConsiste.First;
      end;

      Result := ApplyCds( FCdsItemSPCConsiste, FDbItemSPCConsiste,
                         [FDbSPCConsiste.Idspcconsiste], [FDbItemSPCConsiste.Idspcconsiste] );
      Msg    := FDbItemSPCConsiste.MessageInfo;
      if not Result then raise Exception.Create( Msg );

      Commit;
    except
      On E:Exception Do
      begin
        Rollback;
        Result := False;
        MessageInfo := E.Message;
       end;
    end;
  end;

end;

destructor TCtrlSPCConsiste.Destroy;
begin
  inherited;
  FDbSPCConsiste.Free;
  FDbItemSPCConsiste.Free;
  if IsAppServer then
  begin
    FcdsSPCConsiste.Free;
    FcdsItemSPCConsiste.Free;
    FreeAndNil(CtrlPlanoData);
  end;
end;




procedure TCtrlSPCConsiste.DoChangeDataBase;
begin
  inherited;
  FDbSPCConsiste.DataBaseName     := DataBaseName;
  FDbItemSPCConsiste.DataBaseName := DataBaseName;
end;

function TCtrlSPCConsiste.EUltimoDiaMes(dData: Tdatetime): Boolean;
var
  wDia, wMes, wAno : Word;
  AnoBisexto: Boolean;

begin
  Result := False;

  DecodeDate(dData, wAno, wMes, wDia);

  if (  wAno mod 4 = 0 ) and ((wAno mod 100 <> 0) or (wAno mod 400 = 0)) then
     AnoBisexto := True
  else
     AnoBisexto := False;

  if ( ( wDia = 30 ) and ( (wMes = 4) or (wMes = 6) or (wMes = 9) or (wMes = 11) ) ) then
     Result := True;

  if ( (AnoBisexto ) and (wDia = 29 ) and ( wMes = 2) ) then
     Result := True;

  if ( not ( AnoBisexto ) and (wDia = 28 ) and ( wMes = 2) ) then
     Result := True;

  if ( ( wDia = 31 ) and ( ( wMes = 1) or (wMes = 3) or (wMes = 5) or (wMes = 7) or (wMes = 8) or (wMes = 10)or (wMes = 12) ) ) then
     Result := True;

end;

function TCtrlSPCConsiste.Gravar : Boolean;
var
  Msg  : String;
begin
  if ConnectionSide = cnsClient Then
  begin
    Result := Connection.AppServer.Gravar( FcdsSPCConsiste.Data, FcdsItemSPCConsiste.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
       StartTransaction;

       //Pai
       Result := ApplyCds( FcdsSPCConsiste, FDbSPCConsiste, [], [] );
       Msg    := FDbSPCConsiste.MessageInfo;
       if not Result then raise Exception.Create( Msg );

       //Filhos
       Result := ApplyCds( FCdsItemSPCConsiste, FDbItemSPCConsiste,
                          [FDbSPCConsiste.Idspcconsiste], [FDbItemSPCConsiste.Idspcconsiste] );
       Msg    := FDbItemSPCConsiste.MessageInfo;
       if not Result then raise Exception.Create( Msg );

       Commit;
    except
      On E:Exception Do
      begin
        Rollback;
        Result := False;
        MessageInfo := E.Message;
       end;
    end;
  end;
end;




function TCtrlSPCConsiste.ListaImagem(iIdPessoa: integer): OleVariant;
begin
   Result := GetDataPacket('select ' +
                           '   i.imagem ' +
                           'from ' +
                           '   imagens i, ' +
                           '   pessoa p ' +
                           'where ' +
                           '  (p.idimagem = i.idimagem) and ' +
                           '  (p.idpessoa = ' + IntToStr(iIdPessoa)+ ') ');
end;




function TCtrlSPCConsiste.ListaPatro: OleVariant;
begin
    Result := GetDataPacket('SELECT ' +
                            '  PA.IDPESSOA, ' +
                            '  PE.NOME, ' +
                            '  ''N'' AS MARCA ' +
                            'FROM ' +
                            '  PESSOA PE, ' +
                            '  PATRO PA ' +
                            'WHERE ' +
                            '  (PA.IDPESSOA = PE.IDPESSOA) ' +
                            'ORDER BY ' +
                            '  PE.NOME ');
end;




function TCtrlSPCConsiste.ListaPlano: OleVariant;
begin
   Result := GetDataPacket('SELECT ' +
                           '  IDPLANOPREV, ' +
                           '  NOME, ' +
                           '  ''N'' AS MARCA ' +
                           'FROM ' +
                           '  PLANPREVCONTABIL ' +
                           'ORDER BY ' +
                           '  NOME ');
end;




procedure TCtrlSPCConsiste.OnCreateAppServer;
begin
  inherited;
  FcdsSPCConsiste     := TCMClientDataSet.Create( nil );
  FcdsItemSPCConsiste := TCMClientDataSet.Create( nil );
end;

function TCtrlSPCConsiste.ProcessaRentabilidade(iExercicio, iPerIni,
                                                iPerFim, iIdSpcConsiste: integer;
                                                sIdPlanos, sIdPatros: string;
                                                bDesconsidera: boolean;
                                                CdsResult: TClientDataSet;
                                                var dRentPer: Double;
                                                iIdPessoa : Integer;
                                                piPlanoContabil : Integer = -1 ;

                                                cCusto        :       Char = 'X';
                                                cOutros       :       Char = 'X';
                                                cPatrimonio   :       Char = 'X' //MARCELO CARDOSO - SIG26555

                                                ): boolean;
var
  sSQL,sUltDiaMesAnt,sUltDiaMesFim : string;
  DiasUteis : TDiasUteis;
  cdsAuxRentab, CdsBusca, CdsParamContab: TClientDataSet;

  dSomaAtivo,
  dSomaPassivo,

  dSomaReceita,
  dSomaDespesa,
  dSomaMes,
  dSomaLiquido,
  dRentDia,
  dSomaDia,
  dRentMensal,
  dAcumulaRentMensal,
  dRentMensalPercent  : Double;


  sComplementoCusto,
  sComplementoPatrimonio, //MARCELO CARDOSO - SIG26555
  sComplementoOutros,
  sComplementoAtivo,
  sComplementoDespesa,
  sComplementoPassivo,
  sComplementoReceita,
  sMesAtual,
  sPeriodo,
  sDataIni,
  sDataFim : String;

  //Cássio
  bUsaFiltro :  boolean;

  // SIG 12742 - Contabilidade - Rentabilidade contábil
  // Alterador por Arnaldo Vicente Scarin em 22/07/2024
  iMes : Integer;


begin
  try

     bUsaFiltro     := True;
     DiasUteis      := TDiasUteis.Create;
     CdsBusca       := TCMClientDataSet.Create(nil);
     CdsParamContab := TClientDataSet.Create(nil);
     cdsAuxRentab   := TClientDataSet.Create(nil);

     // Pega o tipo de conta de resultado
     CdsParamContab.Data := GetDataPacket('SELECT PACTIPOPERRESULT FROM PARAMCONTAB WHERE IDPESSOA = ' + IntToStr(iIdPessoa));

     try
        // Extrai as Datas inicias e finais do periodo/exercicio
        sDataIni := FormatDateTime('dd/mm/yyyy',StrToDate('1/' + IntToStr(iPerIni) + '/' + IntToStr(iExercicio)));
        sDataFim := FormatDateTime('dd/mm/yyyy',StrToDate(DiasUteis.UltimoDiaMes('1/' + IntToStr(iPerFim) + '/' + IntToStr(iExercicio))));

        // Extra o último dia do mês anterior (Data Início)
        if iPerIni <= 9 then
        begin
          if (iPerIni - 1) = 0 then
            sUltDiaMesAnt := DiasUteis.UltimoDiaMes('01/12' + '/' + IntToStr( iExercicio - 1))
          else
            sUltDiaMesAnt := DiasUteis.UltimoDiaMes('01/0' + IntToStr(iPerIni - 1) + '/' + IntToStr(iExercicio))
        end
        else
          sUltDiaMesAnt := DiasUteis.UltimoDiaMes('01/' + IntToStr(iPerIni - 1) + '/' + IntToStr(iExercicio));

        // Extra o último dia do mês anterior (Data Fim)
        if iPerFim <= 9 Then
        begin
          if (iPerFim - 1) = 0 Then
            sUltDiaMesFim := DiasUteis.UltimoDiaMes('01/12' + '/' + IntToStr(iExercicio - 1))
          else
            sUltDiaMesFim := DiasUteis.UltimoDiaMes('01/0' + IntToStr( iPerFim - 1) + '/' + IntToStr(iExercicio))
        end
        else
          sUltDiaMesFim := DiasUteis.UltimoDiaMes('01/' + IntToStr(iPerFim - 1) + '/' + IntToStr(iExercicio));

        { Inicio Augusto 07/06/2008 }
        If ( piPlanoContabil = -1 ) Then Begin
          If ( CtrlPlanoData.PlanoNoPeriodo( iExercicio, iPerIni, iPerFim ) ) Then Begin

            piPlanoContabil := CtrlPlanoData.Plano;

          End Else Begin

            MessageInfo := CtrlPlanoData.MessageInfo;
            Exit;

          End;
        End;
        { Fim Augusto 07/06/2008    }

        //Cássio - Início
        if iPerFim = iPerIni then
        begin
          if not RetornaVigenciaValida(sDataIni, sDataFim, iIdSpcConsiste) then
            bUsaFiltro := False;
        end
        else
        begin
          if not VerificaVigenciaInicioPeriodo(sDataIni, iIdSpcConsiste) then
          bUsaFiltro := False;
        end;
        //Cássio - Fim

        Case iPerIni Of
          1 : sPeriodo := 'Janeiro';
          2 : sPeriodo := 'Fevereiro';
          3 : sPeriodo := 'Março';
          4 : sPeriodo := 'Abril';
          5 : sPeriodo := 'Maio';
          6 : sPeriodo := 'Junho';
          7 : sPeriodo := 'Julho';
          8 : sPeriodo := 'Agosto';
          9 : sPeriodo := 'Setembro';
          10: sPeriodo := 'Outubro';
          11: sPeriodo := 'Novembro';
          12: sPeriodo := 'Dezembro';
        End;

        // Montando a qry
        {sSQL := 'SELECT ' +
                '   NVL(SUM(DECODE(C.PLAGRUPO, ''A'', S.PLSDEBITOCORRENTE - S.PLSCREDITOCOR)),0) AS ATIVO, ' +
                '   0.00 AS DESPESA, ' +
                '   NVL(SUM(DECODE(C.PLAGRUPO, ''P'', S.PLSCREDITOCOR - S.PLSDEBITOCORRENTE)),0) AS PASSIVO, ' +
                '   0.00 AS RECEITA, ' +
                '   TO_DATE('+ QuotedStr( sUltDiaMesAnt ) + ', ''DD/MM/YYYY'') AS PLNDATDIA, ' +
                    QuotedStr(sPeriodo) + ' AS PERNUMERO ' +

                'FROM ' +
                '   PLANOSALDO S, ' +
                '   PLANOCONTA C, ' +
                '   ITEMSPCCONSISTE I ' +

                'WHERE ' +
                '   (S.PEREXERCICIO  = ' + IntToStr(iExercicio) + ') AND ' +
                '   ((S.PERNUMERO  <= '+ IntToStr ( iPerIni - 1 )+ ') OR (S.PERNUMERO  IS NULL)) ';

                if (trim (sIdPlanos) <> '') And (trim (sIdPlanos) <> '0') then
                   sSQL := sSQL + ' AND (S.IDPLANOPREV IN (' + trim(sIdPlanos) + ')) ';

                if (trim (sIdPatros) <> '') And (trim (sIdPatros) <> '0') then
                   sSQL := sSQL + ' AND (S.IDPATRO IN (' + trim(sIdPatros) + ')) ';

                sSQL := sSQL +
                ' AND (C.PLAGRUPO     IN (''A'', ''P'')) ' +
                ' AND (I.IDSPCCONSISTE  = ' + IntToStr(iIdSpcConsiste) + ')' ;

                // Se o mês for janeiro pegar o dia 31/12 pelo período nulo do próprio mês.
                if (sPeriodo = 'Janeiro') then
                   sSQL := sSQL + ' AND ((S.PLANO         = ' + IntToStr( piPlanoContabil ) + ') OR ( PERNUMERO IS NULL )) '
                else
                   sSQL := sSQL + ' AND (S.PLANO         = ' + IntToStr( piPlanoContabil ) + ')' ;

                sSQL := sSQL +

                ' AND (S.PLACONTA      = I.PLACONTA) ' +
                ' AND (S.PLACONTA      = C.PLACONTA) ' +
                ' AND (S.PLANO         = C.PLANO) ' +

                ' AND (I.DTSPCCONSISTE = (SELECT MAX (DTSPCCONSISTE) ' +
                '              FROM ITEMSPCCONSISTE ' +
                '             WHERE IDSPCCONSISTE = ' + IntToStr(iIdSpcConsiste) +
                '               AND DTSPCCONSISTE <= TO_DATE(' + QuotedStr(sDataIni) + ', ''DD/MM/YYYY''))) ' +
                //'               AND DTSPCCONSISTE <= TO_DATE(' + QuotedStr(sUltDiaMesAnt) + ', ''DD/MM/YYYY'')) ' +
                //'      OR I.DTSPCCONSISTE = TO_DATE(' + QuotedStr(sDataIni) + ', ''DD/MM/YYYY''))' +


                ' UNION '; }

         sSQL := 'SELECT ' +
                 '   NVL(SUM(DECODE(C.PLAGRUPO, ''A'', S.PLSDEBITOCORRENTE - S.PLSCREDITOCOR)), 0) AS ATIVO, ' +
                 '   0.00 AS DESPESA, ' +
                 '   NVL(SUM(DECODE(C.PLAGRUPO, ''P'', S.PLSCREDITOCOR - S.PLSDEBITOCORRENTE,''S'',S.PLSCREDITOCOR - S.PLSDEBITOCORRENTE)), 0) AS PASSIVO, ' +  //Rafael SIG 87988
                 '   0.00 AS RECEITA, ' +
                 '   I.DTSPCCONSISTE - 1 AS PLNDATDIA, ' +
                 '   TO_CHAR(I.DTSPCCONSISTE, ''Month'') AS PERNUMERO, ' +
                 '   1 AS TIPO ' +
                 '  FROM ' +
                 '   PLANOSALDO S, ' +
                 '   PLANOCONTA C, ' +
                 '   (SELECT ' +
                 '       CASE WHEN (DTSPCCONSISTE < '+ QuotedStr(sDataIni) + ') THEN ' +
                 '         TO_DATE('+ QuotedStr(sDataIni) +', ''DD/MM/YYYY'') ' +
                 '       ELSE ' +
                 '         DTSPCCONSISTE ' +
                 '       END AS DTSPCCONSISTE, ' +
                 '       PLACONTA ' +
                 '      FROM ITEMSPCCONSISTE ' +
                 '     WHERE IDSPCCONSISTE = ' + IntToStr(iIdSpcConsiste) +
                 '       AND ((DTSPCCONSISTE BETWEEN '+ QuotedStr(sDataIni) +' AND '+ QuotedStr(sDataFim) +') ';

                 if bUsaFiltro then
                    sSQL := sSQL + ' OR DTSPCCONSISTE = (SELECT MAX(DTSPCCONSISTE) ' +
                                   '                       FROM ITEMSPCCONSISTE    ' +
                                   '                      WHERE IDSPCCONSISTE = ' + IntToStr(iIdSpcConsiste) +
                                   '                        AND DTSPCCONSISTE <= ' + QuotedStr(sDataIni) + '))'
                 else
                  sSQL := sSQL + ' )';

                 sSQL := sSQL + ')I ' +
                 ' WHERE (S.PEREXERCICIO   = TO_NUMBER(SUBSTR(TO_CHAR(I.DTSPCCONSISTE, ''DD/MM/YYYY''), 7, 4))) ' +
                 '   AND ((S.PERNUMERO    <= (CASE WHEN (I.DTSPCCONSISTE < '+ QuotedStr(sDataIni)+') THEN ' +
                 '                             TO_NUMBER(SUBSTR(I.DTSPCCONSISTE, 4, 2)) ' +
                 '                           ELSE ' +
                 '                             TO_NUMBER(SUBSTR(I.DTSPCCONSISTE, 4, 2))-1 ' +
                 '                           END)) ' +
                 '       OR (S.PERNUMERO IS NULL)) ' ;

                 //Cássio - SOL Nº 124446 KINTANA Nº 632154- Início
                 if (trim (sIdPlanos) <> '') And (trim (sIdPlanos) <> '0') then
                   sSQL := sSQL + ' AND (S.IDPLANOPREV IN (' + trim(sIdPlanos) + ')) ';

                if (trim (sIdPatros) <> '') And (trim (sIdPatros) <> '0') then
                   sSQL := sSQL + ' AND (S.IDPATRO IN (' + trim(sIdPatros) + ')) ';
                //Cássio - SOL Nº 124446 KINTANA Nº 632154 - Fim

                sSQL := sSQL + '  AND (C.PLAGRUPO IN (''A'', ''P'',''S'')) ' + //Rafael SIG 87988
                         '  AND (S.PLANO = ' +  IntToStr( piPlanoContabil ) + ') ' +
                         '  AND (S.PLACONTA = I.PLACONTA) ' +
                         '  AND (S.PLACONTA = C.PLACONTA) ' +
                         '  AND (S.PLANO = C.PLANO) ' +
                         'GROUP BY ' +
                         '      I.DTSPCCONSISTE ' +
                         ' UNION ALL ';

        sComplementoCusto        := ' + SUM(CUSTO)';
        sComplementoOutros       := ' + SUM(OUTROS)' ;
        sComplementoPatrimonio   := ' + SUM(PATRIMONIO)'; // MARCELO CARDOSO - SIG26555

        // Paulo Nobre - WO21525 - Inicio

        If ( cCusto = 'R' ) Then sComplementoReceita := sComplementoCusto;
        If ( cCusto = 'D' ) Then sComplementoDespesa := sComplementoCusto;      // Default "Despesa"
        If ( cCusto = 'A' ) Then sComplementoAtivo   := sComplementoCusto;
        If ( cCusto = 'P' ) Then sComplementoPassivo := sComplementoCusto;

        //INICIO - MARCELO CARDOSO - SIG26555
        If ( cPatrimonio = 'R' ) Then sComplementoReceita := sComplementoReceita + ' ' + sComplementoPatrimonio;
        If ( cPatrimonio = 'D' ) Then sComplementoDespesa := sComplementoDespesa + ' ' + sComplementoPatrimonio;
        If ( cPatrimonio = 'A' ) Then sComplementoAtivo   := sComplementoAtivo   + ' ' + sComplementoPatrimonio;
        If ( cPatrimonio = 'P' ) Then sComplementoPassivo := sComplementoPassivo + ' ' + sComplementoPatrimonio;     // Default "Passivo"
        //FIM - MARCELO CARDOSO - SIG26555

        If ( cOutros = 'R' ) Then sComplementoReceita := sComplementoReceita + ' ' + sComplementoOutros;
        If ( cOutros = 'D' ) Then sComplementoDespesa := sComplementoDespesa + ' ' + sComplementoOutros;     // Default "Despesa"
        If ( cOutros = 'A' ) Then sComplementoAtivo   := sComplementoAtivo   + ' ' + sComplementoOutros;
        If ( cOutros = 'P' ) Then sComplementoPassivo := sComplementoPassivo + ' ' + sComplementoOutros;

        // Paulo Nobre - WO21525 - Inicio

        sSQL := sSQL +

                'SELECT ' +
                '   ( SUM(ATIVO)   '+ sComplementoAtivo   +' ) AS ATIVO,   '+
                '   ( SUM(DESPESA) '+ sComplementoDespesa +' ) AS DESPESA, '+
                '   ( SUM(PASSIVO) '+ sComplementoPassivo +' ) AS PASSIVO, '+
                '   ( SUM(RECEITA) '+ sComplementoReceita +' ) AS RECEITA, ';

        sSQL := sSQL +

                '   PLNDATDIA, PERNUMERO,    '+
                '      0 AS TIPO   ' +
                'FROM ' +
                '   (SELECT ' +
                '       SUM(DECODE(C.PLAGRUPO, ''C'', (DECODE(L.LACDEBCRE, ''D'', L.LACVALOR, -L.LACVALOR)), 0)) AS CUSTO,      ' +
                '       SUM(DECODE(C.PLAGRUPO, ''O'', (DECODE(L.LACDEBCRE, ''D'', L.LACVALOR, -L.LACVALOR)), 0)) AS OUTROS,     ' +
                '       SUM(DECODE(C.PLAGRUPO, ''A'', (DECODE(L.LACDEBCRE, ''D'', L.LACVALOR, -L.LACVALOR)), 0)) AS ATIVO,      ' +
                '       SUM(DECODE(C.PLAGRUPO, ''D'', (DECODE(L.LACDEBCRE, ''D'', L.LACVALOR, -L.LACVALOR)), 0)) AS DESPESA,    ' +
                '       SUM(DECODE(C.PLAGRUPO, ''P'', (DECODE(L.LACDEBCRE, ''C'', L.LACVALOR, -L.LACVALOR)), 0)) AS PASSIVO,    ' +
                '       SUM(DECODE(C.PLAGRUPO, ''R'', (DECODE(L.LACDEBCRE, ''C'', L.LACVALOR, -L.LACVALOR)), 0)) AS RECEITA,    ' +
                '       SUM(DECODE(C.PLAGRUPO, ''S'', (DECODE(L.LACDEBCRE, ''C'', L.LACVALOR, -L.LACVALOR)), 0)) AS PATRIMONIO, ' +   // Marcelo Cardoso - SIG 26555
                '       P.PLNDATDIA, '+ #13 +
                '       DECODE(P.PERNUMERO, 1,  ''Janeiro'', ' +
                                          ' 2,  ''Fevereiro'', ' +
                                          ' 3,  ''Março'', ' +
                                          ' 4,  ''Abril'', ' +
                                          ' 5,  ''Maio'', ' +
                                          ' 6,  ''Junho'', ' +
                                          ' 7,  ''Julho'', ' +
                                          ' 8,  ''Agosto'', ' +
                                          ' 9,  ''Setembro'', ' +
                                          ' 10, ''Outubro'', ' +
                                          ' 11, ''Novembro'', ' +
                                          ' 12, ''Dezembro'') AS PERNUMERO ' +
                '    FROM ' +
                 //Cássio - SOL 43993 KINTANA 523266 - Início
                  // Ricardo A. SOL: 109547 KTN: 497169
//                '       LANCAMENTO L, ' +
                  '(SELECT ' +
                           'LAN.PLACONTA, ' +
                           'LAN.PLANO, ' +
                           'LAN.PLNCODIGO, ' +
                           'LAN.IDPATRO, ' +
                           'LAN.IDPLANOPREV, ' +
                           'LAN.LACVALOR, ' +
                  //Cássio -  SOL Nº 124287 KINTANA Nº 629798 - Início
                  //Inclusão do campo TIPCODIGO
                           'LAN.LACDEBCRE,  ' +
                           'LAN.TIPCODIGO   ' +
                  '   FROM LANCAMENTO LAN, '+
                  '     ITEMSPCCONSISTE ITEM, '+
                  '     PLANILHA PLN ' +
                  '  WHERE (ITEM.IDSPCCONSISTE         = '+ IntToStr(iIdSpcConsiste)  + ')' +
                  '    AND (ITEM.PLANO                 = LAN.PLANO) ' +
                  '    AND (LAN.PLNCODIGO              = PLN.PLNCODIGO) ' +
                  '    AND (ITEM.DTSPCCONSISTE = (SELECT MAX(DTSPCCONSISTE) ' +
                  '                                 FROM ITEMSPCCONSISTE ' +
                  '                                WHERE IDSPCCONSISTE = ' + IntToStr(iIdSpcConsiste)  +
                  '                                  AND DTSPCCONSISTE <= PLN.PLNDATDIA)) ' +
                  '    AND (LAN.PLACONTA LIKE TRIM(ITEM.PLACONTA) || ''%'') ' +
                  '    AND (PLN.PEREXERCICIO = ' + IntToStr(iExercicio) + ') ';
                  if (iPerFim = iPerIni) Then
                    sSQL := sSQL +  ' AND (PLN.PERNUMERO      = ' + IntToStr(iPerIni) + '))L, '
                  else
                    sSQL := sSQL +  ' AND (PLN.PERNUMERO BETWEEN ' + IntToStr(iPerIni) + ' AND ' + IntToStr(iPerFim) + '))L, ';
                //Cássio - SOL 43993 KINTANA 523266 - Fim
                sSQL := sSQL + '       PLANILHA P, ' +
                '       PLANOCONTA C ' +
                // Ricardo A. SOL: 109547 KTN: 497169
//                '       ITEMSPCCONSISTE I ' +
                '    WHERE ' +
                '       (P.PEREXERCICIO   = ' + IntToStr(iExercicio) + ')';

                if (trim (sIdPlanos) <> '') and (trim (sIdPlanos) <> '0') then
                   sSQL := sSQL + ' AND (L.IDPLANOPREV IN (' + trim(sIdPlanos) + ')) ';

                if (trim (sIdPatros) <> '') and (trim (sIdPatros) <> '0') then
                   sSQL := sSQL + ' AND (L.IDPATRO IN (' + trim(sIdPatros) + ')) ';

                if (iPerFim = iPerIni) Then
                   sSQL := sSQL +  ' AND (P.PERNUMERO      = ' + IntToStr(iPerIni) + ') '
                else
                   sSQL := sSQL +  ' AND (P.PERNUMERO BETWEEN ' + IntToStr(iPerIni) + ' AND ' + IntToStr(iPerFim) + ') ';

                // Desconsidera as contas de resultado
                if bDesconsidera then
                   sSQL := sSQL + ' AND  ((L.TIPCODIGO IS NULL) OR (L.TIPCODIGO <> ' + QuotedStr(CdsParamContab.FieldByName('PACTIPOPERRESULT').AsString) +  ')) ';

                sSQL := sSQL +
                '    AND (P.PLNEFETIVADO   = ''S'') ' +
                // Ricardo A. SOL: 109547 KTN: 497169
//                '    AND (I.IDSPCCONSISTE  = ' + IntToStr(iIdSpcConsiste) + ')' +
                // Ricardo A. SOL: 109547 KTN: 497169
//                '    AND (L.PLACONTA    LIKE TRIM(I.PLACONTA)||''%'') ' +
                '    AND (P.PLNCODIGO      = L.PLNCODIGO)  ' +
                '    AND (L.PLACONTA       = C.PLACONTA) ' +
                '    AND (L.PLANO          = C.PLANO) ' +

                '    GROUP BY ' +
                '       P.PLNDATDIA, ' +
                '       DECODE(P.PERNUMERO, 1,  ''Janeiro'', ' +
                                          ' 2,  ''Fevereiro'', ' +
                                          ' 3,  ''Março'', ' +
                                          ' 4,  ''Abril'', ' +
                                          ' 5,  ''Maio'', ' +
                                          ' 6,  ''Junho'', ' +
                                          ' 7,  ''Julho'', ' +
                                          ' 8,  ''Agosto'', ' +
                                          ' 9,  ''Setembro'', ' +
                                          ' 10, ''Outubro'', ' +
                                          ' 11, ''Novembro'', ' +
                                          ' 12, ''Dezembro'') ' +

                '    UNION ' +

                '    SELECT ' +
                '       0 AS CUSTO, 0 AS OUTROS, ' +
                '       0 AS ATIVO, 0 AS DESPESA, 0 AS PASSIVO, 0 AS RECEITA, 0 AS PATRIMONIO, ' +  //MARCELO CARDOSO - SIG26555 - Adicionando 0  AS PATRIMONIO NA QUERY
                '       TO_DATE( ' + QuotedStr(sDataIni) + ' , ''DD/MM/YYYY'') + rownum - 1 AS PLNDATDIA, ' +
                '       DECODE( TO_CHAR ((TO_DATE( ' + QuotedStr(sDataIni) + ' , ''DD/MM/YYYY'') + rownum - 1), ''MM'' ), ' +
                '            1,  ''Janeiro'',  ' +
                '            2,  ''Fevereiro'',  ' +
                '            3,  ''Março'',  ' +
                '            4,  ''Abril'',  ' +
                '            5,  ''Maio'',  ' +
                '            6,  ''Junho'',  ' +
                '            7,  ''Julho'',  ' +
                '            8,  ''Agosto'',  ' +
                '            9,  ''Setembro'',  ' +
                '            10, ''Outubro'',  ' +
                '            11, ''Novembro'',  ' +
                '            12, ''Dezembro'') AS PERNUMERO ' +
                '    FROM ' +
                '       PESSOA ' +
                '    WHERE ' +
                '       ROWNUM <= (TO_DATE(' + QuotedStr(sDataFim) +' , ''DD/MM/YYYY'') - TO_DATE( ' + QuotedStr(sDataIni) + ', ''DD/MM/YYYY'') + 1 ) ' +
                '  ) ' +

                'GROUP BY ' +
                '   PLNDATDIA, PERNUMERO ' +
                '   ORDER BY ' +
                '   PLNDATDIA, TIPO ';

      // Mostra a barra de progresso
      DoProgresso([1,'Consultando resultados...',1,1,1]);

      CdsBusca.Data := GetDataPacket(sSQL);

      // Mostra a barra de progresso
      DoProgresso([1,'Processando...',CdsBusca.RecNo,CdsBusca.RecNo,CdsBusca.RecordCount]);
      dSomaAtivo        := 0;
      dSomaPassivo      := 0;
      dSomaReceita      := 0;
      dSomaDespesa      := 0;
      dSomaLiquido      := 0;
      dRentPer          := 1;


      sMesAtual   := Copy( FormatDateTime('DD/MM/YYYY',CdsBusca.FieldByName('PLNDATDIA').AsDateTime), 4, 2 );
      dRentMensal := 1;

      // SIG 12742 - Contabilidade - Rentabilidade contábil
      // Alterador por Arnaldo Vicente Scarin em 22/07/2024
      ValorUltimoMesDisponibilidade := 0;

      while not CdsBusca.Eof do                                                                        // pn
      begin

        if (CdsBusca.FieldByName('TIPO').asInteger = 0) or (CdsBusca.RecNo = 1)  then
        begin
          dSomaAtivo   := RoundCM( dSomaAtivo   + CdsBusca.FieldByName('ATIVO').AsFloat, 2);
          dSomaPassivo := RoundCM( dSomaPassivo + CdsBusca.FieldByName('PASSIVO').AsFloat, 2);

          dSomaReceita := RoundCM( dSomaReceita + CdsBusca.FieldByName('RECEITA').AsFloat, 2);
          dSomaDespesa := RoundCM (dSomaDespesa + CdsBusca.FieldByName('DESPESA').AsFloat, 2);

          dSomaMes     := RoundCM (dSomaReceita - dSomaDespesa, 2);
          dSomaDia     := RoundCM (CdsBusca.FieldByName('RECEITA').AsFloat - CdsBusca.FieldByName('DESPESA').AsFloat, 2);
        end
        else
        begin
          dSomaAtivo   := RoundCM( CdsBusca.FieldByName('ATIVO').AsFloat, 2);
          dSomaPassivo := RoundCM( CdsBusca.FieldByName('PASSIVO').AsFloat, 2);

          dSomaReceita := RoundCM( CdsBusca.FieldByName('RECEITA').AsFloat, 2);
          dSomaDespesa := RoundCM( CdsBusca.FieldByName('DESPESA').AsFloat, 2);

          dSomaMes     := RoundCM (dSomaReceita - dSomaDespesa, 2);
          dSomaDia     := RoundCM (CdsBusca.FieldByName('RECEITA').AsFloat - CdsBusca.FieldByName('DESPESA').AsFloat, 2);
          dSomaLiquido := RoundCM( dSomaAtivo - dSomaPassivo, 2);
        end;
        //if (dSomaLiquido > 0) then
        //  dRentDia     := (dSomaDia/dSomaLiquido) + 1
        //else
        //  dRentDia     := 1;

        if ( dSomaLiquido = 0 ) then dRentDia := 1
        else
        dRentDia := (dSomaDia/dSomaLiquido) + 1;

        dSomaLiquido := RoundCM( dSomaAtivo - dSomaPassivo, 2);

        if CdsResult.FieldByName('RENTDIA').AsFloat > 0 then
          dRentPer := dRentPer * dRentDia;

        { Inicio Augusto 30/10/2007                                                    }

        If ( sMesAtual <> Copy( FormatDateTime('DD/MM/YYYY',CdsBusca.FieldByName('PLNDATDIA').AsDateTime), 4, 2 ) ) Then Begin

          dAcumulaRentMensal := dAcumulaRentMensal + ((dRentMensal - 1) * 100);
          dRentMensal        := 1;

          sMesAtual := Copy( FormatDateTime('DD/MM/YYYY',CdsBusca.FieldByName('PLNDATDIA').AsDateTime), 4, 2 );

        end;

        dRentMensal := dRentMensal * dRentDia;

        { Fim Augusto 30/10/2007                                                       }

        dRentMensalPercent := (dRentMensal -1) * 100;

        // SIG 12742 - Contabilidade - Rentabilidade contábil
        // Alterador por Arnaldo Vicente Scarin em 22/07/2024
        iMes := StrToInt(FormatDateTime('MM',CdsBusca.FieldByName('PLNDATDIA').asDateTime));
        If iMes = iPerFim then
          ValorUltimoMesDisponibilidade := ValorUltimoMesDisponibilidade +
                                           (CdsBusca.FieldByName('RECEITA').AsFloat -
                                            CdsBusca.FieldByName('DESPESA').AsFloat);

        cdsAuxRentab.data := RetornaRentabilidade( iIdSPCConsiste );

        CdsResult.Insert;

        CdsResult.FieldByName('IDSPCCONSISTE').AsInteger := iIdSPCConsiste;
        CdsResult.FieldByName('DESCRICAO').AsString := cdsAuxRentab.fieldbyname('DESCRICAO').AsString;
        CdsResult.FieldByName('RENTPERIODO').AsFloat := dRentPer;

        CdsResult.FieldByName('DATA').AsDateTime    := CdsBusca.FieldByName('PLNDATDIA').AsDateTime;
        CdsResult.FieldByName('ATIVO').AsFloat      := dSomaAtivo;
        CdsResult.FieldByName('PASSIVO').AsFloat    := dSomaPassivo;
        CdsResult.FieldByName('LIQUIDO').AsFloat    := dSomaLiquido;

        CdsResult.FieldByName('RECEITA').AsFloat    := dSomaReceita;
        CdsResult.FieldByName('DESPESA').AsFloat    := dSomaDespesa;

        CdsResult.FieldByName('MES').AsFloat        := dSomaMes;
        CdsResult.FieldByName('DIA').AsFloat        := dSomaDia;
        CdsResult.FieldByName('RENTDIA').AsFloat    := dRentDia;
        CdsResult.FieldByName('RENTMENSAL').AsFloat := dRentMensalPercent;
        CdsResult.FieldByName('PERNUMERO').AsString := CdsBusca.FieldByName('PERNUMERO').AsString;
        cdsResult.Post;

        CdsBusca.Next;

        DoProgresso([2,'',CdsBusca.RecNo,CdsBusca.RecNo,CdsBusca.RecordCount]);
      end;
      //Aqui ele passa pra próxima conta

      Result := true;

     except
        on E:Exception do
        begin
            Result      := False;
            MessageInfo := E.Message;
        end;
     end;

   finally
      DoProgresso([3]);
      FreeAndNil(DiasUteis);
      FreeAndNil(CdsBusca);
      FreeAndNil(CdsParamContab);
      FreeAndNil(cdsAuxRentab);
   end;
end;



function TCtrlSPCConsiste.RecuperaPatro: OLEVariant;
begin
  Result := GetDataPacket( ' select p.IDPESSOA,             ' +
                           '        p.NOME                  ' +
                           ' from   PESSOA p,               ' +
                           '        PATRO  a                ' +
                           ' where  p.IDPESSOA = a.IDPESSOA ' );
end;


function TCtrlSPCConsiste.RecuperaPlano: OLEVariant;
begin
  Result := GetDataPacket( ' select p.IDPLANOPREV,                ' +
                           '        p.NOME                        ' +
                           ' from   PLANPREVCONTABIL p            ' );
end;



function TCtrlSPCConsiste.RetornaRentabilidade(iIdSPCConsiste: integer): OleVariant;
begin
  Result := GetDataPacket(' SELECT DESCRICAO FROM SPCCONSISTE ' +
                          ' WHERE IDSPCCONSISTE = ' + IntToStr( iIdSPCConsiste ) );
end;

function TCtrlSPCConsiste.RetornaVigenciaValida(sPerIni,
  sPerFim: string; iIdSpcConsiste: Integer): boolean;
var
  cdsAux : TCMClientDataSet;
begin
  Result := True;
  cdsAux := TCMClientDataSet.Create(nil);
  try
    cdsAux.Data := GetDataPacket('SELECT 1 FROM ITEMSPCCONSISTE WHERE IDSPCCONSISTE = '+ IntToStr(iIdSpcConsiste) +
                                 'AND DTSPCCONSISTE BETWEEN ' + QuotedStr(sPerIni)+ 'AND ' + QuotedStr(sPerIni));
    if not cdsAux.IsEmpty then
      Result := False;
  finally
    FreeAndNil(cdsAux);
  end;
end;

function TCtrlSPCConsiste.SelecionaItemSPCConsiste(iIdSPCConsiste: integer; dDtSpcConsiste: TDateTime): OLEVariant;
begin
  //Cássio - SOL Nº43993 KINTANA Nº523266 - Início
  //Retirada do '*' do comando SELECT
  Result := GetDataPacket( ' SELECT IDITEMSPCCONSISTE, PLANO, PLACONTA, ' +
                           '        IDSPCCONSISTE, TRGDTINCLUSAO, TRGUSERINCLUSAO, ' +
                           '        FLGSALDOOUMOVIM, DTSPCCONSISTE ' +
                           '   FROM ITEMSPCCONSISTE ' +
                           '  WHERE IDSPCCONSISTE = ' + IntToStr( iIdSPCConsiste ) +
                           '    AND DTSPCCONSISTE = ' + QuotedStr(DateToStr( dDtSpcConsiste )));
  //Cássio - SOL Nº43993 KINTANA Nº523266 - Início
end;




function TCtrlSPCConsiste.SelecionaItemSpcConsisteRegra(
  dtSpcConsiste: TDateTime): OleVariant;
begin
  // Arnaldo V. Scarin - SOL: 135224
  // Ricardo A. SOL 131939 KTN 755306
  Result := GetDataPacket( ' SELECT I.IDITEMSPCCONSISTE, I.PLANO, I.PLACONTA,' +#13+
                           '        I.IDSPCCONSISTE, I.TRGDTINCLUSAO, I.TRGUSERINCLUSAO,'+#13+
                           '        I.FLGSALDOOUMOVIM, I.DTSPCCONSISTE, S.DESCRICAO'+#13+
                           ' FROM  ITEMSPCCONSISTE I, SPCCONSISTE S'+#13+
                           ' WHERE I.IDSPCCONSISTE = S.IDSPCCONSISTE'+#13+
                           '   AND I.DTSPCCONSISTE = (SELECT MAX(DTSPCCONSISTE)'+#13+
                           '                          FROM ITEMSPCCONSISTE I '+#13+
                           '                          JOIN SPCCONSISTE S '+#13+  // Sol 183592 Kintana 1715812 // Sol 1721982 Kintana 184376
                           '                          ON S.IDSPCCONSISTE = I.IDSPCCONSISTE '+#13+ // Sol 183592 Kintana 1715812 // Sol 1721982 Kintana 184376
                           '                          AND S.TIPOCONSISTE = ''RC'' '+#13+  // Sol 183592 Kintana 1715812  // Sol 1721982 Kintana 184376
                           '                          WHERE I.DTSPCCONSISTE <= To_date(' + QuotedStr(DateToStr( dtSpcConsiste ))+',''DD/MM/YYYY''))'+
                           '   AND S.TIPOCONSISTE = ''RC'''+#13+
                           ' ORDER BY S.DESCRICAO, I.PLACONTA');
  // FIM Ricardo A. SOL 131939 KTN 755306


end;

function TCtrlSPCConsiste.SelecionaSPCConsiste( iIdSPCConsiste: integer; sTipoConsiste : String ): OLEVariant;
begin

  FDbSPCConsiste.Idspcconsiste.AsFloat := iIdSPCConsiste;
  FDbSPCConsiste.TipoConsiste.AsString := sTipoConsiste;

  Result := GetDataPacket( FDbSPCConsiste.SSqlSelect );

end;




function TCtrlSPCConsiste.SelecionaTipoRentConabil( iPlano: Integer): OLEVariant;
Var
 sSQL : String;
begin

  sSQL := 'SELECT DISTINCT  '+
          '  (''N'') AS MARCA, SPC.IDSPCCONSISTE, SPC.DESCRICAO, ISPC.PLANO '+
          'FROM         '+
          '  SPCCONSISTE SPC, ITEMSPCCONSISTE ISPC '+
          'WHERE        '+
          '      SPC.TIPOCONSISTE = ''TR'' '+
          '  AND SPC.IDSPCCONSISTE = ISPC.IDSPCCONSISTE '+
          '  AND ISPC.PLANO = '+ IntToStr( iPlano )      +
          'ORDER BY '+
          '  SPC.DESCRICAO ';

  Result := GetDataPacket( sSQL );

end;




function TCtrlSPCConsiste.SelecionaTodos( iPlano : integer ) : OLEVariant;
begin
  Result := GetDataPacket(
   ' SELECT   S.IDSPCCONSISTE,                  ' +
   '          S.DESCRICAO,                      ' +
   '          I.PLACONTA,                       ' +
   '          I.FLGSALDOOUMOVIM                 ' +
   ' FROM     SPCCONSISTE S,                    ' +
   '          ITEMSPCCONSISTE I                 ' +
   ' WHERE    S.IDSPCCONSISTE = I.IDSPCCONSISTE ' +
   '   AND    I.PLANO = ' + IntToStr( iPlano )    +

   '   AND    S.TIPOCONSISTE = ''RC''           ' +
   ' ORDER BY S.DESCRICAO,                      ' +
   '          I.PLACONTA                        ' );
end;




procedure TCtrlSPCConsiste.SetcdsItemSPCConsiste(
  const Value: TCMClientDataSet);
begin
  FcdsItemSPCConsiste := Value;
end;




procedure TCtrlSPCConsiste.SetcdsSPCConsiste(const Value: TCMClientDataSet);
begin
  FcdsSPCConsiste := Value;
end;




procedure TCtrlSPCConsiste.SetDbItemSPCConsiste(
  const Value: TDbItemSPCConsiste);
begin
  FDbItemSPCConsiste := Value;
end;




procedure TCtrlSPCConsiste.SetDbSPCConsiste(const Value: TDbSPCConsiste);
begin
  FDbSPCConsiste := Value;
end;

function TCtrlSPCConsiste.VerificaVigenciaInicioPeriodo(sPerIni: string;
  iIdSpcConsiste: Integer): boolean;
var
  cdsAux: TCmClientDataSet;
begin
  Result := True;
  cdsAux := TCMClientDataSet.Create(nil);
  try
    cdsAux.Data := GetDataPacket('SELECT 1 FROM ITEMSPCCONSISTE WHERE IDSPCCONSISTE = '+ IntToStr(iIdSpcConsiste) +
                                 'AND DTSPCCONSISTE = ' + QuotedStr(sPerIni));
    if not cdsAux.IsEmpty then
      Result := False;
  finally
    FreeAndNil(cdsAux);
  end
end;

end.
