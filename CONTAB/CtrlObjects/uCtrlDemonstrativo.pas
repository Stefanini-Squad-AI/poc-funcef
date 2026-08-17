unit uCtrlDemonstrativo;

interface

Uses DB, uDataBase, uCmControlObject, dbclient, sysutils,
     uDbDemonstrativo, Provider, uCMTypes, uCMSqlParams;


Type
  { toeDemeElem      => Ordenados Demonstrativo e Elemento
    toeElem   => Ordenados Somente pelo elemento
  }
  TTipoOrdenaElem  = (toeDemeElem, toeElem);

  TCtrlDemonstrativo = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;

  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _dbDemonstrativo  : TDbDemonstrativo;

    //-------------------------------------------------------------------------
    // Componentes de uso interno
    //-------------------------------------------------------------------------
    FCdsDemonstrativo    : TClientDataSet;

    procedure SetCdsDemonstrativo(const Value: TClientDataSet);

  public
      property CdsDemonstrativo :TClientDataSet    read FCdsDemonstrativo write SetCdsDemonstrativo;
      Constructor Create; Override;
      Destructor  Destroy;Override;

      {Esta função tem como objetivo retornar os demonstrativos cadastrados}
      //Function SelecionaDemonstrativo(IdEmpresa, IdDemonstrativo: Double) : Boolean;

      {Esta função tem como objetivo retornar os Elementos do cadastrados}
      Function SelecionaElemDemonst(IdEmpresa, IdDemonstrativo, IdElemDemonstrat : Double; sTipoElem : String; TipoOrdenaElem :TTipoOrdenaElem) : OleVariant;

      {Esta função tem como objetivo retornar registro(s) da tabela Demonstrativo}
      function ListDemonstrativo(iIdEmpresa, iIdDemonstrativo: Double;bOrdena:Boolean=False) :OleVariant;

      {Esta função tem como objetivo gravar as alteracoesna tabela Demonstrativo}
      function Gravar :Boolean;

  end;

implementation

function TCtrlDemonstrativo.Gravar :Boolean;
var
   Msg  : String;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.GravarDemonstrativo(FcdsDemonstrativo.Data);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End Else
   Begin
     Try
         StartTransaction;

         //grava contas
         Result := ApplyCds(FcdsDemonstrativo,_dbDemonstrativo,[],[] );
         Msg    := _dbDemonstrativo.MessageInfo;
         If Not Result Then Raise Exception.Create(Msg);

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


function TCtrlDemonstrativo.ListDemonstrativo(iIdEmpresa, iIdDemonstrativo: Double;bOrdena:Boolean=False) :OleVariant;
var
  sSql, sFiltro, sOrdena :string;

begin
      sSql := 'SELECT                            ' +
              '    IDDEMONSTRATIVO,              ' +
              '    DEMDESCDEMONSTRAT,            ' +
              '    IDPESSOA,                     ' +
              '    DEMNATUREZA,                  ' +
              '    DEMTIPO,                      ' +
              '    DEMSEQUENCIA,                 ' +
              '    DEMTITULOCOMPL,               ' +
              '    FLGTRACOACIMA,                ' +
              '    FLGTRACOABAIXO,               ' +
              '    DEMTITULOCOMPL2               ' +
              'FROM  DEMONSTRATIVO               ';

      sFiltro := 'WHERE IDDEMONSTRATIVO > 0 ';

      If (iIdEmpresa <> 0) Then
         sFiltro :=  sFiltro + ' AND (IDPESSOA = '+FloatToStr(iIdEmpresa)+ ') ';


      if iIdDemonstrativo <> 0 then
         If sFiltro = '' Then
            sFiltro := sFiltro + ' AND  (IDDEMONSTRATIVO = '+FloatToStr(iIdDemonstrativo)+') '
         else
            sFiltro := sFiltro +  'AND (IDDEMONSTRATIVO = '+FloatToStr(iIdDemonstrativo)+') ';

      sOrdena :=  'ORDER BY DEMDESCDEMONSTRAT      ';

      If bOrdena Then
         sSql := sSql + sFiltro + sOrdena
      Else
         sSql := sSql + sFiltro;

      Result := GetDataPacket(sSql);
