unit uCtrlConfigNFDevol;

interface

Uses DB, uDataBase,uCmControlObject,Classes, dbclient, uDbTemplNFDevol,
     uDbConfigNFDevol,  sysUtils, uMidasUtil, uCMTypes;

Type
  TCtrlConfigNFDevol = class(TCmControlObject)
  Protected
     _DbTemplNFDevol  : TDbTemplNFDevol;
     _DbConfigNFDevol : TDbConfigNFDevol;

     procedure DoChangeDataBase; Override;
     Procedure OnCreateAppServer; Override;
  private
    FCds: TClientDataSet;
    FCdsDet: TClientDataSet;
    procedure SetCds(const Value: TClientDataSet);
    procedure SetCdsDet(const Value: TClientDataSet);

  public
    Property  Cds    : TClientDataSet read FCds write SetCds;
    Property  CdsDet : TClientDataSet read FCdsDet write SetCdsDet;
    //
    Constructor Create; Override;
    Destructor  Destroy; Override;
    //
    Function Gravar  : Boolean;
    Function Excluir : Boolean;
    {**
       Pega o Modelo para configuração de impressão de nota fiscal
    **}
    Function GetModelo( IdTemplNFDevol : Double ) : OleVariant;
    {**
       Pega os itens do Modelo para configuração de impressão de nota fiscal
    **}
    Function GetItensModelo( IdTemplNFDevol : Double ) : OleVariant;
    {**
       Atualiza as notas impressas flegandoas como impressas e o número da última
       nota do impressa.
    **}
    Function AtualizaNotasImpressas(IdPessoa, UltNumNota : Double ) : Boolean;

  End;
implementation

{ TCtrlConfigNFDevol }

function TCtrlConfigNFDevol.AtualizaNotasImpressas(IdPessoa, UltNumNota : Double ): Boolean;
Var
   SQL    : String;
begin
  If ConnectionSide = cnsClient Then
     Begin
        Result := Connection.AppServer.AtualizaNotasImpressas( IdPessoa, UltNumNota,FCds.Data );
        If Not Result Then
           MessageInfo := Connection.AppServer.MessageInfo;
     End
  Else
     Begin
        Try
           StartTransaction;

           FCds.First;
           While Not FCds.Eof Do
              Begin
                 IF FCds.FieldByName('FLGIMPRESSO').AsString = 'S' Then
                    Begin
                       SQL := ' UPDATE NFRECEBDEVOL SET '+
                              ' NUMNF = '+ FCds.FieldByName('NUMNF').AsString +
                              ',FLGIMPRESSO = '+QuotedStr(FCds.FieldByName('FLGIMPRESSO').AsString)+
                              ' WHERE  IDNFRECEBDEVOL =  '+ FCds.FieldByName('IDNFRECEBDEVOL').AsString;

                       If Not ExecSQL(SQL,True) Then
                          Raise Exception.Create( MessageInfo );
                    End;
                 FCds.Next;
              End;
          //-------------------------------------------------------------------------------------------------------
          // Atuali a última nota impressa (como última nota usada no bolco)
          //-------------------------------------------------------------------------------------------------------
          SQL := ' UPDATE PARALMOX SET NUMNOTANFDEVOL = '+FloatToStr(UltNumNota)+
                 ' WHERE (IDPESSOA = '+FloatToStr(idPessoa)+')';

          If Not ExecSQL(SQL,True) Then
             Raise Exception.Create( MessageInfo );

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

constructor TCtrlConfigNFDevol.Create;
begin
  inherited;
  _DbTemplNFDevol  := TDbTemplNFDevol.Create(Self);
  _DbConfigNFDevol := TDbConfigNFDevol.Create(Self);
end;

destructor TCtrlConfigNFDevol.Destroy;
begin
  If IsAppServer Then
     FreeCds([FCds,FCdsDet]);

  _DbTemplNFDevol.Free;
  _DbConfigNFDevol.Free;

  inherited;
end;

procedure TCtrlConfigNFDevol.DoChangeDataBase;
begin
  inherited;
   _DbTemplNFDevol.DataBaseName  := DataBaseName;
   _DbConfigNFDevol.DataBaseName := DataBaseName;
end;

function TCtrlConfigNFDevol.Excluir: Boolean;
begin
   If ConnectionSide = cnsClient Then
      Begin
         Result := Connection.AppServer.ExcluirConfigNFDevol(Fcds.Data,FCdsDet.Data );
         If Not Result Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         Try
            StartTransaction;

            FCdsDet.First;
            While Not FCdsDet.Eof Do
               FCdsDet.Delete;

            Result := ApplyCds(FCdsDet,_DbConfigNFDevol,[],[] );
            If Not Result Then
            Raise  Exception.Create( _DbConfigNFDevol.MessageInfo );

            Result := ApplyCds(FCds,_DbTemplNFDevol,[],[] );
            If Not Result Then
            Raise  Exception.Create( _DbTemplNFDevol.MessageInfo );


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

function TCtrlConfigNFDevol.GetItensModelo(
  IdTemplNFDevol: Double): OleVariant;
Var
   SQL : String;
begin
   SQl := 'SELECT IDCONFIGNFDEVOL,IDTEMPLNFDEVOL, IDCAMPONFDEVOL, LINHA, '+
          '        COLUNA, TAMANHO,FLGALINHAMENTO, '+
          '       (''                                                            '') AS DESCCAMPO '+
          ' FROM  CONFIGNFDEVOL '+
          ' WHERE (IDTEMPLNFDEVOL = '+FloatToStr(IdTemplNFDevol)+') '+
          ' ORDER BY IDCAMPONFDEVOL';

   Result := GetDataPacket( SQL );       
end;

function TCtrlConfigNFDevol.GetModelo(IdTemplNFDevol: Double): OleVariant;
begin
    _DbTemplNFDevol.IdTemplNFDevol.AsFloat := IdTemplNFDevol;

    Result := GetDataPacket( _DbTemplNFDevol.SSqlSelect );
end;

function TCtrlConfigNFDevol.Gravar: Boolean;
begin
   If ConnectionSide = cnsClient Then
      Begin
         Result := Connection.AppServer.GravarConfigNFDevol(Fcds.Data,FCdsDet.Data );
         If Not Result Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         Try
            StartTransaction;

            Result := ApplyCds(FCds,_DbTemplNFDevol,[],[] );
            If Not Result Then
            Raise  Exception.Create( _DbTemplNFDevol.MessageInfo );

            Result := ApplyCds(FCdsDet,_DbConfigNFDevol,[_DbTemplNFDevol.IdTemplNFDevol],[_DbConfigNFDevol.IdTemplNFDevol] );
            If Not Result Then
            Raise  Exception.Create( _DbConfigNFDevol.MessageInfo );

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

procedure TCtrlConfigNFDevol.OnCreateAppServer;
begin
  inherited;
  FCds    := TClientDataSet.Create(nil);
  FCdsDet := TClientDataSet.Create(nil);
end;

procedure TCtrlConfigNFDevol.SetCds(const Value: TClientDataSet);
begin
  FCds := Value;
end;

procedure TCtrlConfigNFDevol.SetCdsDet(const Value: TClientDataSet);
begin
  FCdsDet := Value;
end;

end.
