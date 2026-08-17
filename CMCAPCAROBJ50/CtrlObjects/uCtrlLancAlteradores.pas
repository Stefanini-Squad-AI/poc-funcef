{---------------------------------------------------------------------------------------------------
Rotina    : VerificaStatusDoc
Data      : 12/11/2007
Autor     : André Tavares
pendência : 22825
Descrição : permitir a exclusão de alteradores que zeram o saldo doc documento
{---------------------------------------------------------------------------------------------------
{---------------------------------------------------------------------------------------------------
Rotina    : ProcessaLancAlteradores
Data      : 16/08/2007
Autor     : André Tavares
Descrição : dá erro de constraint ao tentar excluir um alterador de imposto acumulado.
{---------------------------------------------------------------------------------------------------
{---------------------------------------------------------------------------------------------------
Rotina    : ProcessaLancAlteradores
Data      : 08/03/2006
Autor     : André Tavares
Descrição : resolução da pendência 21647 - não permitir que se lance um alterador para documentos enviados para cobrança ou baixados.
{---------------------------------------------------------------------------------------------------
{---------------------------------------------------------------------------------------------------
Rotina    : VerificaStatusDoc
Data      : 14/02/2006
Autor     : Cátia Azevedo
Descrição : resolução da pendência 21558
{---------------------------------------------------------------------------------------------------
Rotina    : bbtnConfirmarclick
Data      : 01/07/2003
Autor     : André Tavares
Descrição : resolução da pendência 13471
----------------------------------------------------------------------------------------------------}
unit uCtrlLancAlteradores;

interface

Uses SysUtils, Classes, DbClient, uCmControlObject, Db, uCMTypes,
     uCtrlDocumento, uCtrlPadroes, uCtrlFinanc;

Type
  TCtrlLancAlteradores = Class(TCmControlObject)

  private
    _CtrlDocumento: TCtrlDocumento;
    _Padroes : TCtrlPadroes;

    FCdsLancAlteradores: TClientDataSet;
    procedure SetCdsLancAlteradores(const Value: TClientDataSet);

    //Cátia Azevedo - 21558 - 14/02/06
    Function VerificaStatusDoc(CodDocumento : extended):Boolean;
  protected
    procedure DoChangeDataBase; Override;
    procedure OnCreateAppServer; Override;
    procedure AfterInitialize; Override;
  public
    Constructor Create; Override;
    Destructor Destroy; Override;
    function ProcessaLancAlteradores(Operacao: TOperacao;
             iIdUsuario, iIdPessoa, iIdModulo, liPlanoConta: Integer;
             bUsaPlanoPatro, bContabiliza, bPartidaDobrada: Boolean): Boolean;

    function ValidaTesteDispFinanc(iCodDocumento: integer): boolean;          

    Property CdsLancAlteradores: TClientDataSet read FCdsLancAlteradores write SetCdsLancAlteradores;

  end;


implementation

{ TCtrlLancAlteradores }

procedure TCtrlLancAlteradores.AfterInitialize;
begin
  inherited;
  _CtrlDocumento.InitializeAs(Self);
  _CtrlDocumento.OpenTransaction := false;
  _Padroes.InitializeAs(Self);
  _Padroes.OpenTransaction := false;
end;

constructor TCtrlLancAlteradores.Create;
begin
  inherited;
  _CtrlDocumento := TCtrlDocumento.Create;
  _Padroes := TCtrlPadroes.Create;
end;

destructor TCtrlLancAlteradores.Destroy;
begin
  _Padroes.Free;
  _CtrlDocumento.Free;
  If isAppServer Then FCdsLancAlteradores.Free;
  inherited;
end;

procedure TCtrlLancAlteradores.DoChangeDataBase;
begin
  inherited;

end;

procedure TCtrlLancAlteradores.OnCreateAppServer;
begin
  inherited;
  FCdsLancAlteradores := TClientDataSet.Create(nil);
end;

function TCtrlLancAlteradores.ProcessaLancAlteradores( Operacao: TOperacao;
         iIdUsuario, iIdPessoa, iIdModulo, liPlanoConta: Integer;
         bUsaPlanoPatro, bContabiliza, bPartidaDobrada: Boolean): Boolean;

var
  sDscLog : String;
  
  //David - Pendência 25536
  CtrlFinanc: TCtrlFinanc;
  cdsData : TClientDataset;


begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.ProcessaLancAlteradores(Integer(Operacao),
               iIdUsuario, iIdPessoa, iIdModulo, liPlanoConta, bUsaPlanoPatro, bContabiliza);

     If Not Result Then
       MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
     Result := False;
     Try
        StartTransaction;

        //David - Pendência 25536
        CtrlFinanc := TCtrlFinanc.Create( iIdPessoa, iIdModulo, iIdUsuario, bUsaPlanoPatro );
        cdsData := TClientDataset.Create( nil );
        try
           // Rodolpho da Silva - P: 25536 - 09/08/2007
           if ValidaTesteDispFinanc(FCdsLancAlteradores.FieldByName('CODDOCUMENTO').AsInteger) then
           begin
              //Consulto as datas porque não há garantia de que estejam no dataset de alteradores
              cdsData.Data := GetDataPacket( ' select nvl( DATADISPONIB, DATAPROGRAMADA ) as DATADOC ' +
                                             ' from DOCUMENTO where CODDOCUMENTO = ' + FCdsLancAlteradores.FieldByName('CODDOCUMENTO').AsString);


              CtrlFinanc.InitializeAs( Self );
              if not CtrlFinanc.TestaDispFinanc( iIdPessoa, iIdUsuario, trunc( cdsData.FieldByName('DATADOC').AsDateTime ) ) then
              begin
                MessageInfo := ' Não se pode lançar, alterar ou excluir alteradores neste documento, pois a data do mesmo encontra-se bloqueada.';
                raise Exception.Create( MessageInfo );
              end;
           end;

        finally
          CtrlFinanc.Free;
          cdsData.Free;
        end;


        // início - andre tavares pendência 21647 - esta função deve ser chamada para todas as operações de alteradores do documento
        if  not VerificaStatusDoc(FCdsLancAlteradores.FieldByName('CODDOCUMENTO').AsFloat) then
        begin
          MessageInfo := ' Não se pode lançar, alterar ou excluir alteradores para este documento, pois o mesmo já baixado ou emitido para cobrança.';
          raise Exception.Create(MessageInfo);
        end;
        // fim - andre tavares pendência 21647

        sDscLog := '';
        Case Operacao of
          opInserir:
          Begin
              sDscLog := 'Inclusao ';
             _CtrlDocumento.Prepare(OpLanctoDocum, odlAlterador);
             _CtrlDocumento.PartidaDobrada := bPartidaDobrada;
             _CtrlDocumento.Lanctodocum.SetValues(FCdsLancAlteradores.FieldByName('DATALANCTO').AsDateTime,
                                                  FCdsLancAlteradores.FieldByName('CODDOCUMENTO').AsInteger,
                                                  0,
                                                  FCdsLancAlteradores.FieldByName('VLRLIQUIDO').AsFloat,
                                                  FCdsLancAlteradores.FieldByName('VALOROUTRAMOEDA').AsFloat,
                                                  FCdsLancAlteradores.FieldByName('VALOR').AsFloat,
                                                  FCdsLancAlteradores.FieldByName('UNIDNEGOC').AsInteger,
                                                  FCdsLancAlteradores.FieldByName('PLNCODIGO').AsInteger,
                                                  0,
                                                  iIdUsuario,
                                                  iIdPessoa,
                                                  0,
                                                  FCdsLancAlteradores.FieldByName('ESTORNO').AsInteger,
                                                  0,
                                                  0,
                                                  FCdsLancAlteradores.FieldByName('CODALTERADOR').AsInteger,
                                                  '4',
                                                  '',
                                                  '',
                                                  '',
                                                  FCdsLancAlteradores.FieldByName('HISTORICOCOMPL').AsString,
                                                  '',
                                                  '',
                                                  '',
                                                  FCdsLancAlteradores.FieldByName('DEBCRE').AsString,
                                                  iIdModulo,
                                                  liPlanoConta,
                                                  bUsaPlanoPatro,
                                                  bContabiliza);
             Result := _CtrlDocumento.Insert;
          End;
          opAlterar:
          Begin
             sDscLog := 'Alteracao';
             _CtrlDocumento.Prepare(OpLanctoDocum, odlAlterador);
             _CtrlDocumento.PartidaDobrada := bPartidaDobrada;
             _CtrlDocumento.Lanctodocum.SetValues(FCdsLancAlteradores.FieldByName('DATALANCTO').AsDateTime,
                                                  FCdsLancAlteradores.FieldByName('CODDOCUMENTO').AsInteger,
                                                  FCdsLancAlteradores.FieldByName('NUMLANCTO').AsInteger,
                                                  FCdsLancAlteradores.FieldByName('VLRLIQUIDO').AsFloat,
                                                  FCdsLancAlteradores.FieldByName('VALOROUTRAMOEDA').AsFloat,
                                                  FCdsLancAlteradores.FieldByName('VALOR').AsFloat,
                                                  FCdsLancAlteradores.FieldByName('UNIDNEGOC').AsInteger,
                                                  FCdsLancAlteradores.FieldByName('PLNCODIGO').AsInteger,
                                                  0,
                                                  iIdUsuario,
                                                  iIdPessoa,
                                                  0,
                                                  FCdsLancAlteradores.FieldByName('ESTORNO').AsInteger,
                                                  0,
                                                  0,
                                                  FCdsLancAlteradores.FieldByName('CODALTERADOR').AsInteger,
                                                  '4',
                                                  '',
                                                  '',
                                                  '',
                                                  FCdsLancAlteradores.FieldByName('HISTORICOCOMPL').AsString,
                                                  '',
                                                  '',
                                                  '',
                                                  FCdsLancAlteradores.FieldByName('DEBCRE').AsString,
                                                  iIdModulo,
                                                  liPlanoConta,
                                                  bUsaPlanoPatro,
                                                  bContabiliza);
             Result := _CtrlDocumento.Update;
          End;
          opApagar:
          Begin
             sDscLog := 'Exclusao';
             _CtrlDocumento.Prepare(OpLanctoDocum, odlAlterador);
             _CtrlDocumento.PartidaDobrada := bPartidaDobrada;
             _CtrlDocumento.CodDocumento := FCdsLancAlteradores.FieldByName('CODDOCUMENTO').AsInteger;
             _CtrlDocumento.IdModulo := iIdModulo;
             _CtrlDocumento.UsaPlanoPatro := bUsaPlanoPatro;
             _CtrlDocumento.Lanctodocum.CodDocumento := FCdsLancAlteradores.FieldByName('CODDOCUMENTO').AsInteger;
             _CtrlDocumento.Lanctodocum.NumLancto := FCdsLancAlteradores.FieldByName('NUMLANCTO').AsInteger;
             _CtrlDocumento.Lanctodocum.IdModulo := iIdModulo;

             //início - andré tavares - pendência 26113 - 16/08/2007 - tem que excluir desta tabela também 
             if not ExecSql('DELETE FROM DOCXIMPOSTOACUM WHERE IDIMPOSTORETIDO = (SELECT IDIMPOSTORETIDO FROM IMPOSTORETIDO WHERE NUMLANCTO = ' + FCdsLancAlteradores.FieldByName('NUMLANCTO').AsString + ')') then
               raise Exception.Create(MessageInfo);
             //fim - andré tavares - pendência 26113 - 16/08/2007 - tem que excluir desta tabela também

             if not ExecSql('DELETE FROM IMPOSTORETIDO WHERE NUMLANCTO = '+ FCdsLancAlteradores.FieldByName('NUMLANCTO').AsString) then
               raise Exception.Create(MessageInfo);

             Result := _CtrlDocumento.Delete;
          End;
        End;

   // início André Tavares 30/06/2003 pendência 13471
        if not ExecSql(' UPDATE DOCUMENTO SET FLGNAOCONCILIADO = 1 WHERE CODDOCUMENTO = '+ FCdsLancAlteradores.FieldByName('CODDOCUMENTO').asString) then
          raise Exception.Create(MessageInfo);
   // fim André Tavares 30/06/2003 pendência 13471


        If Not Result Then raise Exception.Create(_CtrlDocumento.MessageInfo);
         If Not _Padroes.GravaLogOperacoes(iIdPessoa,iIdModulo,iIdUsuario,sDscLog+' Lanc Alteradores',False) Then
                Raise Exception.Create(_Padroes.MessageInfo);
        Commit;
     except
        On E:Exception Do
         Begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         End;
     End;
  End;
end;

procedure TCtrlLancAlteradores.SetCdsLancAlteradores(
  const Value: TClientDataSet);
begin
  FCdsLancAlteradores := Value;
end;



function TCtrlLancAlteradores.ValidaTesteDispFinanc(
  iCodDocumento: integer): boolean;
begin
   _Cds.Data := GetDataPacket('SELECT RECPAG FROM DOCUMENTO WHERE CODDOCUMENTO = ' + IntToStr(iCodDocumento));
   Result    := not (_Cds.FieldByName('RECPAG').AsString = 'R');
end;




function TCtrlLancAlteradores.VerificaStatusDoc(CodDocumento: extended): Boolean;
begin
 with TclientDataset.Create (nil) do begin
   try
      data := getdatapacket('SELECT STATUS,EMISBLOQ FROM DOCUMENTO WHERE CODDOCUMENTO = '+
                          floattostr(CodDocumento));

      result := (fieldbyname('status').asstring <> '2') and (fieldbyname('emisbloq').asstring <> 'S') ;

      //verifica se o documento foi baixado normalmente
      data := getDataPacket('SELECT NUMLANCTO FROM LANCTODOCUM WHERE (OPERACAO = ''5'') AND (ESTORNO IS NULL) AND CODDOCUMENTO = ' + floattostr(CodDocumento) );
      result := (result) or (isEmpty);

   finally
     free;
     
   end;

 end
end;

end.
