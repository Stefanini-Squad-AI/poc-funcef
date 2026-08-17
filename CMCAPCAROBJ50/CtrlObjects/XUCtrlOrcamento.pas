unit UCtrlOrcamento;

{------------------------------------------------------------------------------}
{                                                                              }
{ Funções de Integração do Orçamento com outros Sistemas                       }
{                                                                              }
{------------------------------------------------------------------------------}

interface

uses
  Windows, SysUtils, Forms, wwQuery, uMensErro, Dialogs, uMidasUtil, uDatabase, uAutorizacao, dbclient,
  uCmControlObject, uCtrlReservaorcamen, uCtrlSaldoorcado, uCtrlResxcomp, dBaseDados, uCMTypes;


Type TOrcamentoBackMT = Class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
    procedure AfterInitialize; Override;
    procedure OnCreateAppServer;Override;
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
    procedure SetCdsReservas(const Value: TClientDataSet);
    procedure SetCdsSaldoProcesso(const Value: TClientDataSet);
    procedure SetCdsBuscaConta(const Value: TClientDataSet);
  Public
    Constructor Create; Override;
    Destructor Destroy; Override;
    function MarcaReserva(iNumReserva:longint; bExibeMsg: boolean):integer;
    function EstornaReserva(iNumReserva:longint; bExibeMsg: boolean):integer;
    function CancelaReserva(iNumReserva:longint; bExibeMsg: boolean):integer;
    function CriaCompromisso(sData:string; rValor:extended; sObs:string;
      iModulo:integer; iConjuntoReservas:array of integer; bExibeMsg,
      bVeioCompra : boolean):integer;
    function EfetivaCompromisso(iNumReserva:longint; rValor:extended;
      bExibeMsg: boolean):integer;
    function VerificaCompromisso(iNumReserva:longint; rValor: extended;
      bExibeMsg: boolean):integer;
    function EstornaCompromisso(iNumReserva:longint; rValor:extended;
      bExibeMsg: boolean):integer;
    function CancelaCompromisso(iNumReserva:longint;
      bExibeMsg: boolean):integer;
    function EncontraPeriodo( sData : String ) : Integer;
    function DiasNoPeriodo(iExercicio, iPeriodo:integer):integer;
    function VerificaDotacao(sCentroRespon:string):boolean;
    function VerificaDatas (dDataIni, dDataFim : TDateTime):boolean;
    function PrimeiroDiaPeriodo(iExercicio, iPeriodo:integer):string;
    function BuscaIdNumReserva(idReserva, NumReserva:Integer;
      bMostraMsg:Boolean):Integer;
    function VerificaSaldoProcesso(iPlanoOrc:integer; sContaOrcamen: string;
      iExercicio, iPeriodo:integer; rValor:extended;
      bMostraMsg:Boolean):boolean;
    function VerificaContaAtiva(iPlanoOrc: integer;
      sContaOrcamen: string):boolean;
    function BuscaContaOrcamen(iPlanoOrc: integer; sContaOrcamen: string;
      bMostraMsg, bProcesso:Boolean; var sNomeConta, sCodCentroRespon,
      sNomeCentroRespon, sCodGrupo, sNomeGrupo, sUnid, sPPrev, sCCusto,
      sPatro:string):integer;
    function ExibeSaldo(iPlanoOrc: integer; sContaOrcamen, sData,
      sTipoSaldo: string): double;
    function VerificaSaldo(iPlano: integer; sConta, sData: string): boolean;

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
  FCdsBuscaConta    := TClientDataSet.Create(nil);
End;

Destructor TOrcamentoBackMT.Destroy;
Begin
  Inherited;
  CReservaOrcamen.Free;
  CSaldoOrcado.Free;
  CResxComp.Free;
  FreeCds([FCdsUsuXCentCusto, FCdsCompromissos, FCdsReservas, FCdsSaldos,
          FCdsPeriodo, FCdsAux, FCdsSaldoProcesso, FCdsBuscaConta]);
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

function TOrcamentoBackMT.CriaCompromisso(sData:string; rValor:extended;
  sObs:string; iModulo:integer; iConjuntoReservas:array of integer;
  bExibeMsg, bVeioCompra: boolean):integer;
