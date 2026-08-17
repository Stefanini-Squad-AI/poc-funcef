//Alterações
{
//***************************************************************************************
//Rotina: AtualizaSaldoConta
//Nº SOL: 234860
//Nº PPM: 445467
//Data da Alteração: 14/07/2014
//Alteração Form: Não foi efetuada alteração de Form
//Responsável: Sadi Freire
//Descrição: Correção da reversão do saldo durante exclusão de transferencia de contas
//**************************************************************************************
--------------------------------------------------------------------------------------------------
Rotina    : GravaSuplemeDeducaoPorGrupo, GravouCompromissoXAjuste, AtualizaSaldoConta, ExcluiCompromissoXAjuste
            ExcluiSuplemeDeducaoPorGrupo
Data      : 10/05/2013
Autor     : Edilaine Ferraresi
Sol       : 190488
Kintana   : 1909246
Descrição : adequação do rateio e obritatoriedade de sub-despesa
{ --------------------------------------------------------------------------------------------------
Data      : 15/01/2013
Autor     : Edilaine Ferraresi
Sol       : 172383-7762
Kintana   : 1556974
Rotina    : varias (uso do plano orçamentario selecionado no grupo)
Descrição : retirada do parametro PLANO ORÇAMENTARIO e MÁSCARA da parametrização do módulo
{ --------------------------------------------------------------------------------------------------
Nº SOL......: 193146
Nº KINTANA..: 1940385
Data........: 19/02/2013
Responsável.: Rodrigo / Edilaine
Rotina......: GravarTransferenciasPorGrupo
Descrição...: ajustes para utilização correta da funcionalide
{ --------------------------------------------------------------------------------------------------
Rotina......: ExcluiTransferenciasPorGrupo
Nº SOL......: 163908
Nº KINTANA..: 1403202
Data........: 12/01/2012
Responsável.: Edilaine Ferraresi
Descrição...: fazer a exclusão de contas de origem e destino considerando o campo FLGTIPOCONTA
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: AtualizaSaldoConta, GravouCompromissoXAjuste e ExcluiCompromissoXAjuste
Nº SOL......: 153584/4161
Nº KINTANA..: 1170663
Data........: 15/01/2011
Responsável.: Brunno Mattos
Descrição...: Cria funções para alimentar tabela associativa.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: AtualizaSaldoConta
Nº SOL......: 153584
Nº KINTANA..: 1159883
Data........: 01/03/2010
Responsável.: Brunno Mattos
Descrição...: efetua compromisso ao lançar um ajuste
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: ExcluiSuplemeDeducaoPorGrupo
Nº SOL......: 152922/4001
Nº KINTANA..: 1161267
Data........: 28/02/2011
Responsável.: Brunno Mattos
Descrição...: Inclusão de novo parêmetro a função para saber se esta sendo feita uma atualização para
              suplementação ou para transferências.
----------------------------------------------------------------------------------------------------}

unit uCtrlAlterorcamento;

interface

Uses DB, uDataBase, uCmControlObject, dbclient, uMidasUtil,
     sysutils,wwQuery, provider, uDbAlterorcamento, uCMTypes, uFuncoesOrcamento,
     uString,uCMMath;

Type
  TCtrlAlterorcamento = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;Override;
  private
    _dbAlterorcamento: TdbAlterorcamento;
    FCdsAlterorcamento: TClientDataSet;
    FCdsOrigem: TClientDataSet;
    FCdsDestino: TClientDataSet;
    procedure SetCdsAlterorcamento(const Value: TClientDataSet);
    procedure SetCdsDestino(const Value: TClientDataSet);
    procedure SetCdsOrigem(const Value: TClientDataSet);
  public
      Constructor Create; Override;
      Destructor  Destroy;Override;

      Function LerUltimaSequencia : Integer;

      property CdsAlterorcamento: TClientDataSet read FCdsAlterorcamento write SetCdsAlterorcamento;

      property CdsOrigem: TClientDataSet read FCdsOrigem write SetCdsOrigem;
      property CdsDestino: TClientDataSet read FCdsDestino write SetCdsDestino;

      function AplicaOperacaoAlterorcamento : Boolean;
      function Procurar(idalterorcamento:Double): OleVariant;
      function ProxSuplemen(idpessoa: double) : OleVariant;
      procedure CriaSuplementacao(idalterorcamento, numalteracao, 
        idplanoorcamen, idpessoa, exercicio, periodo: integer; idcontaorigem,
        datareferencia, obsalterorcamento: string; vlrsolicitado: double);

      function ListaAlterOrcamento(iIdAlterOrcamento: integer): OleVariant;
      //function GravarTransferenciasPorGrupo(iIdPlanoOrc: integer; var iIdOperacao: integer) : boolean;       // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974 - comentado
      function GravarTransferenciasPorGrupo(iIdPlanoOrcOri, iIdPlanoOrcDest: integer; var iIdOperacao: integer) : boolean;      // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
      //function ExcluiTransferenciasPorGrupo(iIdPlanoOrc: integer) : boolean;      // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974 - comentado
      function ExcluiTransferenciasPorGrupo(iIdPlanoOrcOri, iIdPlanoOrcDest:integer) : boolean;      // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
      function AtualizaSaldoConta(sIdConta: string;
                                  iPerido,
                                  iExercicio,
                                  iIdPessoa,
                                  iIdPlanoOrc,
                                  idSubDespesa: integer;
                                  rValor: Double;
                                  isAjuste: Boolean = False;
                                  isTransferencia : Boolean = False
                                  ): boolean;  // Edilaine - SOL 193146 / KTN 1940385

      function GravaSuplemeDeducaoPorGrupo(iIdPlanoOrc: integer; var iIdOperacao: integer): Boolean;
      function ExcluiSuplemeDeducaoPorGrupo(iIdPlanoOrc: integer): Boolean;
      function GravouCompromissoXAjuste(iIdOperacaoCompromisso,
                                        iIdOperacaoAjuste: Integer): Boolean;
      function ExcluiCompromissoXAjuste(iIdOperacaoAjuste : Integer): Boolean;


  end;

implementation


procedure TCtrlAlterorcamento.DoChangeDataBase;
begin
  inherited;
  _dbAlterorcamento.DatabaseName := DataBaseName;
end;

procedure TCtrlAlterorcamento.OnCreateAppServer;
begin
  inherited;
  FCdsAlterorcamento := TClientDataSet.Create(nil);
end;

constructor TCtrlAlterorcamento.Create;
begin
  inherited;
  _dbAlterorcamento := TdbAlterorcamento.Create(Self);
end;

destructor TCtrlAlterorcamento.Destroy;
begin
  inherited;
  _dbAlterorcamento.Free;
  if isAppServer then begin
    FreeCds([FCdsAlterorcamento]);
  end;
end;

function TCtrlAlterorcamento.AplicaOperacaoAlterorcamento: Boolean;
begin
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.AplicaOperacaoAlterorcamento(FCdsAlterorcamento.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      MessageInfo := '';
      Try
         StartTransaction;
         Result := ApplyCDS(FCdsAlterorcamento,_DbAlterorcamento,[],[]);
         If Not Result Then Begin
            MessageInfo := _DbAlterorcamento.MessageInfo;
            Abort;
         End Else
            Commit;
      Except
         On E:Exception Do Begin
            Result := False;
            Rollback;
            MessageInfo := MessageInfo + E.Message;
         End;
      End;
   End;
end;



function TCtrlAlterorcamento.Procurar(idalterorcamento:Double): OleVariant;
begin
   _DbAlterorcamento.Idalterorcamento.AsFloat := idalterorcamento;
   Result := GetDataPacket(_DbAlterorcamento.SSqlSelect);
end;

procedure TCtrlAlterorcamento.SetCdsAlterorcamento(
  const Value: TClientDataSet);
begin
  FCdsAlterorcamento := Value;
end;

function TCtrlAlterorcamento.ProxSuplemen(idpessoa: double) : OleVariant;
var sSQl : String;
begin
   sSql := 'SELECT                                        ' +
           '   MAX(NUMALTERACAO) AS PROXIMA               ' +
           'FROM                                          ' +
           '   ALTERORCAMENTO                             ' +
           'WHERE                                         ' +
           '   IDPESSOA = ' + TrocaVPP(FloatToStr(idpessoa));
   Result := GetDataPacket(sSql);
end;

procedure TCtrlAlterorcamento.CriaSuplementacao(idalterorcamento, numalteracao,
  idplanoorcamen, idpessoa, exercicio, periodo: integer; idcontaorigem,
  datareferencia, obsalterorcamento: string; vlrsolicitado: double);
var sSQl : String;
begin
  sSql := 'INSERT INTO ALTERORCAMENTO ' +
          '(IDALTERORCAMENTO, IDPESSOA, EXERCICIOORIGEM, PERIODOORIGEM, ' +
          'IDPLANOORCAMEN, IDCONTAORIGEM, OBSALTERORCAMEN, VLRSOLICITADO, ' +
          'DATAREFERENCIA, NUMALTERACAO, FLGTIPOALTER) VALUES ' +
          '(' + IntToStr(idalterorcamento) + ', ' + IntToStr(idpessoa) +
          ', ' + IntToStr(exercicio) + ', ' + IntToStr(periodo) +
          ', ' + IntToStr(idplanoorcamen) + ', ''' + idcontaorigem +
          ''', ''' + obsalterorcamento + ''',' +
          TrocaVPP(FloatToStr(vlrsolicitado)) +
          ', TO_DATE(''' + datareferencia + ''',''DD/MM/YYYY''), ' +
          IntToStr(numalteracao) + ', ''S'')';
  ExecSQL(sSql);
end;




//************************************************
Function TCtrlAlterorcamento.LerUltimaSequencia : Integer;
Begin

  Result := GetSequence( 'ALTERORCAMENTO' );
End;




//************************************************
function TCtrlAlterorcamento.ListaAlterOrcamento(
  iIdAlterOrcamento: integer): OleVariant;
begin
    Result := GetDataPacket('SELECT ' +
                            '   0 AS SALDOCONTAORIGEM, ' +
                            '   IDGRUPOORCORIGEM, ' +
                            '   IDGRUPOORCDESTINO, ' +
                            '   IDALTERORCAMENTO, ' +
                            '   EXERCICIODESTINO, ' +
                            '   PERIODODESTINO, ' +
                            '   IDPESSOA, ' +
                            '   EXERCICIOORIGEM, ' +
                            '   PERIODOORIGEM, ' +
                            '   IDPLANOORCAMEN, ' +
                            '   IDCONTAORIGEM, ' +
                            '   IDCONTADESTINO, ' +
                            '   OBSALTERORCAMEN, ' +
                            '   VLRSOLICITADO, ' +
                            '   DATAREFERENCIA, ' +
                            '   NUMALTERACAO, ' +
                            '   FLGTIPOALTER ' +
                            'FROM ' +
                            '   ALTERORCAMENTO ' +
                            'WHERE ' +
                            '   IDALTERORCAMENTO = ' + IntToStr(iIdAlterOrcamento));

end;




function TCtrlAlterorcamento.GravarTransferenciasPorGrupo(iIdPlanoOrcOri, iIdPlanoOrcDest: integer;  var iIdOperacao: integer): boolean;
var
  iNumAlteracao: integer;
  sAux: string;

begin
   try

     StartTransaction;

     // Pega o próximo número de transferência
     _Cds.Data     := ProxSuplemen(FCdsAlterorcamento.FieldByName('IDPESSOA').AsFloat);
     iNumAlteracao := (_Cds.FieldByName('PROXIMA').AsInteger + 1);

     // Instancia a variável que irá relacionar as transferências
     //efetuadas no processo corrente
     iIdOperacao := GetSequence('IDOPERACAOORC');

     sAux := '  Operação nº ' + IntToStr(iIdOperacao);

     FCdsAlterorcamento.DisableControls;  // Edilaine - SOL 193146 / KTN 1940385

     FCdsAlterorcamento.First;
     while not FCdsAlterorcamento.Eof do
     begin
        FCdsAlterorcamento.Edit;
        FCdsAlterorcamento.FieldByName('NUMALTERACAO').AsInteger   := iNumAlteracao;
        FCdsAlterorcamento.FieldByName('IDOPERACAO').AsInteger     := iIdOperacao;
        FCdsAlterorcamento.FieldByName('OBSALTERORCAMEN').AsString := FCdsAlterorcamento.FieldByName('OBSALTERORCAMEN').AsString + sAux;
        FCdsAlterorcamento.Post;

        Inc(iNumAlteracao);
        FCdsAlterorcamento.Next;
     end;

        // (-) Retirando saldo da conta de origem
     //Brunno Mattos SOL 154957  KTN 1193108 - Troca FCdsAlterorcamento por FCdsOrigem
     FCdsOrigem.First;
     while not FCdsOrigem.Eof do
     begin

        if not AtualizaSaldoConta(FCdsOrigem.FieldByName('IDCONTAORCAMEN').AsString, //IDCONTAORIGEM
                                  FCdsOrigem.FieldByName('PERIODO').AsInteger,//PERIODOORIGEM
                                  FCdsOrigem.FieldByName('EXERCICIO').AsInteger,//EXERCICIOORIGEM
                                  FCdsOrigem.FieldByName('IDPESSOA').AsInteger,
                                  iIdPlanoOrcOri,
                                  FCdsOrigem.FieldByName('IDDESPESAORC').AsInteger,     // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
                                  //Brunno Mattos SOL 154957  KTN 1193108 retirei opercação * -1
                                  (FCdsOrigem.FieldByName('VLRSOLICITADO').AsFloat),
                                  False, //Brunno Mattos SOL 154957  KTN 1193108
                                  True //Brunno Mattos SOL 154957  KTN 1193108
                                  ) then  // Edilaine - SOL 193146 / KTN 1940385
           raise Exception.Create('Não foi possível retirar o saldo da conta de origem');
        FCdsOrigem.Next;
     end;


     // (+) Inserindo saldo para a conta de destino
     //Brunno Mattos SOL 154957  KTN 1193108 - Troca FCdsAlterorcamento por FCdsDestino
     FCdsDestino.First;
     while not FCdsDestino.Eof do
     begin
        if not AtualizaSaldoConta(FCdsDestino.FieldByName('IDCONTAORCAMEN').AsString,//IDCONTADESTINO
                                  FCdsDestino.FieldByName('PERIODO').AsInteger,//PERIODODESTINO
                                  FCdsDestino.FieldByName('EXERCICIO').AsInteger,//EXERCICIODESTINO
                                  FCdsDestino.FieldByName('IDPESSOA').AsInteger,
                                  iIdPlanoOrcDest,
                                  FCdsDestino.FieldByName('IDDESPESAORC').AsInteger,    // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
                                  //Brunno Mattos SOL 154957  KTN 1193108
                                  FCdsDestino.FieldByName('VLRSOLICITADO').AsFloat,
                                  False, //Brunno Mattos SOL 154957  KTN 1193108
                                  True,  //Brunno Mattos SOL 154957  KTN 1193108
                                  ) then  // Edilaine - SOL 193146 / KTN 1940385
           raise Exception.Create('Não foi possível inserir saldo para a conta de destino');
        FCdsDestino.Next;
     end;

     FCdsAlterorcamento.EnableControls;  // Edilaine - SOL 193146 / KTN 1940385


     Result := ApplyCds(FCdsAlterorcamento,_dbAlterorcamento,[],[]);

     if not Result then
        raise Exception.Create(_dbAlterorcamento.MessageInfo);

     Commit;

   except
      On E:Exception Do
      Begin
         Result := False;
         Rollback;
         MessageInfo := MessageInfo + E.Message;
      End;
   end;
end;




function TCtrlAlterorcamento.AtualizaSaldoConta(sIdConta: string; iPerido,
  iExercicio, iIdPessoa, iIdPlanoOrc, idSubDespesa: integer; rValor: Double;
  isAjuste: Boolean = False ; isTransferencia : Boolean = False) : boolean;  // Edilaine - SOL 193146 / KTN 1940385
  //Brunno Mattos SOL 154957  KTN 1193108 adiciona isTransferencia
var
   CdsAux: TClientDataSet;
   //Brunno Mattos SOL 153584/4161  KTN 1170663 inclui rVlrAtualizacaoAux, caso esta rotina seja chamada a partir
   //de Ajuste(Suplementação) o VLRORCADO não deve ser atualizado.
   rVlrAtualizacao, rVlrAtualizacaoAux: Double;
   sSQL: string;
   bTemSaldo: boolean;

begin
   try
      CdsAux := TClientDataSet.Create(nil);

      // Seleciona as quantidades de linhas, referente aos lançamentos
      //efetuados na tabela SALDOORCAMEN
      sSQL := 'SELECT COUNT(IDCONTAORCAMEN) AS TOTAL ' +
              'FROM SALDOORCADO ' +
              'WHERE ' +
              ' (IDCONTAORCAMEN = ' + QuotedStr(sIdConta)  + ') AND ' +
              ' (IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc)+ ') AND ' +
              ' (IDPESSOA       = ' + IntToStr(iIdPessoa)  + ') AND ' +
              ' (PERIODO   = ' + IntToStr(iPerido) + ') AND ' +
              ' (EXERCICIO = ' + IntToStr(iExercicio) + ') AND '+
              ' (IDDESPESAORC = ' + IntToStr(idSubDespesa) + ')';   // Edilaine - SOL 193146 / KTN 1940385

      CdsAux.Data := GetDataPacket(sSQL);

      //Rateia o valor da atualização de acordo com os lançamentos de saldo para a conta
      if CdsAux.FieldByName('TOTAL').AsInteger > 0 then
      begin
         rVlrAtualizacao := RoundCM((rValor / CdsAux.FieldByName('TOTAL').AsInteger),2);
         bTemSaldo       := True;
      end
      else
      begin
         rVlrAtualizacao := rValor;
         bTemSaldo       := False;
      end;


      // Atualiza o saldo da conta com os valores proporcionais para cada registro
      if bTemSaldo then
      begin
         //Brunno Mattos SOL 153584/4161  KTN 1170663 inclui if
         if isAjuste then
           rVlrAtualizacaoAux := 0
         else
           rVlrAtualizacaoAux := rVlrAtualizacao;

         sSQL :=
               'UPDATE SALDOORCADO ' +
               'SET ' +
               '  VLRORCADO  = NVL(VLRORCADO,0) '{+ 0' + TrocaVPP(FloatToStr(rVlrAtualizacaoAux)) + '  '};    // Edilaine - SOL 190488 / KTN 1909246 - comentado
         //Brunno Mattos SOL 154957  KTN 1193108 - inclui if isTransferencia
        // if isTransferencia then  Inicio/Termino - Sadi - SOL 234860 - PPM  445467

           sSql := sSql +
               '  ,VLRTRANSF = NVL(VLRTRANSF,0) + ' + TrocaVPP(FloatToStr(rVlrAtualizacao)) + '  ';
         if isAjuste then //Brunno Mattos KTN 1159883  SOL 153584 atualiza VLRAJUSTE se for chamado pela Suplementação
           sSQL := sSQL +
               '  ,VLRAJUSTE  = NVL(VLRAJUSTE,0) +' + TrocaVPP(FloatToStr(rVlrAtualizacao)) + '  ';
               //'  ,VLRCOMPROMETIDO = NVL(VLRCOMPROMETIDO,0) + ' + TrocaVPP(FloatToStr(rVlrAtualizacao)) + ' ';  // Edilaine - SOL 190488 / KTN 1909246 - comentado
         sSQL := sSQL +
               'WHERE ' +
               ' (IDCONTAORCAMEN = ' + QuotedStr(sIdConta)  + ') AND ' +
               ' (IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc)+ ') AND ' +
               ' (IDPESSOA       = ' + IntToStr(iIdPessoa)  + ') AND ' +
               ' (PERIODO        = ' + IntToStr(iPerido)    + ') AND ' +
               ' (EXERCICIO      = ' + IntToStr(iExercicio) + ') AND ' +
               ' (IDDESPESAORC = ' + IntToStr(idSubDespesa) + ')';   // Edilaine - SOL 193146 / KTN 1940385

      end
      else
         sSQL := 'INSERT INTO SALDOORCADO ' +
                 //Brunno Mattos KTN 1159883  SOL 153584 insere VLRAJUSTE
                 '   (VLRORCADO, VLRAJUSTE, IDCONTAORCAMEN, IDPLANOORCAMEN, IDPESSOA, ' +
                 '    DATAREFERENCIA, PERIODO, EXERCICIO, '+
                 '    IDDESPESAORC, VLRREALIZADO, VLRRESERVADO,VLRCOMPROMETIDO,VLRORCACUM,VLRREALACUM) ' +  // Edilaine - SOL 193146 / KTN 1940385
                 'VALUES ' +
                 '   (' + TrocaVPP(FloatToStr(rVlrAtualizacao)) + ',  ' +
                     TrocaVPP(FloatToStr(rVlrAtualizacao)) + ',  ' +
                     QuotedStr(sIdConta)   + ', ' +
                     IntToStr(iIdPlanoOrc) + ', ' +
                     IntToStr(iIdPessoa)   + ', ' +
                 '   TRUNC(SYSDATE), '     +
                     IntToStr(iPerido)     + ', ' +
                     IntToStr(iExercicio)  + ', ' +
                     IntToStr(idSubDespesa)+ ', 0,0,0,0,0) '; // Edilaine - SOL 193146 / KTN 1940385

      Result := ExecSQL(sSQL);
      

   finally
      FreeAndNil(CdsAux);
   end;
end;




function TCtrlAlterorcamento.ExcluiTransferenciasPorGrupo(iIdPlanoOrcOri, iIdPlanoOrcDest : integer): boolean;
begin
   try
      StartTransaction;

      // Filtra somente o registro deletado
      //FCdsAlterorcamento.StatusFilter := [usDeleted];    // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - comentei


      //Brunno Mattos SOL 152922/4001  KTN 1161267 inclui while para excluir todas as contas
      FCdsAlterorcamento.First;
      while not FCdsAlterorcamento.Eof do
      begin


        if FCdsAlterorcamento.FieldByName('FLGTIPOCONTA').AsString = 'D' then   // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - alterar saldo considerendo o tipo de conta
        begin
          // Retirando saldo inserido para a conta de destino
          if not AtualizaSaldoConta(FCdsAlterorcamento.FieldByName('IDCONTADESTINO').AsString,
                                    FCdsAlterorcamento.FieldByName('PERIODODESTINO').AsInteger,
                                    FCdsAlterorcamento.FieldByName('EXERCICIODESTINO').AsInteger,
                                    FCdsAlterorcamento.FieldByName('IDPESSOA').AsInteger,
                                    iIdPlanoOrcDest,
                                    FCdsAlterorcamento.FieldByName('IDDESPESAORCDESTINO').AsInteger,      // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
                                    (FCdsAlterorcamento.FieldByName('VLRSOLICITADO').AsFloat * -1)
                                    ) then
             raise Exception.Create('Não foi possível inserir saldo para a conta de destino');
        end

        else
        begin
          // Inserindo o saldo retirado para a conta de origem
          if not AtualizaSaldoConta(FCdsAlterorcamento.FieldByName('IDCONTAORIGEM').AsString,
                                    FCdsAlterorcamento.FieldByName('PERIODOORIGEM').AsInteger,
                                    FCdsAlterorcamento.FieldByName('EXERCICIOORIGEM').AsInteger,
                                    FCdsAlterorcamento.FieldByName('IDPESSOA').AsInteger,
                                    iIdPlanoOrcOri,
                                    FCdsAlterorcamento.FieldByName('IDDESPESAORCORIGEM').AsInteger,    // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
                                    FCdsAlterorcamento.FieldByName('VLRSOLICITADO').AsFloat,
                                    ) then
             raise Exception.Create('Não foi possível retirar o saldo da conta de origem');
        end;


        FCdsAlterorcamento.Next;//Brunno Mattos SOL 152922/4001  KTN 1161267
      end;

      // Edilaine Ferraresi - SOL 163908 / KTN 1403202
      FCdsAlterorcamento.first;
      while not FCdsAlterorcamento.eof do
        FCdsAlterorcamento.delete;
     // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - fim

      // Exclui a transferência efetuada
      Result := ApplyCds(FCdsAlterorcamento,_dbAlterorcamento,[],[]);

      if not Result then
         raise Exception.Create(_dbAlterorcamento.MessageInfo);


     Commit;

      // Desfaz o filtro
      FCdsAlterorcamento.StatusFilter := [];

   except
      On E:Exception Do
      Begin
         Result := False;
         FCdsAlterorcamento.StatusFilter := [];
         Rollback;
         MessageInfo := MessageInfo + E.Message;
      End;
   end;
end;




function TCtrlAlterorcamento.GravaSuplemeDeducaoPorGrupo(iIdPlanoOrc: integer; var iIdOperacao: integer): Boolean;
var
  iNumAlteracao: integer;
  rValor: Double;
  sAux: string;
  bInTrans : boolean;    // Edilaine - SOL 190488 / KTN 1909246
begin
   try
     bInTrans := InTransaction();  // Edilaine - SOL 190488 / KTN 1909246

     if not bInTrans then          // Edilaine - SOL 190488 / KTN 1909246
        StartTransaction;

     // Pega o próximo número de transferência
     _Cds.Data     := ProxSuplemen(FCdsAlterorcamento.FieldByName('IDPESSOA').AsFloat);
     iNumAlteracao := (_Cds.FieldByName('PROXIMA').AsInteger + 1);

     // Instancia a variável que irá relacionar as transferências
     //efetuadas no processo corrente
     iIdOperacao := GetSequence('IDOPERACAOORC');

     sAux := '  Operação nº ' + IntToStr(iIdOperacao);


     FCdsAlterorcamento.First;
     while not FCdsAlterorcamento.Eof do
     begin
        FCdsAlterorcamento.Edit;
        FCdsAlterorcamento.FieldByName('NUMALTERACAO').AsInteger   := iNumAlteracao;
        FCdsAlterorcamento.FieldByName('IDOPERACAO').AsInteger     := iIdOperacao;
        FCdsAlterorcamento.FieldByName('OBSALTERORCAMEN').AsString := FCdsAlterorcamento.FieldByName('OBSALTERORCAMEN').AsString + sAux;

        FCdsAlterorcamento.Post;

        // Faz a conversão do valor à ser lançado na tabela SALDOORCADO, de acordo com a operação
        case FCdsAlterorcamento.FieldByName('FLGTIPOALTER').AsString[1] of
           'S': rValor :=  FCdsAlterorcamento.FieldByName('VALOR').AsFloat;
           'R': rValor := (FCdsAlterorcamento.FieldByName('VALOR').AsFloat * -1);
        end;


        // Retirando saldo da conta de origem
        if not AtualizaSaldoConta(FCdsAlterorcamento.FieldByName('IDCONTAORIGEM').AsString,
                                  FCdsAlterorcamento.FieldByName('PERIODOORIGEM').AsInteger,
                                  FCdsAlterorcamento.FieldByName('EXERCICIOORIGEM').AsInteger,
                                  FCdsAlterorcamento.FieldByName('IDPESSOA').AsInteger,
                                  iIdPlanoOrc,
                                  FCdsAlterorcamento.FieldByName('IDDESPESAORCORIGEM').AsInteger,// Edilaine - SOL 190488 / KTN 1909246
                                  rValor,
                                  //Brunno Mattos SOL 152922/4001  KTN 1161267
                                  True,
                                  false
                                   // Edilaine - SOL 190488 / KTN 1909246
                                  ) then
           raise Exception.Create('Não foi possível retirar o saldo da conta de origem');

        Inc(iNumAlteracao);
        FCdsAlterorcamento.Next;
     end;

     Result := ApplyCds(FCdsAlterorcamento,_dbAlterorcamento,[],[]);

     if not Result then
        raise Exception.Create(_dbAlterorcamento.MessageInfo);

     if not bInTrans then          // Edilaine - SOL 190488 / KTN 1909246
        Commit;

   except
      On E:Exception Do
      Begin
         Result := False;
         if not bInTrans then      // Edilaine - SOL 190488 / KTN 1909246
            Rollback;
         MessageInfo := MessageInfo + E.Message;
      End;
   end;
end;




function TCtrlAlterorcamento.ExcluiSuplemeDeducaoPorGrupo(iIdPlanoOrc: integer): Boolean;
var
 iDecCred : integer;
 bInTrans : boolean;   // Edilaine - SOL 190488 / KTN 1909246
begin
   bInTrans := InTransaction;   // Edilaine - SOL 190488 / KTN 1909246
   try
      if not bInTrans then   // Edilaine - SOL 190488 / KTN 1909246
         StartTransaction;

      // Filtra somente o registro deletado
      FCdsAlterorcamento.StatusFilter := [usDeleted];

      FCdsAlterorcamento.First;
      while not FCdsAlterorcamento.Eof do
      begin
         // Se for uma Suplementação, exclui o saldo inserido
         if FCdsAlterorcamento.FieldByName('FLGTIPOALTER').AsString = 'S' then
            iDecCred := -1
         // Se for uma Dedução, retorna o saldo excluido
         else
            iDecCred := 1;

         // Atualizando o saldo da conta
         if not AtualizaSaldoConta(FCdsAlterorcamento.FieldByName('IDCONTAORIGEM').AsString,
                                   FCdsAlterorcamento.FieldByName('PERIODOORIGEM').AsInteger,
                                   FCdsAlterorcamento.FieldByName('EXERCICIOORIGEM').AsInteger,
                                   FCdsAlterorcamento.FieldByName('IDPESSOA').AsInteger,
                                   iIdPlanoOrc,
                                   FCdsAlterorcamento.FieldByName('IDDESPESAORCORIGEM').AsInteger,   // Edilaine - SOL 190488 / KTN 1909246
                                   (FCdsAlterorcamento.FieldByName('VLRSOLICITADO').AsFloat * iDecCred),
                                   //Brunno Mattos SOL 152922/4001  KTN 1161267 parametro informa que é uma atualização para suplementação e portanto utiliza o campo VLRAJUSTE
                                   True,
                                   False
                                   ) then
            raise Exception.Create('Não foi possível atualizar saldo da conta: ' + FCdsAlterorcamento.FieldByName('IDCONTAORIGEM').AsString);

         FCdsAlterorcamento.Next;
      end;


      // Exclui as suplementações/deduções efetuadas
      Result := ApplyCds(FCdsAlterorcamento,_dbAlterorcamento,[],[]);

      if not Result then
         raise Exception.Create(_dbAlterorcamento.MessageInfo);


      if not bInTrans then   // Edilaine - SOL 190488 / KTN 1909246
         Commit;

      // Desfaz o filtro
      FCdsAlterorcamento.StatusFilter := [];

   except
      On E:Exception Do
      Begin
         Result := False;
         FCdsAlterorcamento.StatusFilter := [];
         if not bInTrans then   // Edilaine - SOL 190488 / KTN 1909246
            Rollback;
         MessageInfo := MessageInfo + E.Message;
      End;
   end;

end;


//Brunno Mattos SOL 153584/4161  KTN 1170663 Inicio
function TCtrlAlterorcamento.GravouCompromissoXAjuste(iIdOperacaoCompromisso,
                                                           iIdOperacaoAjuste: Integer): Boolean;
var
 sSql : String;
 bInTrans : boolean;        // Edilaine - SOL 190488 / KTN 1909246
begin
    bInTrans := InTransaction();  // Edilaine - SOL 190488 / KTN 1909246

    try

     if not bInTrans then          // Edilaine - SOL 190488 / KTN 1909246
        StartTransaction;
      sSql := 'INSERT INTO COMPROMISSOXAJUSTE '+
              '(IDOPERACAOCOMPROMISSO, IDOPERACAOAJUSTE) VALUES '+
              '( '+ QuotedStr(IntToStr(iIdOperacaoCompromisso)) +
              ', '+ QuotedStr(IntToStr(iIdOperacaoAjuste)) + ')';

      if not ExecSQL(sSql) then
        raise Exception.Create(MessageInfo);
      if not bInTrans then          // Edilaine - SOL 190488 / KTN 1909246
         Commit;
      Result := True;
    except
       on E:Exception do
       begin
          if not bInTrans then          // Edilaine - SOL 190488 / KTN 1909246
             Rollback;
          Result      := False;
          MessageInfo := E.Message;
       end;
    end;

end;

function TCtrlAlterorcamento.ExcluiCompromissoXAjuste(iIdOperacaoAjuste : Integer): Boolean;
var
   sSql : String;
   bInTrans : boolean;  // Edilaine - SOL 190488 / KTN 1909246
begin
    bInTrans := InTransaction;    // Edilaine - SOL 190488 / KTN 1909246

    try
      if not bInTrans then       // Edilaine - SOL 190488 / KTN 1909246
         StartTransaction;

      sSql := 'DELETE FROM COMPROMISSOXAJUSTE '+
              'WHERE IDOPERACAOAJUSTE = ' + QuotedStr(IntToStr(iIdOperacaoAjuste));

      if not ExecSQL(sSql) then
        raise Exception.Create(MessageInfo);

      if not bInTrans then       // Edilaine - SOL 190488 / KTN 1909246
         Commit;

      Result := True;
    except
       on E:Exception do
       begin
         if not bInTrans then       // Edilaine - SOL 190488 / KTN 1909246
            Rollback;
          Result      := False;
          MessageInfo := E.Message;
       end;
    end;
end;
//Brunno Mattos SOL 153584/4161  KTN 1170663 Fim



procedure TCtrlAlterorcamento.SetCdsDestino(const Value: TClientDataSet);
begin
  FCdsDestino := Value;
end;

procedure TCtrlAlterorcamento.SetCdsOrigem(const Value: TClientDataSet);
begin
  FCdsOrigem := Value;
end;

end.



