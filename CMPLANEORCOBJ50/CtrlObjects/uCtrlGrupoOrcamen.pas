unit uCtrlGrupoOrcamen;

{
-------------------------------------------------------------------------------------------------------
 Nº SOL......: 172385/10082
 Nº KINTANA..: 1690505
 Data........: 01/08/2012
 Responsável.: Vander Campos
 Descrição...: EF - RN010 - Validação do Centro de Responsabilidade do usuário com o Grupo Orçamentário
--------------------------------------------------------------------------------------------------------
 Nº SOL......: 172384/9603
 Nº KINTANA..: 1661662
 Data........: 25/06/2012
 Responsável.: Vander Campos
 Descrição...: Criação da Unit
-------------------------------------------------------------------------------------------------------
}

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbTipordxccxconta, DB, uDataBase,
     uCtrlPadroes,
     DbClient, Wwquery, Provider,uString;

type
  // INICIO - VANDER   - SOL 172385/10082 - Kintana - 1690505
  EGrupoOrcamen        = Class(Exception);
  EGrupoOrcamen_Acesso = Class(EGrupoOrcamen)
  Public
    Constructor Create;Overload;
  End;
  // FIM    - VANDER   - SOL 172385/10082 - Kintana - 1690505

  TCtrlGrupoOrcamen = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; override;
  private
  Public
    Constructor Create(APadroes : TCtrlPadroes);Overload;

    Function ListGrupos(IdGrupoOrcamen : Double = 0): OleVariant;

    // VANDER - SOL 172385/10082 - Kintana - 1690505
    // Exception -> EGrupoOrcamen_Acesso
    Class Procedure ValidaAcesso(APadroes : TCtrlPadroes; ACodUsuario : Integer; AIDGrupoOrcamen : Integer);
  End;

implementation

{ TCtrlGrupoOrcamen }

constructor TCtrlGrupoOrcamen.Create(APadroes : TCtrlPadroes);
begin
  inherited Create;
  Self.InitializeAs(APadroes);
end;

procedure TCtrlGrupoOrcamen.DoChangeDataBase;
begin
  inherited;
end;

function TCtrlGrupoOrcamen.ListGrupos(IdGrupoOrcamen: Double): OleVariant;
Var
  sSQL : String;
begin

  sSQL := ' SELECT'
        + '   G.IDGRUPOORCAMEN,'
        + '   G.NOMEGRUPOORCAMEN,'
        + '   G.CODGRUPOORC,'
        + '   G.FLGANALSINT,'
        + '   G.FLGSINALGRUPO,'
        + '   G.FLGRESULTADO,'
        + '   G.IDPLANOORCAMEN,'
        + '   G.IDFORMORCADO'
        + ' FROM GRUPOORCAMEN G ';

  if IdGrupoOrcamen > 0 Then
     sSQL := sSQL + ' WHERE G.IDGRUPOORCAMEN = ' + FloatToStr(IdGrupoOrcamen);

  Result := GetDataPacket(sSQL);
end;

Class procedure TCtrlGrupoOrcamen.ValidaAcesso(APadroes : TCtrlPadroes; ACodUsuario, AIDGrupoOrcamen: Integer);
Var
  Grupo : TCtrlGrupoOrcamen;
  _CDS  : TClientDataSet;
  sSQl  : String;
begin
  Grupo := TCtrlGrupoOrcamen.Create(APadroes);
  _CDS  := TClientDataSet.Create(Nil);
  Try
    sSQL := 'Select UXA.IDPESSOAACESSO'
          + ' From'
          + '   PESSOAXCRESP UXA,'
          + '   (Select G.IDGRUPOORCAMEN, CO.CodCentroRespon, CO.Idpessoa'
          + '      From GRUPOORCAMEN G, CONTASORCAMEN CO'
          + '     Where G.IDGRUPOORCAMEN  = ' + IntToStr(AIDGrupoOrcamen)
          + '       And CO.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN'
          + '     Group By G.IDGRUPOORCAMEN, CO.CodCentroRespon, CO.Idpessoa) CT'
          + ' where UXA.Codcentrorespon = CT.codcentrorespon'
          + '   and UXA.IDPESSOAACESSO  = ' + IntToStr(ACodUsuario);

    //_CDS.Data := Grupo.GetDataPacket( ssQL );
    Grupo.GetDataPacket(_Cds, ssQL );

    //
    if _CDS.IsEmpty then
       Raise EGrupoOrcamen_Acesso.Create;
    //
  Finally
    FreeAndNil(Grupo);
    FreeAndNil(_CDS);
  End;
end;

{ EGrupoOrcamen_Acesso }

constructor EGrupoOrcamen_Acesso.Create;
begin
  // EF - SOL 172385/10082 - Nº KINTANA..: 1690505 - MSG007
  inherited Create('O usuário não tem permissão de inserção ou alteração de Grupo Orçamentário que esteja vinculado a outros Centros de Responsabilidade!');
end;

end.

