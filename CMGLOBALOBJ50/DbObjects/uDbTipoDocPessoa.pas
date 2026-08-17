{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 25/03/2002                             }
{                                                       }
{*******************************************************}
// ATUALIZAÇÕES
{--------------------------------------------------------------------------------------------------
Nº SIG......: 22093
Data........: 03/08/2016
Responsável.: Michelle Suellyn Mota
Descrição...: Criar campo para NIF no Consulta geral de pessoas e na tela elegível participante
Alterações..: Inclusão de campos novos da tabela TipoDocPessoa
--------------------------------------------------------------------------------------------------
Nº SOL......: 250389/17574
Nº PPM..: 992385
Data........: 05/08/2015
Responsável.: Higor Nayde Ferreira
Descrição...: Criação de flg para primeira habilitação e categoria
Alterações DFM: Criação dos checkBoxs primeira habilitação e categoria
--------------------------------------------------------------------------------------------------
Rotina......: FFlgmultiplamascara
Nº SOL......: 138283
Nº KINTANA..: 840489
Data........: 30/06/2011
Responsável.: Vinicius Eduardo Nascimento Maciel
Descrição...: Foi adicionado o campo FFlgmultiplamascara.
-------------------------------------------------------------------------------------------------- }
unit uDbTipoDocPessoa;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbTipoDocPessoa = class(TCmDbObject)
  private
    FFisicajuridica: TCmDbField;
    FFlgobrigavalidade: TCmDbField;
    FObrigauf: TCmDbField;
    FObrigaemissao: TCmDbField;
    FObrigaorgao: TCmDbField;
    FNomedocumento: TCmDbField;
    FDocchave: TCmDbField;
    FMascara: TCmDbField;
    FIddocumento: TCmDbField;
    FIdregra: TCmDbField;
    //Vinicius Maciel SOL138283 Kintana 840489
    FFlgmultiplamascara: TCmDbField;
    //Vinicius Maciel SOL138283 Kintana 840489 - FIM
    //Higor Nayde Nº SOL250389/17574 NºPPM992385
    FOBRIGAPRMHAB: TCmDbField;
    FOBRIGACATG: TCmDbField;
    //Higor Nayde Nº SOL250389/17574 NºPPM992385
    // Início - Michelle Mota - SIG 22093
    FExibeUF: TCmDbField;
    FExibeOrgao: TCmDbField;
    FExibeEmissao: TCmDbField;
    FExibeValidade: TCmDbField;
    FExibePrmHab: TCmDbField;
    FExibeCATG: TCmDbField;
    FExibePais: TCmDbField;
    FObrigaPais: TCmDbField;
    // Término - Michelle Mota - SIG 22093

    procedure SetDocchave(const Value: TCmDbField);
    procedure SetFisicajuridica(const Value: TCmDbField);
    procedure SetFlgobrigavalidade(const Value: TCmDbField);
    procedure SetIddocumento(const Value: TCmDbField);
    procedure SetIdregra(const Value: TCmDbField);
    procedure SetMascara(const Value: TCmDbField);
    procedure SetNomedocumento(const Value: TCmDbField);
    procedure SetObrigaemissao(const Value: TCmDbField);
    procedure SetObrigaorgao(const Value: TCmDbField);
    procedure SetObrigauf(const Value: TCmDbField);
    //Vinicius Maciel SOL138283 Kintana 840489
    procedure SetFlgmultiplamascara(const Value: TCmDbField);
    //Vinicius Maciel SOL138283 Kintana 840489 - FIM

    procedure SetOBRIGAPRMHAB(const Value: TCmDbField);
    procedure SetOBRIGACATG(const Value: TCmDbField);
    // Início - Michelle Mota - SIG 22093
    procedure SetExibeUF(const Value: TCmDbField);
    procedure SetExibeOrgao(const Value: TCmDbField);
    procedure SetExibeEmissao(const Value: TCmDbField);
    procedure SetExibeValidade(const Value: TCmDbField);
    procedure SetExibePrmHab(const Value: TCmDbField);
    procedure SetExibeCATG(const Value: TCmDbField);
    procedure SetExibePais(const Value: TCmDbField);
    procedure SetObrigaPais(const Value: TCmDbField);
    // Término - Michelle Mota - SIG 22093
  public
    Property Obrigauf: TCmDbField read FObrigauf write SetObrigauf;
    //Vinicius Maciel SOL138283 Kintana 840489
    Property Flgmultiplamascara: TCmDbField read FFlgmultiplamascara write SetFlgmultiplamascara;
    //Vinicius Maciel SOL138283 Kintana 840489 - FIM
    Property Obrigaorgao: TCmDbField read FObrigaorgao write SetObrigaorgao;
    Property Obrigaemissao: TCmDbField read FObrigaemissao write SetObrigaemissao;
    Property Nomedocumento: TCmDbField read FNomedocumento write SetNomedocumento;
    Property Mascara: TCmDbField read FMascara write SetMascara;
    Property Idregra: TCmDbField read FIdregra write SetIdregra;
    Property Iddocumento: TCmDbField read FIddocumento write SetIddocumento;
    Property Flgobrigavalidade: TCmDbField read FFlgobrigavalidade write SetFlgobrigavalidade;
    Property Fisicajuridica: TCmDbField read FFisicajuridica write SetFisicajuridica;
    Property Docchave: TCmDbField read FDocchave write SetDocchave;


    //Higor Nayde Nº SOL250389/17574 NºPPM992385
    Property OBRIGAPRMHAB: TCmDbField read FOBRIGAPRMHAB write SetOBRIGAPRMHAB;
    Property OBRIGACATG: TCmDbField read FOBRIGACATG write SetOBRIGACATG;
    //Higor Nayde Nº SOL250389/17574 NºPPM992385
    // Início - Michelle Mota - SIG 22093
    Property ExibeUF: TCmDbField read FExibeUF write SetExibeUF;
    Property ExibeOrgao: TCmDbField read FExibeOrgao write SetExibeOrgao;
    Property ExibeEmissao: TCmDbField read FExibeEmissao write SetExibeEmissao;
    Property ExibeValidade: TCmDbField read FExibeValidade write SetExibeValidade;
    Property ExibePrmHab: TCmDbField read FExibePrmHab write SetExibePrmHab;
    Property ExibeCATG: TCmDbField read FExibeCATG write SetExibeCATG;
    Property ExibePais: TCmDbField read FExibePais write SetExibePais;
    Property ObrigaPais: TCmDbField read FObrigaPais write SetObrigaPais;
    // Término - Michelle Mota - SIG 22093
    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;
    Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbTipoDocPessoa }

