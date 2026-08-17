// Alterações:
{---------------------------------------------------------------------------------------------------
Rotina    : bbtnConfirmarclick
Data      : 13.02.2007
Autor     : David Ayrolla
pendência : 22037
Descrição : Envio de e-mail no estorno de documento.
------------------------------------------------------------------------------------------
Rotina    : TCtrlDocumento.Estornar
Data      : 11/08/2006
Pendência : 23025
Autor     : Andre Tavares
Descrição : marcar o documento como estornado em seu(s) lote(s) para que seja possível alterar
seus dados bancário após o estorno quando o mesmo está em um lote.
--------------------------------------------------------------------------------

Rotina    : constructor CREATE
Data      : 13/12/2005
Autor     : Alex Pereira
Pendência :
Descrição : Criando o método constructor create e corrigindo a construção e destruição de objetos
----------------------------------------------------------------------------------------------------}
{---------------------------------------------------------------------------------------------------
Rotina    : bbtnConfirmarclick
Data      : 14/06/2004
Autor     : André Pontes
Pendência : 16599
Descrição : Não está sendo possível estornar documento com múltiplas contas de baixa. (padrão 5.10.03)
            O erro era que se estava passando o PLACONTA como integer
----------------------------------------------------------------------------------------------------}
{---------------------------------------------------------------------------------------------------
Rotina    : bbtnConfirmarclick
Data      : 10/07/2003
Autor     : André Pontes
Pendência : 14177
Descrição : chamada da função ProcessaBaixaManual passando bEstorno como "True", para que os históricos
            (contábil e financeiro) possam ser alterados de acordo
----------------------------------------------------------------------------------------------------}
{---------------------------------------------------------------------------------------------------
Rotina    : bbtnConfirmarclick
Data      : 01/07/2003
Autor     : André Tavares
Pendência : 13471
Descrição : resolução da pendência 13471
----------------------------------------------------------------------------------------------------}
{---------------------------------------------------------------------------------------------------
Rotina    : bbtnConfirmarclick
Data      : 15/03/2004 (término)
Autor     : David Ayrolla
Pendência : 16135
Descrição : Apagar relacionamentos do documento estornado com o lote e o
            "portador-forma".
----------------------------------------------------------------------------------------------------}


{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: Janeiro/2003                           }
{                                                       }
{*******************************************************}

Unit
  uCtrlEstornaBaixaDocs;

Interface

Uses
  SysUtils, DbClient, Db, Classes, uCmControlObject, uCMTypes, uCtrlParamIntegra,
  uCtrlDocumento, uCtrlPadroes, uCtrlBaixaDocumentos, uCtrlMensagens;

Type
  TCtrlEstornaBaixaDocs = Class(TCmControlObject)
  Protected
    Procedure AfterInitialize;   Override;
    Procedure DoChangeDataBase;  Override;
    Procedure OnCreateAppServer; Override;
  Private
    CtrlDocumento     : TCtrlDocumento;
    CtrlBaixaDocumentos : TCtrlBaixaDocumentos;
    CtrlPadroes       : TCtrlPadroes;

    FIdEmpresa        : Double;
    FIdModulo         : Double;
    FIdUsuario        : Double;
    FIdEspAcesso      : Double;
    FUsaPlanoPatro    : Boolean;
    FPlanoConta       : Double;
    FCdsDocsBaixados  : TClientDataSet;
    FCdsAux           : TClientDataSet;

    Function ExisteRegularizacao( iCodDocumento: LongInt ) : Boolean;

    Procedure SetCdsDocsBaixados( Const Value : TClientDataSet );
    Procedure SetCdsAux( Const Value : TClientDataSet );
  Public
    Constructor Create; override;
    Destructor Destroy; override;

    Function bbtnConfirmarclick(pvDataModulo: TDateTime; SistemaLancto: TSistemaLancto;
         bLancaBaixaFloat: Boolean; iIdUsuarioInclusao, IdEspAcesso, iPLanoContabil: Integer;
         bUsaPlanoPatro, bLancaContab, bPartidaDobrada: Boolean;
         //DAVID - Pendência 16135
         //Parâmetro que indica que os relacionamentos do documento com o lote e o "portador-forma" devem ser excluídos.
         bExcluiRel : boolean = False ) : Boolean;

    Property IdEmpresa              : Double         Read FIdEmpresa              Write FIdEmpresa;
    Property IdModulo               : Double         Read FIdModulo               Write FIdModulo;
    Property IdUsuario              : Double         Read FIdUsuario              Write FIdUsuario;
    Property IdEspAcesso            : Double         Read FIdEspAcesso            Write FIdEspAcesso;
    Property UsaPlanoPatro          : Boolean        Read FUsaPlanoPatro          Write FUsaPlanoPatro;
    Property PlanoConta             : Double         Read FPlanoConta             Write FPlanoConta;
    Property CdsDocsBaixados        : TClientDataSet Read FCdsDocsBaixados        Write SetCdsDocsBaixados;
    Property CdsAux                 : TClientDataSet Read FCdsAux                 Write SetCdsAux;
  End;