var sMsg, sCodConta, sSql: string;
    iNumReservas, iPeriodo, iCodCompromisso, i: integer;
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
  //iExercicio   := StrToInt(copy (sData,7,4));

  iPeriodo     := EncontraPeriodo(sData);
  rValorTotalReservas := 0;
  bNaoEReserva        := false;
  bNaoEstaAguardando  := false;
  bNaoEMesmaConta     := false;
  sCodConta           := '';
  for i := 0 to iNumReservas do begin
    if iConjuntoReservas[i] <> 0 then begin
      sSql := 'SELECT R.IDRESERVAORCAMEN, R.NUMRESERVA, R.VLRRESERVA, ' +
              'R.FLGRESCOMP, R.FLGRESERVA, R.IDCONTAORCAMEN, ' +
              'R.IDPLANOORCAMEN, C.CODCENTRORESPON ' +
              'FROM RESERVAORCAMEN R, CONTASORCAMEN C WHERE ' +
              '(R.IDPESSOA = ' + IntToStr( idEmpresa ) + ') AND ' +
              '(R.NUMRESERVA = ' + IntToStr(iConjuntoReservas[i]) + ') AND ' +
              '(R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND ' +
              '(R.IDPLANOORCAMEN = C.IDPLANOORCAMEN)';
      with FCdsCompromissos do begin
        Data := GetDataPacket(sSql);
        if i > 0 then begin
          if sCodConta <> FieldByName('IDCONTAORCAMEN').asString then begin
            bNaoEMesmaConta := true;
          end;
        end;
        if FieldByName('FLGRESCOMP').asString = 'C' then begin
          bNaoEReserva := true;
        end;
        if (FieldByName('FLGRESERVA').asString <> 'A') and
           (FieldByName('FLGRESERVA').asString <> 'U') and
           (Not bVeioCompra) then begin
          bNaoEstaAguardando := true;
        end;
        //Rosane alterou aqui em 03/08/2002
        if (FieldByName('FLGRESERVA').asString = 'A') or
           (FieldByName('FLGRESERVA').asString = 'U') then begin
           sCodConta := FieldByName('IDCONTAORCAMEN').asString;
           rValorTotalReservas := rValorTotalReservas +
                                  FieldByName('VLRRESERVA').asFloat;
        end;
      end;
    end;
  end;
  if rValorTotalReservas < rValor then begin
    if not VerificaSaldoProcesso
       (FCdsCompromissos.FieldByName('IDPLANOORCAMEN').asInteger,
       FCdsCompromissos.FieldByName('IDCONTAORCAMEN').asString, iExercicio,
       iPeriodo, (rValor - rValorTotalReservas), true) then begin
      //Rosane alterou aqui em 03/08/2002
      sMsg := 'Não há saldo no orçamento para esta operação';
      result := -1;
    end;
  end;
  if bNaoEReserva then begin
    sMsg := 'Existem Compromissos para estas Reservas.';
    Result := -2;
  end;
  if bNaoEstaAguardando then begin
    sMsg := 'Existem Reservas Canceladas ou Efetivadas.';
    Result := -3;
  end;
  if bNaoEMesmaConta then begin
    sMsg := 'Existem Reservas com Contas Orçamentárias diferentes.';
    Result := -4;
  end;
  if Result < 0 then begin
    if bExibeMsg then begin
      if sMsg <> '' then begin
         MessageInfo := sMsg;
      end;
    end;
    Exit;
  end;
  //Cria o número do próximo compromisso
  sSql := 'SELECT MAX(NUMRESERVA) AS PROXIMA FROM RESERVAORCAMEN ' +
          'WHERE IDPESSOA = ' + IntToStr( idEmpresa );
  with FCdsAux do begin
    Data := GetDataPacket(sSql);
    iCodCompromisso := FieldByName('PROXIMA').asInteger + 1;
    Close;
  end;
  iIdCompromisso := GetSequence( 'RESERVAORCAMEN' );
  if rValor = 0 then rValor := rValorTotalReservas;
  try
    //Cria o Compromisso
    CReservaOrcamen.CriaCompromisso(iIdCompromisso, idEmpresa,
       iExercicio,iPeriodo,
       FCdsCompromissos.FieldByName('IDPLANOORCAMEN').asInteger,iIdCompromisso,
       iModulo,FCdsCompromissos.FieldByName('IDCONTAORCAMEN').asString,sData,
       sObs,rValor);
    //Cria o Relacionamento entre o novo Compromisso e as reservas antigas
    for i := 0 to iNumReservas do begin
      if iConjuntoReservas[i] <> 0 then begin
        sSql := 'SELECT R.IDRESERVAORCAMEN, R.NUMRESERVA, R.VLRRESERVA, ' +
                'R.FLGRESCOMP, R.FLGRESERVA, R.IDCONTAORCAMEN, ' +
                'R.IDPLANOORCAMEN, C.CODCENTRORESPON ' +
                'FROM RESERVAORCAMEN R, CONTASORCAMEN C WHERE ' +
                '(R.IDPESSOA = ' + IntToStr( idEmpresa ) + ') AND ' +
                '(R.NUMRESERVA = ' + IntToStr(iConjuntoReservas[i]) +
                ') AND ' + '(R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND ' +
                '(R.IDPLANOORCAMEN = C.IDPLANOORCAMEN)';
        FCdsCompromissos.Data := GetDataPacket(sSql);
        if (FCdsCompromissos.FieldByName('FLGRESERVA').asString = 'A') or
           (FCdsCompromissos.FieldByName('FLGRESERVA').asString = 'U') then
           begin
          CResxComp.Inserir( GetSequence( 'RESXCOMP' ), idEmpresa,
                    FCdsCompromissos.FieldByName('IDRESERVAORCAMEN').AsInteger,
                    iIdCompromisso);
          //Marca as reservas como efetivadas
          CReservaOrcamen.AtualizaFLGRESERVA
                          ('E', idEmpresa,iConjuntoReservas[i]);
        end;
      end;
    end;
    //Retira o Valor do Saldo Reservado e inclui no Compromissado
    CSaldoOrcado.TrocaSaldoReservadopCompromissado(rValorTotalReservas,rValor,
                 idEmpresa,
                 FCdsCompromissos.FieldByName('IDPLANOORCAMEN').asInteger,
                 PrimeiroDiaPeriodo(iExercicio,iPeriodo),
                 FCdsCompromissos.FieldByName('IDCONTAORCAMEN').asString);
    result := iCodCompromisso;
    sMsg := 'O Compromisso nº ' + IntToStr(iCodCompromisso) +
            ' foi criado com sucesso.';
  except
    result := -5;
    sMsg   := 'Houve um erro inesperado no Banco de Dados';
  end;
  if bExibeMsg then begin
    if sMsg <> '' then begin
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
  bExibeMsg: boolean):integer;
