{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: Janeiro/2003                           }
{                                                       }
{*******************************************************}

{ ------------------------------------------------------------------------------
Rotina    : BuscaDocEncontroContas
Data      : 27/04/2021
Autor     : Edilaine
SIG       : 114951
Descrição : Na exclusão de baixa do encontro de contas não retorna todos documentos
--------------------------------------------------------------------------------
Data      : 11/12/2018
Autor     : Everson Cunha
SIG       : 79578
Descrição : Ajuste na função BuscaDocEncontroContas, pois o campo piNumLote
            estava retornando '' em uma linha e '0' nas demais linhas
            do CdsPagamentos.FieldByName('NUMLOTE').AsString
--------------------------------------------------------------------------------
Data      : 04/11/2018
Autor     : Everson Cunha
SIG       : SIG 77746 TIBERO
Descrição : Ajuste na query da função BuscaDocEncontroContas, pois estava
            gerando plano cartesiano ao Selecionar os documentos para desfazer
            a baixa dos documentos.
            Exemplo: 5 documentos para desfazer, iam 25 pra lista. 
--------------------------------------------------------------------------------
Data      : 09/03/2018
Autor     : Everson Luiz Pereira da Cunha
SIG       : SIG TIBERO
Descrição : Melhoria para adaptação ao TIBERO.
            Inclusão de alias nas tabelas e campos.
            Retirar INDEX, +rule etc
--------------------------------------------------------------------------------
Rotina..........: ExcluiPagamentos
N. Sol..........: 191915
N. Kintana......: 1823081
Data............: 19/10/2012
Responsável.....: Edilaine Ferraresi
Descrição.......: commit dentro processamento dos documentos filhos
--------------------------------------------------------------------------------
Rotina..........: bbtnConfirmarClick
N. Sol..........: 126261/1121
N. Kintana......: 760963
Data............: 10/01/2012
Responsável.....: Helen V. Bianchi
Descrição.......: BuscaDocFilho
--------------------------------------------------------------------------------
Rotina......: BuscaDocEncontroContas
Nº SOL......: 157289/4921
Nº KINTANA..: 1279362
Data........: 24/05/2011
Responsável.: Ricardo de Freitas
Descrição...: Adicionado Parâmetro de NUMLOTE e um JOIN.
--------------------------------------------------------------------------------
Rotina......: BuscaDocEncontroContas
Nº SOL......: 140975
Nº KINTANA..: 892174
Data........: 09/08/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Otimização da Query utilizando o /*+ rule */.
--------------------------------------------------------------------------------
Rotina.............: BuscaDocEncontroContas
N. Sol.............: 135095
N. Kintana.........: 815991
Data...............: 14/07/2010
Responsável........: Marcos Luiz de Jesus
Descrição..........: Implementado Estorno de Baixa Automatica de Encontro de Contas
--------------------------------------------------------------------------------
Rotina    : ExcluiPagamentos
Data      : 01/03/2007
Autor     : Rodolpho da Silva
pendência : 24574
Descrição : Dezfazer as regularizações financeiras do documento na exclusão do mesmo
--------------------------------------------------------------------------------
Rotina    : bbtnConfirmarclick, ExcluiPagamentos
Data      : 14.02.2007
Autor     : David Ayrolla
pendência : 22037
Descrição : Envio de e-mail no estorno de lote.
--------------------------------------------------------------------------------
Data     : 04.05.2006
Autor    : Antonio Marcos (amf)
Pendência: 22188
Descrição: Faz o Update no EMISBLOQ para permitir nova criação de lote.
--------------------------------------------------------------------------------
Rotina    : ExcluiPagamentos
Data      : 24/08/2004
Autor     : Marchetti
Pendência : 14404
Descrição : Feito o acerto do update e delete das tabelas relacionadas com o CODLANCFINANC
            correspondente
--------------------------------------------------------------------------------
Rotina    : ExcluiPagamentos
Data      : 16/04/2004
Pendência : 16600
Autor     : Alex Pereira
Descrição : Não deixar lançar alteradores para documentos que constam em lote.
--------------------------------------------------------------------------------
Rotina    :
Data      : 14/01/2004
Pendência : 14740
Autor     : Alex Pereira
Descrição : Retirado o bloco try ... except. O mesmo é tratado por fora.
--------------------------------------------------------------------------------
Rotina    : ExcluiPagamentos
Data      : 13/01/2004
Pendência : 5342 - Múltiplas contas de baixa
Autor     : Alex Pereira
Descrição : Passa corretamente o parâmetro na exclusão de documento,
            pois estava dando erro quando era um documento com múltiplas contas
            de baixa.
--------------------------------------------------------------------------------
Rotina    : ExcluiPagamentos
Data      : 01/07/2003
Autor     : André Tavares
Descrição : resolução da pendência 13471
--------------------------------------------------------------------------------}


Unit
  uCtrlExcluiEstornaBaixaLote;

Interface

Uses
  SysUtils, DbClient, Db, Classes, uCmControlObject, uCMTypes,  uCtrlParamIntegra,
  uCtrlImpostoRetido, uCtrlFinanc, uCtrlPeriodo, uCtrlDocumento, uCtrlPadroes,
  uMidasUtil, uCtrlAlteradorBaixa, uCtrlBaixaDocumentos,
  uCtrlMensagens,Dialogs;

Type
  TCtrlExcluiEstornaBaixaLote = Class(TCmControlObject)
  Protected
    Procedure AfterInitialize;   Override;
    Procedure DoChangeDataBase;  Override;
    Procedure OnCreateAppServer; Override;
  Private
    CtrlImpostoRetido : TCtrlImpostoRetido;
    CtrlLancFinanc    : TCtrlFinanc;
    CtrlPeriodo       : TCtrlPeriodo;
    CtrlDocumento     : TCtrlDocumento;
    CtrlPadroes       : TCtrlPadroes;

    //DAVID - 07/02/07 - Pendência 22037
    cdsEnvio : TClientDataSet;
    CtrlBaixaDocumento: TCtrlBaixaDocumentos;

    _AlteradorBaixa: TCtrlAlteradorBaixa;

    FCdsExcluidos     : TClientDataSet;
    FIdEmpresa        : Double;
    FIdModulo         : Double;
    FIdUsuario        : Double;
    FIdEspAcesso      : Double;
    FUsaPlanoPatro    : Boolean;
    FPlanoConta       : Double;
    FCdsExcluiEstornaFinanc: TClientDataSet;
    FCdsAux           : TClientDataSet;
    FqtdMinCommit: longInt;

    Function AbreEEF: OleVariant;
    Function AtualizaTabela( pSql : String ) : Boolean;
    Function ExisteRegularizacao( iCodDocumento: LongInt ) : Boolean;

    Procedure ExcluiPagamentos( pSbtEstornaDown : Boolean;
                                pEstornacontab  : Boolean  );
    Procedure SetCdsExcluidos( Const Value: TClientDataSet);
    Procedure SetCdsExcluiEstornaFinanc( Const Value: TClientDataSet);
    Procedure SetCdsAux( Const Value: TClientDataSet);
    Procedure LimpaDocumentos;
    procedure SetqtdMinCommit(const Value: longInt);
  Public
    Constructor Create; reintroduce;
    Destructor Destroy; override;

    //Bruno Bastos - Sol 129053 - Kintana: 704787 - Início
    function BuscaDocFilho(piCodDocumento: integer) : OleVariant;
    // Marcos...
    function BuscaDocEncontroContas(piCodDocumento : Integer; piNumLote:string = '';
                                    piLancFinanc : string = ''   //edilaine SIG114951
                                   ) : OleVariant;
    function DocTemPai(piCodDocumento: Integer) : boolean;
    //Bruno Bastos - Sol 129053 - Kintana: 704787 - Fim

    Procedure MoveRegistros(CdsOrigem, CdsDestino: TDataSet);
    Procedure bbtnConfirmarclick( psTipoDoc : String;
                                  pSbtEstornaDown : Boolean;
                                  pEstornacontab  : Boolean  );

    Property IdEmpresa              : Double         Read FIdEmpresa              Write FIdEmpresa;
    Property IdModulo               : Double         Read FIdModulo               Write FIdModulo;
    Property IdUsuario              : Double         Read FIdUsuario              Write FIdUsuario;
    Property IdEspAcesso            : Double         Read FIdEspAcesso            Write FIdEspAcesso;
    Property UsaPlanoPatro          : Boolean        Read FUsaPlanoPatro          Write FUsaPlanoPatro;
    Property PlanoConta             : Double         Read FPlanoConta             Write FPlanoConta;
    Property CdsExcluidos           : TClientDataSet Read FCdsExcluidos           Write SetCdsExcluidos;
    Property CdsExcluiEstornaFinanc : TClientDataSet Read FCdsExcluiEstornaFinanc Write SetCdsExcluiEstornaFinanc;
    Property CdsAux                 : TClientDataSet Read FCdsAux                 Write SetCdsAux;
    property qtdMinCommit           : longInt read FqtdMinCommit write SetqtdMinCommit;
  End;

