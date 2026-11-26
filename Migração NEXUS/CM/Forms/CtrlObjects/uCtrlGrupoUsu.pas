//*****************************************************************************
// SISTEMA : Forms CM
//******************************************************************************
// Nº SOL: 253300/17804
// Nº KINTANA/PPM: 1093186
// Data da Alteração: 27.10.2015
// Responsável: Michelle S. Mota
// Descrição: Melhoria na funcionalidade de cadastro de usuários disponível em
// todos os módulos do PLANUS, conforme documentação produzida.
//*********************************************************************************
//  Autor      : Marcus Oliveira
//  Constante  : MSG_USUARIO_SEM_ACESSO
//  Data       : 04/10/2007
//  Descrição  : Corrigido o erro ortográfico da mensagem
//  Pendencia  : 24461
// ----------------------------------------------------------------------------
//  Autor      : Antonio Marcos (amf)
//  Rotina     : CriticaGrupoAtivada
//  Data       : 30.03.2007
//  Descrição  : Verifica o parâmetro que indica que haverá crítica de grupo de acesso.
//  Pendencia  : 24190
// ----------------------------------------------------------------------------
//  Autor      : Antonio Marcos (amf)
//  Rotina     : ProcessaUsuario
//  Data       : 15.03.2007
//  Descrição  : Corrige o erro de duplicidade do IDPESSOA e IDUSUARIO
//  Pendencia  : 24755
// ----------------------------------------------------------------------------
//  Autor      : David
//  Rotina     : ProcessaGrupoUsu
//  Data       : 15.12.2003
//  Descrição  : Os sistemas apresentavam erro ao incluir um participante.
//  Pendencia  : 15806
//---------------------------------------------------------------------------}

unit uCtrlGrupoUsu;

interface

Uses DB, sysUtils, uCmControlObject, uDbdataviewacesso , uDbtabelaacesso,
     uDbcolunaacesso, DbClient, uDbUsuariosistema, uDbGrupoacesso, uDbGrupousu,
     uDbUsuxrelxemp, uDbUsuxmsxemp, uDbAutoriza, uSistema;

Const 
  MSG_USUARIO_SEM_ACESSO = 'O Usuário não está habilitado a receber os itens de autorização atribuídos. '+ #13 +
                           'Verifique a associação de Cargo, Função, Centro de Custo e Grupo de Acesso. ';

Type
  TTipoExclusao = (teUsuario, teGrupo);
  TOperacaoProcessa = (opTabCol, OpVisoes, opUsuario, opGrupo, opSoGrupoUsu, OpSoDireitos);

  TCtrlGrupoUsu = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
    procedure OnApplyCdsRecord(aCds: TClientDataSet; Const sTableName: String; CdsState: TUpdateStatus; Var Accept: Boolean); Override;

  private
    _OperacaoProcessa: TOperacaoProcessa;

    _Dbdataviewacesso: TDbdataviewacesso;
    _Dbtabelaacesso: TDbtabelaacesso;
    _Dbcolunaacesso: TDbcolunaacesso;
    _DbUsuariosistema: TDbUsuariosistema;
    _DbGrupoacesso: TDbGrupoacesso;
    _DbGrupousu: TDbGrupousu;
    _DbUsuxrelxemp: TDbUsuxrelxemp;
    _DbUsuxmsxemp: TDbUsuxmsxemp;
    _DbAutoriza: TDbAutoriza;

    _CdsTabelasAcesso: TClientDataSet;
    _CdsColunasAcesso: TClientDataSet;
    _CdsUsuarioSistema: TClientDataSet;
    _CdsGrupoAcesso: TClientDataSet;
    _CdsGrupoUsu: TClientDataSet;
    _CdsPessoa: TClientDataSet;
    _CdsAutoriza: TClientDataSet;
    _CdsAutorizaRpt: TClientDataSet;
    _CdsAutorizaMs: TClientDataSet;
  Public
    constructor Create;  Override;
    Destructor  Destroy; Override;

    //Exclui o Usuário ou Grupo bem como seus dependentes de autorização de associação
    function ExcluiGrupoUsu(IdEspAcesso, IdGrupoUsu: Integer; TipoExclusao: TTipoExclusao): Boolean;
    function ProcessaGrupoUsu(Const OvDataviewAcesso: OleVariant; Const OvTabelaAcesso: OleVariant;
             Const OvColunaAcesso: OleVariant; Const OvGrupo: OleVariant; Const OvUsuario: OleVariant;
             Const OvPessoa: OleVariant; Const OvGrupoXUsu: OleVariant; Const OvAutoriza : OleVariant;
             Const OvAutorizaRpt: OleVariant; Const OvAutorizaMs: OleVariant; OperacaoProcessa: TOperacaoProcessa): Boolean;

    function CriticaGrupoAtivada: boolean;
  End;

