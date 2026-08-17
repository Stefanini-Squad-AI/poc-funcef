unit uObjMestreDetalhe;

interface

uses
  ActiveX, MtsObj, Mtx, ComObj, MtsMestreDetalhe_TLB, StdVcl;

type
  TObjMestreDetalhe = class(TMtsAutoObject, IObjMestreDetalhe)
  protected
    function ProcessaXml(var sMensagem: WideString; const XmlTbMestre,
      XmlTbDetalhe: WideString; Operacao: Integer;
      const sConnectionString: WideString;
      bControlaTransacao: WordBool): WordBool; safecall;
    function ExcluiMestreDet(var sMensagem: WideString; IdTbMestre: Integer;
      const sConnectionString: WideString;
      bControlaTransacao: WordBool): WordBool; safecall;
    function GetXml(var sMensagem, XmlMestre, XmlDetalhe: WideString;
      IdTbMestre: Integer; const sConnectionString: WideString): WordBool;
      safecall;
    { Protected declarations }
  end;

implementation

uses sysutils, classes, ComServ, uCtrlMestreDetalhe, uCmTypes, AdoDb, uMidasUtil;

function TObjMestreDetalhe.ProcessaXml(var sMensagem: WideString;
  const XmlTbMestre, XmlTbDetalhe: WideString; Operacao: Integer;
  const sConnectionString: WideString;
  bControlaTransacao: WordBool): WordBool;
Var
  (**
    > Devemos ter as nossas controls e conexões no escopo dos métodos para garantir
      que o "ciclo de vida" desses objetos se restrinja a execução do métodos, sem
      no fim liberados
    > Para este exemplo utilizamos apenas uma control
    > O ADOConnection é obrigatório para todos os métodos que criam instâncias de controls
    > As linhas marcadas com o comentário {** Fixa **} no final são obrigatórias independente
      do método implementado
    > Os procedimentos referentes aos outros métodos são idênticos a estes 
  **)
  MestreDetalhe: TCtrlMestreDetalhe;
  AdoConnection: TADOConnection; {** Fixa **}
begin
  AdoConnection := TADOConnection.Create(nil); {** Fixa **}
  MestreDetalhe := TCtrlMestreDetalhe.Create;

  try {** Fixa **}
     AdoConnection.ConnectionString := sConnectionString; {** Fixa **}
     AdoConnection.CursorLocation := clUseServer; {** Fixa **}
     AdoConnection.LoginPrompt := False; {** Fixa **}
     AdoConnection.Open; {** Fixa **}

     {**
       A(s) control(s) utilizada(s) deve(m) ser inicializada(s) com os parâmetros
       para conexão ADO, com o parâmetro de controle de transação e com o ADOConnection
       criado na procedure
     **}
     MestreDetalhe.Initialize(nil, bControlaTransacao, cntAdo, cnsServer, nil, false, nil, AdoConnection, True);

     {**
       O(s) Xml(s) passado(s) como parâmetro(s) deve(m) ser atribuído(s) ao(s)
       clientdataset(s) da control com o método XmlToCds da unit uMidasUtil
     **}
     XmlToCds(XmlTbMestre, MestreDetalhe.CdsMestre);
     XmlToCds(XmlTbDetalhe, MestreDetalhe.CdsDetalhe);

     result := MestreDetalhe.ProcessaMestreDetalhe;

     {**
       Caso ocorra um erro na execução do método deverá ser gerada uma excessão
       com a mensagem da control que gerou a acessão.
     **}
     if not result then raise Exception.Create(MestreDetalhe.MessageInfo);

     MestreDetalhe.Free;
     AdoConnection.Free; {** Fixa **}
  except
     on E:Exception do
     begin
        result := false; {** Fixa **}
        MestreDetalhe.Free;
        AdoConnection.Free; {** Fixa **}
        sMensagem := E.Message; {** Fixa **}
     end;
  end;
end;

function TObjMestreDetalhe.ExcluiMestreDet(var sMensagem: WideString;
  IdTbMestre: Integer; const sConnectionString: WideString;
  bControlaTransacao: WordBool): WordBool;
Var
  MestreDetalhe: TCtrlMestreDetalhe;
  AdoConnection: TADOConnection;
begin
  AdoConnection := TADOConnection.Create(nil);
  MestreDetalhe := TCtrlMestreDetalhe.Create;

  try
     AdoConnection.ConnectionString := sConnectionString;
     AdoConnection.CursorLocation := clUseServer;
     AdoConnection.LoginPrompt := False;
     AdoConnection.Open;

     MestreDetalhe.Initialize(nil, bControlaTransacao, cntAdo, cnsServer, nil, false, nil, AdoConnection, True);

     result := MestreDetalhe.ExcluiCadastro(IdTbMestre);

     if not result then raise Exception.Create(MestreDetalhe.MessageInfo);

     MestreDetalhe.Free;
     AdoConnection.Free;
  except
     on E:Exception do
     begin
        result := false;
        MestreDetalhe.Free;
        AdoConnection.Free;
        sMensagem := E.Message;
     end;
  end;
end;

function TObjMestreDetalhe.GetXml(var sMensagem, XmlMestre,
  XmlDetalhe: WideString; IdTbMestre: Integer;
  const sConnectionString: WideString): WordBool;
Var
  MestreDetalhe: TCtrlMestreDetalhe;
  AdoConnection: TADOConnection;
begin
  AdoConnection := TADOConnection.Create(nil);
  MestreDetalhe := TCtrlMestreDetalhe.Create;

  try
     AdoConnection.ConnectionString := sConnectionString;
     AdoConnection.CursorLocation := clUseServer;
     AdoConnection.LoginPrompt := False;
     AdoConnection.Open;

     MestreDetalhe.Initialize(nil, false, cntAdo, cnsServer, nil, false, nil, AdoConnection, True);

     result := MestreDetalhe.GetXml(IdTbMestre, XmlMestre, XmlDetalhe);

     if not result then raise Exception.Create(MestreDetalhe.MessageInfo);

     MestreDetalhe.Free;
     AdoConnection.Free;
  except
     on E:Exception do
     begin
        result := false;
        MestreDetalhe.Free;
        AdoConnection.Free;
        sMensagem := E.Message;
     end;
  end;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TObjMestreDetalhe, Class_ObjMestreDetalhe,
    ciMultiInstance, tmApartment);
end.