Implementation

Uses
  uDataBase, DCapCarMT;

{ TCtrlExcluiEstornaBaixaLote }

Constructor TCtrlExcluiEstornaBaixaLote.Create;
Begin
  Inherited;
  FqtdMinCommit := 0;
  _AlteradorBaixa := TCtrlAlteradorBaixa.Create;
End;

Destructor TCtrlExcluiEstornaBaixaLote.Destroy;
Begin
  CtrlImpostoRetido.Free;
  CtrlLancFinanc.Free;
  CtrlPeriodo.Free;
  CtrlDocumento.Free;
  CtrlPadroes.Free;

  _AlteradorBaixa.Free;

  //amf 04.05.2006 p:22188
  CtrlBaixaDocumento.Free;

  FreeCds( [ CdsExcluiEstornaFinanc, CdsAux ] );
  Inherited;
End;

Procedure TCtrlExcluiEstornaBaixaLote.AfterInitialize;
Begin
  Inherited;
  CdsExcluiEstornaFinanc := TClientDataSet.Create( Nil );
  CdsAux                 := TClientDataSet.Create( Nil );

  CtrlImpostoRetido := TCtrlImpostoRetido.Create;
  CtrlLancFinanc    := TCtrlFinanc.Create( Idempresa, IdModulo, IdUsuario, UsaPlanoPatro );
  CtrlPeriodo       := TCtrlPeriodo.Create;
  CtrlDocumento     := TCtrlDocumento.Create;
  CtrlPadroes       := TCtrlPadroes.Create;

  //amf 04.05.2006 p:22188
  CtrlBaixaDocumento              := TCtrlBaixaDocumentos.Create;

  CtrlImpostoRetido.OpenTransaction := False;
  CtrlLancFinanc.OpenTransaction    := false;
  CtrlPeriodo.OpenTransaction       := False;
  CtrlDocumento.OpenTransaction     := False;
  CtrlPadroes.OpenTransaction       := false;

  CtrlImpostoRetido.IdEmpresa     := Trunc( IdEmpresa );
  CtrlImpostoRetido.IdModulo      := Trunc( IdModulo );
  CtrlImpostoRetido.IdUsuario     := Trunc( IdUsuario );

  //andré tavares - pendência 21219 - 06/02/2006 - aproveitei para resolver o bug da autorização de lançamento de documentos
  CtrlImpostoRetido.IdEspAcesso   := Trunc( IdEspAcesso );

  CtrlImpostoRetido.UsaPlanoPatro := UsaPlanoPatro;
  CtrlImpostoRetido.IdPlanoConta  := Trunc( PlanoConta );

  CtrlDocumento.IdModulo          := Trunc( IdModulo );
  CtrlDocumento.IdUsuario         := Trunc( IdUsuario );
  CtrlDocumento.UsaPlanoPatro     := UsaPlanoPatro;
  CtrlDocumento.IdEspAcesso       := Trunc( IdEspAcesso );

  CtrlImpostoRetido.InitializeAs( Self );
  CtrlLancFinanc.InitializeAs( Self );
  CtrlPeriodo.InitializeAs( Self );
  CtrlDocumento.InitializeAs( Self );
  CtrlPadroes.InitializeAs( Self );

  _AlteradorBaixa.InitializeAs( Self );

  //amf 04.05.2006 p:22188
  CtrlBaixaDocumento.InitializeAs(Self);

End;

Procedure TCtrlExcluiEstornaBaixaLote.DoChangeDataBase;
Begin
  Inherited;

End;

Procedure TCtrlExcluiEstornaBaixaLote.OnCreateAppServer;
Begin
  Inherited;

End;

Procedure TCtrlExcluiEstornaBaixaLote.SetCdsExcluidos( Const Value: TClientDataSet );
Begin
  FCdsExcluidos := Value;
End;

Procedure TCtrlExcluiEstornaBaixaLote.SetCdsAux( Const Value: TClientDataSet);
Begin
  FCdsAux := Value;
End;

Procedure TCtrlExcluiEstornaBaixaLote.SetCdsExcluiEstornaFinanc( Const Value: TClientDataSet);
Begin
  FCdsExcluiEstornaFinanc := Value;
End;

Procedure TCtrlExcluiEstornaBaixaLote.bbtnConfirmarclick( psTipoDoc       : String;
                                                          pSbtEstornaDown : Boolean;
                                                          pEstornacontab  : Boolean );
var
  iContexto : integer;
  CtrlMensagens : TCtrlMensagens;
Begin
  Try
    if FqtdMinCommit = 0 then
      StartTransaction;

    //DAVID - 07/02/07 - Pendência 22037
    cdsEnvio := TClientDataset.Create( nil );
    CtrlMensagens := TCtrlMensagens.Create;
    try

      cdsEnvio.Data := GetDataPacket(
       ' select 10000 as NUMLOTE, sysdate as DATAESTORNO, 123456.78 as VALOR from DUAL ' );
      cdsEnvio.Delete;

      ExcluiPagamentos( pSbtEstornaDown, pEstornacontab );



      if FqtdMinCommit = 0 then // Comentado para TESTE
       Commit;

      //DAVID - 07/02/07 - Pendência 22037
      CtrlMensagens.InitializeAs( Self );
      cdsEnvio.First;
      while not cdsEnvio.Eof do
      begin
        if IdModulo = 3 then
          iContexto := 4         //Contas a pagar
        else
          iContexto := 5;        //Contas a receber

        CtrlMensagens.EnviaMensagemContexto( trunc( IdUsuario ), iContexto,
         [ 'NUMLOTE'    ,
           'DATAESTORNO'     ,
           'VALOR'          ] ,
         [ cdsEnvio.FieldByName('NUMLOTE').AsString                                        ,
           FormatDateTime( 'dd/mm/yyyy', cdsEnvio.FieldByName('DATAESTORNO').AsDateTime ) ,
           FormatFloat( '#,##0.00', cdsEnvio.FieldByName('VALOR').AsFloat )              ] );
        cdsEnvio.Next;
      end;
      
    finally
      cdsEnvio.Free;
      CtrlMensagens.Free;
    end;


    If Not CtrlPadroes.GravaLogOperacoes( IdEmpresa, IdModulo, IdUsuario, 'Exclui/Estorna Documento', False ) Then
      Raise Exception.Create('Não Consegui Gravar o Log');

    MessageInfo := 'O(s) ' + psTipoDoc + '(s) foram excluídos com sucesso';
    
  Except
    On E:Exception Do Begin
      Rollback;
      MessageInfo := 'Não foi possível excluir o(s) ' + psTipoDoc + #13 + #10 + E.Message;
    End;
  End;
