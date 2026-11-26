unit UOrcamento;

{ -----------------------------------------------------------------------------}
{                                                                              }
{ Funções de Integração do Orçamento com outros Sistemas                       }
{                                                                              }
{ Autor : Antônio Jorge M.Rodrigues                                            }
{ Data de Início  : 08/02/99                                                   }
{ Data de Término : 23/06/99                                                   }
{                                                                              }
{ -----------------------------------------------------------------------------}

interface

uses Windows, SysUtils, Forms, wwQuery, uSistema, uMensErro, Dialogs,
     uDatabase, uAutorizacao;

Type TOrcamentoBack = Class
  Private
    FqryPeriodo, FqryUsuXCentCusto, FqryCompromissos, FqrySaldos, FqryAux,
    FqryReservas, FqrySaldoProcesso, FqryBuscaConta: TwwQuery;
    FNumReserva, FIdReserva: Integer;
    FValorReserva: Real;
  Public
    Constructor Create;
    Destructor Destroy; Override;
    function MarcaReserva(iNumReserva:longint; bExibeMsg: boolean):integer;
    function EstornaReserva(iNumReserva:longint; bExibeMsg: boolean):integer;
    function CancelaReserva(iNumReserva:longint; bExibeMsg: boolean):integer;
    function CriaCompromisso(sData:string; rValor:extended; sObs:string; iModulo:integer; iConjuntoReservas:array of integer; bExibeMsg, bVeioCompra : boolean):integer;
    function EfetivaCompromisso(iNumReserva:longint; rValor:extended; bExibeMsg: boolean):integer;
    function VerificaCompromisso(iNumReserva:longint; rValor: extended; bExibeMsg: boolean):integer;
    function EstornaCompromisso(iNumReserva:longint; rValor:extended; bExibeMsg: boolean):integer;
    function CancelaCompromisso(iNumReserva:longint; bExibeMsg: boolean):integer;
    function EncontraPeriodo(sData:string):Integer;
    function DiasNoPeriodo(iExercicio, iPeriodo:integer):integer;
    function VerificaDotacao(sCentroRespon:string):boolean;
    function VerificaDatas (dDataIni, dDataFim : TDateTime):boolean;
    function PrimeiroDiaPeriodo(iExercicio, iPeriodo:integer):string;
    function BuscaIdNumReserva(idReserva, NumReserva:Integer;bMostraMsg:Boolean):Integer;
    function VerificaSaldoProcesso(iPlanoOrc:integer; sContaOrcamen: string; iExercicio, iPeriodo:integer; rValor:extended; bMostraMsg:Boolean):boolean;
    function VerificaContaAtiva(iPlanoOrc: integer; sContaOrcamen: string):boolean;
    function BuscaContaOrcamen(iPlanoOrc: integer; sContaOrcamen: string; bMostraMsg, bProcesso:Boolean; var sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo, sNomeGrupo:string):integer;
    function ExibeSaldo(iPlanoOrc: integer; sContaOrcamen, sData, sTipoSaldo: string): double;
    function VerificaSaldo(iPlano: integer; sConta, sData: string): boolean;

    Property IdReserva    :Integer Read FIdReserva    Write FIdReserva;
    Property NumReserva   :Integer Read FNumReserva   Write FNumReserva;
    Property ValorReserva :Real    Read FValorReserva Write FValorReserva;

End;

Var
  OrcamentoBack: TOrcamentoBack;

implementation

Constructor TOrcamentoBack.Create;
Begin
  Inherited Create;
  FqryPeriodo       := TwwQuery.Create(Application);
  FqryUsuXCentCusto := TwwQuery.Create(Application);
  FqryCompromissos  := TwwQuery.Create(Application);
  FqryReservas      := TwwQuery.Create(Application);
  FqrySaldos        := TwwQuery.Create(Application);
  FqrySaldoProcesso := TwwQuery.Create(Application);
  FqryAux           := TwwQuery.Create(Application);
  FqryBuscaConta    := TwwQuery.Create(Application);
  FqryPeriodo.DataBaseName       := 'BaseDados';
  FqryUsuXCentCusto.DataBaseName := 'BaseDados';
  FqryCompromissos.DataBaseName  := 'BaseDados';
  FqryReservas.DataBaseName      := 'BaseDados';
  FqrySaldos.DataBaseName        := 'BaseDados';
  FqrySaldoProcesso.DataBaseName := 'BaseDados';
  FqryAux.DataBaseName           := 'BaseDados';
  FqryBuscaConta.DataBaseName    := 'BaseDados';
End;

Destructor TOrcamentoBack.Destroy;
Begin
  If FqryPeriodo.Active         Then FqryPeriodo.Close;
  If FqryUsuXCentCusto.Active   Then FqryUsuXCentCusto.Close;
  If FqryCompromissos.Active    Then FqryCompromissos.Close;
  If FqryReservas.Active        Then FqryReservas.Close;
  If FqrySaldos.Active          Then FqrySaldos.Close;
  If FqryAux.Active             Then FqryAux.Close;
  If FqrySaldoProcesso.Active   Then FqrySaldoProcesso.Close;
  If FqryBuscaConta.Active      Then FqryBuscaConta.Close;

  If FqryPeriodo.Prepared       Then FqryPeriodo.UnPrepare;
  If FqryUsuXCentCusto.Prepared Then FqryUsuXCentCusto.UnPrepare;
  If FqryCompromissos.Prepared  Then FqryCompromissos.UnPrepare;
  If FqryReservas.Prepared      Then FqryReservas.UnPrepare;
  If FqrySaldos.Prepared        Then FqrySaldos.UnPrepare;
  If FqrySaldoProcesso.Prepared Then FqrySaldoProcesso.UnPrepare;
  If FqryAux.Prepared           Then FqryAux.UnPrepare;
  If FqryBuscaConta.Prepared     Then FqryBuscaConta.UnPrepare;

  FqryUsuXCentCusto.Free;
  FqryCompromissos.Free;
  FqryReservas.Free;
  FqrySaldos.Free;
  FqryPeriodo.Free;
  FqryAux.Free;
  FqrySaldoProcesso.Free;
  FqryBuscaConta.Free;
  Inherited Destroy;
End;



{------------------------------------------------------------------------------}
{  TOrcamentoBack.CriaCompromisso                                              }
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

function TOrcamentoBack.CriaCompromisso(sData:string; rValor:extended; sObs:string; iModulo:integer; iConjuntoReservas:array of integer; bExibeMsg, bVeioCompra: boolean):integer;
var sMsg, sCodConta : string;
    iNumReservas, iExercicio, iPeriodo, iCodCompromisso, i : integer;
    bNaoEReserva, bNaoEstaAguardando, bNaoEMesmaConta  : boolean;
    rValorTotalReservas : extended;
    iIdCompromisso : LongInt;
