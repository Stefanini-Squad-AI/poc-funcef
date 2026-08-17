//MARCUS OLIVEIRA P. 24024 3/01/07

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 19/02/2002                             }
{                                                       }
{*******************************************************}

unit uDb_Docpessoa;

interface

Uses uCmCustomCdbObject, SysUtils, uCmDbObject, DB;

Type
  TDb_Docpessoa = class(TCmDbObject)

  private
    FDataemissao: TCmDbField;
    FNumdocumento: TCmDbField;
    FIdpais: TCmDbField;
    FIdestado: TCmDbField;
    FIddocumento: TCmDbField;
    FOrgao: TCmDbField;
    FDatavalidade: TCmDbField;
    FIdpessoa: TCmDbField;
    FUf: TCmDbField;
    FIdimagem: TCmDbField;
    procedure SetDataemissao(const Value: TCmDbField);
    procedure SetDatavalidade(const Value: TCmDbField);
    procedure SetIddocumento(const Value: TCmDbField);
    procedure SetIdestado(const Value: TCmDbField);
    procedure SetIdimagem(const Value: TCmDbField);
    procedure SetIdpais(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetNumdocumento(const Value: TCmDbField);
    procedure SetOrgao(const Value: TCmDbField);
    procedure SetUf(const Value: TCmDbField);

  public

     Property Uf: TCmDbField read FUf write SetUf;
     Property Orgao: TCmDbField read FOrgao write SetOrgao;
     Property Numdocumento: TCmDbField read FNumdocumento write SetNumdocumento;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idpais: TCmDbField read FIdpais write SetIdpais;
     Property Idimagem: TCmDbField read FIdimagem write SetIdimagem;
     Property Idestado: TCmDbField read FIdestado write SetIdestado;
     Property Iddocumento: TCmDbField read FIddocumento write SetIddocumento;
     Property Datavalidade: TCmDbField read FDatavalidade write SetDatavalidade;
     Property Dataemissao: TCmDbField read FDataemissao write SetDataemissao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;

     function GetSelectForPessoa(rIdPessoa: Double; sTipoPessoa: String): String;
     function GetSelectTipoDoc(sTipoPessoa: String): String;
  End;

implementation

{ TDb_Docpessoa }

Uses uCmControlObject;

constructor TDb_Docpessoa.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'DOCPESSOA';

  fUf := CreateCmDbField('UF',ftString,False,False,False,True,'Sigla do Estado');
  fOrgao := CreateCmDbField('ORGAO',ftString,False,False,False,True,'Orgão Emissor');
  fNumdocumento := CreateCmDbField('NUMDOCUMENTO',ftString,false,False,False,True,'Número do Documento');
  fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'Pessoa');
  fIdpais := CreateCmDbField('IDPAIS',ftfloat,False,False,False,True,'País');
  fIdimagem := CreateCmDbField('IDIMAGEM',ftfloat,False,False,False,True,'Imagem');
  fIdestado := CreateCmDbField('IDESTADO',ftfloat,False,False,False,True,'Estado');
  fIddocumento := CreateCmDbField('IDDOCUMENTO',ftfloat,True,True,False,True,'Documento');
  fDatavalidade := CreateCmDbField('DATAVALIDADE',ftDateTime,False,False,False,True,'Data de Validade');
  fDataemissao := CreateCmDbField('DATAEMISSAO',ftDateTime,False,False,False,True,'Data de Emissão');
end;

function TDb_Docpessoa.GetSelectForPessoa(rIdPessoa: Double;
  sTipoPessoa: String): String;
