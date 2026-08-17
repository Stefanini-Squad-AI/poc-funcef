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
{--------------------------------------------------------------------------------------------------
Nº SIG......: 22093
Data........: 22/08/2016
Responsável.: Michelle Suellyn Mota
Descrição...: Criar campo para NIF no Consulta geral de pessoas e na tela elegível participante
Alterações..: Inclusão de campos novos da tabela TipoDocPessoa(GetSelectForPessoa e GetSelectTipoDoc)
--------------------------------------------------------------------------------------------------
Nº SOL......: 250389/17574
Nº PPM..: 992385
Data........: 05/08/2015
Responsável.: Higor Nayde Ferreira
Descrição...: Criação de flg para primeira habilitação e categoria
Alterações DFM: Criação dos checkBoxs primeira habilitação e categoria
--------------------------------------------------------------------------------------------------
Rotina......: GetSelectForPessoa
Nº SOL......: 138283
Nº KINTANA..: 840489
Data........: 30/06/2011
Responsável.: Vinicius Eduardo Nascimento Maciel
Descrição...: Foi acrescido o campo FLGMULTIPLAMASCARA
-------------------------------------------------------------------------------------------------- }

unit uDbDocpessoa;

interface

Uses uCmCustomCdbObject, SysUtils, uCmDbObject, DB;

Type
  TDbDocpessoa = class(TCmDbObject)

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
    //Vinicius Maciel SOL138283 Kintana 840489
    FIdTipodocpessoaxmasc:  TCmDbField;
    //Vinicius Maciel SOL138283 Kintana 840489 - Fim

    FDTPRIMEIRACNH:  TCmDbField;
    FCATEGCNH:  TCmDbField;


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
    //Vinicius Maciel SOL138283 Kintana 840489
    procedure SetIdTipodocpessoaxmasc(const Value: TCmDbField);
    //Vinicius Maciel SOL138283 Kintana 840489 - Fim
    //Higor Nayde Nº SOL250389/17574 NºPPM992385
    procedure SetDTPRIMEIRACNH(const Value: TCmDbField);
    procedure SetCATEGCNH(const Value: TCmDbField);
    //Higor Nayde Nº SOL250389/17574 NºPPM992385
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
     //Vinicius Maciel SOL138283 Kintana 840489
     Property IdTipodocpessoaxmasc: TCmDbField read FIdTipodocpessoaxmasc  write SetIdTipodocpessoaxmasc;
     //Vinicius Maciel SOL138283 Kintana 840489 - Fim

     //Higor Nayde Nº SOL250389/17574 NºPPM992385
     Property DTPRIMEIRACNH: TCmDbField read FDTPRIMEIRACNH  write SetDTPRIMEIRACNH;
     Property CATEGCNH: TCmDbField read FCATEGCNH  write SetCATEGCNH;
     //Higor Nayde Nº SOL250389/17574 NºPPM992385
     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;

     function GetSelectForPessoa(rIdPessoa: Double; sTipoPessoa: String): String;
     function GetSelectTipoDoc(sTipoPessoa: String): String;
  End;

implementation

{ TDbDocpessoa }

Uses uCmControlObject;

constructor TDbDocpessoa.Create(Aowner: TCmCustomCdbObject);
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
  //Vinicius Maciel SOL138283 Kintana 840489
  fIdTipodocpessoaxmasc :=CreateCmDbField('IDTIPODOCPESSOAXMASC',ftfloat,False,False,False,True,'Máscara');
  //Vinicius Maciel SOL138283 Kintana 840489 - Fim
  //Higor Nayde Nº SOL250389/17574 NºPPM992385
  fDTPRIMEIRACNH :=CreateCmDbField('DTPRIMEIRACNH',ftDateTime,False,False,False,True,'Data da primeira Habilitação');
  fCATEGCNH :=CreateCmDbField('CATEGCNH',ftString,False,False,False,True,'Categoria da CNH');
  //Higor Nayde Nº SOL250389/17574 NºPPM992385

end;

