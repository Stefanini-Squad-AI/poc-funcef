// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina......: VerificaSaldoProcesso
Nº SOL......: 151865
Nº KINTANA..: 1121572
Data........: 01/02/2011
Responsável.: Brunno Mattos
Descrição...: Incremento das querys para contemplar o período ANUAL.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CriaCompromisso
Data      : 16/09/2004
Autor     : André Tavares
Pendencia : 16738
Descrição : Criado um semáforo para que usuários concorrentes não gerem o mesmo número de compromisso.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : BuscaContaOrcamen
Data      : 09/10/2003
Autor     : André Pontes
Pendencia : 14005
Descrição : Retirada a obrigatoriedade da forma de cálculo do Orçado ser Fluxo de Caixa ('X') para
            registro de reservas e compromissos
---------------------------------------------------------------------------------------------------}

// Marchetti - Pendencia 15659
// Várias rotinas implementadas para solução da pendência
// FMTSoliCompra, UCtrlOrcamento, uCtrlCotacao


unit UCtrlOrcamento;

{------------------------------------------------------------------------------}
{                                                                              }
{ Funções de Integração do Orçamento com outros Sistemas                       }
{                                                                              }
{------------------------------------------------------------------------------}

interface

uses
  Windows, SysUtils, Forms, wwQuery, uMensErro, Dialogs, uMidasUtil, uDatabase,
  uAutorizacao, dbclient, uFuncoesOrcamento, uCmControlObject, uCtrlReservaorcamen,
  uCtrlSaldoorcado, uCtrlResxcomp, dBaseDados, uCMTypes, uSistema, uCMMath;


Type TOrcamentoBackMT = Class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; override;
    procedure AfterInitialize; override;
    procedure OnCreateAppServer;override;
  Private

    FIdEmpresa,
    FIdUsuario,
    FNumReserva,
    FIdReserva        : Integer;
    FValorReserva     : Real;
    FCdsPeriodo       : TClientDataSet;
    FCdsUsuXCentCusto : TClientDataSet;
    FCdsCompromissos  : TClientDataSet;
    FCdsSaldos        : TClientDataSet;
    FCdsAux           : TClientDataSet;
    FCdsResComp       : TClientDataSet;
    FCdsReservas      : TClientDataSet;
    FCdsSaldoProcesso : TClientDataSet;
    FCdsBuscaConta    : TClientDataSet;
    CReservaOrcamen   : TCtrlReservaorcamen;
    CSaldoOrcado      : TCtrlSaldoorcado;
    CResxComp         : TCtrlResxcomp;

    procedure SetCdsPeriodo(const Value: TClientDataSet);
    procedure SetCdsUsuXCentCusto(const Value: TClientDataSet);
    procedure SetCdsCompromissos(const Value: TClientDataSet);
    procedure SetCdsSaldos(const Value: TClientDataSet);
    procedure SetCdsAux(const Value: TClientDataSet);
    procedure SetCdsResComp(const Value: TClientDataSet);
    procedure SetCdsReservas(const Value: TClientDataSet);
    procedure SetCdsSaldoProcesso(const Value: TClientDataSet);
    procedure SetCdsBuscaConta(const Value: TClientDataSet);
  Public
    Constructor Create; override;
    Destructor Destroy; override;
    function MarcaReserva(iNumReserva:longint; bExibeMsg: boolean):Integer;
    function EstornaReserva(iNumReserva:longint; bExibeMsg: boolean):Integer;
    function CancelaReserva(iNumReserva:longint; bExibeMsg: boolean):Integer;
    function CriaCompromisso(sData:String; rValor:extended; sObs:String;
      iModulo:Integer; iConjuntoReservas:array of Integer; bExibeMsg,
      bVeioCompra : boolean):Integer;
    function EfetivaCompromisso(iNumReserva:longint; rValor:extended;
      bExibeMsg: boolean):Integer;
    function VerificaCompromisso(iNumReserva:longint; rValor: extended;
      bExibeMsg: boolean):Integer;
    function EstornaCompromisso(iNumReserva:longint; rValor:extended;
      bExibeMsg: boolean):Integer;
    function CancelaCompromisso(iNumReserva:longint;
      bExibeMsg: boolean):Integer;
    function EncontraPeriodo( sData : String ) : Integer;
    function DiasNoPeriodo(iExercicio, iPeriodo:Integer):Integer;
    function VerificaDotacao(sCentroRespon:String):boolean;
    function VerificaDatas (dDataIni, dDataFim : TDateTime):boolean;
    function PrimeiroDiaPeriodo(iExercicio, iPeriodo:Integer):String;

    function UltimoDiaPeriodo(iExercicio, iPeriodo, iIdEmpresa:Integer):String;

    // Retorna o CODCENTRESPON
    function BuscaCentRespon(const idReserva      : Integer;
                             const NumReserva     : Integer;
                             const bMostraMsg     : Boolean
                             ):String;

    function BuscaIdNumReserva(const idReserva      : Integer;
                               const NumReserva     : Integer;
                               const bMostraMsg     : Boolean
                              ):Integer;

    function VerificaSaldoProcesso(iPlanoOrc:Integer; sContaOrcamen: String;
      iExercicio, iPeriodo:Integer; rValor:extended;
      bMostraMsg:Boolean):boolean;

    function VerificaContaAtiva(iPlanoOrc: Integer;
      sContaOrcamen: String):boolean;

    function BuscaContaReservaCompromisso(NumResOUComp:double): string;


   function  BuscaContaOrcamen(const iPlanoOrc           : Integer;
                               const sContaOrcamen       : String;
                               const bMostraMsg          : Boolean;
                               const bProcesso           : Boolean;
                               var   sNomeConta          : String;
                               var   sCodCentroRespon    : String;
                               var   sNomeCentroRespon   : String;
                               var   sCodGrupo           : String;
                               var   sNomeGrupo          : String;
                               var   sUnid               : String;
                               var   sPPrev              : String;
                               var   sCCusto             : String;
                               var   sPatro              : String
                              ): Integer;

    function ExibeSaldo(iPlanoOrc: Integer; sContaOrcamen, sData,
      sTipoSaldo: String): double;

    function VerificaSaldo(iPlano   : Integer;
                           sConta   : String;
                           sData    : String
                          ): Boolean;

    Property IdReserva       : Integer        read FIdReserva        write FIdReserva;
    Property IdUsuario       : Integer        read FIdUsuario        write FIdUsuario;
    property IdEmpresa       : Integer        read FIdEmpresa        write FIdEmpresa;
    property NumReserva      : Integer        read FNumReserva       write FNumReserva;
    property ValorReserva    : Real           read FValorReserva     write FValorReserva;
    property CdsPeriodo      : TClientDataSet read FCdsPeriodo       write SetCdsPeriodo;
    property CdsUsuXCentCusto: TClientDataSet read FCdsUsuXCentCusto write SetCdsUsuXCentCusto;
    property CdsCompromissos : TClientDataSet read FCdsCompromissos  write SetCdsCompromissos;
    property CdsSaldos       : TClientDataSet read FCdsSaldos        write SetCdsSaldos;
    property CdsAux          : TClientDataSet read FCdsAux           write SetCdsAux;
    property CdsResComp      : TClientDataSet read FCdsResComp       write SetCdsResComp;
    property CdsReservas     : TClientDataSet read FCdsReservas      write SetCdsReservas;
    property CdsSaldoProcesso: TClientDataSet read FCdsSaldoProcesso write SetCdsSaldoProcesso;
    property CdsBuscaConta   : TClientDataSet read FCdsBuscaConta    write SetCdsBuscaConta;

End;

Var
  OrcamentoBackMT: TOrcamentoBackMT;

implementation

procedure TOrcamentoBackMT.DoChangeDataBase;
Begin
  inherited;

End;

procedure TOrcamentoBackMT.OnCreateAppServer;
begin
end;

Constructor TOrcamentoBackMT.Create;
Begin
  Inherited;
  CReservaOrcamen := TCtrlReservaorcamen.Create;
  CSaldoOrcado    := TCtrlSaldoorcado.Create;
  CResxComp       := TCtrlResxcomp.Create;

  FCdsPeriodo       := TClientDataSet.Create(nil);
  FCdsUsuXCentCusto := TClientDataSet.Create(nil);
  FCdsCompromissos  := TClientDataSet.Create(nil);
  FCdsReservas      := TClientDataSet.Create(nil);
  FCdsSaldos        := TClientDataSet.Create(nil);
  FCdsSaldoProcesso := TClientDataSet.Create(nil);
  FCdsAux           := TClientDataSet.Create(nil);
  FCdsResComp       := TClientDataSet.Create(nil);
  FCdsBuscaConta    := TClientDataSet.Create(nil);
End;

Destructor TOrcamentoBackMT.Destroy;
Begin
  FreeAndNil(CReservaOrcamen);
  FreeAndNil(CSaldoOrcado);
  FreeAndNil(CResxComp);
  FreeCds([FCdsUsuXCentCusto,
           FCdsCompromissos,
           FCdsReservas,
           FCdsSaldos,
           FCdsPeriodo,
           FCdsAux,
           FCdsResComp,
           FCdsSaldoProcesso,
           FCdsBuscaConta]);
  Inherited;
End;

procedure TOrcamentoBackMT.SetCdsPeriodo(const Value: TClientDataSet);
begin
  FCdsPeriodo := Value;
end;

procedure TOrcamentoBackMT.SetCdsUsuXCentCusto(const Value: TClientDataSet);
begin
  FCdsUsuXCentCusto := Value;
end;

procedure TOrcamentoBackMT.SetCdsCompromissos(const Value: TClientDataSet);
begin
  FCdsCompromissos := Value;
end;

procedure TOrcamentoBackMT.SetCdsSaldos(const Value: TClientDataSet);
begin
  FCdsSaldos := Value;
end;