var sMsg, sSql: string;
begin
  //Função que procede com a marcação da Reserva para "Em Uso - U"
  sSql := 'SELECT R.FLGRESERVA, R.FLGRESCOMP, C.CODCENTRORESPON ' +
          'FROM RESERVAORCAMEN R, CONTASORCAMEN C ' +
          'WHERE (R.NUMRESERVA = ' + IntToStr(iNumReserva) + ') AND ' +
          '(R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND ' +
          '(R.IDPLANOORCAMEN = C.IDPLANOORCAMEN) AND ' +
          '(R.IDPESSOA = ' + IntToStr( idEmpresa) + ')';
  with FCdsReservas do begin
    Data := GetDataPacket(sSql);
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
  bExibeMsg: boolean):integer;
var sMsg, sSql: string;
begin
  //Função que procede com o Estorno da Reserva
  sSql := 'SELECT R.FLGRESERVA, R.FLGRESCOMP, C.CODCENTRORESPON ' +
          'FROM RESERVAORCAMEN R, CONTASORCAMEN C ' +
          'WHERE (R.NUMRESERVA = ' + IntToStr(iNumReserva) + ') AND ' +
          '(R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND ' +
          '(R.IDPLANOORCAMEN = C.IDPLANOORCAMEN) AND ' +
          '(R.IDPESSOA = ' + IntToStr( idEmpresa) + ')';
  with FCdsReservas do begin
    Data := GetDataPacket(sSql);
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
  bExibeMsg: boolean):integer;
