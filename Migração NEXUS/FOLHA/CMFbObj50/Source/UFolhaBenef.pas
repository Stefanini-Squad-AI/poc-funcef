unit UFolhaBenef;

interface

// Alterações:
//--------------------------------------------------------------------------------------------------
// Rotina    :
// Autor(a)  : Edilaine
// Data      : 26/12/2025
// Pendencia : WO29808
// Alteração : Novo cálculo do IR para Exteior
//--------------------------------------------------------------------------------------------------
// Rotina    : CarregaParametros
// Autor(a)  : Edilaine
// Data      : 07/07/2023
// Pendencia : 136670
// Alteração : Criação parametros para Desconto Simplificado MP 1171
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 17/04/2007
// Rotina      : CarregaParametros
// Pendência   : 21874
// Descricao   : Criar parâmetro para controle de desativação automática da
//   Rubrica individual, no processo de Efetivação de versão de pagamento.
//   Situações em que ocorre a desativação automática da rubrica individual:
//     - data final atingida
//     - parcela atingida
//     - saldo atingido
//   Opções:
//     0 - sem desativação
//     1 - desativação automática individual
//     2 - desativação automática geral (para qualquer registro na condição)
//--------------------------------------------------------------------------------------------------
// Autor(a)  : Claudio Faria
// Rotina    : Diversas (verificar pelo numero da pendencia)
// Data      : 22/01/2007
// Pendencia : 20814
// Alteração : Desabilitando os parametros IDRubCredAdiantaIsento,
//               IDRubAdiantaIsento
//------------------------------------------------------------------------------
// Autor(a)  : Claudio Faria
// Rotina    : Diversas (verificar pelo numero da pendencia)
// Data      : 11/10/2006
// Pendencia : 18728
// Alteração : Criar parâmetro VerificaRecebedorDuplicado
//------------------------------------------------------------------------------
// Autor(a)  : Paulo Ramos
// Rotina    : Diversas (verificar pelo numero da pendencia)
// Data      : 04/10/2006
// Pendencia : 22999
// Alteração : Criar parâmetro global para que o mês referencia seja constante
//   no processamento e lançamento de rubrica individual, mesmo que tenha várias
//   parcelas a processar. Isto vai indicar que o valor total de uma referência
//   foi rateado por diversos meses.
//------------------------------------------------------------------------------
// Autor(a)  : Claudio Faria
// Rotina    : Diversas (verificar pelo numero da pendencia)
// Data      : 15/09/2006
// Pendencia : 18767
// Alteração : Tratar os paramentros IDRubCredAdiantaIsento, IDRubAdiantaIsento.
//------------------------------------------------------------------------------
// Autor(a)  : Paulo Ramos
// Rotina    : Parametros
// Data      : 21/08/2006
// Pendencia : 23109
// Alteração : Retirar o parâmetro para forçar uso da tabela progressiva de IR
//   sobre resgate de reserva.
//------------------------------------------------------------------------------
// Autor(a)  : Paulo Ramos
// Rotina    : Criar parametros
// Data      : 21/08/2006
// Pendencia : 22312
// Alteração : Tratar novas rubricas para IR regressivo de beneficio vitalicio e de abono vitalicio
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 19/12/2005
// Rotina      : Parâmetro Novo
// Pendência   : 14461 e 21006
// Descricao   : Controle do Preparo de Abono anual de retidos
//               OPÇÕES: 0-NÃO PREPARA,
//                       1-PREPARA RETIDOS EXCETO RECADASTRAMENTO
//                       2-PREPARA TODOS OS RETIDOS
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 19/12/2005
// Rotina      : Parâmetro Novo
// Pendência   : 19506
// Descricao   : Controle do Preparo de Mensal de retidos
//               OPÇÕES: 0-NÃO PREPARA,
//                       1-PREPARA RETIDOS EXCETO TEMPORÁRIOS
//                       2-PREPARA TODOS OS RETIDOS
//------------------------------------------------------------------------------

uses wwquery, Udatabase, USistema, SysUtils, dbasedados, UobjFolha, uDiasUteis;

const
  cteIdModuloAdmPREV  = 16;
  cteIdModuloCCP      = 32;
  cteIdModuloFolhaBen = 18;
  cteIdModuloFolhaCM  = 21;

procedure CarregaParametros(qryAux: twwquery);
Function InserirParametro (qryAux: twwquery; sNomeParm , sTipoParm, svalorParm : String) : Boolean;
Function AlterarParametro (qryAux: twwquery; sNomeParm , svalorParm : String) : Boolean;
Function BuscaValorParametro(qryAux: twwquery; sNomeParm : String) : String;

implementation