begin
   Result := 0;

   //Função que procede com a criação do Compromisso a partir de "n" reservas
   iNumReservas := high(iConjuntoReservas);
   iExercicio   := StrToInt(copy (sData,7,4));
   iPeriodo     := EncontraPeriodo(sData);

   rValorTotalReservas := 0;
   bNaoEReserva        := false;
   bNaoEstaAguardando  := false;
   bNaoEMesmaConta     := false;
   sCodConta           := '';

   with FqryCompromissos do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT R.IDRESERVAORCAMEN, R.NUMRESERVA, R.VLRRESERVA, R.FLGRESCOMP, R.FLGRESERVA, ');
      SQL.Add('R.IDCONTAORCAMEN, R.IDPLANOORCAMEN, C.CODCENTRORESPON          ');
      SQL.Add('FROM RESERVAORCAMEN R, CONTASORCAMEN C WHERE                   ');
      SQL.Add('(R.IDPESSOA =:IDPESSOA) AND (R.NUMRESERVA =:NUMRESERVA) AND    ');
      SQL.Add('(R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND                      ');
      SQL.Add('(R.IDPLANOORCAMEN = C.IDPLANOORCAMEN)                          ');
      Prepare;

      for i := 0 to iNumReservas do begin
         if iConjuntoReservas[i] <> 0 then begin
            Close;
            ParamByName('IDPESSOA').asInteger := sistema.idEmpresa;
            ParamByName('NUMRESERVA').asInteger := iConjuntoReservas[i];
            Open;

            if i > 0 then begin
               if sCodConta <> FieldByName('IDCONTAORCAMEN').asString then begin
                  bNaoEMesmaConta := true;
               end;
            end;

            if FieldByName('FLGRESCOMP').asString = 'C' then begin
               bNaoEReserva := true;
            end;

            if (FieldByName('FLGRESERVA').asString <> 'A') and (FieldByName('FLGRESERVA').asString <> 'U') and (Not bVeioCompra) then begin
               bNaoEstaAguardando := true;
            end;

            sCodConta := FieldByName('IDCONTAORCAMEN').asString;
            rValorTotalReservas := rValorTotalReservas + FieldByName('VLRRESERVA').asFloat;
         end;
      end;
   end;
   if rValorTotalReservas < rValor then begin
      if not VerificaSaldoProcesso(FqryCompromissos.FieldByName('IDPLANOORCAMEN').asInteger, FqryCompromissos.FieldByName('IDCONTAORCAMEN').asString, iExercicio, iPeriodo, (rValor - rValorTotalReservas), true) then begin
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
            MsgDlg(sMsg, 'Aviso', mtWarning, [mbOk], 0);
         end;
      end;
      Exit;
   end;

   //Cria o número do próximo compromisso
   with FqryAux do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT MAX(NUMRESERVA) AS PROXIMA FROM RESERVAORCAMEN ');
      SQL.Add('WHERE IDPESSOA =:IDPESSOA ');
      Prepare;
      ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
      Open;

      iCodCompromisso := FieldByName('PROXIMA').asInteger + 1;

      Close;
   end;

   iIdCompromisso := LeUltRegistro(nil,'RESERVAORCAMEN');

   if rValor = 0 then rValor := rValorTotalReservas;

   try
      with FqryAux do begin
         Close;
         //Cria o Compromisso
         SQL.Clear;
         SQL.Add('INSERT INTO RESERVAORCAMEN ');
         SQL.Add('   (IDRESERVAORCAMEN, IDPESSOA, EXERCICIO, PERIODO, IDPLANOORCAMEN,      ');
         SQL.Add('    IDCONTAORCAMEN, DATAREFERENCIA, VLRRESERVA, FLGRESERVA,              ');
         SQL.Add('    OBSRESERVA, NUMRESERVA, FLGRESCOMP, IDMODULO, VLRCOMPROMISSO) VALUES ');
         SQL.Add('   (:IDRESERVAORCAMEN, :IDPESSOA, :EXERCICIO, :PERIODO, :IDPLANOORCAMEN, ');
         SQL.Add('    :IDCONTAORCAMEN, :DATAREFERENCIA, :VLRRESERVA, :FLGRESERVA,          ');
         SQL.Add('    :OBSRESERVA, :NUMRESERVA, :FLGRESCOMP, :IDMODULO, 0)                 ');
         ParamByName('IDRESERVAORCAMEN').asInteger := iIdCompromisso;
         ParamByName('IDPESSOA').asInteger         := sistema.idEmpresa;
         ParamByName('EXERCICIO').asInteger        := iExercicio;
         ParamByName('PERIODO').asInteger          := iPeriodo;
         ParamByName('IDPLANOORCAMEN').asInteger   := FqryCompromissos.FieldByName('IDPLANOORCAMEN').asInteger;
         ParamByName('IDCONTAORCAMEN').asString    := FqryCompromissos.FieldByName('IDCONTAORCAMEN').asString;
         ParamByName('DATAREFERENCIA').asDateTime  := StrToDate(sData);
         ParamByName('VLRRESERVA').asFloat         := rValor;
         ParamByName('FLGRESERVA').asString        := 'A';
         ParamByName('OBSRESERVA').asString        := sObs;
         ParamByName('NUMRESERVA').asInteger       := iCodCompromisso;
         ParamByName('FLGRESCOMP').asString        := 'C';
         ParamByName('IDMODULO').asInteger         := iModulo;
         ExecSQL;

         //Cria o Relacionamento entre o novo Compromisso e as reservas antigas
         Close;
         SQL.Clear;
         SQL.Add('INSERT INTO RESXCOMP                                       ');
         SQL.Add('   (IDRESXCOMP, IDRESERVA, IDCOMPROMISSO, IDPESSOA) VALUES ');
         SQL.Add('   (:IDRESXCOMP, :IDRESERVA, :IDCOMPROMISSO, :IDPESSOA)    ');
         Prepare;
         for i := 0 to iNumReservas do begin
            if iConjuntoReservas[i] <> 0 then begin
               FqryCompromissos.Close;
               FqryCompromissos.ParamByName('IDPESSOA').asInteger := sistema.idEmpresa;
               FqryCompromissos.ParamByName('NUMRESERVA').asInteger := iConjuntoReservas[i];
               FqryCompromissos.Open;
               if (FqryCompromissos.FieldByName('FLGRESERVA').asString = 'A') or
                  (FqryCompromissos.FieldByName('FLGRESERVA').asString = 'U') then begin
                  Close;
                  ParamByName('IDRESXCOMP').asInteger    := LeUltRegistro(nil,'RESXCOMP');
                  ParamByName('IDPESSOA').asInteger      := sistema.idEmpresa;
                  ParamByName('IDRESERVA').asInteger     := FqryCompromissos.FieldByName('IDRESERVAORCAMEN').AsInteger;
                  ParamByName('IDCOMPROMISSO').asInteger := iIdCompromisso;
                  ExecSQL;

                  //Marca as reservas como efetivadas
                  FqryReservas.Close;
                  FqryReservas.SQL.Clear;
                  FqryReservas.SQL.Add('UPDATE RESERVAORCAMEN SET ');
                  FqryReservas.SQL.Add('FLGRESERVA = ''E'' WHERE  ');
                  FqryReservas.SQL.Add('IDPESSOA =:IDPESSOA AND ');
                  FqryReservas.SQL.Add('NUMRESERVA =:NUMRESERVA ');
                  FqryReservas.ParamByName('IDPESSOA').asInteger   := sistema.idEmpresa;
                  FqryReservas.ParamByName('NUMRESERVA').asInteger := iConjuntoReservas[i];
                  FqryReservas.ExecSQL;
               end;
            end;
         end;

         //Retira o Valor do Saldo Reservado e inclui no Compromissado
         FqrySaldos.Close;
         FqrySaldos.SQL.Clear;
         FqrySaldos.SQL.Add('UPDATE SALDOORCADO SET ');
         FqrySaldos.SQL.Add('VLRRESERVADO = (VLRRESERVADO - :VALORRES), ');
         FqrySaldos.SQL.Add('VLRCOMPROMETIDO = (VLRCOMPROMETIDO + :VALORCOMP) WHERE  ');
         FqrySaldos.SQL.Add('(IDPESSOA       =:IDPESSOA) AND ');
         FqrySaldos.SQL.Add('(DATAREFERENCIA = TO_DATE(:DATAREFERENCIA,''DD/MM/YYYY'')) AND ');
         FqrySaldos.SQL.Add('(IDPLANOORCAMEN =:IDPLANOORCAMEN) AND ');
         FqrySaldos.SQL.Add('(IDCONTAORCAMEN =:IDCONTAORCAMEN) ');
         FqrySaldos.Prepare;
         FqrySaldos.ParamByName('VALORRES').asFloat         := rValorTotalReservas;
         FqrySaldos.ParamByName('VALORCOMP').asFloat        := rValor;
         FqrySaldos.ParamByName('IDPESSOA').asInteger       := Sistema.idEmpresa;
         FqrySaldos.ParamByName('DATAREFERENCIA').asString  := PrimeiroDiaPeriodo(iExercicio,iPeriodo);
         FqrySaldos.ParamByName('IDPLANOORCAMEN').asInteger := FqryCompromissos.FieldByName('IDPLANOORCAMEN').asInteger;
         FqrySaldos.ParamByName('IDCONTAORCAMEN').asString  := FqryCompromissos.FieldByName('IDCONTAORCAMEN').asString;
         FqrySaldos.ExecSQL;

         result := iCodCompromisso;

         sMsg := 'O Compromisso nº ' + IntToStr(iCodCompromisso) + ' foi criado com sucesso.';
      end;
   except
      result := -5;
      sMsg   := 'Houve um erro inesperado no Banco de Dados';
   end;

   if bExibeMsg then begin
      if sMsg <> '' then begin
         MsgDlg(sMsg, 'Aviso', mtWarning, [mbOk], 0);
      end;
   end;

