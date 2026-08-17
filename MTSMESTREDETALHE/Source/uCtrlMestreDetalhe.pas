unit uCtrlMestreDetalhe;

interface

Uses classes, sysUtils, uCmControlObject, uDbTblmestre, uDbTbldetalhe, uCmTypes,
     DbClient;

Type
   TCtrlMestreDetalhe = class(TCmControlObject)
   private
    _DbTblmestre: TDbTblmestre;
    _DbTbldetalhe: TDbTbldetalhe;
    FCdsDetalhe: TClientDataSet;
    FCdsMestre: TClientDataSet;
    procedure SetCdsDetalhe(const Value: TClientDataSet);
    procedure SetCdsMestre(const Value: TClientDataSet);

   protected
    procedure OnCreateAppServer; Override;

   public
    constructor Create; Override;
    Destructor  Destroy; Override;
    function ProcessaMestreDetalhe: Boolean;
    function ExcluiCadastro(IdTbMestre: Integer): Boolean;
    {**
       Método opcional, implementado apenas para retornar em formato Xml os
       SELECT´s efetuados nas tabelas Mestre e Detalhe a partir do
       IdTbMestre passado como parâmetro.
       Na realidade, este proderia ser utilizado para informar a estrutura
       dos Xml´s a serem passados pela aplicação cliente ou para verifiacação
       de um determinado registro no banco. A estrutura pode ser imformada
       pelo desenvolvedor, uma vez que ela é fixa e, a verificação dos
       registros no banco pode ser feita diretamente pela execução de um
       SELECT na aplicação Cliente.
    **}
    function GetXml(IdTbMestre: Integer; Var XmlMestre, XmlDetalhe: WideString): Boolean;

    property CdsMestre: TClientDataSet read FCdsMestre write SetCdsMestre;
    property CdsDetalhe: TClientDataSet read FCdsDetalhe write SetCdsDetalhe;
   end;

implementation

Uses uMidasUtil;

{ TCtrlMestreDetalhe }

constructor TCtrlMestreDetalhe.Create;
begin
  inherited;
  _DbTblmestre := TDbTblmestre.Create(Self);
  _DbTbldetalhe := TDbTbldetalhe.Create(Self);
end;

destructor TCtrlMestreDetalhe.Destroy;
begin
  inherited;
  _DbTblmestre.Free;
  _DbTbldetalhe.Free;

  if fIsAppServer then
  begin
    FCdsDetalhe.Free;
    FCdsMestre.Free;
  end;
end;

function TCtrlMestreDetalhe.ExcluiCadastro(IdTbMestre: Integer): Boolean;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.ExcluiCadastro(IdTbMestre);

     If Not Result Then
       MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
     Result := False;

     Try
        StartTransaction;

        Result := ExecSQL('DELETE FROM TBLDETALHE WHERE IDTBLMESTRE = ' + IntToStr(IdTbMestre), True);
        If Not Result Then raise Exception.Create(MessageInfo);

        Result := ExecSQL('DELETE FROM TBLMESTRE WHERE IDTBLMESTRE = ' + IntToStr(IdTbMestre), True);
        If Not Result Then raise Exception.Create(MessageInfo);

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

function TCtrlMestreDetalhe.GetXml(IdTbMestre: Integer; var XmlMestre,
  XmlDetalhe: WideString): Boolean;
begin
  Try
     _Cds.Data := GetDataPacket('SELECT * FROM TBLMESTRE WHERE IDTBLMESTRE = ' + IntToStr(IdTbMestre));
     {**
       O método CdsToXmlString da uMidasUtil retorna um string em formato XML obtida a
       partir do ClientDataSet passado como parâmetro
     **}
     XmlMestre := CdsToXmlString(_Cds);

     _Cds.Data := GetDataPacket('SELECT * FROM TBLDETALHE WHERE IDTBLMESTRE = ' + IntToStr(IdTbMestre));
     XmlDetalhe := CdsToXmlString(_Cds);

     Result := True;
  Except
     On E:Exception Do
      Begin
         Result := False;
         MessageInfo := E.Message;
      End;
  End;
end;

procedure TCtrlMestreDetalhe.OnCreateAppServer;
begin
    FCdsDetalhe := TClientDataSet.Create(nil);
    FCdsMestre := TClientDataSet.Create(nil);
end;

function TCtrlMestreDetalhe.ProcessaMestreDetalhe: Boolean;
  function ValidaDetalhe: boolean;
  var
    rValorTotalDetalhe: Double;
  begin
    FCdsDetalhe.First;

    rValorTotalDetalhe := 0;
    while not FCdsDetalhe.eof do
    begin
       rValorTotalDetalhe := rValorTotalDetalhe + FCdsDetalhe.FieldByName('VLRDETALHE').AsFloat;
       FCdsDetalhe.Next;
    end;

    FCdsDetalhe.First;

    result := (rValorTotalDetalhe < FCdsMestre.FieldByName('VLRLIMITE').AsFloat);

    if not result then MessageInfo := 'O Valor dos detalhes é superior ao valor limite no mestre';
  end;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.ProcessaMestreDetalhe(fCdsMestre.Data, fCdsDetalhe.Data);

     If Not Result Then
       MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
     Result := False;

     Try
        if ValidaDetalhe then
        begin
           StartTransaction;

           Result := ApplyCds(FCdsMestre, _DbTblmestre,[],[]);
           If Not Result Then raise Exception.Create(_DbTblmestre.MessageInfo);

           Result := ApplyCds(FCdsDetalhe, _DbTbldetalhe,[_DbTblmestre.Idtblmestre],[_DbTbldetalhe.Idtblmestre]);
           If Not Result Then raise Exception.Create(_DbTbldetalhe.MessageInfo);

           Commit;
        end;
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

procedure TCtrlMestreDetalhe.SetCdsDetalhe(const Value: TClientDataSet);
begin
  FCdsDetalhe := Value;
end;

procedure TCtrlMestreDetalhe.SetCdsMestre(const Value: TClientDataSet);
begin
  FCdsMestre := Value;
end;

end.


{
CREATE TABLE TBLMESTRE (IDTBLMESTRE NUMBER, DESCTBLMESTRE VARCHAR2(60), VLRLIMITE NUMBER);
ALTER TABLE TBLMESTRE ADD PRIMARY KEY (IDTBLMESTRE);
CREATE TABLE TBLDETALHE (IDTBLDETALHE NUMBER, IDTBLMESTRE NUMBER, DESCTBLDETALHE VARCHAR2(60), VLRDETALHE NUMBER);
ALTER TABLE TBLDETALHE ADD PRIMARY KEY (IDTBLDETALHE);
ALTER TABLE TBLDETALHE ADD FOREIGN KEY (IDTBLMESTRE) REFERENCES TBLMESTRE;

CREATE SEQUENCE SEQTBLMESTRE NOCACHE START WITH 1
CREATE SEQUENCE SEQTBLDETALHE NOCACHE START WITH 1
}