var sMsg, sSql: string;
begin
  //Função que procede com o Cancelamento da Reserva
  sSql := 'SELECT R.FLGRESERVA, R.FLGRESCOMP, C.CODCENTRORESPON, ' +
          'R.EXERCICIO, R.PERIODO, R.VLRRESERVA ' +
          'FROM RESERVAORCAMEN R, CONTASORCAMEN C ' +
          'WHERE (R.NUMRESERVA = ' + IntToStr(iNumReserva) + ') AND ' +
          '(R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND ' +
          '(R.IDPLANOORCAMEN = C.IDPLANOORCAMEN) AND ' +
          '(R.IDPESSOA = ' + IntToStr( idEmpresa) + ')';
  with FCdsReservas do begin
    Data := GetDataPacket(sSql);
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
  rValor:extended; bExibeMsg: boolean):integer;
var sMsg, sSql: string;
begin
  //Função que procede com o estorno do Compromisso Orçamentário
  sSql := 'SELECT R.FLGRESERVA, R.FLGRESCOMP, C.CODCENTRORESPON, ' +
          'R.VLRRESERVA, R.VLRCOMPROMISSO, R.EXERCICIO, R.PERIODO, ' +
          'R.IDPLANOORCAMEN, R.IDCONTAORCAMEN ' +
          'FROM RESERVAORCAMEN R, CONTASORCAMEN C ' +
          'WHERE (R.NUMRESERVA = ' + IntToStr(iNumReserva) + ') AND ' +
          '(R.IDPESSOA   = ' + IntToStr( IdEmpresa) + ') AND ' +
          '(R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND ' +
          '(R.IDPLANOORCAMEN = C.IDPLANOORCAMEN)';
  with FCdsCompromissos do begin
    Data := GetDataPacket(sSql);
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

function TOrcamentoBackMT.CancelaCompromisso(iNumReserva:longint;
  bExibeMsg: boolean):integer;
var sMsg, sSql: string;
begin
  //Função que procede com o cancelamento do Compromisso Orçamentário
  sSql := 'SELECT R.FLGRESERVA, R.FLGRESCOMP, C.CODCENTRORESPON, ' +
          'R.VLRRESERVA, R.VLRCOMPROMISSO, R.EXERCICIO, R.PERIODO, ' +
          'R.IDPLANOORCAMEN, R.IDCONTAORCAMEN ' +
          'FROM RESERVAORCAMEN R, CONTASORCAMEN C ' +
          'WHERE (R.NUMRESERVA = ' + IntToStr(iNumReserva) + ') AND ' +
          '(R.IDPESSOA = ' + IntToStr( idEmpresa) + ') AND ' +
          '(R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND  ' +
          '(R.IDPLANOORCAMEN = C.IDPLANOORCAMEN)';
  with FCdsCompromissos do begin
    Data := GetDataPacket(sSql);
    if not VerificaDotacao(FieldByName('CODCENTRORESPON').asString) then begin
      //O Usuário Corrente não tem alçada nesse centro de responsabilidade
      //para cancelar o compromisso
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
          try
            CReservaOrcamen.AtualizaFLGRESERVA('C', idEmpresa,iNumReserva);
            //Retira o Valor do Saldo Comprometido
            CSaldoOrcado.RetiraValor(FieldByName('VLRRESERVA').asInteger,
                  idEmpresa,FieldByName('IDPLANOORCAMEN').asInteger,
                  PrimeiroDiaPeriodo(FieldByName('EXERCICIO').asInteger,
                  FieldByName('PERIODO').asInteger),
                  FieldByName('IDCONTAORCAMEN').asString,'C');
            //O cancelamento foi realizada com sucesso
            result := 0;
          except
            //Ocorreu um erro inesperado no Banco de Dados
            result := 5;
          end;
        end;
      end;
    end;
  end;
  if bExibeMsg then begin
    case Result of
      1 : sMsg := 'Usuário corrente sem alçada para o Cancelamento';
      2 : sMsg := 'O número enviado é de uma Reserva Orçamentária, ' +
                  'não de um Compromisso';
      3 : sMsg := 'O número enviado é de um Compromisso já Cancelado';
      5 : sMsg := 'Houve um erro inesperado no Banco de Dados';
      else sMsg := '';
    end;
    if sMsg <> '' then begin
       MessageInfo := sMsg;
    end;
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
  rValor:extended; bExibeMsg: boolean):integer;