implementation

Uses uCMTypes;

constructor TCtrlGrupoUsu.Create;
begin
  inherited;
  _Dbdataviewacesso := TDbdataviewacesso.Create(Self);
  _Dbtabelaacesso := TDbtabelaacesso.Create(Self);
  _Dbcolunaacesso := TDbcolunaacesso.Create(Self);
  _DbUsuariosistema := TDbUsuariosistema.Create(Self);
  _DbGrupoacesso := TDbGrupoacesso.Create(Self);
  _DbGrupousu := TDbGrupousu.Create(Self);
  _DbUsuxrelxemp := TDbUsuxrelxemp.Create(Self);
  _DbUsuxmsxemp := TDbUsuxmsxemp.Create(Self);
  _DbAutoriza := TDbAutoriza.Create(Self);

  _CdsTabelasAcesso := TClientDataSet.Create(nil);
  _CdsColunasAcesso := TClientDataSet.Create(nil);
  _CdsUsuarioSistema := TClientDataSet.Create(nil);
  _CdsGrupoAcesso := TClientDataSet.Create(nil);
  _CdsGrupoUsu := TClientDataSet.Create(nil);
  _CdsPessoa := TClientDataSet.Create(nil);
  _CdsAutoriza := TClientDataSet.Create(nil);
  _CdsAutorizaRpt := TClientDataSet.Create(nil);
  _CdsAutorizaMs := TClientDataSet.Create(nil);
end;

function TCtrlGrupoUsu.CriticaGrupoAtivada: boolean;
var
  cdsLocal: TClientDataSet;
begin
  try
     cdsLocal := TClientDataSet.Create(nil);
     cdsLocal.Data := GetDataPacket('SELECT CRITICAGRUPO FROM PARAMGLOBAL');
     Result := cdsLocal.FieldByName('CRITICAGRUPO').AsString = '1';
  finally
     FreeAndNil(cdsLocal);
  end;
end;

destructor TCtrlGrupoUsu.Destroy;
begin
  _Dbdataviewacesso.Free;
  _Dbtabelaacesso.Free;
  _Dbcolunaacesso.Free;
  _DbUsuariosistema.Free;
  _DbGrupoacesso.Free;
  _DbGrupousu.Free;
  _DbUsuxrelxemp.Free;
  _DbUsuxmsxemp.Free;
  _DbAutoriza.Free;

  _CdsTabelasAcesso.Free;
  _CdsColunasAcesso.Free;
  _CdsUsuarioSistema.Free;
  _CdsGrupoAcesso.Free;
  _CdsGrupoUsu.Free;
  _CdsPessoa.Free;
  _CdsAutoriza.Free;
  _CdsAutorizaRpt.Free;
  _CdsAutorizaMs.Free;

  inherited;
end;

procedure TCtrlGrupoUsu.DoChangeDataBase;
begin
  inherited;
  _Dbdataviewacesso.DataBaseName := DataBaseName;
  _Dbtabelaacesso.DataBaseName := DataBaseName;
  _Dbcolunaacesso.DataBaseName := DataBaseName;
  _DbUsuariosistema.DataBaseName := DataBaseName;
  _DbGrupoacesso.DataBaseName := DataBaseName;
  _DbGrupousu.DataBaseName := DataBaseName;
  _DbUsuxrelxemp.DataBaseName := DataBaseName;
  _DbUsuxmsxemp.DataBaseName := DataBaseName;
  _DbAutoriza.DataBaseName := DataBaseName;
end;

