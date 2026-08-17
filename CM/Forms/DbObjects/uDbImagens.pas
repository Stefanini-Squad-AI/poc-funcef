{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 19/02/2002                             }
{                                                       }
{*******************************************************}
//***************************************************************************************
//Nº SOL............: 211502.16259
//Nº PPM............: 442499
//Data da Alteração.: 28/10/2014
//Alteração Form....: Inclusão de query para pegar qualquer imagem
//Responsável.......: William Santana
//Descrição.........: Desenvolvimento do produto referente ao SOL 211502.
//**************************************************************************************


unit uDbImagens;

interface

Uses uCmCustomCdbObject, SysUtils, uCmDbObject, DB;

Type
  TDbImagens = class(TCmDbObject)

  private
    FIdimagem: TCmDbField;
    FDescrimagem: TCmDbField;
    FImagem: TCmDbField;
    procedure SetDescrimagem(const Value: TCmDbField);
    procedure SetIdimagem(const Value: TCmDbField);
    procedure SetImagem(const Value: TCmDbField);

  public

     Property Imagem: TCmDbField read FImagem write SetImagem;
     Property Idimagem: TCmDbField read FIdimagem write SetIdimagem;
     Property Descrimagem: TCmDbField read FDescrimagem write SetDescrimagem;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;

     function GetSelectForPessoa(rIdpessoa: Double): String;
     function GetSelectForDocPessoa(rIdpessoa: Double): String;

     function GetSelectForImagem(rIdimagem: Double): String;
  End;

implementation

{ TDbImagens }

constructor TDbImagens.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'IMAGENS';

   fImagem := CreateCmDbField('IMAGEM',ftBlob,False,False,False,True,'Imagem');
   fIdimagem := CreateCmDbField('IDIMAGEM',ftfloat,True,True,False,True,'Identificador da Imagem');
   fDescrimagem := CreateCmDbField('DESCRIMAGEM',ftString,False,False,False,True,'Descrição da Imagem');
end;

function TDbImagens.GetSelectForDocPessoa(rIdpessoa: Double): String;
begin
   Result := ' SELECT ' +
             '   IMAGENS.IDIMAGEM, ' +
             '   IMAGENS.IMAGEM , ' +
             '   IMAGENS.DESCRIMAGEM ' +
             ' FROM ' +
             '   IMAGENS, ' +
             '   DOCPESSOA , ' +
             '   PESSOA ' +
             ' WHERE ' +
             '   ( PESSOA.IDPESSOA = ' + FloatToStr(rIdPessoa) + ' ) AND ' +
             '   ( DOCPESSOA.IDIMAGEM = IMAGENS.IDIMAGEM ) AND ' +
             '   ( DOCPESSOA.IDPESSOA = PESSOA.IDPESSOA ) '
end;

function TDbImagens.GetSelectForPessoa(rIdpessoa: Double): String;
begin
   Result := ' SELECT ' +
             '   IMAGENS.IDIMAGEM , ' +
             '   IMAGENS.IMAGEM , ' +
             '   IMAGENS.DESCRIMAGEM ' +
             ' FROM ' +
             '   IMAGENS, PESSOA ' +
             ' WHERE ' +
             ' (PESSOA.IDPESSOA = ' + FloatToStr(rIdPessoa) + ') AND ' +
             '( IMAGENS.IDIMAGEM = PESSOA.IDIMAGEM ) '
end;

//Início - William Santana - SOL 211502.16259 PPM 442499
function TDbImagens.GetSelectForImagem(rIdimagem: Double): String;
begin
   Result := ' SELECT ' +
             '   IMAGENS.IDIMAGEM , ' +
             '   IMAGENS.IMAGEM , ' +
             '   IMAGENS.DESCRIMAGEM ' +
             ' FROM ' +
             '   IMAGENS  ' +
             ' WHERE ' +
             '( IMAGENS.IDIMAGEM = ' + FloatToStr(rIdImagem) + ') '
end;
//Término - William Santana - SOL 211502.16259 PPM 442499

function TDbImagens.Insert: Boolean;
begin
   fIdimagem.AsFloat := GetSequence('IMAGENS');
   Result := Inherited Insert;
end;

function TDbImagens.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbImagens.SetDescrimagem(const Value: TCmDbField);
begin
  FDescrimagem := Value;
end;

procedure TDbImagens.SetIdimagem(const Value: TCmDbField);
begin
  FIdimagem := Value;
end;

procedure TDbImagens.SetImagem(const Value: TCmDbField);
begin
  FImagem := Value;
end;

end.