var sMsg, sSql: string;
    efetivacompromisso: boolean;
begin
  //Função que procede com a efetivação do Compromisso Orçamentário
  sSql := 'SELECT R.FLGRESERVA, R.FLGRESCOMP, C.CODCENTRORESPON, ' +
          'R.VLRRESERVA, R.VLRCOMPROMISSO, R.EXERCICIO, R.PERIODO, ' +
          'R.IDPLANOORCAMEN, R.IDCONTAORCAMEN ' +
          'FROM RESERVAORCAMEN R, CONTASORCAMEN C ' +
          'WHERE (R.NUMRESERVA = ' + IntToStr(iNumReserva) + ') AND ' +
          '(R.IDPESSOA = ' + IntToStr( idEmpresa) + ') AND ' +
          '(R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND ' +
          '(R.IDPLANOORCAMEN = C.IDPLANOORCAMEN)';
  with FCdsCompromissos do begin
    Data := GetDataPacket(sSql);
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
                try
                  if Format('%17.2f', [(rValor + FieldByName('VLRCOMPROMISSO').asFloat)]) =
                     Format('%17.2f', [FieldByName('VLRRESERVA').asFloat]) then
                     begin
                    efetivacompromisso := True;
                  end else begin
                    efetivacompromisso := False;
                  end;
                  CReservaOrcamen.CompromissoAguardando( rValor,    iNumReserva,
                                                         idEmpresa, efetivacompromisso );
                  result := 0;
                except
                  //Ocorreu um erro inesperado no Banco de Dados
                  result := 5;
                end;
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
      1 : sMsg := 'Usuário corrente sem alçada para a Efetivação';
      2 : sMsg := 'O número enviado é de uma Reserva Orçamentária, ' +
                  'não de um Compromisso';
      3 : sMsg := 'O número enviado é de um Compromisso já Cancelado';
      4 : sMsg := 'O número enviado é de um Compromisso já Efetivado';
      5 : sMsg := 'Houve um erro inesperado no Banco de Dados';
      6 : sMsg := 'O valor é maior que o valor do compromisso';
      else sMsg := '';
    end;
    if sMsg <> '' then begin
       MessageInfo :=sMsg;
    end;
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
  rValor:extended; bExibeMsg: boolean):integer;
var sMsg, sSql: string;
begin
  //Função que procede com a verificação do Compromisso Orçamentário
  sSql := 'SELECT R.FLGRESERVA, R.FLGRESCOMP, C.CODCENTRORESPON, ' +
          'R.VLRRESERVA, R.VLRCOMPROMISSO, R.EXERCICIO, R.PERIODO, ' +
          'R.IDPLANOORCAMEN, R.IDCONTAORCAMEN ' +
          'FROM RESERVAORCAMEN R, CONTASORCAMEN C ' +
          'WHERE (R.NUMRESERVA = ' + IntToStr(iNumReserva) + ') AND ' +
          '(R.IDPESSOA = ' + IntToStr( idEmpresa) + ') AND ' +
          '(R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND ' +
          '(R.IDPLANOORCAMEN = C.IDPLANOORCAMEN)';
  with FCdsCompromissos do begin
    Data := GetDataPacket(sSql);
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
Function TOrcamentoBackMT.EncontraPeriodo( sData : String ):integer;
Var
  sSql: string;

  iExercicio,
  Mes,
  Dia         : Word;