function TCtrlGrupoUsu.ExcluiGrupoUsu(IdEspAcesso, IdGrupoUsu: Integer;
        TipoExclusao: TTipoExclusao): Boolean;

  procedure ExcluiEspAcesso;
  Begin
     //Apaga autorizações de acesso do usuário independente do módulo ou empresa
     If Not ExecSQL('DELETE FROM AUTORIZA WHERE IDESPACESSO = ' + IntToStr(IdEspAcesso)) Then
        Raise Exception.Create(MessageInfo);

     //Apaga registros da tabela ColunaAcesso
     If Not ExecSQL('DELETE FROM COLUNAACESSO WHERE IDESPACESSO = ' + IntToStr(IdEspAcesso)) Then
        Raise Exception.Create(MessageInfo);

     //Apaga registros da tabela TabelaAcesso
     If Not ExecSQL('DELETE FROM TABELAACESSO WHERE IDESPACESSO = ' + IntToStr(IdEspAcesso)) Then
        Raise Exception.Create(MessageInfo);

     //Apaga registros da tabela DataViewAcesso
     If Not ExecSQL('DELETE FROM DATAVIEWACESSO WHERE IDESPACESSO = ' + IntToStr(IdEspAcesso)) Then
        Raise Exception.Create(MessageInfo);

     //Apaga acesso a tabela de Relatórios
     If Not ExecSQL('DELETE FROM USUXRELXEMP WHERE IDESPACESSO = ' + IntToStr(IdEspAcesso)) Then
        Raise Exception.Create(MessageInfo);

     //Apaga acesso a tabela de Consultas ( MontaSelect )
     If Not ExecSQL('DELETE FROM USUXMSXEMP WHERE IDESPACESSO = ' + IntToStr(IdEspAcesso)) Then
        Raise Exception.Create(MessageInfo);
  End;

  procedure ExcluirUsuario;
  begin
     //Apaga as associações do usuário a grupos de acesso
     If Not ExecSQL('DELETE FROM GRUPOUSU WHERE IDUSUARIO = ' + IntToStr(IdGrupoUsu)) Then
        Raise Exception.Create(MessageInfo);

     //Apaga os históricos de senha do usuário
     If Not ExecSQL('DELETE FROM HISTSENHA WHERE IDUSUARIO = ' + IntToStr(IdGrupoUsu)) Then
        Raise Exception.Create(MessageInfo);

     //Apaga o registro da tabela UsuarioSistema
     If Not ExecSQL('DELETE FROM USUARIOSISTEMA  WHERE IDUSUARIO = ' + IntToStr(IdGrupoUsu)) Then
        Raise Exception.Create(MessageInfo);

     //Dropa o usuário do Banco
     //Incluído teste para não ocorrer erro quando o usuário for único
     if not Sistema.UsuarioUnico then
       If Not ExecSQL('DROP USER CM' + IntToStr(IdGrupoUsu)) Then
          Raise Exception.Create(MessageInfo);
  end;

  procedure ExcluirGrupo;
  begin
     //Apaga as associações grupos de acesso a usuários
     If Not ExecSQL('DELETE FROM GRUPOUSU WHERE IDGRUPO  = ' + IntToStr(IdGrupoUsu)) Then
        Raise Exception.Create(MessageInfo);

     //Apaga Registro da tabela GrupoAcesso
     If Not ExecSQL('DELETE FROM GRUPOACESSO WHERE IDGRUPO = ' + IntToStr(IdGrupoUsu)) Then
        Raise Exception.Create(MessageInfo);
  end;
begin
  If ConnectionSide = CnsClient Then
  Begin
     Result := Connection.AppServer.ExcluiGrupoUsu(IdEspAcesso, IdGrupoUsu, Integer(TipoExclusao));
     If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
     Result := True;
     Try
        StartTransaction;

        ExcluiEspAcesso;

        Case TipoExclusao of
          teUsuario: ExcluirUsuario;
          teGrupo: ExcluirGrupo;
        End;

        Commit;
     Except
        On E:Exception Do
        Begin
           Result := False;
           Rollback;
           MessageInfo := E.Message;
        End;
     End;
  End;
end;

procedure TCtrlGrupoUsu.OnApplyCdsRecord(aCds: TClientDataSet;
  const sTableName: String; CdsState: TUpdateStatus; var Accept: Boolean);