Implementation

Uses
  uDataBase, DCapCarMT;

{ TCtrlEstornaBaixaDocs }
constructor TCtrlEstornaBaixaDocs.Create;
begin
  inherited;
  CdsAux := TClientDataSet.Create( Nil );

  CtrlDocumento  := TCtrlDocumento.Create;
  CtrlBaixaDocumentos := TCtrlBaixaDocumentos.Create;
  CtrlPadroes    := TCtrlPadroes.Create;
end;

Destructor TCtrlEstornaBaixaDocs.Destroy;
Begin
  CtrlDocumento.Free;
  CtrlBaixaDocumentos.Free;
  CtrlPadroes.Free;
  CdsAux.Free;

   if isAppServer then FCdsDocsBaixados.Free;

  Inherited;
End;

Procedure TCtrlEstornaBaixaDocs.AfterInitialize;
Begin
  Inherited;
  CdsAux := TClientDataSet.Create( Nil );

  CtrlDocumento.InitializeAs( Self );
  CtrlBaixaDocumentos.InitializeAs( Self );
  CtrlDocumento.OpenTransaction := False;
  CtrlBaixaDocumentos.OpenTransaction := False;

  CtrlPadroes.InitializeAs( Self );
  CtrlPadroes.OpenTransaction := false;

  CtrlDocumento.IdModulo          := Trunc( IdModulo );
  CtrlDocumento.IdUsuario         := Trunc( IdUsuario );
  CtrlDocumento.UsaPlanoPatro     := UsaPlanoPatro;
  CtrlDocumento.IdEspAcesso       := Trunc( IdEspAcesso );

End;

Procedure TCtrlEstornaBaixaDocs.DoChangeDataBase;
Begin
  Inherited;

End;

Procedure TCtrlEstornaBaixaDocs.OnCreateAppServer;
Begin
  Inherited;
  FCdsDocsBaixados  := TClientDataSet.Create(nil);

End;

Procedure TCtrlEstornaBaixaDocs.SetCdsDocsBaixados( Const Value : TClientDataSet );
Begin
  FCdsDocsBaixados := Value;
End;

Procedure TCtrlEstornaBaixaDocs.SetCdsAux( Const Value : TClientDataSet );
Begin
  FCdsAux := Value;
End;

Function TCtrlEstornaBaixaDocs.bbtnConfirmarclick( pvDataModulo: TDateTime; SistemaLancto: TSistemaLancto;
         bLancaBaixaFloat: Boolean; iIdUsuarioInclusao, IdEspAcesso, iPLanoContabil: Integer;
         bUsaPlanoPatro, bLancaContab, bPartidaDobrada: Boolean;
         //DAVID - Pendência 16135
         //Parâmetro que indica que os relacionamentos do documento com o lote e o "portador-forma" devem ser excluídos.
         bExcluiRel : boolean = False ) : Boolean;
Var
  sDataPagto,
  sOldDataPagto : String;
  CdsDocumentosLocal : TClientDataSet;

  //DAVID - 07/02/07 - Pendência 22037
  cdsEnvio : TClientDataSet;
  CtrlMensagens : TCtrlMensagens;
  iContexto : integer;
