unit uCtrlTerceirosCapCar;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase,
DbClient, Wwquery, Provider;

type

  TCtrlTerceirosCapCar = class(TCmControlObject)
  Protected
     procedure DoChangeDataBase; Override;
  Public
    constructor Create;  Override;
    Destructor  Destroy; Override;
    Function ListNatureza (idpessoa : double = 0; recpag : string = '') : OleVariant;
    Function ListTipoAvaliacao : OleVariant;
    Function ListTratfisc : OleVariant;
    Function ListEmpresa (idpessoa : double = 0; recpag : string = '') : Olevariant;
    Function ListBanco : OleVariant;
    Function ListAgencia(IdBanco : Integer=0) : OleVariant;
End;

implementation

{ TCtrlTipofatxclasfis }

constructor TCtrlTerceirosCapCar.Create;
begin
  inherited;
end;

destructor TCtrlTerceirosCapCar.Destroy;
begin
  inherited;
end;

procedure TCtrlTerceirosCapCar.DoChangeDataBase;
begin
  inherited;
end;

function TCtrlTerceirosCapCar.ListAgencia(IdBanco : Integer): OleVariant;
var sSql : String;
begin
  sSql := 'SELECT P.NOME,A.IDPESSOA, A.NUMAGENCIA FROM PESSOA P, '+
          'AGENCIABANCARIA A WHERE P.IDPESSOA = A.IDPESSOA AND     '+
          '(FLGATIVO = ''S'' OR FLGATIVO IS NULL)                ';
  if IDBANCO  <> 0 then
     sSql := sSql +  '   and a.idbanco = ' + IntToStr(IdBanco);
  sSql := sSql + ' ORDER BY P.NOME                                       ';
  Result := GetDataPacket(ssql);
end;

function TCtrlTerceirosCapCar.ListBanco: OleVariant;
var ssql : string;
begin
  sSql := 'SELECT                                                             ' +
          '  BANCO.IDPESSOA,BANCO.NUMBANCO , PESSOA.RAZAOSOCIAL, PESSOA.NOME, ' +
          '  BANCO.MASCARACC, BANCO.MASCARAAGENCIA, BANCO.FLGVALIDACC         ' +
          'FROM                                                               ' +
          '  PESSOA,                                                          ' +
          '  BANCO                                                            ' +
          'WHERE                                                              ' +
          '   PESSOA.IDPESSOA = BANCO.IDPESSOA                                ' +
          'ORDER BY                                                           ' +
          '   PESSOA.RAZAOSOCIAL                                              ' ;
Result := GetDataPacket(ssql);
end;

function TCtrlTerceirosCapCar.ListEmpresa(idpessoa: double;
  recpag: string): Olevariant;
var ssql : string;
begin
ssql := 'SELECT E.NOMEEMPRESA, E.IDPESSOA, P.MASCARADESEMB, PC.PLANO ' +
                    ' FROM EMPRESAPROP E, PARAMCAP P, PARAMCONTAB PC '+
                    'WHERE (E.IDPESSOA <> ' + FloatToStr(Idpessoa) + ') AND ' +
                          '(P.RECPAG = ''' + RecPag + ''') AND' +
                          '(E.IDPESSOA = PC.IDPESSOA(+)) AND ' +
                          '(E.IDPESSOA = P.IDPESSOA(+)) ' +
                    ' ORDER BY E.NOMEEMPRESA';
Result := GetDataPacket(ssql);
end;

function TCtrlTerceirosCapCar.ListNatureza(idpessoa: double;
  recpag : string): OleVariant;
var ssql : string;
begin
ssql := 'SELECT                      '+
        '  CODNATUREZA,              '+
        '    DESCRICAO               '+
        '  FROM                      '+
        '    NATURENDIMENTO          '+
        '  WHERE                     '+
        '    RECPAG = '+quotedstr(recpag)+' AND   '+
        '    IDPESSOA = ' + floattostr(idpessoa)+
        '  ORDER BY DESCRICAO        ';
Result := GetDataPacket(ssql);
end;

function TCtrlTerceirosCapCar.ListTipoAvaliacao: OleVariant;
begin
Result := GetDataPacket('SELECT IDTIPOAVALIACAO, DESCTIPOAVALIACAO '+
                        ' FROM '+
                        '    TIPOAVALIACAO '+
                        ' ORDER BY DESCTIPOAVALIACAO');
end;

function TCtrlTerceirosCapCar.ListTratfisc: OleVariant;
var ssql : string;
begin
ssql := 'SELECT CODTRATFISC,DESCTRATFISC '+
        ' FROM  TRATFISC '+
        ' WHERE '+
        '   CODTRATFISC IN (''8'',''9'',''A'',''B'') '+
        '  ORDER BY  DESCTRATFISC ';
Result := GetDataPacket(ssql);
end;


end.