begin
  inherited;
  If (UpperCase(sTableName) = 'TABELAACESSO')  And
     (CdsState = usDeleted) Then
  Begin
     Try
        _CdsColunasAcesso.First;

        _CdsColunasAcesso.Filter := 'TABLE_NAME = ' + QuotedStr(aCds.FieldByName('TABLE_NAME').AsString);
        _CdsColunasAcesso.Filtered := True;

        While Not _CdsColunasAcesso.Eof Do
           _CdsColunasAcesso.Delete
     Finally
        _CdsColunasAcesso.Filter := '';
        _CdsColunasAcesso.Filtered := False;
        _CdsColunasAcesso.First;
     End;

     If Not ExecSql('DELETE FROM COLUNAACESSO WHERE IDESPACESSO = ' + aCds.FieldByName('IDESPACESSO').AsString +
                    ' AND TABLE_NAME = ' + QuotedStr(aCds.FieldByName('TABLE_NAME').AsString)) Then
        Raise Exception.Create(MessageInfo);
  End;

  If (UpperCase(sTableName) = 'USUARIOSISTEMA')  Then
  begin
     _DbUsuariosistema.NomeCompleto := _CdsPessoa.FieldbyName('NOME').AsString;
     _DbUsuariosistema.AlteraPessoa := (_CdsPessoa.FieldbyName('NOME').AsString <> _CdsPessoa.FieldbyName('NOME').OldValue);
     // Início - Michelle Mota - SOL: 253300/17804 - PPM: 1093186
     if not _DbUsuariosistema.AlteraPessoa then
       _DbUsuariosistema.AlteraPessoa := (_CdsUsuarioSistema.FieldbyName('NOMEUSUARIO').AsString <> _CdsUsuarioSistema.FieldbyName('NOMEUSUARIO').OldValue);
     if not _DbUsuariosistema.AlteraPessoa then
       _DbUsuariosistema.AlteraPessoa := (_CdsPessoa.FieldbyName('EMAIL').AsString <> _CdsPessoa.FieldbyName('EMAIL').OldValue);
     if not _DbUsuariosistema.AlteraPessoa then
       _DbUsuariosistema.AlteraPessoa := (_CdsUsuarioSistema.FieldbyName('IDFORCLI').AsString <> _CdsUsuarioSistema.FieldbyName('IDFORCLI').OldValue);
     // Término - Michelle Mota - SOL: 253300/17804 - PPM: 1093186
  end
  else
     _DbUsuariosistema.AlteraPessoa := false;
end;