Begin
  Try
    sDataPagto := DateToStr( pvDataModulo );
    sOldDataPagto := sDataPagto;

    CdsDocumentosLocal := TClientDataSet.Create( nil );

    //DAVID - 07/02/07 - Pendência 22037
    cdsEnvio := TClientDataSet.Create( nil );
    CtrlMensagens := TCtrlMensagens.Create;
    try

      //DAVID - 07/02/07 - Pendência 22037
      cdsEnvio.Data := GetDataPacket(
       ' select 10000 as NUMDOC, sysdate as DATAESTORNO, 123456.78 as VALOR from DUAL ' );
      cdsEnvio.Delete;

      StartTransaction;
      CdsDocsBaixados.First;
      While Not CdsDocsBaixados.Eof Do
      Begin
        If ( CdsDocsBaixados.FieldByName('ESTORNA' ).AsInteger = 1) And
           (Not ExisteRegularizacao(CdsDocsBaixados.FieldByName('CODDOCUMENTO').AsInteger)) Then
        Begin
           CdsDocumentosLocal.Data := CtrlBaixaDocumentos.GetEmptyCdsBaixa;
           CdsDocumentosLocal.Append;
           CdsDocumentosLocal.FieldByName('OPERACAO').AsString := CdsDocsBaixados.FieldByName('OPERORI').AsString;
           CdsDocumentosLocal.FieldByName('STATUS').AsString := '0';
           CdsDocumentosLocal.FieldByName('IDFORCLI').AsInteger := CdsDocsBaixados.FieldByName('IDFORCLI').AsInteger;
           CdsDocumentosLocal.FieldByName('CODTIPDOC').AsInteger := CdsDocsBaixados.FieldByName('CODTIPDOC').AsInteger;
           CdsDocumentosLocal.FieldByName('IDMODULO').AsInteger := CdsDocsBaixados.FieldByName('IDMODULO').AsInteger;
           CdsDocumentosLocal.FieldByName('IDPESSOA').AsInteger := CdsDocsBaixados.FieldByName('IDPESSOA').AsInteger;
           CdsDocumentosLocal.FieldByName('CODDOCUMENTO').AsInteger := CdsDocsBaixados.FieldByName('CODDOCUMENTO').AsInteger;
           CdsDocumentosLocal.FieldByName('NODOCUMENTO').AsInteger := CdsDocsBaixados.FieldByName('NODOCUMENTO').AsInteger;
           CdsDocumentosLocal.FieldByName('COMPLDOCUMENTO').AsString := CdsDocsBaixados.FieldByName('COMPLDOCUMENTO').AsString;
           CdsDocumentosLocal.FieldByName('DATAPROGRAMADA').AsDateTime := CdsDocsBaixados.FieldByName('DATAPROGRAMADA').AsDateTime;
           CdsDocumentosLocal.FieldByName('DATAVENCTO').AsDateTime := CdsDocsBaixados.FieldByName('DATAVENCTO').AsDateTime;
           CdsDocumentosLocal.FieldByName('RECPAG').AsString := CdsDocsBaixados.FieldByName('RECPAG').AsString;
           CdsDocumentosLocal.FieldByName('NOME').AsString := CdsDocsBaixados.FieldByName('NOMETABCLI').AsString;
           CdsDocumentosLocal.FieldByName('MOECODIGO').AsInteger := CdsDocsBaixados.FieldByName('MOECODIGO').AsInteger;
           CdsDocumentosLocal.FieldByName('PLANO').AsInteger := CdsDocsBaixados.FieldByName('PLANO').AsInteger;
           CdsDocumentosLocal.FieldByName('PLACONTA').AsString := CdsDocsBaixados.FieldByName('PLACONTA').AsString;
           CdsDocumentosLocal.FieldByName('CODSUBCONTA').AsInteger := CdsDocsBaixados.FieldByName('CODSUBCONTA').AsInteger;
           CdsDocumentosLocal.FieldByName('CODCENTROCUSTO').AsString := CdsDocsBaixados.FieldByName('CODCENTROCUSTO').AsString;
           CdsDocumentosLocal.FieldByName('CODGRUPOCNAB').AsInteger := CdsDocsBaixados.FieldByName('CODGRUPOCNAB').AsInteger;
           CdsDocumentosLocal.FieldByName('NOSSONUMERO').AsString := CdsDocsBaixados.FieldByName('NOSSONUMERO').AsString;
           CdsDocumentosLocal.FieldByName('NUMLANCTO').AsInteger := CdsDocsBaixados.FieldByName('NUMLANCTO').AsInteger;
           CdsDocumentosLocal.FieldByName('VALOROUTRAMOEDA').AsFloat := CdsDocsBaixados.FieldByName('VALOROUTRAMOEDA').AsFloat * -1;
           CdsDocumentosLocal.FieldByName('DEBCRE').AsString := CdsDocsBaixados.FieldByName('DEBCRE').AsString;
           CdsDocumentosLocal.FieldByName('VLRLIQUIDO').AsFloat := CdsDocsBaixados.FieldByName('VLRLIQUIDO').AsFloat * -1;
           CdsDocumentosLocal.FieldByName('VALOR').AsFloat := CdsDocsBaixados.FieldByName('VALOR').AsFloat * -1;
           CdsDocumentosLocal.Post;

           if not(CtrlBaixaDocumentos.ProcessaBaixaManual(false,
                           CdsDocsBaixados.FieldByName('CODPORTFORMA').AsInteger,
                           CdsDocsBaixados.FieldByName('NUMCHQBORDERO').AsInteger,
                           CdsDocumentosLocal.Data, pvDataModulo,
                           SistemaLancto, bLancaBaixaFloat, iIdUsuarioInclusao,
                           CdsDocsBaixados.FieldByName('IDPESSOA').AsInteger,
                           IdEspAcesso, iPLanoContabil, bUsaPlanoPatro, bLancaContab, bPartidaDobrada,
                           True, 0,
                           // André Pontes - 10/07/2003 - pendência 14177
                           0, -1, True, 0, 0, 0, True
                           // FIM André Pontes - 10/07/2003 - pendência 14177
                           )) then
              raise Exception.Create(CtrlBaixaDocumentos.MessageInfo)
           else
           begin
              if not ExecSQL('UPDATE LANCTODOCUM SET ESTORNO = ' + IntToStr(CtrlBaixaDocumentos.NumLancto) + ' WHERE NUMLANCTO = ' + CdsDocsBaixados.FieldByName('NUMLANCTO').AsString) then
                 raise Exception.Create(MessageInfo);

              if not ExecSQL('UPDATE LANCTODOCUM SET ESTORNO = ' + CdsDocsBaixados.FieldByName('NUMLANCTO').AsString + ' WHERE NUMLANCTO = ' + IntToStr(CtrlBaixaDocumentos.NumLancto)) then
                 raise Exception.Create(MessageInfo);

         // início André Tavares 30/06/2003 pendência 13471
              if not ExecSql(' UPDATE DOCUMENTO SET FLGNAOCONCILIADO = 1 WHERE CODDOCUMENTO = '+ CdsDocsBaixados.FieldByName('CODDOCUMENTO').asString) then
                 raise Exception.Create(MessageInfo);
         // fim André Tavares 30/06/2003 pendência 13471

              //início - andre tavares - pendência 23025 - para saber em que lote o documento foi estornado se o mesmo se encontra em um lote
              if not ExecSql('UPDATE LOTEXDOCUM SET FLGESTORNO = ''S'' WHERE CODDOCUMENTO =  '+ CdsDocsBaixados.FieldByName('CODDOCUMENTO').asString) then
                 raise Exception.Create(MessageInfo);
              //fim - andre tavares - pendência 23025 

              //DAVID - Pendência 16135
              //Se o flag estiver marcado como True, procede a exclusão do relacionamento e a limpeza do campo PORTADORFORMA
              if bExcluiRel then
              begin
                if not ExecSQL(' UPDATE DOCUMENTO SET CODPORTFORMA = null WHERE CODDOCUMENTO = ' + CdsDocsBaixados.FieldByName('CODDOCUMENTO').asString ) then
                   raise Exception.Create( MessageInfo );
              end;

              //DAVID - 07/02/07 - Pendência 22037
              cdsEnvio.Append;
              cdsEnvio.FieldByName('NUMDOC').AsFloat         := CdsDocsBaixados.FieldByName('NODOCUMENTO').AsInteger;
              cdsEnvio.FieldByName('DATAESTORNO').AsDateTime := pvDataModulo;
              cdsEnvio.FieldByName('VALOR').AsFloat          := CdsDocsBaixados.FieldByName('VALOR').AsFloat;
              cdsEnvio.Post;

           end;

        End;

        CdsDocsBaixados.Next;
      End;

      If Not CtrlPadroes.GravaLogOperacoes( IdEmpresa, IdModulo, IdUsuario,
                                            'Exclui/Estorna Documento', False ) Then Begin
        Raise Exception.Create(CtrlPadroes.MessageInfo);
      End;

      Commit;

      //DAVID - 07/02/07 - Pendência 22037
      CtrlMensagens.InitializeAs( Self );
      cdsEnvio.First;
      while not cdsEnvio.Eof do
      begin
        if SistemaLancto = slCap then
          iContexto := 2
        else
          iContexto := 3;

        CtrlMensagens.EnviaMensagemContexto( iIdUsuarioInclusao, iContexto,
         [ 'NUMDOC'    ,
           'DATAESTORNO'     ,
           'VALOR'          ] ,
         [ cdsEnvio.FieldByName('NUMDOC').AsString                                        ,
           FormatDateTime( 'dd/mm/yyyy', cdsEnvio.FieldByName('DATAESTORNO').AsDateTime ) ,
           FormatFloat( '#,##0.00', cdsEnvio.FieldByName('VALOR').AsFloat )              ] );
        cdsEnvio.Next;
      end;

      MessageInfo := 'Baixas Estornadas com sucesso';

      Result := True;

    finally
      CdsDocumentosLocal.free;
      cdsEnvio.Free;
    end;

  Except
    On E : Exception Do Begin
      Result := False;
      Rollback;
      CdsDocumentosLocal.free;
      MessageInfo := 'Erro ao Estornar Baixas' + #13 + #10 + E.Message;
    End;
  End;
End;

Function TCtrlEstornaBaixaDocs.ExisteRegularizacao(iCodDocumento: LOngInt):Boolean;
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

End.