function TDbDocpessoa.GetSelectForPessoa(rIdPessoa: Double;
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
//Vinicius Maciel SOL138283 Kintana 840489
            '  TIPODOCPESSOA.FLGMULTIPLAMASCARA, ' +
            '  DOCPESSOA.IDTIPODOCPESSOAXMASC, ' +
//Vinicius Maciel SOL138283 Kintana 840489 - Fim
            '  DOCPESSOA.DATAVALIDADE ' +
    //Higor Nayde Nº SOL250389/17574 NºPPM992385
            '  ,DOCPESSOA.CATEGCNH  ' +
            '  ,DOCPESSOA.DTPRIMEIRACNH  ' +
            '  ,TIPODOCPESSOA.OBRIGAPRMHAB '+
            '  ,TIPODOCPESSOA.OBRIGACATG   '+
    //Higor Nayde Nº SOL250389/17574 NºPPM992385
            // Início - Michelle Mota - SIG 22093
            '  ,TIPODOCPESSOA.EXIBEUF   '+
            '  ,TIPODOCPESSOA.EXIBEORGAO   '+
            '  ,TIPODOCPESSOA.EXIBEEMISSAO   '+
            '  ,TIPODOCPESSOA.EXIBEVALIDADE   '+
            '  ,TIPODOCPESSOA.EXIBEPRMHAB   '+
            '  ,TIPODOCPESSOA.EXIBECATG   '+
            '  ,TIPODOCPESSOA.EXIBEPAIS   '+
            '  ,TIPODOCPESSOA.OBRIGAPAIS   '+
            // Término - Michelle Mota - SIG 22093
            ' FROM DOCPESSOA, TIPODOCPESSOA ' +
            ' WHERE ' +
            '   ( DOCPESSOA.IDPESSOA = ' + FloatToStr(rIdPessoa) + ' ) AND ' +
            '   (( TIPODOCPESSOA.FISICAJURIDICA = ' + QuotedStr(sTipoPessoa) + ') OR ' +
            '    ( TIPODOCPESSOA.FISICAJURIDICA = ''A'')) AND ' +
            '   ( TIPODOCPESSOA.IDDOCUMENTO = DOCPESSOA.IDDOCUMENTO)';
end;

function TDbDocpessoa.GetSelectTipoDoc(sTipoPessoa: String): String;
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
//Vinicius Maciel SOL138283 Kintana 840489
            '  , TIPODOCPESSOA.FLGMULTIPLAMASCARA ' +
//Higor Nayde Nº SOL250389/17574 NºPPM992385
            '  ,TIPODOCPESSOA.OBRIGAPRMHAB '+
            '  ,TIPODOCPESSOA.OBRIGACATG   '+
//Higor Nayde Nº SOL250389/17574 NºPPM992385
            // Início - Michelle Mota - SIG 22093
            '  ,TIPODOCPESSOA.EXIBEUF   '+
            '  ,TIPODOCPESSOA.EXIBEORGAO   '+
            '  ,TIPODOCPESSOA.EXIBEEMISSAO   '+
            '  ,TIPODOCPESSOA.EXIBEVALIDADE   '+
            '  ,TIPODOCPESSOA.EXIBEPRMHAB   '+
            '  ,TIPODOCPESSOA.EXIBECATG   '+
            '  ,TIPODOCPESSOA.EXIBEPAIS   '+
            '  ,TIPODOCPESSOA.OBRIGAPAIS   '+
            // Término - Michelle Mota - SIG 22093
            ' FROM ' +
            '  TIPODOCPESSOA ' +
            ' WHERE ' +
            '   (( TIPODOCPESSOA.FISICAJURIDICA = ' + QuotedStr(sTipoPessoa) + ') OR' +
            '   ( TIPODOCPESSOA.FISICAJURIDICA = ''A''))  ' ;
end;

function TDbDocpessoa.Insert: Boolean;
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

function TDbDocpessoa.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDbDocpessoa.SetDataemissao(const Value: TCmDbField);
begin
  FDataemissao := Value;
end;

procedure TDbDocpessoa.SetDatavalidade(const Value: TCmDbField);
begin
  FDatavalidade := Value;
end;

procedure TDbDocpessoa.SetIddocumento(const Value: TCmDbField);
begin
  FIddocumento := Value;
end;

procedure TDbDocpessoa.SetIdestado(const Value: TCmDbField);
begin
  FIdestado := Value;
end;

procedure TDbDocpessoa.SetIdimagem(const Value: TCmDbField);
begin
  FIdimagem := Value;
end;

procedure TDbDocpessoa.SetIdpais(const Value: TCmDbField);
begin
  FIdpais := Value;
end;

procedure TDbDocpessoa.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbDocpessoa.SetNumdocumento(const Value: TCmDbField);
begin
  FNumdocumento := Value;
end;

procedure TDbDocpessoa.SetOrgao(const Value: TCmDbField);
begin
  FOrgao := Value;
end;

procedure TDbDocpessoa.SetUf(const Value: TCmDbField);
begin
  FUf := Value;
end;

//Vinicius Maciel SOL138283 Kintana 840489
procedure TDbDocpessoa.SetIdTipodocpessoaxmasc(const Value: TCmDbField);
begin
  FIdTipodocpessoaxmasc := Value;
end;
//Vinicius Maciel SOL138283 Kintana 840489 - Fim


procedure TDbDocpessoa.SetCATEGCNH(const Value: TCmDbField);
begin
    FCATEGCNH := Value;      //Higor Nayde Nº SOL250389/17574 NºPPM992385
end;

procedure TDbDocpessoa.SetDTPRIMEIRACNH(const Value: TCmDbField);
begin
    FDTPRIMEIRACNH := Value; //Higor Nayde Nº SOL250389/17574 NºPPM992385
end;

end.