constructor TDbTipoDocPessoa.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TIPODOCPESSOA';

  fObrigauf          := CreateCmDbField('OBRIGAUF',ftString,False,False,False,True,'Obriga UF');
  fObrigaorgao       := CreateCmDbField('OBRIGAORGAO',ftString,False,False,False,True,'Obriga Órgão');
  fObrigaemissao     := CreateCmDbField('OBRIGAEMISSAO',ftString,False,False,False,True,'Obriga Emissão');
  fNomedocumento     := CreateCmDbField('NOMEDOCUMENTO',ftString,True,False,False,True,'Nome');
  fMascara           := CreateCmDbField('MASCARA',ftString,False,False,False,True,'Máscara');
  fIdregra           := CreateCmDbField('IDREGRA',ftfloat,False,False,False,True,'Regra');
  fIddocumento       := CreateCmDbField('IDDOCUMENTO',ftfloat,True,True,False,True,'Código');
  fFlgobrigavalidade := CreateCmDbField('FLGOBRIGAVALIDADE',ftString,False,False,False,True,'Obriga Validade');
  fFisicajuridica    := CreateCmDbField('FISICAJURIDICA',ftString,False,False,False,True,'Pessoa Física / Purídica');
  fDocchave          := CreateCmDbField( 'DOCCHAVE',ftString,False,False,False,True,'Chave');
  //Vinicius Maciel SOL138283 Kintana 840489
  FFlgmultiplamascara := CreateCmDbField('FLGMULTIPLAMASCARA',ftString,False,False,False,True,'Flag de Múltiplas Máscaras');
  //Vinicius Maciel SOL138283 Kintana 840489 - Fim
  //Higor Nayde Nº SOL250389/17574 NºPPM992385
  FOBRIGAPRMHAB := CreateCmDbField('OBRIGAPRMHAB',ftString,False,False,False,True,'Obriga data da primeira habilitação');
  FOBRIGACATG := CreateCmDbField('OBRIGACATG',ftString,False,False,False,True,'Obriga Categoria');
  //Higor Nayde Nº SOL250389/17574 NºPPM992385
  // Início - Michelle Mota - SIG 22093
  FExibeUF           := CreateCmDbField('ExibeUF',ftString,False,False,False,True,'Exibe UF');
  FExibeOrgao        := CreateCmDbField('ExibeOrgao',ftString,False,False,False,True,'Exibe Órgão');
  FExibeEmissao      := CreateCmDbField('ExibeEmissao',ftString,False,False,False,True,'Exibe Emissão');
  FExibeValidade     := CreateCmDbField('ExibeValidade',ftString,False,False,False,True,'Exibe Validade');
  FExibePrmHab       := CreateCmDbField('ExibePrmHab',ftString,False,False,False,True,'Exibe data da primeira habilitação');
  FExibeCATG         := CreateCmDbField('ExibeCATG',ftString,False,False,False,True,'Exibe Categoria');
  FExibePais         := CreateCmDbField('ExibePais',ftString,False,False,False,True,'Exibe País');
  FObrigaPais        := CreateCmDbField('ObrigaPais',ftString,False,False,False,True,'Obriga País');
  // Término - Michelle Mota - SIG 22093