procedure TOrcamentoBackMT.SetCdsAux(const Value: TClientDataSet);
begin
  FCdsAux := Value;
end;

procedure TOrcamentoBackMT.SetCdsResComp(const Value: TClientDataSet);
begin
  FCdsResComp := Value;
end;

procedure TOrcamentoBackMT.SetCdsReservas(const Value: TClientDataSet);
begin
  FCdsReservas := Value;
end;

procedure TOrcamentoBackMT.SetCdsSaldoProcesso(const Value: TClientDataSet);
begin
  FCdsSaldoProcesso := Value;
end;

procedure TOrcamentoBackMT.SetCdsBuscaConta(const Value: TClientDataSet);
begin
  FCdsBuscaConta := Value;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBackMT.CriaCompromisso                                            }
{  Parâmetros passados para a Função :                                         }
{                                                                              }
{   sData - data do Compromisso a ser criado (parâmetro obrigatório)           }
{   rValor - valor do Compromisso (se for passado como zero, somará o valor    }
{            das reservas que compõe o compromisso).                           }
{   sObs - Descrição do Compromisso (não é obrigatório)                        }
{   iModulo - id do Módulo de origem                                           }
{   iConjuntoReservas - array contendo os números das reservas que vão compor  }
{                       o novo Compromisso                                     }
{   bExibeMsg - flag indicativa se a função deve ou não gerar mensagens de erro}
{                                                                              }
{  Resultados possíveis da Função :                                            }
{                                                                              }
{   1 a n - número do Compromisso gerado                                       }
{   -1 - Usuário corrente sem alçada para criar o Compromisso                  }
{   -2 - Existem Compromissos entre as Reservas passadas como parâmetro        }
{   -3 - Existem Reservas Canceladas ou Efetivadas entre as Reservas           }
{        passadas como parâmetro                                               }
{   -4 - Existem Reservas com Contas Orçamentárias diferentes entre as Reservas}
{        passadas como parâmetro                                               }
{   -5 - Houve um erro inesperado no Banco de Dados                            }
{                                                                              }
{------------------------------------------------------------------------------}

function TOrcamentoBackMT.CriaCompromisso(sData:String; rValor:extended;
  sObs:String; iModulo:Integer; iConjuntoReservas:array of Integer;
  bExibeMsg, bVeioCompra: boolean):Integer;
var sMsg, sCodConta, sSQL: String;
    iNumReservas, iPeriodo, iCodCompromisso, i: Integer;
    bNaoEReserva, bNaoEstaAguardando, bNaoEMesmaConta: boolean;
    rValorTotalReservas: extended;
    iIdCompromisso: LongInt;

  iExercicio,
  Mes,
  Dia         : Word;

begin
  Result := 0;
  //Função que procede com a criação do Compromisso a partir de "n" reservas
  iNumReservas := high(iConjuntoReservas);

  DecodeDate( StrToDate( sData ), iExercicio, Mes, Dia );

  iPeriodo     := EncontraPeriodo(sData);
  rValorTotalReservas := 0;
  bNaoEReserva        := false;
  bNaoEstaAguardando  := false;
  bNaoEMesmaConta     := false;
  sCodConta           := '';

  for i := 0 to iNumReservas do
    begin
      if iConjuntoReservas[i] <> 0 then
        begin
          sSQL := 'SELECT R.IDRESERVAORCAMEN, R.NUMRESERVA, R.VLRRESERVA, ' +
                  'R.FLGRESCOMP, R.FLGRESERVA, R.IDCONTAORCAMEN, ' +
                  'R.IDPLANOORCAMEN, C.CODCENTRORESPON ' +
                  'FROM RESERVAORCAMEN R, CONTASORCAMEN C WHERE ' +
                  '(R.IDPESSOA = ' + IntToStr( idEmpresa ) + ') AND ' +
                  '(R.NUMRESERVA = ' + IntToStr(iConjuntoReservas[i]) + ') AND ' +
                  '(R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND ' +
                  '(R.IDPLANOORCAMEN = C.IDPLANOORCAMEN)';

          with FCdsCompromissos do
            begin
              Data := GetDataPacket(sSQL);

              if i > 0 then
                begin
                  if sCodConta <> FieldByName('IDCONTAORCAMEN').asString then
                    begin
                      bNaoEMesmaConta := true;
                    end;
                end;

              if FieldByName('FLGRESCOMP').asString = 'C' then
                begin
                  bNaoEReserva := true;
                end;

              if (FieldByName('FLGRESERVA').asString <> 'A') and
                 (FieldByName('FLGRESERVA').asString <> 'U') and
                 (Not bVeioCompra) then
                begin
                  bNaoEstaAguardando := true;
                end;

              if (FieldByName('FLGRESERVA').asString = 'A') or
                 (FieldByName('FLGRESERVA').asString = 'U') then
                begin
                  sCodConta := FieldByName('IDCONTAORCAMEN').asString;
                  rValorTotalReservas := rValorTotalReservas +
                                         FieldByName('VLRRESERVA').asFloat;
                end;

            end; // with
        end; // if
    end; // for
    
  if rValorTotalReservas < rValor then
    begin
      if not VerificaSaldoProcesso(FCdsCompromissos.FieldByName('IDPLANOORCAMEN').asInteger,
                                   FCdsCompromissos.FieldByName('IDCONTAORCAMEN').asString,
                                   iExercicio,
                                   iPeriodo,
                                   (rValor - rValorTotalReservas),
                                   true) then
        begin
          sMsg := 'Não há saldo no orçamento para esta operação';
          result := -1;
        end;
    end;

  if bNaoEReserva then
    begin
      sMsg := 'Existem Compromissos para estas Reservas.';
      Result := -2;
    end;

  if bNaoEstaAguardando then
    begin
      sMsg := 'Existem Reservas Canceladas ou Efetivadas.';
      Result := -3;
    end;

  if bNaoEMesmaConta then
    begin
      sMsg := 'Existem Reservas com Contas Orçamentárias diferentes.';
      Result := -4;
    end;

  if Result < 0 then
    begin
      if bExibeMsg then
        begin
          if sMsg <> '' then
            begin
              MessageInfo := sMsg;
            end;
        end;
      EXIT;
    end;

  //Cria o número do próximo compromisso

  // semáforo para que usuários concorrentes não peguem o mesmo número de reserva
  GetDataPacket('SELECT * FROM PARAMORCAMENTO FOR UPDATE');

  sSQL := 'SELECT MAX(NUMRESERVA) AS PROXIMA FROM RESERVAORCAMEN ' +
          'WHERE IDPESSOA = ' + IntToStr( idEmpresa );

  with FCdsAux do
    begin
      Data := GetDataPacket(sSQL);
      iCodCompromisso := FieldByName('PROXIMA').asInteger + 1;
      Close;
    end;

  iIdCompromisso := GetSequence( 'RESERVAORCAMEN' );

  if rValor = 0 then rValor := rValorTotalReservas;

  try
    //Cria o Compromisso
    CReservaOrcamen.CriaCompromisso(iIdCompromisso,
                                    idEmpresa,
                                    iExercicio,
                                    iPeriodo,
                                    FCdsCompromissos.FieldByName('IDPLANOORCAMEN').asInteger,
                                    iCodCompromisso,
                                    iModulo,
                                    FCdsCompromissos.FieldByName('IDCONTAORCAMEN').asString,
                                    sData,
                                    sObs,
                                    rValor);

    //Cria o Relacionamento entre o novo Compromisso e as reservas antigas
    for i := 0 to iNumReservas do
      begin
        if iConjuntoReservas[i] <> 0 then
          begin
            sSQL := 'SELECT R.IDRESERVAORCAMEN, R.NUMRESERVA, R.VLRRESERVA, ' +
                    'R.FLGRESCOMP, R.FLGRESERVA, R.IDCONTAORCAMEN, ' +
                    'R.IDPLANOORCAMEN, C.CODCENTRORESPON ' +
                    'FROM RESERVAORCAMEN R, CONTASORCAMEN C WHERE ' +
                    '(R.IDPESSOA = ' + IntToStr( idEmpresa ) + ') AND ' +
                    '(R.NUMRESERVA = ' + IntToStr(iConjuntoReservas[i]) +
                    ') AND ' + '(R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND ' +
                    '(R.IDPLANOORCAMEN = C.IDPLANOORCAMEN)';

            FCdsCompromissos.Data := GetDataPacket(sSQL);
            CResxComp.Inserir(GetSequence( 'RESXCOMP' ),
                              idEmpresa,
                              FCdsCompromissos.FieldByName('IDRESERVAORCAMEN').AsInteger,
                              iIdCompromisso);

            //Marca as reservas como efetivadas
            CReservaOrcamen.AtualizaFLGRESERVA('E', idEmpresa,iConjuntoReservas[i]);
          end;
      end;

    //Retira o Valor do Saldo Reservado e inclui no Compromissado
    CSaldoOrcado.TrocaSaldoReservadopCompromissado(rValorTotalReservas,
                                                   rValor,
                                                   idEmpresa,
                                                   FCdsCompromissos.FieldByName('IDPLANOORCAMEN').asInteger,
                                                   PrimeiroDiaPeriodo(iExercicio,iPeriodo),
                                                   FCdsCompromissos.FieldByName('IDCONTAORCAMEN').asString);


    result := iIdCompromisso;

    sMsg := 'O Compromisso nº ' + IntToStr(iCodCompromisso) +
            ' foi criado com sucesso.';

  except
    result := -5;
    sMsg   := 'Houve um erro inesperado no Banco de Dados';
  end;

  if bExibeMsg then
    begin
      if sMsg <> '' then
        begin
          MessageInfo := sMsg;
        end;
    end;

end;