end;



{------------------------------------------------------------------------------}
{  TOrcamentoBack.MarcaReserva                                                 }
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

function TOrcamentoBack.MarcaReserva(iNumReserva:longint; bExibeMsg: boolean):integer;
var sMsg : string;
begin

   //Função que procede com a marcação da Reserva para "Em Uso - U"
   with FqryReservas do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT R.FLGRESERVA, R.FLGRESCOMP, C.CODCENTRORESPON');
      SQL.Add('FROM RESERVAORCAMEN R, CONTASORCAMEN C');
      SQL.Add('WHERE (R.NUMRESERVA =:NUMRESERVA) AND ');
      SQL.Add('(R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND ');
      SQL.Add('(R.IDPLANOORCAMEN = C.IDPLANOORCAMEN) AND ');
      SQL.Add('(R.IDPESSOA =:IDPESSOA) ');
      Prepare;
      ParamByName('NUMRESERVA').asInteger := iNumReserva;
      ParamByName('IDPESSOA').asInteger   := sistema.idEmpresa;
      Open;

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
                        FqryAux.Close;
                        FqryAux.SQL.Clear;
                        FqryAux.SQL.Add('UPDATE RESERVAORCAMEN SET FLGRESERVA = ''U'' ');
                        FqryAux.SQL.Add('WHERE NUMRESERVA =:NUMRESERVA AND ');
                        FqryAux.SQL.Add('IDPESSOA =:IDPESSOA ');
                        FqryAux.Prepare;
                        FqryAux.ParamByName('NUMRESERVA').asInteger := iNumReserva;
                        FqryAux.ParamByName('IDPESSOA').asInteger   := sistema.idEmpresa;
                        FqryAux.ExecSQL;
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
         1:  sMsg := 'Usuário corrente sem alçada para a marcar a Reserva "Em Uso".';
         2:  sMsg := 'O número enviado é de um Compromisso Orçamentário, não de uma Reserva.';
         3:  sMsg := 'O número enviado é de uma Reserva já Cancelada';
         4:  sMsg := 'O número enviado é de uma Reserva já Efetivada';
         5:  sMsg := 'Houve um erro inesperado no Banco de Dados';
         6:  sMsg := 'O número enviado é de uma Reserva já em Uso';
      else
         sMsg := '';
      end;
      if sMsg <> '' then begin
         MsgDlg(sMsg, 'Aviso', mtWarning, [mbOk], 0);
      end;
   end;

end;



{------------------------------------------------------------------------------}
{  TOrcamentoBack.EstornaReserva                                               }
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

function TOrcamentoBack.EstornaReserva(iNumReserva:longint; bExibeMsg: boolean):integer;
var sMsg : string;
begin

   //Função que procede com o Estorno da Reserva
   with FqryReservas do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT R.FLGRESERVA, R.FLGRESCOMP, C.CODCENTRORESPON');
      SQL.Add('FROM RESERVAORCAMEN R, CONTASORCAMEN C');
      SQL.Add('WHERE (R.NUMRESERVA =:NUMRESERVA) AND ');
      SQL.Add('(R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND ');
      SQL.Add('(R.IDPLANOORCAMEN = C.IDPLANOORCAMEN) AND ');
      SQL.Add('(R.IDPESSOA =:IDPESSOA) ');
      Prepare;
      ParamByName('NUMRESERVA').asInteger := iNumReserva;
      ParamByName('IDPESSOA').asInteger   := sistema.idEmpresa;
      Open;

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
                        FqryAux.Close;
                        FqryAux.SQL.Clear;
                        FqryAux.SQL.Add('UPDATE RESERVAORCAMEN SET FLGRESERVA = ''A'' ');
                        FqryAux.SQL.Add('WHERE NUMRESERVA =:NUMRESERVA AND ');
                        FqryAux.SQL.Add('IDPESSOA =:IDPESSOA ');
                        FqryAux.Prepare;
                        FqryAux.ParamByName('NUMRESERVA').asInteger := iNumReserva;
                        FqryAux.ParamByName('IDPESSOA').asInteger   := sistema.idEmpresa;
                        FqryAux.ExecSQL;
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
         1:  sMsg := 'Usuário corrente sem alçada para a estornar a Reserva.';
         2:  sMsg := 'O número enviado é de um Compromisso Orçamentário, não de uma Reserva.';
         3:  sMsg := 'O número enviado é de uma Reserva já Cancelada.';
         4:  sMsg := 'O número enviado é de uma Reserva já Efetivada.';
         5:  sMsg := 'Houve um erro inesperado no Banco de Dados.';
         6:  sMsg := 'O número enviado é de uma Reserva já Aguardando.';
      else
         sMsg := '';
      end;
      if sMsg <> '' then begin
         MsgDlg(sMsg, 'Aviso', mtWarning, [mbOk], 0);
      end;
   end;