end;
                                                                     
function TDbTipoDocPessoa.Insert: Boolean;
begin
  fIddocumento.AsFloat := GetSequence('TIPODOCPESSOA');
  Result := Inherited Insert;
end;

function TDbTipoDocPessoa.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbTipoDocPessoa.SetDocchave(const Value: TCmDbField);
begin
  FDocchave := Value;
end;

procedure TDbTipoDocPessoa.SetFisicajuridica(const Value: TCmDbField);
begin
  FFisicajuridica := Value;
end;

procedure TDbTipoDocPessoa.SetFlgobrigavalidade(const Value: TCmDbField);
begin
  FFlgobrigavalidade := Value;
end;

procedure TDbTipoDocPessoa.SetIddocumento(const Value: TCmDbField);
begin
  FIddocumento := Value;
end;

procedure TDbTipoDocPessoa.SetIdregra(const Value: TCmDbField);
begin
  FIdregra := Value;
end;

procedure TDbTipoDocPessoa.SetMascara(const Value: TCmDbField);
begin
  FMascara := Value;
end;

procedure TDbTipoDocPessoa.SetNomedocumento(const Value: TCmDbField);
begin
  FNomedocumento := Value;
end;

procedure TDbTipoDocPessoa.SetObrigaemissao(const Value: TCmDbField);
begin
  FObrigaemissao := Value;
end;

procedure TDbTipoDocPessoa.SetObrigaorgao(const Value: TCmDbField);
begin
  FObrigaorgao := Value;
end;

procedure TDbTipoDocPessoa.SetObrigauf(const Value: TCmDbField);
begin
  FObrigauf := Value;
end;

procedure TDbTipoDocPessoa.SetFlgmultiplamascara(const Value: TCmDbField);
begin
  FFlgmultiplamascara := Value;
end;

procedure TDbTipoDocPessoa.SetOBRIGACATG(const Value: TCmDbField);
begin
  FOBRIGACATG := Value;   //Higor Nayde Nº SOL250389/17574 NºPPM992385
end;

procedure TDbTipoDocPessoa.SetOBRIGAPRMHAB(const Value: TCmDbField);
begin
  FOBRIGAPRMHAB := Value; //Higor Nayde Nº SOL250389/17574 NºPPM992385
end;

// Início - Michelle Mota - SIG 22093
procedure TDbTipoDocPessoa.SetExibeUF(const Value: TCmDbField);
begin
  FExibeUF := Value;
end;

procedure TDbTipoDocPessoa.SetExibeOrgao(const Value: TCmDbField);
begin
  FExibeOrgao := Value;
end;

procedure TDbTipoDocPessoa.SetExibeEmissao(const Value: TCmDbField);
begin
  FExibeEmissao := Value;
end;

procedure TDbTipoDocPessoa.SetExibeValidade(const Value: TCmDbField);
begin
  FExibeValidade := Value;
end;

procedure TDbTipoDocPessoa.SetExibePrmHab(const Value: TCmDbField);
begin
  FExibePrmHab := Value;
end;

procedure TDbTipoDocPessoa.SetExibeCATG(const Value: TCmDbField);
begin
  FExibeCATG := Value;
end;

procedure TDbTipoDocPessoa.SetExibePais(const Value: TCmDbField);
begin
  FExibePais := Value;
end;

procedure TDbTipoDocPessoa.SetObrigaPais(const Value: TCmDbField);
begin
  FObrigaPais := Value;
end;
// Término - Michelle Mota - SIG 22093

end.