Procedure CarregaParametros(qryAux: twwquery);
begin
  //ELIMINA REGISTROS DA PARAMFOLHA QUE NÃO PERTENCEM A NENHUMA FUNDAÇÃO
  ExecutarQuery(qryAux, 'delete from paramfolha p '+
                        'where not exists (select f.idpessoa '+
                                          'from fundacao f '+
                                          'where f.idpessoa = p.idfundacao)');

  //IDRUBCPMFPAINSS
  If BuscaValorParametro(qryAux, 'IDRUBCPMFPAINSS') = #255 then
    InserirParametro(qryAux, 'IDRUBCPMFPAINSS','N','0');
  try
    SistemaFolha.IDRUBCPMFPAINSS := StrtoInt(BuscaValorParametro(qryAux, 'IDRUBCPMFPAINSS'));
  except
    SistemaFolha.IDRUBCPMFPAINSS := 0;
  end;

  //IDRUBCPMFPAINSSDESC
  If BuscaValorParametro(qryAux, 'IDRUBCPMFPAINSSDESC') = #255 then
    InserirParametro(qryAux, 'IDRUBCPMFPAINSSDESC','N','0');
  try
    SistemaFolha.IDRUBCPMFPAINSSDESC := StrtoInt(BuscaValorParametro(qryAux, 'IDRUBCPMFPAINSSDESC'));
  except
    SistemaFolha.IDRUBCPMFPAINSSDESC := 0;
  end;

  // FLGAPAGAPREVIA
  If BuscaValorParametro(qryAux, 'FLGAPAGAPREVIA') = #255 then
    InserirParametro(qryAux, 'FLGAPAGAPREVIA','N','0');
  try
    SistemaFolha.FlgApagaPrevia := StrtoInt(BuscaValorParametro(qryAux, 'FLGAPAGAPREVIA'));
  except
    SistemaFolha.FlgApagaPrevia := 0;
  end;

  // FLGUSAMARGEM3070
  If BuscaValorParametro(qryAux, 'FLGUSAMARGEM3070') = #255 then
    InserirParametro(qryAux, 'FLGUSAMARGEM3070','N','0');
  try
    SistemaFolha.FLGUSAMARGEM3070 := StrtoInt(BuscaValorParametro(qryAux, 'FLGUSAMARGEM3070'));
  except
    SistemaFolha.FLGUSAMARGEM3070 := 0;
  end;

  //FLGVERIFICAPARM
  If BuscaValorParametro(qryAux, 'FLGVERIFICAPARM') = #255 then
    InserirParametro(qryAux, 'FLGVERIFICAPARM','N','0');
  try
    SistemaFolha.FlgVerificaParm := StrtoInt(BuscaValorParametro(qryAux, 'FLGVERIFICAPARM'));
  except
    SistemaFolha.FlgVerificaParm := 0;
  end;

  //DEDUCAOBASEIR0561
  If BuscaValorParametro(qryAux, 'DEDUCAOBASEIR0561') = #255 Then
    InserirParametro(qryAux, 'DEDUCAOBASEIR0561', 'R', '0');
  Try
    SistemaFolha.DeducaoBaseIR0561 := StrToFloat(BuscaValorParametro(qryAux, 'DEDUCAOBASEIR0561'));
  Except
    SistemaFolha.DeducaoBaseIR0561 := 0;
  End;

  //VLRMAXLIMITEFOLHAEXTRA
  If BuscaValorParametro(qryAux, 'VLRMAXLIMITEFOLHAEXTRA') = #255 Then
    InserirParametro(qryAux, 'VLRMAXLIMITEFOLHAEXTRA', 'R', '0');
  Try
    SistemaFolha.VlrMaxLimiteFolhaExtra := StrToFloat(BuscaValorParametro(qryAux, 'VLRMAXLIMITEFOLHAEXTRA'));
  Except
    SistemaFolha.VlrMaxLimiteFolhaExtra := 0;
  End;

  //FlgCalcPensAlimAntPrevia
  If BuscaValorParametro(qryAux, 'FLGCALCPENSALIMANTPREVIA') = #255 Then
    InserirParametro(qryAux, 'FLGCALCPENSALIMANTPREVIA', 'N', '0');
  Try
    SistemaFolha.FlgCalcPensAlimAntPrevia:=StrToInt(BuscaValorParametro(qryAux, 'FLGCALCPENSALIMANTPREVIA'));
  Except
    SistemaFolha.FlgCalcPensAlimAntPrevia:=0;
  End;

  // FlgEnviaContribManutencao
  If BuscaValorParametro(qryAux, 'FLGENVIACONTRIBMANUTENCAO') = #255 then
    InserirParametro(qryAux, 'FLGENVIACONTRIBMANUTENCAO','N','0');
  try
    SistemaFolha.FlgEnviaContribManutencao := StrtoInt(BuscaValorParametro(qryAux, 'FLGENVIACONTRIBMANUTENCAO'));
  except
    SistemaFolha.FlgEnviaContribManutencao := 0 ;
  end;

  // FLGNUMLOTES
  If BuscaValorParametro(qryAux, 'FLGNUMLOTES') = #255 then
    InserirParametro(qryAux, 'FLGNUMLOTES','N','1');
  try
    SistemaFolha.FLGNUMLOTES := StrtoInt(BuscaValorParametro(qryAux, 'FLGNUMLOTES'));
  except
    SistemaFolha.FLGNUMLOTES := 1 ;
  end;

  // FlgEnviaContribConcessao
  If BuscaValorParametro(qryAux, 'FLGENVIACONTRIBCONCESSAO') = #255 then
    InserirParametro(qryAux, 'FLGENVIACONTRIBCONCESSAO','N','0');
  try
    SistemaFolha.FlgEnviaContribConcessao := StrtoInt(BuscaValorParametro(qryAux, 'FLGENVIACONTRIBCONCESSAO'));
  except
    SistemaFolha.FlgEnviaContribConcessao := 0 ;
  end;

  // CodCentroRespon
  If BuscaValorParametro(qryAux, 'CODCENTRORESPON') = #255 then
    InserirParametro(qryAux, 'CODCENTRORESPON','S','0');
  try
    SistemaFolha.CodCentroRespon := BuscaValorParametro(qryAux, 'CODCENTRORESPON');
  except
    SistemaFolha.CodCentroRespon := '0';
  end;

  // CodPortForma
  If BuscaValorParametro(qryAux, 'CODPORTFORMA') = #255 then
    InserirParametro(qryAux, 'CODPORTFORMA','S','0');
  try
    SistemaFolha.CodPortForma := BuscaValorParametro(qryAux, 'CODPORTFORMA');
  except
    SistemaFolha.CodPortForma := '0';
  end;

  // CodTipRecDes
  If BuscaValorParametro(qryAux, 'CODTIPRECDES') = #255 then
    InserirParametro(qryAux, 'CODTIPRECDES','S','0');
  try
    SistemaFolha.CodTipRecDes := BuscaValorParametro(qryAux, 'CODTIPRECDES');
  except
    SistemaFolha.CodTipRecDes := '0';
  end;

  // CodTipRecDesFav
  If BuscaValorParametro(qryAux, 'CODTIPRECDESFAV') = #255 then
    InserirParametro(qryAux, 'CODTIPRECDESFAV','S','0');
  try
    SistemaFolha.CodTipRecDesFav := BuscaValorParametro(qryAux, 'CODTIPRECDESFAV');
  except
    SistemaFolha.CodTipRecDesFav := '0';
  end;

  // UnidNegoc
  If BuscaValorParametro(qryAux, 'UNIDNEGOC') = #255 then
    InserirParametro(qryAux, 'UNIDNEGOC','S','0');
  try
    SistemaFolha.UnidNegoc := BuscaValorParametro(qryAux, 'UNIDNEGOC');
  except
    SistemaFolha.UnidNegoc := '0';
  end;

  // SubConta
  If BuscaValorParametro(qryAux, 'SUBCONTA') = #255 then
    InserirParametro(qryAux, 'SUBCONTA','S','0');
  try
    SistemaFolha.SubConta := BuscaValorParametro(qryAux, 'SUBCONTA');
  except
    SistemaFolha.SubConta := '0';
  end;

  // CodCentroCustoC
  If BuscaValorParametro(qryAux, 'CODCENTROCUSTOC') = #255 then
    InserirParametro(qryAux, 'CODCENTROCUSTOC','S','0');
  try
    SistemaFolha.CodCentroCustoC := BuscaValorParametro(qryAux, 'CODCENTROCUSTOC');
  except
    SistemaFolha.CodCentroCustoC := '0';
  end;

  // CODCCUSTOFINAN
  If BuscaValorParametro(qryAux, 'CODCCUSTOFINAN') = #255 then
    InserirParametro(qryAux, 'CODCCUSTOFINAN','S','');
  try
    SistemaFolha.CODCCUSTOFINAN := BuscaValorParametro(qryAux, 'CODCCUSTOFINAN');
  except
    SistemaFolha.CODCCUSTOFINAN := '';
  end;

  // MASCARAMATRICULA
  If BuscaValorParametro(qryAux, 'MASCARAMATRICULA') = #255 then
    InserirParametro(qryAux, 'MASCARAMATRICULA','S','');
  try
    SistemaFolha.MASCARAMATRICULA := BuscaValorParametro(qryAux, 'MASCARAMATRICULA');
  except
    SistemaFolha.MASCARAMATRICULA := '';
  end;

  // CodCentroCustoD
  If BuscaValorParametro(qryAux, 'CODCENTROCUSTOD') = #255 then
    InserirParametro(qryAux, 'CODCENTROCUSTOD','S','0');
  try
    SistemaFolha.CodCentroCustoD := BuscaValorParametro(qryAux, 'CODCENTROCUSTOD');
  except
    SistemaFolha.CodCentroCustoD := '0';
  end;

  // PlaContaD
  If BuscaValorParametro(qryAux, 'PLACONTAD') = #255 then
    InserirParametro(qryAux, 'PLACONTAD','S','');
  SistemaFolha.PLACONTAD:=BuscaValorParametro(qryAux, 'PLACONTAD');

  // PlaContaC
  If BuscaValorParametro(qryAux, 'PLACONTAC') = #255 then
    InserirParametro(qryAux, 'PLACONTAC','S','');
  SistemaFolha.PLACONTAC:=BuscaValorParametro(qryAux, 'PLACONTAC');

  // Indica se usa modelo de 1 ou 2 Contra-cheques por página
  If BuscaValorParametro(qryAux, 'CONTRACHEQUESPORPAGINA') = #255 then
    InserirParametro(qryAux, 'CONTRACHEQUESPORPAGINA','S','1');
  try
    SistemaFolha.ContraChequePorPagina:=
      strtoint(BuscaValorParametro(qryAux, 'CONTRACHEQUESPORPAGINA'));
  except
    SistemaFolha.ContraChequePorPagina:=1;
  end;

  // Indica se usa rubrica interna ou externa no contracheque trimestral e na 2ª via do contracheque.
  If BuscaValorParametro(qryAux, 'RUBRICACONTRACHEQUE') = #255 then
    InserirParametro(qryAux, 'RUBRICACONTRACHEQUE','S','0');
  try
    SistemaFolha.RUBRICACONTRACHEQUE:=
      strtoint(BuscaValorParametro(qryAux, 'RUBRICACONTRACHEQUE'));
  except
    SistemaFolha.RUBRICACONTRACHEQUE:=0;
  end;

  // Separador de 2 Contra-cheque
  If BuscaValorParametro(qryAux, 'SEPARADOR2CONTRACHEQUES') = #255 then
    InserirParametro(qryAux, 'SEPARADOR2CONTRACHEQUES','S','');
  SistemaFolha.SeparadorContraCheque:=
    BuscaValorParametro(qryAux, 'SEPARADOR2CONTRACHEQUES');

  //FLGNUMDEPIRNUMDEPSALFAM
  If BuscaValorParametro(qryAux, 'FLGNUMDEPIRNUMDEPSALFAM') = #255 then
    InserirParametro(qryAux, 'FLGNUMDEPIRNUMDEPSALFAM','N','0');
  SistemaFolha.FLGNUMDEPIRNUMDEPSALFAM := StrToInt(BuscaValorParametro(qryAux, 'FLGNUMDEPIRNUMDEPSALFAM'));

  //FLGESTADORUB
  If BuscaValorParametro(qryAux, 'FLGESTADORUB') = #255 then
    InserirParametro(qryAux, 'FLGESTADORUB','N','0');
  SistemaFolha.FLGESTADORUB := StrToInt(BuscaValorParametro(qryAux, 'FLGESTADORUB'));

  //FLGUSACODRUBEXT
  If BuscaValorParametro(qryAux, 'FLGUSACODRUBEXT') = #255 then
    InserirParametro(qryAux, 'FLGUSACODRUBEXT','N','0');
  SistemaFolha.FLGUSACODRUBEXT := StrToInt(BuscaValorParametro(qryAux, 'FLGUSACODRUBEXT'));

  //IDRUBCONSIGCREDABONO
  If BuscaValorParametro(qryAux, 'IDRUBCONSIGCREDABONO') = #255 then
    InserirParametro(qryAux, 'IDRUBCONSIGCREDABONO','N','0');
  try
    SistemaFolha.IDRUBCONSIGCREDABONO := StrtoInt(BuscaValorParametro(qryAux, 'IDRUBCONSIGCREDABONO'));
  except
    SistemaFolha.IDRUBCONSIGCREDABONO := 0;
  end;

  //IDRUBIRRFRESERVATRIBREGRESSIVA
  If BuscaValorParametro(qryAux, 'IDRUBIRRFRESERVATRIBREGRESSIVA') = #255 then
    InserirParametro(qryAux, 'IDRUBIRRFRESERVATRIBREGRESSIVA','N','0');
  try
    SistemaFolha.IDRUBIRRFRESERVATRIBREGRESSIVA := StrtoInt(BuscaValorParametro(qryAux, 'IDRUBIRRFRESERVATRIBREGRESSIVA'));
  except
    SistemaFolha.IDRUBIRRFRESERVATRIBREGRESSIVA := 0;
  end;

  if BuscaValorParametro(qryAux, 'IDRUBIRRFVITALICIOREGR') = #255 then
    InserirParametro(qryAux, 'IDRUBIRRFVITALICIOREGR','N','0');
  try
    SistemaFolha.IdRubIRRFVitalicioREGR:=StrtoInt(BuscaValorParametro(qryAux, 'IDRUBIRRFVITALICIOREGR'));
  except
    SistemaFolha.IdRubIRRFVitalicioREGR:=0;
  end;

  if BuscaValorParametro(qryAux, 'IDRUBIRRFABONOREGR') = #255 then
    InserirParametro(qryAux, 'IDRUBIRRFABONOREGR','N','0');
  try
    SistemaFolha.IdRubIRRFAbonoREGR:=StrtoInt(BuscaValorParametro(qryAux, 'IDRUBIRRFABONOREGR'));
  except
    SistemaFolha.IdRubIRRFAbonoREGR:=0;
  end;

  //IDRUBDESCDEPIRRESGATE
  If BuscaValorParametro(qryAux, 'IDRUBDESCDEPIRRESGATE') = #255 then
    InserirParametro(qryAux, 'IDRUBDESCDEPIRRESGATE','N','0');
  try
    SistemaFolha.IDRUBDESCDEPIRRESGATE := StrtoInt(BuscaValorParametro(qryAux, 'IDRUBDESCDEPIRRESGATE'));
  except
    SistemaFolha.IDRUBDESCDEPIRRESGATE := 0;
  end;

  //IDRUBDESCIDADEIRRESGATE
  If BuscaValorParametro(qryAux, 'IDRUBDESCIDADEIRRESGATE') = #255 then
    InserirParametro(qryAux, 'IDRUBDESCIDADEIRRESGATE','N','0');
  try
    SistemaFolha.IDRUBDESCIDADEIRRESGATE := StrtoInt(BuscaValorParametro(qryAux, 'IDRUBDESCIDADEIRRESGATE'));
  except
    SistemaFolha.IDRUBDESCIDADEIRRESGATE := 0;
  end;

  //IDRUBCONSIGDESCABONO
  If BuscaValorParametro(qryAux, 'IDRUBCONSIGDESCABONO') = #255 then
    InserirParametro(qryAux, 'IDRUBCONSIGDESCABONO','N','0');
  try
    SistemaFolha.IDRUBCONSIGDESCABONO := StrtoInt(BuscaValorParametro(qryAux, 'IDRUBCONSIGDESCABONO'));
  except
    SistemaFolha.IDRUBCONSIGDESCABONO := 0;
  end;

  //IDRUBDEDIDADEABONO
  If BuscaValorParametro(qryAux, 'IDRUBDEDIDADEABONO') = #255 then
    InserirParametro(qryAux, 'IDRUBDEDIDADEABONO','N','0');
  try
    SistemaFolha.IDRUBDEDIDADEABONO := StrtoInt(BuscaValorParametro(qryAux, 'IDRUBDEDIDADEABONO'));
  except
    SistemaFolha.IDRUBDEDIDADEABONO := 0;
  end;

  //IDRUBDEDDEPABONO
  If BuscaValorParametro(qryAux, 'IDRUBDEDDEPABONO') = #255 then
    InserirParametro(qryAux, 'IDRUBDEDDEPABONO','N','0');
  try
    SistemaFolha.IDRUBDEDDEPABONO := StrtoInt(BuscaValorParametro(qryAux, 'IDRUBDEDDEPABONO'));
  except
    SistemaFolha.IDRUBDEDDEPABONO := 0;
  end;

  //IDGRUPOREGRAFOLHA
  If BuscaValorParametro(qryAux, 'IDGRUPOREGRAFOLHA') = #255 then
    InserirParametro(qryAux, 'IDGRUPOREGRAFOLHA','N','0');
  try
    SistemaFolha.IDGRUPOREGRAFOLHA := StrtoInt(BuscaValorParametro(qryAux, 'IDGRUPOREGRAFOLHA'));
  except
    SistemaFolha.IDGRUPOREGRAFOLHA := 0;
  end;

  //FLGUSAREGRAXRUB
  If BuscaValorParametro(qryAux, 'FLGUSAREGRAXRUB') = #255 then
    InserirParametro(qryAux, 'FLGUSAREGRAXRUB','N','0');
  SistemaFolha.FLGUSAREGRAXRUB := StrToInt(BuscaValorParametro(qryAux, 'FLGUSAREGRAXRUB'));

  //TIPDOCCONVP
  If BuscaValorParametro(qryAux, 'TIPDOCCONVP') = #255 Then
    InserirParametro(qryAux, 'TIPDOCCONVP','N','0');

  Try
    SistemaFolha.TIPDOCCONVP := StrToInt(BuscaValorParametro(qryAux, 'TIPDOCCONVP'));
  Except
    SistemaFolha.TIPDOCCONVP := 0;
  End;

  //TIPDOCCONVR
  If BuscaValorParametro(qryAux, 'TIPDOCCONVR') = #255 Then
    InserirParametro(qryAux, 'TIPDOCCONVR','N','0');
  Try
    SistemaFolha.TIPDOCCONVR := StrToInt(BuscaValorParametro(qryAux, 'TIPDOCCONVR'));
  Except
    SistemaFolha.TIPDOCCONVR := 0;
  End;

  //CALCSALVIRTTODOMES
  If BuscaValorParametro(qryAux, 'CALCSALVIRTTODOMES') = #255 Then
    InserirParametro(qryAux, 'CALCSALVIRTTODOMES','N','0');
  Try
    SistemaFolha.CALCSALVIRTTODOMES := StrToInt(BuscaValorParametro(qryAux, 'CALCSALVIRTTODOMES'));
  Except
    SistemaFolha.CALCSALVIRTTODOMES := 0;
  End;

  //IDRUBIRRFINSSABONO
  If BuscaValorParametro(qryAux, 'IDRUBIRRFINSSABONO') = #255 Then
    InserirParametro(qryAux, 'IDRUBIRRFINSSABONO','N','0');
  Try
    SistemaFolha.IDRUBIRRFINSSABONO := StrToInt(BuscaValorParametro(qryAux, 'IDRUBIRRFINSSABONO'));
  Except
    SistemaFolha.IDRUBIRRFINSSABONO := 0;
  End;

  //FLGABRERUBACJUD
  If BuscaValorParametro(qryAux, 'FLGABRERUBACJUD') = #255 Then
    InserirParametro(qryAux, 'FLGABRERUBACJUD','N','0');
  Try
    SistemaFolha.FLGABRERUBACJUD := StrToInt(BuscaValorParametro(qryAux, 'FLGABRERUBACJUD'));
  Except
    SistemaFolha.FLGABRERUBACJUD := 0;
  End;

  //FLGCALCULAIRRESGATEISENTO
  If BuscaValorParametro(qryAux, 'FLGCALCULAIRRESGATEISENTO') = #255 Then
    InserirParametro(qryAux, 'FLGCALCULAIRRESGATEISENTO','N','0');
  Try
    SistemaFolha.FLGCALCULAIRRESGATEISENTO := StrToInt(BuscaValorParametro(qryAux, 'FLGCALCULAIRRESGATEISENTO'));
  Except
    SistemaFolha.FLGCALCULAIRRESGATEISENTO := 0;
  End;

  //FLGRECALCULABENEFCOTAS
  If BuscaValorParametro(qryAux, 'FLGRECALCULABENEFCOTAS') = #255 Then
    InserirParametro(qryAux, 'FLGRECALCULABENEFCOTAS','N','0');
  Try
    SistemaFolha.FLGRECALCULABENEFCOTAS := StrToInt(BuscaValorParametro(qryAux, 'FLGRECALCULABENEFCOTAS'));
  Except
    SistemaFolha.FLGRECALCULABENEFCOTAS := 0;
  End;

  //FLGCALCULADIFBENEFCOTAS
  If BuscaValorParametro(qryAux, 'FLGCALCULADIFBENEFCOTAS') = #255 Then
    InserirParametro(qryAux, 'FLGCALCULADIFBENEFCOTAS','N','0');
  Try
    SistemaFolha.FLGCALCULADIFBENEFCOTAS := StrToInt(BuscaValorParametro(qryAux, 'FLGCALCULADIFBENEFCOTAS'));
  Except
    SistemaFolha.FLGCALCULADIFBENEFCOTAS := 0;
  End;

  //IDESTRUTM30
  If BuscaValorParametro(qryAux, 'IDESTRUTM30') = #255 then
    InserirParametro(qryAux, 'IDESTRUTM30','N','0');
  try
    SistemaFolha.IDESTRUTM30 := StrtoInt(BuscaValorParametro(qryAux, 'IDESTRUTM30'));
  except
    SistemaFolha.IDESTRUTM30 := 0;
  end;

  //IDESTRUTM70
  If BuscaValorParametro(qryAux, 'IDESTRUTM70') = #255 then
    InserirParametro(qryAux, 'IDESTRUTM70','N','0');
  try
    SistemaFolha.IDESTRUTM70 := StrtoInt(BuscaValorParametro(qryAux, 'IDESTRUTM70'));
  except
    SistemaFolha.IDESTRUTM70 := 0;
  end;

  //FLGAGRUPARUBRICA
  If BuscaValorParametro(qryAux, 'FLGAGRUPARUBRICA') = #255 then
    InserirParametro(qryAux, 'FLGAGRUPARUBRICA','N','0');
  SistemaFolha.FLGAGRUPARUBRICA := StrToInt(BuscaValorParametro(qryAux, 'FLGAGRUPARUBRICA'));

  //FLGMENSERROVALREGRA
  If BuscaValorParametro(qryAux, 'FLGMENSERROVALREGRA') = #255 then
    InserirParametro(qryAux, 'FLGMENSERROVALREGRA','N','0');
  SistemaFolha.FLGMENSERROVALREGRA := StrToInt(BuscaValorParametro(qryAux, 'FLGMENSERROVALREGRA'));

  //FLGREAJUSTACANCELADO
  If BuscaValorParametro(qryAux, 'FLGREAJUSTACANCELADO') = #255 then
    InserirParametro(qryAux, 'FLGREAJUSTACANCELADO','N','0');
  SistemaFolha.FLGREAJUSTACANCELADO := StrToInt(BuscaValorParametro(qryAux, 'FLGREAJUSTACANCELADO'));

  //FLGPREPARABENEFDESATIVADO
  If BuscaValorParametro(qryAux, 'FLGPREPARABENEFDESATIVADO') = #255 then
    InserirParametro(qryAux, 'FLGPREPARABENEFDESATIVADO','N','0');
  SistemaFolha.FLGPREPARABENEFDESATIVADO := StrToInt(BuscaValorParametro(qryAux, 'FLGPREPARABENEFDESATIVADO'));

  //FLGCANCELAFILHO
  If BuscaValorParametro(qryAux, 'FLGCANCELAFILHO') = #255 then
    InserirParametro(qryAux, 'FLGCANCELAFILHO','N','0');
  SistemaFolha.FLGCANCELAFILHO := StrToInt(BuscaValorParametro(qryAux, 'FLGCANCELAFILHO'));

  //FLGTRATALOTEINDEPENDENTE
  If BuscaValorParametro(qryAux, 'FLGTRATALOTEINDEPENDENTE') = #255 then
    InserirParametro(qryAux, 'FLGTRATALOTEINDEPENDENTE','N','0');
  SistemaFolha.FLGTRATALOTEINDEPENDENTE := StrToInt(BuscaValorParametro(qryAux, 'FLGTRATALOTEINDEPENDENTE'));

  //FLGREAJUSTEEMLOTE
  If BuscaValorParametro(qryAux, 'FLGREAJUSTEEMLOTE') = #255 then
    InserirParametro(qryAux, 'FLGREAJUSTEEMLOTE','N','0');
  SistemaFolha.FLGREAJUSTEEMLOTE := StrToInt(BuscaValorParametro(qryAux, 'FLGREAJUSTEEMLOTE'));

  //FLGCONFIRMANOFINAL
  If BuscaValorParametro(qryAux, 'FLGCONFIRMANOFINAL') = #255 then
    InserirParametro(qryAux, 'FLGCONFIRMANOFINAL','N','0');
  SistemaFolha.FLGCONFIRMANOFINAL := StrToInt(BuscaValorParametro(qryAux, 'FLGCONFIRMANOFINAL'));

  // FLGINTEGRACONTABIL
  If BuscaValorParametro(qryAux, 'FLGINTEGRACONTABIL') = #255 then
    InserirParametro(qryAux, 'FLGINTEGRACONTABIL','N','1');
  SistemaFolha.FLGINTEGRACONTABIL := StrToInt(BuscaValorParametro(qryAux, 'FLGINTEGRACONTABIL'));

  // FLGINTEGRAFINANC
  If BuscaValorParametro(qryAux, 'FLGINTEGRAFINANC') = #255 then
    InserirParametro(qryAux, 'FLGINTEGRAFINANC','N','1');
  SistemaFolha.FLGINTEGRAFINANC := StrToInt(BuscaValorParametro(qryAux, 'FLGINTEGRAFINANC'));

  // IDPROGRAMAFOLHA
  If BuscaValorParametro(qryAux, 'IDPROGRAMAFOLHA') = #255 then
    InserirParametro(qryAux, 'IDPROGRAMAFOLHA','N','0');
  SistemaFolha.IDPROGRAMAFOLHA := StrToInt(BuscaValorParametro(qryAux, 'IDPROGRAMAFOLHA'));

  // FLGCAPCONTROLACPMF
  If BuscaValorParametro(qryAux, 'FLGCAPCONTROLACPMF') = #255 then
    InserirParametro(qryAux, 'FLGCAPCONTROLACPMF','N','0');
  SistemaFolha.FLGCAPCONTROLACPMF := StrToInt(BuscaValorParametro(qryAux, 'FLGCAPCONTROLACPMF'));

  //IDRUBCREDSALFAM
  If BuscaValorParametro(qryAux, 'IDRUBCREDSALFAM') = #255 then
    InserirParametro(qryAux, 'IDRUBCREDSALFAM','N','0');
  try
    SistemaFolha.IDRUBCREDSALFAM := StrtoInt(BuscaValorParametro(qryAux, 'IDRUBCREDSALFAM'));
  except
    SistemaFolha.IDRUBCREDSALFAM := 0;
  end;

  //RegraSalFam
  //Valores fixos foram desabilitados e criada parametrização de regra para
  //  possibilitar o cálculo do salário família por faixa
  If BuscaValorParametro(qryAux, 'REGRASALFAM') = #255 then
    InserirParametro(qryAux, 'REGRASALFAM', 'N', '0');
  try
    SistemaFolha.RegraSalFam:=StrtoInt(BuscaValorParametro(qryAux, 'REGRASALFAM'));
  except
    SistemaFolha.RegraSalFam:=0;
  end;

  //FLGZERABASENEGATIVAPREVIA
  //PARAMETRO PARA CONTROLAR SE BASE DE CALCULO PODE FICAR NEGATIVA
  If BuscaValorParametro(qryAux, 'FLGZERABASENEGATIVAPREVIA') = #255 then
    InserirParametro(qryAux, 'FLGZERABASENEGATIVAPREVIA','N','0');
  try
    SistemaFolha.FlgZeraBaseNegativaPrevia:=StrtoInt(BuscaValorParametro(qryAux, 'FLGZERABASENEGATIVAPREVIA'));
  except
    SistemaFolha.FlgZeraBaseNegativaPrevia:=0;
  end;

  //FLGPARTIDADOBRADA
  //PARAMETRO PARA DEFINIR O TIPO DE LANÇAMENTO CONTABIL
  // A SER FEITO PELA FOLHA (0 - SIMPLES ; 1 - PARTIDA DOBRADA)
  If Fazquery(qryAux,'select pacdobrada from paramcontab') then
  begin
    If qryAux.fieldbyname('PACDOBRADA').asstring = 'N' then
      SistemaFolha.FlgPartidadobrada:=0
    else
      SistemaFolha.FlgPartidadobrada:=1
  end
  else
    SistemaFolha.FlgPartidadobrada:=0;

  if BuscaValorParametro(qryAux, 'FLGCONTROLETIPOREGRA') = #255 then
    InserirParametro(qryAux, 'FLGCONTROLETIPOREGRA','R','0');
  try
    SistemaFolha.FlgControleTipoRegra:=
      strtoint(BuscaValorParametro(qryAux, 'FLGCONTROLETIPOREGRA'));
  except
    SistemaFolha.FlgControleTipoRegra:= 0;
  end;

  if BuscaValorParametro(qryAux, 'FLGACESSOTIPOREGRA') = #255 then
    InserirParametro(qryAux, 'FLGACESSOTIPOREGRA','R','0');
  try
    SistemaFolha.FlgAcessoTipoRegra:=
      strtoint(BuscaValorParametro(qryAux, 'FLGACESSOTIPOREGRA'));
  except
    SistemaFolha.FlgAcessoTipoRegra:=0;
  end;

  if BuscaValorParametro(qryAux, 'TIPOREGRAPADRAO') = #255 then
    InserirParametro(qryAux, 'TIPOREGRAPADRAO','R','0');
  try
    SistemaFolha.TipoRegraPadrao:=
      strtoint(BuscaValorParametro(qryAux, 'TIPOREGRAPADRAO'));
  except
    SistemaFolha.TipoRegraPadrao:= 0;
  end;

  if BuscaValorParametro(qryAux, 'FLGEFETUAPAGTOFAVOUTROS') = #255 then
    InserirParametro(qryAux, 'FLGEFETUAPAGTOFAVOUTROS','R','0');
  try
    SistemaFolha.FlgEfetuaPagtoFavOutros:=
      strtoint(BuscaValorParametro(qryAux, 'FLGEFETUAPAGTOFAVOUTROS'));
  except
    SistemaFolha.FlgEfetuaPagtoFavOutros:=0;
  end;

  if BuscaValorParametro(qryAux, 'MODOCPAGARCONVENIOS') = #255 then
    InserirParametro(qryAux, 'MODOCPAGARCONVENIOS','S','0');
  try
    SistemaFolha.MODOCPAGARCONVENIOS:=
      strtoint(BuscaValorParametro(qryAux, 'MODOCPAGARCONVENIOS'));
  except
    SistemaFolha.MODOCPAGARCONVENIOS:=0;
  end;

  if BuscaValorParametro(qryAux, 'FLGUSABASEMENSALIRRF') = #255 then
    InserirParametro(qryAux, 'FLGUSABASEMENSALIRRF','R','0');
  try
    SistemaFolha.FlgUsaBaseMensalIRRF:=
      strtoint(BuscaValorParametro(qryAux, 'FLGUSABASEMENSALIRRF'))=1;
  except
    SistemaFolha.FlgUsaBaseMensalIRRF:=false;
  end;

  If BuscaValorParametro(qryAux, 'IDRUBBASEMENSALIRRF') = #255 then
    InserirParametro(qryAux, 'IDRUBBASEMENSALIRRF','N','0');
  try
    SistemaFolha.IdRubBaseMensalIRRF:=
      StrtoInt(BuscaValorParametro(qryAux, 'IDRUBBASEMENSALIRRF'));
  except
    SistemaFolha.IdRubBaseMensalIRRF:=0;
  end;

  If BuscaValorParametro(qryAux, 'IDRUBVALORMENSALIRRF') = #255 then
    InserirParametro(qryAux, 'IDRUBVALORMENSALIRRF','N','0');
  try
    SistemaFolha.IdRubValorMensalIRRF:=
      StrtoInt(BuscaValorParametro(qryAux, 'IDRUBVALORMENSALIRRF'));
  except
    SistemaFolha.IdRubValorMensalIRRF:=0;
  end;

  //CORRIGE RESGATE DE RESERVA NO MÊS DE PAGAMENTO
  If BuscaValorParametro(qryAux, 'FLGCORRIGERESERVAMES') = #255 then
    InserirParametro(qryAux, 'FLGCORRIGERESERVAMES','N','0');
  try
    SistemaFolha.FlgCorrigeReservaMes:=StrtoInt(BuscaValorParametro(qryAux,'FLGCORRIGERESERVAMES'));
  except
    SistemaFolha.FlgCorrigeReservaMes:=0;
  end;

  if BuscaValorParametro(qryAux, 'FLGNAORECALCIRPAGPENDENTE') = #255 then
    InserirParametro(qryAux, 'FLGNAORECALCIRPAGPENDENTE','R','0');
  try
    SistemaFolha.FlgNaoRecalcIRPagPendente:=
      strtoint(BuscaValorParametro(qryAux, 'FLGNAORECALCIRPAGPENDENTE'))=1;
  except
    SistemaFolha.FlgNaoRecalcIRPagPendente:=false;
  end;

  if BuscaValorParametro(qryAux, 'FLGABREDOCALT') = #255 then
    InserirParametro(qryAux, 'FLGABREDOCALT','R','0');
  try
    SistemaFolha.FlgAbreDocAlt:=
      strtoint(BuscaValorParametro(qryAux, 'FLGABREDOCALT'))=1;
  except
    SistemaFolha.FlgAbreDocAlt:=false;
  end;

  if BuscaValorParametro(qryAux, 'FLGAGRUPAARQDOCALT') = #255 then
    InserirParametro(qryAux, 'FLGAGRUPAARQDOCALT','R','0');
  try
    SistemaFolha.FlgAgrupaArqDocAlt:=
      strtoint(BuscaValorParametro(qryAux, 'FLGAGRUPAARQDOCALT'))=1;
  except
    SistemaFolha.FlgAgrupaArqDocAlt:=false;
  end;

  if BuscaValorParametro(qryAux, 'FLGINIBEMSGDETPREPARO') = #255 then
    InserirParametro(qryAux, 'FLGINIBEMSGDETPREPARO','R','0');
  try
    SistemaFolha.FlgInibeMsgDetPreparo:=
      strtoint(BuscaValorParametro(qryAux, 'FLGINIBEMSGDETPREPARO'))=1;
  except
    SistemaFolha.FlgInibeMsgDetPreparo:=false;
  end;

  if BuscaValorParametro(qryAux, 'FLGUSAMATRICULACOMPLETA') = #255 then
    InserirParametro(qryAux, 'FLGUSAMATRICULACOMPLETA','R','0');
  try
    SistemaFolha.FlgUsaMatriculaCompleta:=
      strtoint(BuscaValorParametro(qryAux, 'FLGUSAMATRICULACOMPLETA'))=1;
  except
    SistemaFolha.FlgUsaMatriculaCompleta:=false;
  end;

  if BuscaValorParametro(qryAux, 'LIMITEBRUTOINSSXCPMF') = #255 then
    InserirParametro(qryAux, 'LIMITEBRUTOINSSXCPMF','R','0');
  try
    SistemaFolha.LimiteBrutoINSSxCPMF:=strtofloat(BuscaValorParametro(qryAux,
      'LIMITEBRUTOINSSXCPMF'));
  except
    SistemaFolha.LimiteBrutoINSSxCPMF:=0;
  end;

  if BuscaValorParametro(qryAux, 'FLGUSAMATRICULADEPENDENTE') = #255 then
    InserirParametro(qryAux, 'FLGUSAMATRICULADEPENDENTE','R','0');
  try
    SistemaFolha.FlgUsaMatriculaDependente:=
      strtoint(BuscaValorParametro(qryAux, 'FLGUSAMATRICULADEPENDENTE'))=1;
  except
    SistemaFolha.FlgUsaMatriculaDependente:=false;
  end;

  if BuscaValorParametro(qryAux, 'FLGBUSCAADIANTAMENTOPA') = #255 then
    InserirParametro(qryAux, 'FLGBUSCAADIANTAMENTOPA','R','0');
  try
    SistemaFolha.FlgBuscaAdiantamentoPA:=
      strtoint(BuscaValorParametro(qryAux, 'FLGBUSCAADIANTAMENTOPA'))=1;
  except
    SistemaFolha.FlgBuscaAdiantamentoPA:=false;
  end;

  if BuscaValorParametro(qryAux, 'FLGABATETODASRESERVASREGRA') = #255 then
    InserirParametro(qryAux, 'FLGABATETODASRESERVASREGRA','R','0');
  try
    SistemaFolha.FlgAbateTodasReservasRegra:=
      strtoint(BuscaValorParametro(qryAux, 'FLGABATETODASRESERVASREGRA'))=1;
  except
    SistemaFolha.FlgAbateTodasReservasRegra:=false;
  end;

  if BuscaValorParametro(qryAux, 'FLGBUSCAABONOANTERIORPAGO') = #255 then
    InserirParametro(qryAux, 'FLGBUSCAABONOANTERIORPAGO','R','0');
  try
    SistemaFolha.FlgBuscaAbonoAnteriorPago:=
      strtoint(BuscaValorParametro(qryAux, 'FLGBUSCAABONOANTERIORPAGO'))=1;
  except
    SistemaFolha.FlgBuscaAbonoAnteriorPago:=false;
  end;

  if BuscaValorParametro(qryAux, 'FLGGERAALTERADORESCAPCONVENIO') = #255 then
    InserirParametro(qryAux, 'FLGGERAALTERADORESCAPCONVENIO','R','0');
  try
    SistemaFolha.FlgGeraAlteradoresCAPConvenio:=
      strtoint(BuscaValorParametro(qryAux, 'FLGGERAALTERADORESCAPCONVENIO'))=1;
  except
    SistemaFolha.FlgGeraAlteradoresCAPConvenio:=false;
  end;

  if BuscaValorParametro(qryAux, 'TIPOMARGEMDESCONTO') = #255 then
    InserirParametro(qryAux, 'TIPOMARGEMDESCONTO','R','0');
  try
    SistemaFolha.TipoMargemDesconto:=
      strtoint(BuscaValorParametro(qryAux, 'TIPOMARGEMDESCONTO'));
  except
    SistemaFolha.TipoMargemDesconto:=0;
  end;

  if BuscaValorParametro(qryAux, 'VLRMARGEMDESCONTO') = #255 then
    InserirParametro(qryAux, 'VLRMARGEMDESCONTO','R','0');
  try
    SistemaFolha.VlrMargemDesconto:=
      strtofloat(BuscaValorParametro(qryAux, 'VLRMARGEMDESCONTO'));
  except
    SistemaFolha.VlrMargemDesconto:=0;
  end;

  if BuscaValorParametro(qryAux, 'FLGUSAPROVISAOABONO') = #255 then
    InserirParametro(qryAux, 'FLGUSAPROVISAOABONO', 'R', '0');
  try
    SistemaFolha.FlgUsaProvisaoAbono:=
      strtoint(BuscaValorParametro(qryAux, 'FLGUSAPROVISAOABONO')) = 1;
  except
    SistemaFolha.FlgUsaProvisaoAbono:=false;
  end;

  if BuscaValorParametro(qryAux, 'FLGFORCADATAFINALRUBINDIV') = #255 then
    InserirParametro(qryAux, 'FLGFORCADATAFINALRUBINDIV', 'R', '0');
  try
    SistemaFolha.FlgForcaDataFinalRubIndiv:=
      strtoint(BuscaValorParametro(qryAux, 'FLGFORCADATAFINALRUBINDIV')) = 1;
  except
    SistemaFolha.FlgForcaDataFinalRubIndiv:=false;
  end;

  if BuscaValorParametro(qryAux, 'FORMAPARCELAPREVIA') = #255 then
    InserirParametro(qryAux, 'FORMAPARCELAPREVIA', 'R', '0');
  try
    SistemaFolha.FormaParcelaPrevia:=
      strtoint(BuscaValorParametro(qryAux, 'FORMAPARCELAPREVIA'));
  except
    SistemaFolha.FormaParcelaPrevia:=0;
  end;

  if BuscaValorParametro(qryAux, 'PREPARORETIDOABONO') = #255 then
    InserirParametro(qryAux, 'PREPARORETIDOABONO', 'R', '0');
  try
    SistemaFolha.PreparoRetidoAbono:=
      strtoint(BuscaValorParametro(qryAux, 'PREPARORETIDOABONO'));
  except
    SistemaFolha.PreparoRetidoAbono:=0;
  end;

  if BuscaValorParametro(qryAux, 'PREPARORETIDOMENSAL') = #255 then
    InserirParametro(qryAux, 'PREPARORETIDOMENSAL', 'R', '0');
  try
    SistemaFolha.PreparoRetidoMensal:=
      strtoint(BuscaValorParametro(qryAux, 'PREPARORETIDOMENSAL'));
  except
    SistemaFolha.PreparoRetidoMensal:=0;
  end;

  if BuscaValorParametro(qryAux, 'RATEIOPLANORUBRICA') = #255 then
    InserirParametro(qryAux, 'RATEIOPLANORUBRICA', 'R', '0');
  try
    SistemaFolha.RateioPlanoRubrica:=
      strtoint(BuscaValorParametro(qryAux, 'RATEIOPLANORUBRICA'));
  except
    SistemaFolha.RateioPlanoRubrica:=0;
  end;

  if BuscaValorParametro(qryAux, 'MANTEMMESREFCONSTANTERB') = #255 then
    InserirParametro(qryAux, 'MANTEMMESREFCONSTANTERB', 'R', '0');
  try
    SistemaFolha.MantemMesRefConstanteRB:=
      strtoint(BuscaValorParametro(qryAux, 'MANTEMMESREFCONSTANTERB'));
  except
    SistemaFolha.RateioPlanoRubrica:=0;
  end;

  if BuscaValorParametro(qryAux, 'VERIFICARECEBEDORDUPLICADO') = #255 then
    InserirParametro(qryAux, 'VERIFICARECEBEDORDUPLICADO', 'R', '0');
  try
    SistemaFolha.VerificaRecebedorDuplicado :=
      strtoint(BuscaValorParametro(qryAux, 'VERIFICARECEBEDORDUPLICADO'));
  except
    SistemaFolha.VerificaRecebedorDuplicado := 0;
  end;

  if BuscaValorParametro(qryAux, 'DESATIVACAOAUTOMATICARUBRICAINDIV') = #255 then
    InserirParametro(qryAux, 'DESATIVACAOAUTOMATICARUBRICAINDIV', 'R', '0');
  try
    SistemaFolha.DesativacaoAutomaticaRubricaIndiv:=
      strtoint(BuscaValorParametro(qryAux, 'DESATIVACAOAUTOMATICARUBRICAINDIV'));
  except
    SistemaFolha.DesativacaoAutomaticaRubricaIndiv:= 0;
  end;

  //edilaine SIG136670 : inicio
  If BuscaValorParametro(qryAux, 'FLGDESCSIMPLESIRRF') = #255 then
    InserirParametro(qryAux, 'FLGDESCSIMPLESIRRF','N','0');
  try
    SistemaFolha.FlgDescSimplesIRRF := StrtoInt(BuscaValorParametro(qryAux, 'FLGDESCSIMPLESIRRF'));
  except
    SistemaFolha.FlgDescSimplesIRRF := 0;
  end;

  If BuscaValorParametro(qryAux, 'RUBRICAIRDESCSIMPLES') = #255 then
    InserirParametro(qryAux, 'RUBRICAIRDESCSIMPLES','N','0');
  try
    SistemaFolha.IDRubricaIrDescSimples := StrtoInt(BuscaValorParametro(qryAux, 'RUBRICAIRDESCSIMPLES'));
  except
    SistemaFolha.IDRubricaIrDescSimples := 0;
  end;

  If BuscaValorParametro(qryAux, 'RUBRICAIRDESCSIMPLESAB') = #255 then
    InserirParametro(qryAux, 'RUBRICAIRDESCSIMPLESAB','N','0');
  try
    SistemaFolha.IDRubricaIrDescSimplesAbn := StrtoInt(BuscaValorParametro(qryAux, 'RUBRICAIRDESCSIMPLESAB'));
  except
    SistemaFolha.IDRubricaIrDescSimplesAbn := 0;
  end;


  If BuscaValorParametro(qryAux, 'RUBIRDESCSIMPLESINSS') = #255 then
    InserirParametro(qryAux, 'RUBIRDESCSIMPLESINSS','N','0');
  try
    SistemaFolha.IDRubIrDescSimplesInss := StrtoInt(BuscaValorParametro(qryAux, 'RUBIRDESCSIMPLESINSS'));
  except
    SistemaFolha.IDRubIrDescSimplesInss := 0;
  end;

  If BuscaValorParametro(qryAux, 'RUBIRDESCSIMPLESINSSAB') = #255 then
    InserirParametro(qryAux, 'RUBIRDESCSIMPLESINSSAB','N','0');
  try
    SistemaFolha.IDRubIrDescSimplesInssAbn := StrtoInt(BuscaValorParametro(qryAux, 'RUBIRDESCSIMPLESINSSAB'));
  except
    SistemaFolha.IDRubIrDescSimplesInssAbn := 0;
  end;

  If BuscaValorParametro(qryAux, 'FLGDESCSIMPLESIDADE') = #255 then
    InserirParametro(qryAux, 'FLGDESCSIMPLESIDADE','N','0');

  If BuscaValorParametro(qryAux, 'FLGDESCSIMPLESDEPEND') = #255 then
    InserirParametro(qryAux, 'FLGDESCSIMPLESDEPEND','N','0');

  If BuscaValorParametro(qryAux, 'DEDUCAODESCSIMPLES') = #255 then
    InserirParametro(qryAux, 'DEDUCAODESCSIMPLES','N','0');
  //edilaine SIG136670 : fim


   //edilaine WO29808: inicio
  If BuscaValorParametro(qryAux, 'FLGNOVOIREXTERIOR') = #255 then
    InserirParametro(qryAux, 'FLGNOVOIREXTERIOR','N','0');
  try
    SistemaFolha.FlgNovoIrExterior := StrtoInt(BuscaValorParametro(qryAux, 'FLGNOVOIREXTERIOR'));
  except
    SistemaFolha.FlgNovoIrExterior := 0;
  end;
   //edilaine WO29808 : fim