End;

Procedure TCtrlExcluiEstornaBaixaLote.ExcluiPagamentos( pSbtEstornaDown : Boolean;
                                                        pEstornacontab  : Boolean  );
Var
  liCodDocumento,codlanc,
  iCodLancFinanc, iPlnCodigoOri, iOperacao, iNumLote: LongInt;
  sDataLancamento,sDataEstorno: String;
  liCodAnterior, liNumLanc : Integer;
  SistemaLancto : TSistemaLancto;
  sSqlFin : String;
  fValor : extended;
  contaComitados: LongInt;
  //Helen - Sol: 126261/1121 - Kintana: 760963 - Inicio
  cdsAuxFilhos : TClientDataSet;
  iFilhos : Integer;
  //Helen - Sol: 126261/1121 - Kintana: 760963 - Fim
  lstDocumento : TStringList;   // Edilaine - SOL 191915 / KTN 1823081
  iNumDocs     : integer;       // Edilaine - SOL 191915 / KTN 1823081
Begin
  lstDocumento := TStringList.create;            // Edilaine - SOL 191915 / KTN 1823081
  cdsAuxFilhos := TClientDataset.Create( nil ); // Edilaine - SOL 191915 / KTN 1823081

  CdsExcluidos.First;

  contaComitados := 0;
  While Not CdsExcluidos.Eof Do
  Begin
    {** 3 Camadas
      > O objeto foi implementado como TCtrlImpostoRetido na uCtrlImpostoRetido
      > A chamada aos métodos e propriedades são aos mesmas.
      > Criar a CtrlImposto e Inicializar
    **}

    if ((FqtdMinCommit > 0) and (contaComitados < FqtdMinCommit)) and (not inTransaction)then
      StartTransaction;

    lstDocumento.add( CdsExcluidos.FieldByName( 'CODDOCUMENTO' ).AsString );  // Edilaine - SOL 191915 / KTN 1823081

    CtrlImpostoRetido.CodDocumento    := CdsExcluidos.FieldByName( 'CODDOCUMENTO' ).AsInteger;
    CtrlImpostoRetido.NumLancto       := 0;
    CtrlImpostoRetido.NumLanctoOrigem := 0;
    CtrlImpostoRetido.TipoExclusao    := teSoBaixa;
    CtrlImpostoRetido.NumLote         := CdsExcluidos.FieldByName( 'NUMLOTE' ).AsInteger;
    CtrlImpostoRetido.NumLoteManual   := CdsExcluidos.FieldByName( 'NUMLOTEMANUAL' ).AsInteger;

    if not ExecSql(' UPDATE DOCUMENTO SET FLGNAOCONCILIADO = 1 WHERE CODDOCUMENTO = '+ CdsExcluidos.FieldByName( 'CODDOCUMENTO' ).asString) then
       raise Exception.Create(MessageInfo);

    CtrlImpostoRetido.Excluir;

    iCodLancFinanc  := CdsExcluidos.FieldByName( 'CODLANCFINANC' ).AsInteger;
    iPlnCodigoOri   := CdsExcluidos.FieldByName( 'PLNCODIGO' ).AsInteger;
    sDataLancamento := CdsExcluidos.FieldByName( 'DATALANCTO' ).AsString;
    iOperacao       := StrToIntDef( CdsExcluidos.FieldByName( 'OPERACAO' ).AsString,2);

    If ( iPlnCodigoOri = 0 ) Or ( ( Not pEstornaContab ) And ( Not pSbtEstornaDown ) ) Then
    Begin

      If iOperacao = 15 Then
      Begin
        If      ( IdModulo = 3 ) then SistemaLancto := TSistemaLancto( 0 )          // CAP
        Else If ( IdModulo = 4 ) then SistemaLancto := TSistemaLancto( 1 )         // CAR
        Else                          SistemaLancto := TSistemaLancto( -1 );
        CtrlDocumento.UpdateStatusBaixaAdianto( CdsExcluidos.FieldByName( 'CODDOCUMENTO').AsInteger,
                         0 ,
                         CdsExcluidos.FieldByName( 'NUMLANCTO').AsInteger,
                         CdsExcluidos.FieldByName( 'DATALANCTO' ).AsDateTime,
                         SistemaLancto, true );
      End
      Else
      Begin
        if not CtrlDocumento.RecbToPagto.Excluir( CdsExcluidos.FieldByName( 'CODDOCUMENTO').AsInteger,
                                                 CdsExcluidos.FieldByName( 'NUMLANCTO').AsInteger) then
           Raise Exception.Create(CtrlDocumento.MessageInfo);

         if not _AlteradorBaixa.Excluir( CdsExcluidos.FieldByName( 'CODDOCUMENTO').AsInteger,
                                         Trunc(IdModulo),  false, UsaPlanoPatro) then
            Raise Exception.Create(_AlteradorBaixa.MessageInfo);

        CtrlDocumento.Prepare( OpLanctoDocum, odlBaixa);
        CtrlDocumento.IdModulo                 := Trunc( IdModulo );
        CtrlDocumento.IdUsuario                := IdUsuario;
        CtrlDocumento.IdEspAcesso              := IdEspAcesso;
        CtrlDocumento.UsaPlanoPatro            := UsaPlanoPatro;
        CtrlDocumento.CodDocumento             := CdsExcluidos.FieldByName( 'CODDOCUMENTO').AsInteger;
        CtrlDocumento.Lanctodocum.NumLancto    := CdsExcluidos.FieldByName( 'NUMLANCTO').AsInteger;
        CtrlDocumento.Lanctodocum.IdModulo     := Trunc( IdModulo );
        CtrlDocumento.Lanctodocum.CodDocumento := CdsExcluidos.FieldByName('CODDOCUMENTO').AsInteger;
        CtrlDocumento.Lanctodocum.IdPessoa     := Trunc( IdEmpresa );

        If ( Not CtrlDocumento.Delete ) Then Raise Exception.Create( CtrlDocumento.MessageInfo );
      End;

      {** 3 Camadas
        Volta ao estado de não identificado os lançamento marcados como
        identificados na baixa dos documento. Caso isso ocorra a coluna
        RECBTOPAGTO.CODLANCNAOIDENT recebe no momento da baixa o valor do
        lançamento não identificado do financeiro na coluna MOVIMFINANC.CODLANCFINANC
      **}

      // Verifica se existe uma conciliação do documento. Se existir,
      //desfaz a regularização
      If Not CdsExcluidos.FieldByName( 'CODLANCNAOIDENT' ).IsNull Then
      Begin
         If ( Not AtualizaTabela ( 'UPDATE RECBTOPAGTO SET CODLANCFINANC = NULL, CODLANCNAOIDENT = NULL WHERE CODDOCUMENTO = ' + CdsExcluidos.FieldByName( 'CODDOCUMENTO' ).AsString + ' AND NUMLANCTO =  ' +
                                   CdsExcluidos.FieldByName( 'NUMLANCTO' ).AsString ) ) Then Begin
           Raise Exception.Create('Erro ao atualizar recbtopagto para cancelamento da efetivação do não identificado');
         End;

         // Rodolpho da Silva - P: 24574 - 01/03/2007
         if not CtrlLancFinanc.DesfazerRegularizacao(CdsExcluidos.FieldByName('CODLANCFINANC').AsInteger,
                                                    Trunc(IdEmpresa),Trunc(IdModulo)) then
           raise Exception.Create(CtrlLancFinanc.MessageInfo);
      End;

      iNumLote := CdsExcluidos.FieldByName( 'NUMLOTE').AsInteger;

      If CdsExcluidos.FieldByName( 'FLGTIPODOCUMENTO' ).AsString = '2' Then Begin

        CtrlDocumento.Prepare( OpDocumento, odlEfetivo );
        CtrlDocumento.IdModulo                 := Trunc( IdModulo );
        CtrlDocumento.IdUsuario                := IdUsuario;
        CtrlDocumento.IdEspAcesso              := IdEspAcesso;
        CtrlDocumento.UsaPlanoPatro            := UsaPlanoPatro;
        CtrlDocumento.CodDocumento             := CdsExcluidos.FieldByName( 'CODDOCUMENTO').AsInteger;

        If ( Not CtrlDocumento.Delete ) Then Raise Exception.Create( CtrlDocumento.MessageInfo );
      End;

      if not CtrlBaixaDocumento.UpdateEmissBloq(cdsExcluidos.FieldByName('CODDOCUMENTO').AsInteger) then
         raise Exception.Create(CtrlBaixaDocumento.MessageInfo);



      CdsExcluidos.Next;

      {** 3 Camadas
        > Verifica se o documento excluído faz parte de um lote e verifica se é o
          final do processamento ou se mudou de lote processado atravé da variável
          iNumLote inicializada antes do next. Caso positivo marca o LOTE como
          não baixado passado o LOTEXDOCUM.FLGBAIXA para null e o LOTEPAGTO.FLAGCANCEL para null
      **}
      If  ( ( CdsExcluidos.Eof ) Or
          ( iNumLote <> CdsExcluidos.FieldByName( 'NUMLOTE').AsInteger) ) Then Begin
        AtualizaTabela( 'UPDATE LOTEXDOCUM SET FLGBAIXA = NULL WHERE NUMLOTE = ' + IntToStr( iNumLote ) );
      End;

      AtualizaTabela( 'UPDATE LOTEPAGTO SET FLAGCANCEL = NULL WHERE NUMLOTE = ' + IntToStr( iNumLote ) );

      if (iCodLancFinanc <> 0) AND
         ( ( CdsExcluidos.Eof ) OR
           ( iCodLancFinanc <> CdsExcluidos.FieldByName( 'CODLANCFINANC').AsInteger ) ) then

          If Not CtrlLancFinanc.ExcluiFinanceiro(iCodLancFinanc) Then
            Exception.Create( CtrlLancFinanc.MessageInfo );

    end
    else
    Begin
      sDataEstorno:=sDataLancamento;
      {** 3 Camadas
         O Estorno de baixa de adiantamento ( OPERACAO = 15 ) tem o mesmo procedimento
         da parte de exclusão - Vide acima
      **}
      If iOperacao = 15 Then
      Begin
        If      ( IdModulo = 3 ) then SistemaLancto := TSistemaLancto( 0 )          // CAP
        Else If ( IdModulo = 4 ) then SistemaLancto := TSistemaLancto( 1 )         // CAR
        Else                          SistemaLancto := TSistemaLancto( -1 );
        CtrlDocumento.UpdateStatusBaixaAdianto( CdsExcluidos.FieldByName( 'CODDOCUMENTO').AsInteger,
                         0,
                         CdsExcluidos.FieldByName( 'NUMLANCTO').AsInteger,
                         CdsExcluidos.FieldByName( 'DATALANCTO' ).AsDateTime,
                         SistemaLancto );
      End
      Else
      Begin
        {** 3 Camadas
          o método de estorno implementado na CtrlDocumento atende a todas as operações
          do estorno do sistema e pode ser chamada de uma tela ( oeDialogProcessa ),
          de dentro de uma control ( oeSoProcessa ) ou executada diretamente da
          aplicação servidora ( oeAppServerProcessa ) de acordo com o valor do
          parãmreto OperacaoEstorno pelos valores.
          o método é o CtrlDocumento.Estornar(....
        **}

        (* Gustavo - 26/03/2002 - Inicio *)
        if not CtrlDocumento.Estornar( CdsExcluidos.FieldByName( 'DATALANCTO' ).AsDateTime,
                                Trunc( IdModulo ), Trunc( IdEmpresa ), Trunc( IdUsuario ),
                                CdsExcluidos.FieldByName( 'CODDOCUMENTO').AsInteger,
                                CdsExcluidos.FieldByName( 'NUMLANCTO').AsInteger,
                                Trunc( PlanoConta ), UsaPlanoPatro ) then
           Raise Exception.Create(CtrlDocumento.MessageInfo);

        if not _AlteradorBaixa.Estornar(CdsExcluidos.FieldByName( 'CODDOCUMENTO').AsInteger,
                                 Trunc( IdModulo ), Trunc( IdEmpresa ), Trunc( IdUsuario ),
                                 Trunc( PlanoConta ), UsaPlanoPatro) then
           Raise Exception.Create(_AlteradorBaixa.MessageInfo);
        (* Gustavo - 26/03/2002 - Fim *)

        if not AtualizaTabela( 'UPDATE RECBTOPAGTO SET CODLANCFINANC = NULL WHERE CODLANCFINANC = ' + IntToStr(iCodLancFinanc)) then Abort;

        if not AtualizaTabela('UPDATE LANCTODOCUM SET PLNCODIGO = NULL WHERE PLNCODIGO = ' + IntToStr(iPlnCodigoOri ) ) then Abort;
      end;

      {** 3 Camadas
          Mesmo procedimento do lançamento não identificado comentado na parte de exclusão acima
      **}
      If Not CdsExcluidos.FieldByName( 'CODLANCNAOIDENT' ).IsNull Then
      Begin
         if not AtualizaTabela( 'UPDATE MOVIMFINANC SET STATUSCONCILIA = ''I'',DATACONCILIACAO = TO_DATE('''+ CdsExcluidos.FieldByName( 'DATACFLOAT' ).AsString +''',''dd/MM/yyyy'')' +
                                ' WHERE CODLANCFINANC = '+ CdsExcluidos.FieldByName( 'CODLANCNAOIDENT' ).AsString) then

         If Not AtualizaTabela( 'UPDATE RECBTOPAGTO SET CODLANCFINANC = NULL, CODLANCNAOIDENT = NULL WHERE CODDOCUMENTO = ' + CdsExcluidos.FieldByName( 'CODDOCUMENTO' ).AsString + ' AND NUMLANCTO =  ' + CdsExcluidos.FieldByName( 'NUMLANCTO' ).AsString) Then
            Raise Exception.Create('Erro ao atualizar recbtopagto para cancelamento da efetivação do não identificado');

      End;

      iNumLote := CdsExcluidos.FieldByName( 'NUMLOTE').AsInteger;

      {** 3 Camadas
        Da mesma forma que na baixa, o lançamento do arredondamento de CPMF
        deve, neste caso ser estornado. Vide comentário acima.
        Vide comentário do EstornoCAPCAR no estorno do documento acima.
        uMidasUtil
      **}
      If CdsExcluidos.FieldByName( 'FLGTIPODOCUMENTO' ).AsString = '2' Then Begin

        liCodAnterior := CdsExcluidos.FieldByName( 'CODDOCUMENTO' ).AsInteger;
        liNumLanc := 0;
        liCodDocumento := -1;

        If Not ( CtrlDocumento.Estornar( Date,
                                Trunc( IdModulo ), Trunc( IdEmpresa ), Trunc( IdUsuario ),
                                liCodAnterior,
                                liNumLanc,
                                Trunc( PlanoConta ), UsaPlanoPatro, oeSoprocessa,
                                liCodDocumento ) ) Then Begin

          MessageInfo := 'Não foi possível estornar o arredondamento da CPMF, verifique.' + #13 + #10 +
                         CtrlDocumento.MessageInfo
        End;
      End;

      fValor := CdsExcluidos.FieldByName('VALOR').AsFloat;

      CdsExcluidos.Next;

      {** Idêntico ao procedimento de baixa **}
      If ( ( CdsExcluidos.Eof ) OR
           ( iNumLote <> CdsExcluidos.FieldByName( 'NUMLOTE' ).AsInteger ) ) Then Begin

        AtualizaTabela( 'update lotexdocum set flgbaixa = null where numlote = ' + IntToStr(iNumLote));
      End;

      AtualizaTabela( 'update lotepagto set flagcancel = null where numlote = ' + IntToStr(iNumLote));

      //DAVID - 07/02/07 - Pendência 22037
      //Verifica se o lote já está no dataset. Se estiver, soma. Senão, inclui...
      if not cdsEnvio.Locate( 'NUMLOTE', iNumLote, [] ) then
      begin
        cdsEnvio.Append;
        cdsEnvio.FieldByName('NUMLOTE').AsFloat        := iNumLote;
        cdsEnvio.FieldByName('DATAESTORNO').AsDateTime := Now;
        cdsEnvio.FieldByName('VALOR').AsFloat          := fValor;
      end
      else
      begin
        cdsEnvio.Edit;
        cdsEnvio.FieldByName('VALOR').AsFloat := cdsEnvio.FieldByName('VALOR').AsFloat + fValor;
      end;
      cdsEnvio.Post;

    End;
    contaComitados := contaComitados + 1;
    // Edilaine - SOL 191915 / KTN 1823081
    if (FqtdMinCommit > 0) and (inTransaction) and
       ((contaComitados = FqtdMinCommit) or (CdsExcluidos.eof)) then
    begin
      try
          for iNumDocs := 0 to lstDocumento.count-1 do
          begin
              cdsAuxFilhos.data := GetDataPacket(' SELECT D.CODDOCUMENTO,D.DATAVENCTO '+
                                                 '   FROM DOCUMENTO D, '+
                                                 '        DOCUMXDOCUM F  '+
                                                 '  WHERE D.CODDOCUMENTO = F.IDDOCUMENTOPAI(+) '+
                                                 '    AND D.CODDOCUMENTO =  '+ lstDocumento.Strings[iNumDocs] +
                                                 '    AND DECODE(F.IDDOCUMENTO, NULL, ''N'', ''S'') = ''S'' ');

              if not cdsAuxFilhos.eof then
              begin
                AtualizaTabela( ' UPDATE DOCUMENTO SET DATADISPONIB = ''' + cdsAuxFilhos.FieldByName('DATAVENCTO').AsString +
                                ''' WHERE CODDOCUMENTO = ' + cdsAuxFilhos.FieldByName('CODDOCUMENTO').AsString );
              end;
          end;

      except
          messageInfo := 'Erro ao atualizar o campo DISPONIBILIDADE da tabela DOCUMENTO. Documento não Baixado.';
          raise Exception.Create('messageInfo');
      end;

      commit;

      if (contaComitados = FqtdMinCommit) then
      begin
        lstDocumento.clear;
        contaComitados := 0;
      end;
    end;
    // Edilaine - SOL 191915 / KTN 1823081 - fim

{
    if (((FqtdMinCommit > 0) and (contaComitados = FqtdMinCommit)) and inTransaction) then
    begin
      //Helen - Sol: 126261/1121 - Kintana: 760963 - Inicio
      CdsExcluidos.First;
      try
          while not CdsExcluidos.eof do
          begin
              cdsAuxFilhos := TClientDataset.Create( nil );
              cdsAuxFilhos.data := GetDataPacket(' SELECT D.CODDOCUMENTO,D.DATAVENCTO, ''S'' AS FILHO '+
                                                   '  FROM DOCUMENTO D                   '+
                                                   ' WHERE D.CODDOCUMENTO IN             '+
                ' (SELECT C.IDDOCUMENTO FROM DOCUMXDOCUM C WHERE IDDOCUMENTOPAI = '+ CdsExcluidos.FieldByName( 'CODDOCUMENTO' ).AsString +' )' +
                                                   ' UNION                               '+
                                                   ' SELECT D.CODDOCUMENTO,D.DATAVENCTO, ''N'' AS FILHO '+
                                                   ' FROM DOCUMENTO D                                   '+
                                                   ' WHERE D.CODDOCUMENTO =  '+ CdsExcluidos.FieldByName( 'CODDOCUMENTO' ).AsString  );
              iFilhos := 0;
              while not cdsAuxFilhos.eof do
              begin
                   if cdsAuxFilhos.FieldByName( 'FILHO').AsString = 'S' then
                      iFilhos := 1;
                   cdsAuxFilhos.Next;
              end;
              if iFilhos > 0 then
              begin
                    cdsAuxFilhos.First;
                    while not cdsAuxFilhos.eof do
                    begin
                         AtualizaTabela( ' UPDATE DOCUMENTO SET DATADISPONIB = ''' + cdsAuxFilhos.FieldByName('DATAVENCTO').AsString +
                         ''' WHERE CODDOCUMENTO = ' + cdsAuxFilhos.FieldByName('CODDOCUMENTO').AsString );
                         cdsAuxFilhos.Next;
                    end;
              end;
              CdsExcluidos.next;
          end;

      except
          messageInfo := 'Erro ao atualizar o campo DISPONIBILIDADE da tabela DOCUMENTO. Documento não Baixado.';
          raise Exception.Create('messageInfo');
      end;
      //Helen - Sol: 126261/1121 - Kintana: 760963 - Fim
      commit;
      contaComitados := 0;
    end
    else if (( (CdsExcluidos.eof) and ((FqtdMinCommit > 0) and (contaComitados < FqtdMinCommit)) ) and inTransaction) then
    begin
      //Helen - Sol: 126261/1121 - Kintana: 760963 - Inicio
      CdsExcluidos.First;
      try
          while not CdsExcluidos.eof do
          begin
              cdsAuxFilhos := TClientDataset.Create( nil );
              cdsAuxFilhos.data := GetDataPacket(' SELECT D.CODDOCUMENTO,D.DATAVENCTO, ''S'' AS FILHO '+
                                                   '  FROM DOCUMENTO D                   '+
                                                   ' WHERE D.CODDOCUMENTO IN             '+
                ' (SELECT C.IDDOCUMENTO FROM DOCUMXDOCUM C WHERE IDDOCUMENTOPAI = '+ CdsExcluidos.FieldByName( 'CODDOCUMENTO' ).AsString +' )' +
                                                   ' UNION                               '+
                                                   ' SELECT D.CODDOCUMENTO,D.DATAVENCTO, ''N'' AS FILHO '+
                                                   ' FROM DOCUMENTO D                                   '+
                                                   ' WHERE D.CODDOCUMENTO =  '+ CdsExcluidos.FieldByName( 'CODDOCUMENTO' ).AsString  );
              iFilhos := 0;
              while not cdsAuxFilhos.eof do
              begin
                   if cdsAuxFilhos.FieldByName( 'FILHO').AsString = 'S' then
                      iFilhos := 1;
                   cdsAuxFilhos.Next;
              end;
              if iFilhos > 0 then
              begin
                    cdsAuxFilhos.First;
                    while not cdsAuxFilhos.eof do
                    begin
                         AtualizaTabela( ' UPDATE DOCUMENTO SET DATADISPONIB = ''' + cdsAuxFilhos.FieldByName('DATAVENCTO').AsString +
                         ''' WHERE CODDOCUMENTO = ' + cdsAuxFilhos.FieldByName('CODDOCUMENTO').AsString );
                         cdsAuxFilhos.Next;
                    end;
              end;
              CdsExcluidos.next;
          end;

      except
          messageInfo := 'Erro ao atualizar o campo DISPONIBILIDADE da tabela DOCUMENTO. Documento não Baixado.';
          raise Exception.Create('messageInfo');
      end;
      //Helen - Sol: 126261/1121 - Kintana: 760963 - Fim
      commit;
    end;
    }
  End; //while not eof

  lstDocumento.Destroy;     // Edilaine - SOL 191915 / KTN 1823081
  FreeAndNil(cdsAuxFilhos); // Edilaine - SOL 191915 / KTN 1823081

  If pSbtEstornaDown  Then
  Begin
    if (FqtdMinCommit > 0) and (not inTransaction) then
      startTransaction;

    CdsExcluiEstornaFinanc.Data := AbreEEF;
    MoveRegistros( CdsExcluidos, CdsExcluiEstornaFinanc);
    CdsExcluiEstornaFinanc.first;

    While Not (CdsExcluiEstornaFinanc.Eof) Do Begin
      If  CdsExcluiEstornaFinanc.fieldbyname('codlancfinanc').asinteger <> 0 Then Begin
        sSqlFin:='update recbtopagto set codlancfinanc='+
                  CdsExcluiEstornaFinanc.fieldbyname('codlancfinanc').asstring+
                  ' where coddocumento='+CdsExcluiEstornaFinanc.fieldbyname('coddocumento').asstring+
                  ' and numlancto='+CdsExcluiEstornaFinanc.fieldbyname('numlancto').asstring;
        If Not AtualizaTabela( sSqlFin ) Then Abort;

      End;
      CdsExcluiEstornaFinanc.next;
    End;

    CdsExcluiEstornaFinanc.first;
    While Not (CdsExcluiEstornaFinanc.Eof) Do Begin
      If  CdsExcluiEstornaFinanc.fieldbyname('codlancfinanc').asinteger <> 0 Then Begin
        If (Trim(CdsExcluiEstornaFinanc.fieldbyname('NUMCHQBORDERO').AsString) <> '0') And
           (Trim(CdsExcluiEstornaFinanc.fieldbyname('NUMCHQBORDERO').AsString) <> '') Then Begin
           sSqlfin:='select max(codlancfinanc) as codlanc from recbtopagto where RTRIM(NUMCHQBORDERO) = '''+
                    Trim(CdsExcluiEstornaFinanc.fieldbyname('NUMCHQBORDERO').asstring) + '''' ;

           CdsAux.Close;
           CdsAux.Data := GetDataPacket( sSqlfin );

           If Not CdsAux.IsEmpty Then Begin
              codlanc:= CdsAux.fieldbyname('codlanc').asinteger ;
              CdsAux.close;
              sSqlFin:='update recbtopagto set codlancfinanc='+
                  inttostr(codlanc)+
                  ' where coddocumento='+CdsExcluiEstornaFinanc.fieldbyname('coddocumento').asstring+
                  ' and codlancfinanc is null and RTRIM(NUMCHQBORDERO) = '''+
                  Trim(CdsExcluiEstornaFinanc.fieldbyname('NUMCHQBORDERO').asstring) + '''' ;
              If Not AtualizaTabela( sSqlFin ) Then Abort;
           End;
        End;
      End;
      CdsExcluiEstornaFinanc.next;
    End;

    if (FqtdMinCommit > 0) and (inTransaction) then
      Commit;

  End;
End;

Function TCtrlExcluiEstornaBaixaLote.AtualizaTabela( pSql : String ): Boolean;
Begin
  If ConnectionSide = cnsClient Then Begin

    Result := Connection.AppServer.AtualizaTabela( pSql );
    If ( Not Result ) Then MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin

    MessageInfo := '';
    Try
      ExecSql( pSql );
      Result := True;
    Except
      On E : Exception Do Begin
        Result := False;
        MessageInfo := E.Message;
      End;
    End;
  End;
End;

Procedure TCtrlExcluiEstornaBaixaLote.MoveRegistros(CdsOrigem, CdsDestino: TDataSet);
Var
  sNumChqBordero: String;
  iPlnCodigo,iCodLancFinanc,iNumLote: Integer;
  Datalancto: TDateTime;
Begin

  CdsOrigem.DisableControls;
  CdsDestino.DisableControls;

  If Not CdsOrigem.IsEmpty Then
  Begin
    sNumChqBordero := CdsOrigem.FieldByName('NumChqBordero').AsString;
    iPlnCodigo     := CdsOrigem.FieldByName('PlnCodigo').AsInteger;
    iCodLancFinanc := CdsOrigem.FieldByName('CodLancFinanc').AsInteger;
    DataLancto     := CdsOrigem.FieldByName('DataLancto').AsDateTime;

    //Ricardo de Freitas
    iNumLote       := CdsOrigem.FieldByName('NumLote').AsInteger;

    CdsOrigem.First;
    While Not CdsOrigem.Eof Do
    Begin
      If  (CdsOrigem.FieldByName('NumChqBordero').AsString = sNumChqBordero)   And
          (CdsOrigem.FieldByName('DataLancto').AsDateTime = DataLancto)        And
          ((CdsOrigem.FieldByName('PlnCodigo').AsInteger = iPlnCodigo) Or
           (CdsOrigem.FieldByName('PlnCodigo').IsNull))                        And
          ((CdsOrigem.FieldByName('CodLancFinanc').AsInteger = iCodLancFinanc) Or
           (CdsOrigem.FieldByName('CodLancFinanc').IsNull))                    And

          //Ricardo de Freitas
          ((CdsOrigem.FieldByName('NumLote').AsInteger = iNumLote)             Or
           (CdsOrigem.FieldByName('NumLote').IsNull))
          //Ricardo de Freitas

           Then Begin


        MoveFields(CdsOrigem, CdsDestino, OpInserir, True);
      End Else Begin
        CdsOrigem.Next;
      End;
    End;
  End;

  CdsOrigem.First;
  CdsDestino.First;

  CdsOrigem.EnableControls;
  CdsDestino.EnableControls;
End;

Function TCtrlExcluiEstornaBaixaLote.AbreEEF: OleVariant;
Var
  SqlLocal : TStringList;
Begin

  SqlLocal := TStringList.Create;
  Try
    SqlLocal.Add( 'SELECT' );
    SqlLocal.Add( '  (0) AS LOTE,' );
    SqlLocal.Add( '  P.RAZAOSOCIAL AS NOME,' );
    SqlLocal.Add( '  D.NODOCUMENTO,' );
    SqlLocal.Add( '  D.COMPLDOCUMENTO,' );
    SqlLocal.Add( '  L.DATALANCTO,' );
    SqlLocal.Add( '  L.VALOR,' );
    SqlLocal.Add( '  L.VALOROUTRAMOEDA,' );
    SqlLocal.Add( '  D.CODDOCUMENTO,' );
    SqlLocal.Add( '  L.NUMLANCTO,' );
    SqlLocal.Add( '  L.PLNCODIGO,' );
    SqlLocal.Add( '  R.CODLANCFINANC,' );
    SqlLocal.Add( '  R.NUMCHQBORDERO,' );
    SqlLocal.Add( '  L.OPERACAO,' );
    SqlLocal.Add( '  R.NUMLOTE,' );
    SqlLocal.Add( '  R.DATACFLOAT,' );
    SqlLocal.Add( '  R.CODLANCNAOIDENT,' );
    SqlLocal.Add( '  L.NUMLOTEMANUAL,' );
    SqlLocal.Add( '  D.FLGTIPODOCUMENTO' );
    SqlLocal.Add( 'FROM' );
    SqlLocal.Add( '  LANCTODOCUM L,' );
    SqlLocal.Add( '  DOCUMENTO D,' );
    SqlLocal.Add( '  RECBTOPAGTO R,' );
    SqlLocal.Add( '  PESSOA P' );
    SqlLocal.Add( 'WHERE' );
    SqlLocal.Add( '  (1 = 2)' );

    Result := GetDataPacket( SqlLocal.Text );
  Finally
    SqlLocal.Free;
  End;
End;

Function TCtrlExcluiEstornaBaixaLote.ExisteRegularizacao(iCodDocumento: LOngInt):Boolean;
Begin
  With DtmCapCarMT Do Begin
    SQLTestaRegAdianto.Prepare;

    sqlTestaRegAdianto.ParamByName('CODDOCUMENTO').AsInteger := iCodDocumento;
    sqlTestaRegAdianto.ParamByName('OPERACAO').AsString := '16';
    sqlTestaRegAdianto.Open;

    Result := (Not CdsTestaRegAdianto.IsEmpty);

    If Result Then
      MessageInfo := 'Este lançamento corresponde a um adiantamento já regularizado ou ele consta num lote onde existiu tal regularização, Não é possível excluir/estornar a baixa';
  End;
End;

Procedure TCtrlExcluiEstornaBaixaLote.LimpaDocumentos;
Var
  SqlLocal : TStringList;
Begin
  SqlLocal := TStringList.Create;
  With sqlLocal Do Begin
    Try
      Clear;
      Add(' SELECT ');
      Add('    P.RAZAOSOCIAL AS NOME, ');
      Add('    D.NODOCUMENTO, ');
      Add('    D.COMPLDOCUMENTO, ');
      Add('    L.DATALANCTO, ');
      Add('    L.VALOR, ');
      Add('    L.VALOROUTRAMOEDA, ');
      Add('    D.CODDOCUMENTO, ');
      Add('    L.NUMLANCTO, ');
      Add('    L.PLNCODIGO, ');
      Add('    R.CODLANCFINANC, ');
      Add('    R.NUMCHQBORDERO, ');
      Add('    L.OPERACAO, R.NUMLOTE, ');
      Add('    R.DATACFLOAT, ');
      Add('    R.CODLANCNAOIDENT, ');
      Add('    DECODE(D.RECPAG,''R'', R.NUMCHQBORDERO, TO_CHAR(R.NUMLOTE)) AS LOTE, ');
      Add('    L.NUMLOTEMANUAL, ');
      Add('    D.FLGTIPODOCUMENTO ');
      Add(' FROM ');
      Add('    PESSOA P, ');
      Add('    DOCUMENTO D, ');
      Add('    LANCTODOCUM L, ');
      Add('    RECBTOPAGTO R ');
      Add(' WHERE ');
      Add('    (1=2) ');

      CdsExcluidos.Data := GetDataPacket( Text );
    Finally
      sqlLocal.Free;
    End;
  End;
End;

procedure TCtrlExcluiEstornaBaixaLote.SetqtdMinCommit(const Value: longInt);
begin
  FqtdMinCommit := Value;
end;

function TCtrlExcluiEstornaBaixaLote.BuscaDocFilho(piCodDocumento: integer): OleVariant;
begin
    Result := GetDataPacket(' SELECT '+
                            '   PES.RAZAOSOCIAL AS NOME, '+
                            '   DOC.NODOCUMENTO, '+
                            '   DOC.COMPLDOCUMENTO, '+
                            '   LTD.DATALANCTO, '+
                            '   LTD.VALOR, '+
                            '   LTD.VALOROUTRAMOEDA, '+
                            '   DOC.CODDOCUMENTO, '+
                            '   LTD.NUMLANCTO, '+
                            '   LTD.PLNCODIGO, '+
                            '   RPG.CODLANCFINANC, '+
                            '   RPG.NUMCHQBORDERO, '+
                            '   LTD.OPERACAO, '+
                            '   RPG.NUMLOTE, '+
                            '   RPG.DATACFLOAT, '+
                            '   RPG.CODLANCNAOIDENT, '+
                            '   TO_CHAR(DECODE(RPG.NUMLOTE,NULL,RPG.NUMCHQBORDERO,RPG.NUMLOTE)) AS LOTE, '+
                            '   LTD.NUMLOTEMANUAL, '+
                            '   DOC.FLGTIPODOCUMENTO, '+
                            '   PTF.DESCRICAO '+

                            ' FROM '+
                            '   PESSOA        PES, '+
                            '   DOCUMENTO     DOC, '+
                            '   RECBTOPAGTO   RPG, '+
                            '   LANCTODOCUM   LTD, '+
                            '   DOCUMXDOCUM   DXD, '+
                            '   PORTADORFORMA PTF '+

                            ' WHERE (((RTRIM(LTD.OPERACAO) = ''5'') OR (RTRIM(LTD.OPERACAO) = ''15'')) AND (LTD.ESTORNO IS NULL)) '+
                            '   AND ((LTD.CODDOCUMENTO = RPG.CODDOCUMENTO) AND (LTD.NUMLANCTO = RPG.NUMLANCTO)) '+
                            '   AND (LTD.CODDOCUMENTO = DOC.CODDOCUMENTO) '+
                            '   AND (DOC.IDFORCLI = PES.IDPESSOA) '+
                            '   AND (DXD.IDDOCUMENTOPAI = '+IntToStr(piCodDocumento)+') '+
                            '   AND (DXD.IDDOCUMENTO = DOC.CODDOCUMENTO) '+
                            '   AND (RPG.CODPORTFORMA = PTF.CODPORTFORMA) '+
                            //Helen 126261/1121 - Inicio
                            ' UNION                       '+
                            ' SELECT '+
                            '   PES.RAZAOSOCIAL AS NOME, '+
                            '   DOC.NODOCUMENTO, '+
                            '   DOC.COMPLDOCUMENTO, '+
                            '   LTD.DATALANCTO, '+
                            '   LTD.VALOR, '+
                            '   LTD.VALOROUTRAMOEDA, '+
                            '   DOC.CODDOCUMENTO, '+
                            '   LTD.NUMLANCTO, '+
                            '   LTD.PLNCODIGO, '+
                            '   RPG.CODLANCFINANC, '+
                            '   RPG.NUMCHQBORDERO, '+
                            '   LTD.OPERACAO, '+
                            '   RPG.NUMLOTE, '+
                            '   RPG.DATACFLOAT, '+
                            '   RPG.CODLANCNAOIDENT, '+
                            '   TO_CHAR(DECODE(RPG.NUMLOTE,NULL,RPG.NUMCHQBORDERO,RPG.NUMLOTE)) AS LOTE, '+
                            '   LTD.NUMLOTEMANUAL, '+
                            '   DOC.FLGTIPODOCUMENTO, '+
                            '   PTF.DESCRICAO '+
                            ' FROM '+
                            '   PESSOA        PES, '+
                            '   DOCUMENTO     DOC, '+
                            '   RECBTOPAGTO   RPG, '+
                            '   LANCTODOCUM   LTD, '+
                            '   DOCUMXDOCUM   DXD, '+
                            '   PORTADORFORMA PTF '+

                            ' WHERE (((RTRIM(LTD.OPERACAO) = ''5'') OR (RTRIM(LTD.OPERACAO) = ''15'')) AND (LTD.ESTORNO IS NULL)) '+
                            '   AND ((LTD.CODDOCUMENTO = RPG.CODDOCUMENTO) AND (LTD.NUMLANCTO = RPG.NUMLANCTO)) '+
                            '   AND (LTD.CODDOCUMENTO = DOC.CODDOCUMENTO) '+
                            '   AND (DOC.IDFORCLI = PES.IDPESSOA) '+
                            '   AND (DOC.CODDOCUMENTO = '+IntToStr(piCodDocumento)+') '+
                            '   AND (DOC.CODDOCUMENTO  IN (DXD.IDDOCUMENTOPAI)) '+
                            '   AND (RPG.CODPORTFORMA = PTF.CODPORTFORMA) ' );
                            //Helen 126261/1121 - Fim
end;

function TCtrlExcluiEstornaBaixaLote.DocTemPai(piCodDocumento: Integer): boolean;
var
  cdsAux : TClientDataset;
begin
  Result := False;
  cdsAux := TClientDataset.Create( nil );
  try
    cdsAux.Data := GetDataPacket(' SELECT 1 FROM DOCUMXDOCUM WHERE IDDOCUMENTO = ' + IntToStr( piCodDocumento ) );
    Result := not cdsAux.IsEmpty;
  finally
    cdsAux.close;
    cdsAux.Free;
  end;
end;

function TCtrlExcluiEstornaBaixaLote.BuscaDocEncontroContas(piCodDocumento: Integer;
                                                            piNumLote:string = '';
                                                            piLancFinanc : string = ''   //edilaine SIG114951
                                                            ): OleVariant;
var
   sSQL:string;
begin
    sSQL := '';
    // Alterado por FHBS - SOL: 140975 KTN: 892174 - Adicionado "/*+ rule */"
//    sSQL :=                 'SELECT /*+ rule */ PES.RAZAOSOCIAL AS NOME,' + #13#10 +   //Everson TIBERO
    sSQL :=                 'SELECT PES.RAZAOSOCIAL AS NOME,' + #13#10 +                 //Everson TIBERO
                            '       DOC.NODOCUMENTO,' + #13#10 +
                            '       DOC.COMPLDOCUMENTO,' + #13#10 +
                            '       LTD.DATALANCTO,' + #13#10 +
                            '       LTD.VALOR,' + #13#10 +
                            '       LTD.VALOROUTRAMOEDA,' + #13#10 +
                            '       RE2.CODDOCUMENTO,' + #13#10 +
                            '       RE2.NUMLANCTO,' + #13#10 +
                            '       LTD.PLNCODIGO,' + #13#10 +
                            '       RE2.CODLANCFINANC,' + #13#10 +
                            '       RE2.NUMCHQBORDERO,' + #13#10 +
                            '       LTD.OPERACAO,' + #13#10 +
                            '       RE2.NUMLOTE,' + #13#10 +
                            '       RE2.DATACFLOAT,' + #13#10 +
                            '       RE2.CODLANCNAOIDENT,' + #13#10 +

                            //Ricardo Freitas - SOL 157289/4921 KINTANA: 1279362 - comentado
                            //'       TO_CHAR(DECODE(RE2.NUMLOTE, NULL, RE2.NUMCHQBORDERO, RE2.NUMLOTE)) AS LOTE,' + #13#10 +
                            //Ricardo Freitas - SOL 157289/4921 KINTANA: 1279362
                            '       TO_CHAR(DECODE(RE2.NUMCHQBORDERO, NULL, RE2.NUMLOTE, RE2.NUMCHQBORDERO)) AS LOTE, ' + #13#10 +

                            '       LTD.NUMLOTEMANUAL,' + #13#10 +
                            '       DOC.FLGTIPODOCUMENTO,' + #13#10 +
                            '       PTF.DESCRICAO' + #13#10 +
                            '  FROM PESSOA        PES,' + #13#10 +
                            '       DOCUMENTO     DOC,' + #13#10 +
                            '       LANCTODOCUM   LTD,' + #13#10 +
                            '       RECBTOPAGTO   RE2,' + #13#10 +
                            '       RECBTOPAGTO   RE3,' + #13#10 +
                            '       PORTADORFORMA PTF' + #13#10 +
                            ' WHERE doc.coddocumento = ltd.coddocumento' + #13#10 +
                            '   and ltd.coddocumento = re2.coddocumento' + #13#10 +
                            '   AND DOC.IDFORCLI = PES.IDPESSOA' + #13#10 +
                            '   AND NOT EXISTS (SELECT 1' + #13#10 +
                            '                   FROM DOCUMXDOCUM DXD' + #13#10 +
                            '                   WHERE DXD.IDDOCUMENTOPAI = RE2.CODDOCUMENTO)' + #13#10 +
                            '   AND LTD.OPERACAO = ''5''' + #13#10 +
                            '   AND (RE2.CODPORTFORMA = PTF.CODPORTFORMA(+))' + #13#10 +
                            //Ricardo Freitas - SOL 157289/4921 KINTANA: 1279362
                            '   AND (RE2.NUMLANCTO = LTD.NUMLANCTO)   ' + #13#10 +
                            '   AND RE2.CODLANCFINANC = RE3.CODLANCFINANC' + #13#10 +
                            '   AND RE2.CODDOCUMENTO  = RE3.CODDOCUMENTO '  + #13#10; //Everson Cunha - SIG 77746 Tibero - 04/11/2018

   //edilaine SIG114951 : inicio
   if piLancFinanc <> '' then
      sSQL := sSQL +  ' AND RE2.CODLANCFINANC = ' + Trim(piLancFinanc)
   else
      sSQL := sSQL +  '   AND RE3.CODDOCUMENTO  = '+ IntToStr(piCodDocumento);
   //edilaine SIG114951 : fim


    //Ricardo Freitas - SOL 157289/4921 KINTANA: 1279362
//   if Trim(piNumLote) <> '' then   //Everson Cunha - SIG79578
   if Trim(piNumLote) > '0' then     //Everson Cunha - SIG79578
      sSQL := sSQL +  ' AND RE2.NUMLOTE = ' + Trim(piNumLote)
    //Eraldo Luis da Silva - SOL 160459 KINTANA: 1348720 INICIO
    else
      sSQL := sSQL +  ' AND RE2.NUMLOTE IS NULL';
    //Eraldo Luis da Silva - SOL 160459 KINTANA: 1348720 FIM


    Result := GetDataPacket(sSQL);

end;

End.