Begin

  DecodeDate( StrToDate( sData ), iExercicio, Mes, Dia );
  //Encontra o Periodo a partir da data de Referencia
  //iExercicio := StrToInt(copy (sData,7,4));
  sSql := 'SELECT PERIODO FROM PERIODOORCAMEN ' +
          'WHERE (DATAINIPERIODO <= TO_DATE(''' + sData + ''',''DD/MM/YYYY''))'
          + ' AND (DATAFIMPERIODO >= TO_DATE(''' + sData + ''',''DD/MM/YYYY''))'
          + ' AND (EXERCICIO = ' + IntToStr(iExercicio) + ') AND ' +
          '(IDPESSOA  = ' + IntToStr( IdEmpresa) + ')';
  with FCdsPeriodo do begin
    Data := GetDataPacket(sSql);
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

function TOrcamentoBackMT.DiasNoPeriodo(iExercicio, iPeriodo:integer):integer;
var sSql: string;
begin
  //Retorna quantos dias um período tem
  sSql := 'SELECT DATAINIPERIODO, DATAFIMPERIODO FROM PERIODOORCAMEN ' +
          'WHERE (EXERCICIO = ' + IntToStr(iExercicio) + ') AND ' +
          '(PERIODO  = ' + IntToStr(iPeriodo) + ') AND ' +
          '(IDPESSOA = ' + IntToStr( IdEmpresa) + ')';
  with FCdsPeriodo do begin
    Data := GetDataPacket(sSql);
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
{   string contendo a data do primeiro dia do período orçamentário             }
{                                                                              }
{------------------------------------------------------------------------------}

function TOrcamentoBackMT.PrimeiroDiaPeriodo(iExercicio,
  iPeriodo:integer):string;
var sSql: string;
begin
  //Retorna o primeiro dia em um período
  sSql := 'SELECT DATAINIPERIODO FROM PERIODOORCAMEN ' +
          'WHERE (EXERCICIO = ' + IntToStr(iExercicio) + ') AND ' +
          '(PERIODO  = ' + IntToStr(iPeriodo) + ') AND ' +
          '(IDPESSOA = ' + IntToStr( IdEmpresa) + ')';
  with FCdsPeriodo do begin
    Data := GetDataPacket(sSql);
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

function TOrcamentoBackMT.VerificaDotacao(sCentroRespon:string):boolean;
var sSql: string;
begin
  //Verifica a tabela de Usuarios x Centros de Resp.
  //para saber se pode ser feita a reserva
  result := true;
  if sCentroRespon <> '' then begin
    sSql := 'SELECT IDPESSOAACESSO FROM PESSOAXCRESP ' +
            'WHERE (IDPESSOAACESSO = ' + IntToStr( IdUsuario ) +
            ') AND ' + '(RTRIM(CODCENTRORESPON) = ''' + sCentroRespon +
            ''') AND ' + '(IDPESSOA = ' + IntToStr( IdEmpresa) + ')';
    with FCdsUsuXCentCusto do begin
      Data := GetDataPacket(sSql);
      if isEmpty then begin
        result := false;
      end;
    end;
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

function TOrcamentoBackMT.BuscaIdNumReserva(idReserva, NumReserva:Integer;
  bMostraMsg:Boolean):Integer;
var sSql: String;
begin
  sSql := 'SELECT IDRESERVAORCAMEN, NUMRESERVA FROM RESERVAORCAMEN ' +
          'WHERE IDPESSOA =' + IntToStr( idEmpresa);
  if idReserva > 0 then begin
    sSql := sSql + ' AND IDRESERVAORCAMEN = ' + IntToStr(idReserva);
  end else begin
    if NumReserva > 0 then begin
      sSql := sSql + ' AND NUMRESERVA = ' + IntToStr(NumReserva);
    end;
  end;
  try
    FCdsAux.Data := GetDataPacket(sSql);
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

function TOrcamentoBackMT.VerificaContaAtiva(iPlanoOrc:integer;
  sContaOrcamen: string):boolean;
var sSql: string;
begin
  sSql := 'SELECT ' +
          '   FLGATIVA, DATAATIVA, DATAINATIVA ' +
          'FROM ' +
          '   CONTASORCAMEN ' +
          'WHERE ' +
          '   (IDCONTAORCAMEN = ''' + sContaOrcamen + ''') AND  ' +
          '   (IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc) + ')';
  with FCdsAux do begin
    Data := GetDataPacket(sSql);
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
  sSql           : string;
Begin
  //Verifica na tabela de Parâmetros como deverá ser tratado o Saldo
  sSql := 'SELECT FLGTIPOSALDO, FLGVERIFICASALDO FROM PARAMORCAMENTO ' +
          'WHERE IDPESSOA = ' + IntToStr(idEmpresa);
  with FCdsAux do begin
    Data := GetDataPacket(sSql);
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
  sSql := 'SELECT SUM( NVL( VLRORCADO      , 0) ) AS VALOR1,' + #13 + #10 +
          '       SUM( NVL( VLRCOMPROMETIDO, 0) ) AS VALOR2,' + #13 + #10 +
          '       SUM( NVL( VLRRESERVADO   , 0) ) AS VALOR3 ' + #13 + #10 +
          'FROM SALDOORCADO '                                 + #13 + #10 +
          'WHERE  (IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc) + ') AND '  + #13 + #10 +
          '       (IDCONTAORCAMEN = ''' + sContaOrcamen + ''') AND '    + #13 + #10 +
          '       (IDPESSOA = ' + IntToStr( idEmpresa) + ') AND '       + #13 + #10;
  case sTipoSaldo[1] of
    'P' : begin
          sSql := sSql + '(EXERCICIO = ' + IntToStr(iExercicio) + ') AND ' +
                         '(PERIODO = ' + IntToStr(iPeriodo) + ')';
          end;
    'E' : begin
          sSql := sSql + '(EXERCICIO = ' + IntToStr(iExercicio) + ')';
          end;
    'A' : begin
          sSql := sSql + '(EXERCICIO = ' + IntToStr(iExercicio) + ') AND ' +
                         '(PERIODO <= ' + IntToStr(iPeriodo) + ')';
          end;
  end;
  with FCdsSaldoProcesso do begin
    Data := GetDataPacket(sSql);
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



{------------------------------------------------------------------------------}
{  TOrcamentoBackMT.BuscaContaOrcamen                                          }
{                                                                              }
{  Função que verifica se uma conta está apta a ter processos nela             }
{                                                                              }
{  Parâmetros passados para a Função :                                         }
{                                                                              }
{   iPlanoOrc - plano orçamentário                                             }
{   sContaOrcamen - conta orçamentária                                         }
{   bExibeMsg - flag indicativa se a função deve ou não gerar mensagens de erro}
{   bProcessso - flag indicativa se a busca é para um processo ou não          }
{   sNomeConta- nome da Conta Orçamentária                                     }
{   sCodCentroRespon- código do Centro de Responsabilidade da Conta            }
{   sNomeCentroRespon- nome do Centro de Responsabilidade da Conta             }
{   sCodGrupoConta- codigo do Grupo da Conta                                   }
{   sNomeGrupoConta- nome do Grupo da Conta                                    }
{                                                                              }
{  Resultados possíveis da Função :                                            }
{   0 - conta ok                                                               }
{   1 - código da conta não existe                                             }
{   2 - conta inativa                                                          }
{   3 - conta bloqueada para este usuário                                      }
{   4 - no caso de consulta para processos, a conta não é do tipo "X"          }
{                                                                              }
{------------------------------------------------------------------------------}

function TOrcamentoBackMT.BuscaContaOrcamen(iPlanoOrc: integer;
  sContaOrcamen: string; bMostraMsg, bProcesso:Boolean; var sNomeConta,
  sCodCentroRespon, sNomeCentroRespon, sCodGrupo, sNomeGrupo, sUnid, sPPrev,
  sCCusto, sPatro:string):integer;
var sSql: string;
begin
  MessageInfo := '';
  sSql := 'SELECT ' +
          '   C.NOMECONTAORCAMEN, C.CODCENTRORESPON, R.NOME, C.FLGATIVA, ' +
          '   G.CODGRUPOORC, G.NOMEGRUPOORCAMEN, C.TIPOCALCREALIZADO, ' +
          '   C.UNIDNEGOC, C.IDPLANOPREV, C.CODCENTROCUSTO, C.IDPATRO ' +
          'FROM ' +
          '   CONTASORCAMEN C, CENTRESPON R, GRUPOORCAMEN G ' +
          'WHERE ' +
          '   (R.CODCENTRORESPON(+) = C.CODCENTRORESPON) AND ' +
          '   (R.IDPESSOA(+) = C.IDPESSOA) AND ' +
          '   (G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN) AND ' +
          '   (C.IDCONTAORCAMEN = ''' + sContaOrcamen + ''') AND  ' +
          '   (C.IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc) + ')';
  with FCdsBuscaConta do begin
        Data :=GetDataPacket(sSql);
    if isEmpty then begin
      if bMostraMsg then begin
         MessageInfo := 'Não existe conta com esse código.';
      end;
      Close;
      Result := 1;
      Exit;
    end;
    if FieldByName('FLGATIVA').asString = 'I' then begin
      if bMostraMsg then begin
        MessageInfo := 'Conta inativa.';
      end;
      Close;
      Result := 2;
      Exit;
    end;
    if bProcesso then begin
      if FieldByName('TIPOCALCREALIZADO').asString <> 'X' then begin
        if bMostraMsg then begin
           MessageInfo := 'Somente Contas com o Cálculo do Realizado do tipo ' +
             '"Fluxo de Caixa" podem ter Reservas.';
        end;
        Close;
        Result := 4;
        Exit;
      end;
    end;
    if not FieldByName('CODCENTRORESPON').isNull then begin
      if not VerificaDotacao(FieldByName('CODCENTRORESPON').asString) then begin
        if bMostraMsg then begin
           MessageInfo := 'O Usuário corrente não tem permissão para fazer um ' +
                          'Processo nessa Conta.';
        end;
        Close;
        Result := 3;
        Exit;
      end else begin
        sCodCentroRespon  := FieldByName('CODCENTRORESPON').asString;
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
    end else begin
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

function TOrcamentoBackMT.ExibeSaldo(iPlanoOrc: integer; sContaOrcamen, sData,
  sTipoSaldo: string): double;
Var
  iPeriodo    : Integer;
  sSql        : String;

  iExercicio,
  Mes,
  Dia         : Word;

begin

  DecodeDate( StrToDate( sData ), iExercicio, Mes, Dia );

  //iExercicio := StrToInt(copy(sData,7,4));
  iPeriodo   := EncontraPeriodo(sData);
  //Verifica a tabela de Saldos para ver se a reserva pode ser feita
  //com o Saldo corrente
  sSql := 'SELECT SUM(VLRORCADO) AS VALOR1, ' +
          '       SUM(VLRCOMPROMETIDO) AS VALOR2, ' +
          '       SUM(VLRRESERVADO) AS VALOR3 ' +
          'FROM SALDOORCADO ' +
          'WHERE  (IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc) + ') AND ' +
          '       (IDCONTAORCAMEN = ''' + sContaOrcamen + ''') AND ' +
          '       (IDPESSOA       = ' + IntToStr(idEmpresa) + ') AND ';
  case sTipoSaldo[1] of
    'P' : begin
          sSql := sSql + '(EXERCICIO = ' + IntToStr(iExercicio) + ') AND ' +
                         '(PERIODO = ' + IntToStr(iPeriodo) + ')';
          end;
    'E' : begin
          sSql := sSql + '(EXERCICIO = ' + IntToStr(iExercicio) + ')';
          end;
    'A' : begin
          sSql := sSql + '(EXERCICIO = ' + IntToStr(iExercicio) + ') AND ' +
                         '(PERIODO <= ' + IntToStr(iPeriodo) + ')';
          end;
  end;
  with FCdsSaldos do begin
    Data := GetDataPacket(sSql);
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

function TOrcamentoBackMT.VerificaSaldo(iPlano: integer; sConta,
  sData: string): boolean;
var sSql: string;
begin
  sSql := 'SELECT IDCONTAORCAMEN ' +
          'FROM SALDOORCADO ' +
          'WHERE  (IDPLANOORCAMEN = ' + IntToStr(iPlano) + ') AND ' +
          '       (IDCONTAORCAMEN = ''' + sConta + ''') AND ' +
          '       (IDPESSOA       = ' + IntToStr( idEmpresa) + ') AND ' +
          '       (DATAREFERENCIA = TO_DATE(''' + sData + ''',''DD/MM/YYYY''))';
  with FCdsSaldos do begin
    Data := GetDataPacket(sSql);
    if isEmpty then begin
      result := false;
    end else begin
      result := true;
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


end.