end;


Function InserirParametro(qryAux: twwquery; sNomeParm , sTipoParm, svalorParm : String) : Boolean;
begin
  If Length(Trim(sNomeParm)) > 50 then
    sNomeParm := Copy(sNomeParm,1,50);
  qryAux.close;
  qryAux.sql.clear;
  qryAux.sql.add('INSERT INTO PARAMFOLHA ');
  qryAux.sql.add('(IDFUNDACAO, NOMEPARAM, TIPOPARAM, VALORPARAM)');
  qryAux.sql.add(' VALUES ');
  qryAux.sql.add('(:PIDFUNDACAO, :PNOMEPARAM, :PTIPOPARAM, :PVALORPARAM)');
  qryAux.parambyname('PIDFUNDACAO').asInteger := Sistema.IdEmpresa;
  qryAux.parambyname('PNOMEPARAM').asString := sNomeParm;
  qryAux.parambyname('PTIPOPARAM').asString := sTipoParm;
  If sTipoParm <> 'R' then
    qryAux.parambyname('PVALORPARAM').asString := sValorParm
  else
    qryAux.parambyname('PVALORPARAM').asString := SistemaFolha.Oranumero(sValorParm);
  try
    if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;
    qryAux.ExecSQL;
    dtmBaseDados.dbBaseDados.Commit;
    result := true;
  except
    result := false;
  end;