end;



{------------------------------------------------------------------------------}
{  TOrcamentoBack.CancelaReserva                                               }
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

function TOrcamentoBack.CancelaReserva(iNumReserva:longint; bExibeMsg: boolean):integer;
var sMsg : string;
begin

   //Função que procede com o Cancelamento da Reserva
   with FqryReservas do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT R.FLGRESERVA, R.FLGRESCOMP, C.CODCENTRORESPON, ');
      SQL.Add('R.EXERCICIO, R.PERIODO, R.VLRRESERVA ');
      SQL.Add('FROM RESERVAORCAMEN R, CONTASORCAMEN C');
      SQL.Add('WHERE (R.NUMRESERVA =:NUMRESERVA) AND ');
      SQL.Add('(R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND ');
      SQL.Add('(R.IDPLANOORCAMEN = C.IDPLANOORCAMEN) AND ');
      SQL.Add('(R.IDPESSOA =:IDPESSOA) ');
      Prepare;
      ParamByName('NUMRESERVA').asInteger := iNumReserva;
      ParamByName('IDPESSOA').asInteger   := sistema.idEmpresa;
      Open;

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
                        FqryAux.Close;
                        FqryAux.SQL.Clear;
                        FqryAux.SQL.Add('UPDATE RESERVAORCAMEN SET FLGRESERVA = ''C'' ');
                        FqryAux.SQL.Add('WHERE NUMRESERVA =:NUMRESERVA AND ');
                        FqryAux.SQL.Add('IDPESSOA =:IDPESSOA ');
                        FqryAux.Prepare;
                        FqryAux.ParamByName('NUMRESERVA').asInteger := iNumReserva;
                        FqryAux.ParamByName('IDPESSOA').asInteger   := sistema.idEmpresa;
                        FqryAux.ExecSQL;

                        //Retira o Valor do Saldo Reservado
                        FqrySaldos.Close;
                        FqrySaldos.SQL.Clear;
                        FqrySaldos.SQL.Add('UPDATE SALDOORCADO SET ');
                        FqrySaldos.SQL.Add('VLRRESERVADO = (VLRRESERVADO - :VALOR) WHERE ');
                        FqrySaldos.SQL.Add('(IDPESSOA       =:IDPESSOA) AND ');
                        FqrySaldos.SQL.Add('(DATAREFERENCIA = TO_DATE(:DATAREFERENCIA,''DD/MM/YYYY'')) AND ');
                        FqrySaldos.SQL.Add('(IDPLANOORCAMEN =:IDPLANOORCAMEN) AND ');
                        FqrySaldos.SQL.Add('(IDCONTAORCAMEN =:IDCONTAORCAMEN) ');
                        FqrySaldos.Prepare;
                        FqrySaldos.ParamByName('VALOR').asFloat            := FieldByName('VLRRESERVA').asFloat;
                        FqrySaldos.ParamByName('IDPESSOA').asInteger       := Sistema.idEmpresa;
                        FqrySaldos.ParamByName('DATAREFERENCIA').asString  := PrimeiroDiaPeriodo(FieldByName('EXERCICIO').asInteger,FieldByName('PERIODO').asInteger);
                        FqrySaldos.ParamByName('IDPLANOORCAMEN').asInteger := FieldByName('IDPLANOORCAMEN').asInteger;
                        FqrySaldos.ParamByName('IDCONTAORCAMEN').asString  := FieldByName('IDCONTAORCAMEN').asString;
                        FqrySaldos.ExecSQL;
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
         1:  sMsg := 'Usuário corrente sem alçada para a cancelar a Reserva.';
         2:  sMsg := 'O número enviado é de um Compromisso Orçamentário, não de uma Reserva.';
         3:  sMsg := 'O número enviado é de uma Reserva já Cancelada';
         4:  sMsg := 'O número enviado é de uma Reserva já Efetivada';
         5:  sMsg := 'Houve um erro inesperado no Banco de Dados';
         6:  sMsg := 'O número enviado é de uma Reserva já em Uso';
      else
         sMsg := '';
      end;
      if sMsg <> '' then begin
         MsgDlg(sMsg, 'Aviso', mtWarning, [mbOk], 0);
      end;
   end;

end;



{------------------------------------------------------------------------------}
{  TOrcamentoBack.EstornaCompromisso                                           }
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

function TOrcamentoBack.EstornaCompromisso(iNumReserva:longint; rValor:extended; bExibeMsg: boolean):integer;
var sMsg : string;
begin

   //Função que procede com o estorno do Compromisso Orçamentário
   with FqryCompromissos do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT R.FLGRESERVA, R.FLGRESCOMP, C.CODCENTRORESPON, R.VLRRESERVA,');
      SQL.Add('R.VLRCOMPROMISSO, R.EXERCICIO, R.PERIODO, R.IDPLANOORCAMEN, R.IDCONTAORCAMEN ');
      SQL.Add('FROM RESERVAORCAMEN R, CONTASORCAMEN C');
      SQL.Add('WHERE (R.NUMRESERVA = :NUMRESERVA) AND ');
      SQL.Add('      (R.IDPESSOA   = :IDEMPRESA) AND  ');
      SQL.Add('(R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND ');
      SQL.Add('(R.IDPLANOORCAMEN = C.IDPLANOORCAMEN) ');
      Prepare;
         ParamByName('NUMRESERVA').asInteger := iNumReserva;
         ParamByName('IDEMPRESA').asInteger := Sistema.IdEmpresa;
      Open;

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
               if (FieldByName('FLGRESERVA').asString = 'A') and (FieldByName('VLRCOMPROMISSO').asFloat < rValor) then begin
                  //O compromisso está aguardando
                  result := 4;
               end else begin
                  if (FieldByName('FLGRESERVA').asString = 'E') or (FieldByName('FLGRESERVA').asString = 'A') then begin
                     //O compromisso está efetivado, e pode ser estornado
                     try
                        FqryAux.Close;
                        FqryAux.SQL.Clear;
                        FqryAux.SQL.Add('UPDATE RESERVAORCAMEN SET FLGRESERVA = ''A'', ');
                        FqryAux.SQL.Add('VLRCOMPROMISSO = VLRCOMPROMISSO -:VALOR ');
                        FqryAux.SQL.Add('WHERE NUMRESERVA =:NUMRESERVA');
                        FqryAux.Prepare;
                        FqryAux.ParamByName('NUMRESERVA').asInteger := iNumReserva;
                        FqryAux.ParamByName('VALOR').asFloat        := rValor;
                        FqryAux.ExecSQL;
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
         1:  sMsg := 'Usuário corrente sem alçada para o Estorno';
         2:  sMsg := 'O número enviado é de uma Reserva Orçamentária, não de um Compromisso';
         3:  sMsg := 'O número enviado é de um Compromisso já Cancelado';
         4:  sMsg := 'O número enviado é de um Compromisso ainda Aguardando';
         5:  sMsg := 'Houve um erro inesperado no Banco de Dados';
      else
         sMsg := '';
      end;
      if sMsg <> '' then begin
         MsgDlg(sMsg, 'Aviso', mtWarning, [mbOk], 0);
      end;
   end;

