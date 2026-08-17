unit uCtrlTipoProcesso;

interface

Uses DB, uDataBase, uCmControlObject, dbclient,
     sysutils, uDbRadTipoProcesso, uDbRadTipoEtapaxProc,
     CmEventosCadastro, uMidasUtil,uCMTypes, uCtrlPadroes;

Type
  { upSoPool => Somente as UHs do Pool
    upSoCond => Somente as UHs do Condominio
    upTodas => Todas as UHs
  }
  TCtrlTipoProcesso = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;
      procedure AfterInitialize;Override;
  private
    _DbRadTipoProcesso   : TDbRadTipoProcesso;
    _DbRadTipoEtapaxProc : TDbRadTipoEtapaxProc;
    _Padroes             : TCtrlPadroes;
    FCdsTipoProc: TClientDataSet;
    FCdsEtapaXProc: TClientDataSet;
    procedure SetCdsTipoProc(const Value: TClientDataSet);
    procedure SetCdsEtapaXProc(const Value: TClientDataSet);
  public
      Constructor Create; Override;
      Destructor  Destroy;Override;
      property CdsTipoProc: TClientDataSet read FCdsTipoProc write SetCdsTipoProc;
      property CdsEtapaXProc: TClientDataSet read FCdsEtapaXProc write SetCdsEtapaXProc;
      function Procurar(iIdTipoProcesso: Double): OleVariant;
      function ProcurarEtapaxProcesso(iIdTipoProcesso: Double): OleVariant;
      function AplicaOperacao(Operacao : TOperacao; iEmpresa, iUsuario, iModulo : Double): Boolean;
      Function ListaTipoProcesso(idUsuario : Double): OleVariant;
      Function VerifNome( s : String ) : Boolean;
      // andre tavares - vericica se a referência
      // já está em uso, pois só pode haver uma para cada tipo de processo 1:1
      function ReferenciaEmUso(idreferencia, idtipoprocesso: Integer): boolean;
  end;

implementation


procedure TCtrlTipoProcesso.DoChangeDataBase;
begin
  inherited;
  _DbRadTipoProcesso.DatabaseName := DataBaseName;
  _DbRadTipoEtapaxProc.DatabaseName := DataBaseName;
end;

constructor TCtrlTipoProcesso.Create;
begin
  inherited;
  _DbRadTipoProcesso  := TDbRadTipoProcesso.Create(Self);
  _DbRadTipoEtapaxProc:= TDbRadTipoEtapaxProc.Create(Self);
  _Padroes            := TCtrlPadroes.Create;
end;

destructor TCtrlTipoProcesso.Destroy;
begin
  inherited;
  _DbRadTipoProcesso.Free;
  _DbRadTipoEtapaxProc.Free;
  _Padroes.Free;
  if isAppServer then
     FreeCds([FCdsTipoProc,FCdsEtapaXProc]);
end;

function TCtrlTipoProcesso.ListaTipoProcesso(idUsuario : Double) : OleVariant;
var sSQl : String;
begin
   if idUsuario <> 0 then begin
      sSQl := 'SELECT                                           '+
              '       IDTIPOPROCESSO,                           '+
              '       NOME                                      '+
              'FROM                                             '+
              '      RADTIPOPROCESSO                            '+
              'WHERE                                            '+
              '     ( IDGRPGESTOR  IN ( SELECT IDGRPRESPON      '+
              '                          FROM RADRESPONXGRP     '+
              '                          WHERE (IDUSUARIO = '+FloatToStr(idUsuario)+') ) ) '+
              'UNION                                                        '+
              'SELECT                                                       '+
              '       IDTIPOPROCESSO,                                       '+
              '       NOME                                                  '+
              'FROM                                                         '+
              '      RADTIPOPROCESSO                                        '+
              'WHERE                                                        '+
              '     ( IDGRPCONSULTA  IN ( SELECT                            '+
              '                                AXP.IDGRUPOAUTORIZA          '+
              '                           FROM                              '+
              '                                RADRESPONXGRP GR,            '+
              '                                RADGRAUTXGRRESPON  AXP       '+
              '                           WHERE                             '+
              '                                (GR.IDUSUARIO = '+FloatToStr(idUsuario)+')  '+
              '                            AND (GR.IDGRPRESPON = AXP.IDGRPRESPON)  '+
              '                           GROUP BY AXP.IDGRUPOAUTORIZA) )          '+
              'ORDER BY NOME ';
   end else begin
      sSQl := 'SELECT                 '+
              '     IDTIPOPROCESSO,   '+
              '     NOME,             '+
              '     IDREFERENCIA,     '+
              '     DESCRICAO,        '+
              '     IDGRPGESTOR,      '+
              '     IDGRPCONSULTA,    '+
              '     NUMDIASPREVISTO,  '+
              '     OBSPROC,          '+
              '     IDGRPCRIAPROCESSO,'+
              '     GRAUGRUPPROD,     '+
              '     IDGRUPOPROCESSO,  '+
              '     FLGCENTCUST,      '+
              '     FLGCENTRESPON,    '+
              '     FLGGRUPPROD,      '+
              '     FLGUNIDNEGOC,     '+
              '     FLGVALOR          '+
              'FROM                   '+
              '     RADTIPOPROCESSO   '+
              'ORDER BY NOME          ';
   end;
   Result := GetDataPacket(sSql);
end;

procedure TCtrlTipoProcesso.SetCdsTipoProc(const Value: TClientDataSet);
begin
  FCdsTipoProc := Value;
end;