end;

Function AlterarParametro(qryAux: twwquery; sNomeParm , svalorParm : String) : Boolean;
begin
  qryAux.close;
  qryAux.sql.clear;
  qryAux.sql.add(' UPDATE PARAMFOLHA ');
  qryAux.sql.add(' SET VALORPARAM = :PVALORPARM');
  qryAux.sql.add(' WHERE IDFUNDACAO = :PIDFUNDACAO');
  qryAux.sql.add(' AND NOMEPARAM = :PNOMEPARAM');
  qryAux.parambyname('PIDFUNDACAO').asInteger := Sistema.IdEmpresa;
  qryAux.parambyname('PNOMEPARAM').asString   := sNomeParm;
  qryAux.parambyname('PVALORPARM').asString  := sValorParm;
  try
    if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;
    qryAux.ExecSQL;
    dtmBaseDados.dbBaseDados.Commit;
    result := true;
  except
    result := false;
  end;
end;

Function BuscaValorParametro (qryAux: twwquery; sNomeParm : String) : String;
VAR
   valtmp : String;
begin
  valtmp := #255;
  qryAux.close;
  qryAux.sql.clear;
  qryAux.sql.add(' SELECT VALORPARAM,TIPOPARAM FROM PARAMFOLHA ');
  qryAux.sql.add(' WHERE IDFUNDACAO = :PIDFUNDACAO AND');
  qryAux.sql.add(' NOMEPARAM = :PNOMEPARAM ');
  qryAux.parambyname('PIDFUNDACAO').asInteger := Sistema.IdEmpresa;
  qryAux.parambyname('PNOMEPARAM').asString   := sNomeParm;
  qryAux.open;
  If not qryAux.eof then
  begin
    valtmp := Trim(qryAux.fieldbyname('VALORPARAM').asstring);
    If ((sNomeParm <> 'CODCCUSTOFINAN') and (sNomeParm <> 'MASCARAMATRICULA')) then
      If valtmp = '' then
        valtmp := '0';
  end;
  result := valTmp;