end;



{------------------------------------------------------------------------------}
{  TOrcamentoBack.CancelaCompromisso                                           }
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

function TOrcamentoBack.CancelaCompromisso(iNumReserva:longint; bExibeMsg: boolean):integer;
var sMsg : string;
begin

   //Função que procede com o cancelamento do Compromisso Orçamentário
   with FqryCompromissos do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT R.FLGRESERVA, R.FLGRESCOMP, C.CODCENTRORESPON, R.VLRRESERVA,');
      SQL.Add('R.VLRCOMPROMISSO, R.EXERCICIO, R.PERIODO, R.IDPLANOORCAMEN, R.IDCONTAORCAMEN ');
      SQL.Add('FROM RESERVAORCAMEN R, CONTASORCAMEN C');
      SQL.Add('WHERE (R.NUMRESERVA =:NUMRESERVA) AND ');
      SQL.Add('(R.IDPESSOA =:IDPESSOA) AND ');
      SQL.Add('(R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND  ');
      SQL.Add('(R.IDPLANOORCAMEN = C.IDPLANOORCAMEN)  ');
      Prepare;
      ParamByName('NUMRESERVA').asInteger := iNumReserva;
      ParamByName('IDPESSOA').asInteger   := sistema.idEmpresa;
      Open;

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
                  FqryAux.Close;
                  FqryAux.SQL.Clear;
                  FqryAux.SQL.Add('UPDATE RESERVAORCAMEN SET FLGRESERVA = ''C'' ');
                  FqryAux.SQL.Add('WHERE NUMRESERVA =:NUMRESERVA AND ');
                  FqryAux.SQL.Add('IDPESSOA =:IDPESSOA');
                  FqryAux.Prepare;
                  FqryAux.ParamByName('NUMRESERVA').asInteger := iNumReserva;
                  FqryAux.ParamByName('IDPESSOA').asInteger   := sistema.idEmpresa;
                  FqryAux.ExecSQL;

                  //Retira o Valor do Saldo Comprometido
                  FqrySaldos.Close;
                  FqrySaldos.SQL.Clear;
                  FqrySaldos.SQL.Add('UPDATE SALDOORCADO SET ');
                  FqrySaldos.SQL.Add('VLRCOMPROMETIDO = (VLRCOMPROMETIDO - :VALOR) WHERE ');
                  FqrySaldos.SQL.Add('(IDPESSOA       =:IDPESSOA) AND ');
                  FqrySaldos.SQL.Add('(DATAREFERENCIA = TO_DATE(:DATAREFERENCIA,''DD/MM/YYYY'')) AND ');
                  FqrySaldos.SQL.Add('(IDPLANOORCAMEN =:IDPLANOORCAMEN) AND ');
                  FqrySaldos.SQL.Add('(IDCONTAORCAMEN =:IDCONTAORCAMEN) ');
                  FqrySaldos.Prepare;
                  FqrySaldos.ParamByName('VALOR').asFloat            := FieldByName('VLRRESERVA').asInteger;
                  FqrySaldos.ParamByName('IDPESSOA').asInteger       := Sistema.idEmpresa;
                  FqrySaldos.ParamByName('DATAREFERENCIA').asString  := PrimeiroDiaPeriodo(FieldByName('EXERCICIO').asInteger,FieldByName('PERIODO').asInteger);
                  FqrySaldos.ParamByName('IDPLANOORCAMEN').asInteger := FieldByName('IDPLANOORCAMEN').asInteger;
                  FqrySaldos.ParamByName('IDCONTAORCAMEN').asString  := FieldByName('IDCONTAORCAMEN').asString;
                  FqrySaldos.ExecSQL;
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
         1:  sMsg := 'Usuário corrente sem alçada para o Cancelamento';
         2:  sMsg := 'O número enviado é de uma Reserva Orçamentária, não de um Compromisso';
         3:  sMsg := 'O número enviado é de um Compromisso já Cancelado';
         5:  sMsg := 'Houve um erro inesperado no Banco de Dados';
      else
         sMsg := '';
      end;
      if sMsg <> '' then begin
         MsgDlg(sMsg, 'Aviso', mtWarning, [mbOk], 0);
      end;
   end;

end;



{------------------------------------------------------------------------------}
{  TOrcamentoBack.EfetivaCompromisso                                                                            }
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

