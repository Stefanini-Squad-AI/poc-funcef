{-------------------------------------------------------------------------------
--------------------------------- ALTERAÇÕES -----------------------------------
--------------------------------------------------------------------------------

 N. SIG.............: 38475
 Data da Alteração..: 08/01/2021
 Responsável........: Everson Cunha
 Descrição..........: Melhorias/ajustes eSocial versão simplificada 1.0
                      Exclusão desta DB e sua tabela no banco de dados.
--------------------------------------------------------------------------------
 Nº SOL            : 250391.17474
 Nº PPM            : 959204
 Data da Alteração : 08/04/2016
 Alteração Form    : Mudança no leiaute e novos campos
 Responsável       : Michelle Suellyn Mota
 Descrição         : Alterações de leiaute e novos campos para atender o eSocial
	                   Criação desta DB para manipular os registros da tabela
                     catpessxoutros.
--------------------------------------------------------------------------------}

unit uDbCatPessXOutros;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

type
  TDbCatPessXOutros = class(TCmDbObject)
  private
  
 {idcatpessxoutros     NUMBER not null,
  idcatpess            NUMBER not null,
  codtabelaesocial     NUMBER not null,
  codigoesocial        NUMBER(9) not null,
  lateralcorpoatingida CHAR(1)}
    {Fidcatpess            : TCmDbField;
    Fidcatpessxoutros     : TCmDbField;
    Fcodtabelaesocial     : TCmDbField;
    Fcodigoesocial        : TCmDbField;
    Flateralcorpoatingida : TCmDbField;}

  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    {property idcatpess            : TCmDbField read Fidcatpess            write Fidcatpess;
    property idcatpessxoutros     : TCmDbField read Fidcatpessxoutros     write Fidcatpessxoutros;
    property codtabelaesocial     : TCmDbField read Fcodtabelaesocial     write Fcodtabelaesocial;
    property codigoesocial        : TCmDbField read Fcodigoesocial        write Fcodigoesocial;
    property lateralcorpoatingida : TCmDbField read Flateralcorpoatingida write Flateralcorpoatingida;}

  end;

implementation

{ TDbCatPessXOutros }

constructor TDbCatPessXOutros.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'CatPessXOutros';

  {Fidcatpessxoutros     := CreateCmDbField('idcatpessxoutros',ftFloat,true,true,false,true,'');
  Fidcatpess            := CreateCmDbField('idcatpess',ftFloat,false,false,false,true,'');
  Fcodtabelaesocial     := CreateCmDbField('codtabelaesocial',ftFloat,false,false,false,true,'');
  Fcodigoesocial        := CreateCmDbField('codigoesocial',ftFloat,false,false,false,true,'');
  Flateralcorpoatingida := CreateCmDbField('lateralcorpoatingida',ftString,false,false,false,true,'');}

end;

end.