function TCtrlGrupoUsu.ProcessaGrupoUsu(Const OvDataviewAcesso: OleVariant; Const OvTabelaAcesso: OleVariant;
         Const OvColunaAcesso: OleVariant; Const OvGrupo: OleVariant; Const OvUsuario: OleVariant;
         Const OvPessoa: OleVariant; Const OvGrupoXUsu: OleVariant; Const OvAutoriza : OleVariant;
         Const OvAutorizaRpt: OleVariant; Const OvAutorizaMs: OleVariant; OperacaoProcessa: TOperacaoProcessa): Boolean;
  //
  Procedure AtribuiEspAcesso(aCds: TClientDataSet);
  Begin
     If (aCds.Active) And  (aCds.ChangeCount > 0) Then
     Begin
        aCds.First;
        While Not aCds.Eof Do
        Begin
           If (aCds.FieldByName('IDESPACESSO').AsFloat <= 0) Then
           Begin
              aCds.Edit;

              Case _OperacaoProcessa of
                opUsuario : aCds.FieldByName('IDESPACESSO').AsFloat := _DbUsuariosistema.Idespacesso.AsFloat;
                opGrupo : aCds.FieldByName('IDESPACESSO').AsFloat := _DbGrupoacesso.Idespacesso.AsFloat
              End;

              aCds.Post;
           End;

           aCds.Next;
        End;
        aCds.First;
     End;
  End;
  //
  procedure ValidaDireitosXCargoXCCX;
  Var
     sIdUsuario, sIdModulo, sIdCargo, sIdFuncao, sCodCentroCusto: String;
  begin
     if _OperacaoProcessa in [opUsuario, OpSoDireitos] then
     begin
         //Verifica se existe restrição para o acesso cadastrado em CARGOXGRUPOXCC
         _Cds.Data := GetDataPacket('SELECT COUNT(*) FROM CARGOXGRUPOXCC');
         if _Cds.Fields[0].AsFloat > 0 then
         begin
            {Incluído teste abaixo para que só haja validação se a query estiver aberta.}
            if _CdsAutoriza.IsEmpty then Exit;

            _Cds.Data := GetDataPacket('SELECT IDUSUARIO FROM USUARIOSISTEMA WHERE IDESPACESSO = ' + _CdsAutoriza.FieldByName('IDESPACESSO').AsString);
            if _Cds.IsEmpty then Exit;

            sIDUsuario := _Cds.Fields[0].AsString;

            _Cds.Data := GetDataPacket('SELECT IDMODULO FROM OPERFUNC WHERE IDOPERFUNC = ' + _CdsAutoriza.FieldByName('IDOPERFUNC').AsString);
            if _Cds.IsEmpty then Exit;

            sIdModulo := _Cds.Fields[0].AsString;

             //Verifica se o usuário é um funcionário e busca os dados de cargo, função e centro de custo
            _Cds.Data := GetDataPacket('SELECT CODCENTROCUSTO, IDCARGO, IDFUNCAO FROM FUNCIONARIO WHERE IDPESSOA = ' + sIDUsuario );
            if Not _Cds.IsEmpty then
            begin
               sIdCargo := _Cds.FieldByName('IDCARGO').AsString;
               if _Cds.FieldByName('IDFUNCAO').AsInteger = 0 then
                  sIdFuncao := ' IS NULL '
               Else
                  sIdFuncao := ' = ' + _Cds.FieldByName('IDFUNCAO').AsString;

               sCodCentroCusto := _Cds.FieldByName('CODCENTROCUSTO').AsString;

               //Verifica se pertence a pelo menos um grupo associado em CARGOXGRUPOXCC
               _Cds.Data := GetDataPacket(
               ' SELECT COUNT(*) FROM ' +
               '   AUTORIZA A1, OPERFUNC O ' +
               ' WHERE ' +
               '    A1.IDESPACESSO = ' + _CdsAutoriza.FieldByName('IDESPACESSO').AsString + ' AND ' +
               '    A1.IDOPERFUNC = O.IDOPERFUNC AND ' +
               '    A1.IDPESSOA = ' + _CdsAutoriza.FieldByName('IDPESSOA').AsString + ' AND ' +
               '    O.IDMODULO = ' + sIdModulo + ' AND NOT EXISTS ( ' +
                                          ' SELECT IDESPACESSO, A.IDOPERFUNC, A.IDPESSOA FROM ' +
                                          '   AUTORIZA A, OPERFUNC O ' +
                                          ' WHERE ' +
                                          '    A.IDOPERFUNC = O.IDOPERFUNC AND ' +
                                          '    O.IDMODULO = ' + sIdModulo + ' AND ' +
                                          '    A.IDPESSOA = ' + _CdsAutoriza.FieldByName('IDPESSOA').AsString + ' AND ' +
                                          '    A.IDESPACESSO = A1.IDESPACESSO AND ' +
                                          '    A.IDOPERFUNC = A1.IDOPERFUNC AND ' +
                                          '    A.IDPESSOA = A1.IDPESSOA  AND ' +
                                          '    IDESPACESSO IN ' +
                                                          ' ( ' +
                                                          ' SELECT GAC.IDESPACESSO FROM ' +
                                                          '  GRUPOUSU GU, GRUPOACESSO GAC ' +
                                                          ' WHERE ' +
                                                          '   GU.IDUSUARIO = ' + sIDUsuario + ' AND ' +
                                                          '   GAC.IDGRUPO = GU.IDGRUPO AND ' +
                                                          '   GAC.IDGRUPO IN ' +
                                                          '         ( ' +
                                                          '         SELECT ' +
                                                          '            GA.IDGRUPO ' +
                                                          '         FROM ' +
                                                          '            CARGOXGRUPOXCC CG, ' +
                                                          '            GRUPOACESSO GA ' +
                                                          '         WHERE ' +
                                                          '            CG.IDEMPRESA = ' + _CdsAutoriza.FieldByName('IDPESSOA').AsString + ' AND ' +
                                                          '            CG.CODCENTROCUSTO = ' + sCodCentroCusto + ' AND ' +
                                                          '            CG.IDCARGO = ' + sIdCargo + ' AND ' +
                                                          '            CG.IDFUNCAO ' + sIdFuncao + ' AND ' +
                                                          '            GA.IDESPACESSO = CG.IDESPACESSO ' +
                                                          '         ) ' +
                                                          ' ) ' +
                                          ' ) ');
               if _Cds.Fields[0].AsFloat > 0 then
                  Raise Exception.Create(MSG_USUARIO_SEM_ACESSO);
            end;
         end;

         if _Cds.Active Then _Cds.Close;
     end;
  end;
  //
  Procedure ProcessaDireitos;
  Begin
    If _CdsAutoriza.ACtive Then _CdsAutoriza.Close;
    _CdsAutoriza.Data := OvAutoriza;

    If _CdsAutorizaRpt.ACtive Then _CdsAutorizaRpt.Close;
    _CdsAutorizaRpt.Data := OvAutorizaRpt;

    If _CdsAutorizaMs.ACtive Then _CdsAutorizaMs.Close;
    _CdsAutorizaMs.Data := OvAutorizaMs;

    //
    If _OperacaoProcessa In [ opUsuario, opGrupo ] Then
    Begin
       AtribuiEspAcesso(_CdsAutoriza);
       AtribuiEspAcesso(_CdsAutorizaRpt);
       AtribuiEspAcesso(_CdsAutorizaMs);
    End;
    //

    If (_CdsAutoriza.Active) And (_CdsAutoriza.ChangeCount > 0) And
       (Not ApplyCds(_CdsAutoriza, _DbAutoriza, [], [], True)) Then
       Raise Exception.Create(_DbAutoriza.MessageInfo);

    If (_CdsAutorizaRpt.Active) And (_CdsAutorizaRpt.ChangeCount > 0) And
       (Not ApplyCds(_CdsAutorizaRpt, _DbUsuxrelxemp, [], [], True)) Then
       Raise Exception.Create(_DbUsuxrelxemp.MessageInfo);

    If (_CdsAutorizaMs.Active) And (_CdsAutorizaMs.ChangeCount > 0) And
       (Not ApplyCds(_CdsAutorizaMs, _DbUsuxmsxemp, [], [], True)) Then
       Raise Exception.Create(_DbUsuxmsxemp.MessageInfo);

    ValidaDireitosXCargoXCCX;
  End;
  //
  Procedure ProcessaTabCol;
  Begin
     If _CdsTabelasAcesso.ACtive Then _CdsTabelasAcesso.Close;
     _CdsTabelasAcesso.Data := OvTabelaAcesso;

     If _CdsColunasAcesso.ACtive Then _CdsColunasAcesso.Close;
     _CdsColunasAcesso.Data := OvColunaAcesso;

     If Not ApplyCds(_CdsTabelasAcesso, _Dbtabelaacesso, [], [], True) Then
        Raise Exception.Create(_Dbtabelaacesso.MessageInfo);

     If Not ApplyCds(_CdsColunasAcesso, _Dbcolunaacesso, [], [], True) Then
        Raise Exception.Create(_Dbcolunaacesso.MessageInfo);
  End;
  //
  Procedure ProcessaVisoes;
  Begin
     If _Cds.ACtive Then _Cds.Close;
     _Cds.Data := OvDataviewAcesso;

     If Not ApplyCds(_Cds, _Dbdataviewacesso, [], [], True) Then
        Raise Exception.Create(_Dbdataviewacesso.MessageInfo);
  End;
  //
  Procedure ProcessaGrupoUsuInt;
  Begin
     If _CdsGrupoUsu.ACtive Then _CdsGrupoUsu.Close;
     _CdsGrupoUsu.Data := OvGrupoXUsu;

     If _OperacaoProcessa In [opUsuario, opGrupo] Then
     Begin
        _CdsGrupoUsu.First;
        While Not _CdsGrupoUsu.Eof Do
        Begin
           _CdsGrupoUsu.Edit;

           Case _OperacaoProcessa of
             opUsuario : _CdsGrupoUsu.FieldByName('IDUSUARIO').AsFloat := _DbUsuariosistema.Idusuario.AsFloat;
             opGrupo : _CdsGrupoUsu.FieldByName('IDGRUPO').AsFloat := _DbGrupoacesso.IdGrupo.AsFloat;
           End;

           _CdsGrupoUsu.Post;
           _CdsGrupoUsu.Next;
        End;
     End;

     _CdsGrupoUsu.First;

     If Not ApplyCds(_CdsGrupoUsu, _DbGrupoUsu, [], [], True) Then
        Raise Exception.Create(_DbGrupoUsu.MessageInfo);
  End;
  //
  Procedure ProcessaUsuario;
  Begin
    If _CdsPessoa.ACtive Then _CdsPessoa.Close;
    _CdsPessoa.Data := OvPessoa;

    If _CdsUsuarioSistema.ACtive Then _CdsUsuarioSistema.Close;
    _CdsUsuarioSistema.Data := OvUsuario;

    _DbUsuariosistema.NomeCompleto := _CdsPessoa.FieldbyName('NOME').AsString;

    // Início - Michelle Mota - SOL: 253300/17804 - PPM: 1093186
    _DbUsuariosistema.AlteraPessoa := (((_CdsPessoa.FieldbyName('NOME').AsString <> _CdsPessoa.FieldbyName('NOME').OldValue)) or
                                       ((_CdsPessoa.FieldbyName('EMAIL').AsString <> _CdsPessoa.FieldbyName('EMAIL').OldValue)) or
                                       ((_CdsUsuarioSistema.FieldbyName('NOMEUSUARIO').AsString <> _CdsUsuarioSistema.FieldbyName('NOMEUSUARIO').OldValue)));
    // Término - Michelle Mota - SOL: 253300/17804 - PPM: 1093186

    _DbUsuariosistema.Email := _CdsPessoa.FieldByName('EMAIL').AsString;

    //Usuário Sistema recebe o IDPESSOA da tabela PESSOA.
    _DbUsuarioSistema.IdPessoa := _CdsPessoa.FieldByName('IDPESSOA').AsFloat;

    If Not ApplyCds(_CdsUsuarioSistema, _DbUsuariosistema, [], [], True) Then
       Raise Exception.Create(_DbUsuariosistema.MessageInfo);

    if _DbUsuariosistema.AlteraPessoa then
    begin
       Result := ExecSQL(' UPDATE PESSOA SET NOME = ' + QuotedStr(_DbUsuariosistema.NomeCompleto) +
                         ', RAZAOSOCIAL = ' + QuotedStr(_DbUsuariosistema.NomeCompleto) +
                         ' , EMAIL = ' + QuotedStr(_DbUsuariosistema.Email) +
                         '  WHERE IDPESSOA = ' + _DbUsuariosistema.Idusuario.AsString);

       // Início - Michelle Mota - SOL: 253300/17804 - PPM: 1093186
       Result := ExecSQL(' UPDATE USUARIOSISTEMA SET NOMEUSUARIO = ' + QuotedStr(_CdsUsuarioSistema.FieldbyName('NOMEUSUARIO').AsString) +
                         '  WHERE IDUSUARIO = ' + _DbUsuariosistema.Idusuario.AsString);
       // Término - Michelle Mota - SOL: 253300/17804 - PPM: 1093186
       If Not Result Then
          MessageInfo := 'Erro ao atualizar o nome do usuário';
    end;

    ProcessaGrupoUsuInt;

    ProcessaDireitos;
  End;
  //
  Procedure ProcessaGrupo;
  Begin
    If _CdsGrupoAcesso.ACtive Then _CdsGrupoAcesso.Close;
    _CdsGrupoAcesso.Data := OvGrupo;

    If Not ApplyCds(_CdsGrupoAcesso, _DbGrupoacesso, [], [], True) Then
       Raise Exception.Create(_DbGrupoacesso.MessageInfo);

    ProcessaGrupoUsuInt;

    ProcessaDireitos;
  End;
  //
begin
  If ConnectionSide = CnsClient Then
  Begin
     Result := Connection.AppServer.ProcessaGrupoUsu(OvDataviewAcesso, OvTabelaAcesso,
               OvColunaAcesso, OvGrupo, OvUsuario, OvPessoa, OvGrupoXUsu,
               OvAutoriza, OvAutorizaRpt, OvAutorizaMs, Integer(OperacaoProcessa));
     If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
     _OperacaoProcessa := OperacaoProcessa;

     Result := True;
     Try
        StartTransaction;
                     
        Case OperacaoProcessa of
          opTabCol: ProcessaTabCol;
          OpVisoes: ProcessaVisoes;
          opUsuario: ProcessaUsuario;
          opGrupo: ProcessaGrupo;
          opSoGrupoUsu: ProcessaGrupoUsuInt;
          OpSoDireitos: ProcessaDireitos;
        End;

        Commit;
     Except
        On E:Exception Do
        Begin
           Result := False;
           Rollback;
           MessageInfo := E.Message;
        End;
     End;
  End;
end;

end.