function TOrcamentoBack.EfetivaCompromisso(iNumReserva:longint; rValor:extended; bExibeMsg: boolean):integer;
var sMsg : string;
begin

   //Função que procede com a efetivação do Compromisso Orçamentário
   with FqryCompromissos do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT R.FLGRESERVA, R.FLGRESCOMP, C.CODCENTRORESPON, R.VLRRESERVA,');
      SQL.Add('R.VLRCOMPROMISSO, R.EXERCICIO, R.PERIODO, R.IDPLANOORCAMEN, R.IDCONTAORCAMEN ');
      SQL.Add('FROM RESERVAORCAMEN R, CONTASORCAMEN C');
      SQL.Add('WHERE (R.NUMRESERVA =:NUMRESERVA) AND ');
      SQL.Add('(R.IDPESSOA =:IDPESSOA) AND ');
      SQL.Add('(R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND ');
      SQL.Add('(R.IDPLANOORCAMEN = C.IDPLANOORCAMEN) ');
      Prepare;
      ParamByName('NUMRESERVA').asInteger := iNumReserva;
      ParamByName('IDPESSOA').asInteger   := sistema.idEmpresa;
      Open;

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
                     if StrToFloat(Format('%17.2f',[rValor])) > StrToFloat(Format('%17.2f',[(FieldByName('VLRRESERVA').asFloat - FieldByName('VLRCOMPROMISSO').asFloat)])) then begin
                        result := 6;
                     end else begin
                        //O compromisso está aguardando, e pode ser efetivado
                        try
                           FqryAux.Close;
                           FqryAux.SQL.Clear;
                           FqryAux.SQL.Add('UPDATE RESERVAORCAMEN SET  ');
                           FqryAux.SQL.Add('VLRCOMPROMISSO = VLRCOMPROMISSO + :VALOR ');
                           if Format('%17.2f', [(rValor + FieldByName('VLRCOMPROMISSO').asFloat)]) = Format('%17.2f', [FieldByName('VLRRESERVA').asFloat]) then begin
                              FqryAux.SQL.Add(',FLGRESERVA = ''E'' ');
                           end;
                           FqryAux.SQL.Add('WHERE (NUMRESERVA =:NUMRESERVA) AND ');
                           FqryAux.SQL.Add('(IDPESSOA =:IDPESSOA)');
                           FqryAux.Prepare;
                           FqryAux.ParamByName('NUMRESERVA').asInteger := iNumReserva;
                           FqryAux.ParamByName('IDPESSOA').asInteger   := sistema.idEmpresa;
                           FqryAux.ParamByName('VALOR').asFloat := rValor;

                           FqryAux.ExecSQL;
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
         1:  sMsg := 'Usuário corrente sem alçada para a Efetivação';
         2:  sMsg := 'O número enviado é de uma Reserva Orçamentária, não de um Compromisso';
         3:  sMsg := 'O número enviado é de um Compromisso já Cancelado';
         4:  sMsg := 'O número enviado é de um Compromisso já Efetivado';
         5:  sMsg := 'Houve um erro inesperado no Banco de Dados';
         6:  sMsg := 'O valor é maior que o valor do compromisso';
      else
         sMsg := '';
      end;
      if sMsg <> '' then begin
         MsgDlg(sMsg, 'Aviso', mtWarning, [mbOk], 0);
      end;
   end;

end;



{------------------------------------------------------------------------------}
{  TOrcamentoBack.VerificaCompromisso                                                                            }
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

function TOrcamentoBack.VerificaCompromisso(iNumReserva:longint; rValor:extended; bExibeMsg: boolean):integer;
var sMsg : string;
begin

   //Função que procede com a verificação do Compromisso Orçamentário
   with FqryCompromissos do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT R.FLGRESERVA, R.FLGRESCOMP, C.CODCENTRORESPON, R.VLRRESERVA,');
      SQL.Add('R.VLRCOMPROMISSO, R.EXERCICIO, R.PERIODO, R.IDPLANOORCAMEN, R.IDCONTAORCAMEN ');
      SQL.Add('FROM RESERVAORCAMEN R, CONTASORCAMEN C');
      SQL.Add('WHERE (R.NUMRESERVA =:NUMRESERVA) AND ');
      SQL.Add('(R.IDPESSOA =:IDPESSOA) AND ');
      SQL.Add('(R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND ');
      SQL.Add('(R.IDPLANOORCAMEN = C.IDPLANOORCAMEN) ');
      Prepare;
      ParamByName('NUMRESERVA').asInteger := iNumReserva;
      ParamByName('IDPESSOA').asInteger   := sistema.idEmpresa;
      Open;

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
                     if StrToFloat(Format('%17.2f',[rValor])) > StrToFloat(Format('%17.2f',[(FieldByName('VLRRESERVA').asFloat - FieldByName('VLRCOMPROMISSO').asFloat)])) then begin
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
         1:  sMsg := 'Usuário corrente sem alçada para a Efetivação';
         2:  sMsg := 'O número enviado é de uma Reserva Orçamentária, não de um Compromisso';
         3:  sMsg := 'O número enviado é de um Compromisso já Cancelado';
         4:  sMsg := 'O número enviado é de um Compromisso já Efetivado';
         5:  sMsg := 'Houve um erro inesperado.';
         6:  sMsg := 'O valor é maior que o valor do compromisso';
      else
         sMsg := '';
      end;
      if sMsg <> '' then begin
         MsgDlg(sMsg, 'Aviso', mtWarning, [mbOk], 0);
      end;
   end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBack.VerificaDatas                                                }
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

function TOrcamentoBack.VerificaDatas(dDataIni, dDataFim:TDateTime):boolean;
begin
   //Faz a verificação se a data final é maior que a data inicial
   result := true;

   if dDataFim < dDataIni then begin
      Application.MessageBox('A Data Final deve ser maior ou igual que a Data Inicial.','Erro',mb_IconStop);
      result := false;
   end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBack.EncontraPeriodo                                              }
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

function TOrcamentoBack.EncontraPeriodo(sData:string):integer;
var iExercicio : Integer;
begin

   //Encontra o Periodo a partir da data de Referencia
   iExercicio := StrToInt(copy (sData,7,4));

   with FqryPeriodo do begin
      close;
      SQL.Clear;
      SQL.Add('SELECT PERIODO FROM PERIODOORCAMEN ');
      SQL.Add('WHERE (DATAINIPERIODO <=:DATA) AND ');
      SQL.Add('(DATAFIMPERIODO >=:DATA) AND ');
      SQL.Add('(EXERCICIO =:EXERCICIO) AND ');
      SQL.Add('(IDPESSOA  =:IDPESSOA) ');
      Prepare;
      ParamByName('DATA').asDateTime     := StrToDate(sData);
      ParamByName('EXERCICIO').asInteger := iExercicio;
      ParamByName('IDPESSOA').asInteger  := Sistema.IdEmpresa;
      Open;
      if isEmpty then begin
         result := 0;
      end else begin
         result := FieldByName('PERIODO').asInteger;
      end;
   end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBack.DiasNoPeriodo                                                }
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

function TOrcamentoBack.DiasNoPeriodo(iExercicio, iPeriodo:integer):integer;
begin

   //Retorna quantos dias um período tem
   with FqryPeriodo do begin
      close;
      SQL.Clear;
      SQL.Add('SELECT DATAINIPERIODO, DATAFIMPERIODO FROM PERIODOORCAMEN ');
      SQL.Add('WHERE (EXERCICIO =:EXERCICIO) AND ');
      SQL.Add('(PERIODO  =:PERIODO) AND ');
      SQL.Add('(IDPESSOA =:IDPESSOA) ');
      Prepare;
      ParamByName('EXERCICIO').asInteger := iExercicio;
      ParamByName('PERIODO').asInteger   := iPeriodo;
      ParamByName('IDPESSOA').asInteger  := Sistema.IdEmpresa;
      Open;

      if isEmpty then begin
         result := 0;
      end else begin
         result := trunc(FieldByName('DATAFIMPERIODO').value - FieldByName('DATAINIPERIODO').value) + 1;
      end;
   end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBack.PrimeiroDiaPeriodo                                           }
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