{------------------------------------------------------------------------------}
{  TOrcamentoBackMT.MarcaReserva                                               }
{  Parâmetros passados para a Função :                                         }
{                                                                              }
{   iNumReserva - número da Reserva Orçamentário (parâmetro obrigatório)       }
{   bExibeMsg - flag indicativa se a função deve ou não gerar mensagens de erro}
{                                                                              }
{  Resultados possíveis da Função :                                            }
{                                                                              }
{   0 - Marcação realizada com sucesso                                         }
{   1 - Usuário corrente sem alçada para a Marcação                            }
{   2 - O número enviado é de um Compromisso Orçamentária, não de uma Reserva  }
{   3 - O número enviado é de uma Reserva já Cancelada                         }
{   4 - O número enviado é de uma Reserva já Efetivada                         }
{   5 - Houve um erro inesperado no Banco de Dados                             }
{   6 - O número enviado é de uma Reserva já em Uso                            }
{                                                                              }
{------------------------------------------------------------------------------}

function TOrcamentoBackMT.MarcaReserva(iNumReserva:longint;
  bExibeMsg: boolean):Integer;
var sMsg, sSQL: String;
begin
  //Função que procede com a marcação da Reserva para "Em Uso - U"
  sSQL := 'SELECT R.FLGRESERVA, R.FLGRESCOMP, C.CODCENTRORESPON ' +
          'FROM RESERVAORCAMEN R, CONTASORCAMEN C ' +
          'WHERE (R.NUMRESERVA = ' + IntToStr(iNumReserva) + ') AND ' +
          '(R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND ' +
          '(R.IDPLANOORCAMEN = C.IDPLANOORCAMEN) AND ' +
          '(R.IDPESSOA = ' + IntToStr( idEmpresa) + ')';
  with FCdsReservas do begin
    Data := GetDataPacket(sSQL);
    if not VerificaDotacao(FieldByName('CODCENTRORESPON').asString) then begin
      //O Usuário Corrente não tem alçada nesse centro de responsabilidade
      //para marcar a reserva
      result := 1;
    end else begin
      if FieldByName('FLGRESCOMP').asString = 'C' then begin
        //Não é uma reserva, é um compromisso
        result := 2;
      end else begin
        if FieldByName('FLGRESERVA').asString = 'C' then begin
          //É uma reserva cancelada
          result := 3;
        end else begin
          if FieldByName('FLGRESERVA').asString = 'E' then begin
            //A reserva já foi efetivada
            result := 4;
          end else begin
            if FieldByName('FLGRESERVA').asString = 'U' then begin
              //A reserva já está em uso
              result := 6;
            end else begin
              //A reserva está aguardando, e pode ser usada
              try
                CReservaOrcamen.AtualizaFLGRESERVA('U', idEmpresa,iNumReserva );
                //A marcação foi realizada com sucesso
                result := 0;
              except
                //Ocorreu um erro inesperado no Banco de Dados
                result := 5;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
  if bExibeMsg then begin
    case Result of
      1 : sMsg := 'Usuário corrente sem alçada para a marcar a ' +
                  'Reserva "Em Uso".';
      2 : sMsg := 'O número enviado é de um Compromisso Orçamentário, ' +
                  'não de uma Reserva.';
      3 : sMsg := 'O número enviado é de uma Reserva já Cancelada';
      4 : sMsg := 'O número enviado é de uma Reserva já Efetivada';
      5 : sMsg := 'Houve um erro inesperado no Banco de Dados';
      6 : sMsg := 'O número enviado é de uma Reserva já em Uso';
      else sMsg := '';
    end;
    if sMsg <> '' then begin
       MessageInfo := sMsg;
    end;
  end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBackMT.EstornaReserva                                             }
{  Parâmetros passados para a Função :                                         }
{                                                                              }
{   iNumReserva - número da Reserva Orçamentário (parâmetro obrigatório)       }
{   bExibeMsg - flag indicativa se a função deve ou não gerar mensagens de erro}
{                                                                              }
{  Resultados possíveis da Função :                                            }
{                                                                              }
{   0 - Estorno realizado com sucesso                                          }
{   1 - Usuário corrente sem alçada para o Estorno                             }
{   2 - O número enviado é de um Compromisso Orçamentário, não de uma Reserva  }
{   3 - O número enviado é de uma Reserva já Cancelada                         }
{   4 - O número enviado é de uma Reserva já Efetivada                         }
{   5 - Houve um erro inesperado no Banco de Dados                             }
{                                                                              }
{------------------------------------------------------------------------------}

function TOrcamentoBackMT.EstornaReserva(iNumReserva:longint;
  bExibeMsg: boolean):Integer;
var sMsg, sSQL: String;
begin
  //Função que procede com o Estorno da Reserva
  sSQL := 'SELECT R.FLGRESERVA, R.FLGRESCOMP, C.CODCENTRORESPON ' +
          'FROM RESERVAORCAMEN R, CONTASORCAMEN C ' +
          'WHERE (R.NUMRESERVA = ' + IntToStr(iNumReserva) + ') AND ' +
          '(R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND ' +
          '(R.IDPLANOORCAMEN = C.IDPLANOORCAMEN) AND ' +
          '(R.IDPESSOA = ' + IntToStr( idEmpresa) + ')';
  with FCdsReservas do begin
    Data := GetDataPacket(sSQL);
    if not VerificaDotacao(FieldByName('CODCENTRORESPON').asString) then begin
      //O Usuário Corrente não tem alçada nesse centro de responsabilidade
      //para marcar a reserva
      result := 1;
    end else begin
      if FieldByName('FLGRESCOMP').asString = 'C' then begin
        //Não é uma reserva, é um compromisso
        result := 2;
      end else begin
        if FieldByName('FLGRESERVA').asString = 'C' then begin
          //É uma reserva cancelada
          result := 3;
        end else begin
          if FieldByName('FLGRESERVA').asString = 'E' then begin
            //A reserva já foi efetivada
            result := 4;
          end else begin
            if FieldByName('FLGRESERVA').asString = 'A' then begin
              //A reserva já está aguardando
              result := 6;
            end else begin
              //A reserva está em uso, e pode ser estornada
              try
                CReservaOrcamen.AtualizaFLGRESERVA( 'A', idEmpresa,iNumReserva );
                //A marcação foi realizada com sucesso
                result := 0;

                
                GravaLogPLANEORC('uCtrlOrcamento.EstornaReserva: Reserva nº ' + IntToStr(iNumReserva),
                                 Sistema.IdModulo,
                                 Sistema.IdUsuario);
                

              except
                //Ocorreu um erro inesperado no Banco de Dados
                result := 5;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
  if bExibeMsg then begin
    case Result of
      1 : sMsg := 'Usuário corrente sem alçada para a estornar a Reserva.';
      2 : sMsg := 'O número enviado é de um Compromisso Orçamentário, ' +
                  'não de uma Reserva.';
      3 : sMsg := 'O número enviado é de uma Reserva já Cancelada.';
      4 : sMsg := 'O número enviado é de uma Reserva já Efetivada.';
      5 : sMsg := 'Houve um erro inesperado no Banco de Dados.';
      6 : sMsg := 'O número enviado é de uma Reserva já Aguardando.';
      else sMsg := '';
    end;
    if sMsg <> '' then begin
       MessageInfo := sMsg;
    end;
  end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBackMT.CancelaReserva                                             }
{  Parâmetros passados para a Função :                                         }
{                                                                              }
{   iNumReserva - número da Reserva Orçamentário (parâmetro obrigatório)       }
{   bExibeMsg - flag indicativa se a função deve ou não gerar mensagens de erro}
{                                                                              }
{  Resultados possíveis da Função :                                            }
{                                                                              }
{   0 - Cancelamento realizado com sucesso                                     }
{   1 - Usuário corrente sem alçada para o Cancelamento                        }
{   2 - O número enviado é de um Compromisso Orçamentária, não de uma Reserva  }
{   3 - O número enviado é de uma Reserva já Cancelada                         }
{   4 - O número enviado é de uma Reserva já Efetivada                         }
{   5 - Houve um erro inesperado no Banco de Dados                             }
{                                                                              }
{------------------------------------------------------------------------------}

function TOrcamentoBackMT.CancelaReserva(iNumReserva:longint;
  bExibeMsg: boolean):Integer;