end;

end.
{------------------------------------------------------------------------------|
| UNIT: UFOLHABENEF                                                            |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   Parametros Globais do Sistema                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 04/03/2002 A 05/03/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12E                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - CRIAÇÃO DA UNIT                                                         |
|     - Esta Unit contem todo o novo esquema de criação de parametros globais  |
|       da Folha de Beneficios                                                 |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 11/03/2002 A 12/03/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12E                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - INCLUSÃO DOS PARAMETROS RELATIVOS A PARAMETRIZAÇÃO CONTÁBIL-FINANCEIRA  |
|       PADRÃO.                                                                |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 24/06/2002 A 25/06/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - Inclusão do parâmetro relativo ao controle de cálculo automático de     |
|      dependentes para imposto de renda e dependentes de salário família.     |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 09/07/2002 A 09/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - Inclusão do parâmetro relativo ao controle do estado em que se encontra |
|      as rubricas.                                                            |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 10/07/2002 A 10/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - Inclusão do parâmetro para saber a qual grupo da regra que a rubrica    |
|    pertence.                                                                 |
|    - Inclusão do parâmetro para saber se o sisttema vai usar somente as      |
|    rubricas associadas as regras da folha ou não.                            |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 18/07/2002 A 18/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (REFER)                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - Inclusão do parâmetro para integração contábil.                         |
|    - Inclusão do parâmetro para integração com o Financeiro.                 |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 22/07/2002 A 22/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Criação do parametro IDPROGRAMAFOLHA do contas a pagar .                   |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 29/07/2002 A 29/07/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13i                                              |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Criação do parametro FLGNUMLOTES que determina a quantidade de lotes que   |
|   podem estar abertos simultaneamente.                                       |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 31/07/2002 A 31/07/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13k                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Inclusao dos novos parametros IDRUBCREDSALFAM, VALORSALFAM e TETOSALFAM    |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 06/08/2002 A 06/08/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13L                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Inclusao do novo parametro MASCARAMATRICULA                                |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: 07/08/2002 A 07/08/2002                            |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - Inclusão do parâmetro para saber o sistema irá agrupar por rubrica ou    |
|   não principalmente em demonstrativos de pagamento.                         |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 19/08/2002 A 19/08/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13o                                              |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Implementei os parametros relativos a margem de 30% e 70%                  |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 02/09/2002 A 02/09/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - CONTROLA SE BASES CALCULADAS NA PREVIA PODEM SER NEGATIVAS                 |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: 19/11/2002 A 19/11/2002                            |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - Inclusão do parâmetro que controla se exibe mensagem de erro do valor da |
|   regra.                                                                     |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: 18/12/2002 A 18/12/2002                            |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - Inclusão de quatro parâmetros que serão usados no preparo e um que       |
|   será usado na prévia com nome de FlgTrataLoteIndependente.                 |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: 20/12/2002 A 20/12/2002                            |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - Inclusão do parâmetro FlgConfirmaNoFinal.                                |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: 10/01/2003 A 10/01/2003                            |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - Inclusão dos parãmetros TipDocConvP e TipDocConvR.                       |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: 24/01/2003 A 24/01/2003                            |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - Inclusão dos parâmetros IdRubIRRFINSSAbono, FlgAbreRubAcJud e           |
|    CalcSalVirtTodoMes.                                                       |
|                                                                              |
|  IdRubIRRFINSSAbono (Pendência 11428)                                        |
|  FlgAbreRubAcJud    (Pendência 11167)                                        |
|  CalcSalVirtTodoMes (Pendência 10794)                                        |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: 10/04/2003 A 10/04/2003                            |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - Inclusão do parâmetro FlgCalcPensAlimAntPrevia;                         |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 24/04/2003 A 24/04/2003                         |
| PENDÊNCIA: 13825                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: FUNCEF                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| Carga de Parâmetro para verificar o cadastramento de regras na Rubrica       |
| Individual e ação judicial verificando as regras agrupadas no mesmo          |
| tipo de regra.                                                               |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 24/04/2003 A 24/04/2003                         |
| PENDÊNCIA: 13824                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: FUNCEF                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| Carga do parâmetro de tipo de regra padrão sobre o qual a verificação de     |
| cadastramento por tipo de regra não será realizada.                          |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 06/05/2003 A 06/05/2003                         |
| PENDÊNCIA: 13822                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.05                                               |
| CLIENTE: FUNCEF                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| CARGA DO PARÂMETRO PARA CONTROLE DE PROCESSAMENTO DE PAGAMENTOS PARA FAVO-   |
| RECIDOS REGISTRADOS NA PASTA OUTRAS RUBRICAS DA RUBRICA INDIVIDUAL.          |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: 30/07/2003 A 30/07/2003                            |
| PENDÊNCIA: 14757                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.00c                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Ao abrir a tela de parâmetro aparece uma mensagem de erro. Faltou inicia-  |
| lizar o parâmetro MODOCPAGARCONVENIOS na inicialização a aplicação.          |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 04/08/2003 A 04/08/2003                         |
| PENDÊNCIA: 14554                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.05.00                                               |
| CLIENTE: CBS                                                                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - CRIAÇÃO DE PARÂMETROS PARA CONTROLAR A UTILIZAÇÃO NA PREVIA DA BASE DE IRRF|
| GERADA NO MÊS EM OUTRAS VERSÕES DA FOLHA NO MESMO MÊS PELA DATA DE PAGTO.    |
|------------------------------------------------------------------------------|}