function TOrcamentoBack.PrimeiroDiaPeriodo(iExercicio, iPeriodo:integer):string;
begin

   //Retorna o primeiro dia em um período
   with FqryPeriodo do begin
      close;
      SQL.Clear;
      SQL.Add('SELECT DATAINIPERIODO FROM PERIODOORCAMEN ');
      SQL.Add('WHERE (EXERCICIO =:EXERCICIO) AND ');
      SQL.Add('(PERIODO  =:PERIODO) AND ');
      SQL.Add('(IDPESSOA =:IDPESSOA) ');
      Prepare;
      ParamByName('EXERCICIO').asInteger := iExercicio;
      ParamByName('PERIODO').asInteger   := iPeriodo;
      ParamByName('IDPESSOA').asInteger  := Sistema.IdEmpresa;
      Open;

      if isEmpty then begin
         result := '';
      end else begin
         result := DateToStr(FieldByName('DATAINIPERIODO').asDateTime);
      end;
   end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBack.VerificaDotacao                                              }
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

function TOrcamentoBack.VerificaDotacao(sCentroRespon:string):boolean;
begin

   //Verifica a tabela de Usuarios x Centros de Resp. para saber se pode ser feita a reserva
   result := true;

   if sCentroRespon <> '' then begin
      with FqryUsuXCentCusto do begin
         Close;
         SQL.Clear;
         SQL.Add('SELECT IDPESSOAACESSO FROM PESSOAXCRESP ');
         SQL.Add('WHERE (IDPESSOAACESSO =:USUARIO) AND ');
         SQL.Add('(RTRIM(CODCENTRORESPON) =:CODCENTRORESPON) AND ');
         SQL.Add('(IDPESSOA =:IDPESSOA) ');
         Prepare;
         ParamByName('USUARIO').asInteger        := Sistema.IdUsuario;
         ParamByName('IDPESSOA').asInteger       := Sistema.IdEmpresa;
         ParamByName('CODCENTRORESPON').asString := sCentroRespon;
         Open;

         if isEmpty then begin
            result := false;
         end;
      end;
   end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBack.BuscaIdNumReserva                                            }
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

function TOrcamentoBack.BuscaIdNumReserva(idReserva, NumReserva:Integer;bMostraMsg:Boolean):Integer;
var sSql: String;
begin

   sSql := 'SELECT IDRESERVAORCAMEN, NUMRESERVA FROM RESERVAORCAMEN WHERE IDPESSOA =' + IntToStr(sistema.idEmpresa);
   if idReserva > 0 then begin
      sSql := sSql + ' AND IDRESERVAORCAMEN = ' + IntToStr(idReserva);
   end else begin
      if NumReserva > 0 then begin
         sSql := sSql + ' AND NUMRESERVA = ' + IntToStr(NumReserva);
      end;
   end;

   try
     FqryAux.Close;
     FqryAux.Sql.Text := sSql;
     FqryAux.Open;
     if FqryAux.IsEmpty then begin
        Result := 0;
        if bMostraMsg then begin
           MsgDlg('Reserva Orçamentária não existe', 'Aviso', mtWarning, [mbOk], 0);
        end;
     end else begin
        if idReserva > 0 then begin
           Result := FqryAux.FieldByname('NUMRESERVA').AsInteger;
        end else begin
           Result := FqryAux.FieldByname('IDRESERVAORCAMEN').AsInteger;
        end;
     end;
   except
     Result := 0;
   end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBack.VerificaContaAtiva                                           }
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

function TOrcamentoBack.VerificaContaAtiva(iPlanoOrc:integer; sContaOrcamen: string):boolean;
begin
   with FqryAux do begin
      Close;
      SQL.Add('SELECT                                    ');
      SQL.Add('   FLGATIVA, DATAATIVA, DATAINATIVA       ');
      SQL.Add('FROM                                      ');
      SQL.Add('   CONTASORCAMEN                          ');
      SQL.Add('WHERE                                     ');
      SQL.Add('   (IDCONTAORCAMEN =:IDCONTAORCAMEN) AND  ');
      SQL.Add('   (IDPLANOORCAMEN =:IDPLANOORCAMEN)      ');

      ParamByName('IDPLANOORCAMEN').asInteger := iPlanoOrc;
      ParamByName('IDCONTAORCAMEN').asString  := sContaOrcamen;
      Open;

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
{  TOrcamentoBack.VerificaSaldoProcesso                                        }
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

function TOrcamentoBack.VerificaSaldoProcesso(iPlanoOrc: integer; sContaOrcamen: string; iExercicio, iPeriodo:integer; rValor:extended; bMostraMsg:Boolean):boolean;
var sTipoSaldo, sVerificaSaldo : string;
begin

   //Verifica na tabela de Parâmetros como deverá ser tratado o Saldo
   with FqryAux do begin
      Close;
      SQL.Clear;
      Sql.Add('SELECT FLGTIPOSALDO, FLGVERIFICASALDO FROM PARAMORCAMENTO WHERE IDPESSOA =:IDPESSOA');
      ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
      Open;

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

   //Verifica a tabela de Saldos para ver se a reserva pode ser feita com o Saldo corrente
   with FqrySaldoProcesso do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT SUM(VLRORCADO) AS VALOR1, ');
      SQL.Add('       SUM(VLRCOMPROMETIDO) AS VALOR2, ');
      SQL.Add('       SUM(VLRRESERVADO) AS VALOR3 ');
      SQL.Add('FROM SALDOORCADO ');
      SQL.Add('WHERE  (IDPLANOORCAMEN =:IDPLANOORCAMEN) AND ');
      SQL.Add('       (IDCONTAORCAMEN =:IDCONTAORCAMEN) AND ');
      SQL.Add('       (IDPESSOA       =:IDPESSOA) AND ');
      case sTipoSaldo[1] of
         'P':begin
               SQL.Add('EXERCICIO      =:EXERCICIO AND ');
               SQL.Add('PERIODO        =:PERIODO ');
             end;
         'E':begin
               SQL.Add('EXERCICIO      =:EXERCICIO ');
             end;
         'A':begin
               SQL.Add('EXERCICIO      =:EXERCICIO AND ');
               SQL.Add('PERIODO       <=:PERIODO ');
             end;
      end;
      Prepare;
      ParamByName('IDPLANOORCAMEN').asInteger := iPlanoOrc;
      ParamByName('IDCONTAORCAMEN').asString  := sContaOrcamen;
      ParamByName('IDPESSOA').asInteger       := Sistema.idEmpresa;
      ParamByName('EXERCICIO').asInteger      := iExercicio;
      if sTipoSaldo <> 'E' then begin
         ParamByName('PERIODO').asInteger     := iPeriodo;
      end;
      Open;

      if Format('%17.2f', [(FieldByName('VALOR1').asFloat -
         (FieldByName('VALOR2').asFloat + FieldByName('VALOR3').asFloat))]) < Format('%17.2f', [rValor]) then begin
         if bMostraMsg then begin
            MsgDlg('Não existe saldo suficiente para esta Reserva.','Erro',mtError,[mbOk],0);
         end;
         Close;
         Result := false;
      end else begin
         Result := true;
      end;
   end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBack.BuscaContaOrcamen                                            }
{                                                                              }
{  Função que verifica se uma conta está apta a ter processos nela             }
{                                                                              }
{  Parâmetros passados para a Função :                                         }
{                                                                              }
{   iPlanoOrc - plano orçamentário                                             }
{   sContaOrcamen - conta orçamentária                                         }
{   bExibeMsg - flag indicativa se a função deve ou não gerar mensagens de erro}
{   bProcessso - flag indicativa se a busca é para um processo ou não           }
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