begin
  Result := ' SELECT ' +
            '  TIPODOCPESSOA.IDDOCUMENTO, ' +
            '  TIPODOCPESSOA.NOMEDOCUMENTO , ' +
            '  TIPODOCPESSOA.MASCARA, ' +
            '  TIPODOCPESSOA.OBRIGAUF , ' +
            '  TIPODOCPESSOA.OBRIGAORGAO , ' +
            '  TIPODOCPESSOA.OBRIGAEMISSAO , ' +
            '  DOCPESSOA.IDPESSOA, ' +
            '  DOCPESSOA.IDIMAGEM , ' +
            '  DOCPESSOA.IDPAIS , ' +
            '  DOCPESSOA.IDESTADO , ' +
            '  DOCPESSOA.NUMDOCUMENTO, ' +
            '  DOCPESSOA.ORGAO , ' +
            '  DOCPESSOA.DATAEMISSAO, ' +
            '  TIPODOCPESSOA.FLGOBRIGAVALIDADE, ' +
            '  DOCPESSOA.DATAVALIDADE ' +
            ' FROM DOCPESSOA, TIPODOCPESSOA ' +
            ' WHERE ' +
            '   ( DOCPESSOA.IDPESSOA = ' + FloatToStr(rIdPessoa) + ' ) AND ' +
            '   (( TIPODOCPESSOA.FISICAJURIDICA = ' + QuotedStr(sTipoPessoa) + ') OR ' +
            '    ( TIPODOCPESSOA.FISICAJURIDICA = ''A'')) AND ' +
            '   ( TIPODOCPESSOA.IDDOCUMENTO = DOCPESSOA.IDDOCUMENTO)';
end;

function TDb_Docpessoa.GetSelectTipoDoc(sTipoPessoa: String): String;
begin
  Result := ' SELECT TIPODOCPESSOA.IDDOCUMENTO , ' +
            '  TIPODOCPESSOA.NOMEDOCUMENTO , ' +
            '  TIPODOCPESSOA.IDREGRA , ' +
            '  TIPODOCPESSOA.FISICAJURIDICA , ' +
            '  TIPODOCPESSOA.MASCARA , ' +
            '  TIPODOCPESSOA.DOCCHAVE , ' +
            '  TIPODOCPESSOA.OBRIGAUF , ' +
            '  TIPODOCPESSOA.OBRIGAORGAO , ' +
            '  TIPODOCPESSOA.OBRIGAEMISSAO, ' +
            '  TIPODOCPESSOA.FLGOBRIGAVALIDADE ' +
            ' FROM ' +
            '  TIPODOCPESSOA ' +
            ' WHERE ' +
            '   (( TIPODOCPESSOA.FISICAJURIDICA = ' + QuotedStr(sTipoPessoa) + ') OR' +
            //MARCUS OLIVEIRA P. 24024 3/01/07
            '   ( TIPODOCPESSOA.FISICAJURIDICA = ''A''))  ' ;
end;

function TDb_Docpessoa.Insert: Boolean;
  Function ExisteDocPessoa: Boolean;
  Begin
     _CdsSelect.Data := TCmControlObject(Owner).GetDataPacket('SELECT IDDOCUMENTO, IDPESSOA FROM DOCPESSOA WHERE IDDOCUMENTO = ' +
                                                              FIddocumento.AsString +
                                                              ' AND IDPESSOA = ' +
                                                              FIdpessoa.AsString);
     Result := Not _CdsSelect.IsEmpty;

     _CdsSelect.Close;
  End;
begin
   SetDbSessionName;
   
   If (Trim(Numdocumento.AsString) <> '') And
      (Not ExisteDocPessoa) Then
      Result := Inherited Insert
   Else
      Result := True;
end;

function TDb_Docpessoa.LoadFromDB: Boolean;
begin                                                              
   Result := Inherited LoadFromDB;
end;

procedure TDb_Docpessoa.SetDataemissao(const Value: TCmDbField);
begin
  FDataemissao := Value;
end;

procedure TDb_Docpessoa.SetDatavalidade(const Value: TCmDbField);
begin
  FDatavalidade := Value;
end;

procedure TDb_Docpessoa.SetIddocumento(const Value: TCmDbField);
begin
  FIddocumento := Value;
end;

procedure TDb_Docpessoa.SetIdestado(const Value: TCmDbField);
begin
  FIdestado := Value;
end;

procedure TDb_Docpessoa.SetIdimagem(const Value: TCmDbField);
begin
  FIdimagem := Value;
end;

procedure TDb_Docpessoa.SetIdpais(const Value: TCmDbField);
begin
  FIdpais := Value;
end;

procedure TDb_Docpessoa.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDb_Docpessoa.SetNumdocumento(const Value: TCmDbField);
begin
  FNumdocumento := Value;
end;

procedure TDb_Docpessoa.SetOrgao(const Value: TCmDbField);
begin
  FOrgao := Value;
end;

procedure TDb_Docpessoa.SetUf(const Value: TCmDbField);
begin
  FUf := Value;
end;

end.



