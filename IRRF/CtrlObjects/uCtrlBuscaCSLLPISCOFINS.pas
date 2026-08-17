// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Bruno Bastos
// Data        : 13/09/2006
// Rotina      : BuscaCSLLPISCOFINS
// Pendência   : 21529
// Descricao   : Buscar e gravar o valor total do rateio.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 26/05/2006
// Rotina      : BuscaCSLLPISCOFINS
// Pendência   : 22342
// Descricao   : Desfazer o que foi realizado na pendência 21933.
//               A implementação 15761 também foi feita incorretamente visto
//               que não é necessário se criar um novo campo PLACONTARECDES
//               para tratar múltiplas contas de baixa. Bastava controlar a
//               existência das várias contas no próprio campo PLACONTA.
//               Esta modificação não foi radical. Abri a pendência 22465 para
//               excluir o campo PLACONTARECDES do módulo todo.
//------------------------------------------------------------------------------
{
 Bruno Bastos - Pendencia 21933 - 31/03/2006
 Inverter os valores recebidos pelas variáveis sContaContabil e sPlaContaC. 
}
{
 Bruno Bastos - Pendencia 19174 - 03/05/2005
 Passamos a usar nesta unit a rotina RoundCM da uCMMath, no lugar da Trunca
}
{
 Marchetti - Pendencia 17636 - 09/09/2004
 Acerto na rotina de calculo de rateio de percentual.
 Quando o valor calculado for inferior ao valor do Imposto,
 calcula a diferenca e soma ao valor do ultimo rateio calculado
}

unit uCtrlBuscaCSLLPISCOFINS;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, uCtrLancIRRF,
     DB, uDataBase, DbClient, uSistema, uCmTypes, uCMMath;

Type
  TCtrlBuscaCSLLPISCOFINS = class(TCmControlObject)
  private
    LancIRRF            : TCtrLancIRRF;
    cdsParamIRRF        : TclientDataSet;
    cdsDocumento        : TclientDataSet;
    cdsAux              : TclientDataset;
    cdsRateioPlanoPatro : TclientDataset;
    cdsVazio            : TclientDataset;
  protected
      procedure DoChangeDataBase; Override;
      procedure AfterInitialize;override;

  public

    constructor Create; override;
    destructor Destroy; override;
    function BuscaCSLLPISCOFINS(IdEmpresa : LongInt; DataIni, dataFim: string; UsaPlanoPatro, bPrimVez : Boolean) : Boolean;
    function Arredonda(rValor:Real;iNumDecimais: Integer):Real;
    function  Trunca(pNumero : double; pCasas : byte) : double; 
    procedure Atualizaposicao (cTexto : String);
    procedure Linha;
  published

end;

implementation
Uses
    FBuscaCSLLPISCOFINS, math ;  
{ TCtrlBuscaCSLLPISCOFINS }


procedure TCtrlBuscaCSLLPISCOFINS.AfterInitialize;
begin
  inherited;
  LancIRRF.InitializeAs(self);
  LancIRRF.OpenTransaction := False;
end;

constructor TCtrlBuscaCSLLPISCOFINS.Create;
begin
  inherited;
  LancIRRF            := TCtrLancIRRF.create;
  cdsDocumento        := TclientDataSet.create(nil);
  cdsParamIrrf        := TclientDataSet.create(nil);
  cdsAux              := TclientDataSet.create(nil);
  cdsRateioPlanoPatro := TclientDataSet.create(nil);
  cdsVazio            := TclientDataSet.create(nil);
end;

destructor TCtrlBuscaCSLLPISCOFINS.Destroy;
begin
  inherited;
  LancIRRF.free;
  cdsDocumento.free;
  cdsParamIRRF.free;
  cdsAux.free;
  cdsRateioPlanoPatro.free;
  cdsVazio.free;
end;