var sMsg, sSQL: String;
begin
  //Função que procede com o Cancelamento da Reserva
  sSQL := 'SELECT R.FLGRESERVA, R.FLGRESCOMP, C.CODCENTRORESPON, ' +
          'R.EXERCICIO, R.PERIODO, R.VLRRESERVA ' +
          'FROM RESERVAORCAMEN R, CONTASORCAMEN C ' +
          'WHERE (R.NUMRESERVA = ' + IntToStr(iNumReserva) + ') AND ' +
          '(R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND ' +
          '(R.IDPLANOORCAMEN = C.IDPLANOORCAMEN) AND ' +
          '(R.IDPESSOA = ' + IntToStr( idEmpresa) + ')';
  with FCdsReservas do begin
    Data := GetDataPacket(sSQL);
    if not VerificaDotacao(FieldByName('CODCENTRORESPON').asString) then begin
      //O Usuário Corrente não tem alçada nesse centro de responsabilidade
      //para marcar a reserva
      result := 1;
    end else begin
      if FieldByName('FLGRESCOMP').asString = 'C' then begin
        //Não é uma reserva, é um compromisso
        result := 2;
      end else begin
        if FieldByName('FLGRESERVA').asString = 'C' then begin
          //É uma reserva cancelada
          result := 3;
        end else begin
          if FieldByName('FLGRESERVA').asString = 'E' then begin
            //A reserva já foi efetivada
            result := 4;
          end else begin
            if FieldByName('FLGRESERVA').asString = 'U' then begin
              //A reserva está em uso
              result := 6;
            end else begin
              //A reserva está aguardando, e pode ser usada
              try
                CReservaOrcamen.AtualizaFLGRESERVA( 'C', idEmpresa,iNumReserva );
                //Retira o Valor do Saldo Reservado
                CSaldoOrcado.RetiraValor(FieldByName('VLRRESERVA').asFloat,
                         idEmpresa,
                         FieldByName('IDPLANOORCAMEN').asInteger,
                         PrimeiroDiaPeriodo(FieldByName('EXERCICIO').asInteger,
                         FieldByName('PERIODO').asInteger),
                         FieldByName('IDCONTAORCAMEN').asString,'R');
                //O cancelamento foi realizado com sucesso
                result := 0;

                
                GravaLogPLANEORC('uCtrlOrcamento.CancelaReserva: Reserva nº ' + IntToStr(iNumReserva),
                                 Sistema.IdModulo,
                                 Sistema.IdUsuario);
                

              except
                //Ocorreu um erro inesperado no Banco de Dados
                result := 5;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
  if bExibeMsg then begin
    case Result of
      1 : sMsg := 'Usuário corrente sem alçada para a cancelar a Reserva.';
      2 : sMsg := 'O número enviado é de um Compromisso Orçamentário, ' +
                  'não de uma Reserva.';
      3 : sMsg := 'O número enviado é de uma Reserva já Cancelada';
      4 : sMsg := 'O número enviado é de uma Reserva já Efetivada';
      5 : sMsg := 'Houve um erro inesperado no Banco de Dados';
      6 : sMsg := 'O número enviado é de uma Reserva já em Uso';
      else sMsg := '';
    end;
    if sMsg <> '' then begin
       MessageInfo := sMsg;
    end;
  end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBackMT.EstornaCompromisso                                         }
{  Parâmetros passados para a Função :                                         }
{                                                                              }
{   iNumReserva - número do Compromisso Orçamentário (parâmetro obrigatório)   }
{   rValor - valor do Compromisso.                                             }
{   bExibeMsg - flag indicativa se a função deve ou não gerar mensagens de erro}
{                                                                              }
{  Resultados possíveis da Função :                                            }
{                                                                              }
{   0 - Estorno realizado com sucesso                                          }
{   1 - Usuário corrente sem alçada para a Estorno                             }
{   2 - O número enviado é de uma Reserva Orçamentária, não de um Compromisso  }
{   3 - O número enviado é de um Compromisso já Cancelado                      }
{   4 - O número enviado é de um Compromisso ainda Aguardando                  }
{   5 - Houve um erro inesperado no Banco de Dados                             }
{                                                                              }
{------------------------------------------------------------------------------}

function TOrcamentoBackMT.EstornaCompromisso(iNumReserva:longint;
  rValor:extended; bExibeMsg: boolean):Integer;
var sMsg, sSQL: String;
begin
  //Função que procede com o estorno do Compromisso Orçamentário
  sSQL := 'SELECT R.FLGRESERVA, R.FLGRESCOMP, C.CODCENTRORESPON, ' +
          'R.VLRRESERVA, R.VLRCOMPROMISSO, R.EXERCICIO, R.PERIODO, ' +
          'R.IDPLANOORCAMEN, R.IDCONTAORCAMEN ' +
          'FROM RESERVAORCAMEN R, CONTASORCAMEN C ' +
          'WHERE (R.NUMRESERVA = ' + IntToStr(iNumReserva) + ') AND ' +
          '(R.IDPESSOA   = ' + IntToStr( IdEmpresa) + ') AND ' +
          '(R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND ' +
          '(R.IDPLANOORCAMEN = C.IDPLANOORCAMEN)';
  with FCdsCompromissos do begin
    Data := GetDataPacket(sSQL);
    if not VerificaDotacao(FieldByName('CODCENTRORESPON').asString) then begin
      //O Usuário Corrente não tem alçada nesse centro de responsabilidade
      //para estornar o compromisso
      result := 1;
    end else begin
      if FieldByName('FLGRESCOMP').asString = 'R' then begin
        //Não é um compromisso, é uma reserva
        result := 2;
      end else begin
        if FieldByName('FLGRESERVA').asString = 'C' then begin
          //É um compromisso cancelado
          result := 3;
        end else begin
          if (FieldByName('FLGRESERVA').asString = 'A') and
             (FieldByName('VLRCOMPROMISSO').asFloat < rValor) then begin
            //O compromisso está aguardando
            result := 4;
          end else begin
            if (FieldByName('FLGRESERVA').asString = 'E') or
               (FieldByName('FLGRESERVA').asString = 'A') then begin
              //O compromisso está efetivado, e pode ser estornado
              try
                CReservaOrcamen.AtualizaValorCompromisso( rValor * (-1),'A',iNumReserva );
                //A efetivação foi realizada com sucesso
                result := 0;

                
                GravaLogPLANEORC('uCtrlOrcamento.EstornaCompromisso: Compromisso nº ' + IntToStr(iNumReserva),
                                 Sistema.IdModulo,
                                 Sistema.IdUsuario);
                

              except
                //Ocorreu um erro inesperado no Banco de Dados
                result := 5;
              end;
            end else begin
              //Ocorreu um erro inesperado no Banco de Dados
              result := 5;
            end;
          end;
        end;
      end;
    end;
  end;
  if bExibeMsg then begin
    case Result of
      1 : sMsg := 'Usuário corrente sem alçada para o Estorno';
      2 : sMsg := 'O número enviado é de uma Reserva Orçamentária, ' +
                  'não de um Compromisso';
      3 : sMsg := 'O número enviado é de um Compromisso já Cancelado';
      4 : sMsg := 'O número enviado é de um Compromisso ainda Aguardando';
      5 : sMsg := 'Houve um erro inesperado no Banco de Dados';
      else sMsg := '';
    end;
    if sMsg <> '' then begin
       MessageInfo := sMsg;
    end;
  end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBackMT.CancelaCompromisso                                         }
{  Parâmetros passados para a Função :                                         }
{                                                                              }
{   iNumReserva - número do Compromisso Orçamentário (parâmetro obrigatório)   }
{   bExibeMsg - flag indicativa se a função deve ou não gerar mensagens de erro}
{                                                                              }
{  Resultados possíveis da Função :                                            }
{                                                                              }
{   0 - Cancelamento realizado com sucesso                                     }
{   1 - Usuário corrente sem alçada para o Cancelamento                        }
{   2 - O número enviado é de uma Reserva Orçamentária, não de um Compromisso  }
{   3 - O número enviado é de um Compromisso já Cancelado                      }
{   5 - Houve um erro inesperado no Banco de Dados                             }
{                                                                              }
{------------------------------------------------------------------------------}

function TOrcamentoBackMT.CancelaCompromisso(iNumReserva:longint; bExibeMsg: boolean):Integer;
var sMsg, sSQL: String;
    iIDResxComp, iIDReserva : Int64;
    fValorReserva, fValorComprometido : Extended;
    CdsResXComp : TClientDataSet;