end;

procedure TCtrlDemonstrativo.OnCreateAppServer;
begin
  inherited;
  FCdsDemonstrativo := TClientDataSet.Create(nil);

end;

constructor TCtrlDemonstrativo.Create;
begin
  inherited;
  _dbDemonstrativo     := TDbDemonstrativo.Create(Self);

end;

destructor TCtrlDemonstrativo.Destroy;
begin
  inherited;
  _DbDemonstrativo.Free;
  if isAppServer Then FCdsDemonstrativo.Free;

end;

procedure TCtrlDemonstrativo.DoChangeDataBase;
begin
  inherited;
  _dbDemonstrativo.DataBaseName  := DataBaseName;
end;

procedure TCtrlDemonstrativo.SetCdsDemonstrativo(const Value: TClientDataSet);
begin
  FCdsDemonstrativo := Value;
end;


function TCtrlDemonstrativo.SelecionaElemDemonst(IdEmpresa,
  IdDemonstrativo, IdElemDemonstrat: Double; sTipoElem : String;
  TipoOrdenaElem :TTipoOrdenaElem): OleVariant;
begin
    Result := True;
    With TCMSqlParams.Create(nil) Do
      Try
          ControlObject := Self;
          SQL.Clear;
          ControlObject := Self;
          SQL.Add('SELECT D.IDDEMONSTRATIVO, D.DEMDESCDEMONSTRAT, D.IDPESSOA,                   ');
          SQL.Add('       D.DEMNATUREZA, D.DEMTIPO, D.DEMSEQUENCIA, D.DEMTITULOCOMPL,           ');
          SQL.Add('       D.FLGTRACOACIMA, D.FLGTRACOABAIXO, D.DEMTITULOCOMPL2,                 ');
          SQL.Add('       E.IDELEMDEMONSTRAT, E.ELEDESCELEM, E.ELETIPOELEM, E.ELEORDEM,         ');
          SQL.Add('       E.FLGINDENTACAO, E.FLGTIPOLINHA, E.ELEORDEMLINHA, E.IDELEMANAVERTICAL,');
          SQL.Add('       E.FLGTIPONEGATIVO, E.FLGNATUREZA, E.FLGTRACO, E.FLGNEGRITO,           ');
          SQL.Add('       E.FLGMONETARIA, E.FLGSALTAPAGINA, E.FLGDECIMAIS, E.ELECODIGO,         ');
          SQL.Add('       E.IDELEMANAVERT1, E.FLGACUMULADO                                      ');
          SQL.Add('FROM DEMONSTRATIVO D, ELEMDEMONSTRATIVO E                  ');
          SQL.Add('WHERE (D.IDPESSOA = :IDPESSOA)                             ');
          SQL.Add('  AND (D.IDDEMONSTRATIVO = E.IDDEMONSTRATIVO)              ');
          if IdDemonstrativo > 0 then
             SQL.Add('  AND (E.IDDEMONSTRATIVO  = :IDDEMONSTRATIVO)           ');
          if IdElemDemonstrat > 0 then
             SQL.Add('  AND (E.IDELEMDEMONSTRAT = :IDELEMDEMONSTRAT)          ');
          if sTipoElem <> '' then
             SQL.Add('  AND (E.ELETIPOELEM      = :ELETIPOELEM)               ');
          Case TipoOrdenaElem of
             toeDemeElem : SQL.Add('ORDER BY D.DEMDESCDEMONSTRAT, E.ELEDESCELEM');
             toeElem     : SQL.Add('ORDER BY E.ELEDESCELEM');
          end;

          Prepare;
          if sTipoElem <> '' then
             ParamByName('ELETIPOELEM').asString     := sTipoElem;

          if IdElemDemonstrat > 0 then
             ParamByName('IDELEMDEMONSTRAT').asFloat := idElemDemonstrat;

          if IdDemonstrativo > 0 then
             ParamByName('IDDEMONSTRATIVO').asFloat  := idDemonstrativo;

          ParamByName('IDPESSOA').asFloat         := idEmpresa;

          Result := Data;

      Finally
         Free;
      End;
end;

end.