function TCtrlBuscaCSLLPISCOFINS.BuscaCSLLPISCOFINS(IdEmpresa : Integer; DataIni, dataFim : string; UsaPlanoPatro, bPrimVez : Boolean) : Boolean;
Var
 Ssql, SsqlParm        : string;
 iCodDocumento, iBenef : Integer;
 sCodNatureza          : string;
 sDataLanc             : string;
 rValCSLLPISCOFINS     : Double;
 rValCSLL              : Double;
 rValPIS               : Double;
 rValCOFINS            : Double;
 sContaContabil        : String;
 iPlano                : Integer;
 iCodLanc              : Double;
 rValRatCSLLPISCOFINS  : Double;
 rValRatCSLL           : Double;
 rValRatPIS            : Double;
 rValRatCOFINS         : Double;
 rTotCSLLPISCOFINS     : Double;
 rTotCSLL              : Double;
 rTotPIS               : Double;
 rTotCOFINS            : Double;
 rValorImposto         : Double;
 bPrim                 : Boolean;
 sCodtiprecdes         : String;
 sPlacontac            : String;
 bprocessa             : boolean;
 iProcessado           : Integer;
 iTotRecRateio         : Integer;
 sCodCentroRespon      : String;
begin;
      If ConnectionSide = cnsClient Then
      Begin
           Result := Connection.AppServer.BuscaCSLLPISCOFINS(IdEmpresa, DataIni, DataFim, UsaPlanoPatro, bPrimVez);
           If Not Result Then
              MessageInfo := Connection.AppServer.MessageInfo;
      End else
      Begin
           Result := true;
           SSql              := 'SELECT * FROM DUAL WHERE (1 = 2)';
           cdsVazio.data := GetDataPacket(Ssql);
           Linha;
           frmBuscaCSLLPISCOFINS.memResult.Lines.Add('BUSCA CSLL/PIS/COFINS NO CONTAS A PAGAR');
           Linha;
           frmBuscaCSLLPISCOFINS.memResult.Lines.Add('Início do Processamento: '+formatdatetime('dd/mm/yyyy hh:nn:ss', now));
           Linha;
          // SELECT PRINCIPAL - INICIO
           with cdsDocumento do
           Begin
                 Ssql := ' SELECT '                                                     + #13 +
                         '     H.DATALANCTO , '                                         + #13 +
                         '     D.IDFORCLI AS IDFORCLI, '                                + #13 +
                         '     T.CODALTERADOR,'                                         + #13 +
                         '     P.RAZAOSOCIAL AS RAZAOSOCIAL, '                          + #13 +
                         '     D.CODDOCUMENTO, L.NUMLANCTO, '                           + #13 +
                         '     DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1) AS VALOR, '    + #13 +
                         '     A.CODIMPOSTO, '                                          + #13 +
                         '     D.OPERACAO, '                                            + #13 +
                         '     D.NUMFATURA, '                                           + #13 +
                         '     T.PLACONTA, '                                            + #13 +
                         '     T.DESCRICAO, '                                           + #13 +
                         '     D.NODOCUMENTO '                                          + #13 +
                         ' FROM '                                                       + #13 +
                         '     PESSOA P, '                                              + #13 +
                         '     DOCUMENTO D, '                                           + #13 +
                         '     LANCTODOCUM L, '                                         + #13 +
                         '     TIPOALTERADOR T , '                                      + #13 +
                         '     ALTXIMPOSTO A, '                                         + #13 +


                         '     ( '+
                         '      SELECT DATALANCTO,CODDOCUMENTO FROM LANCTODOCUM WHERE '+
                         '      OPERACAO = ''5'' AND '+
                         '      DATALANCTO BETWEEN TO_DATE('''+DataIni+''',''DD/MM/YYYY'') AND '+
                         '      TO_DATE('''+DataFim+''',''DD/MM/YYYY'') ' +

                         '      UNION '+
                         '      SELECT ' +
                         '          LE.DATALANCTO, L.CODDOCUMENTO ' +
                         '      FROM ' +
                         '          LANCTODOCUM L, DOCUMENTO D, DOCUMENTO E, LANCTODOCUM LE ' +
                         '      WHERE ' +
                         '          D.STATUS = ''2'' ' +
                         '      AND L.OPERACAO = ''1'' ' +
                         '      AND L.CODDOCUMENTO = D.CODDOCUMENTO ' +
                         '      AND D.NUMFATURA = E.NUMFATURA ' +
                         '      AND E.OPERACAO = ''3'' ' +
                         '      AND LE.CODDOCUMENTO = E.CODDOCUMENTO ' +
                         '      AND LE.DATALANCTO BETWEEN TO_DATE('''+DataIni+''',''DD/MM/YYYY'') AND  TO_DATE('''+DataFim+''',''DD/MM/YYYY'') ' +
                         '      AND LE.OPERACAO = ''5'' ' +
                         '      AND D.RECPAG = ''P'' ' +

                         '     ) H ' +




                         ' WHERE '                                                      + #13 +
                         '     (D.CODDOCUMENTO = L.CODDOCUMENTO) '                      + #13 +
                         ' AND (P.IDPESSOA = D.IDFORCLI) '                              + #13 +
                         ' AND (L.CODDOCUMENTO = H.CODDOCUMENTO) '                      + #13 +
                         ' AND (T.CODALTERADOR = A.CODALTERADOR) '                      + #13 +

                         // CODIMPOSTO = 16 => PIS
                         //            = 17 => COFINS
                         //            = 18 => CSLL
                         //            = 19 => PIS/COFINS/CSLL
                         ' AND (A.CODIMPOSTO IN (16,17,18,19)) '                        + #13 +

                         ' AND (L.CODALTERADOR = T.CODALTERADOR) '                      + #13 +
                         ' AND (L.OPERACAO = ''4 '') '                                  + #13 +
                         ' AND (D.IDPESSOA = '+intTostr(IdEmpresa)+') '                 + #13 +
                         ' AND (D.RECPAG = ''P'') '                                     + #13 +
                         ' AND (D.STATUS = ''2'') '                                     + #13 +
                         ' AND (L.CODDOCINSS IS NULL) '                                 + #13 +
                         ' AND (L.ESTORNO IS NULL) '                                    + #13 +
                         ' AND NOT EXISTS (SELECT 1 FROM LANCIRRF I WHERE I.CODDOCUMENTO = D.CODDOCUMENTO AND T.CODNATUREZA = I.CODNATUREZA)';

                 AtualizaPosicao ('SELECIONANDO DADOS. AGUARDE.');

                 Data := GetDataPacket(Ssql);
                 If cdsDocumento.Recordcount > 0 then
                 begin
                     // VERIFICANDO SE AS CONDICOES DE PROCESSAMENTO ESTÃO SATISFEITAS - INICIO
                     AtualizaPosicao ('VERIFICANDO A CONSISTENCIA DOS DADOS. AGUARDE');
                     bProcessa := true;
                     cdsDocumento.First;
                     While not cdsDocumento.EOF do
                     begin
                        ssql := 'SELECT '+
                                '     T.CODNATUREZA, '                                        + #13 +
                                '     T.PLACONTA, '                                           + #13 +
                                '     T.PLANO, '                                              + #13 +
                                '     N.CODTIPRECDES, '                                       + #13 +
                                '     R.PLACONTA AS PLACONTARECDES '                          + #13 +
                                ' FROM '                                                      + #13 +
                                '     TIPOALTERADOR T,  '                                     + #13 +
                                '     NATURENDIMENTO N, '                                     + #13 +
                                '     TIPORECEBDESEMB R '                                     + #13 +
                                ' WHERE '                                                     + #13 +
                                '     T.CODALTERADOR = '+Inttostr(cdsDocumento.FieldByName('CODALTERADOR').AsInteger) + #13 +
                                ' AND T.CODNATUREZA(+) = N.CODNATUREZA '                      + #13 +
                                ' AND R.CODTIPRECDES(+) = N.CODTIPRECDES '                    + #13;

                        cdsAux.data  := GetDataPacket(SSql);
                        If trim(cdsAux.fieldbyname('CODNATUREZA').asstring) = '' then
                        begin
                             frmBuscaCSLLPISCOFINS.memResult.Lines.Add('O alterador '+cdsdocumento.fieldbyname('DESCRICAO').asstring+
                                 ' está sem a informação de Natureza de Rendimentos Preenchida.');
                             bProcessa := false;
                        end;

                        If trim(cdsAux.fieldbyname('CODTIPRECDES').asstring) = '' then
                        begin
                             frmBuscaCSLLPISCOFINS.memResult.Lines.Add('A Natureza de Rendimento '+cdsAux.fieldbyname('CODNATUREZA').asstring+
                                 ' está sem a informação de Código de Tipo de Recebimento/Desembolso Preenchida.');
                             bProcessa := false;
                        end;

                        If trim(cdsAux.fieldbyname('PLACONTARECDES').asstring) = '' then
                        begin
                             frmBuscaCSLLPISCOFINS.memResult.Lines.Add('A Natureza de Rendimento '+cdsAux.fieldbyname('CODNATUREZA').asstring+
                                 ' está sem a Conta Contábil Associada Preenchida.');
                             bProcessa := false;
                        end;

                        cdsdocumento.next;
                     end;
                     // VERIFICANDO SE AS CONDICOES DE PROCESSAMENTO ESTÃO SATISFEITAS - FIM
                     If bProcessa then
                     begin
                         Try
                            StartTransaction;
                            AtualizaPosicao ('PROCESSANDO. AGUARDE');
                            rValCSLLPISCOFINS := 0;
                            rValCSLL          := 0;
                            rValPIS           := 0;
                            rValCOFINS        := 0;
                            rValorImposto     := 0;
                            frmBuscaCSLLPISCOFINS.ProgressBar1.Position:=0;
                            frmBuscaCSLLPISCOFINS.ProgressBar1.Max:=cdsDocumento.RecordCount;
                            frmBuscaCSLLPISCOFINS.Repaint;
                            iProcessado := 0;
                            cdsDocumento.First;
                            While not cdsdocumento.eof do // cdsdocumento
                            begin
                               ssql := 'SELECT '                                        + #13 +
                                       '    T.CODNATUREZA, '                            + #13 +
                                       '    T.PLACONTA, '                               + #13 +
                                       '    T.PLANO, '                                  + #13 +
                                       '    N.CODTIPRECDES, '                           + #13 +
                                       '    R.PLACONTA AS PLACONTARECDES '              + #13 +
                                       'FROM '                                          + #13 +
                                       '    TIPOALTERADOR T,  '                         + #13 +
                                       '    NATURENDIMENTO N, '                         + #13 +
                                       '    TIPORECEBDESEMB R '                         + #13 +
                                       'WHERE '                                         + #13 +
                                       '    T.CODALTERADOR = '+Inttostr(cdsDocumento.FieldByName('CODALTERADOR').AsInteger) + #13 +
                                       'AND T.CODNATUREZA = N.CODNATUREZA '             + #13 +
                                       'AND N.CODTIPRECDES = R.CODTIPRECDES '           + #13;

                               cdsAux.data  := GetDataPacket(SSql);

                               sCodNatureza      := trim(cdsAux.FieldByName('CODNATUREZA').AsString);
                               //GRAVAR AS 2 CONTAS IGUAIS A CONTA DO ALTERADOR
                               //OBS.: NA GERAÇÃO DO DARF FOI IMPLEMENTADO NO MESMO MOMENTO UMA IDENTIFICAÇÃO
                               // SE TEM MAIS DE UMA CONTA PARA BAIXA
                               sContaContabil    := cdsAux.fieldByname('PLACONTA').AsString;
                               iPlano            := cdsAux.fieldByname('PLANO').AsInteger;
                               sCodtiprecdes     := cdsAux.fieldByname('CODTIPRECDES').AsString;
                               sPlacontac        := cdsAux.fieldByname('PLACONTA').AsString; 
                               iCodDocumento     := cdsDocumento.FieldByName('CODDOCUMENTO').AsInteger;
                               iBenef            := cdsDocumento.FieldByName('IDFORCLI').AsInteger;
                               sDataLanc         := cdsDocumento.FieldByName('DATALANCTO').AsString;
                               Case cdsDocumento.FieldByName('CODIMPOSTO').AsInteger of
                                    19 : begin
                                            rValCSLLPISCOFINS := cdsDocumento.FieldByName('VALOR').AsFloat;
                                            rValorImposto     :=  rValCSLLPISCOFINS;
                                         end;
                                    18 : begin
                                            rValCSLL      := cdsDocumento.FieldByName('VALOR').AsFloat;
                                            rValorImposto :=  rValCSLL;
                                         end;
                                    17 : begin
                                            rValPIS       := cdsDocumento.FieldByName('VALOR').AsFloat;
                                            rValorImposto := rValPIS;
                                         end;
                                    16 : begin
                                            rValCOFINS    := cdsDocumento.FieldByName('VALOR').AsFloat;
                                            rValorImposto :=  rValCOFINS;
                                         end;
                               end;
                               if (rValorImposto <> 0)  then
                               begin
                                  Ssql := 'SELECT '                                     + #13 +
                                          '    R.IDPATRO,'                              + #13 +
                                          '    R.IDPLANOPREV, '                         + #13 +
                                          '    R.IDPROGRAMA,'                           + #13 +
                                          '    R.CODCENTROCUSTO,'                       + #13 +
                                          '    R.CODCENTRORESPON,'                      + #13 +
                                          '    R.VALOR , '                              + #13 +
                                          '    DECODE(T.TOTAL,0,0,(SUM(R.VALOR)/T.TOTAL)) AS PERC, '+ #13 +
                                          '    T.TOTAL '+#13+ 
                                          'FROM'                                        + #13 +
                                          '    RATEIODOCUM R,'                          + #13 +
                                          '    (SELECT SUM(VALOR) AS TOTAL '            + #13 +
                                          '     FROM RATEIODOCUM '                      + #13 +
                                          '     WHERE CODDOCUMENTO = '+FloatToStr(cdsDocumento.FieldByname('CODDOCUMENTO').AsFloat)+') T '+ #13 +
                                          'WHERE'                                       + #13 +
                                          '    (R.CODDOCUMENTO = '+FloatToStr(cdsDocumento.FieldByname('CODDOCUMENTO').AsFloat)+') '+ #13 +
                                          'GROUP BY'                                    + #13 +
                                          '    R.IDPATRO,'                              + #13 +
                                          '    R.IDPLANOPREV,'                          + #13 +
                                          '    R.IDPROGRAMA,'                           + #13 +
                                          '    R.CODCENTROCUSTO,'                       + #13 +
                                          '    R.CODCENTRORESPON,'                      + #13 +
                                          '    T.TOTAL,'                                + #13 +
                                          '    R.VALOR'                                 + #13;
                                  cdsRateioPlanoPatro.data := GetDataPacket(Ssql);

                                  cdsRateioPlanoPatro.First;
                                  rTotCSLLPISCOFINS := 0;
                                  rTotCSLL          := 0;
                                  rTotPIS           := 0;
                                  rTotCOFINS        := 0;
                                  iTotRecRateio     := 1;

                                  While not cdsRateioPlanoPatro.EOF do
                                  begin
                                     iCodLanc             := 0;
                                     sCodCentroRespon     := cdsRateioPlanoPatro.fieldByname('CODCENTRORESPON').AsString;
                                     rValRatCSLLPISCOFINS := RoundCM(rValCSLLPISCOFINS * cdsRateioPlanoPatro.fieldByname('PERC').AsFloat,2);
                                     rValRatCSLL          := RoundCM(rValCSLL          * cdsRateioPlanoPatro.fieldByname('PERC').AsFloat,2);
                                     rValRatPIS           := RoundCM(rValPIS           * cdsRateioPlanoPatro.fieldByname('PERC').AsFloat,2);
                                     rValRatCOFINS        := RoundCM(rValCOFINS        * cdsRateioPlanoPatro.fieldByname('PERC').AsFloat,2);
                                     rTotCSLLPISCOFINS    := rTotCSLLPISCOFINS + rValRatCSLLPISCOFINS;
                                     rTotCSLL             := rTotCSLL          + rValRatCSLL;
                                     rTotPIS              := rTotPIS           + rValRatPIS;
                                     rTotCOFINS           := rTotCOFINS        + rValRatCOFINS;
                                     rTotCSLLPISCOFINS := RoundCM(rTotCSLLPISCOFINS,2);
                                     rTotCSLL          := RoundCM(rTotCSLL,2);
                                     rTotPIS           := RoundCM(rTotPIS,2);
                                     rTotCOFINS        := RoundCM(rTotCOFINS,2);
                                     if iTotRecRateio = cdsRateioPlanoPatro.RecordCount then
                                     begin
                                        if (Format('%17.2f',[rTotCSLL]) <> Format('%17.2f',[rValCSLL])) then
                                        begin
                                           rValratCSLL := rValRatCSLL + (rValCSLL - rTotCSLL);
                                        end;

                                        if (Format('%17.2f',[rTotPIS]) <> Format('%17.2f',[rValPIS])) then
                                        begin
                                           rValratPIS := rValRatPIS + (rValPIS - rTotPIS);
                                        end;

                                        if (Format('%17.2f',[rTotCOFINS]) <> Format('%17.2f',[rValCOFINS])) then
                                        begin
                                           rValratCOFINS := rValRatCOFINS + (rValCOFINS - rTotCOFINS);
                                        end;

                                        if (Format('%17.2f',[rTotCSLLPISCOFINS]) <> Format('%17.2f',[rValCSLLPISCOFINS])) then
                                        begin
                                           rValratCSLLPISCOFINS := rValratCSLLPISCOFINS + (rValCSLLPISCOFINS - rTotCSLLPISCOFINS);
                                        end;

                                     end;

                                     LancIRRF.GravaIRRF(idEmpresa,
                                                        UsaPlanoPatro,
                                                        icoddocumento,
                                                        IdEmpresa,
                                                        iBenef,
                                                        sCodNatureza,
                                                        sDataLanc,
                                                        cdsRateioPlanoPatro.fieldByname('total').AsFloat, 
                                                        0,
                                                        0,
                                                        rValratPIS,
                                                        0,
                                                        0,
                                                        rValratCOFINS,
                                                        rValratCSLL,
                                                        rValratCSLLPISCOFINS,
                                                        cdsVazio.data,
                                                        iCodLanc,
                                                        sContaContabil,
                                                        iPlano,
                                                        'N',
                                                        cdsRateioPlanoPatro.fieldByname('IDPLANOPREV').AsInteger,
                                                        cdsRateioPlanoPatro.fieldByname('IDPATRO').AsInteger,
                                                        cdsRateioPlanoPatro.fieldByname('IDPROGRAMA').AsInteger,
                                                        bPrim,
                                                        3,
                                                        3,
                                                        -1,
                                                        cdsRateioPlanoPatro.fieldByname('CODCENTROCUSTO').AsString,
                                                        -1,
                                                        sCodtiprecdes,
                                                        sPlacontac ,
                                                        sCodCentroRespon,
                                                        0);
                                     bPrim := False;
                                     cdsRateioPlanoPatro.Next;
                                     inc(iTotRecRateio);
                                  end;
                                  cdsRateioPlanoPatro.First;
                                  cdsRateioPlanoPatro.Last;

                               end;
                               rValCSLLPISCOFINS := 0;
                               rValCSLL          := 0;
                               rValPIS           := 0;
                               rValCOFINS        := 0;
                               rValorImposto     := 0;
                               cdsdocumento.next; // cdsdocumento
                               frmBuscaCSLLPISCOFINS.ProgressBar1.Position:=frmBuscaCSLLPISCOFINS.ProgressBar1.Position + frmBuscaCSLLPISCOFINS.ProgressBar1.Step;
                               iProcessado:=frmBuscaCSLLPISCOFINS.ProgressBar1.Position;
                               frmBuscaCSLLPISCOFINS.lblcontagem.caption:='Processando '+inttostr(iProcessado)+
                                                   ' de '+inttostr(frmBuscaCSLLPISCOFINS.ProgressBar1.Max);
                               frmBuscaCSLLPISCOFINS.repaint;
                            end;
                            Commit;
                            AtualizaPosicao ('Fim do Processo .');
                            Linha;
                            frmBuscaCSLLPISCOFINS.memResult.Lines.Add('Fim do Processamento: '+formatdatetime('dd/mm/yyyy hh:nn:ss', now));
                            Linha;
                         Except
                            On E:Exception Do
                            Begin
                               Rollback;
                               Result := False;
                               MessageInfo := E.Message;
                            End;
                         end;
                     end
                     else
                     begin
                        Linha;
                        frmBuscaCSLLPISCOFINS.memResult.Lines.Add('Estes erros precisam ser resolvidos para que o processamento possa ser efetuado ');
                        AtualizaPosicao ('> PROC. CANCELADO DEVIDO A AUSENCIA DE PARAMETRIZAÇÃO');
                        Linha;
                        frmBuscaCSLLPISCOFINS.memResult.Lines.Add('Fim do Processamento: '+formatdatetime('dd/mm/yyyy hh:nn:ss', now));
                        Linha;
                     end;
                 end
                 else
                 begin
                    Linha;
                    AtualizaPosicao ('> NÃO HÁ NADA A PROCESSAR.');
                    Linha;
                    frmBuscaCSLLPISCOFINS.memResult.Lines.Add('Fim do Processamento: '+formatdatetime('dd/mm/yyyy hh:nn:ss', now));
                    Linha;
                 end;
           end;
      end;
end;


procedure TCtrlBuscaCSLLPISCOFINS.DoChangeDataBase;
begin
  inherited;

end;


function TCtrlBuscaCSLLPISCOFINS.Arredonda(rValor: Real;
                                      iNumDecimais: Integer): Real;
Var
  sMascara, sAuxValor:String;
Begin
   If iNumDecimais < 0 then
      sMascara := '%17.0f'
   Else
      sMascara := '%17.' + IntToStr(iNumDecimais) + 'f';

   sAuxValor := trim(Format(sMascara,[rValor]));

   While Pos('.',sAuxValor) <> 0 Do
      Delete(sAuxValor,Pos('.',sAuxValor),1);

   Result := StrToFloat(sAuxValor)
end;


function  TCtrlBuscaCSLLPISCOFINS.Trunca(pNumero : double; pCasas : byte) : double;
 var p: double;
     s: string;
begin
  p := pNumero * Power( 10, pCasas);
  s := floattostr(p);
  if pos(DecimalSeparator, s) <> 0 then
    p := trunc( p );
  p := p / Power( 10, pCasas );
  result:=p;
end;


procedure TCtrlBuscaCSLLPISCOFINS.Atualizaposicao (cTexto : String);
begin
    frmBuscaCSLLPISCOFINS.pnlPosicao.caption := cTexto;
    frmBuscaCSLLPISCOFINS.Repaint;
end;

procedure TCtrlBuscaCSLLPISCOFINS.Linha;
begin
  frmBuscaCSLLPISCOFINS.memResult.Lines.Add('-------------------------------------------------------'+
                                         '-------------------------');
  frmBuscaCSLLPISCOFINS.Repaint;
end;


end.