begin
  //Função que procede com o cancelamento do Compromisso Orçamentário
  sSQL := 'SELECT R.FLGRESERVA, R.FLGRESCOMP, C.CODCENTRORESPON, ' +
          'R.VLRRESERVA, R.VLRCOMPROMISSO, R.EXERCICIO, R.PERIODO, ' +
          'R.IDPLANOORCAMEN, R.IDCONTAORCAMEN ' +
          'FROM RESERVAORCAMEN R, CONTASORCAMEN C ' +
          'WHERE (R.NUMRESERVA = ' + IntToStr(iNumReserva) + ') AND ' +
          '(R.IDPESSOA = ' + IntToStr( idEmpresa) + ') AND ' +
          '(R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND  ' +
          '(R.IDPLANOORCAMEN = C.IDPLANOORCAMEN)';

  try
    CdsResXComp := TClientDataSet.Create(nil);

    with FCdsCompromissos do
      begin
        Data := GetDataPacket(sSQL);
        if not VerificaDotacao(FieldByName('CODCENTRORESPON').asString) then
          begin
            //O Usuário Corrente não tem alçada nesse centro de responsabilidade
            //para cancelar o compromisso
            Result := 1;
          end
        else
          begin
            if FieldByName('FLGRESCOMP').asString = 'R' then
              begin
                //Não é um compromisso, é uma reserva
                Result := 2;
              end
            else
              begin
                try
                  CReservaOrcamen.AtualizaFLGRESERVA('C', idEmpresa,iNumReserva);

                  sSQL :=
                  'SELECT C.IDRESXCOMP, C.IDRESERVA, R1.VLRRESERVA'         + #13 +
                  'FROM   RESXCOMP C, RESERVAORCAMEN R, RESERVAORCAMEN R1 ' + #13 +
                  'WHERE '                                                  + #13 +
                  '    R.NUMRESERVA = ' + IntToStr(iNumReserva)             + #13 +
                  'AND R1.IDRESERVAORCAMEN = C.IDRESERVA '                  + #13 +
                  'AND R.IDRESERVAORCAMEN  = C.IDCOMPROMISSO';

                  FCdsAux.Data := GetDataPacket(sSQL);
                  FCdsAux.First;
                  while not FCdsAux.eof do
                    begin
                      iIDReserva    := FCdsAux.FieldByName('IDRESERVA').AsInteger;
                      iIDResxComp   := FCdsAux.FieldByName('IDRESXCOMP').AsInteger;
                      fValorReserva := FCdsAux.FieldByName('VLRRESERVA').AsFloat;

                      // Se houver mais de um Compromisso para uma mesma Reserva
                      // na tabela ResXComp é porque foi feito pelo módulo do COMPRAS
                      //  e o cancelamento não deverá excluir estes relacionamentos.
                      CdsResXComp.Data := CResXComp.ListarCompromissosDaReserva(iIDReserva, Sistema.IdEmpresa);
                      if CdsResXComp.RecordCount < 2 then
                        begin
                          ExecSql('UPDATE RESERVAORCAMEN SET FLGRESERVA = ''U'' WHERE IDRESERVAORCAMEN = ' + IntToStr(iIDReserva));
                          ExecSql('DELETE FROM RESXCOMP WHERE IDRESXCOMP = ' + IntToStr(iIDResxComp));
                        end;

                      sSQL :=
                      'SELECT NVL(VLRCOMPROMETIDO,0) AS VLRCOMPROMETIDO FROM SALDOORCADO ' +
                      'WHERE ' +
                      '(IDPESSOA = ' + IntToStr(idEmpresa) + ') AND ' +
                      '(DATAREFERENCIA = TO_DATE(''' + PrimeiroDiaPeriodo(FieldByName('EXERCICIO').asInteger,
                                                                          FieldByName('PERIODO').asInteger) +
                      ''',''DD/MM/YYYY'')) AND ' +
                      '(IDPLANOORCAMEN = ' + FieldByName('IDPLANOORCAMEN').AsString + ') AND ' +
                      '(IDCONTAORCAMEN = ''' + FieldByName('IDCONTAORCAMEN').asString + ''')';

                      FCdsResComp.Data := GetDataPacket(sSQL);

                      fValorComprometido := FCdsResComp.FieldByName('VLRCOMPROMETIDO').AsFloat;

                      sSql :=
                      'UPDATE SALDOORCADO SET VLRCOMPROMETIDO = VLRCOMPROMETIDO - ' +
                      TrocaVPP(FloatToStr(FieldByName('VLRRESERVA').AsFloat));

                      // Se houver mais de um Compromisso para uma mesma Reserva
                      // na tabela ResXComp, é porque foi feito pelo módulo do COMPRAS
                      // e o cancelamento não deverá abrir o valor da Reserva novamente.
                      // Será necessário CRIAR uma NOVA RESERVA se for o caso.
                      if CdsResXComp.RecordCount < 2 then
                        sSql := sSql + ', VLRRESERVADO = VLRRESERVADO + ' + TrocaVPP(FloatToStr(fValorReserva));

                      sSql := sSql +
                      ' WHERE ' +
                      '(IDPESSOA = ' + IntToStr(idEmpresa) + ') AND ' +
                      '(DATAREFERENCIA = TO_DATE(''' + PrimeiroDiaPeriodo(FieldByName('EXERCICIO').asInteger,
                                                                          FieldByName('PERIODO').asInteger) +
                      ''',''DD/MM/YYYY'')) AND ' +
                      '(IDPLANOORCAMEN = ' + FieldByName('IDPLANOORCAMEN').AsString + ') AND ' +
                      '(IDCONTAORCAMEN = ''' + FieldByName('IDCONTAORCAMEN').asString + ''')';

                      ExecSql(sSQL);

                      FCdsAux.Next;
                    end; // while

                  //O cancelamento foi realizada com sucesso
                  Result := 0;

                  GravaLogPLANEORC('uCtrlOrcamento.CancelaCompromisso: Compromisso nº ' + IntToStr(iNumReserva),
                                   Sistema.IdModulo,
                                   Sistema.IdUsuario);

                except
                  //Ocorreu um erro inesperado no Banco de Dados
                  Result := 5;
                end; // try-except
              end; // else
          end; // if
      end; // while

    if bExibeMsg then
      begin
        case Result of
          1 : sMsg := 'Usuário corrente sem alçada para o Cancelamento';
          2 : sMsg := 'O número enviado é de uma Reserva Orçamentária, ' +
                      'não de um Compromisso';
          3 : sMsg := 'O número enviado é de um Compromisso já Cancelado';
          5 : sMsg := 'Houve um erro inesperado no Banco de Dados';
          else sMsg := '';
        end;

        if sMsg <> '' then
          begin
            MessageInfo := sMsg;
          end;
      end;
  finally
    FreeAndNil(CdsResXComp);
  end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBackMT.EfetivaCompromisso                                         }
{  Parâmetros passados para a Função :                                         }
{                                                                              }
{   iNumReserva - número do Compromisso Orçamentário (parâmetro obrigatório)   }
{   rValor - valor do Compromisso. Caso o valor seja diferente de zero, ele    }
{            substituirá o valor do Compromisso (parâmetro NÃO obrigatório)    }
{   bExibeMsg - flag indicativa se a função deve ou não gerar mensagens de erro}
{                                                                              }
{  Resultados possíveis da Função :                                            }
{                                                                              }
{   0 - Efetivação realizada com sucesso                                       }
{   1 - Usuário corrente sem alçada para a Efetivação                          }
{   2 - O número enviado é de uma Reserva Orçamentária, não de um Compromisso  }
{   3 - O número enviado é de um Compromisso já Cancelado                      }
{   4 - O número enviado é de um Compromisso já Efetivado                      }
{   5 - Houve um erro inesperado no Banco de Dados                             }
{   6 - O valor passado como parâmetro é maior que o valor do compromisso      }
{                                                                              }
{------------------------------------------------------------------------------}

function TOrcamentoBackMT.EfetivaCompromisso(iNumReserva:longint;
  rValor:extended; bExibeMsg: boolean):Integer;
var sMsg, sSQL: String;
    efetivacompromisso: boolean;
begin
  //Função que procede com a efetivação do Compromisso Orçamentário
  sSQL := 'SELECT R.FLGRESERVA, R.FLGRESCOMP, C.CODCENTRORESPON, ' +
          'R.VLRRESERVA, R.VLRCOMPROMISSO, R.EXERCICIO, R.PERIODO, ' +
          'R.IDPLANOORCAMEN, R.IDCONTAORCAMEN, R.VLRDEVOLVIDO ' +
          'FROM RESERVAORCAMEN R, CONTASORCAMEN C ' +
          'WHERE (R.NUMRESERVA = ' + IntToStr(iNumReserva) + ') AND ' +
          '(R.IDPESSOA = ' + IntToStr( idEmpresa) + ') AND ' +
          '(R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND ' +
          '(R.IDPLANOORCAMEN = C.IDPLANOORCAMEN)';
  with FCdsCompromissos do
  begin
    Data := GetDataPacket(sSQL);

    if not VerificaDotacao(FieldByName('CODCENTRORESPON').asString) then
    begin
      //O Usuário Corrente não tem alçada nesse centro de responsabilidade
      //para efetivar o compromisso
      result := 1;
    end
    else
    begin
      if FieldByName('FLGRESCOMP').asString = 'R' then
      begin
        //Não é um compromisso, é uma reserva
        result := 2;
      end
      else
      begin
        if FieldByName('FLGRESERVA').asString = 'C' then
        begin
          //É um compromisso cancelado
          result := 3;
        end
        else
        begin
          if FieldByName('FLGRESERVA').asString = 'E' then
          begin
            //O compromisso já foi efetivado
            result := 4;
          end
          else
          begin
            if FieldByName('FLGRESERVA').asString = 'A' then
            begin
              //O Valor passado é maior que o valor do Compromisso original
              if RoundCM(rValor,2) > RoundCM((FieldByName('VLRRESERVA').asFloat -
                                                         (FieldByName('VLRCOMPROMISSO').asFloat +
                                                          FieldByName('VLRDEVOLVIDO').asFloat)),2) then
              begin
                result := 6;

              end
              else
              begin
                //O compromisso está aguardando, e pode ser efetivado
                try
                  if Format('%17.2f', [rValor]) =
                     Format('%17.2f', [(FieldByName('VLRRESERVA').asFloat -
                                        (FieldByName('VLRCOMPROMISSO').asFloat +
                                         FieldByName('VLRDEVOLVIDO').asFloat))]) then
                    begin
                      efetivacompromisso := True;
                    end
                  else
                    begin
                      efetivacompromisso := False;
                    end;

                  CReservaOrcamen.CompromissoAguardando( rValor,    iNumReserva,
                                                         idEmpresa, efetivacompromisso );

                  GravaLogPLANEORC('uCtrlOrcamento.EfetivaCompromisso: Compromisso nº ' + IntToStr(iNumReserva),
                                   Sistema.IdModulo,
                                   Sistema.IdUsuario);

                  result := 0;
                except
                  //Ocorreu um erro inesperado no Banco de Dados
                  result := 5;
                end;
              end;
            end
            else
            begin
              //Ocorreu um erro inesperado no Banco de Dados
              result := 5;
            end;
          end;
        end;
      end;
    end;
  end;

  if bExibeMsg then
  begin
    case Result of
      1 : sMsg := 'Usuário corrente sem alçada para a Efetivação';
      2 : sMsg := 'O número enviado é de uma Reserva Orçamentária, ' +
                  'não de um Compromisso';
      3 : sMsg := 'O número enviado é de um Compromisso já Cancelado';
      4 : sMsg := 'O número enviado é de um Compromisso já Efetivado';
      5 : sMsg := 'Houve um erro inesperado no Banco de Dados';
      6 : sMsg := 'O valor é maior que o valor do compromisso';
      else sMsg := '';
    end;
    if sMsg <> '' then
       MessageInfo :=sMsg;
  end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBackMT.VerificaCompromisso                                        }                                  
{  Parâmetros passados para a Função :                                         }
{                                                                              }
{   iNumReserva - número do Compromisso Orçamentário (parâmetro obrigatório)   }
{   bExibeMsg - flag indicativa se a função deve ou não gerar mensagens de erro}
{                                                                              }
{  Resultados possíveis da Função :                                            }
{                                                                              }
{   0 - Compromisso ok                                                         }
{   1 - Usuário corrente sem alçada para a Efetivação                          }
{   2 - O número enviado é de uma Reserva Orçamentária, não de um Compromisso  }
{   3 - O número enviado é de um Compromisso já Cancelado                      }
{   4 - O número enviado é de um Compromisso já Efetivado                      }
{   5 - Houve um erro não esperado                                             }
{   6 - O valor passado como parâmetro é maior que o valor do compromisso      }
{                                                                              }
{------------------------------------------------------------------------------}

function TOrcamentoBackMT.VerificaCompromisso(iNumReserva:longint;
  rValor:extended; bExibeMsg: boolean):Integer;
var sMsg, sSQL: String;
begin
  //Função que procede com a verificação do Compromisso Orçamentário
  sSQL := 'SELECT R.FLGRESERVA, R.FLGRESCOMP, C.CODCENTRORESPON, ' +
          'R.VLRRESERVA, R.VLRCOMPROMISSO, R.EXERCICIO, R.PERIODO, ' +
          'R.IDPLANOORCAMEN, R.IDCONTAORCAMEN ' +
          'FROM RESERVAORCAMEN R, CONTASORCAMEN C ' +
          'WHERE (R.NUMRESERVA = ' + IntToStr(iNumReserva) + ') AND ' +
          '(R.IDPESSOA = ' + IntToStr( idEmpresa) + ') AND ' +
          '(R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND ' +
          '(R.IDPLANOORCAMEN = C.IDPLANOORCAMEN)';
  with FCdsCompromissos do begin
    Data := GetDataPacket(sSQL);
    if not VerificaDotacao(FieldByName('CODCENTRORESPON').asString) then begin
      //O Usuário Corrente não tem alçada nesse centro de responsabilidade
      //para efetivar o compromisso
      result := 1;
    end else begin
      if FieldByName('FLGRESCOMP').asString = 'R' then begin
        //Não é um compromisso, é uma reserva
        result := 2;
      end else begin
        if FieldByName('FLGRESERVA').asString = 'C' then begin
          //É um compromisso cancelado
          result := 3;
        end else begin
          if FieldByName('FLGRESERVA').asString = 'E' then begin
            //O compromisso já foi efetivado
            result := 4;
          end else begin
            if FieldByName('FLGRESERVA').asString = 'A' then begin
              //O Valor passado é maior que o valor do Compromisso original
              if StrToFloat(Format('%17.2f',[rValor])) >
                 StrToFloat(Format('%17.2f',[(FieldByName('VLRRESERVA').asFloat
                 - FieldByName('VLRCOMPROMISSO').asFloat)])) then begin
                result := 6;
              end else begin
                //O compromisso está aguardando, e pode ser efetivado
                result := 0;
              end;
            end else begin
              //houve um problema não esperado
              result := 5;
            end;
          end;
        end;
      end;
    end;
  end;
  if bExibeMsg then begin
    case Result of
      1 : sMsg := 'Usuário corrente sem alçada para a Efetivação';
      2 : sMsg := 'O número enviado é de uma Reserva Orçamentária, ' +
                  'não de um Compromisso';
      3 : sMsg := 'O número enviado é de um Compromisso já Cancelado';
      4 : sMsg := 'O número enviado é de um Compromisso já Efetivado';
      5 : sMsg := 'Houve um erro inesperado.';
      6 : sMsg := 'O valor é maior que o valor do compromisso';
      else sMsg := '';
    end;
    if sMsg <> '' then begin
       MessageInfo := sMsg;
    end;
  end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBackMT.VerificaDatas                                              }
{                                                                              }
{  Função que verifica se a data inicial é menor ou igual à data final         }
{  Parâmetros passados para a Função :                                         }
{                                                                              }
{   dDataIni - data inicial                                                    }
{   dDataFim - data final                                                      }
{                                                                              }
{  Resultados possíveis da Função :                                            }
{   true / false                                                               }
{                                                                              }
{------------------------------------------------------------------------------}

function TOrcamentoBackMT.VerificaDatas(dDataIni, dDataFim:TDateTime):boolean;
begin
  //Faz a verificação se a data final é maior que a data inicial
  result := true;
  if dDataFim < dDataIni then begin
    Application.MessageBox
                ('A Data Final deve ser maior ou igual que a Data Inicial.',
                 'Erro',mb_IconStop);
    result := false;
  end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBackMT.EncontraPeriodo                                            }
{                                                                              }
{  Função que encontra o Periodo a partir de uma data de referencia            }
{  Parâmetros passados para a Função :                                         }
{                                                                              }
{   sData - data de referência                                                 }
{                                                                              }
{  Resultados possíveis da Função :                                            }
{   inteiro contendo o período orçamentário                                    }
{                                                                              }
{------------------------------------------------------------------------------}
//************************************************
Function TOrcamentoBackMT.EncontraPeriodo( sData : String ):Integer;
Var
  sSQL: String;

  iExercicio,
  Mes,
  Dia         : Word;

Begin

  DecodeDate( StrToDate( sData ), iExercicio, Mes, Dia );
  sSQL := 'SELECT PERIODO FROM PERIODOORCAMEN ' +
          'WHERE (DATAINIPERIODO <= TO_DATE(''' + sData + ''',''DD/MM/YYYY''))'
          + ' AND (DATAFIMPERIODO >= TO_DATE(''' + sData + ''',''DD/MM/YYYY''))'
          + ' AND (EXERCICIO = ' + IntToStr(iExercicio) + ') AND ' +
          '(IDPESSOA  = ' + IntToStr( IdEmpresa) + ')';
  with FCdsPeriodo do begin
    Data := GetDataPacket(sSQL);
    if isEmpty then begin
      result := 0;
    end else begin
      result := FieldByName('PERIODO').asInteger;
    end;
  end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBackMT.DiasNoPeriodo                                              }
{                                                                              }
{  Função que retorna o número de dias de um período orçamentário              }
{  Parâmetros passados para a Função :                                         }
{                                                                              }
{   iExercicio - exercício orçamentário                                        }
{   iPeríodo - periodo orçamentário                                            }
{                                                                              }
{  Resultados possíveis da Função :                                            }
{   inteiro contendo o número de dias do período orçamentário                  }
{                                                                              }
{------------------------------------------------------------------------------}

function TOrcamentoBackMT.DiasNoPeriodo(iExercicio, iPeriodo:Integer):Integer;
var sSQL: String;
begin
  //Retorna quantos dias um período tem
  sSQL := 'SELECT DATAINIPERIODO, DATAFIMPERIODO FROM PERIODOORCAMEN ' +
          'WHERE (EXERCICIO = ' + IntToStr(iExercicio) + ') AND ' +
          '(PERIODO  = ' + IntToStr(iPeriodo) + ') AND ' +
          '(IDPESSOA = ' + IntToStr( IdEmpresa) + ')';
  with FCdsPeriodo do begin
    Data := GetDataPacket(sSQL);
    if isEmpty then begin
      result := 0;
    end else begin
      result := trunc(FieldByName('DATAFIMPERIODO').value -
                FieldByName('DATAINIPERIODO').value) + 1;
    end;
  end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBackMT.PrimeiroDiaPeriodo                                         }
{                                                                              }
{  Função que retorna a data do primeiro dia de um período orçamentário        }
{  Parâmetros passados para a Função :                                         }
{                                                                              }
{   iExercicio - exercício orçamentário                                        }
{   iPeríodo - periodo orçamentário                                            }
{                                                                              }
{  Resultados possíveis da Função :                                            }
{   String contendo a data do primeiro dia do período orçamentário             }
{                                                                              }
{------------------------------------------------------------------------------}

function TOrcamentoBackMT.PrimeiroDiaPeriodo(iExercicio,
  iPeriodo:Integer):String;
var sSQL: String;
begin
  //Retorna o primeiro dia em um período
  sSQL := 'SELECT DATAINIPERIODO FROM PERIODOORCAMEN ' +
          'WHERE (EXERCICIO = ' + IntToStr(iExercicio) + ') AND ' +
          '(PERIODO  = ' + IntToStr(iPeriodo) + ') AND ' +
          '(IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ')';
  with FCdsPeriodo do begin
    Data := GetDataPacket(sSQL);
    if isEmpty then begin
      result := '';
    end else begin
      result := DateToStr(FieldByName('DATAINIPERIODO').asDateTime);
    end;
  end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBackMT.VerificaDotacao                                            }
{                                                                              }
{  Função que verifica se o Centro de Responsabilidade pode ser usado pelo     }
{  usuário corrente                                                            }
{  Parâmetros passados para a Função :                                         }
{                                                                              }
{   sCentroRespon - Centro de Responsabilidade                                 }
{                                                                              }
{  Resultados possíveis da Função :                                            }
{   true / false                                                               }
{                                                                              }
{------------------------------------------------------------------------------}

function TOrcamentoBackMT.VerificaDotacao(sCentroRespon:String):boolean;
var sSQL: String;
begin
  //Verifica a tabela de Usuarios x Centros de Resp.
  //para saber se pode ser feita a reserva
  result := true;
  if sCentroRespon <> '' then begin
    sSQL := 'SELECT IDPESSOAACESSO FROM PESSOAXCRESP ' +
            'WHERE (IDPESSOAACESSO = ' + IntToStr( IdUsuario ) +
            ') AND ' + '(RTRIM(CODCENTRORESPON) = ''' + sCentroRespon +
            ''') AND ' + '(IDPESSOA = ' + IntToStr( IdEmpresa) + ')';
    with FCdsUsuXCentCusto do begin
      Data := GetDataPacket(sSQL);
      if isEmpty then begin
        result := false;
      end;
    end;
  end;
end;


// Retorna o CODCENTRORESPON
function TOrcamentoBackMT.BuscaCentRespon(const idReserva      : Integer;
                                          const NumReserva     : Integer;
                                          const bMostraMsg     : Boolean
                                         ):String;
var sSQL: String;
begin

  sSQL := 'SELECT R.IDRESERVAORCAMEN, R.NUMRESERVA, C.CODCENTRORESPON FROM RESERVAORCAMEN R, CONTASORCAMEN C' +
          'WHERE R.IDPESSOA =' + IntToStr( idEmpresa) +
          'AND C.IDPLANOORCAMEN = R.IDPLANOORCAMEN' +
          'AND C.IDCONTAORCAMEN = R.IDCONTAORCAMEN';
  if idReserva > 0 then begin
    sSQL := sSQL + ' AND R.IDRESERVAORCAMEN = ' + IntToStr(idReserva);
  end else begin
    if NumReserva > 0 then begin
      sSQL := sSQL + ' AND R.NUMRESERVA = ' + IntToStr(NumReserva);
    end;
  end;

  try
    FCdsAux.Data := GetDataPacket(sSQL);
    if FCdsAux.IsEmpty then begin
      Result := '';
      if bMostraMsg then begin
         MessageInfo := 'Reserva Orçamentária não existe';
      end;
    end else begin
      Result := FCdsAux.FieldByname('CODCENTRORESPON').AsString;
    end;
  except
    Result := '';
  end;

end;


{------------------------------------------------------------------------------}
{  TOrcamentoBackMT.BuscaIdNumReserva                                          }
{                                                                              }
{  Função que retorna ou o sequencial ou o número da reserva, dependendo de    }
{  qual dos dois foi passado como parâmetro                                    }
{  Parâmetros passados para a Função :                                         }
{                                                                              }
{   idReserva - sequence da Reserva/Compromisso                                }
{   NumReserva - número da Reserva/Compromisso                                 }
{   bExibeMsg - flag indicativa se a função deve ou não gerar mensagens de erro}
{                                                                              }
{  Resultados possíveis da Função :                                            }
{   inteiro contendo o sequence ou o número da reserva                         }
{                                                                              }
{------------------------------------------------------------------------------}

function TOrcamentoBackMT.BuscaIdNumReserva(const idReserva, NumReserva:Integer;
  const bMostraMsg:Boolean):Integer;
var sSQL: String;
begin

  sSQL := 'SELECT R.IDRESERVAORCAMEN, R.NUMRESERVA, C.CODCENTRORESPON FROM RESERVAORCAMEN R, CONTASORCAMEN C ' +
          'WHERE R.IDPESSOA =' + IntToStr( idEmpresa) +
          ' AND C.IDPLANOORCAMEN = R.IDPLANOORCAMEN' +
          ' AND C.IDCONTAORCAMEN = R.IDCONTAORCAMEN';
  if idReserva > 0 then begin
    sSQL := sSQL + ' AND R.IDRESERVAORCAMEN = ' + IntToStr(idReserva);
  end else begin
    if NumReserva > 0 then begin
      sSQL := sSQL + ' AND R.NUMRESERVA = ' + IntToStr(NumReserva);
    end;
  end;

  try
    FCdsAux.Data := GetDataPacket(sSQL);
    if FCdsAux.IsEmpty then begin
      Result := 0;
      if bMostraMsg then begin
         MessageInfo := 'Reserva Orçamentária não existe';
      end;
    end else begin
      if idReserva > 0 then begin
        Result := FCdsAux.FieldByname('NUMRESERVA').AsInteger;
      end else begin
        Result := FCdsAux.FieldByname('IDRESERVAORCAMEN').AsInteger;
      end;
    end;
  except
    Result := 0;
  end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBackMT.VerificaContaAtiva                                         }
{                                                                              }
{  Função que verifica se uma conta está ativa ou não para movimentações       }
{                                                                              }
{  Parâmetros passados para a Função :                                         }
{                                                                              }
{   iPlanoOrc - plano orçamentário                                             }
{   sContaOrcamen - conta orçamentária                                         }
{                                                                              }
{  Resultados possíveis da Função :                                            }
{   true / false                                                               }
{                                                                              }
{------------------------------------------------------------------------------}

function TOrcamentoBackMT.VerificaContaAtiva(iPlanoOrc:Integer;
  sContaOrcamen: String):boolean;
var sSQL: String;
begin
  sSQL := 'SELECT ' +
          '   FLGATIVA, DATAATIVA, DATAINATIVA ' +
          'FROM ' +
          '   CONTASORCAMEN ' +
          'WHERE ' +
          '   (IDCONTAORCAMEN = ''' + sContaOrcamen + ''') AND  ' +
          '   (IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc) + ')';
  with FCdsAux do begin
    Data := GetDataPacket(sSQL);
    if FieldByName('FLGATIVA').isNull then begin
      result := true;
    end else begin
      if FieldByName('FLGATIVA').asString = 'S' then begin
        result := true;
      end else begin
        result := false;
      end;
    end;
  end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBackMT.VerificaSaldoProcesso                                      }
{                                                                              }
{  Função que verifica se uma conta está com saldo ou não no período escolhido }
{  para a rtealização de processos                                             }
{                                                                              }
{  Parâmetros passados para a Função :                                         }
{                                                                              }
{   iPlanoOrc - plano orçamentário                                             }
{   sContaOrcamen - conta orçamentária                                         }
{   iExercicio - exercício orçamentário                                        }
{   iPeríodo - periodo orçamentário                                            }
{   rValor - valor do processo                                                 }
{   bExibeMsg - flag indicativa se a função deve ou não gerar mensagens de erro}
{                                                                              }
{  Resultados possíveis da Função :                                            }
{   true / false                                                               }
{                                                                              }
{------------------------------------------------------------------------------}
Function TOrcamentoBackMT.VerificaSaldoProcesso( iPlanoOrc     : Integer;
                                                 sContaOrcamen : String;
                                                 iExercicio,
                                                 iPeriodo      : Integer;
                                                 rValor        : Extended;
                                                 bMostraMsg    : Boolean ) : Boolean;
Var
  sTipoSaldo,
  sVerificaSaldo,
  sSQL           : String;
Begin
  //Verifica na tabela de Parâmetros como deverá ser tratado o Saldo
  sSQL := 'SELECT FLGTIPOSALDO, FLGVERIFICASALDO FROM PARAMORCAMENTO ' +
          'WHERE IDPESSOA = ' + IntToStr(idEmpresa);
  with FCdsAux do begin
    Data := GetDataPacket(sSQL);
    if FieldByName('FLGVERIFICASALDO').isNull then begin
      sVerificaSaldo := 'N';
    end else begin
      sVerificaSaldo := FieldByName('FLGVERIFICASALDO').asString;
    end;
    if FieldByName('FLGTIPOSALDO').isNull then begin
      sTipoSaldo := 'P';
    end else begin
      sTipoSaldo := FieldByName('FLGTIPOSALDO').asString;
    end;
  end;
  //Verifica a tabela de Saldos para ver se a reserva pode ser
  //feita com o Saldo corrente
  sSQL := 'SELECT SUM( NVL( VLRORCADO      , 0) ) AS VALOR1,' + #13 + #10 +
          '       SUM( NVL( VLRCOMPROMETIDO, 0) ) AS VALOR2,' + #13 + #10 +
          '       SUM( NVL( VLRRESERVADO   , 0) ) AS VALOR3 ' + #13 + #10 +
          'FROM SALDOORCADO '                                 + #13 + #10 +
          'WHERE  (IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc) + ') AND '  + #13 + #10 +
          '       (IDCONTAORCAMEN = ''' + sContaOrcamen + ''') AND '    + #13 + #10 +
          '       (IDPESSOA = ' + IntToStr( idEmpresa) + ') AND '       + #13 + #10;
  if iPeriodo <> 0 then //Brunno Mattos - KTN 1121572 - SOL 151865
    case sTipoSaldo[1] of
      'P' : begin
            sSQL := sSQL + '(EXERCICIO = ' + IntToStr(iExercicio) + ') AND ' +
                           '(PERIODO = ' + IntToStr(iPeriodo) + ')';
            end;
      'E' : begin
            sSQL := sSQL + '(EXERCICIO = ' + IntToStr(iExercicio) + ')';
            end;
      'A' : begin
            sSQL := sSQL + '(EXERCICIO = ' + IntToStr(iExercicio) + ') AND ' +
                           '(PERIODO <= ' + IntToStr(iPeriodo) + ')';
            end;
    end
   //Brunno Mattos - KTN 1121572 - SOL 151865 Inicio
    else
      sSQL := sSQL + ' WHERE PERIODO >= 1 AND PERIODO <= 12';
   //Brunno Mattos - KTN 1121572 - SOL 151865 Fim

  with FCdsSaldoProcesso do begin
    Data := GetDataPacket(sSQL);
    if StrToFloat(Format('%15.2f', [( FieldByName('VALOR1').asFloat -
                                    ( FieldByName('VALOR2').asFloat + FieldByName('VALOR3').asFloat))]))
       < StrToFloat(Format('%15.2f', [rValor])) then begin
      if bMostraMsg then begin
         MessageInfo := 'Não existe saldo suficiente para esta Reserva.';
      end;
      Close;
      Result := false;
    end else begin
      Result := true;
    end;
  end;
end;



//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    TOrcamentoBackMT.BuscaContaOrcamen
//
// Função que verifica se uma conta está apta a ter processos nela
//
// Parâmetros passados para a Função :
//
//    iPlanoOrc         - plano orçamentário
//    sContaOrcamen     - conta orçamentária
//    bExibeMsg         - flag indicativa se a função deve ou não gerar mensagens de erro
//    bProcessso        - flag indicativa se a busca é para um processo ou não
//    sNomeConta        - nome da Conta Orçamentária
//    sCodCentroRespon  - código do Centro de Responsabilidade da Conta
//    sNomeCentroRespon - nome do Centro de Responsabilidade da Conta
//    sCodGrupoConta    - codigo do Grupo da Conta
//    sNomeGrupoConta   - nome do Grupo da Conta
//
// Resultados possíveis da Função :
//    0 - conta ok
//    1 - código da conta não existe
//    2 - conta inativa
//    3 - conta bloqueada para este usuário
//    4 - no caso de consulta para processos, a conta não é do tipo "X" (RETIRADA)
//
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------

function TOrcamentoBackMT.BuscaContaOrcamen(const iPlanoOrc           : Integer;
                                            const sContaOrcamen       : String;
                                            const bMostraMsg          : Boolean;
                                            const bProcesso           : Boolean;
                                            var   sNomeConta          : String;
                                            var   sCodCentroRespon    : String;
                                            var   sNomeCentroRespon   : String;
                                            var   sCodGrupo           : String;
                                            var   sNomeGrupo          : String;
                                            var   sUnid               : String;
                                            var   sPPrev              : String;
                                            var   sCCusto             : String;
                                            var   sPatro              : String
                                           ): Integer;
var
   sSQL : String;
begin
   MessageInfo := '';

   sSQL :=
   'SELECT '                                                         +
   '   C.NOMECONTAORCAMEN,                                     '     +
   '   C.CODCENTRORESPON, R.CODEXTERNO, R.NOME, C.FLGATIVA,    '     +
   '   G.CODGRUPOORC, G.NOMEGRUPOORCAMEN, C.TIPOCALCREALIZADO, '     +
   '   C.UNIDNEGOC, C.IDPLANOPREV, C.CODCENTROCUSTO, C.IDPATRO '     +
   'FROM '                                                           +
   '   CONTASORCAMEN C, '                                            +
   '   CENTRESPON    R, '                                            +
   '   GRUPOORCAMEN  G '                                             +
   'WHERE '                                                          +
   '        C.CODCENTRORESPON = R.CODCENTRORESPON(+) '               +
   '    AND C.IDPESSOA        = R.IDPESSOA(+) '                      +
   '    AND C.IDGRUPOORCAMEN  = G.IDGRUPOORCAMEN '                   +
   '    AND C.IDCONTAORCAMEN  = ' + QuotedStr(sContaOrcamen)         +
   '    AND C.IDPLANOORCAMEN  = ' + IntToStr(iPlanoOrc);

   with FCdsBuscaConta do
   begin
      Data :=GetDataPacket(sSQL);

      if isEmpty then
      begin
         if bMostraMsg then MessageInfo := 'Não existe conta com esse código.';

         Close;
         Result := 1;
         Exit;
      end;

      if FieldByName('FLGATIVA').asString = 'I' then
      begin
         if bMostraMsg then MessageInfo := 'Conta inativa.';

         Close;
         Result := 2;
         Exit;
      end;

      if not(FieldByName('CODCENTRORESPON').isNull) then
      begin
         if not(VerificaDotacao(FieldByName('CODCENTRORESPON').AsString)) then
         begin
            if bMostraMsg then MessageInfo := 'O Usuário corrente não tem permissão para fazer um ' +
                                              'Processo nessa Conta.';
            Close;
            Result := 3;
            Exit;
         end
         else
         begin
            sCodCentroRespon  := FieldByName('CODEXTERNO').asString;
            sNomeCentroRespon := FieldByName('NOME').asString;
            sNomeConta        := FieldByName('NOMECONTAORCAMEN').asString;
            sCodGrupo         := FieldByName('CODGRUPOORC').asString;
            sNomeGrupo        := FieldByName('NOMEGRUPOORCAMEN').asString;
            sUnid             := FieldByName('UNIDNEGOC').asString;
            sPPrev            := FieldByName('IDPLANOPREV').asString;
            sCCusto           := FieldByName('CODCENTROCUSTO').asString;
            sPatro            := FieldByName('IDPATRO').asString;
            Result            := 0;
         end;
      end
      else
      begin
         sCodCentroRespon  := '';
         sNomeCentroRespon := '';
         sNomeConta        := FieldByName('NOMECONTAORCAMEN').asString;
         sCodGrupo         := FieldByName('CODGRUPOORC').asString;
         sNomeGrupo        := FieldByName('NOMEGRUPOORCAMEN').asString;
         sUnid             := FieldByName('UNIDNEGOC').asString;
         sPPrev            := FieldByName('IDPLANOPREV').asString;
         sCCusto           := FieldByName('CODCENTROCUSTO').asString;
         sPatro            := FieldByName('IDPATRO').asString;
         Result            := 0;
      end;
   end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBackMT.ExibeSaldo                                                 }
{                                                                              }
{  Função que retorna o Saldo restante em uma dada conta orçamentária          }
{                                                                              }
{  Parâmetros passados para a Função :                                         }
{                                                                              }
{   iPlanoOrc - plano orçamentário                                             }
{   iContaOrcamen - conta orçamentária                                         }
{   sData - data de referência do saldo                                        }
{   sTipoSaldo- falge de tratamento do saldo                                   }
{                                                                              }
{  Resultados possíveis da Função :                                            }
{   Valor restante de saldo na conta                                           }
{                                                                              }
{------------------------------------------------------------------------------}

function TOrcamentoBackMT.ExibeSaldo(iPlanoOrc: Integer; sContaOrcamen, sData,
  sTipoSaldo: String): double;
Var
  iPeriodo    : Integer;
  sSQL        : String;

  iExercicio,
  Mes,
  Dia         : Word;

begin

  DecodeDate( StrToDate( sData ), iExercicio, Mes, Dia );

  iPeriodo   := EncontraPeriodo(sData);
  //Verifica a tabela de Saldos para ver se a reserva pode ser feita
  //com o Saldo corrente
  sSQL := 'SELECT SUM(VLRORCADO) AS VALOR1, ' +
          '       SUM(VLRCOMPROMETIDO) AS VALOR2, ' +
          '       SUM(VLRRESERVADO) AS VALOR3 ' +
          'FROM SALDOORCADO ' +
          'WHERE  (IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc) + ') AND ' +
          '       (IDCONTAORCAMEN = ''' + sContaOrcamen + ''') AND ' +
          '       (IDPESSOA       = ' + IntToStr(idEmpresa) + ') AND ';
  case sTipoSaldo[1] of
    'P' : begin
          sSQL := sSQL + '(EXERCICIO = ' + IntToStr(iExercicio) + ') AND ' +
                         '(PERIODO = ' + IntToStr(iPeriodo) + ')';
          end;
    'E' : begin
          sSQL := sSQL + '(EXERCICIO = ' + IntToStr(iExercicio) + ')';
          end;
    'A' : begin
          sSQL := sSQL + '(EXERCICIO = ' + IntToStr(iExercicio) + ') AND ' +
                         '(PERIODO <= ' + IntToStr(iPeriodo) + ')';
          end;
  end;
  with FCdsSaldos do begin
    Data := GetDataPacket(sSQL);
    Result := (FieldByName('VALOR1').asFloat - (FieldByName('VALOR2').asFloat +
               FieldByName('VALOR3').asFloat));
  end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBackMT.VerificaSaldo                                              }
{                                                                              }
{  Função que retorna so existe ou não um registro de saldo na data            }
{                                                                              }
{  Parâmetros passados para a Função :                                         }
{                                                                              }
{   iPlanoOrc - plano orçamentário                                             }
{   iContaOrcamen - conta orçamentária                                         }
{   sData - data de referência do saldo                                        }
{                                                                              }
{  Resultados possíveis da Função :                                            }
{   true/false                                                                 }
{                                                                              }
{------------------------------------------------------------------------------}

function TOrcamentoBackMT.VerificaSaldo(iPlano   : Integer;
                                        sConta   : String;
                                        sData    : String
                                       ): Boolean;
var
   sSQL: String;
begin
   sSQL :=
   'SELECT '                                          + #13 +
   '   IDCONTAORCAMEN '                               + #13 +
   'FROM '                                            + #13 +
   '   SALDOORCADO '                                  + #13 +
   'WHERE '                                           + #13 +
   '       IDPLANOORCAMEN = ' + IntToStr(iPlano)      + #13 +
   '   AND IDCONTAORCAMEN = ''' + sConta + ''' '      + #13 +
   '   AND IDPESSOA       = ' + IntToStr(IDEmpresa)   + #13 +
   '   AND DATAREFERENCIA = TO_DATE(''' + sData + ''',''DD/MM/YYYY'')';

   with FCdsSaldos do
   begin
      Data := GetDataPacket(sSQL);
      if isEmpty then
      begin
         Result := False;
      end
      else
      begin
         Result := True;
      end;
   end;
end;



procedure TOrcamentoBackMT.AfterInitialize;
begin
   inherited;

   CReservaOrcamen.InitializeAs(self);
   CSaldoOrcado.InitializeAs(self);
   CResxComp.InitializeAs(self);
end;


// Função para buscar a Conta Orçamentária de uma Reserva ou Compromisso
function TOrcamentoBackMT.BuscaContaReservaCompromisso(
                          NumResOUComp: double): string;
var
  CdsAux : TClientDataSet;
  sSql: String;
begin
  try
    CdsAux := TClientDataSet.Create(nil);

    sSql := 'SELECT IDCONTAORCAMEN ' +
            '  FROM RESERVAORCAMEN ' +
            ' WHERE NUMRESERVA = ' + FloatToStr(NumResOUComp);

    CdsAux.Data := GetDataPacket(sSql);

    Result := CdsAux.FieldByName('IDCONTAORCAMEN').AsString;
  finally
    FreeAndNil(CdsAux);
  end;
end;







function TOrcamentoBackMT.UltimoDiaPeriodo(iExercicio,
  iPeriodo, iIdEmpresa: Integer): String;
var sSQL: String;
begin
  //Retorna o primeiro dia em um período
  sSQL := 'SELECT DATAFIMPERIODO FROM PERIODOORCAMEN ' +
          'WHERE (EXERCICIO = ' + IntToStr(iExercicio) + ') AND ' +
          '(PERIODO  = ' + IntToStr(iPeriodo) + ') AND ' +
          '(FLGBLOQUEADO = ''N'') AND ' + 
          '(IDPESSOA = ' + IntToStr(iIdEmpresa) + ')';
  with FCdsPeriodo do
  begin
    Data := GetDataPacket(sSQL);
    if isEmpty then
      result := ''
    else
      result := DateToStr(FieldByName('DATAFIMPERIODO').asDateTime);
  end;
end;

end.