function TCtrlTipoProcesso.Procurar(iIdTipoProcesso: Double): OleVariant;
begin
  _DbRadTipoProcesso.Idtipoprocesso.AsFloat := iIdTipoProcesso;
  Result := GetDataPacket(_DbRadTipoProcesso.SSqlSelect);
end;

procedure TCtrlTipoProcesso.SetCdsEtapaXProc(const Value: TClientDataSet);
begin
  FCdsEtapaXProc := Value;
end;

function TCtrlTipoProcesso.AplicaOperacao(Operacao: TOperacao; iEmpresa, iUsuario, iModulo : Double): Boolean;
begin
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.AplicaOperacaoTipoProcesso(Integer(Operacao),iEmpresa, iUsuario, iModulo,CdsTipoProc.Data,CdsEtapaXProc.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      MessageInfo := '';
      Try
         StartTransaction;
         if (Operacao = opApagar) then begin
            Result := _Padroes.GravaLogOperacoes(iEmpresa,iModulo,iUsuario,'Exclusão de Tipo de Processo',False);
            if not Result then
               Raise Exception.Create( _Padroes.MessageInfo );
            FCdsEtapaXProc.First;
            while not FCdsEtapaXProc.Eof do
               FCdsEtapaXProc.delete;
            Result := ApplyCDS(FCdsEtapaXProc,_DbRadTipoEtapaxProc,[],[]);
            If Not Result Then Begin
               MessageInfo := _DbRadTipoEtapaxProc.MessageInfo;
               Raise Exception.Create( MessageInfo );
            end;
            Result := ApplyCDS(FCdsTipoProc,_DbRadTipoProcesso,[],[]);
            if not Result then begin
               MessageInfo := _DbRadTipoProcesso.MessageInfo;
               Raise Exception.Create( MessageInfo );
            end;
         end else begin
            if (Operacao = opAlterar) then begin
               Result := _Padroes.GravaLogOperacoes(iEmpresa,iModulo,iUsuario,'Alteração de Tipo de Processo',False);
            end else begin
               Result := _Padroes.GravaLogOperacoes(iEmpresa,iModulo,iUsuario,'Inclusão de Tipo de Processo',False);
            end;
            if not Result then
               Raise Exception.Create( _Padroes.MessageInfo );
            Result := ApplyCDS(FCdsTipoProc,_DbRadTipoProcesso,[],[]);
            if not Result then begin
               MessageInfo := _DbRadTipoProcesso.MessageInfo;
               Raise Exception.Create( MessageInfo );
            end;
            Result := ApplyCDS(FCdsEtapaXProc,_DbRadTipoEtapaxProc,[_DbRadTipoProcesso.IdTipoProcesso],[_DbRadTipoEtapaxProc.IdTipoProcesso],True);
            If Not Result Then Begin
               MessageInfo := _DbRadTipoEtapaxProc.MessageInfo;
               Raise Exception.Create( MessageInfo );
            end;
         end;
         Commit;
      Except
         On E:Exception Do Begin
            Result := False;
            Rollback;
            MessageInfo := E.Message;
         End;
      End;
   End;
end;

function TCtrlTipoProcesso.ProcurarEtapaxProcesso(iIdTipoProcesso: Double): OleVariant;
var sSql : String;
begin
   sSQl := 'SELECT                         '+
           '      EXP.IDTIPOPROCESSO,      '+
           '      EXP.IDTIPOETAPA,         '+
           '      EXP.IDMODULO,            '+
           '      EXP.FLGINICIAL,          '+
           '      EXP.FLGFINAL,            '+
           '      EXP.NUMDIASPREVISTO,     '+
           '      E.NOME AS DESCETAPA,     '+
           '      M.NOMEMODULO             '+
           'FROM                           '+
           '      RADTIPOETAPAXPROC EXP,   '+
           '      MODULO M,                '+
           '      RADTIPOETAPA E           '+
           'WHERE                          '+
           '        (EXP.IDTIPOPROCESSO = '+FloatToStr(iIdTipoProcesso)+')    '+
           '    AND (EXP.IDTIPOETAPA = E.IDTIPOETAPA)  '+
           '    AND (EXP.IDMODULO = M.IDMODULO)        '+
           'ORDER BY DESCETAPA                         ';
   Result := GetDataPacket(sSql);
end;

procedure TCtrlTipoProcesso.OnCreateAppServer;
begin
  inherited;
  FCdsTipoProc   := TClientDataSet.Create(nil);
  FCdsEtapaXProc := TClientDataSet.Create(nil);
end;

function TCtrlTipoProcesso.VerifNome(s: String): Boolean;
begin
  _Cds.Data := GetDataPacket('SELECT NOME FROM RADTIPOPROCESSO WHERE ( UPPER(NOME) = '''+Trim( AnsiUpperCase( S ) )+''')');
  if _Cds.IsEmpty then
     Result := False
  else
     Result := True;
end;

procedure TCtrlTipoProcesso.AfterInitialize;
begin
  inherited;
  _Padroes.InitializeAs(Self);
end;

// início - andre tavares - 06/05/2005
function TCtrlTipoProcesso.ReferenciaEmUso(idreferencia, idtipoprocesso: Integer): boolean;
var cds : TclientDataset;
begin
  result := false;
  cds := TclientDataset.Create(nil);
  try
    cds.data := getDataPacket('SELECT IDREFERENCIA FROM RADTIPOPROCESSO WHERE IDREFERENCIA = ' +
                               intToStr(idreferencia) +  ' AND IDTIPOPROCESSO <> ' + intToStr(idtipoprocesso));
  finally
    result := not cds.IsEmpty;
    cds.free;
  end;
end;
// fim - andre tavares - 06/05/2005

end.