function TOrcamentoBack.BuscaContaOrcamen(iPlanoOrc: integer; sContaOrcamen: string; bMostraMsg, bProcesso:Boolean; var sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo, sNomeGrupo:string):integer;
begin
   with FqryBuscaConta do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT                                                          ');
      SQL.Add('   C.NOMECONTAORCAMEN, C.CODCENTRORESPON, R.NOME, C.FLGATIVA,   ');
      SQL.Add('   G.CODGRUPOORC, G.NOMEGRUPOORCAMEN, C.TIPOCALCREALIZADO       ');
      SQL.Add('FROM                                                            ');
      SQL.Add('   CONTASORCAMEN C, CENTRESPON R, GRUPOORCAMEN G                ');
      SQL.Add('WHERE                                                           ');
      SQL.Add('   (R.CODCENTRORESPON(+) = C.CODCENTRORESPON) AND               ');
      SQL.Add('   (R.IDPESSOA(+) = C.IDPESSOA) AND                             ');
      SQL.Add('   (G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN) AND                    ');
      SQL.Add('   (C.IDCONTAORCAMEN =:IDCONTAORCAMEN) AND                      ');
      SQL.Add('   (C.IDPLANOORCAMEN =:IDPLANOORCAMEN)                          ');

      ParamByName('IDCONTAORCAMEN').asString  := sContaOrcamen;
      ParamByName('IDPLANOORCAMEN').asInteger := iPlanoOrc;
      Open;

      if isEmpty then begin
         if bMostraMsg then begin
            MsgDlg('Não existe conta com esse código.','Erro',mtWarning,[mbOk],0);
         end;
         Close;
         Result := 1;
         Exit;
      end;

      if FieldByName('FLGATIVA').asString = 'I' then begin
         if bMostraMsg then begin
            MsgDlg('Conta inativa.','Erro',mtWarning,[mbOk],0);
         end;
         Close;
         Result := 2;
         Exit;
      end;

      if bProcesso then begin
         if FieldByName('TIPOCALCREALIZADO').asString <> 'X' then begin
            if bMostraMsg then begin
               MsgDlg('Somente Contas com o Cálculo do Realizado do tipo "Fluxo de Caixa" podem ter Reservas.','Aviso',mtWarning,[mbOk],0);
            end;
            Close;
            Result := 4;
            Exit;
         end;
      end;

      if not FieldByName('CODCENTRORESPON').isNull then begin
         if not VerificaDotacao(FieldByName('CODCENTRORESPON').asString) then begin
            if bMostraMsg then begin
               MsgDlg('O Usuário corrente não tem permissão para fazer um Processo nessa Conta.','Erro',mtWarning,[mbOk],0);
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
            Result            := 0;
         end;
      end else begin
         sCodCentroRespon  := '';
         sNomeCentroRespon := '';
         sNomeConta        := FieldByName('NOMECONTAORCAMEN').asString;
         sCodGrupo         := FieldByName('CODGRUPOORC').asString;
         sNomeGrupo        := FieldByName('NOMEGRUPOORCAMEN').asString;
         Result            := 0;
      end;
   end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBack.ExibeSaldo                                                   }
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

function TOrcamentoBack.ExibeSaldo(iPlanoOrc: integer; sContaOrcamen, sData, sTipoSaldo: string): double;
var iExercicio, iPeriodo : integer;
begin

   iExercicio := StrToInt(copy(sData,7,4));
   iPeriodo   := EncontraPeriodo(sData);
   //Verifica a tabela de Saldos para ver se a reserva pode ser feita com o Saldo corrente
   with FqrySaldos do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT SUM(VLRORCADO) AS VALOR1, ');
      SQL.Add('       SUM(VLRCOMPROMETIDO) AS VALOR2, ');
      SQL.Add('       SUM(VLRRESERVADO) AS VALOR3 ');
      SQL.Add('FROM SALDOORCADO ');
      SQL.Add('WHERE  (IDPLANOORCAMEN =:IDPLANOORCAMEN) AND ');
      SQL.Add('       (IDCONTAORCAMEN =:IDCONTAORCAMEN) AND ');
      SQL.Add('       (IDPESSOA       =:IDPESSOA) AND ');
      case sTipoSaldo[1] of
         'P':begin
               SQL.Add('(EXERCICIO      =:EXERCICIO) AND ');
               SQL.Add('(PERIODO        =:PERIODO) ');
             end;
         'E':begin
               SQL.Add('(EXERCICIO      =:EXERCICIO) ');
             end;
         'A':begin
               SQL.Add('(EXERCICIO      =:EXERCICIO) AND ');
               SQL.Add('(PERIODO       <=:PERIODO) ');
             end;
      end;
      Prepare;
      ParamByName('IDPLANOORCAMEN').asInteger := iPlanoOrc;
      ParamByName('IDCONTAORCAMEN').asString  := sContaOrcamen;
      ParamByName('IDPESSOA').asInteger       := Sistema.idEmpresa;
      ParamByName('EXERCICIO').asInteger      := iExercicio;
      if sTipoSaldo <> 'E' then begin
         ParamByName('PERIODO').asInteger        := iPeriodo;
      end;
      Open;

      Result := (FieldByName('VALOR1').asFloat - (FieldByName('VALOR2').asFloat + FieldByName('VALOR3').asFloat));
   end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBack.VerificaSaldo                                                }
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

function TOrcamentoBack.VerificaSaldo(iPlano: integer; sConta, sData: string): boolean;
begin
   with FqrySaldos do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT IDCONTAORCAMEN ');
      SQL.Add('FROM SALDOORCADO ');
      SQL.Add('WHERE  (IDPLANOORCAMEN =:IDPLANOORCAMEN) AND ');
      SQL.Add('       (IDCONTAORCAMEN =:IDCONTAORCAMEN) AND ');
      SQL.Add('       (IDPESSOA       =:IDPESSOA) AND       ');
      SQL.Add('       (DATAREFERENCIA =:DATAREFERENCIA)     ');
      Prepare;
      ParamByName('IDPLANOORCAMEN').asInteger  := iPlano;
      ParamByName('IDCONTAORCAMEN').asString   := sConta;
      ParamByName('IDPESSOA').asInteger        := Sistema.idEmpresa;
      ParamByName('DATAREFERENCIA').asDateTime := StrToDate(sData);
      Open;
      if isEmpty then begin
         result := false;
      end else begin
         result := true;
      end;
   end;
end;



end.

